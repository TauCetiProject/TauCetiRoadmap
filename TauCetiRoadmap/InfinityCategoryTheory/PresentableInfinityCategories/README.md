# Roadmap: presentable ∞-categories

**Summary.** A presentable ∞-category is an accessible ∞-category with all small colimits. This Part develops
their theory and the constructions that presentability makes possible.

It builds on the accessible ∞-categories, presheaves, adjunctions, Kan extensions and straightening of the
earlier Parts.

- **The presentation theorem (Layer 1).** Presentable and compactly generated ∞-categories (defined in §1.1),
  and the local objects and local equivalences of a class of morphisms (defined in §1.2).
- **The adjoint functor theorem (Layer 2).** Representability of limit-preserving presheaves, and the adjoint
  functor theorem.
- **Constructions (Layer 3).** Constructions that preserve presentability.
- **Localization (Layer 4).** Localization at a small set of morphisms, its universal property, and the pullback
  criterion for left exactness of a localization.
- **`Pr^L` and `Pr^R` (Layer 5).** The ∞-categories of presentable ∞-categories with left or right adjoint
  functors, and compactly assembled ∞-categories.
- **Truncation (Layer 6).** Truncation functors, Postnikov towers, and the left exactness of filtered colimits
  in `Cat∞`.
- **`P_Σ` (Layer 7).** The free completion under sifted colimits, projectively generated ∞-categories, and
  geometric realizations and totalizations in n-categories.
- **Model-categorical presentations (Layers 8–9).** Presentations by combinatorial simplicial model categories,
  Quillen's model structure on product-preserving functors, and Bergner's comparison.

**Headline theorems.**
- The presentation theorem: presentable ∞-categories are the accessible reflective localizations of presheaf
  ∞-categories, and the `Ind_κ` of small ∞-categories with κ-small colimits (HTT, Thm. 5.5.1.1).
- Representability of limit-preserving presheaves, and the adjoint functor theorem (HTT, Prop. 5.5.2.2,
  Cor. 5.5.2.9).
- Localization at a small set of morphisms exists and has its universal property (HTT, Prop. 5.5.4.15,
  Prop. 5.5.4.20); the pullback criterion for left exactness of a localization (HTT, Prop. 6.2.1.1).
- `Pr^L` and `Pr^R` are anti-equivalent, and both, and `Pr^R_κ`, have small limits (HTT, Cor. 5.5.3.4,
  Prop. 5.5.3.13, Thm. 5.5.3.18, Prop. 5.5.7.6); `Pr^L_κ` is presentable (HA, Lemma 5.3.2.9).
- Compactly assembled ∞-categories, the retracts of `Ind(C₀)` along filtered-colimit-preserving functors, are
  exactly the accessible ∞-categories with small filtered colimits whose colimit functor `Ind(C) → C` has a left
  adjoint (SAG, Thm. 21.1.2.10).
- The truncation functors of a presentable ∞-category exist and are compatible with left exact left adjoints
  (HTT, Prop. 5.5.6.18, Prop. 5.5.6.28); the limit criterion for convergence of Postnikov towers (HTT,
  Prop. 5.5.6.26); filtered colimits in `Cat∞` are left exact (SAG, Lemma 4.5.3.1).
- The six properties of the ∞-category `P_Σ(C)` of product-preserving presheaves, its universal property among
  functors preserving filtered colimits and geometric realizations, and the recognition of projectively
  generated ∞-categories (HTT, Prop. 5.5.8.10, Prop. 5.5.8.15, Prop. 5.5.8.25).
- Presentable ∞-categories are exactly the underlying ∞-categories of combinatorial simplicial model categories
  (HTT, Prop. A.3.7.6).
- Geometric realizations in n-categories are finite colimits (HA, Lemma 1.3.3.10).
- Existence of Quillen's model structure on product-preserving functors, and full faithfulness of its derived
  inclusion (HTT, Prop. 5.5.9.1, Prop. 5.5.9.2).
- Bergner's comparison of strictly product-preserving simplicial functors with `P_Σ` (HTT, Cor. 5.5.9.3).

## Scope and ownership

Boundaries:

- Accessible ∞-categories are Part AccessibleInfinityCategories's (§4.1; HTT, Def. 5.4.2.1); κ-compact objects, `Ind_κ`, filtered and sifted simplicial sets are Part PresheavesAndCompletions' (§6.1, §4.1, §5.1; HTT, Def. 5.3.4.5, Def. 5.3.5.1, Def. 5.3.1.7, Def. 5.5.8.1); truncated objects and n-categories are Part InfinityCategoryFoundations' (§10.1; HTT, Def. 5.5.6.1, Def. 2.3.4.1). This Part uses them unchanged.
- Part InfinityCategoryFoundations owns minimal models and the truncation of n-categories (Part InfinityCategoryFoundations §10.3–10.6), the definitions of truncated morphisms and monomorphisms with their elementary properties (Part InfinityCategoryFoundations §10.7; HTT, Def. 5.5.6.8, Ex. 5.5.6.13, Lemma 5.5.6.14), and the boundary-sphere criterion for truncated Kan complexes (Part InfinityCategoryFoundations §10.8; HTT, Lemma 5.5.6.17).
- Part LimitsAndKanExtensions owns colimits in functor ∞-categories and in spaces, Kan extensions, geometric realizations and the cofinality of injective maps into `Δ≤n` (§9.4, §9.6; HA, Lemma 1.2.4.17). Part AdjunctionsAndLocalizations owns adjunctions and localization functors. Part CartesianFibrations and Part Straightening own (co)Cartesian fibrations, their model structures and their classification.
- Part PresheavesAndCompletions owns presheaf ∞-categories, Yoneda, idempotent completion, κ-filtered colimits, the universal property of `Ind_κ`, colimits in two variables (§5.2; HTT, Lemma 5.5.2.3), sifted simplicial sets and their interaction with finite products (§5.3), and free resolutions of presheaves by simplicial objects (§5.5; HTT, Lemma 5.5.8.13). Part AccessibleInfinityCategories owns accessible ∞-categories, accessible functors, κ-compact objects, `Ind_κ` and the ∞-categories `Cat∞(𝒦)` of ∞-categories with prescribed colimits (HA, Def. 4.8.1.1).
- Presentable 1-categories are Mathlib's, with the presentable categories of HTT App. A.1 in ModelCategoryTheory, Part ModelCategories; this Part uses them only in comparison Checks. ModelCategoryTheory owns model categories, the Kan–Quillen, projective, injective and Reedy model structures, transfer, simplicial model categories, left Bousfield localization (ModelCategoryTheory, Part EnrichedLocalization §3.2 (HTT, Prop. A.3.7.3)) and Dugger's presentation theorem.
- Bergner's comparison (Layer 9) is stated for ordinary categories with finite products. HTT states Lemmas 5.5.9.6, 5.5.9.8 and 5.5.9.9 for simplicial categories, and the simplicial-category case of the comparison (HTT, Rem. 5.5.9.10, p. 538) is outside this Part.
- Nothing here uses ∞-operads: the tensor product of presentable ∞-categories, and the second assertion of HA Lemma 4.8.4.2 about it, are outside this family.
- This Part makes no statement about ∞-topoi. Truncation in an ∞-topos, homotopy sheaves, n-topoi and the left exactness of filtered colimits in an ∞-topos are outside it; the presheaf case of HTT Ex. 7.3.4.7 is the only case stated here. The identification of the essential image of `Cat∞` in simplicial spaces with the complete Segal spaces (HA, Rem. A.7.11) is recorded in §6.7 and not used.

## Conventions

Locators such as (HTT, Prop. 5.2.7.8, p. 385) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.1.2` here and `Part PresentableInfinityCategories §2.1.2`
elsewhere, is one target.

**∞-categories.** An ∞-category is a quasicategory: a simplicial set C with Mathlib's `SSet.Quasicategory` instance. A Kan complex is a simplicial set with Mathlib's `SSet.KanComplex`. Functor ∞-categories `Fun(K, C)` are internal homs of simplicial sets. Equivalences, colimit diagrams, full subcategories and mapping spaces `Map_C(X, Y)` are those of Part InfinityCategoryFoundations (§1.2, §2.1), and adjunctions those of Part AdjunctionsAndLocalizations §1.1. An adjunction `F ⊣ G` always has F as the left adjoint.

- The nerve of a category is an ∞-category, while `Λ[2, 1]` is not: the inner horn has no filler.
- For the free-forgetful pair between sets and abelian groups, the free functor is the left adjoint; the forgetful functor does not preserve the empty coproduct, so the reversed convention fails here.

**Universes and size.** Small means u-small for a fixed universe u. Presentable ∞-categories are large: they live in `SSet.{u+1}` and are locally small in Tau Ceti's sense, `SSet.IsLocallySmall` (every mapping space has a u-small Kan model). Small colimits are colimits indexed by u-small simplicial sets. `Cat∞` is the ∞-category of small ∞-categories, Tau Ceti's `SSet.catInfty`, and `Ĉat∞` the ∞-category of large ones, `SSet.catInfty` one universe up (HTT, Def. 3.0.0.1, p. 162); limits of towers of large ∞-categories are taken in `Ĉat∞`. The comparison of homotopy colimits with ∞-categorical colimits (Part LimitsAndKanExtensions §3.2; HTT, Thm. 4.2.4.1) is proved for small simplicial categories; where this Part applies it to a large one, such as `Kan`, `A°` or `(Set⁺_Δ)°`, it is applied object by object, through small full subcategories, as in Part LimitsAndKanExtensions §3.3 (*Size*).

- The ∞-category S of small spaces is presentable (§1.6) and locally small but not small; a definition requiring a small simplex set would exclude it.
- Δ[0] is presentable, and every object of it is (−2)-truncated; the empty ∞-category is not presentable, since the empty diagram has no colimit in it.
- The nerve of the category of sets is presentable, and its ℵ₀-compact objects are the finite sets, in agreement with the 1-categorical notion. Compactness: Part PresheavesAndCompletions §6.4, its last statement, (3), for κ = ℵ₀, whose hypothesis holds since `Type u` has all small colimits (Mathlib's instance `HasCardinalFilteredColimits` for categories with colimits), together with Mathlib `CategoryTheory.Types.isCardinalPresentable_iff` (`IsCardinalPresentable X ℵ₀ ↔ HasCardinalLT X ℵ₀`, that is, X finite). Presentability: the nerve has small colimits, the 1-categorical ones (Part LimitsAndKanExtensions §1.4, second statement, through its universe bullet), and it is accessible because the category of sets is locally presentable (Part AccessibleInfinityCategories, Layer 5, first Example).
- For C the nerve of finite sets, a small ∞-category, `P_Σ(C)` is S, which is large: `P_Σ` raises the universe level by one, like `P`.
- `Kan` is a large simplicial category, but for a small diagram of Kan complexes and one further Kan complex Y the full simplicial subcategory on them is small, and the colimit condition at Y involves only its mapping spaces; a reading of HTT Thm. 4.2.4.1 that required `Kan` itself to be small would not apply to S at all.

**Cardinals.** κ, τ denote regular cardinals in Mathlib's sense, `Cardinal.IsRegular`. "Compact" means ℵ₀-compact. For regular κ and τ, τ ≫ κ means that τ₀^κ₀ < τ for all cardinals τ₀ < τ and κ₀ < κ (ModelCategoryTheory, Part ModelCategories §5.2 (HTT, Def. A.2.6.3, p. 837; restated before Lemma 5.4.2.8, p. 443)).

- ℵ₁ ≫ ℵ₀ holds: every τ₀ < ℵ₁ is countable and every κ₀ < ℵ₀ is finite, so τ₀^κ₀ is countable. ℵ₁ ≫ ℵ₁ fails: τ₀ = κ₀ = ℵ₀ gives τ₀^κ₀ = 2^ℵ₀ ≥ ℵ₁. Reading ≫ as ≥ would miss this.
- ℵ₀ ≫ ℵ₀ holds, since finite powers of finite cardinals are finite; a definition requiring κ < τ would exclude it.
- A κ-filtered diagram for κ = ℵ₀ is a filtered diagram. Requiring κ uncountable throughout would exclude compactly generated ∞-categories (§5.3).

**Presheaves, truncation and towers.** `P(C) = Fun(C^op, S)`, with Yoneda embedding `j : C → P(C)`. An object C is k-truncated (k ≥ −2) when `Map_C(E, C)` is a k-truncated Kan complex for every object E (Part InfinityCategoryFoundations §10.1, HTT Def. 5.5.6.1). Truncation indices run from −2, and a tower is indexed so that its n-th stage is n-truncated.

- For C = Δ[0], `P(C)` is S and j picks the point. A covariant convention would make j land in `Fun(C, S)` and reverse the variance of representables.
- In S, the (−2)-truncated objects are the contractible spaces and the (−1)-truncated objects are the empty and contractible spaces. A convention starting at k = 0 would lose the subterminal objects, which the Checks and Examples of Layer 4 and the monomorphisms of Layer 6 use.
- In S, the 0-th stage of the Postnikov tower of S¹ is the point, `τ_{≤0}S¹`, and its first stage is S¹ itself; an indexing shifted by one would make the 0-th stage S¹ (§6.3, Checks).

**Weak equivalences.** Layers 8 and 9 use the model structures of ModelCategoryTheory, whose weak equivalences of simplicial sets are Tau Ceti's weak homotopy equivalences, as fixed in ModelCategoryTheory, Part KanQuillen §3.1; "objectwise weak equivalence" means objectwise in that sense.

- The inclusion `{0} ⊆ Δ[1]` is a weak homotopy equivalence; `∂Δ[1] → Δ[0]` is not, since it is not bijective on `π₀`.
- A map of Kan complexes is a weak homotopy equivalence exactly when it is a homotopy equivalence, so on fibrant objects the convention agrees with the mapping spaces of Part InfinityCategoryFoundations §2.1.

## Exact supplier contracts

### From Mathlib

- `SSet.Quasicategory` (`Mathlib/AlgebraicTopology/Quasicategory/Basic.lean`) and `SSet.KanComplex` (`Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean`): ∞-categories and Kan complexes; the instance `Quasicategory ((ihom K).obj C)` (`Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/PushoutProduct.lean`) makes functor ∞-categories ∞-categories.
- `CategoryTheory.nerve` (`Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean`) and `CategoryTheory.SimplicialNerve` (`Mathlib/AlgebraicTopology/SimplicialNerve.lean`): nerves of categories and the homotopy coherent nerve, used for `N(A°)` in Layers 8 and 9.
- `SSet.QCat.bicategory` (`Mathlib/AlgebraicTopology/Quasicategory/StrictBicategory.lean`), `CategoryTheory.Bicategory.Adjunction` and `CategoryTheory.Bicategory.Adjunction.comp` (`Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean`): the carrier of adjunctions between ∞-categories of Part AdjunctionsAndLocalizations §1.1, and their composition (HTT, Prop. 5.2.2.6).
- `HomotopicalAlgebra.ModelCategory` (`Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`): model categories, used in Layers 8 and 9 and wherever a statement passes through simplicial categories.
- `Cardinal.IsRegular` (`Mathlib/SetTheory/Cardinal/Regular.lean`): regular cardinals.
- `Cardinal.SharplyLT.exists_isCardinalFiltered_set` (`Mathlib/CategoryTheory/Presentable/SharplyLT/Basic.lean`): for κ sharply smaller than τ, every τ-small subset of a κ-filtered poset lies in a κ-filtered τ-small subset (HTT, Lemma 5.4.2.8, the case κ < τ).
- `CategoryTheory.IsCardinalLocallyPresentable`, `CategoryTheory.IsCardinalPresentable` (`Mathlib/CategoryTheory/Presentable/`): the 1-categorical notions, used only for comparison Checks.

Nothing else is assumed of these declarations; in particular no comparison between the ∞-categorical and the 1-categorical notions is taken from Mathlib.

### From Tau Ceti

- `SSet.CartesianFibration` and `SSet.Edge.IsCartesian` (`TauCeti/AlgebraicTopology/Quasicategory/Cartesian.lean`): Cartesian edges and Cartesian fibrations; coCartesian fibrations are those of the opposite map, as in Part CartesianFibrations.
- `SSet.IsLocallySmall` (`TauCeti/AlgebraicTopology/Quasicategory/LocallySmall.lean`): local smallness, as in the Conventions.
- `SSet.IsCardinalFiltered` (`TauCeti/AlgebraicTopology/SimplicialSet/CardinalFiltered.lean`): κ-filtered simplicial sets.
- `SSet.slice.IsLimit` and `SSet.coslice.IsColimit` (`TauCeti/AlgebraicTopology/Quasicategory/Limit.lean`): limit cones and colimit cocones in a quasicategory.
- `SSet.fullEnhancedSubcategory` (`TauCeti/AlgebraicTopology/Quasicategory/FullSubcategory.lean`): full subcategories, used for `Fun_R(C, D)` in §4.7.
- `SSet.catInfty` (`TauCeti/AlgebraicTopology/Quasicategory/CatInfty.lean`): `Cat∞` (HTT, Def. 3.0.0.1), and `Ĉat∞` one universe up.

### From TauCetiRoadmap.InfinityCategoryTheory

The earlier Parts of this family, cited in `*Needs:*` lines by folder name and section. The basic definitions, stated at the start of the layer of their first use in the earlier Parts and in this one (§1.1.1, §1.2.1), are used throughout and are cited where a statement depends on a particular one: ∞-categories, colimit and limit diagrams, joins, slices and mapping spaces, full subcategories, fully faithful functors and adjunctions, (co)Cartesian fibrations, `Cat∞`, cofinality, Kan extensions, presheaf ∞-categories and Yoneda, κ-filtered and κ-compact objects, accessible and presentable ∞-categories, `Ind_κ`, localization functors, local objects, truncated objects, n-categories, compactly generated and sifted. The sections consumed, by Part:

- **InfinityCategoryFoundations:** §2.1 (rigidification, mapping objects), §1.2 (limits and colimits), §1.1 (size), §7.1 (`Ŝ`), §10.1 (n-categories, truncated objects), §4.1–4.3 (joins and slices), §5.1 (Kan complexes and cores), §5.2–5.3 (mapping spaces, left fibrations over Kan complexes), §6.3 (the covariant model structure), §8.1 (mapping spaces of the homotopy coherent nerve), §8.3 (colimits in overcategories), §9.4–9.5 (categorical fibrations and the Joyal model structure), §10.4 (minimal models), §10.6 (n-categories), §10.7 (truncated morphisms and monomorphisms), §10.8 (the boundary-sphere criterion).
- **CartesianFibrations:** §1.5 and §1.7 (coCartesian edges, mapping-space criteria), §3.3–3.4 (categorical fibrations over an ∞-category, homotopies), §4.1 and §4.4 (correspondences, arrow ∞-categories), §5.2 and §5.4–5.5 (marked anodyne maps and their generators, pushout-products, marked mapping objects), §5.7–5.8 (the Cartesian model structure, its fibrant objects and enrichment), §7.2 (base change along a (co)Cartesian fibration).
- **LimitsAndKanExtensions:** §2.1, §7.1, §8.1 (cofinality, Kan extensions, presheaves), §1.1–1.3 (fat joins and fat slices), §3.1–3.5 (combinatorial simplicial model categories, homotopy colimits, `N(A°)`, representable presheaves, tensors), §3.8 (`Cat∞ ≅ N((Set⁺_Δ)°)`), §5.5 (semisimplicial indexing), §6.1–6.3 and §6.5 (decompositions of diagrams, reduction to pushouts and coproducts), §7.3–7.6 (relative colimits and Kan extensions), §8.2–8.3 (colimits in functor ∞-categories and in spaces), §9.4 and §9.6 (geometric realizations, cofinality in `Δ≤n`).
- **AdjunctionsAndLocalizations:** §1.1, §2.1 (adjunctions, localizations), §1.3 and §1.5–1.8 (units, preservation of (co)limits, existence of adjoints, adjunctions from simplicial Quillen adjunctions, Kan extensions as adjoints), §2.2–2.4 (reflective subcategories, localization functors, inverting a class), §2.6 (underlying ∞-categories of model categories).
- **Straightening:** §1.7 (the straightening theorem, HTT Thm. 3.2.0.1), §2.2 (invariance of Cartesian fibrations under change of base), §3.2 (limits in `Cat∞` as Cartesian sections).
- **PresheavesAndCompletions:** §1.1, §4.1, §5.1, §6.1 (Yoneda, filtered and sifted simplicial sets, compact objects, `Ind`), §1.2–1.7 (models for presheaves, Yoneda, the free cocompletion, adjunctions between presheaf ∞-categories, completely compact objects, the recognition of presheaf ∞-categories), §2.2–2.4 (idempotents and retracts), §3.1, §4.3–4.4 (filtered ∞-categories, filtered posets), §5.2–5.3 and §5.5 (colimits in two variables, sifted simplicial sets, free resolutions of presheaves), §6.2–6.6 (filtered colimits in spaces, κ-compact objects, `Ind_κ` and its universal property, filtered colimits of ∞-categories).
- **AccessibleInfinityCategories:** §4.1 (accessible ∞-categories), §1.2, §2.2–2.3, §3.1, §4.3–4.4, §4.6, §5.1–5.2, §5.4, §6.2–6.3, §6.5, §7.1–7.3 (accessibility of presheaves, `Ind_κ`, functor ∞-categories, products, slices, fiber products and accessible subcategories), §8.4–8.6 and §8.9 (`Cat∞(𝒦)`, `Acc`, limits of accessible ∞-categories, accessible fibrations).

### From TauCetiRoadmap.ModelCategoryTheory

Cited where used, by Part and section:

- **ModelCategories:** §1.4 (the small object argument), §3.4 (proper model categories), §4.1–4.2 (Quillen adjunctions and equivalences), §5.2 (sharply larger cardinals), §6.1 (combinatorial model categories), §6.4 (transferred model structures), §7.1–7.2 (projective model structures), §7.4–7.5 (Reedy categories, latching and matching objects), §8.2 (tensors and cotensors).
- **KanQuillen:** §1.1–1.2 (homotopy groups, the long exact sequence), §2.2 (`Ex^∞`), §3.1–3.3 (weak homotopy equivalences, the Kan–Quillen model structure, filtered colimits), §3.5 (simplexwise weakly contractible maps), §5.1 (truncated Kan complexes).
- **SimplicialCategories:** §1.2 (monoidal model categories and the product of simplicial sets), §1.3 (simplicial model categories), §2.6 (the injective model structure), §4.3–4.5 (coends against Reedy cofibrant objects, geometric realizations and diagonals of bisimplicial sets), §6.1 (projective and injective structures on `A^C`).
- **EnrichedLocalization:** §3.1–3.2 (local objects and the localized model structure, HTT Prop. A.3.7.3), §3.4 (Dugger's presentation theorem).

Homotopy pullbacks and pushouts (Part ModelCategories), the Kan–Quillen model structure, homotopy groups and the long exact sequence (Part KanQuillen), and the projective model structure on diagrams with its homotopy colimits (Part SimplicialCategories) are used throughout in their standard sense.

## How to read the build

Layer 1 defines presentable ∞-categories and local objects, proves the presentation theorem and defines dense functors; Layer 2 derives representability, limits and the adjoint functor theorem; Layer 3 gives the constructions that preserve presentability. Layer 4 localizes at a small set of morphisms, the main construction tool, characterizes the left exact localizations by pullbacks, and adjoins colimits subject to relations. Layer 5 studies `Pr^L`, `Pr^R`, `Pr^L_κ` and `Pr^R_κ` and their limits, and characterizes the compactly assembled ∞-categories, the retracts in `Ĉat∞^ω` of `Ind(C₀)` for small C₀. Layer 6 uses localization to construct the truncation functors, assembles them into Postnikov towers, and studies Postnikov completeness and left exact filtered colimits, ending with the left exactness of filtered colimits in `Cat∞`. Layer 7 builds `P_Σ(C)` as a localization of `P(C)`, proves its universal property, recognizes projectively generated ∞-categories, computes the truncations of `P_Σ(C)` objectwise with Layer 6, and builds finite colimits from coproducts and geometric realizations, computing geometric realizations and totalizations in n-categories as finite colimits and limits. Layer 8 compares presentable ∞-categories with combinatorial simplicial model categories, and Layer 9 strictifies: Quillen's model structure on product-preserving simplicial functors presents `P_Σ` (Bergner's comparison).

Layer 1 opens with the definitions this Part owns: presentable and compactly generated ∞-categories (§1.1), used from §1.4 on, and local objects and local equivalences (§1.2).

## Layer 1: Presentable ∞-categories, local objects and the presentation theorem

### 1.1 Presentable and compactly generated ∞-categories

**1.1.1.** Define an ∞-category to be presentable when it is accessible and has small colimits (HTT, Def. 5.5.0.1,
p. 474), and κ-compactly generated when it is presentable and κ-accessible, compactly generated when κ = ω
(HTT, Def. 5.5.7.1, p. 519).

**Checks.**
- Δ[0] and Δ[1] are presentable and compactly generated. ∅ is not presentable (the empty diagram has no
  colimit), and neither is Δ[0] ⊔ Δ[0] (its two objects have no coproduct).
- The nerve of the opposite of the category of sets has small colimits and is locally small but is not
  accessible, so it is not presentable: cocompleteness alone does not suffice. In a nerve the mapping spaces
  are discrete, so κ-filtered colimits may be indexed by κ-directed posets (Part PresheavesAndCompletions §4.4, HTT Prop. 5.3.1.18),
  are the 1-categorical κ-directed colimits, and have the same κ-compact objects; so the nerve is accessible exactly when the category is (Part AccessibleInfinityCategories, Layer 5, first Example). The opposite of the category
  of sets is not locally presentable (Adámek–Rosický, Thm. 1.64, applied to sets: a category that is locally
  presentable together with its opposite is equivalent to a complete lattice), and a cocomplete accessible category is
  locally presentable (Adámek–Rosický, Cor. 2.47), so it is not accessible.
- The nerve of the poset ℕ ∪ {∞} is presentable and compactly generated, with compact objects the finite
  ones (Part PresheavesAndCompletions §6.1), while ℕ alone has no colimit of the identity diagram and is not presentable.
- The nerve of the real interval [0, 1] is presentable but not compactly generated. Every ℵ₁-directed subset
  contains its supremum, so every element is ℵ₁-compact and the interval is ℵ₁-accessible. Its only compact
  element is 0, while in `Ind(C₀)` every object is a filtered colimit of compact ones (Part
  PresheavesAndCompletions §6.4).

*Needs:* Part AccessibleInfinityCategories §4.1.1; Part InfinityCategoryFoundations §1.2.4.

### 1.2 Local objects and local equivalences

**1.2.1.** Define, for a class S of morphisms of an ∞-category C, an object Z to be *S-local* when composition with every
`s : X → Y` in S induces an isomorphism `Map_C(Y, Z) → Map_C(X, Z)` in the homotopy category of spaces, and a
morphism f to be an *S-equivalence* when composition with f induces such an isomorphism for every S-local Z
(HTT, Def. 5.5.4.1, p. 491). The class is written S, as in HTT and throughout this Part; the ∞-category of spaces,
also written S, is named in full where both occur.

**Checks.**
- For S = ∅ every object is S-local, and the S-equivalences are exactly the equivalences, by Yoneda in hC.
- In Δ[1] with S = {0 → 1}, the only S-local object is 1, since `Map(1, 0)` is empty and `Map(0, 0)` is not; so
  0 → 1 is an S-equivalence that is not an equivalence.
- In the ∞-category of spaces, with S the fold map `∂Δ[1] → Δ[0]`, Z is S-local exactly when the diagonal
  `Z → Z × Z` is an equivalence, that is, when Z is empty or contractible. Testing only a bijection on path
  components would also accept the circle, whose diagonal is a bijection on `π₀` but not an equivalence.

*Needs:* Part InfinityCategoryFoundations §2.1.6, §2.1.7 (mapping objects and composition in hC).

### 1.3 Small κ-filtered subdiagrams with the same colimits

**1.3.1.** Prove the following. Let τ ≫ κ be regular cardinals with τ uncountable, A a κ-filtered partially ordered set, `A₀ ⊆ A` τ-small, and `{f_γ : X_γ → Y_γ}` a τ-small family of natural transformations between functors from A to the category of Kan complexes, with every `X_γ(α)` and `Y_γ(α)` essentially τ-small. If every induced map of colimits over A is a homotopy equivalence, there is a τ-small κ-filtered `A₀' ⊆ A` containing `A₀` such that every induced map of colimits over `A₀'` is a homotopy equivalence (HTT, Lemma 5.5.4.3, p. 492). Lurie's route: make each `f_γ` a projective fibration; a lifting problem against `∂Δ[n] ⊆ Δ[n]` at a stage α is solved at a later stage, and closing `A₀` countably often under τ-small sets of such witnesses gives `A₀'`, with τ ≫ κ bounding the sizes.

*Needs:* Mathlib `Cardinal.SharplyLT.exists_isCardinalFiltered_set` (HTT, Lemma 5.4.2.8, the case κ < τ, as Part AccessibleInfinityCategories §5.2.1 explains) and, for κ = τ, Part AccessibleInfinityCategories §5.2.1 (HTT, Lemma 5.4.2.8); ModelCategoryTheory, Part ModelCategories §7.2.1 (HTT, Prop. A.2.8.2, projective structure).

**1.3.2.** Prove the ∞-categorical form: with the same cardinals, A and `A₀`, and a τ-small family of morphisms in `Fun(N(A), S)` between functors with essentially τ-small values whose colimits over `N(A)` are equivalences, some τ-small κ-filtered `A₀' ⊇ A₀` has the same property (HTT, Lemma 5.5.4.4, p. 493). The route straightens the diagrams into strict functors to Kan complexes (HTT, Prop. 4.2.4.4), where colimits over `N(A)` are computed by ordinary filtered colimits (HTT, Thm. 4.2.4.1, applied to the large `Kan` object by object, through small full subcategories, as in Part LimitsAndKanExtensions §3.3 (*Size*)), and applies §1.3.1.

*Needs:* §1.3.1; Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4), §3.2.1 (HTT, Thm. 4.2.4.1) and §3.3.1 (*Size*).

**1.3.3.** Prove that for C with small filtered colimits, κ uncountable regular, κ-filtered partially ordered sets `A₀`, `A₁` and diagrams `p₀ : N(A₀) → C^κ`, `p₁ : N(A₁) → C^κ` with equivalent colimits, any κ-small subsets enlarge to κ-small filtered subsets `B₀ ⊆ A₀`, `B₁ ⊆ A₁` over which the restricted colimits are again equivalent, compatibly with the given equivalence (HTT, Lemma 5.5.4.13, p. 496). The route is Lurie's back-and-forth: alternately enlarge the two subsets so that each structure map factors through the other, using that the objects are κ-compact (HTT, Cor. 5.3.4.14) and that filtered colimits in S commute with finite limits (HTT, Prop. 5.3.3.3), and take the union of the resulting chain.

*Needs:* Part InfinityCategoryFoundations §4.2.1 (HTT, Prop. 2.1.2.1); Part LimitsAndKanExtensions §8.3.1 (HTT, Prop. 3.3.4.5); Part PresheavesAndCompletions §6.2.2 (HTT, Prop. 5.3.3.3); Part AccessibleInfinityCategories §2.2.1 (HTT, Cor. 5.3.4.14).

### 1.4 Compact objects under adjoints and localizations

**1.4.1.** Prove that if `f : C → D` between small ∞-categories exhibits D as an idempotent completion of C, then `Ind_κ(f)` is an equivalence for every regular κ (HTT, Lemma 5.5.1.3, p. 477). `Ind_κ(f)` is fully faithful because f is (HTT, Prop. 5.3.5.11), and it is essentially surjective because every object of D is a retract of one of C, and `Ind_κ(C)` is idempotent complete and contains the retracts of objects of C as κ-compact objects (HTT, Prop. 5.3.5.5, Prop. 5.3.5.10).

*Needs:* Part PresheavesAndCompletions §3.1.1 (HTT, Def. 5.1.4.1), §4.3.1 (HTT, Rem. 5.3.1.10), §6.4.3 (HTT, Prop. 5.3.5.5), §6.5.3 (HTT, Prop. 5.3.5.10) and §6.5.4 (HTT, Prop. 5.3.5.11).

**1.4.2.** Prove that for an adjunction `F ⊣ G` between ∞-categories C and D with small κ-filtered colimits: if G preserves κ-filtered colimits then F preserves κ-compact objects (HTT, Lemma 5.5.1.4, p. 477; Prop. 5.5.7.2, first assertion, p. 519); conversely, if C is κ-accessible and F preserves κ-compact objects, then G preserves κ-filtered colimits (HTT, Prop. 5.5.7.2, p. 519). For κ-compact X, `Map_D(FX, −) ≃ Map_C(X, G−)` (HTT, Prop. 5.2.2.8) is a composite of functors preserving κ-filtered colimits. For the converse, `C ≃ Ind_κ(C^κ)` is stable under κ-filtered colimits in presheaves (HTT, Cor. 5.3.5.4); evaluation at a κ-compact C is corepresented by C (HTT, Prop. 5.1.3.1), so evaluation of `G(−)` at C is corepresented by the κ-compact F(C) and preserves κ-filtered colimits (HTT, Prop. 5.1.2.2).

*Needs:* Part AdjunctionsAndLocalizations §1.3.2 (HTT, Prop. 5.2.2.8); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1) and §6.4.2 (HTT, Cor. 5.3.5.4).

**1.4.3.** Prove that for a localization L of a κ-compactly generated C, L is κ-continuous exactly when LC is stable under κ-filtered colimits in C, and then L preserves κ-compact objects, LC is κ-compactly generated, and the κ-compact objects of LC are the retracts of the LC with C κ-compact (HTT, Cor. 5.5.7.3, p. 519). The reflection `C → LC` preserves colimits (HTT, Prop. 5.2.3.5); apply §1.4.2 to it and its inclusion, and write each object of LC as L of a κ-filtered colimit of κ-compact objects. LC has small colimits (HTT, Rem. 5.2.7.5) and is generated under κ-filtered colimits by the essentially small set of the LC with C κ-compact, so it is κ-accessible (HTT, Prop. 5.4.2.2).

*Needs:* §1.4.2; Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5) and §2.3.1 (HTT, Rem. 5.2.7.5); Part AccessibleInfinityCategories §5.1.1 (HTT, Prop. 5.4.2.2).

### 1.5 Accessible localization functors

A localization functor `L : C → C` is that of Part AdjunctionsAndLocalizations §2.3 (HTT, Prop. 5.2.7.4): L corestricted to its essential image LC is left adjoint to the inclusion. S denotes the class of morphisms f of C with `Lf` an equivalence.

**1.5.1.** Prove that, for a localization functor `L : C → C` (Part AdjunctionsAndLocalizations §2.3, HTT, Prop. 5.2.7.4) and S the class of morphisms f of C with `Lf` an equivalence, an object of C is S-local exactly when it lies in LC, and that every S-equivalence lies in S (HTT, Prop. 5.5.4.2 (1)–(2), p. 491). For Z in LC, `Map(f, Z)` is identified with `Map(Lf, Z)` by the adjunction, so objects of LC are S-local; conversely, for S-local X the unit `X → LX` lies in S and joins two S-local objects, so it is an equivalence. If f is an S-equivalence, Lf is an S-equivalence between S-local objects, hence an equivalence.

*Needs:* §1.2.1 (HTT, Def. 5.5.4.1); Part AdjunctionsAndLocalizations §2.3.1 (HTT, Prop. 5.2.7.4).

**1.5.2.** Prove that, for a localization functor `L : C → C` (Part AdjunctionsAndLocalizations §2.3, HTT, Prop. 5.2.7.4) and S the class of morphisms f of C with `Lf` an equivalence, for accessible C the following are equivalent: (i) LC is accessible; (ii) L is accessible; (iii) some small `S₀ ⊆ S` has the same local objects as S (HTT, Prop. 5.5.4.2 (3), p. 491, proof pp. 493–494). The three implications have separate routes.

- (i) ⇒ (ii) (HTT, Prop. 5.5.4.2, (i) ⇒ (ii), pp. 493–494): the reflection `C → LC` and the inclusion are adjoints between accessible ∞-categories, hence accessible (HTT, Prop. 5.4.7.7).
- (ii) ⇒ (iii) (HTT, Prop. 5.5.4.2, (ii) ⇒ (iii), p. 494): for C κ-accessible and L κ-continuous, take for `S₀` the units `X → LX` at κ-compact X. For `S₀`-local Y, `Map(−, Y) → Map(L−, Y)` is an equivalence on κ-compact objects, and both sides send κ-filtered colimits to limits (HTT, Prop. 5.3.5.10).
- (iii) ⇒ (i) (HTT, Prop. 5.5.4.2, (iii) ⇒ (i), p. 494): with the sources and targets of `S₀` κ-compact, LC is stable under κ-filtered colimits. For τ ≫ κ, write a local X as a κ-filtered colimit of κ-compact objects over a partially ordered set (HTT, Lemma 5.1.5.3, Prop. 5.3.1.18) and re-index by the τ-small κ-filtered subsets over which the colimit is local (§1.3; HTT, Prop. 4.2.3.8, Cor. 4.2.3.10); these colimits are τ-compact (HTT, Cor. 5.3.4.15), so LC is τ-accessible (HTT, Prop. 5.4.2.2).

*Needs:* §1.3.2, §1.5.1; Part LimitsAndKanExtensions §6.3.2 (HTT, Prop. 4.2.3.8, Cor. 4.2.3.10); Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2), §1.3.4 (HTT, Lemma 5.1.5.3), §4.4.1 (HTT, Prop. 5.3.1.18) and §6.5.3 (HTT, Prop. 5.3.5.10); Part AccessibleInfinityCategories §2.2.2 (HTT, Cor. 5.3.4.15), §5.1.1 (HTT, Prop. 5.4.2.2) and §5.4.1 (HTT, Prop. 5.4.7.7).

**1.5.3.** Prove that for accessible C and a localization functor L : C → C, the following are equivalent: LC is accessible; there are an accessible D and an adjunction `f ⊣ g` with `f : C → D` and g fully faithful, with `L ≃ g ∘ f`; L is accessible (HTT, Prop. 5.5.1.2, p. 476). The first gives the second with D = LC, and the second the third because f and g are accessible (HTT, Prop. 5.4.7.7). For the third ⇒ first, choose κ with C κ-accessible and L κ-continuous, then τ ≫ κ with L(C) τ-compact for κ-compact C (HTT, Prop. 5.4.2.9); LC is stable under κ-filtered colimits and generated by τ-compact objects, so it is accessible (HTT, Prop. 5.4.2.2).

*Needs:* Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5) and §2.3.1 (HTT, Prop. 5.2.7.4); Part AccessibleInfinityCategories §5.1.1 (HTT, Prop. 5.4.2.2), §5.2.2 (HTT, Prop. 5.4.2.9) and §5.4.1 (HTT, Prop. 5.4.7.7).

### 1.6 The presentation theorem

**1.6.1.** Prove Simpson's theorem: for an ∞-category C the following are equivalent (HTT, Thm. 5.5.1.1, p. 475).

1. C is presentable.
2. C is accessible, and for every regular κ for which C has small κ-filtered colimits, the full subcategory `C^κ` of κ-compact objects has κ-small colimits.
3. For some regular κ, C is κ-accessible and `C^κ` has κ-small colimits.
4. For some regular κ and some small ∞-category D with κ-small colimits, `Ind_κ(D)` is equivalent to C.
5. For some small ∞-category D, C is an accessible reflective localization of `P(D)`.
6. C is locally small and has small colimits, and for some regular κ there is a small set of κ-compact objects such that every object of C is a colimit of a small diagram in the full subcategory they span.

Condition 2 quantifies only over the κ for which `C^κ` is defined. Lurie's route uses no model categories: (1) ⇒ (2) because `C^κ` is stable under the κ-small colimits that exist in C (HTT, Cor. 5.3.4.15); (2) ⇒ (3) ⇒ (4) directly. For (4) ⇒ (5), reduce to D idempotent complete by §1.4, embed D fully faithfully into the κ-compact presheaves (HTT, Prop. 5.1.3.1) with a left adjoint (HTT, Prop. 5.3.4.18), and apply `Ind_κ` (HTT, Prop. 5.3.5.11, Prop. 5.3.5.12). For (5) ⇒ (6), C has small colimits and is generated by the image of the representables (HTT, Rem. 5.2.7.5); the inclusion of C into `P(D)`, the right adjoint of the localization, is accessible by §1.5, so by §1.4 the images of representables, which are completely compact (HTT, Prop. 5.1.6.8), are κ-compact for large κ. For (6) ⇒ (1), the κ-small colimits of the generators form an essentially small full subcategory of κ-compact objects generating C under κ-filtered colimits (HTT, Cor. 4.2.3.11, Prop. 5.4.2.2).

*Needs:* §1.4.1, §1.4.2, §1.5.3; Part LimitsAndKanExtensions §6.3.3 (HTT, Cor. 4.2.3.11); Part AdjunctionsAndLocalizations §2.3.1 (HTT, Rem. 5.2.7.5); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1), §1.6.1 (HTT, Def. 5.1.6.2), §1.6.5 (HTT, Prop. 5.1.6.8) and §6.5.4 (HTT, Prop. 5.3.5.11); Part AccessibleInfinityCategories §2.2.2 (HTT, Cor. 5.3.4.15), §2.3.2 (HTT, Prop. 5.3.4.18), §4.3.1 (HTT, Prop. 5.3.5.12) and §5.1.1 (HTT, Prop. 5.4.2.2).

**1.6.2.** Prove that the ∞-category S of spaces is presentable (HTT, Ex. 5.5.1.8, p. 479): it is accessible (HTT, Ex. 5.4.2.7) and has small colimits (HTT, Cor. 4.2.4.8).

*Needs:* Part LimitsAndKanExtensions §3.3.1 (HTT, Cor. 4.2.4.8); Part AccessibleInfinityCategories §5.1.2 (HTT, Ex. 5.4.2.7).

**1.6.3.** Prove that for presentable C and D with C κ-accessible, a functor `f : C → D` preserves small colimits exactly when f is κ-continuous and its restriction to `C^κ` preserves κ-small colimits (HTT, Prop. 5.5.1.9, p. 479). The forward direction holds because `C^κ` is closed under κ-small colimits in C (HTT, Cor. 5.3.4.15). For the backward direction, write C as a localization of `P(C₀)` with `C₀ = C^κ` idempotent complete (HTT, Lemma 5.4.2.4, Prop. 5.3.5.12), and compare f ∘ L with the colimit-preserving extension of `f|C₀` (HTT, Thm. 5.1.5.6, Prop. 5.3.5.10).

*Needs:* §1.6.1 (Simpson's theorem); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Part PresheavesAndCompletions §1.4.3 (HTT, Thm. 5.1.5.6) and §6.5.3 (HTT, Prop. 5.3.5.10); Part AccessibleInfinityCategories §2.2.2 (HTT, Cor. 5.3.4.15), §2.3.1 (HTT, Prop. 5.3.4.17), §4.3.1 (HTT, Prop. 5.3.5.12) and §4.4.1 (HTT, Lemma 5.4.2.4).

### 1.7 Dense functors

**1.7.1.** Define a functor `F : D → C` of ∞-categories to be **dense** when the identity of C is a left Kan extension of F along itself (SAG, Def. 20.4.1.1, p. 1544). Equivalently, every object C is the colimit of the diagram `D ×_C C_{/C} → D → C`.

- A full subcategory `C⁰ ⊆ C` is dense exactly when `id_C` is a left Kan extension of its restriction to `C⁰`. For full subcategories the general Kan extension agrees with the one along an inclusion (HTT, Prop. 4.3.3.5).
- If `C⁰ ⊆ C¹ ⊆ C` are full subcategories and `C⁰` is dense, then `C¹` is dense (SAG, Rem. 20.4.1.10, p. 1545). This follows from the transitivity of left Kan extensions along full subcategories (HTT, Prop. 4.3.2.8).

**Checks.**

- The Yoneda embedding `C → P(C)` is dense: every presheaf is the colimit of the representables over it.
- The inclusion of the point `{Δ[0]} → S` is dense, since every space is the colimit of the constant diagram on itself indexed by its points. The inclusion of the empty subcategory into S is not dense, since it would exhibit Δ[0] as an empty colimit.
- For C the nerve of [1], which is weakly contractible, the constant functor from C at the point of S is dense, as for every weakly contractible C (SAG, Warn. 20.4.3.4, p. 1549): the colimit of the constant point over `C × X` is X. It is not fully faithful, since `Map_C(1, 0)` is empty while `Map_S(Δ[0], Δ[0])` is a point. So density does not imply full faithfulness.

*Needs:* Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2) and §7.1.4 (HTT, Def. 4.3.3.2); Part LimitsAndKanExtensions §7.5.2 (HTT, Prop. 4.3.2.8) and §7.6.2 (HTT, Prop. 4.3.3.5).

### Examples

- S, and more generally `P(D)` for small D, is presentable: condition (5) of §1.6 with the identity localization.
- `Ind(D)` for a small D with finite colimits is presentable by condition (4) with κ = ℵ₀; for D the nerve of finite sets, `Ind(D)` is the nerve of sets.
- For the reflection of S onto the discrete spaces, the right adjoint (the inclusion) preserves filtered colimits, so by §1.4 the reflection `π₀` preserves compact objects: it sends a finite space to a finite set.

### Dependencies

Layer 1 uses Parts InfinityCategoryFoundations (slices), LimitsAndKanExtensions (homotopy colimits, cofinality, colimits in functor ∞-categories and in spaces, Kan extensions), AdjunctionsAndLocalizations, PresheavesAndCompletions (Yoneda, filtered posets, `Ind_κ`) and AccessibleInfinityCategories, and ModelCategoryTheory, Part ModelCategories for the projective model structure in §1.3.

## Layer 2: Representability and the adjoint functor theorem

### 2.1 Representable presheaves, small limits and tensors

**2.1.1.** Prove that for a small simplicial set K and an object f of `P(K^op)` (a functor `K → S`), with Yoneda embedding `j : K^op → P(K^op)` as in the Conventions, there is an equivalence `f(k) ≃ Map_{P(K^op)}(j(k), f)`, natural in k: the composite of `j^op : K → P(K^op)^op` with the functor `Map_{P(K^op)}(−, f)` represented by f is equivalent to f (HTT, Lemma 5.5.2.1, p. 480; Lurie writes the Yoneda embedding as a covariant functor out of K, which is the opposite of j). Lurie works with a fibrant replacement of the rigidification of K and the straightening of the presheaf (HTT, Prop. 4.2.4.4, Cor. 4.2.4.7); the statement is the Yoneda lemma for presheaves on K.

*Needs:* Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4) and §3.1.2 (HTT, Cor. 4.2.4.7).

**2.1.2.** Prove that on a presentable C, a functor `F : C^op → S` is representable exactly when it preserves small limits (HTT, Prop. 5.5.2.2, p. 481). Representables preserve limits (HTT, Prop. 5.1.3.2). Conversely, write C as the local objects of an accessible localization `L : P(C₀) → C` (§1.6). `F ∘ L^op` preserves small limits (HTT, Prop. 5.2.3.5); a limit-preserving functor `P(C₀)^op → S` is determined by its restriction to `C₀^op`, an object f of `P(C₀)` (HTT, Thm. 5.1.5.6), and §2.1.1, with K = `C₀^op`, identifies f with the restriction of the functor `Map_{P(C₀)}(−, f)` represented by f, so `F ∘ L^op ≃ Map_{P(C₀)}(−, f)`, both being limit-preserving functors `P(C₀)^op → S` with the same restriction to `C₀^op`. Since `F ∘ L^op` inverts the morphisms L inverts, f is local, so it lies in C (§1.5, HTT Prop. 5.5.4.2 (1)) and represents F.

*Needs:* §1.5.1, §1.6.1, §2.1.1; Part LimitsAndKanExtensions §3.4.2 (HTT, Def. 4.4.4.4); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2) and §1.4.3 (HTT, Thm. 5.1.5.6).

**2.1.3.** Prove that a presentable ∞-category has all small limits (HTT, Cor. 5.5.2.4, p. 482). For a small diagram `p : K → C`, the presheaf `X ↦ lim Map(X, p(k))` preserves small limits, because presheaf ∞-categories have pointwise limits (HTT, Cor. 5.1.2.3) and limits commute with limits (the dual of HTT Lemma 5.5.2.3); so it is represented by an object (§2.1.2), and that object is a limit of p by full faithfulness of Yoneda (HTT, Prop. 5.1.3.1).

*Needs:* §2.1.2; Part LimitsAndKanExtensions §8.2.3 (HTT, Cor. 5.1.2.3); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1) and §5.2.1 (HTT, Lemma 5.5.2.3, dual form).

- **2.1.4. Tensors with small simplicial sets** (HTT, Rem. 5.5.1.7, p. 478). A presentable C is tensored over S: for an object C and a small simplicial set K there is an object `C ⊗ K`, unique up to equivalence, with `Map_C(C ⊗ K, C') ≃ Map_C(C, C')^K` naturally in `C'`, as isomorphisms in the homotopy category of spaces. Take the colimit of the constant K-diagram at C, which exists since C has small colimits (HTT, Cor. 4.4.4.9). Lurie states this for every simplicial set K; for K not small no such object need exist (for the ∞-category S, the object Δ[0] and K discrete on a non-small set, `Map(Δ[0], ∂Δ[1])^K` has a non-small set of components, while every mapping space of S into ∂Δ[1] has a small one). *Needs:* Part LimitsAndKanExtensions §3.5.1 (HTT, Cor. 4.4.4.9); ModelCategoryTheory, Part ModelCategories §8.2.2 (HTT, Ex. A.1.4.5).

### 2.2 Corepresentable functors and the adjoint functor theorem

**2.2.1.** Prove that on a presentable C, a functor `F : C → S` is corepresentable exactly when F is accessible and preserves small limits (HTT, Prop. 5.5.2.7, p. 483). A corepresentable functor preserves limits (HTT, Prop. 5.1.3.2) and is κ-continuous once its object is κ-compact. Conversely, Lurie's route: take C minimal, let `C̃ → C` be the left fibration classified by F, choose κ with C κ-accessible and F κ-continuous, and restrict to the small part `C̃^κ` over `C^κ`. The limit of the projection `C̃^κ → C` exists (§2.1), and because F preserves limits it lifts to `C̃` (HTT, Cor. 3.3.3.3); the resulting object corepresents F on `C^κ` (HTT, Prop. 2.1.4.7, Prop. 2.1.4.9, Lemma 5.4.2.4), hence on C by κ-continuity (HTT, Prop. 5.3.5.10).

*Needs:* §2.1.3; Part InfinityCategoryFoundations §6.3.1 (HTT, Prop. 2.1.4.7, Prop. 2.1.4.9); Part LimitsAndKanExtensions §3.4.2 (HTT, Def. 4.4.4.4); Part Straightening §3.2.3 (HTT, Cor. 3.3.3.3); Part PresheavesAndCompletions §1.2.1 (HTT, Prop. 5.1.1.1), §1.3.2 (HTT, Prop. 5.1.3.2) and §6.5.3 (HTT, Prop. 5.3.5.10); Part AccessibleInfinityCategories §4.4.1 (HTT, Lemma 5.4.2.4).

**2.2.2.** Prove the adjoint functor theorem: for a functor `F : C → D` between presentable ∞-categories, F has a right adjoint exactly when F preserves small colimits, and F has a left adjoint exactly when F is accessible and preserves small limits (HTT, Cor. 5.5.2.9, p. 484). Left adjoints preserve colimits and right adjoints limits (HTT, Prop. 5.2.3.5), and adjoints between accessible ∞-categories are accessible (HTT, Prop. 5.4.7.7). Conversely, for each object D the presheaf `Map_D(F(−), D)` preserves limits, hence is representable by §2.1, and the representing objects assemble into a right adjoint (HTT, Prop. 5.2.4.2); the left adjoint is constructed in the same way from §2.2.1. Lurie remarks that the proof of the first statement uses only that D is locally small (HTT, Rem. 5.5.2.10, p. 484); this Part does not use that generalization.

*Needs:* §2.1.2, §2.2.1; Part LimitsAndKanExtensions §3.4.2 (HTT, Def. 4.4.4.4); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5) and §1.6.1 (HTT, Prop. 5.2.4.2); Part AccessibleInfinityCategories §5.4.1 (HTT, Prop. 5.4.7.7).

### Examples

- For C = S and F the identity, §2.2 gives the corepresenting object Δ[0]; `Map_C(X, −)` is always accessible, since X is κ-compact for some κ.
- For a colimit-preserving `F : S → D`, the right adjoint of §2.2 is `D ↦ Map_D(F(Δ[0]), D)`.
- In the nerve of sets, the tensor `C ⊗ K` of §2.1 is `C × π₀(K)`: mapping spaces are discrete, so only components of K matter.

### Dependencies

Layer 2 uses Layer 1, Part InfinityCategoryFoundations (the covariant model structure), Part LimitsAndKanExtensions (rigidification, representable presheaves, tensors), Part Straightening (limits in `Cat∞` and in spaces), Part PresheavesAndCompletions (Yoneda, the free cocompletion, colimits in two variables), Part AdjunctionsAndLocalizations (adjoints) and Part AccessibleInfinityCategories (accessible adjoints).

## Layer 3: Constructions that preserve presentability

### 3.1 Products and functor ∞-categories

**3.1.1.** Prove that a small product of presentable ∞-categories is presentable (HTT, Prop. 5.5.3.5, p. 485): products of accessible ∞-categories are accessible (HTT, Lemma 5.4.7.2) and colimits are computed componentwise (HTT, Prop. 5.1.2.2).

*Needs:* Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part AccessibleInfinityCategories §6.3.1 (HTT, Lemma 5.4.7.2).

**3.1.2.** Prove that `Fun(K, C)` is presentable for presentable C and small K (HTT, Prop. 5.5.3.6, p. 485): it is accessible (HTT, Prop. 5.4.4.3) and has pointwise colimits.

*Needs:* Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part AccessibleInfinityCategories §6.2.1 (HTT, Prop. 5.4.4.3).

**3.1.3.** Prove that `Fun^L(C, D)`, the full subcategory of colimit-preserving functors, is presentable for presentable C and D (HTT, Prop. 5.5.3.8, p. 486). Lurie's route does not use §3.1.2. Colimits in `Fun(C, D)` are pointwise (HTT, Prop. 5.1.2.2), and `Fun^L(C, D)` is stable under them because colimits commute with colimits (HTT, Lemma 5.5.2.3). For accessibility, choose κ with C κ-accessible: restriction identifies `Fun^L(C, D)` with the full subcategory E of `Fun(C^κ, D)` spanned by the functors preserving κ-small colimits (§1.6, HTT Prop. 5.5.1.9; HTT, Prop. 5.3.5.10). `Fun(C^κ, D)` is accessible (HTT, Prop. 5.4.4.3), and E is the intersection, over a small set of κ-small diagrams `p : K → C^κ`, of the subcategories preserving the colimit of p, each the pullback of the colimit diagrams in `Fun(K^▷, D)` (HTT, Ex. 5.4.7.9); so E is an accessible subcategory (HTT, Def. 5.4.7.8, Prop. 5.4.7.10).

*Needs:* §1.6.3; Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §1.5.1 (HTT, Def. 5.2.6.1), §5.2.1 (HTT, Lemma 5.5.2.3) and §6.5.3 (HTT, Prop. 5.3.5.10); Part AccessibleInfinityCategories §6.2.1 (HTT, Prop. 5.4.4.3), §7.3.1 (HTT, Def. 5.4.7.8), §7.3.2 (HTT, Ex. 5.4.7.9) and §7.3.3 (HTT, Prop. 5.4.7.10).

### 3.2 Slices, fiber products and presheaves on slices

**3.2.1.** Prove that for presentable C and small `p : K → C`, the slice `C_{/p}` is presentable (HTT, Prop. 5.5.3.10, p. 487): it is accessible (HTT, Cor. 5.4.6.7) and has colimits computed in C (HTT, Prop. 1.2.13.8).

*Needs:* Part InfinityCategoryFoundations §8.3.1 (HTT, Prop. 1.2.13.8); Part AccessibleInfinityCategories §7.2.1 (HTT, Cor. 5.4.6.7).

**3.2.2.** Prove that `C_{p/}` is presentable (HTT, Prop. 5.5.3.11, p. 487): it is accessible (HTT, Cor. 5.4.5.16), and colimits in `C_{p/}` of a diagram `q : K' → C_{p/}` are computed from `(C_{p/})_{q/} ≃ C_{q'/}` for the induced `q' : K ⋆ K' → C` (HTT, Prop. 1.2.9.2).

*Needs:* Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2); Part AccessibleInfinityCategories §6.5.4 (HTT, Cor. 5.4.5.16).

**3.2.3.** Prove that a homotopy pullback `X' = X ×_Y Y'` of presentable ∞-categories along colimit-preserving functors `X → Y` and `Y' → Y` is presentable, and that a functor from a presentable ∞-category into `X'` preserves small colimits exactly when its composites with the two projections do (HTT, Prop. 5.5.3.12, p. 487). Represent the pullback by a categorical fibration (HTT, Thm. 2.2.5.1, Cor. 2.4.6.5), compute colimits componentwise (HTT, Lemma 5.4.5.2), and use accessibility of fiber products of accessible ∞-categories along accessible functors (HTT, Lemma 5.4.5.5, Prop. 5.4.6.6).

*Needs:* Part InfinityCategoryFoundations §9.4.1 (HTT, §2.2.5, categorical fibrations) and §9.5.1 (HTT, Thm. 2.2.5.1, model structure part); Part InfinityCategoryFoundations §10.2.4 (HTT, Cor. 2.4.6.5); Part AccessibleInfinityCategories §1.2.1 (HTT, Lemma 5.4.5.2), §1.2.2 (HTT, Lemma 5.4.5.5) and §7.1.4 (HTT, Prop. 5.4.6.6).

**3.2.4.** Prove that for a presentable C, a small diagram `p : K → C`, and an object of `C_{/p}` whose image in C is completely compact, that object is completely compact in `C_{/p}` (HTT, Lemma 5.1.6.7, p. 348). Lurie's hypothesis is presentability; the proof uses only a limit of p, which exists by §2.1, and the colimits of C. The route: a limit `p̄` of p gives trivial fibrations `C_{/p̄} → C_{/p}` and `C_{/p̄} → C_{/Z}` for the limit object Z, and complete compactness transfers along the homotopy pullback of left fibrations (HTT, Lemma 5.1.6.6) and the comparison of the two slice constructions (HTT, Prop. 4.2.1.5).

*Needs:* §2.1.3; Part InfinityCategoryFoundations §8.3.1 (HTT, Prop. 1.2.13.8); Part LimitsAndKanExtensions §1.1.1 (HTT, Def. 4.2.1.1) and §1.2.1 (HTT, Prop. 4.2.1.5); Part PresheavesAndCompletions §1.6.1 (HTT, Def. 5.1.6.2), §1.6.3 (HTT, Def. 5.1.6.5) and §1.6.4 (HTT, Lemma 5.1.6.6).

**3.2.5.** Prove that for a small ∞-category C and `p : K → C`, with `p' = j ∘ p`, the colimit-preserving functor `P(C_{/p}) → P(C)_{/p'}` extending the evident functor on `C_{/p}` is an equivalence (HTT, Cor. 5.1.6.12, p. 351). The route is Lurie's: verify the three conditions of the recognition criterion for presheaf ∞-categories (HTT, Cor. 5.1.6.11); complete compactness of the images comes from §3.2.4 applied to the presentable `P(C)` (§1.6), and the colimits of `P(C)_{/p'}` from HTT Prop. 1.2.13.8.

*Needs:* §1.6.1, §3.2.4; Part InfinityCategoryFoundations §4.3.1 (HTT, Cor. 2.1.2.2) and §8.3.1 (HTT, Prop. 1.2.13.8); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1), §1.3.4 (HTT, Lemma 5.1.5.3), §1.4.3 (HTT, Thm. 5.1.5.6), §1.4.4 (HTT, Def. 5.1.5.7), §1.6.1 (HTT, Def. 5.1.6.2), §1.6.5 (HTT, Prop. 5.1.6.8) and §1.7.1 (HTT, Cor. 5.1.6.11).

### Examples

- The ∞-category `Fun^L(S, D)` is equivalent to D by evaluation at the point, consistent with §3.1.
- For K = ∅ in §3.2, `C_{/p} = C` and `P(C_{/p}) → P(C)_{/p'}` is the identity of `P(C)`.
- For presentable C, the functor `Δ[0] → C` picking an initial object preserves colimits; the pullback of two copies of it is Δ[0] (§3.2), because the space of endomorphisms of an initial object is contractible.

### Dependencies

Layer 3 uses Layers 1–2, Part InfinityCategoryFoundations (joins, colimits in slices, the Joyal model structure), Part CartesianFibrations (categorical fibrations over an ∞-category), Part LimitsAndKanExtensions (pointwise colimits, fat slices), Part PresheavesAndCompletions (colimits in two variables, completely compact objects) and Part AccessibleInfinityCategories (accessibility of products, functor ∞-categories, slices and fiber products).

## Layer 4: Localization at a small set of morphisms

### 4.1 Strongly saturated and saturated classes

**4.1.1.** Let C have small colimits. Define a class S of morphisms of C to be *strongly saturated* when it is stable under pushout, the full subcategory of `Fun(Δ[1], C)` spanned by S is stable under small colimits, and S has the two-out-of-three property (HTT, Def. 5.5.4.5, p. 494).

- A strongly saturated class contains every equivalence and is stable under homotopy and retracts (HTT, Rem. 5.5.4.6, p. 495): the identity of an initial object is initial in `Fun(Δ[1], C)`, its pushouts are the identities, two-out-of-three gives the equivalences, and retracts are colimits of idempotents. *Needs:* Part PresheavesAndCompletions §2.3.1 (HTT, Prop. 4.4.5.12).
- Intersections of strongly saturated classes are strongly saturated, so every class S generates a smallest strongly saturated class; a strongly saturated class is *of small generation* when it is generated by a small set (HTT, Rem. 5.5.4.7, p. 495). *Needs:* this definition only.
- If `F : C → D` is a functor between ∞-categories with small colimits that preserves small colimits and T is strongly saturated in D, then `F⁻¹T` is strongly saturated; in particular the morphisms that F inverts form a strongly saturated class (HTT, Rem. 5.5.4.10, p. 496), because `Fun(Δ[1], F)` preserves colimits and the equivalences of D are strongly saturated. *Needs:* Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2).
- For any ∞-category D and a functor `F : C → D` preserving small colimits, the morphisms that F inverts form a strongly saturated class: F carries pushout squares and colimit diagrams in `Fun(Δ[1], C)` to colimit diagrams (colimits in `Fun(Δ[1], C)` are pointwise, and a pointwise colimit diagram in `Fun(Δ[1], D)` is a colimit diagram, HTT Prop. 5.1.2.2), and in any ∞-category a pushout of an equivalence, and a colimit in `Fun(Δ[1], D)` of equivalences, are equivalences; two-out-of-three holds for equivalences. *Needs:* Part InfinityCategoryFoundations §1.2.4 (HTT, §1.2.13, colimits); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2).

**Checks.**

- For C = Δ[0], the empty class is not strongly saturated: the colimit of the empty diagram in `Fun(Δ[1], Δ[0])` is the identity, which must then lie in the class. A definition without the colimit condition would accept the empty class.
- In S, the class of morphisms surjective on `π₀` is stable under pushout and under colimits of arrows, but it fails two-out-of-three: the fold map `∂Δ[1] → Δ[0]` and the identity of Δ[0] are in it, while the inclusion of one point `Δ[0] → ∂Δ[1]`, whose composite with the fold map is the identity, is not. A definition without two-out-of-three would accept this class.
- In S, the strongly saturated class generated by `∂Δ[1] → Δ[0]` is the class of maps `A → B` with A empty exactly when B is empty, the morphisms inverted by the reflection onto the (−1)-truncated spaces. It contains `S¹ → Δ[0]` and not `∅ → Δ[0]`. Taking only pushouts and composites of the generator would miss `S¹ → Δ[0]`: such maps attach 1-cells, and attaching 1-cells never kills π₁(S¹) = ℤ.

*Needs:* Part InfinityCategoryFoundations §1.2.4 (HTT, §1.2.13, colimits).

**4.1.2.** Prove that for C with small colimits and any class `S₀` of morphisms, the `S₀`-equivalences form a strongly saturated class (HTT, Lemma 5.5.4.11, p. 496). For each `S₀`-local Z, the functor `Map(−, Z) : C → S^op` preserves colimits (HTT, Prop. 5.1.3.2), so the morphisms it inverts form a strongly saturated class (the last bullet above), and the `S₀`-equivalences are their intersection.

*Needs:* §4.1.1; Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2).

**4.1.3.** Let C be presentable. Define a class S of morphisms of C to be *saturated* when the full subcategory of `Fun(Δ[1], C)` spanned by S is stable under small colimits, S contains all equivalences and is stable under composition, and S is stable under pushout (HTT, Def. 5.5.5.1, p. 503). Intersections of saturated classes are saturated, so every class generates a saturated class, and a saturated class is *of small generation* when it is generated by a small set (HTT, Rem. 5.5.5.2, p. 504).

- A strongly saturated class is saturated; the converse fails (first Check).

**Checks.**

- In S, the class of morphisms surjective on `π₀` is saturated but not strongly saturated, by the computation in the Checks of strong saturation. A definition identifying the two notions would be wrong here.
- In S, the left orthogonal of `∅ → Δ[0]`, the maps `A → B` with A empty exactly when B is, is saturated and contains `Δ[0] → ∂Δ[1]`, so it differs from the `π₀`-surjective class.
- In S, the monomorphisms (inclusions of unions of components) contain the equivalences and are stable under composition and pushout, but they are not saturated: the pushout in `Fun(Δ[1], S)` of `∅ → ∂Δ[1]` along its maps to `∅ → Δ[0]` (by the fold map) and to the identity of ∂Δ[1] is the fold map `∂Δ[1] → Δ[0]`, which is not a monomorphism. A definition without the colimit condition would accept them.

*Needs:* §1.1.1 (HTT, Def. 5.5.0.1).

### 4.2 Saturated classes of small generation

**4.2.1.** Prove that for presentable C and a strongly saturated class S, with `D ⊆ Fun(Δ[1], C)` the full subcategory spanned by S, the following are equivalent: D is accessible; D is presentable; S is of small generation (HTT, Lemma 5.5.4.14, p. 498). The route has the following steps; in the middle three, C is κ-accessible, D is stable under small colimits in `Fun(Δ[1], C)`, and `D₀ ⊆ D` consists of the morphisms of S between κ-compact objects (small after passing to a minimal model).

- Accessible ⇒ presentable ⇒ small generation (HTT, Lemma 5.5.4.14, (1) ⇒ (2) ⇒ (3), p. 498): D is stable under small colimits in `Fun(Δ[1], C)` (HTT, Prop. 5.1.2.2), and a small set of colimit generators of a presentable D (§1.6, condition 6) generates S.
- Envelope (HTT, Lemma 5.5.4.14, the envelope step of the proof, p. 498): the κ-continuous functor `F : Ind_κ(D₀) → D` extending the inclusion is fully faithful, and its essential image `D''` is stable under small colimits in `Fun(Δ[1], C)`. The objects of `D₀` are κ-compact in `Fun(Δ[1], C)` (HTT, Lemma 5.3.4.9), so F is fully faithful (HTT, Prop. 5.3.5.10, Prop. 5.3.5.11); `D₀` is stable under κ-small colimits (HTT, Cor. 5.3.4.15), so `Ind_κ(D₀)` is presentable and F preserves colimits (§1.6). Without the colimit hypothesis on D this fails.
- Refinement (HTT, Lemma 5.5.4.14, the refinement step of the proof, pp. 499–500): every diagram `p : K → C` with K = `Λ[2, 0]` or Δ[2], some of whose designated edges lie in `D''`, is a κ-filtered colimit of diagrams `K → C^κ` whose designated edges lie in `D''`. Write p as a κ-filtered colimit over a partially ordered set A of diagrams in `C^κ` (HTT, Prop. 5.3.5.15, Prop. 5.3.1.18), and let B be the set of κ-small filtered `A' ⊆ A` over which the colimits of the designated edges lie in `D''`; §1.3 shows B is κ-filtered with union A, and cofinality re-indexes the colimit over B (HTT, Prop. 4.2.3.4, Cor. 4.2.3.10).
- Pushouts (HTT, Lemma 5.5.4.14, the pushout step of the proof, pp. 498–499): if S is stable under pushout, so is `D''`. Refine the span; colimits in two variables (HTT, Lemma 5.5.2.3) and the left Kan extension computing pushouts (HTT, Prop. 4.3.2.17) write the pushout as a κ-filtered colimit of pushouts of κ-compact objects, which lie in `D₀`.
- Small generation ⇒ accessible (HTT, Lemma 5.5.4.14, (3) ⇒ (1), pp. 498–500): choose κ with the generators κ-compact. `D''` contains the generators and is stable under colimits and pushouts; refining a 2-simplex gives two-out-of-three. So `D''` is the whole class and `D ≃ Ind_κ(D₀)` is κ-accessible.

*Needs:* §1.3.3, §1.6.1, §1.6.3, §4.1.1; Part LimitsAndKanExtensions §6.2.2 (HTT, Prop. 4.2.3.4), §6.3.2 (HTT, Cor. 4.2.3.10) and §8.2.2 (HTT, Prop. 5.1.2.2); Part AdjunctionsAndLocalizations §1.8.1 (HTT, Prop. 4.3.2.17); Part PresheavesAndCompletions §4.4.1 (HTT, Prop. 5.3.1.18), §5.2.1 (HTT, Lemma 5.5.2.3), §6.3.2 (HTT, Lemma 5.3.4.9), §6.5.3 (HTT, Prop. 5.3.5.10) and §6.5.4 (HTT, Prop. 5.3.5.11); Part AccessibleInfinityCategories §2.2.2 (HTT, Cor. 5.3.4.15) and §4.6.1 (HTT, Prop. 5.3.5.15, colimit part).

**4.2.2.** Prove that for presentable C and a saturated S, with D as above, D is presentable exactly when S is of small generation as a saturated class (HTT, Lemma 5.5.5.9, p. 505). The steps of the route of §4.2.1 use of S only that D is stable under small colimits in `Fun(Δ[1], C)` and, in the pushout step, stability under pushout, so they apply to a saturated S. Presentable ⇒ small generation is the first step (HTT, Lemma 5.5.5.9, (2) ⇒ (1), p. 505). For small generation ⇒ presentable (HTT, Lemma 5.5.5.9, (1) ⇒ (2), pp. 505–506), the last step runs as before, except that refining a 2-simplex gives stability under composition in place of two-out-of-three, and `D ≃ Ind_κ(D₀)` is κ-accessible with small colimits, hence presentable.

*Needs:* §4.2.1 and its route; §1.3.3, §1.6.1, §1.6.3, §4.1.1, §4.1.3; Part LimitsAndKanExtensions §6.2.2 (HTT, Prop. 4.2.3.4), §6.3.2 (HTT, Cor. 4.2.3.10) and §8.2.2 (HTT, Prop. 5.1.2.2); Part AdjunctionsAndLocalizations §1.8.1 (HTT, Prop. 4.3.2.17); Part PresheavesAndCompletions §4.4.1 (HTT, Prop. 5.3.1.18), §5.2.1 (HTT, Lemma 5.5.2.3), §6.3.2 (HTT, Lemma 5.3.4.9), §6.5.3 (HTT, Prop. 5.3.5.10) and §6.5.4 (HTT, Prop. 5.3.5.11); Part AccessibleInfinityCategories §2.2.2 (HTT, Cor. 5.3.4.15) and §4.6.1 (HTT, Prop. 5.3.5.15, colimit part).

### 4.3 Local replacements for saturated classes

**4.3.1.** Prove that for a presentable C, a saturated class S and an object X, the full subcategory of `C_{X/}` spanned by the maps `X → Y` in S is stable under small colimits (HTT, Lemma 5.5.5.11, p. 507). Its initial object is the identity; colimits in `C_{X/}` over weakly contractible diagrams are computed in C (HTT, Prop. 4.4.2.9, Lemma 5.3.1.20, Cor. 4.4.4.10); a general colimit is a pushout of a coproduct (HTT, Cor. 4.4.2.4, Cor. 4.2.3.11), handled by the pushout and colimit conditions. The same argument works for a strongly saturated class in any C with small colimits (compare HTT, Lemma 5.5.4.12, p. 496); this Part uses only the saturated case.

*Needs:* §4.1.3; Part LimitsAndKanExtensions §3.5.2 (HTT, Cor. 4.4.4.10), §6.3.3 (HTT, Cor. 4.2.3.11), §6.5.3 (HTT, Cor. 4.4.2.4), §7.3.5 (HTT, Prop. 4.4.2.9) and §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §1.4.4 (HTT, Def. 5.1.5.7) and §4.3.2 (HTT, Lemma 5.3.1.20).

**4.3.2.** Prove that for any ∞-category C and morphisms `f : C → D`, `g : C → E`, the mapping space `Map_{C_{C/}}(f, g)` is the homotopy fiber over g of the restriction `Map_C(D, E) → Map_C(C, E)` (HTT, Lemma 5.5.5.12, p. 507). The route uses that `C_{f/} → C_{C/}` is a left fibration (HTT, Prop. 2.1.2.1) and the comparison of fibers with mapping spaces (HTT, Lemma 2.1.3.3).

*Needs:* Part InfinityCategoryFoundations §4.2.1 (HTT, Prop. 2.1.2.1) and §5.3.1 (HTT, Lemma 2.1.3.3).

**4.3.3.** Prove that for a pushout square in C with `f : X → X'`, its pushout `f' : Y → Y'` along `g : X → Y`, there is an equivalence `Map_{C_{X/}}(f, g) ≃ Map_{C_{Y/}}(f', id_Y)` in the homotopy category of spaces (HTT, Lemma 5.5.5.13, p. 508). Both sides are homotopy fibers by §4.3.2, and the pushout square gives a homotopy pullback of mapping complexes after rigidification (HTT, Thm. 4.2.4.1, applied object by object, through small full subcategories, as in Part LimitsAndKanExtensions §3.3 (*Size*), since C may be large).

*Needs:* §4.3.2; Part LimitsAndKanExtensions §3.1.2 (HTT, Cor. 4.2.4.7), §3.2.1 (HTT, Thm. 4.2.4.1) and §3.3.1 (*Size*).

**4.3.4.** Prove that for presentable C and a saturated S of small generation, every object X admits a morphism `X → Y` in S with Y S-local (HTT, Lemma 5.5.5.14, p. 509). Let `D_X ⊆ C_{X/}` be the maps in S; it is presentable (§4.2 with the slice, HTT Prop. 5.4.6.6, and the base change of HTT Prop. 3.3.1.3) and has a final object (§2.1). §4.3.2 and §4.3.3 show that the final object `X → Y` has Y S-local: maps from a generator into Y are tested in `D_X` through pushouts.

*Needs:* §2.1.3, §4.1.3, §4.2.2, §4.3.1–4.3.3; Part CartesianFibrations §7.2.1 (HTT, Prop. 3.3.1.3); Part LimitsAndKanExtensions §1.2.1 (HTT, Prop. 4.2.1.5); Part AccessibleInfinityCategories §7.1.4 (HTT, Prop. 5.4.6.6).

### 4.4 The localization `S⁻¹C` and its universal property

**4.4.1.** Prove that for presentable C, a small set S of morphisms, `S̄` the strongly saturated class it generates and `C' ⊆ C` the full subcategory of S-local objects: every object C admits a morphism `C → C'` in `S̄` with S-local target; C' is presentable; the inclusion `C' ⊆ C` has a left adjoint L; and for a morphism f, being an S-equivalence, lying in `S̄`, and having Lf an equivalence are equivalent (HTT, Prop. 5.5.4.15, p. 500). Lurie's route: the saturated class T generated by S lies in `S̄`, and §4.3 gives a map `C → C'` in T with T-local, hence S-local, target; this is a localization (HTT, Prop. 5.2.7.8), accessible by the small-test criterion of §1.5, so C' is presentable (HTT, Rem. 5.2.7.5). The S-equivalences are strongly saturated (§4.1) and contain S, and Lf is an equivalence exactly when f is an S-equivalence by Yoneda (HTT, Prop. 5.1.3.1). Write `S⁻¹C` for C'.

*Needs:* §1.5.2, §4.1.1, §4.1.2, §4.1.3, §4.3.4; Part AdjunctionsAndLocalizations §2.3.1 (HTT, Rem. 5.2.7.5, Prop. 5.2.7.8); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1).

**4.4.2.** Prove that for presentable C, any ∞-category D and a small set S with localization `L : C → S⁻¹C`, composition with L gives a fully faithful functor `Fun^L(S⁻¹C, D) → Fun^L(C, D)` whose essential image is the colimit-preserving functors carrying every element of S to an equivalence (HTT, Prop. 5.5.4.20, p. 502). Lurie's route: composition with L is already fully faithful on all functors `S⁻¹C → D`, because for every `f₀` the composite `f₀ ∘ L` is a right Kan extension of `f₀` along the inclusion: the unit `X → LX` is initial in `(S⁻¹C)_{X/}` (HTT, Rem. 5.2.7.7) and `f₀` inverts L of it (HTT, Prop. 5.2.7.4), and right Kan extensions are unique (HTT, Prop. 4.3.2.15). Conversely, a colimit-preserving f carrying S to equivalences inverts a strongly saturated class containing S (§4.1, the bullet on colimit-preserving functors into an arbitrary D), hence every unit `X → LX` (§4.4.1), so `f ≃ f ∘ L`. Lurie cites HTT Lemma 5.5.4.11 here, which concerns `S₀`-equivalences in C and does not apply to an arbitrary D; the bullet replaces it.

*Needs:* §4.1.1, §4.4.1; Part LimitsAndKanExtensions §7.4.6 (HTT, Prop. 4.3.2.15); Part AdjunctionsAndLocalizations §2.2.1 (HTT, Rem. 5.2.7.7) and §2.3.1 (HTT, Prop. 5.2.7.4); Part PresheavesAndCompletions §1.5.1 (HTT, Def. 5.2.6.1).

### 4.5 The pullback criterion for left exact localizations

**4.5.1.** Prove that a reflective localization `L : 𝒳 → 𝒴`, with 𝒳 having finite limits, is left exact exactly when the class of morphisms of 𝒳 that L inverts is stable under pullback (HTT, Prop. 6.2.1.1, p. 589; `Suggested.lean` declaration `isLeftExact_iff_isEquivalence_pullback`). The route is Lurie's. Identify 𝒴 with the local objects for the class S that L inverts (§1.5, HTT Prop. 5.5.4.2). The forward direction is immediate: a left exact L carries a pullback of an L-equivalence to a pullback of an equivalence. S-local objects are stable under every limit that exists in 𝒳, the empty limit included. If `p : K → 𝒳` takes S-local values and has a limit X in 𝒳, then for s : A → B in S the map `Map(s, X)` is identified with the limit over K of the equivalences `Map(s, p(k))`, because the Yoneda embedding preserves limits (HTT, Prop. 5.1.3.2, one universe up when 𝒳 is large) and limits of presheaves are pointwise (HTT, Cor. 5.1.2.3); so X is S-local, and lies in 𝒴 by §1.5 (HTT, Prop. 5.5.4.2 (1)). For the converse, L preserves the final object, which is S-local by this with K = ∅; and `LX ×_{LZ} LY` is S-local for the same reason, so it suffices that the comparison `X ×_Z Y → LX ×_{LZ} LY` lies in S. Factor it through `X ×_{LZ} Y` and `LX ×_{LZ} Y`. By pasting of pullbacks (HTT, Lemma 4.4.2.1), the last two steps are base changes of the unit maps `X → LX` and `Y → LY`, so they lie in S by the hypothesis. The first step is a base change of the diagonal `Z → Z ×_{LZ} Z`. That diagonal has a left inverse, the first projection, which is a base change of `Z → LZ` and so lies in S. Hence the diagonal lies in S by two-out-of-three, and the first step, a base change of the diagonal, lies in S by the pullback hypothesis.

*Needs:* §1.5.1 (HTT, Prop. 5.5.4.2); §1.2.1 (HTT, Def. 5.5.4.1); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.3); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2) and §2.3.1 (HTT, Prop. 5.2.7.4); Part LimitsAndKanExtensions §6.5.1 (HTT, Lemma 4.4.2.1) and §8.2.3 (HTT, Cor. 5.1.2.3); Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2).

### 4.6 Strongly reflective subcategories

**4.6.1.** Define a full subcategory `C' ⊆ C` of a presentable C to be *strongly reflective* when it is the essential image of an accessible localization functor; equivalently, C' is presentable, stable under equivalence, and the inclusion has a left adjoint (§1.5 with HTT Prop. 5.2.7.4); equivalently, C' is the full subcategory of S-local objects for a small set S (§4.4, §1.5) (HTT, the definition after Prop. 5.5.4.16, p. 501).

**Checks.**

- In S, the (−1)-truncated spaces form a strongly reflective subcategory, the S-local objects for S = {`∂Δ[1] → Δ[0]`}, with reflection sending a non-empty space to the point and ∅ to ∅.
- In S, the discrete spaces are strongly reflective, with reflection `π₀`. The finite discrete spaces are stable under equivalence and finite limits but are not: an infinite discrete space has no reflection into them. A definition by stability under equivalence and finite limits would accept them.
- C itself and the full subcategory of final objects are strongly reflective in any presentable C. In S, the full subcategory of empty spaces is presentable (equivalent to Δ[0]) and stable under equivalence but not strongly reflective: a reflection of Δ[0] into it would need `Map(∅, ∅)`, a point, to agree with `Map(Δ[0], ∅)`, which is empty. A definition omitting the left adjoint would accept it.

*Needs:* §1.5.2, §1.5.3, §4.4.1; Part AdjunctionsAndLocalizations §2.3.1 (HTT, Prop. 5.2.7.4).

**4.6.2.** Prove that for a colimit-preserving `f : C → D` between presentable ∞-categories and a strongly saturated S of small generation in D, the strongly saturated class `f⁻¹S` is of small generation (HTT, Prop. 5.5.4.16, p. 501). Replacing D by `S⁻¹D` (§4.4) reduces to S the equivalences of D. The full subcategory of `Fun(Δ[1], C)` spanned by `f⁻¹S` is the homotopy pullback of `Fun(Δ[1], C) → Fun(Δ[1], D)` along the equivalences, presentable by §3.1 and §3.2, so `f⁻¹S` is of small generation by §4.2.

*Needs:* §3.1.2, §3.2.3, §4.1.1, §4.2.1, §4.4.1.

**4.6.3.** Prove that for a colimit-preserving `f : C → D` between presentable ∞-categories with right adjoint `f^*` and a strongly reflective `C₀ ⊆ C`, the full subcategory of objects D with `f^*D` in `C₀` is strongly reflective in D (HTT, Lemma 5.5.4.17, p. 501). If `C₀` is the S-local objects, then by `Map(f s, D) ≃ Map(s, f^*D)` (HTT, Prop. 5.2.2.8) it is the f(S)-local objects.

*Needs:* §4.4.1, §4.6.1; Part AdjunctionsAndLocalizations §1.3.2 (HTT, Prop. 5.2.2.8).

**4.6.4.** Prove that a small intersection of strongly reflective subcategories of a presentable C is strongly reflective (HTT, Lemma 5.5.4.18, p. 502): it is the local objects for the union of the small sets, a small set (§4.4).

*Needs:* §4.4.1, §4.6.1.

**4.6.5.** Prove that for presentable C and small K, the full subcategory of `Fun(K^◁, C)` spanned by limit diagrams is strongly reflective (HTT, Lemma 5.5.4.19, p. 502). Since every K-indexed diagram in C has a limit (§2.1), restriction identifies it with `Fun(K, C)` by a trivial fibration (Part LimitsAndKanExtensions §7.4, its last statement, HTT, Prop. 4.3.2.15, for limit diagrams indexed by a simplicial set), which is presentable (§3.1), and the composite of restriction with the inverse equivalence is left adjoint to the inclusion (HTT, Prop. 4.3.2.17, in its dual form for right Kan extensions). K need not be an ∞-category, so apply Prop. 4.3.2.17 after the replacement used for that statement: for an inner anodyne `K ⊆ K′` with K′ an ∞-category, restriction `Fun(K′^◁, C) ⟶ Fun(K^◁, C)` is a trivial fibration that matches the limit diagrams on both sides, and over K′ the limit diagrams are the right Kan extensions along `K′ ⊆ K′^◁`.

*Needs:* §2.1.3, §3.1.2, §4.6.1; Part LimitsAndKanExtensions §7.4.7 (HTT, Prop. 4.3.2.15, for limit diagrams indexed by a simplicial set); Part AdjunctionsAndLocalizations §1.8.1 (HTT, Prop. 4.3.2.17).

### 4.7 Adjoining colimits subject to relations

**4.7.1.** Define functor ∞-categories preserving a class of colimits (HTT, Notation 5.3.6.1, p. 430). For ∞-categories C, D and a collection R of cocones `p_α : K_α^▷ → C`, `Fun_R(C, D) ⊆ Fun(C, D)` is the full subcategory on the functors carrying every member of R to a colimit cocone. For a collection 𝒦 of simplicial sets, C admits 𝒦-indexed colimits when it admits K-indexed colimits for each K in 𝒦. When C and D do, `Fun_𝒦(C, D)` is the full subcategory on the functors preserving them.

- `Fun_𝒦(C, D)` contains every functor equivalent to one of its members.
- For 𝒦 all small simplicial sets and `C = P(K)` for a small simplicial set K, `Fun_𝒦(P(K), D)` is the ∞-category `Fun^colim(P(K), D)` of colimit-preserving functors of Part PresheavesAndCompletions §1.4.
- Composition restricts to `Fun_𝒦`.

**Checks.**

- For R empty, `Fun_R(C, D) = Fun(C, D)`. A definition that also required preservation of the colimits of C not listed in R would be smaller.
- For `𝒦 = {∅}` and `C = Δ[0]`, `Fun_𝒦(Δ[0], D)` is the full subcategory of initial objects of D; for D the nerve of `[1]` it is `{0}`. A definition with `𝒦 = {∅}` read as "no colimits" would give all of D.
- For 𝒦 the κ-small simplicial sets and D the nerve of a category, `Fun_𝒦` consists of the functors preserving κ-small colimits in the classical sense, through the nerve comparison of colimits.

*Needs:* Part InfinityCategoryFoundations §1.2.1 (full subcategories, HTT §1.2.11); Part PresheavesAndCompletions §1.4.4 (HTT, Def. 5.1.5.7); Tau Ceti `SSet.fullEnhancedSubcategory`, `SSet.coslice.IsColimit`.

**4.7.2.** Fix a small ∞-category C, a collection 𝒦 of small simplicial sets and a set R of diagrams `p_α : K_α^▷ → C` with `K_α` in 𝒦.

Define `P^𝒦_R(C)` as follows (HTT, Prop. 5.3.6.2, the construction in the proof, p. 431). Let S be the set of comparison maps `colim(j ∘ p_α|K_α) → j(p_α(∞))` in `P(C)`, and `L : P(C) → S⁻¹P(C)` the localization of §4.4. Then `P^𝒦_R(C)` is the smallest full subcategory of `S⁻¹P(C)` containing the image of `L ∘ j` and stable under 𝒦-indexed colimits, and `j_R = L ∘ j : C → P^𝒦_R(C)`. It has 𝒦-indexed colimits, and `j_R` carries the members of R to colimit diagrams. For large C, the same construction one universe up.

**Checks.**

- For R empty and 𝒦 all small simplicial sets, S is empty and `P^𝒦_R(C) = P(C)`.
- For R empty and 𝒦 empty, `P^𝒦_R(C)` is the essential image of j, equivalent to C. A definition taking all of `S⁻¹P(C)` would give `P(C)` here.
- For C = ∂Δ[1] with objects a, b, 𝒦 = {∅} and R the one diagram `∅^▷ → C` at a, the S-local presheaves are those with F(a) contractible; `L j(a)` is initial and `L j(b)` is final among them, so `P^𝒦_R(C)` is the nerve of {0 < 1} with a ↦ 0. Without the localization, the closure of the representables under initial objects has three objects and `j(a)` is not initial.

*Needs:* §4.4.1, §4.7.1; Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1).

**4.7.3.** Prove that if every member of R is already a colimit diagram in C, then `j_R` is fully faithful (HTT, Prop. 5.3.6.2 (3), p. 430, proof pp. 432–433). It suffices that representables are S-local, that is, that each comparison map induces equivalences on maps into representables; this compares slices of `P(C)` along the right anodyne inclusion of the cone point (HTT, Prop. 2.1.2.5, Prop. 4.2.1.5, Cor. 4.2.1.8), using that `j ∘ p_α` is a colimit diagram among representables.

*Needs:* §4.7.2; Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5); Part LimitsAndKanExtensions §1.2.1 (HTT, Prop. 4.2.1.5) and §1.3.1 (HTT, Cor. 4.2.1.8); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1).

**4.7.4.** Prove that for D with small colimits, composition with `j_R` is an equivalence `Fun_𝒦(P^𝒦_R(C), D) → Fun_R(C, D)` (HTT, Prop. 5.3.6.2 (2), the case of cocomplete D, p. 432). Composition with L identifies colimit-preserving functors out of `S⁻¹P(C)` with those out of `P(C)` inverting S (§4.4, HTT Prop. 5.2.7.12). A functor on `L⁻¹P^𝒦_R(C)` preserving 𝒦-colimits and inverting S is a left Kan extension of its restriction to representables (HTT, Lemma 5.1.5.5, Prop. 4.3.2.15), using the minimality of `P^𝒦_R(C)` and that a functor preserves 𝒦-colimits exactly when its composite with L does (HTT, Prop. 5.2.3.5).

*Needs:* §4.4.2, §4.7.2; Part LimitsAndKanExtensions §7.4.6 (HTT, Prop. 4.3.2.15); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5) and §2.4.4 (HTT, Prop. 5.2.7.12); Part PresheavesAndCompletions §1.4.2 (HTT, Lemma 5.1.5.5).

**4.7.5.** Prove the universal property of `P^𝒦_R(C)` for arbitrary D with 𝒦-indexed colimits: composition with `j_R` is an equivalence `Fun_𝒦(P^𝒦_R(C), D) → Fun_R(C, D)` (HTT, Prop. 5.3.6.2, pp. 430–431). Embed D into a cocomplete D' in which D is stable under 𝒦-colimits (HTT, Lemma 5.3.5.7); a functor f into D' factors through D when `f ∘ j_R` does, because `f⁻¹D` is stable under 𝒦-colimits and contains the image of `j_R`, so minimality applies; then use the cocomplete case.

*Needs:* §4.7.4; Part PresheavesAndCompletions §6.5.1 (HTT, Lemma 5.3.5.7).

### Examples

- For S = {`∂Δ[1] → Δ[0]`} in S, `S⁻¹S` is the full subcategory of (−1)-truncated spaces, empty and contractible, and L sends a space to Δ[0] if it is non-empty and to ∅ otherwise.
- For C = Δ[0] and the set S of all morphisms, `S⁻¹C = C`, since every object of Δ[0] is local.
- The reflection `π₀` of S onto the discrete spaces is not left exact, and §4.5 locates the failure: `Δ[0] → S¹` is inverted by `π₀`, while its pullback along `Δ[0] → S¹`, the map from the loop space (discrete with `π₀ ≅ ℤ`) to Δ[0], is not.
- For K = ∅ in §4.6.5, `Fun(K^◁, C) = C` and the limit diagrams are the final objects, so the final objects form a strongly reflective subcategory, with reflection the map to a final object.

### Dependencies

Layer 4 uses Layers 1–3, Part InfinityCategoryFoundations (slices, coslices along anodyne maps), Part CartesianFibrations (base change along a coCartesian fibration), Part LimitsAndKanExtensions (cofinality, fat slices, colimits in slices, reduction to pushouts and coproducts, Kan extensions), Part AdjunctionsAndLocalizations (localizations, Kan extensions as adjoints, inverting a class of morphisms), Part PresheavesAndCompletions (Yoneda, idempotents, filtered posets, colimits in two variables, κ-compactness in functor ∞-categories, `Ind_κ`) and Part AccessibleInfinityCategories (κ-compactness under colimits, `Ind_κ`, categorical pullbacks).

## Layer 5: `Pr^L`, `Pr^R` and compactly assembled ∞-categories

### 5.1 `Pr^L`, `Pr^R` and presentable fibrations

**5.1.1.** Define `Pr^L` and `Pr^R` as the subcategories of `Ĉat∞` whose objects are the presentable ∞-categories; the morphisms of `Pr^L` are the functors preserving small colimits, and those of `Pr^R` are the accessible functors preserving small limits (HTT, Def. 5.5.3.1, p. 484).

- Both are subcategories in the sense of Part InfinityCategoryFoundations §1.2, containing the equivalences. By §2.2, the morphisms of `Pr^L` are exactly the functors with right adjoints, and those of `Pr^R` exactly the functors with left adjoints.

**Checks.**

- The functor `Δ[0] → S` picking the point is a morphism of `Pr^R` but not of `Pr^L`: it preserves limits and is accessible, and it does not preserve the initial object. A definition with the same morphisms in both would fail here.
- The nerve of the opposite of the category of sets is not presentable (§1.1, Checks), so it is an object of neither, although it has small colimits and is locally small. A definition requiring only small colimits would admit it.
- The functor `S → S`, `X ↦ X × X`, preserves limits, filtered colimits and the initial object but not binary coproducts (`(Δ[0] ⊔ Δ[0])²` has four components, `Δ[0]² ⊔ Δ[0]²` two), so it is in `Pr^R` and not in `Pr^L`. Requiring only filtered colimits and the initial object would put it in `Pr^L`.

*Needs:* §2.2.2; §1.1.1 (HTT, Def. 5.5.0.1); Part InfinityCategoryFoundations §1.2.1 (subcategories).

**5.1.2.** Define a map `p : X → S` of simplicial sets to be a *presentable fibration* when it is both a Cartesian and a coCartesian fibration and every fiber is presentable (HTT, Def. 5.5.3.2, p. 485).

- Over S = Δ[0], a presentable fibration is a presentable ∞-category.
- Over Δ[1], a presentable fibration is an adjunction between presentable ∞-categories (HTT, Cor. 5.2.2.5, p. 359).

**Checks.**

- The projection `S × Δ[1] → Δ[1]` is a presentable fibration, classifying the identity adjunction.
- The Cartesian fibration over Δ[1] whose transport functor is `S → S`, `X ↦ X ⊔ X`, has presentable fibers but is not coCartesian: the transport does not preserve the final object, so it has no left adjoint. A definition requiring only a Cartesian fibration with presentable fibers would accept it.
- The projection from the nerve of the opposite of the category of sets times Δ[1] to Δ[1] is both Cartesian and coCartesian, but its fibers are not presentable (previous Checks). A definition requiring only a bifibration would accept it.

*Needs:* Part AdjunctionsAndLocalizations §1.3.3 (HTT, Cor. 5.2.2.5); Tau Ceti `SSet.CartesianFibration`.

**5.1.3.** Prove that a Cartesian fibration `p : X → S` classified by `χ : S^op → Ĉat∞` is presentable exactly when χ factors through `Pr^R`, and a coCartesian fibration classified by `χ : S → Ĉat∞` is presentable exactly when χ factors through `Pr^L` (HTT, Prop. 5.5.3.3, p. 485). A Cartesian fibration is coCartesian exactly when its transition functors have left adjoints (HTT, Cor. 5.2.2.5); between presentable ∞-categories this is the condition of §2.2.

*Needs:* §2.2.2, §5.1.1, §5.1.2; Part AdjunctionsAndLocalizations §1.3.3 (HTT, Cor. 5.2.2.5).

**5.1.4.** Prove that there is an equivalence `Pr^L ≃ (Pr^R)^op` which is the identity on objects and sends a colimit-preserving functor to its right adjoint; Lurie states it as a canonical bijection, for every simplicial set S, between the equivalence classes of functors `S → Pr^L` and of functors `S^op → Pr^R`, hence an isomorphism `Pr^L ≅ (Pr^R)^op` in the homotopy category of ∞-categories (HTT, Cor. 5.5.3.4, p. 485). Both sides classify presentable fibrations over S (§5.1.3 and the straightening theorem, HTT Thm. 3.2.0.1).

*Needs:* §5.1.3; Part Straightening §1.7.1 (HTT, Thm. 3.2.0.1).

### 5.2 Limits in `Pr^L` and `Pr^R`

**5.2.1.** Prove that `Pr^L` has small limits and that the inclusion `Pr^L ⊆ Ĉat∞` preserves them (HTT, Prop. 5.5.3.13, p. 488). Every limit is built from products and pullbacks (HTT, Prop. 4.4.2.6); these exist in `Ĉat∞`, stay presentable by §3.1 and §3.2, and the projections and the universal property stay colimit-preserving by §3.2.

*Needs:* §3.1.1, §3.2.3, §5.1.1; Part LimitsAndKanExtensions §6.5.4 (HTT, Prop. 4.4.2.6).

**5.2.2.** Prove that for a presentable fibration over a small S, the ∞-category of coCartesian sections is presentable (HTT, Cor. 5.5.3.14, p. 488). By §5.1 it is classified by `S → Pr^L`, and the coCartesian sections compute the limit in `Ĉat∞` (HTT, Cor. 3.3.3.2), which is presentable by §5.2.1.

*Needs:* §5.1.3, §5.2.1; Part Straightening §3.2.2 (HTT, Cor. 3.3.3.2).

**5.2.3.** Prove that for a Cartesian fibration `p : M → Δ[1]` with ∞-category of sections C and sections `e : X → Y`, `e' : X' → Y'`, if `e'` is p-Cartesian, evaluation at the vertex 1 induces a homotopy equivalence `Map_C(e, e') → Map_M(Y, Y')` (HTT, Lemma 5.5.3.15, p. 488). The mapping space of sections is a homotopy pullback of mapping spaces of M, and composition with the p-Cartesian `e'` identifies `Map_M(X, X')` with `Map_M(X, Y')` (HTT, Prop. 2.4.4.3).

*Needs:* Part CartesianFibrations §1.7.2 (HTT, Prop. 2.4.4.3).

**5.2.4.** Prove that the Cartesian sections form a reflective subcategory of C (HTT, Lemma 5.5.3.16, p. 489). For a section `e : X → Y`, choose a p-Cartesian `e' : X' → Y` over Y and the induced map of sections `e → e'` that is the identity at the vertex 1. By §5.2.3, both `Map_C(e', e'')` and `Map_C(e, e'')` are identified with `Map_M(Y, Y'')` for every Cartesian section `e''`, so `e → e'` is a reflection (HTT, Prop. 5.2.7.8, Rem. 5.2.7.9).

*Needs:* §5.2.3; Part AdjunctionsAndLocalizations §2.2.1 (HTT, Rem. 5.2.7.9) and §2.3.1 (HTT, Prop. 5.2.7.8).

**5.2.5.** Prove that for a presentable fibration `p : X → S` over a small S, the ∞-category `Map_S(S, X)` of sections is presentable and the full subcategory of Cartesian sections is an accessible localization of it (HTT, Prop. 5.5.3.17, p. 489). Sections are accessible (HTT, Cor. 5.4.7.17) with fiberwise colimits (HTT, Prop. 5.1.2.2). The Cartesian sections are an intersection over the edges of S (§4.6), and one edge reduces by pullback to S = Δ[1], where the Cartesian sections are equivalent to the fiber over 1 (HTT, Prop. 3.1.2.3) and reflective by §5.2.4; a presentable reflective subcategory is an accessible localization (§1.5).

*Needs:* §1.5.3, §4.6.4, §5.1.2, §5.2.4; Part CartesianFibrations §5.4.1 (HTT, Prop. 3.1.2.3); Part AdjunctionsAndLocalizations §2.2.1 (HTT, Rem. 5.2.7.9); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part AccessibleInfinityCategories §8.9.1 (HTT, Cor. 5.4.7.17).

**5.2.6.** Prove that `Pr^R` has small limits and that the inclusion `Pr^R ⊆ Ĉat∞` preserves them (HTT, Thm. 5.5.3.18, p. 490). For `χ : S^op → Pr^R` with S small, the classified Cartesian fibration is presentable (§5.1), its limit in `Ĉat∞` is the ∞-category of Cartesian sections (HTT, Cor. 3.3.3.2), which is presentable by §5.2.5, and the projections are accessible and limit-preserving.

*Needs:* §5.1.3, §5.2.5; Part Straightening §3.2.2 (HTT, Cor. 3.3.3.2); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2).

**5.2.7.** Prove the following. Let p : X → S be a presentable fibration over a small simplicial set S and C the full subcategory of `Map_S(S, X)` spanned by the Cartesian sections. For each vertex s, let ψ(s)_* : C → X_s be evaluation at s and ψ(s)^* a left adjoint. Then there is a diagram θ : S → `Fun(C, C)` with θ(s) equivalent to ψ(s)^* ∘ ψ(s)_* for every vertex s, such that the identity of C is a colimit of θ in `Fun(C, C)` (HTT, Lemma 6.3.3.7, p. 626).

The route is Lurie's. p extends to a presentable fibration over S^▷ classified by a colimit diagram S^▷ → `Pr^L`: `Pr^L` is anti-equivalent to `Pr^R` (§5.1), which has small limits computed in `Ĉat∞` (§5.2.6), and presentable fibrations correspond to diagrams in `Pr^L` (§5.1). This diagram is also a colimit diagram into `(Ĉat∞)^op`. Lurie states the lemma for any S; the limit in `Pr^R` exists for small S, which is the case §5.8 uses. The Cartesian sections over S^▷ are then equivalent both to C and to the fiber at the cone point. Choose a coCartesian natural transformation, componentwise coCartesian, from the evaluation map to the fiber at the cone point. Its restrictions are p-colimit diagrams by the following step, and relative colimits in a coCartesian fibration become colimits in the fiber. Colimits in functor ∞-categories are pointwise, which gives θ and identifies the identity as its colimit.

- **Cartesian sections over a colimit cone** (HTT, Lemma 6.3.3.6, p. 625). Let p : X → S^▷ be a Cartesian fibration classified by a colimit diagram S^▷ → `(Ĉat∞)^op` (the statement holds in every universe; here it is used for large ∞-categories), that is, by a limit diagram of ∞-categories indexed by (S^▷)^op, and let s : S^▷ → X be a Cartesian section. Then s is a p-colimit diagram. Invariance under change of base reduces to S an ∞-category. Fix an object x over the cone point and the constant diagram on it. It suffices that restriction along S ⊆ S^▷ is a homotopy equivalence of mapping spaces from s to that diagram. Choose a p-Cartesian transformation to the constant diagram from a Cartesian section, and compare with mapping spaces in the ∞-categories of Cartesian sections over S^▷ and over S; restriction between those is an equivalence because p is classified by a limit diagram.

*Needs:* §5.1.2 (HTT, Def. 5.5.3.2), §5.1.3 (HTT, Prop. 5.5.3.3), §5.1.4 (HTT, Cor. 5.5.3.4); §5.2.6 (HTT, Thm. 5.5.3.18); Tau Ceti `SSet.CartesianFibration`, `SSet.Edge.IsCartesian`; Part LimitsAndKanExtensions §7.1.1 (HTT, Def. 4.3.1.1); Part InfinityCategoryFoundations §5.2.1 (HTT, §1.2.2); Part CartesianFibrations §1.5.1 (HTT, §2.4.1, coCartesian edges), §1.7.2 (HTT, Prop. 2.4.4.2) and §5.5.3 (HTT, Prop. 3.1.2.1); Part Straightening §2.2.1 (HTT, Cor. 3.3.1.2) and §3.2.1 (HTT, Prop. 3.3.3.1); Part LimitsAndKanExtensions §7.3.1 (HTT, Prop. 4.3.1.9) and §8.2.2 (HTT, Prop. 5.1.2.2).

### 5.3 `Pr^L_κ`, `Pr^R_κ` and κ-good functors

**5.3.1.** Define `Pr^R_κ ⊆ Ĉat∞` as the subcategory whose objects are the κ-compactly generated ∞-categories and whose morphisms are the limit-preserving functors that preserve κ-filtered colimits (HTT, Def. 5.5.7.5, p. 521). Define `Pr^L_κ ⊆ Ĉat∞` as the subcategory whose objects are the κ-compactly generated ∞-categories and whose morphisms are the functors preserving small colimits and κ-compact objects; define `Ĉat∞^{Rex(κ)}` as the subcategory of ∞-categories with κ-small colimits and functors preserving them, and `Cat∞^{Rex(κ)}` as its intersection with `Cat∞` (HTT, Notation 5.5.7.7, p. 521). `Pr^L_κ` is not a full subcategory, since its morphisms are restricted. The functors in `Pr^L_κ` are the *κ-good* functors, those with a right adjoint preserving κ-filtered colimits (HA, Notation 5.3.2.8, p. 900).

- By §1.4, the anti-equivalence `Pr^L ≃ (Pr^R)^op` of §5.1 restricts to `Pr^L_κ ≃ (Pr^R_κ)^op`.
- `Pr^L_κ` is a subcategory of `Pr^L`, since κ-compactly generated ∞-categories are presentable.

**Checks.**

- For κ = ℵ₀, S is an object of `Pr^L_ℵ₀`; the functor `S → S`, `X ↦ X × A` for an infinite discrete A, preserves colimits but not compact objects (it sends the point to an infinite set), so it is a morphism of `Pr^L` and not of `Pr^L_ℵ₀`. A definition with the morphisms of `Pr^L` would accept it.
- Its right adjoint `Y ↦ Y^A` does not preserve filtered colimits, so it is a morphism of `Pr^R` and not of `Pr^R_ℵ₀`, matching the restricted anti-equivalence.
- The nerve of finite sets has finite colimits and is an object of `Cat∞^{Rex(ℵ₀)}`; the nerve of finite non-empty sets lacks an initial object and is not.

*Needs:* §1.4.2, §5.1.1, §5.1.4; §1.1.1 (HTT, Def. 5.5.7.1).

### 5.4 Presentability of `Cat∞(𝒦)`

**5.4.1.** Prove that `Cat∞^{Rex(κ)}` has small κ-filtered colimits and that the inclusion into `Cat∞` preserves them (HTT, Prop. 5.5.7.11, p. 522). Let C be the colimit in `Cat∞` of a κ-filtered diagram. Every κ-small diagram in C factors through a stage, since κ-small simplicial sets are κ-compact in `Cat∞` (HTT, Prop. 5.4.1.2, (3) ⇒ (5), for κ uncountable; for κ = ℵ₀, finite simplicial sets are ω-compact in `Cat∞` by Part AccessibleInfinityCategories §3.1, the case κ = ω for finite simplicial sets, ℵ₀-small simplicial sets being the finite ones); it remains that the stage functors preserve κ-small colimits. Reduce to a κ-filtered partially ordered set (HTT, Prop. 5.3.1.18) and a strict diagram of simplicial sets (HTT, Prop. 4.2.4.4), where the colimit is an ordinary filtered colimit, a homotopy colimit for the Joyal model structure (HTT, Thm. 4.2.4.1, applied to the large `(Set⁺_Δ)°` object by object, through small full subcategories, as in Part LimitsAndKanExtensions §3.3 (*Size*)), and colimit diagrams are tested by initial objects of slices, which commute with the filtered colimit.

*Needs:* §5.3.1; Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4), §3.2.1 (HTT, Thm. 4.2.4.1) and §3.3.1 (*Size*); Part PresheavesAndCompletions §4.4.1 (HTT, Prop. 5.3.1.18); Part AccessibleInfinityCategories §3.1.2 (HTT, Prop. 5.4.1.2, (3) ⇒ (5); the case κ = ω for finite simplicial sets).

**5.4.2.** For a small collection 𝒦 of simplicial sets, `Cat∞(𝒦)` is the subcategory of `Cat∞` of small ∞-categories with 𝒦-indexed colimits and functors preserving them, from Part AccessibleInfinityCategories §8.4 (HA, Def. 4.8.1.1, p. 707). Prove that `Cat∞(𝒦)` is presentable (HA, Lemma 4.8.4.2, first assertion, p. 731). Lurie's route: colimits in `Cat∞(𝒦)` are colimits in `Cat∞` with 𝒦-colimits adjoined along the relations given by the stages (§4.7). For an uncountable regular κ such that 𝒦 and each of its members are κ-small, and a regular τ ≫ κ with κ < τ, every object is the τ-filtered colimit of its τ-small sub-∞-categories with 𝒦-colimits, which are τ-compact because filtered colimits of simplicial sets compute colimits in `Cat∞` (HTT, Thm. 2.2.5.1, Thm. 4.2.4.1, the latter applied object by object, through small full subcategories, as in Part LimitsAndKanExtensions §3.3 (*Size*)); conclude by §1.6.

*Needs:* §1.6.1, §4.7.1 (HTT, Notation 5.3.6.1; Prop. 5.3.6.2); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, model structure part); Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1) and §3.3.1 (*Size*); Part AccessibleInfinityCategories §8.4.1 (HA, Def. 4.8.1.1).

### 5.5 The equivalence `Cat∞(𝒦) ≃ Pr^L_κ`

**5.5.1.** Prove that, with 𝒦 the κ-small simplicial sets together with the simplicial set `Idem` of HTT §4.4.5: the functor `C ↦ Ind_κ(C)` is an equivalence `Cat∞(𝒦) → Pr^L_κ`; `Pr^L_κ` is presentable; and the inclusion `Pr^L_κ ⊆ Pr^L` preserves small colimits (HA, Lemma 5.3.2.9, p. 900). The objects of `Cat∞(𝒦)` are the idempotent complete small ∞-categories with κ-small colimits; `Ind_κ(D)` has κ-compact objects D (HTT, Lemma 5.4.2.4), and κ-good functors correspond to κ-small-colimit-preserving functors between κ-compact objects (HTT, Prop. 5.3.5.10, §1.6). Presentability follows from §5.4. `Ind_κ` preserves small colimits into `Pr^L` by §1.6: colimit-preserving functors out of `Ind_κ(colim D_i)` are determined by their restrictions to the `D_i`.

*Needs:* §1.6.1, §1.6.3, §5.1.1, §5.3.1, §5.4.2; Part PresheavesAndCompletions §6.5.3 (HTT, Prop. 5.3.5.10); Part AccessibleInfinityCategories §4.4.1 (HTT, Lemma 5.4.2.4) and §8.4.1 (HA, Def. 4.8.1.1).

### 5.6 Compact objects in families

**5.6.1.** Write `Cat∞^{rex, idem}` for the subcategory of `Cat∞` of idempotent complete small ∞-categories with finite colimits and functors preserving finite colimits. Prove that its inclusion into `Cat∞` preserves filtered colimits (HA, Lemma 7.3.5.10, p. 1324).

**Checks.**

- The nerve of finite sets is an object: it has finite colimits and idempotents split. The nerve of non-empty finite sets is idempotent complete but has no initial object, so it is not; a definition by idempotent completeness alone would accept it.
- The ∞-category of finite spaces has finite colimits but is not idempotent complete (Wall's finiteness obstruction gives retracts of finite spaces that are not finite), so it is not an object; its idempotent completion, the compact spaces, is. A definition by finite colimits alone would accept it.
- The functor from the nerve of finite sets to itself, `X ↦ X ⊔ 1`, preserves pushouts but not the initial object, so it is not a morphism.

The route: for a filtered diagram with colimit C in `Cat∞`, C has finite colimits and the stage functors preserve them, as in §5.4 with κ = ℵ₀, finite diagrams factoring through a stage because finite simplicial sets are ω-compact in `Cat∞` (Part AccessibleInfinityCategories §3.1, the case κ = ω for finite simplicial sets); and C is idempotent complete because idempotents are indexed by `Idem`, whose finite skeleta make it ℵ₀-compact in the needed sense (HTT, Cor. 4.4.5.21), and filtered colimits are computed strictly (HTT, Prop. 5.3.1.18, Prop. 4.2.4.4, Thm. 2.2.5.1).

*Needs:* §5.4.1; Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, model structure part); Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4); Part PresheavesAndCompletions §4.4.1 (HTT, Prop. 5.3.1.18) and §6.6.2 (HTT, Cor. 4.4.5.21); Part AccessibleInfinityCategories §3.1.2 (the case κ = ω for finite simplicial sets).

**5.6.2.** Prove that for a coCartesian fibration `q : C → D` with compactly generated fibers, transition functors preserving compact objects, D with small filtered colimits, and classifying functor `χ : D → Pr^L` preserving small filtered colimits, the restriction `q'` of q to the full subcategory `C^c` of objects compact in their fiber is a coCartesian fibration, its coCartesian morphisms are the q-coCartesian morphisms in `C^c`, and the functor `D → Cat∞` classifying `q'` preserves filtered colimits (HA, Lemma 7.3.5.11, p. 1326). The first two assertions are fiberwise. For the third, `q'` is classified by `χ'` with values in `Cat∞^{rex, idem}` and `χ ≃ Ind ∘ χ'`; §5.5 with κ = ℵ₀ makes `Ind` a colimit-preserving equivalence onto `Pr^L_ℵ₀`, so `χ'` preserves filtered colimits into `Cat∞^{rex, idem}`, hence into `Cat∞` by §5.6.1.

*Needs:* §5.1.1, §5.5.1, §5.6.1; Part CartesianFibrations §1.5.1 (HTT, §2.4.1, coCartesian edges).

### 5.7 Compactly assembled ∞-categories

Compact generation asks that an ∞-category be `Ind` of its compact objects. Compact assembly weakens this to a retract of some `Ind(C₀)` through functors that preserve filtered colimits; the main result recognizes it intrinsically, by a left adjoint to the colimit functor on Ind-objects.

**5.7.1.** Two pieces of notation come first.

- Write `Ĉat∞^ω` for the subcategory of `Ĉat∞` whose objects are the accessible ∞-categories with small filtered colimits and whose morphisms are the functors preserving small filtered colimits (SAG, Notation 21.1.1.4, p. 1583). It contains the equivalences and is closed under composition, so it is a subcategory in the sense of Part InfinityCategoryFoundations §1.2.
- For an ∞-category C that need not be small, write `Ind(C)` for the smallest full subcategory of `Fun(C^op, Ŝ)` that contains the essential image of the Yoneda embedding `j : C → Fun(C^op, Ŝ)` and is closed under small filtered colimits (SAG, Def. 21.1.2.5, p. 1585). For a small C this is the `Ind(C)` of Part PresheavesAndCompletions §6.1 (HTT, Def. 5.3.5.1), through `P(C) ⊆ Fun(C^op, Ŝ)`, because `Ind(C)` is already closed under filtered colimits in `P(C)` and consists of filtered colimits of representables (SAG, Rem. 21.1.2.6, p. 1585; HTT, Prop. 5.3.5.3, Cor. 5.3.5.4). For a locally small C, `Ind(C)` lies in `Fun(C^op, S)`, since representables are valued in essentially small spaces and these are closed under small filtered colimits (SAG, Rem. 21.1.2.7, pp. 1585–1586). The Checks of the definition below witness this notation.

Define an ∞-category C to be **compactly assembled** when there are a small ∞-category C₀ and functors `U : C → Ind(C₀)` and `V : Ind(C₀) → C`, both preserving small filtered colimits, with `V ∘ U` equivalent to `id_C`, and C has small filtered colimits. By the first bullet below, this says exactly that C is a retract of `Ind(C₀)` in `Ĉat∞^ω` (SAG, Def. 21.1.2.1, p. 1584).

- **Accessibility is automatic** (SAG, Rem. 21.1.2.2, p. 1584). If C has small filtered colimits and is a retract of `Ind(C₀)` through filtered-colimit-preserving U and V, then C is accessible, so it is an object of `Ĉat∞^ω`. Lurie's route: C is the limit of the tower `⋯ → Ind(C₀) → Ind(C₀)` whose transition maps are all `U ∘ V`, and limits of accessible ∞-categories along accessible functors are accessible (HTT, Prop. 5.4.7.3). One way to see the limit: the pair (U, V) with `V ∘ U ≃ id_C` is a weak retraction diagram in `Ĉat∞`, which extends to a strong one (HTT, Cor. 4.4.5.7); its value at the retract is a limit of the underlying idempotent on `Ind(C₀)` (HTT, Rem. 4.4.5.13), and that limit may be computed along the tower (HTT, Prop. 4.4.5.17, dual form). `U ∘ V` preserves filtered colimits between accessible ∞-categories, so it is a morphism of `Acc` for a large enough cardinal (HTT, Rem. 5.4.2.13).
- `Ind(C₀)` is compactly assembled for every small C₀ (take U and V the identity), and therefore so is every compactly generated ∞-category, which is `Ind` of its essentially small subcategory of compact objects (SAG, Ex. 21.1.2.3, p. 1585; HTT, Prop. 5.4.2.2).
- Every compactly assembled ∞-category has small filtered colimits, hence is idempotent complete (HTT, Rem. 5.3.1.10).
- Compact assembly is invariant under equivalence of ∞-categories, and C₀ may be replaced by an equivalent small ∞-category.

**Checks.**

- The empty ∞-category is compactly assembled: filtered simplicial sets are non-empty, so it has every small filtered colimit vacuously, and it is `Ind(∅)`. It is not presentable, having no initial object. A definition requiring small colimits, or presentability, would exclude it.
- The nerve of the real interval [0, 1] is compactly assembled but not compactly generated. Its only compact object is 0, since x > 0 is the directed join of [0, x) and lies below none of its members; so a definition by compact generation would exclude it. Since `Ind` of the nerve of a poset P is the nerve of the poset of ideals (non-empty directed down-sets) of P (filtered colimits of (−1)-truncated presheaves are (−1)-truncated), one may take C₀ = [0, 1], V the join of an ideal, and U sending x to the ideal `[0, x) ∪ {0}`. U preserves directed joins (an element strictly below the join of a directed set D is strictly below some member of D), and `V ∘ U` is the identity.
- The nerve of the lattice O(ℚ) of open subsets of the rationals is presentable (a small poset with all joins, in which every element is κ-compact for κ larger than the cardinality of the poset) but not compactly assembled. Choose rationals qₖ in a non-empty open interval converging to an irrational number, and let Wₙ be ℚ with qₙ, qₙ₊₁, … removed: the Wₙ are open, increasing, and their union is ℚ, but no Wₙ contains the interval. So the only open set V such that every directed open cover of ℚ has a member containing V is ∅. A left adjoint F to the join map from ideals to O(ℚ) would make F(ℚ) the smallest ideal whose join contains ℚ; it lies in the ideal generated by every such chain (Wₙ), so its join is ∅, a contradiction. By condition (3) of §5.7.3, O(ℚ) is not compactly assembled, so accessibility with small filtered colimits does not suffice.
- For the nerve of ℕ, `Ind` is the nerve of ℕ ∪ {∞} (the ideal ℕ is not principal), so the essential image of the Yoneda embedding is not closed under filtered colimits; a definition of `Ind` without the closure would give ℕ back. For C = Δ[0], `Ind(C)` is Δ[0], because a filtered colimit of points in S is a point; closing the representables under all small colimits would give S instead.
- For C = BG with G a group whose underlying set is not u-small, `j(∗)` takes the value G, which is not essentially small, so `Ind(C)` must sit in `Fun(C^op, Ŝ)`; a definition inside `Fun(C^op, S)` would lose the representable.
- For C the large ordered set of u-small ordinals, `Ind(C)` adds one object for each limit ordinal λ (the ideal of ordinals below λ, the colimit of a small cofinal set) and none for C itself, which has no small cofinal subset; closing under large filtered colimits would add a top object.
- The nerve of the large ordered set of u-small ordinals has all small filtered colimits (suprema) but is not an object of `Ĉat∞^ω`: every successor ordinal is compact, so for no κ are its κ-compact objects essentially small, and it is not accessible. A definition of `Ĉat∞^ω` asking only for small filtered colimits would admit it.

*Needs:* Part InfinityCategoryFoundations §7.1.2 (`Ŝ`); Part PresheavesAndCompletions §6.1.2 (HTT, Def. 5.3.5.1); Part PresheavesAndCompletions §2.2.2 (HTT, Cor. 4.4.5.7), §2.3.1 (HTT, Rem. 4.4.5.13), §2.4.1 (HTT, Prop. 4.4.5.17, dual form), §4.3.1 (HTT, Rem. 5.3.1.10), §6.4.1 (HTT, Prop. 5.3.5.3) and §6.4.2 (HTT, Cor. 5.3.5.4); Part AccessibleInfinityCategories §5.1.1 (HTT, Prop. 5.4.2.2), §5.2.4 (HTT, Rem. 5.4.2.13), §8.5.1 (HTT, Def. 5.4.2.14) and §8.6.1 (HTT, Prop. 5.4.7.3); Tau Ceti `SSet.catInfty`.

**5.7.2.** The theorem of §5.7.3 uses the following facts about `Ind(C)` for a C that need not be small. Such a C lies in `SSet.{u+1}`, so it is small for the universe u+1, and `Fun(C^op, Ŝ)` is its presheaf ∞-category for that universe. The earlier Parts fix an arbitrary universe u, so each of their statements also holds with u+1 in place of u; "one universe up" below means that instance. Write `jC ⊆ Ind(C)` for the essential image of j, equivalent to C by Yoneda (HTT, Prop. 5.1.3.1, one universe up).

- **Existence and minimality** (SAG, Def. 21.1.2.5, p. 1585). The intersection of all full subcategories of `Fun(C^op, Ŝ)` that contain `jC`, are stable under equivalence and are closed under small filtered colimits again has these properties, so `Ind(C)` exists. `Fun(C^op, Ŝ)` has small colimits, computed pointwise (HTT, Prop. 5.1.2.2 and Cor. 4.2.4.8, one universe up), so `Ind(C)` has small filtered colimits, computed in `Fun(C^op, Ŝ)`. The resulting *minimality principle* is used throughout: a full subcategory of `Ind(C)` that is stable under equivalence, contains `jC` and is closed under small filtered colimits is all of `Ind(C)`.
- **Universal property** (SAG, Rem. 21.1.2.8, p. 1586). For every ∞-category D with small filtered colimits, restriction along j is an equivalence from the full subcategory `Fun^ω(Ind(C), D)` of `Fun(Ind(C), D)` spanned by the functors preserving small filtered colimits to `Fun(C, D)`. The functor `Ind(C) → D` extending `f : C → D` is the *Ind-extension* of f. Lurie derives this from HTT Rem. 5.3.5.9; the route is the proof of HTT Lemma 5.3.5.8 one universe up, with the minimality principle in place of HTT Cor. 5.3.5.4, in three steps.
  1. *Embedding.* D, like C, lies in `SSet.{u+1}`. HTT Lemma 5.3.5.7, one universe up, gives a fully faithful `i : D → D'` into an ∞-category with colimits indexed by all simplicial sets in `SSet.{u+1}`, such that a cocone in D indexed by such a simplicial set is a colimit exactly when its image is. Since D has small filtered colimits, the essential image of i is closed under small filtered colimits in D'; and i, being fully faithful, reflects colimits of every shape.
  2. *Existence.* For `f₀ : jC → D`, HTT Lemma 5.1.5.5, one universe up, gives a colimit-preserving `F : Fun(C^op, Ŝ) → D'` that is a left Kan extension of `i ∘ f₀`. By step 1 and the minimality principle, F carries all of `Ind(C)` into the essential image of i, so it restricts to `f : Ind(C) → D`. This f preserves small filtered colimits, since F does and i reflects them, and it is a left Kan extension of `f₀`, since `Ind(C)` is a full subcategory, so the diagrams `jC ×_{Ind(C)} Ind(C)_{/X}` are those computed in `Fun(C^op, Ŝ)`, and i reflects their colimits.
  3. *Characterization.* Let `g : Ind(C) → D` preserve small filtered colimits and let f be the left Kan extension of `g|jC` from step 2. Left Kan extension is left adjoint to restriction (HTT, Prop. 4.3.2.17), so there is a transformation `α : f → g` that is an equivalence on `jC`. The objects at which α is an equivalence satisfy the minimality principle, because f and g preserve small filtered colimits; so α is an equivalence and g is a left Kan extension of `g|jC`. Hence `Fun^ω(Ind(C), D)` is the full subcategory of left Kan extensions of functors on `jC`, every functor on `jC` has one, and restriction to `Fun(jC, D) ≃ Fun(C, D)` is a trivial fibration (HTT, Prop. 4.3.2.15, Cor. 4.3.2.16).
- **Functoriality** (SAG, Ex. 21.1.2.9, p. 1586). For `f : C → D`, let `Ind(f) : Ind(C) → Ind(D)` be the Ind-extension of `C → D ⊆ Ind(D)`. It is the restriction of the colimit-preserving extension `Fun(C^op, Ŝ) → Fun(D^op, Ŝ)` of the composite of f with the Yoneda embedding of D, which is left adjoint to restriction along `f^op` (HTT, Prop. 5.2.6.3, one universe up): that extension carries `Ind(C)` into `Ind(D)` by the minimality principle and preserves small filtered colimits, so it restricts to the Ind-extension by the uniqueness in the universal property. If f is fully faithful, so is `Ind(f)`, by the argument of HTT Prop. 5.3.5.11 (1) with the minimality principle in place of the smallness of C. A representable `j(d)` is compact in `Ind(D)`, because `Map(j(d), −)` is evaluation at d (HTT, Lemma 5.1.5.2, one universe up) and filtered colimits in `Ind(D)` are computed pointwise. So the map `Map(X, Y) → Map(Ind(f)X, Ind(f)Y)` is an equivalence for X and Y in `jC`, since f is fully faithful. It is then one for X in `jC` and every Y, since both sides preserve small filtered colimits in Y, and finally for every X, since both sides carry small filtered colimits in X to limits. When C and D have small filtered colimits and f preserves them, the Ind-extensions `G_C : Ind(C) → C` and `G_D` of the identities satisfy `G_D ∘ Ind(f) ≃ f ∘ G_C`, as both sides preserve small filtered colimits and restrict to f on C.
- **Union of small pieces** (SAG, proof of Thm. 21.1.2.10, p. 1589). For an essentially small full subcategory `C₀ ⊆ C`, functoriality identifies `Ind(C₀)`, the `Ind` of Part PresheavesAndCompletions §6.1 by the agreement above, with a full subcategory of `Ind(C)` that is closed under small filtered colimits. Every object of `Ind(C)` lies in one of these subcategories. The union of their essential images contains `jC`, and a small filtered diagram in it lies in `Ind(C₀)` for the union C₀ of the small set of pieces that its vertices need, which is again essentially small; so the minimality principle applies.
- **Filtered colimits through j** (SAG, Rem. 21.1.2.11, pp. 1586–1587). C has small filtered colimits exactly when `j : C → Ind(C)` has a left adjoint, which is then the Ind-extension `G_C` of `id_C`. If j has a left adjoint L, then `L ∘ j ≃ id_C` because j is fully faithful, so L carries the colimit in `Ind(C)` of a small filtered diagram of representables to a colimit of the diagram in C. Conversely, `Map(G_C X, c)` and `Map(X, j c)` agree for X in `jC` and both carry small filtered colimits in X to limits, so the minimality principle and the pointwise criterion for adjoints give `G_C ⊣ j`. So conditions (2) and (3) of §5.7.3 say together that j has a left adjoint which itself has a left adjoint. With accessibility dropped, these two conditions are the ∞-categorical form of Johnstone and Joyal's continuous categories (SAG, Rem. 21.1.2.12, p. 1587), of which the second and third Checks above are the continuous-lattice cases.

*Needs:* §5.7.1; Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, universes) and §7.1.2 (`Ŝ`); Part LimitsAndKanExtensions §3.3.1 (HTT, Cor. 4.2.4.8), §7.4.6 (HTT, Prop. 4.3.2.15, Cor. 4.3.2.16) and §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1; Lemma 5.1.5.2), §1.4.2 (HTT, Lemma 5.1.5.5), §1.5.3 (HTT, Prop. 5.2.6.3) and §6.5.1 (HTT, Lemma 5.3.5.7; the arguments of Lemma 5.3.5.8 and Prop. 5.3.5.11); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5), §1.6.1 (HTT, Prop. 5.2.4.2) and §1.8.1 (HTT, Prop. 4.3.2.17); Tau Ceti `SSet.coslice.IsColimit`.

**5.7.3.** Prove that an ∞-category C is compactly assembled exactly when (1) C is accessible, (2) C has small filtered colimits, and (3) the Ind-extension `G : Ind(C) → C` of `id_C` has a left adjoint `F : C → Ind(C)` (SAG, Thm. 21.1.2.10, p. 1586; proof, pp. 1588–1589).

The route is Lurie's, through two auxiliary statements.

- **The case `Ind(C₀)`** (SAG, Ex. 21.1.2.13, p. 1587). For a small C₀ and C = `Ind(C₀)`, conditions (1) and (2) hold, and G has a left adjoint F, the Ind-extension of the composite `C₀ → Ind(C₀) → Ind(Ind(C₀))` of Yoneda embeddings. To identify `Map(F(X), Y)` with `Map(X, G(Y))` naturally in X and Y, note that both sides turn filtered colimits in X into limits, so X may be taken compact, a retract of a representable `j(c)`; both sides then preserve filtered colimits in Y, so Y may be taken compact in `Ind(C)`, a representable on an object of C (C is idempotent complete), and then both sides are mapping spaces of C.
- **Retracts of right adjoints** (SAG, Lemma 21.1.2.14, pp. 1587–1588). Let `G : A → B` be a retract, in `Fun(Δ[1], Ĉat∞)`, of a functor `G' : A' → B'` with a left adjoint F', and let A be idempotent complete. Then G has a left adjoint. For an object b of B, with retraction data `U : A → A'`, `U' : B → B'`, `V : A' → A`, `V' : B' → B`, the functor `a ↦ Map(b, G a)` is a retract in `Fun(A, Ŝ)` of the functor corepresented by `V F' U' b`, through the maps induced by U, U', the adjunction `F' ⊣ G'` and V, V'. Since A is idempotent complete, retracts of corepresentable functors are corepresentable (the Yoneda embedding is fully faithful and idempotents in A split), and the dual of the representability criterion for adjoints (HTT, Prop. 5.2.4.2) gives the left adjoint.

Forward direction: C has filtered colimits by definition and is accessible by the first bullet of §5.7.1. Write C as a retract of `C' = Ind(C₀)` in `Ĉat∞^ω`. By functoriality, `Ind(U)` and `Ind(V)` exhibit G as a retract of the Ind-extension `G'` of `id_{C'}` in `Fun(Δ[1], Ĉat∞)`: by the universal property, 2-cells between functors out of `Ind(C)` that preserve small filtered colimits are determined by their restrictions to C, so the equivalence `V ∘ U ≃ id_C` makes the composite retraction equivalent to the identity of G. `G'` has a left adjoint by the first auxiliary statement; `Ind(C)` is idempotent complete because it has filtered colimits, so the second auxiliary statement applies. Converse: let F be the left adjoint of G. The Yoneda embedding j, right adjoint to G, is fully faithful, so `G ∘ j ≃ id_C`, and `G ∘ F`, a left adjoint of `G ∘ j`, is equivalent to `id_C`. By (1) a small set of objects `Xα` generates C under small filtered colimits (HTT, Prop. 5.4.2.2); each `F(Xα)`, a small filtered colimit of representables, lies in `Ind(C₀)` for one essentially small full C₀ ⊆ C, which can be chosen for all α together. F preserves filtered colimits as a left adjoint, and `Ind(C₀)` is closed under them in `Ind(C)` (functoriality), so F factors through `F₀ : C → Ind(C₀)`; with `G₀ = G|Ind(C₀)`, `G₀ ∘ F₀ ≃ id_C` exhibits C as a retract of `Ind(C₀)` in `Ĉat∞^ω`.

*Needs:* §5.7.1 and §5.7.2 (SAG, Def. 21.1.2.1, Rem. 21.1.2.2; Def. 21.1.2.5, Rems. 21.1.2.8, 21.1.2.11, Ex. 21.1.2.9); Mathlib `CategoryTheory.Bicategory.Adjunction.comp` (composition of adjunctions, HTT Prop. 5.2.2.6); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5), §1.6.1 (HTT, Prop. 5.2.4.2, dual form) and §2.3.1 (HTT, Prop. 5.2.7.4); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1; Lemma 5.1.5.2), §2.3.2 (HTT, Cor. 4.4.5.15) and §4.3.1 (HTT, Rem. 5.3.1.10); Part AccessibleInfinityCategories §4.4.1 (HTT, Lemma 5.4.2.4) and §5.1.1 (HTT, Prop. 5.4.2.2).

### 5.8 Limits in `Pr^R_κ`

**5.8.1.** Prove that, for a regular cardinal κ, the ∞-category `Pr^R_κ` of κ-compactly generated ∞-categories and κ-continuous limit-preserving functors (§5.3) admits small limits, and that the inclusion `Pr^R_κ ⊆ Ĉat∞` preserves them (HTT, Prop. 5.5.7.6, p. 521). The route is Lurie's. Limits in `Pr^R` exist and are computed in `Ĉat∞` (§5.2, HTT Thm. 5.5.3.18). Given a small diagram of κ-compactly generated ∞-categories `C_α` with limit C, the projections `G_α : C → C_α` preserve κ-filtered colimits, since κ-filtered colimits in C are computed componentwise. Hence their left adjoints `F_α` preserve κ-compact objects (§1.4, HTT Prop. 5.5.7.2). By §5.2 (HTT, Lemma 6.3.3.7), applied to the presentable fibration classifying the diagram, the identity of C is a colimit of the composites `F_α ∘ G_α`, so C is generated under colimits by the images of the `F_α`. These are generated by κ-compact objects of C, so C is κ-compactly generated, and the limit cone lies in `Pr^R_κ`; a cone in `Pr^R_κ` over the diagram induces a functor into C that preserves κ-filtered colimits because the `G_α` jointly detect them.

*Needs:* §1.4.2 (HTT, Prop. 5.5.7.2), §5.2.6 (HTT, Thm. 5.5.3.18), §5.2.7 (HTT, Lemma 6.3.3.7), §5.3.1 (HTT, Def. 5.5.7.5); §1.1.1 (HTT, Def. 5.5.7.1); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5).

### Examples

- `S × S` is the product of S with itself in both `Pr^L` and `Pr^R`, hence also a coproduct in `Pr^L`; it is compactly generated, and by §5.8 it is also the product in `Pr^R_ℵ₀`, the projections preserving filtered colimits.
- `Pr^L_ℵ₀` contains S and `Fun(K, S)` for small K; under §5.5, S corresponds to the ∞-category of compact spaces (retracts of finite spaces), the idempotent completion of the finite colimits of the point; by Wall's finiteness obstruction it is strictly larger than the ∞-category of finite spaces.
- For D = Δ[0] in §5.6 the third assertion is trivial; the case D = `N(ℤ_{≥0})` with χ a sequence of compactly generated ∞-categories says that the compact objects of the colimit are the colimit of the compact objects.
- S and `P(C)` for small C are compactly generated, hence compactly assembled (§5.7); for S the left adjoint F of §5.7 sends a space X to `colim j(Xᵢ)` over a filtered diagram of compact spaces Xᵢ with colimit X, which is not `j(X)` unless X is compact.

### Dependencies

Layer 5 uses Layers 1–4, Part InfinityCategoryFoundations (subcategories, mapping spaces, the Joyal model structure), Part CartesianFibrations (coCartesian edges, mapping-space criteria, marked mapping objects), Part Straightening (the straightening theorem, change of base, limits in `Ĉat∞` as Cartesian sections), Part LimitsAndKanExtensions (homotopy colimits, finite limits, relative colimits, Kan extensions), Part PresheavesAndCompletions (idempotents and retraction diagrams; Yoneda, `Ind` and its universal property, used in §5.7 of this Part), Part AccessibleInfinityCategories (accessibility of sections, compactness in `Cat∞`, `Cat∞(𝒦)`; limits of accessible ∞-categories and the generator characterization, used in §5.7 of this Part) and Part AdjunctionsAndLocalizations (reflective subcategories; the representability criterion for adjoints, used in §5.7 of this Part); Tau Ceti `SSet.CartesianFibration`, `SSet.Edge.IsCartesian`.

## Layer 6: Truncation, Postnikov towers and left exact filtered colimits

### 6.1 Truncated objects and morphisms under limits, slices and diagonals

Truncated maps of Kan complexes, k-truncated morphisms of an ∞-category and monomorphisms are those of Part InfinityCategoryFoundations §10.7 (HTT, Def. 5.5.6.8, p. 512; Ex. 5.5.6.13, p. 513), which also proves that the (−2)-truncated morphisms are the equivalences, that a morphism `X → Y` with Y k-truncated is k-truncated exactly when X is (HTT, Lemma 5.5.6.14, p. 513), and hence that an object is k-truncated exactly when its map to a final object is. This section proves the properties that need limits, slices and coCartesian fibrations, for k ≥ −2.

**6.1.1.** Prove that in any ∞-category C, the full subcategory `τ_{≤k}C` of k-truncated objects is stable under all limits that exist in C (HTT, Prop. 5.5.6.5, p. 512). The Yoneda embedding into presheaves of large spaces preserves limits (HTT, Prop. 5.1.3.2), limits of presheaves are pointwise (HTT, Prop. 5.1.2.2), and in spaces they are built from products and homotopy pullbacks of Kan complexes (HTT, Prop. 4.4.2.6, Prop. 4.4.2.7, Thm. 4.2.4.1, the last applied to the large `Kan` object by object, through small full subcategories, as in Part LimitsAndKanExtensions §3.3 (*Size*)), which preserve k-truncatedness by the long exact sequence.

*Needs:* Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1), §3.3.1 (*Size*), §6.5.4 (HTT, Prop. 4.4.2.6, Prop. 4.4.2.7) and §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2); ModelCategoryTheory, Part KanQuillen §1.2.1 (the long exact sequence) and §5.1.1 (truncated Kan complexes).

**6.1.2.** Prove that a morphism `f : C → D` is k-truncated exactly when it is k-truncated as an object of `C_{/D}`, and that k-truncated morphisms are stable under pullback (HTT, Rem. 5.5.6.12, p. 513). The route is Lurie's, in three steps.

- *Step 1: truncated objects in a coCartesian fibration* (HTT, Rem. 5.5.6.6, p. 512). For a coCartesian fibration `p : C → D` of ∞-categories, an object that is k-truncated in its fiber and lies over a k-truncated object of D is k-truncated in C: mapping spaces of C fiber over those of D with fibers the mapping spaces of the fibers (HTT, Prop. 2.4.4.2), and the long exact sequence bounds the homotopy of the total space.
- *Step 2: truncated objects in a correspondence* (HTT, Rem. 5.5.6.7, p. 512). For a coCartesian fibration `p : M → Δ[1]`, regarded as a correspondence from `C = p⁻¹{0}` to `D = p⁻¹{1}`, and an object D that is k-truncated in D (k ≥ −2): D is k-truncated in M; an object C of C with a p-Cartesian morphism `C → D` is k-truncated in C; and for k ≥ −1 such a C is also k-truncated in M. The first assertion is Step 1, the vertex 1 of Δ[1] being final. Composition with the p-Cartesian morphism identifies `Map_C(C', C)` with `Map_M(C', D)` for `C'` in C (HTT, Prop. 2.4.4.3), and `Map_M(D', C)` is empty for `D'` in D, which is k-truncated for k ≥ −1. At k = −2 the conclusion in M fails, because the empty space is not contractible; the conclusion in C, which is what pullback stability uses, holds for every k. Lurie asserts the conclusion in M for every k.
- *Step 3: slices and pullbacks.* Mapping spaces in `C_{/D}` are homotopy fibers of mapping spaces of C: `C_{/D} → C` is a right fibration (HTT, Prop. 2.1.2.1), its fibers compare with mapping spaces (HTT, Lemma 2.1.3.3, dual form), and the comparison of the slice with the fat slice (HTT, Prop. 4.2.1.5) identifies the fibers in question. Evaluation `Fun(Δ[1], C) → Fun({1}, C)` is a coCartesian fibration with fiber `C_{/D}` over D (the dual of HTT Cor. 2.4.7.12); over a morphism `D' → D`, a pullback square is a Cartesian edge of the restricted correspondence, so Step 2 applies to it. The Cartesian property is a mapping-space statement: for an object `Y → D'` of `C_{/D'}`, maps over `D'` into `X ×_D D'` are equivalent to maps over D into X, by the universal property of the pullback, and this equivalence is composition with the edge `X ×_D D' → X`.

*Needs:* Part InfinityCategoryFoundations §4.2.1 (HTT, Prop. 2.1.2.1), §5.3.1 (HTT, Lemma 2.1.3.3) and §10.7.1 (HTT, Def. 5.5.6.8); Part CartesianFibrations §1.5.1 (coCartesian fibrations, HTT §2.4.1, p. 136), §1.7.2 (HTT, Prop. 2.4.4.2, Prop. 2.4.4.3, the mapping-space criterion for Cartesian edges), §4.1.1 (HTT, Def. 2.3.1.3) and §4.4.2 (HTT, Cor. 2.4.7.12); Part LimitsAndKanExtensions §1.2.1 (HTT, Prop. 4.2.1.5); ModelCategoryTheory, Part KanQuillen §1.2.1 (the long exact sequence).

**6.1.3.** Prove that f is a monomorphism exactly when the induced functor `C_{/f} → C_{/D}` is fully faithful (HTT, Ex. 5.5.6.13, p. 513). Identify `C_{/f}` with `(C_{/D})_{/f}` (HTT, Prop. 1.2.9.2). The projection `(C_{/D})_{/f} → C_{/D}` is a right fibration whose fiber over an object `E → D` is a model of the mapping space from `E → D` to f in `C_{/D}` (HTT, Prop. 2.1.2.1, Lemma 2.1.3.3), and a right fibration is fully faithful exactly when its fibers are empty or contractible. By §6.1.2, f is (−1)-truncated exactly when all these mapping spaces are empty or contractible.

*Needs:* §6.1.2; Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2), §4.2.1 (HTT, Prop. 2.1.2.1), §5.3.1 (HTT, Lemma 2.1.3.3) and §10.7.1 (HTT, Ex. 5.5.6.13).

**6.1.4.** Prove that for C with finite limits and k ≥ −1, f is k-truncated exactly when its diagonal `C → C ×_D C` is (k−1)-truncated (HTT, Lemma 5.5.6.15, p. 514): corepresentable functors preserve finite limits (HTT, Prop. 5.1.3.2), and for Kan complexes the homotopy fibers of the diagonal are loop spaces of those of f.

*Needs:* Part InfinityCategoryFoundations §10.7.1 (HTT, Def. 5.5.6.8); Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1); Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2); ModelCategoryTheory, Part KanQuillen §1.1 (homotopy groups).

**6.1.5.** Prove that a left exact functor between ∞-categories with finite limits carries k-truncated objects and morphisms to k-truncated ones (HTT, Prop. 5.5.6.16, p. 514), by induction on k: (−2)-truncated morphisms are equivalences, the diagonal criterion raises k by one, and an object is truncated exactly when its map to the final object is.

*Needs:* §6.1.4; Part InfinityCategoryFoundations §10.7.1 (HTT, Ex. 5.5.6.13) and §10.7.2 (HTT, Lemma 5.5.6.14).

### 6.2 Truncation functors

**6.2.1.** Prove that for presentable C and k ≥ −2, the inclusion `τ_{≤k}C ⊆ C` has an accessible left adjoint, written `τ_{≤k}`; in particular `τ_{≤k}C` is presentable (HTT, Prop. 5.5.6.18, p. 515). Lurie's route: let `F(C) = C ⊗ ∂Δ[k+2]` (§2.1), with `α : F → id`. F preserves colimits (colimits commute with colimits, HTT Lemma 5.5.2.3), so α viewed as a functor `C → Fun(Δ[1], C)` does (HTT, Prop. 5.1.2.2), and the set `{α(C)}` is generated under colimits by its values `S₀` on a small set of colimit generators of C (§1.6). By `Map(F(C), X) ≃ Map(C, X)^{∂Δ[k+2]}` (HTT, Cor. 4.4.4.9) and the boundary-sphere criterion for truncated Kan complexes (HTT, Lemma 5.5.6.17), the objects local for every `α(C)` are the k-truncated ones. Every `α(C)` is an `S₀`-equivalence: the `S₀`-equivalences form a strongly saturated class (§4.1, HTT Lemma 5.5.4.11), hence are closed under small colimits in `Fun(Δ[1], C)`, and they contain `S₀`. So the `S₀`-local objects are the k-truncated ones, and §4.4 gives the localization.

*Needs:* §1.6.1, §2.1.4, §4.1.2 (HTT, Lemma 5.5.4.11), §4.4.1; Part InfinityCategoryFoundations §10.8.1 (HTT, Lemma 5.5.6.17); Part LimitsAndKanExtensions §3.5.1 (HTT, Cor. 4.4.4.9), §8.2.2 (HTT, Prop. 5.1.2.2) and §8.2.3 (HTT, Cor. 5.1.2.3); Part PresheavesAndCompletions §5.2.1 (HTT, Lemma 5.5.2.3).

**6.2.2.** Prove that for presentable C and D with D equivalent to an (n+1)-category (HTT, Def. 2.3.4.1), composition with `τ_{≤n}` gives an equivalence `Fun^L(τ_{≤n}C, D) → Fun^L(C, D)` (HTT, Cor. 5.5.6.22, p. 516). Composition with `τ_{≤n}` is fully faithful by the universal property of localization at a small set (§4.4, HTT Prop. 5.5.4.20), so it suffices that a colimit-preserving `g : C → D` inverts the morphisms `C → τ_{≤n}C`; its right adjoint (§2.2) preserves limits (HTT, Prop. 5.2.3.5), hence n-truncated objects (§6.1), and every object of D is n-truncated because the mapping spaces of an (n+1)-category are n-truncated (HTT, Prop. 2.3.4.18).

*Needs:* §2.2.2, §4.4.2, §6.1.5, §6.2.1; Part InfinityCategoryFoundations §10.6.5 (HTT, Prop. 2.3.4.18); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Part PresheavesAndCompletions §1.5.1 (HTT, Def. 5.2.6.1).

**6.2.3.** Prove that for a left exact colimit-preserving `F : C → D` between presentable ∞-categories, there is an equivalence `F ∘ τ^C_{≤k} ≃ τ^D_{≤k} ∘ F` (HTT, Prop. 5.5.6.28, p. 518). F has a right adjoint G (§2.2), which is left exact (HTT, Prop. 5.2.3.5); so F and G both restrict to the k-truncated objects (§6.1). As functors `C → τ_{≤k}D`, the composites `τ^D_{≤k} ∘ F` and `F ∘ τ^C_{≤k}` have the right adjoints `G ∘ i_D` and `i_C ∘ G`, composites of adjunctions (HTT, Prop. 5.2.2.6), with `i_C`, `i_D` the inclusions of truncated objects; these right adjoints agree strictly, so the left adjoints are equivalent.

*Needs:* §2.2.2, §6.1.5, §6.2.1; Mathlib `CategoryTheory.Bicategory.Adjunction.comp` (HTT, Prop. 5.2.2.6); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5).

**6.2.4.** Prove that for a κ-compactly generated C and n ≥ −2, `τ_{≤n}C` is stable under κ-filtered colimits, so `τ_{≤n}` is κ-continuous and preserves κ-compact objects, `τ_{≤n}C` is κ-compactly generated, and its κ-compact objects are the retracts of truncations of κ-compact objects of C (HTT, Cor. 5.5.7.4, p. 520). An object is n-truncated as soon as its mapping spaces from κ-compact objects are, since the objects D with `Map(D, C)` n-truncated form a full subcategory stable under colimits (the presheaf represented by C preserves limits, and §6.1) containing the κ-compact generators. Mapping spaces out of κ-compact objects commute with κ-filtered colimits, and n-truncated Kan complexes are stable under filtered colimits because homotopy groups commute with filtered colimits; then apply §1.4 (HTT, Cor. 5.5.7.3) to the localization `τ_{≤n}`.

*Needs:* §1.4.3, §6.1.1, §6.2.1; Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2) and §1.4.4 (HTT, Def. 5.1.5.7); ModelCategoryTheory, Part KanQuillen §3.3.1 (filtered colimits).

### 6.3 Postnikov towers

**6.3.1.** Let C be presentable. Let `ℤ^∞_{≥0}` be the ordered set `ℤ_{≥0} ∪ {∞}`. Define a *tower* in C as a functor `N(ℤ^∞_{≥0})^op → C`, written `X_∞ → ⋯ → X_1 → X_0`, and a *Postnikov tower* as a tower in which each `X_∞ → X_n` exhibits `X_n` as `τ_{≤n}X_∞`. Define a *pretower* as a functor `N(ℤ_{≥0})^op → C` and a *Postnikov pretower* as one in which each `X_{n+1} → X_n` exhibits `X_n` as `τ_{≤n}X_{n+1}`. Let `Post⁺(C)` and `Post(C)` be the full subcategories of Postnikov towers and Postnikov pretowers. Postnikov towers in C *converge* when restriction `Post⁺(C) → Post(C)` is an equivalence (HTT, Def. 5.5.6.23, p. 516).

- Restriction carries Postnikov towers to Postnikov pretowers, since `τ_{≤n}τ_{≤n+1} ≃ τ_{≤n}`; every object extends to a Postnikov tower, unique up to contractible choice (§6.2).
- Postnikov towers are the coCartesian sections of a coCartesian fibration over `N(ℤ^∞_{≥0})^op` classifying `C → ⋯ → τ_{≤1}C → τ_{≤0}C`, so they converge exactly when C is the limit of `⋯ → τ_{≤1}C → τ_{≤0}C` in `Ĉat∞` (HTT, Rem. 5.5.6.24, p. 516): the `τ_{≤k}` are localizations (§6.2), and limits in `Ĉat∞` are coCartesian sections (HTT, Prop. 3.3.3.1). *Needs:* §6.2.1; Part Straightening §3.2.1 (HTT, Prop. 3.3.3.1, comparison).
- If Postnikov towers converge, every Postnikov tower is a limit diagram (HTT, Rem. 5.5.6.25, p. 517): mapping spaces in a limit of ∞-categories are limits of mapping spaces, and `Map(τ_{≤n}X, τ_{≤n}Y) ≃ Map(X, τ_{≤n}Y)`. *Needs:* the previous bullet.

**Checks.**

- In S, Postnikov towers converge: a Postnikov pretower is the restriction of the tower of its limit, whose i-th homotopy groups are those of `X_n` for n ≥ i. Asking only that towers be limit diagrams would say nothing about pretowers.
- In the nerve of sets every object is 0-truncated, so every Postnikov tower is constant and convergence holds; the condition at n = 0 forces `X_0 ≃ π₀(X_∞)`, which a condition imposed only for n ≥ 1 would miss.
- With the shifted indexing, asking `X_{n+1} → X_n` to exhibit `X_n` as `τ_{≤n+1}X_{n+1}`, the constant pretower at S¹ would qualify, since `τ_{≤n+1}S¹ ≃ S¹`; with the given indexing it fails at n = 0, where `τ_{≤0}S¹` is the point.

*Needs:* §6.2.1.

**6.3.2.** Prove that Postnikov towers in a presentable C converge exactly when, for every tower X, X is a Postnikov tower if and only if X is a limit diagram whose restriction is a Postnikov pretower (HTT, Prop. 5.5.6.26, p. 517). The towers of the second kind form a full subcategory whose restriction to pretowers is a trivial fibration (HTT, Prop. 4.3.2.15; limits of towers exist by §2.1), and the last bullet of §6.3.1 gives one inclusion.

*Needs:* §2.1.3, §6.3.1; Part LimitsAndKanExtensions §7.4.6 (HTT, Prop. 4.3.2.15).

**6.3.3.** Call a tower X *highly connected* when for every n there is k such that `τ_{≤n}X(∞) → τ_{≤n}X(k')` is an equivalence for all k' ≥ k, and a pretower Y highly connected when for every n there is k such that `τ_{≤n}Y(k'') → τ_{≤n}Y(k')` is an equivalence for k'' ≥ k' ≥ k. Prove that Postnikov towers and pretowers are highly connected, that a highly connected tower whose pretower is a Postnikov pretower is a Postnikov tower, and hence that the implication from the second condition to the first in §6.3.2 reduces to: a limit tower whose pretower is highly connected is highly connected (HTT, Rem. 5.5.6.27, p. 518). For the middle assertion, `τ_{≤n}X(∞) ≃ τ_{≤n}X(k)` for some k ≥ n, which is `X(n)` because the pretower is Postnikov.

**Checks.**

- In the nerve of sets, the tower with `X(∞) = X(0)` a point, `X(k)` a two-point set for 1 ≤ k < ∞, identities between the `X(k)` for k ≥ 1 and the inclusion of one point `X(∞) → X(k)`, is not highly connected: for n = 0 the map is a bijection at k' = 0 and at no k' ≥ 1. A definition asking for an equivalence at a single k, rather than at all k' ≥ k, would accept it.
- In the nerve of sets, the pretower with `Y(k) = {0, …, k}` and maps collapsing k + 1 onto k is not highly connected: no truncation `τ_{≤0}Y(k+1) → τ_{≤0}Y(k)` is a bijection. A definition asking only that the stages be eventually truncated would accept it.
- The Postnikov tower of the product of the spaces `K(ℤ, n)` over all n is highly connected with k = n, but no single k works for all n. A definition with k independent of n would reject this Postnikov tower.

*Needs:* §6.2.1, §6.3.1–6.3.2.

### 6.4 Postnikov completeness

**6.4.1.** Define a presentable ∞-category C to be **Postnikov complete** when the canonical functor `C → lim_n τ_{≤n} C`, sending an object to the tower of its truncations, is an equivalence; the limit is taken in `Ĉat∞` along the truncation functors (SAG, Def. A.7.2.1, p. 1828).

- This is the convergence of Postnikov towers of §6.3 (HTT, Def. 5.5.6.23, p. 516), as SAG records (SAG, Warn. A.7.2.2, p. 1828). The comparison is §6.3 (HTT, Rem. 5.5.6.24, p. 516): Postnikov towers are the coCartesian sections of the fibration classifying the tower of truncations, and restricting to finite stages identifies Postnikov pretowers with `lim_n τ_{≤n} C`. So the definition adds only the name.

**Checks.**

- S is Postnikov complete: a compatible tower of n-truncated spaces has as limit a space whose Postnikov tower it is. The limit must be taken in `Ĉat∞`: S and its truncations are not small, so a definition with the limit in `Cat∞` would not apply to S at all.
- The nerve of sets, regarded as the ∞-category of discrete spaces, is Postnikov complete, since every `τ_{≤n}` with n ≥ 0 is the identity on it. A definition indexing the limit from n = −1 changes nothing, the stages n ≥ 0 being cofinal; one using only the stage n = −1 would compare Set with the two-object poset of (−1)-truncated sets and fail.
- A presentable n-category C, n ≥ 0 finite, is Postnikov complete: its mapping spaces are (n−1)-truncated (Part InfinityCategoryFoundations §10.6; HTT, Prop. 2.3.4.18), so every object is (n−1)-truncated, `τ_{≤m}` is the identity of C for m ≥ n − 1, and the tower of truncations is constant from that stage on, with limit C. The converse fails: S is Postnikov complete and is not an n-category for any n. So Postnikov completeness does not reduce to having truncated mapping spaces.

*Needs:* §6.2.1 (HTT, Prop. 5.5.6.18); §6.3.1 (HTT, Def. 5.5.6.23, Rem. 5.5.6.24); §1.1.1 (HTT, Def. 5.5.0.1); Part InfinityCategoryFoundations §10.1.2 (HTT, Def. 2.3.4.1), §10.1.3 (HTT, Def. 5.5.6.1) and §10.6.5 (HTT, Prop. 2.3.4.18); Tau Ceti `SSet.catInfty`.

### 6.5 Left exact filtered colimits

**6.5.1.** Define, for a presentable ∞-category C: filtered colimits in C are left exact when, for every small filtered ∞-category I, the colimit functor `Fun(I, C) → C` is left exact (HTT, Def. 7.3.4.2, p. 787).

- Equivalently, colimits indexed by small filtered ∞-categories commute with finite limits in C.
- The condition is invariant under equivalence of presentable ∞-categories.

**Checks.**

- For I = Δ[0], which is filtered, the colimit functor is the identity of C and is left exact. The empty ∞-category is not filtered, because the empty diagram has no cocone in it. If it were allowed, the colimit functor `Fun(∅, C) ≃ Δ[0] → C` would pick an initial object, which is not left exact in S, since the initial object ∅ is not final.
- A definition asking filtered colimits to commute with all small limits would reject S. Let D_k(n) be Δ[0] for n ≥ k and ∅ otherwise, a diagram indexed by pairs of natural numbers k and n. Taking the colimit over n first and then the product over k gives Δ[0]. Taking the product first gives ∅ at every n, whose colimit is ∅.
- Let U be the complete lattice of closed subsets of the real line, ordered by inclusion, with the 0-category N(U), which is presentable. The increasing sequence of closed sets [1/k, 1] has join [0, 1], and meeting it with {0} gives {0}. The meets {0} ∩ [1/k, 1] are all empty, and so is their join. So filtered colimits in N(U) are not left exact, and the condition is a genuine restriction on presentable ∞-categories.

*Needs:* §1.1.1 (HTT, Def. 5.5.0.1); Part InfinityCategoryFoundations §1.2.4 (HTT, §1.2.13); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7); Mathlib instance `Quasicategory ((ihom K).obj C)`.

**6.5.2.** Prove that filtered colimits are left exact in S, and in τ≤n S for every n ≥ −2 (HTT, Ex. 7.3.4.4, p. 787). For S this is the commutation of filtered colimits with finite limits in S (HTT, Prop. 5.3.3.3). τ≤n S is presentable (§6.2) and closed in S under all limits (§6.1). It is also closed under filtered colimits: a space K is n-truncated exactly when the diagonal from K to its cotensor by ∂Δ[n+2] is an equivalence (HTT, Lemma 5.5.6.17), and that cotensor is a finite limit, which commutes with filtered colimits. Hence the colimit and limit functors of τ≤n S are those of S.

*Needs:* §6.5.1; §6.1.1 (HTT, Prop. 5.5.6.5); §6.2.1 (HTT, Prop. 5.5.6.18); Part InfinityCategoryFoundations §10.8.1 (HTT, Lemma 5.5.6.17); Part PresheavesAndCompletions §6.2.2 (HTT, Prop. 5.3.3.3); Part InfinityCategoryFoundations §7.1.2 (HTT, Def. 1.2.16.1) and §10.1.3 (HTT, Def. 5.5.6.1).

**6.5.3.** Prove that if C is presentable with left exact filtered colimits and K is any simplicial set, filtered colimits in `Fun(K, C)` are left exact (HTT, Ex. 7.3.4.5, p. 787). Lurie states this for arbitrary K: filtered colimits commute with finite limits in `Fun(K, C)` for every K, while `Fun(K, C)` is presentable, so that the definition applies verbatim, when K is small (§3.1). The relevant limits and colimits are computed pointwise (HTT, Prop. 5.1.2.2), so the colimit functor of `Fun(K, C)` over a filtered I is the colimit functor of C applied at each vertex of K.

*Needs:* §6.5.1; §3.1.2 (HTT, Prop. 5.5.3.6); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2).

**6.5.4.** Prove that if C is presentable with left exact filtered colimits and D ⊆ C is the essential image of an accessible left exact localization L, filtered colimits in D are left exact (HTT, Ex. 7.3.4.6, p. 787). D is presentable: it is accessible (HTT, Prop. 5.5.1.2), and its colimits are L applied to colimits in C. The colimit functor of D over a filtered I is the composite of the inclusion `Fun(I, D) ⊆ Fun(I, C)`, the colimit functor of C and L. The inclusion preserves limits, because D, the local objects for the class that L inverts (§1.5, HTT Prop. 5.2.7.4), is closed under the limits of C (§4.5), and the other two functors are left exact.

*Needs:* §6.5.1; §1.5.1 (HTT, Prop. 5.5.4.2), §1.5.3 (HTT, Prop. 5.5.1.2); §4.5.1 (closure of local objects under limits); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2) and §2.3.1 (HTT, Prop. 5.2.7.4); Part AccessibleInfinityCategories §4.1.2 (HTT, Def. 5.4.2.5).

### 6.6 Left exact filtered colimits in presheaf ∞-categories

**6.6.1.** Prove that for every small ∞-category C, filtered colimits in the presheaf ∞-category `P(C) = Fun(C^op, S)` are left exact: for every small filtered ∞-category I, the colimit functor `Fun(I, P(C)) → P(C)` preserves finite limits (HTT, Ex. 7.3.4.7, the case of a presheaf ∞-category, p. 788). Lurie states the example for every n-topos, 0 ≤ n ≤ ∞, and derives it from Exs. 7.3.4.4–7.3.4.6 through left exact localizations of `Fun(C, τ≤n−1 S)`; this section is the presheaf case, which is the case K = `C^op` of §6.5. The route is pointwise. `P(C)` is presentable (§1.6). Limits and colimits in `P(C)` and in `Fun(I, P(C))` are computed objectwise (HTT, Prop. 5.1.2.2), so the colimit functor of `P(C)` over I is, at each object c of C, the colimit functor of S over I applied to the evaluations at c, and the comparison map for a finite limit is, at c, the comparison map in S, an equivalence because filtered colimits commute with finite limits in S (HTT, Prop. 5.3.3.3). Equivalently, apply §6.5.2–6.5.3 (HTT, Exs. 7.3.4.4–7.3.4.5) with K = `C^op`.

*Needs:* §1.6.1, §6.5.1 (HTT, Def. 7.3.4.2); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §6.2.2 (HTT, Prop. 5.3.3.3).

### 6.7 `Cat∞` as a full subcategory of simplicial spaces

**6.7.1.** Prove that the functor `G : Cat∞ → Fun(N(Δ)^op, S)` with `G(C)([n]) = Map_{Cat∞}(Δ[n], C)` is fully faithful (HA, Prop. A.7.10, p. 1440). Its essential image consists of the complete Segal spaces (HA, Rem. A.7.11, p. 1440); only the full faithfulness is used in this Part. The route is Lurie's.

- `[n] ↦ Δ[n]` extends to a colimit-preserving `F : P(N(Δ)) → Cat∞` left adjoint to G (HTT, Thm. 5.1.5.6). It suffices to show that the counit `F ∘ G → id` is an equivalence.
- Model `Cat∞` by marked simplicial sets with the Cartesian model structure over a point (HTT, Prop. 3.1.3.7). Model `Fun(N(Δ)^op, S)` by bisimplicial sets with the injective model structure (HTT, Prop. A.2.8.2).
- The cosimplicial object `[n] ↦ (Δ[n])♭` is Reedy cofibrant, so the coend against it is a left Quillen functor from bisimplicial sets to marked simplicial sets, with right adjoint `X ↦ Hom((Δ[m])♭ × (Δ[n])♯, X)` in bidegree (m, n) (HTT, Ex. A.2.9.28). This adjunction induces `F ⊣ G` on underlying ∞-categories (HTT, Prop. 5.2.4.6; HA, Def. 1.3.4.15). The right adjoint is G: for fixed m, the simplicial set in the variable n is `Map^♯((Δ[m])♭, X)`, whose n-simplices are the maps `(Δ[n])♯ × (Δ[m])♭ → X`. That is the mapping Kan complex of the simplicial model category of marked simplicial sets, so for fibrant X it models `Map_{Cat∞}(Δ[m], X)`, by the identification `N((Set⁺_Δ)°) ≃ Cat∞`.
- Every bisimplicial set is cofibrant in the injective structure, so the derived counit at a fibrant X is the counit itself. A fibrant X is an ∞-category with its equivalences marked. The marked simplicial set `(Y, N) = F(G(X))` has as n-simplices the maps `Δ[n] × Δ[n] → X` carrying each edge of `{i} × Δ[n]` to an equivalence, and as marked edges those whose map `Δ[1] × Δ[1] → X` factors through the projection onto the second factor. The counit `(Y, N) → (X, M)` is restriction to the diagonal. Let `N'` be the edges of Y whose map `Δ[1] × Δ[1] → X` sends all four edges and the diagonal to equivalences. The counit factors as `(Y, N) → (Y, N') → (X, M)`, and it suffices, by two-out-of-three, that both maps are weak equivalences.
- *Re-marking.* `(Y, N) → (Y, N')` is a weak equivalence, because every edge α in `N'` is the long edge of a 2-simplex of Y whose two short edges lie in N: then `(Y, N')` is obtained from `(Y, N)` by pushouts of the marked anodyne map `Λ[2, 1]^♯ ⊔_{Λ[2, 1]^♭} Δ[2]^♭ → Δ[2]^♯`. To build the 2-simplex, write α as a commutative square in X whose edges are equivalences. The 2-simplex is a map `Δ[2] × Δ[2] → X^≃` into the core. It is prescribed, by identities and the edges of the square, on the full subcategory T of `Δ[2] × Δ[2]` spanned by all vertices except (0, 2), and on the square `Δ^{0,2} × Δ^{0,2} ≅ Δ[1] × Δ[1]` by α; the prescription makes the two short edges lie in N. The two prescriptions agree on their intersection, the 2-simplex spanned by (0, 0), (2, 0) and (2, 2), where T is given by q, p′ and the 2-simplex of α whose long edge is the diagonal. The map extends from `T ∪ (Δ^{0,2} × Δ^{0,2})` to `Δ[2] × Δ[2]` because `X^≃` is a Kan complex (Part InfinityCategoryFoundations §5.1) and the inclusion is a monomorphism and a weak homotopy equivalence: T is the nerve of a poset with least element (0, 0), the square is contractible, and their intersection is a simplex, so the union is weakly contractible, as is `Δ[2] × Δ[2]` (HA, proof of Prop. A.7.10, pp. 1441–1442).
- *Retraction onto the diagonal.* `(Y, N') → (X, M)` is an equivalence. For an n-simplex of `Δ[1] × Y`, a partition `[n] = [n]_− ∪ [n]_+` with a map `g : Δ[n] × Δ[n] → X`, define two homotopies `R_≤, R_≥ : Δ[1] × Y → Y` by precomposing g with the maps `Δ[n] × Δ[n] → Δ[n] × Δ[n]` that fix (i, j) when i ≤ j (respectively i ≥ j) or when j lies in `[n]_−` (respectively `[n]_+`), and otherwise send (i, j) to (i, i). `R_≤` is a homotopy from the identity to an idempotent `r_≤`, and `R_≥` one from an idempotent `r_≥` to the identity; as maps `(Y, N') × (Δ[1])♯ → (Y, N')` they exhibit the image of `r_≤`, and then the intersection of the images of `r_≤` and `r_≥`, as deformation retracts in marked simplicial sets, with the markings induced from `N'`. The counit restricted to that intersection is an isomorphism onto `(X, M)`. Deformation retracts along `(Δ[1])♯` are weak equivalences because the Cartesian model structure is simplicial for the tensor `K^♯ × −` (HA, proof of Prop. A.7.10, pp. 1442–1443).

*Needs:* Part InfinityCategoryFoundations §1.2 (HTT, §1.2.5, the core) and §7.1.2 (the ∞-category of spaces, HTT Def. 1.2.16.1); Part InfinityCategoryFoundations §5.1.2 (HTT, Prop. 1.2.5.3); Tau Ceti `TauCeti.MarkedSSet.markedAnodyneExtensions` (HTT, Def. 3.1.1.1), §5.5.2 (`Map^♯`, HTT §3.1.3), §5.7.1 (HTT, Prop. 3.1.3.7, the Cartesian model structure), §5.8.1 (HTT, Prop. 3.1.4.1, fibrant objects) and §5.8.3 (HTT, Cor. 3.1.4.4, the simplicial structure); Part LimitsAndKanExtensions §3.8.1 (`N((Set⁺_Δ)°) ≃ Cat∞`); Part AdjunctionsAndLocalizations §1.7.1 (HTT, Prop. 5.2.4.6) and §2.6.1 (HA, Def. 1.3.4.15); Part PresheavesAndCompletions §1.4.3 (HTT, Thm. 5.1.5.6); ModelCategoryTheory, Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1), §7.4.1 (HTT, Def. A.2.9.1) and §7.5.2 (HTT, Prop. A.2.9.19); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7); ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5), §2.6.1 (HTT, Prop. A.2.8.2) and §4.3.1 (HTT, Ex. A.2.9.28); Tau Ceti `SSet.catInfty`.

### 6.8 Left exact filtered colimits in `Cat∞`

**6.8.1.** Prove that filtered colimits in `Cat∞` commute with finite limits: for every small filtered ∞-category I, the colimit functor `Fun(I, Cat∞) → Cat∞` preserves finite limits (SAG, Lemma 4.5.3.1, p. 403). The route:

- Filtered colimits are left exact in `Fun(N(Δ)^op, S)`, the presheaf ∞-category on `N(Δ)` (§6.6). By §6.7, G is fully faithful, so it suffices that G preserves finite limits and filtered colimits: then G carries the comparison map from a filtered colimit of finite limits to the finite limit of the filtered colimits in `Cat∞` to the corresponding comparison map in `Fun(N(Δ)^op, S)`, an equivalence, and a fully faithful functor is conservative.
- `Cat∞` has finite limits and filtered colimits (Part LimitsAndKanExtensions §3.8). Finite limits are preserved because each `G(−)([n]) = Map(Δ[n], −)` is corepresentable, corepresentable functors preserve limits (HTT, Prop. 5.1.3.2), and limits in `Fun(N(Δ)^op, S)` are pointwise (HTT, Cor. 5.1.2.3).
- Filtered colimits are preserved because each `Δ[n]`, a finite simplicial set, is a compact object of `Cat∞` (Part AccessibleInfinityCategories §3.1, the case κ = ω for finite simplicial sets; SAG, proof of Lemma 4.5.3.1, p. 403), and colimits in `Fun(N(Δ)^op, S)` are pointwise.

*Needs:* §6.6.1, §6.7.1 (HA, Prop. A.7.10); Part LimitsAndKanExtensions §3.8.1 (limits and colimits in `Cat∞`) and §8.2.3 (HTT, Cor. 5.1.2.3); Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2); Part AccessibleInfinityCategories §3.1.2 (the case κ = ω for finite simplicial sets); Part InfinityCategoryFoundations §1.1 (smallness) and §2.1.8 (fully faithful functors); Part PresheavesAndCompletions §4.1.1 (filtered ∞-categories, HTT Def. 5.3.1.7) and §6.1.1 (compact objects, HTT Def. 5.3.4.5); Tau Ceti `SSet.catInfty`, `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`.

### Examples

- In S, `τ_{≤0}` is `π₀` regarded as a discrete space, and `τ_{≤−1}` sends a non-empty space to a point and ∅ to ∅.
- In `Fun(K, S)` for small K, truncation is computed pointwise, since pointwise truncation is left adjoint to the inclusion of pointwise truncated functors and these are the truncated objects.
- The functor `S → S`, `X ↦ X × A` for a fixed space A, preserves colimits but is not left exact when A is not contractible, since it does not preserve the final object; and `τ_{≤0}(X × A) ≃ π₀(X) × π₀(A)` differs from `π₀(X) × A` when A is not discrete. So the compatibility statement of §6.2 needs left exactness.
- For C = Δ[0], the simplicial space `G(Δ[0])` of §6.7 is constant at the point, since `Fun(Δ[n], Δ[0]) = Δ[0]`; for C a set regarded as a discrete ∞-category, `G(C)` is constant at that set, since `Fun(Δ[n], C) = C`.

### Dependencies

Layer 6 uses Layers 1–4 and §3.1, Part InfinityCategoryFoundations (spaces, truncated objects, truncated morphisms, the boundary-sphere criterion, n-categories), Part CartesianFibrations (coCartesian edges, correspondences, arrow ∞-categories, the Cartesian model structure), Part Straightening (limits in `Ĉat∞`), Part LimitsAndKanExtensions, Part AdjunctionsAndLocalizations, Part PresheavesAndCompletions (filtered ∞-categories, Yoneda, colimits in two variables, filtered colimits in spaces), Part AccessibleInfinityCategories (compactness in `Cat∞`), Tau Ceti `SSet.catInfty`, and ModelCategoryTheory (homotopy groups, truncated Kan complexes and the long exact sequence in Part KanQuillen; Reedy and injective structures for §6.7 of this Part).

## Layer 7: `P_Σ` and projectively generated ∞-categories

### 7.1 Product-preserving presheaves and `P_Σ`

**7.1.1.** Define, for a small ∞-category C with finite coproducts, `P_Σ(C) ⊆ P(C)` as the full subcategory of presheaves `C^op → S` that preserve finite products (HTT, Def. 5.5.8.8, p. 525).

- Representables lie in `P_Σ(C)`, since `Map(−, C)` carries coproducts of C to products of spaces.
- The empty presheaf is not in `P_Σ(C)`: a product-preserving presheaf sends the initial object of C to the point.

**Checks.**

- For C the nerve of finite sets, `P_Σ(C)` is S: a finite-product-preserving presheaf is determined by its value on a point. A definition using all presheaves would give `P(C)`, much larger than S.
- For C = Δ[0] (which has finite coproducts, all equal to the point), `P_Σ(C)` consists of the contractible presheaves, equivalent to Δ[0]; `P(C)` is S.
- For C the nerve of finitely generated free abelian groups, the 0-truncated objects of `P_Σ(C)` are the functors from finitely generated free abelian groups to sets, contravariant and carrying direct sums to products, which are the abelian groups. Without the product condition, the 0-truncated objects would be all presheaves of sets on free groups, a much larger category.

*Needs:* Part LimitsAndKanExtensions §8.1.1 (presheaves); Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2).

**7.1.2.** Prove the six properties of `P_Σ(C)` for small C with finite coproducts (HTT, Prop. 5.5.8.10, p. 525):

1. `P_Σ(C)` is an accessible reflective localization of `P(C)` (HTT, Prop. 5.5.8.10 (1), p. 525). It is the intersection of the strongly reflective subcategories cut out by the small family of product conditions, one for each finite family of objects of C, each the preimage of the limit diagrams of §4.6 under a restriction. *Needs:* §4.6.3 (HTT, Lemma 5.5.4.17), §4.6.4 (HTT, Lemma 5.5.4.18), §4.6.5 (HTT, Lemma 5.5.4.19); Part AdjunctionsAndLocalizations §2.2.1 (reflective subcategories).
2. j factors through `P_Σ(C)` and carries finite coproducts of C to finite coproducts of `P_Σ(C)` (HTT, Prop. 5.5.8.10 (2), p. 525), by Yoneda and the description of local objects. *Needs:* item 1; Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2).
3. For presentable D and `F ⊣ G` with `F : P(C) → D`, G factors through `P_Σ(C)` exactly when `F ∘ j` preserves finite coproducts (HTT, Prop. 5.5.8.10 (3), p. 525), because `G(D) ≃ Map_D(F j(−), D)`. *Needs:* Part PresheavesAndCompletions §1.3.3 (HTT, Lemma 5.1.5.2); Part AdjunctionsAndLocalizations §1.3.2 (HTT, Prop. 5.2.2.8).
4. `P_Σ(C) ⊆ P(C)` is stable under sifted colimits (HTT, Prop. 5.5.8.10 (4), p. 526): colimits are pointwise and finite products commute with sifted colimits in S (HTT, Lemma 5.5.8.11, Rem. 5.5.8.12). *Needs:* Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §5.3.5 (HTT, Lemma 5.5.8.11) and §5.3.6 (HTT, Rem. 5.5.8.12).
5. The localization `L : P(C) → P_Σ(C)` preserves sifted colimits as an endofunctor of `P(C)` (HTT, Prop. 5.5.8.10 (5), p. 526): it preserves colimits into `P_Σ(C)`, and by item 4 sifted colimits there are computed in `P(C)`. *Needs:* items 1 and 4; Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5).
6. `P_Σ(C)` is compactly generated (HTT, Prop. 5.5.8.10 (6), p. 526): it is stable under filtered colimits in `P(C)` by item 4, filtered simplicial sets being sifted (HTT, Ex. 5.5.8.3), so the localization preserves compact objects (§1.4.3), `P(C)` being compactly generated (HTT, Prop. 5.3.5.12). *Needs:* item 4; §1.4.3; Part PresheavesAndCompletions §5.3.2 (HTT, Ex. 5.5.8.3); Part AccessibleInfinityCategories §4.3.1 (HTT, Prop. 5.3.5.12).

### 7.2 Free resolutions in `P_Σ`

**7.2.1.** Prove that for small C with finite coproducts, a presheaf X lies in `P_Σ(C)` exactly when it is the colimit in `P(C)` of a simplicial object of `Ind(C)`, the filtered colimits of representables (HTT, Lemma 5.5.8.14, p. 527). Such colimits are sifted colimits (`N(Δ)^op` and filtered simplicial sets are sifted, HTT Lemma 5.5.8.4, Ex. 5.5.8.3) of objects of `P_Σ(C)`, so they stay in it (§7.1, item 4). Conversely, resolve X by a simplicial object `Y_•` of `P(C)` with colimit X and each `Y_n` a small coproduct of representables (HTT, Lemma 5.5.8.13), and apply the localization of §7.1: L preserves sifted colimits (item 5), and L of a coproduct of representables is a filtered colimit of finite coproducts of representables, which are representable in `P_Σ(C)` (item 2).

*Needs:* §7.1.1, §7.1.2; Part LimitsAndKanExtensions §6.1.1 (HTT, Notation 4.2.3.1); Part PresheavesAndCompletions §5.3.1 (HTT, Lemma 5.5.8.4), §5.3.2 (HTT, Ex. 5.5.8.3) and §5.5.3 (HTT, Lemma 5.5.8.13).

### 7.3 The universal property of `P_Σ`

**7.3.1.** Prove that for small C with finite coproducts and D with filtered colimits and geometric realizations, with `Fun_Σ(P_Σ(C), D)` the functors preserving filtered colimits and geometric realizations: composition with j is an equivalence `Fun_Σ(P_Σ(C), D) → Fun(C, D)`; these functors preserve sifted colimits; and when D has finite coproducts, such a functor preserves small colimits exactly when its restriction to C preserves finite coproducts (HTT, Prop. 5.5.8.15, p. 528). By §7.2 and §7.1 (item 4), `P_Σ(C)` is the smallest full subcategory of `P(C)` containing the representables and stable under filtered colimits and geometric realizations, so it is `P^𝒦_R(C)` of §4.7 with R empty and 𝒦 the small filtered simplicial sets together with `N(Δ)^op`. The equivalence is then the universal property of §4.7 (HTT, Prop. 5.3.6.2 (2)), where Lurie appeals to the informal HTT Rem. 5.3.5.9, and its inverse is left Kan extension along j, the *left derived functor* (HTT, Prop. 4.3.2.15, Lemma 5.1.5.5). For preservation of sifted colimits, compose with the functors `D → S^op` represented by objects of D, which jointly detect colimits, to reduce to a D with sifted colimits; there `P_Σ(C)` is also the smallest full subcategory of `P(C)` containing the representables and stable under sifted colimits (§7.1, item 4), so the same universal property, with 𝒦 the small sifted simplicial sets, shows that the functors preserving sifted colimits already restrict to an equivalence onto `Fun(C, D)`, and hence are all of `Fun_Σ(P_Σ(C), D)`. For the last assertion, j preserves finite coproducts (§7.1, item 2), and conversely a colimit-preserving extension through `P(C)` factors through the localization (§4.4; §7.1, item 3).

*Needs:* §4.4.2, §4.7.2, §4.7.5, §7.1.1, §7.1.2, §7.2.1; Part LimitsAndKanExtensions §3.4.2 (HTT, Def. 4.4.4.4) and §7.4.6 (HTT, Prop. 4.3.2.15); Part PresheavesAndCompletions §1.4.2 (HTT, Lemma 5.1.5.5), §5.3.1, §5.3.2 (sifted simplicial sets) and §6.5.1 (HTT, Lemma 5.3.5.7).

**7.3.2.** Prove that for C with small colimits, a functor f out of C preserves sifted colimits exactly when it preserves filtered colimits and geometric realizations (HTT, Cor. 5.5.8.17, p. 529). Lurie's route: for a sifted colimit diagram indexed by I, factor the diagram as `q ∘ j` with j the Yoneda embedding into a small full subcategory J of `P(I)` closed under finite coproducts and q preserving finite coproducts. Take J to be the smallest such subcategory: it is `P^𝒦_R(I)` of §4.7 with R empty and 𝒦 the finite discrete simplicial sets, and q exists by the universal property there (HTT, Prop. 5.3.6.2), where Lurie cites the informal HTT Rem. 5.3.5.9; by §7.3.1 q extends to a colimit-preserving `q' : P_Σ(J) → C`, the composite of f with q' preserves filtered colimits and geometric realizations and hence sifted colimits, and the given diagram is q' applied to the colimit in `P_Σ(J)` of the Yoneda diagram.

*Needs:* §4.7.2, §4.7.4, §7.1.1, §7.3.1.

### 7.4 Compact projective objects and projectively generated ∞-categories

**7.4.1.** Define, for an ∞-category C with geometric realizations of simplicial objects, an object P to be *projective* when the functor `C → S` corepresented by P preserves geometric realizations (HTT, Def. 5.5.8.18, p. 530).

- An object is compact projective when its corepresented functor preserves filtered colimits and geometric realizations.
- Projective objects are stable under the finite coproducts that exist in C (HTT, Rem. 5.5.8.19, p. 530): the corepresented functor of a coproduct is a product of corepresented functors, and finite products commute with geometric realizations in S (HTT, Lemma 5.5.8.11, Rem. 5.5.8.12). *Needs:* Part PresheavesAndCompletions §5.3.5 (HTT, Lemma 5.5.8.11) and §5.3.6 (HTT, Rem. 5.5.8.12).

**Checks.**

- In S, every finite discrete space n, the empty one included, is projective: `Map(n, −)` is the n-fold product, and finite products commute with geometric realizations. A definition requiring preservation of all small colimits would reject the two-point space, since `Map(∂Δ[1], −)` does not preserve binary coproducts.
- In S, the circle S¹ is compact but not projective: for the simplicial object `X_•` with discrete levels realizing `B(ℤ/2)`, the realization of `Map(S¹, X_•)` is connected, while `Map(S¹, B(ℤ/2))` has two components. A definition by compactness alone would accept S¹.
- In the nerve of abelian groups, where realizations are coequalizers of the two face maps in degree 1, ℤ is not projective, although it is projective in the classical sense (HTT, Ex. 5.5.8.21, p. 530). The nerve of the group ℤ is a simplicial abelian group with levels `ℤⁿ`; its realization there is the coequalizer of `ℤ ⇉ 0`, which is 0, while `Map(ℤ, −)` sends it to its underlying simplicial set, whose realization in S is S¹. A definition by exactness of `Hom(P, −)` would accept ℤ.

*Needs:* Part InfinityCategoryFoundations §1.2.4 (colimits); Part PresheavesAndCompletions §1.1.2 (corepresentable functors); Part LimitsAndKanExtensions §9.4.2 (geometric realizations, HTT Notation 6.1.2.12).

**7.4.2.** Prove that for small C with finite coproducts, D with filtered colimits and geometric realizations, and F the left derived functor of `f = F ∘ j` (§7.3): if f is fully faithful and its essential image consists of compact projective objects, F is fully faithful; and F is an equivalence exactly when moreover D is generated by the image of f under filtered colimits and geometric realizations (HTT, Prop. 5.5.8.22, p. 531). The class of objects X of `P_Σ(C)` for which `Map(X, Y) → Map(FX, FY)` is an equivalence for all Y contains the representables (full faithfulness of j and f, HTT Prop. 5.1.3.1) and is stable under filtered colimits and geometric realizations because the images are compact projective; §7.2 shows it is everything, first for maps out of representables, then for all X. Conversely, if F is an equivalence, f is fully faithful because j is (HTT, Prop. 5.1.3.1); the representables of `P_Σ(C)` are compact projective because evaluation at an object of C preserves colimits (HTT, Prop. 5.1.2.2) and `P_Σ(C)` is stable in `P(C)` under filtered colimits and geometric realizations; and §7.2 gives the generation.

*Needs:* §7.1.1, §7.1.2, §7.2.1, §7.3.1, §7.4.1; Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1).

**7.4.3.** Define, for C with small colimits, a set S of objects to be a *set of compact projective generators* when its elements are compact and projective, the full subcategory they span is essentially small, and S generates C under small colimits; C is *projectively generated* when such a set exists (HTT, Def. 5.5.8.23, p. 532).

- `P_Σ(C)` is projectively generated by the representables (§7.1, and §7.4.2).
- The coproduct closure of a set of compact projective generators is again one (HTT, Rem. 5.5.8.19).

**Checks.**

- S is projectively generated by `{Δ[0]}`. The set `{∅}` consists of compact projective objects but generates only the empty space under colimits, so it is not a set of generators; a definition omitting generation would accept it.
- In S, the set `{S¹}` consists of a compact object that generates S under colimits (the point is a retract of S¹, and retracts are colimits), but S¹ is not projective (Checks above); a definition omitting projectivity would accept it.
- Δ[0] is projectively generated by the empty set: the colimit of the empty diagram is its unique object. This is the degenerate case, where D in Prop. 5.5.8.25 below is the full subcategory on the empty coproduct.

*Needs:* §7.4.1; Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5).

**7.4.4.** Prove that for a projectively generated C with set of compact projective generators S and D a minimal model of the full subcategory of finite coproducts of elements of S, the left derived functor `P_Σ(D) → C` of the inclusion is an equivalence, so C is a compactly generated presentable ∞-category; and an object of C is compact projective exactly when its corepresented functor preserves sifted colimits, exactly when it is a retract of a finite coproduct of elements of S (HTT, Prop. 5.5.8.25, p. 532). The first assertion is the recognition statement §7.4.2. For the second, retracts of finite coproducts of generators are compact projective; conversely, in `P_Σ(D)` a compact projective X is the geometric realization of a simplicial object `X_•` of `Ind(D)` (§7.2), projectivity factors the identity of X through `X_0` up to homotopy, and compactness factors that map through a representable, so X is a retract of an object of D; and the corepresented functor of such a retract preserves sifted colimits by §7.3.

*Needs:* §7.1.1, §7.1.2, §7.2.1, §7.3.1, §7.3.2, §7.4.1–7.4.3; Part InfinityCategoryFoundations §10.4.1 (HTT, Prop. 2.3.3.8, minimal models).

### 7.5 Truncated objects of `P_Σ`

**7.5.1.** Prove that for a small ∞-category C with finite coproducts and k ≥ −2, an object F of `P_Σ(C)` is k-truncated exactly when each space `F(C)` is k-truncated, and that composing a product-preserving presheaf with the truncation `τ_{≤k} : S → S` is the truncation functor of `P_Σ(C)` (HTT, Rem. 5.5.8.26, p. 533). `τ_{≤k}` preserves finite products of spaces, since homotopy groups of a product are products, so composition with it carries `P_Σ(C)` into itself. If F is k-truncated, so is `F(C) ≃ Map(j(C), F)` (Yoneda). Conversely, if F takes k-truncated values, the objects F' with `Map(F', F)` k-truncated form a full subcategory stable under colimits, because `Map(−, F)` carries colimits to limits and k-truncated spaces are stable under limits (§6.1), and it contains the representables, so it is all of `P_Σ(C)` by §7.2 (HTT, Lemma 5.5.8.14). For the truncation functor: evaluation at an object of C preserves small limits and colimits of `P(C)` (HTT, Prop. 5.1.2.2), so by §6.2 (HTT, Prop. 5.5.6.28) the truncation functor of the presentable `P(C)` is objectwise truncation, and objectwise truncation is left adjoint to the inclusion of the k-truncated presheaves. It preserves `P_Σ(C)`, whose k-truncated objects are the k-truncated presheaves lying in it, and `P_Σ(C)` is a full subcategory of `P(C)`; so it restricts to a left adjoint of the inclusion of the k-truncated objects of `P_Σ(C)`.

*Needs:* §6.1.1 (HTT, Prop. 5.5.6.5); §6.2.1 (HTT, Prop. 5.5.6.18), §6.2.3 (HTT, Prop. 5.5.6.28); §7.1.1 (HTT, Def. 5.5.8.8), §7.1.2 (HTT, Prop. 5.5.8.10 (2)); §7.2.1 (HTT, Lemma 5.5.8.14); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §1.3.3 (HTT, Lemma 5.1.5.2).

### 7.6 Finite colimits from coproducts and realizations; realizations and totalizations in n-categories

**7.6.1.** Prove the following (HA, Lemma 1.3.3.10, pp. 102–103, and, for the fourth assertion, its proof, p. 103):

- An ∞-category with finite coproducts and geometric realizations of simplicial objects has all finite colimits.
- Conversely, for n ≥ 0, an ∞-category with finite colimits that is equivalent to an n-category (HTT, Def. 2.3.4.1) has geometric realizations.
- A functor between ∞-categories with finite coproducts and geometric realizations that preserves finite coproducts and geometric realizations is right exact, that is, preserves finite colimits; conversely, for n-categories with finite colimits, a right exact functor preserves geometric realizations.
- A geometric realization in an n-category is a finite colimit. Let n ≥ 0, let C be an ∞-category with finite colimits that is equivalent to an n-category, and let U be a simplicial object of C. Then U has a geometric realization `|U|`, and the canonical map from the colimit of the restriction `U|N(Δ≤n)^op` to `|U|` is an equivalence. That colimit is a finite colimit: it is equivalent to the colimit of U over the finite poset of non-empty faces of Δ[n] (the injective maps `[m] → [n]`), which is cofinal in `N(Δ≤n)^op` by Part LimitsAndKanExtensions §9.6 (HA, Lemma 1.2.4.17) (HA, proof of Lemma 1.3.3.10, p. 103). The `Suggested.lean` declaration `isColimitDiagram_iff_truncated_of_isNCategory` states this for C an n-category, with `simplexOp` for `N(Δ)^op` and `truncatedSimplexOpι` for the inclusion of `N(Δ≤n)^op`.

The route is Lurie's.

- *Finite colimits from coproducts and realizations.* A finite colimit is built from finite coproducts and coequalizers (HTT, Prop. 4.4.3.2). A parallel pair is a diagram f indexed by the opposite of the 1-truncated semi-simplex category, the objects [0] and [1] with the injective maps between them. Its left Kan extension along the inclusion into `N(Δ)^op` (HTT, Notation 6.1.2.12) exists because its value at [k] is a finite coproduct, one copy of `f[0]` and k copies of `f[1]`; this is where finite coproducts are used. The coequalizer of f is the geometric realization of that left Kan extension. This gives the first assertion and the forward half of the third.
- *Size.* Whether a diagram in C has a colimit is a property of C alone, so after passing one universe up C may be taken small, and `Ind(C) ⊆ P(C)` is presentable (§1.6). This matters for consumers that apply the statement to large C.
- *Embedding.* Let C be equivalent to an n-category with finite colimits. Yoneda embeds C into `Ind(C)` fully faithfully, and its essential image is closed under finite colimits in `Ind(C)` (HTT, Prop. 5.1.3.1, Prop. 5.3.5.14). Let `L : P(C) → Ind(C)` be the left adjoint of the inclusion (§1.6). For a simplicial object U of C, let V be the left Kan extension of `U|N(Δ≤n)^op` along `N(Δ≤n)^op → N(Δ)^op`, with comparison map `α : V → U`. The realization of V in `Ind(C)` is the colimit of `U|N(Δ≤n)^op`, a finite colimit by the cofinality of the fourth assertion, so it lies in the image of C. It remains that `L|α|` is an equivalence, where `|α|` is the induced map of realizations in `P(C)`.
- *Why truncation suffices.* The mapping spaces of C are (n−1)-truncated (Part InfinityCategoryFoundations §10.6, HTT Prop. 2.3.4.18), so representables lie in `Fun(C^op, τ_{≤n−1}S)`. Filtered colimits of (n−1)-truncated spaces are (n−1)-truncated (homotopy groups commute with filtered colimits), so `Ind(C) ⊆ Fun(C^op, τ_{≤n−1}S)`. Hence L factors through the truncation `τ_{≤n−1}` of `P(C)` (§6.2, HTT Prop. 5.5.6.18), and a map inverted by `τ_{≤n−1}` is inverted by L.
- *Objectwise realization.* Colimits in `P(C)` are computed objectwise (Part LimitsAndKanExtensions §8.2, HTT Prop. 5.1.2.2), and a geometric realization of a simplicial object of spaces is modeled by the diagonal of a bisimplicial set (ModelCategoryTheory, Part SimplicialCategories §4.4). At each object of C, `α_k` is an equivalence for k ≤ n, so the diagonal of α is n-connective (ModelCategoryTheory, Part SimplicialCategories §4.5). An n-connective map of spaces induces isomorphisms on homotopy groups in degrees below n and a surjection in degree n, so it is inverted by `τ_{≤n−1}`, which is computed objectwise in `P(C)` (§6.2, HTT Prop. 5.5.6.28, as in §7.5); so `τ_{≤n−1}|α|`, and hence `L|α|`, is an equivalence. This proves the second and fourth assertions.
- *Converse half of the third assertion.* A right exact functor preserves the finite colimit of the fourth assertion, hence geometric realizations.

*Needs:* §1.6.1 (HTT, Thm. 5.5.1.1); §6.2.1 (HTT, Prop. 5.5.6.18), §6.2.3 (HTT, Prop. 5.5.6.28); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15), §1.2.4 (HTT, Def. 1.2.13.4), §2.1.8 (HTT, Def. 1.2.10.1) and §10.1.2 (HTT, Def. 2.3.4.1); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3) and §6.1.2 (HTT, Def. 5.3.5.1); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7, adjunctions); Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2) and §7.1.4 (HTT, Def. 4.3.3.2); Part InfinityCategoryFoundations §10.6.5 (HTT, Prop. 2.3.4.18); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3); Part LimitsAndKanExtensions §6.5.6 (HTT, Prop. 4.4.3.2), §8.2.2 (HTT, Prop. 5.1.2.2), §9.4.2 (HTT, Notation 6.1.2.12) and §9.6.1 (HA, Lemma 1.2.4.17); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1) and §6.4.4 (HTT, Prop. 5.3.5.14); ModelCategoryTheory, Part KanQuillen §1.2.1 (the long exact sequence) and §3.3.1 (filtered colimits); ModelCategoryTheory, Part SimplicialCategories §4.4.2 (HTT, Cor. A.2.9.30, realizations as diagonals) and §4.5.3 (HTT, Lemma 6.5.3.10, diagonals of connective maps).

**7.6.2.** Prove the dual statement for totalizations (no source states this; the dual of HA, Lemma 1.3.3.10 and of its proof, pp. 102–103).
A cosimplicial object of an ∞-category C is a functor `X : N(Δ) → C`, and its totalization is a limit of X
(Part LimitsAndKanExtensions §9.4, HTT, Notation 6.1.2.12). Let n ≥ 0 and let C be an ∞-category with finite
limits that is equivalent to an n-category, that is, whose mapping spaces are (n−1)-truncated (HTT,
Prop. 2.3.4.18).

- Every cosimplicial object X of C has a totalization, and restriction along `N(Δ≤n) ⊆ N(Δ)` induces an
  equivalence from it to the limit of `X|N(Δ≤n)`. That limit is a finite limit: it can be computed over the nerve
  of the poset of faces of Δ[n], since the opposite of the inclusion of that poset into `N(Δ≤n)` is cofinal (Part
  LimitsAndKanExtensions §9.6, HA, Lemma 1.2.4.17).
- A functor between two such ∞-categories that preserves finite limits preserves totalizations.
- Let I be a small ∞-category such that C has I-indexed colimits and the colimit functor `Fun(I, C) → C` preserves
  finite limits, for instance a filtered I when C is the ∞-category of k-truncated spaces. Then totalization
  commutes with these colimits: for a diagram `i ↦ Xᵢ` of cosimplicial objects of C indexed by I, the canonical
  map from the colimit of the totalizations of the Xᵢ to the totalization of their colimit is an equivalence.

One route: the opposite of C is an n-category with finite colimits, so the fourth assertion of §7.6.1 applies to it
and computes the geometric realization of a simplicial object of `Cᵒᵖ` as its colimit over `N(Δ≤n)^op`, a finite
colimit. That assertion has no size hypothesis, which matters here: the ∞-category of k-truncated spaces is
large. Read in C, this is the first assertion. The second follows from the first, since a functor preserving
finite limits preserves the limit over `N(Δ≤n)`. For the third, limits over a finite poset in `Fun(I, C)` are
computed pointwise (HTT, Prop. 5.1.2.2), and the colimit functor preserves them.

- For C the nerve of the category of sets, which is a 1-category, the totalization of X is the equalizer of the
  two coface maps from X⁰ to X¹, the limit over `N(Δ≤1)`, and it commutes with filtered colimits of sets.
- For k ≥ 0, the ∞-category of k-truncated spaces has k-truncated mapping spaces, so it is equivalent to a
  (k+1)-category. It is closed in the ∞-category S of spaces under limits (§6.1, HTT, Prop. 5.5.6.5) and under
  filtered colimits (HTT, Cor. 5.5.7.4), and filtered colimits in S preserve finite limits (HTT, Prop. 5.3.3.3).
  So the totalization of a cosimplicial k-truncated space is the limit over `N(Δ≤k+1)`, and it commutes with
  filtered colimits.

*Needs:* §7.6.1 (HA, Lemma 1.3.3.10, fourth assertion, applied to the opposite of C); §6.1.1 (HTT,
Prop. 5.5.6.5) and §6.2.4 (HTT, Cor. 5.5.7.4); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4), §10.1.2 (HTT,
Def. 2.3.4.1; Def. 5.5.6.1) and §10.6.5 (HTT, Prop. 2.3.4.18); Part PresheavesAndCompletions §4.1.1 (HTT,
Def. 5.3.1.7) and §6.2.2 (HTT, Prop. 5.3.3.3); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2), §9.4.2 (HTT,
Notation 6.1.2.12) and §9.6.1 (HA, Lemma 1.2.4.17).

### Examples

- For C the nerve of finitely generated free abelian groups, the 0-truncated objects of `P_Σ(C)` are the abelian groups (§7.1, Checks), and `τ_{≤0}F` is the abelian group `π₀F(ℤ)` (§7.5); for the object whose value at ℤ is the Eilenberg–MacLane space `K(A, 1)` of an abelian group A, it is the zero group.
- For C the nerve of finite sets, `P_Σ(C) ≃ S`, and the left derived functor of the inclusion of finite sets into the nerve of sets is the functor sending a space to its set of components.
- In the nerve of sets, a 1-category with finite colimits, the geometric realization of a simplicial set `X_•`, regarded as a simplicial object of sets, is the coequalizer of the two face maps `X_1 ⇉ X_0`, as §7.6 predicts with n = 1: the colimit over `N(Δ≤1)^op` reduces to that coequalizer.
- For C the nerve of finitely generated free modules over a ring R, `P_Σ(C)` is projectively generated by R (§7.4).

### Dependencies

Layer 7 uses Layers 1, 2, 4 and 6, Part InfinityCategoryFoundations (minimal models), Part CartesianFibrations (homotopies), Part LimitsAndKanExtensions (Kan extensions, geometric realizations and totalizations, cofinality in `Δ≤n`, reduction to coproducts and coequalizers, pointwise limits), Part AdjunctionsAndLocalizations (reflective subcategories, adjoints), Part PresheavesAndCompletions (Yoneda, filtered and sifted simplicial sets, filtered colimits of spaces, free resolutions of presheaves, `Ind`), Part AccessibleInfinityCategories (compact presheaves), and ModelCategoryTheory, Part SimplicialCategories (diagonals of bisimplicial sets).

## Layer 8: Presentations by combinatorial simplicial model categories

### 8.1 Underlying ∞-categories of combinatorial simplicial model categories

**8.1.1.** Let B be a left proper combinatorial simplicial model category and `S̃` a small set of cofibrations with image S in `N(B°)`. The left Bousfield localization `S̃⁻¹B`, whose fibrant objects are the fibrant `S̃`-local objects of B, is ModelCategoryTheory, Part EnrichedLocalization §3.2 (HTT, Prop. A.3.7.3, p. 926); its cofibrations are those of B. Prove that `N((S̃⁻¹B)°)` is the full subcategory of `N(B°)` spanned by the S-local objects (HTT, Prop. A.3.7.6, the comparison in the proof, p. 929). The mapping spaces of `N(B°)` are those of `B°` (HTT, Thm. 2.2.0.1), so `S̃`-locality in B is S-locality in `N(B°)`, and nerves of full simplicial subcategories are full subcategories.

*Needs:* Part InfinityCategoryFoundations §8.1.2 (HTT, Thm. 2.2.0.1); ModelCategoryTheory, Part EnrichedLocalization §3.1.1 (HTT, §A.3.7, opening definitions) and §3.2.1 (HTT, Prop. A.3.7.3).

**8.1.2.** Prove that a simplicial Quillen equivalence `F : A ⇄ B : G` between combinatorial simplicial model categories induces an equivalence of ∞-categories `N(A°) ≃ N(B°)` (HTT, Prop. A.3.7.6, a step of the proof of (2) ⇒ (1), p. 930). The induced adjunction `f ⊣ g` (HTT, Prop. 5.2.4.6) has as homotopy categories the derived functors (HTT, Rem. 5.2.4.7), which are inverse equivalences (HTT, Prop. A.2.5.1); so the unit and counit are equivalences.

*Needs:* Part AdjunctionsAndLocalizations §1.7.1 (HTT, Prop. 5.2.4.6, Rem. 5.2.4.7); ModelCategoryTheory, Part ModelCategories §4.1.1 (HTT, §A.2.5, Quillen adjunctions) and §4.2.1 (HTT, Prop. A.2.5.1); ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5).

**8.1.3.** Prove that every presentable ∞-category is equivalent to `N(A°)` for a combinatorial simplicial model category A (HTT, Prop. A.3.7.6, (1) ⇒ (2), pp. 929–930). Write C as an accessible localization of `P(D)` for small D (§1.6), with S a small set of morphisms having the same local objects (§1.5); model `P(D)` by the simplicial functors from the rigidification of D, taken opposite (equivalently, the rigidification of `D^op`), to simplicial sets, with the injective model structure (HTT, Prop. 4.2.4.4, Prop. A.3.3.2; HTT §5.1.3, the opposite comparison); this model category is left proper because every object is cofibrant (HTT, Prop. A.2.4.2). Represent S by a small set of cofibrations, by factoring, form the left Bousfield localization (HTT, Prop. A.3.7.3) and use §8.1.1, with §4.4 identifying the local objects.

*Needs:* §1.5.2, §1.6.1, §4.4.1, §8.1.1; Part InfinityCategoryFoundations §2.1.2 (HTT, §5.1.3, the opposite comparison); Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4); ModelCategoryTheory, Part ModelCategories §3.4.2 (HTT, Prop. A.2.4.2); ModelCategoryTheory, Part SimplicialCategories §6.1.1 (HTT, Prop. A.3.3.2); ModelCategoryTheory, Part EnrichedLocalization §3.2.1 (HTT, Prop. A.3.7.3).

**8.1.4.** Prove that for a combinatorial simplicial model category A, `N(A°)` is presentable; with §8.1.3, an ∞-category is presentable exactly when it is the underlying ∞-category of a combinatorial simplicial model category (HTT, Prop. A.3.7.6, (2) ⇒ (1), pp. 929–930). By Dugger's presentation theorem in its simplicial form (ModelCategoryTheory, Part EnrichedLocalization §3.4), A is simplicially Quillen equivalent to a left Bousfield localization L of projective simplicial presheaves on a small category D; the comparison of §8.1.1, in its projective variant (HTT, Rem. 4.2.4.5), identifies `N(L°)` with a localization of `P(N(D))` at a small set, presentable by §4.4, and §8.1.2 gives `N(A°) ≃ N(L°)`.

*Needs:* §4.4.1, §8.1.1–8.1.2; Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4; Rem. 4.2.4.5); Part AdjunctionsAndLocalizations §1.7.1 (HTT, Rem. 5.2.4.7); ModelCategoryTheory, Part EnrichedLocalization §3.4.4 (Dugger, *Combinatorial model categories have presentations*, Thm. 1.1).

### Examples

- The Kan–Quillen model structure on simplicial sets is combinatorial and simplicial with underlying ∞-category S, which is presentable by §1.6, as §8.1 predicts.
- For `S̃` empty, `S̃⁻¹B = B` and §8.1.1 is the identity of `N(B°)`.
- For B the injective simplicial presheaves on the rigidification of a small ∞-category D and `S̃` representing the map `∂Δ[1] ⊗ X → X` for every representable X, the local objects are the presheaves with (−1)-truncated values, and §8.1 presents `τ_{≤−1}P(D)` (§6.2).

### Dependencies

Layer 8 uses Layers 1 and 4, Part InfinityCategoryFoundations (rigidification, mapping spaces of homotopy coherent nerves), Part LimitsAndKanExtensions (diagrams in combinatorial simplicial model categories), Part AdjunctionsAndLocalizations (adjunctions from simplicial Quillen adjunctions), and ModelCategoryTheory (proper model categories, Quillen equivalences, injective model structures, left Bousfield localization, Dugger's presentation theorem).

## Layer 9: Product-preserving simplicial functors and Bergner's comparison

### 9.1 Quillen's model structure on product-preserving functors

**9.1.1.** Prove that for a small category C with finite products, the category A of functors `C → SSet` preserving finite products has a simplicial model structure whose weak equivalences are the objectwise weak homotopy equivalences and whose fibrations are the objectwise Kan fibrations (HTT, Prop. 5.5.9.1, p. 534; `Suggested.lean` declaration `exists_modelCategory_productPreserving`, without the simplicial clause, with A as `ProductPreserving`, cut out by `productPreservingFunctors`, and the objectwise classes `functorObjectwiseWeakEquivalences` and `functorObjectwiseFibrations`). C is small so that A is locally presentable. Route: transfer the projective model structure along `F ⊣ G : SSet^C ⇄ A`, G the inclusion.

- *Hypotheses of the transfer.* G preserves filtered colimits, because finite products commute with filtered colimits in SSet, so a filtered colimit of product-preserving functors, computed objectwise, is product-preserving. The path-object condition holds because `Ex^∞` and `(−)^{Δ[1]}` preserve finite products, so the objectwise fibrant replacement and path objects stay in A.
- *Combinatoriality.* The transferred structure on the locally presentable A is combinatorial, with generating sets the images under F of the projective generators (ModelCategoryTheory, Part ModelCategories §6.4). Layer 9 uses this in §9.4.
- *The simplicial structure.* A is enriched over SSet by the objectwise mapping simplicial sets. The cotensor is objectwise, `(X^K)(C) = X(C)^K`, which preserves finite products. The tensor is not objectwise, since `X(C) × K` does not preserve finite products; it is `F(G(X) ⊗ K)`, the reflection of the objectwise tensor. The simplicial model category axiom holds in its cotensor form (ModelCategoryTheory, Part SimplicialCategories §1.3, HTT Rem. A.3.1.6): for a monomorphism `K → K'` and a fibration `X → Y` of A, the map `X^{K'} → X^K ×_{Y^K} Y^{K'}` is a fibration, trivial when either map is, because fibrations and weak equivalences of A are objectwise and the statement holds in SSet.

*Needs:* ModelCategoryTheory, Part ModelCategories §4.1.1 (HTT, §A.2.5, Quillen adjunctions), §6.1.1 (HTT, Def. A.2.6.1, combinatorial model categories), §6.4.1, §6.4.3 (transferred model structures and the path-object criterion) and §7.2.1 (HTT, Prop. A.2.8.2, projective structure); ModelCategoryTheory, Part KanQuillen §2.2.1 (`Ex^∞`) and §3.2.1 (the Kan–Quillen model structure); ModelCategoryTheory, Part SimplicialCategories §1.2.2 (the product of simplicial sets) and §1.3.1 (HTT, Def. A.3.1.5, Rem. A.3.1.6).

### 9.2 Free finite products and non-empty finite subsets

**9.2.1.** Define, for a small category C, the category `Env⁺(C)` whose objects are finite families `(J, (C_j)_{j ∈ J})` of objects of C and whose morphisms `(J, C) → (J', C')` are a map `f : J' → J` with maps `C_{f(j')} → C'_{j'}`; `Env(C)` is the subcategory of non-empty J and surjective f. Let `θ : C → Env(C)` send C to the one-element family. For C with finite products, `φ⁺ : Env⁺(C) → C` takes a family to its product and `φ` is its restriction to `Env(C)`. For F in `SSet^C`, `E⁺(F)` in `SSet^{Env⁺(C)}` sends `(J, (C_j))` to the product of the `F(C_j)`, and `E(F)` is its restriction to `Env(C)`. Set `L = (φ)_! ∘ E` and `L⁺ = (φ⁺)_! ∘ E⁺`, with natural maps `α : id → L` and `β : L → L⁺`, where `(−)_!` is the ordinary left Kan extension of functors into simplicial sets (HTT, Notation 5.5.9.4, p. 535).

- `Env⁺(C)` is obtained from C by freely adjoining finite products: the product of two families is their concatenation.
- θ is fully faithful, and `φ⁺` is a product-preserving left inverse of θ.
- `E⁺ : SSet^C → SSet^{Env⁺(C)}` is fully faithful, with left adjoint the restriction `θ^*` along the inclusion of one-element families (HTT, Rem. 5.5.9.5, p. 536): `E⁺` is the right Kan extension along that fully faithful inclusion, since the morphisms from `(J, (C_j))` to a one-element family `C` are a choice of j and a map `C_j → C`. *Needs:* this definition only.

**Checks.**

- For C the terminal category, `Env⁺(C)` is the opposite of the category of finite sets and `Env(C)` the opposite of non-empty finite sets and surjections. The covariant convention, f : J → J', would make the two-element family a coproduct, not a product, of one-element families.
- The empty family is a final object of `Env⁺(C)`, since a morphism into it is a map from the empty set, and it is not in `Env(C)`.
- For C the terminal category and any simplicial set F, `L⁺(F)` is the point, the only product-preserving value: the colimit runs over a category with the empty family as final object, where `E⁺(F)` is the empty product. Without the empty family this fails.

*Needs:* this definition only.

**9.2.2.** Define, for a simplicial set K, `M(K)` as the composite of K with the functor taking a set to the set of its non-empty finite subsets (HTT, Notation 5.5.9.11, p. 540).

- `M(Δ[0]) = Δ[0]`, since a one-point set has one non-empty subset.
- M preserves filtered colimits and monomorphisms.

**Checks.**

- `M(∂Δ[1])` has three vertices (the two singletons and the pair) and is discrete; a definition with all finite subsets would add the empty set as a fourth vertex and change the homotopy type.
- `M(Δ[1])` in degree 0 has three elements; in degree 1 its simplices are non-empty finite sets of edges of Δ[1], of which there are 7, since Δ[1] has 3 edges.
- `M(∅) = ∅`: the only subset of the empty set is empty, and it is excluded.

*Needs:* this definition only.

**9.2.3.** Define, for G in `SSet^C` and a pushout `G'` of G along a generating projective cofibration `Map_C(C, −) × K → Map_C(C, −) × K'`, the *index* of a simplex of `E(G')(J, (C'_j))` as the number of distinct simplices of K' not in K that occur among its coordinates outside G (HTT, proof of Lemma 5.5.9.8, pp. 539–540).

**Checks.**

- Every simplex of `E(G)` has index 0, and a simplex with a coordinate outside `E(G)` has index at least 1, so `E(G')⁽⁰⁾ = E(G)` exactly.
- A simplex whose coordinates use the same new simplex σ of K' in two places has index 1, not 2. A definition counting occurrences instead of distinct simplices would put it in stage 2 and break the pushout description of the steps.
- On one-element families the index is at most 1, so `E(G')⁽¹⁾` agrees with `E(G')` there; for K = K' the index is always 0 and the filtration is constant.

*Needs:* §9.2.1; ModelCategoryTheory, Part ModelCategories §7.2.1 (HTT, Prop. A.2.8.2, projective structure).

### 9.3 Bergner's comparison on homotopy categories

**9.3.1.** Prove that for a small category C with finite products, the right derived functor `RG : hA → h(SSet^C)` is fully faithful with essential image the functors preserving finite products up to weak homotopy equivalence (HTT, Prop. 5.5.9.2, p. 535; `Suggested.lean` declarations `IsWeaklyProductPreserving`, `productPreservingLocalizerMorphism` and `nonempty_fullyFaithful_localizedFunctor_productPreserving`). The route is Lurie's, in the following steps; Steps 1–3 use `M(K)` and Steps 4–9 `Env(C)`, E, L and `L⁺` (§9.2).

- *Step 1: a deformation retraction* (HTT, proof of Lemma 5.5.9.12, first step, p. 541). For a finite simplicial set K and a simplicial subset `X ⊆ M(K^▷) × Δ[n]` that surjects onto Δ[n] and is stable under enlarging the first coordinate, the subset `X' ⊆ X` of simplices whose first coordinate contains the constant simplex at the cone point is a deformation retract of X. An explicit homotopy `M(K^▷) × Δ[1] → M(K^▷)` adjoins, at each stage, the simplices that agree with a member up to some vertex and are constant at the cone point afterwards.
- *Step 2: upward closed subsets over a cone* (HTT, Lemma 5.5.9.12, pp. 540–542). Such an X is weakly contractible. After Step 1, forget degeneracies: the semisimplicial subset `X''` of simplices of dimension m whose first coordinate is the set of all m-simplices of `K^▷` (a finite set, K being finite) is contained in `X'`, is isomorphic to Δ[n] as a semisimplicial set, and an explicit second homotopy retracts `X'` onto `X''` semisimplicially. The weak homotopy type of a simplicial set is read from its underlying semisimplicial set (HTT, Lemma 6.5.3.7).
- *Step 3: upward closed subsets over a contractible Kan complex* (HTT, Lemma 5.5.9.13, p. 542). The same holds for `X ⊆ M(K) × Δ[n]` with K a contractible Kan complex in place of `K^▷`. Every finite `K' ⊆ K` extends over `K'^▷` because K is contractible, and homotopy groups commute with filtered colimits, so Step 2 suffices.
- *Step 4: the comparison β* (HTT, Lemma 5.5.9.7, p. 537). If F in `SSet^C` sends the final object to a contractible Kan complex, then `β : L(F) → L⁺(F)` is an objectwise weak equivalence. Write K for the value at the final object. At an object C, recording the images in K of the coordinates of a simplex gives a map `S : L(F)(C) → M(K)` such that the product map `(S, β) : L(F)(C) → M(K) × L⁺(F)(C)` is a monomorphism whose image is stable under enlarging the coordinate in `M(K)` (HTT, proof of Lemma 5.5.9.7, pp. 542–543). β is surjective, since K is non-empty: a simplex of `L⁺(F)(C)` from the empty family is the image of one from the one-element family at the final object. So the fiber of β over each simplex `Δ[k] → L⁺(F)(C)` is a simplicial subset of `M(K) × Δ[k]` that surjects onto Δ[k] and is stable under enlarging the first coordinate, hence weakly contractible by Step 3, and simplexwise weakly contractible maps are weak equivalences (ModelCategoryTheory, Part KanQuillen §3.5).
- *Step 5: reduction to one cell* (HTT, proof of Lemma 5.5.9.8, pp. 538–539). `E : SSet^C → SSet^{Env(C)}` preserves the initial object, filtered colimits and retracts, so that, by the small object argument, E preserves projectively cofibrant objects as soon as: whenever `E(G)` is projectively cofibrant and `G'` is a pushout of G along a generating projective cofibration `Map_C(C, −) × K → Map_C(C, −) × K'`, `E(G')` is projectively cofibrant.
- *Step 6: the index filtration* (HTT, proof of Lemma 5.5.9.8, pp. 539–540). The simplices of index at most k form a subfunctor `E(G')⁽ᵏ⁾` on `Env(C)` with `E(G')⁽⁰⁾ = E(G)` and union `E(G')`.
- *Step 7: E preserves cofibrant objects* (HTT, Lemma 5.5.9.8, p. 537, proof pp. 538–540). E preserves projectively cofibrant objects. After the reduction of Step 5 and the filtration of Step 6, each step `E(G')⁽ᵏ⁻¹⁾ → E(G')⁽ᵏ⁾` is a pushout of `ψ_!(E(G) ⊗ K'_old) → ψ_!(E(G) ⊗ K'^k)`, where `K'_old ⊆ K'^k` consists of the simplices that are not k distinct new simplices and `ψ : Env(C) → Env(C)` adjoins k copies of C; `ψ_!` is left Quillen for the projective structures and `E(G) ⊗ −` preserves cofibrations because `E(G)` is cofibrant. The pushout square is checked objectwise on `Env(C)`.
- *Step 8: the left adjoint* (HTT, Lemma 5.5.9.6, p. 536). For F in `SSet^C`, `L⁺(F)` preserves finite products, and composition with `β ∘ α` is an isomorphism of simplicial mapping sets from `Map(L⁺(F), F')` to `Map(F, F')` for every product-preserving F'. Product preservation uses that `E⁺(F)` carries concatenation of families to products, so that the colimit computing `L⁺(F)(C₁ × ⋯ × C_n)` is the product of the colimits computing the `L⁺(F)(C_i)` (HTT, proof of Lemma 5.5.9.6, pp. 536–537); a left Kan extension along `φ⁺` of an arbitrary functor need not preserve products (for C terminal it is the value at the empty family). The mapping property is the adjunction of §9.2, since `(φ⁺)^*F' ≅ E⁺(F')` for product-preserving F'.
- *Step 9: the derived unit* (HTT, Lemma 5.5.9.9, p. 537). `F ⊣ G` (§9.1) is a Quillen adjunction, and for a projectively cofibrant X in `SSet^C` that preserves finite products up to weak homotopy equivalence, the unit `X → G(F(X))` is a weak equivalence. G preserves fibrations and trivial fibrations by definition. The left adjoint is `L⁺` (Step 8); so the unit is the composite `β ∘ α : X → L(X) → L⁺(X)`. After replacing X by a weakly equivalent cofibrant object with fibrant values, X sends the final object to a contractible Kan complex, so `β` is a weak equivalence by Step 4. The map α is `(φ)_!` applied to the map `θ_!(X) → E(X)` adjoint to `X ≅ θ^*E(X)`; both are projectively cofibrant (`θ_!` preserves cofibrations, and E preserves cofibrant objects by Step 7), `(φ)_!` is left Quillen and so preserves weak equivalences between cofibrant objects, and `θ_!(X) → E(X)` is at each family the comparison map from X of a product to the product of the values of X, a weak equivalence because X is weakly product-preserving.
- *Conclusion* (HTT, proof of Prop. 5.5.9.2, p. 538). G preserves and detects weak equivalences, so RG is induced by G. For X in A and a cofibrant replacement Q of `G(X)`, the derived counit is the adjoint `F(Q) → X` of `Q → G(X)`, and G of it composed with the unit `Q → G(F(Q))` is the weak equivalence `Q → G(X)`; the unit is a weak equivalence by Step 9 (Q is weakly product-preserving), so G of the derived counit is one, and the derived counit is an isomorphism in hA and RG is fully faithful. Every object in the image of G is product-preserving, and conversely Step 9 puts every weakly product-preserving functor, after cofibrant replacement, in the essential image.

*Needs:* §9.1.1, §9.2; Part LimitsAndKanExtensions §5.5.1 (HTT, Lemma 6.5.3.7); ModelCategoryTheory, Part KanQuillen §1.1 (homotopy groups), §3.3.1 (filtered colimits) and §3.5.1 (simplexwise weakly contractible maps); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)), §4.1.1 (HTT, §A.2.5, Quillen adjunctions), §7.1.1 (HTT, Def. A.2.8.1) and §7.2.1 (HTT, Prop. A.2.8.2, projective structure); ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5).

### 9.4 Bergner's comparison and geometric realizations

**9.4.1.** Prove that the induced functor from the underlying ∞-category `N(A°)` of the simplicial model category A (its full simplicial subcategory of fibrant-cofibrant objects, with the homotopy coherent nerve) to `P_Σ(N(C)^op)` is an equivalence (HTT, Cor. 5.5.9.3, p. 535). `N((SSet^C)°)` is equivalent to `Fun(N(C), S)` (HTT, Prop. 4.2.4.4). The simplicial Quillen adjunction `F ⊣ G` induces an adjunction between `N((SSet^C)°)` and `N(A°)` whose unit and counit are the derived ones (HTT, Prop. 5.2.4.6), so by §9.3 the right adjoint is fully faithful with essential image the weakly product-preserving functors. These correspond to `P_Σ(N(C)^op)` (§7.1): under `N((SSet^C)°) ≃ Fun(N(C), S)`, a fibrant-cofibrant functor preserves finite products in the ∞-categorical sense of §7.1 exactly when it preserves them up to weak homotopy equivalence, because products in S are computed by products of Kan complexes (HTT, Thm. 4.2.4.1, applied to the large `Kan` object by object, through small full subcategories, as in Part LimitsAndKanExtensions §3.3 (*Size*); HTT §5.5.9, p. 534).

*Needs:* §7.1.1, §9.1.1, §9.3.1; Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4), §3.2.1 (HTT, Thm. 4.2.4.1) and §3.3.1 (*Size*); Part AdjunctionsAndLocalizations §1.7.1 (HTT, Prop. 5.2.4.6).

**9.4.2.** Prove that for a simplicial object of A, viewed as a bisimplicial object, its homotopy colimit is isomorphic in the homotopy category hA to its diagonal (HTT, Prop. 5.5.9.14, p. 543). The route is Lurie's, in two steps.

- *Step 1: evaluation preserves realizations* (HTT, Lemma 5.5.9.15, p. 543). For each object of C, evaluation preserves homotopy colimits of simplicial objects in A. By §9.4.1 (HTT, Cor. 5.5.9.3), A models `P_Σ`, which is stable under sifted colimits in presheaves (§7.1, item 4), geometric realizations are sifted colimits (HTT, Lemma 5.5.8.4), and evaluation preserves colimits of presheaves (HTT, Prop. 5.1.2.2, Thm. 4.2.4.1, the latter applied object by object, through small full subcategories, as in Part LimitsAndKanExtensions §3.3 (*Size*)).
- *Step 2: reduction to simplicial sets.* By Step 1 the comparison reduces to simplicial sets, where homotopy colimits of simplicial objects are diagonals (HTT, Cor. A.2.9.30, Ex. A.2.9.31), using that A is a combinatorial simplicial model category (§9.1).

*Needs:* §7.1.2, §9.1.1, §9.4.1; Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1), §3.3.1 (*Size*) and §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §5.3.1 (HTT, Lemma 5.5.8.4); ModelCategoryTheory, Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1); ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5) and §4.4.2 (HTT, Cor. A.2.9.30, Ex. A.2.9.31).

### Examples

- For C the terminal category, a product-preserving functor sends the terminal object to the terminal simplicial set, so A is the terminal category; correspondingly `P_Σ(Δ[0])` is Δ[0] (§7.1), consistent with §9.4.
- For C the opposite of finitely generated free abelian groups, A is the category of simplicial abelian groups with Quillen's model structure, and §9.4 identifies its underlying ∞-category with `P_Σ` of the nerve of finitely generated free abelian groups.
- For C the terminal category, the objects of `SSet^C` preserving finite products up to weak equivalence are the weakly contractible simplicial sets, which is the essential image of `RG` in §9.3 for the terminal A.
- For C the nerve of finitely generated free modules over a ring R, `P_Σ(C)` is projectively generated by R (§7.4), and by §9.4 it is the underlying ∞-category of simplicial R-modules.

### Dependencies

Layer 9 uses Layer 7, Part LimitsAndKanExtensions (semisimplicial indexing, homotopy colimits, colimits in functor ∞-categories), Part AdjunctionsAndLocalizations (adjunctions from simplicial Quillen adjunctions), Part PresheavesAndCompletions (sifted simplicial sets), and ModelCategoryTheory (the small object argument, transfer, projective structures, simplicial model categories, `Ex^∞`, simplexwise weakly contractible maps, geometric realizations of simplicial objects).

## Downstream consumers

This roadmap is used by every later member of the InfinityCategoryTheory family, each of which lists what it uses from it in its own supplier contracts.

## References

- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Cited: §5.5 (the presentation theorem 5.5.1.1, pp. 475–479; representability and adjoint functors 5.5.2, pp. 480–484; `Pr^L`, `Pr^R` 5.5.3, pp. 484–490; localization 5.5.4, pp. 491–502; saturated classes 5.5.5, pp. 503–509; truncated objects and Postnikov towers, Prop. 5.5.6.5–Prop. 5.5.6.28, pp. 512–518; compact generation 5.5.7, pp. 519–522; `P_Σ` and projective objects, Def. 5.5.8.8–Rem. 5.5.8.26, pp. 525–533; Quillen's model structure and Bergner's comparison, Prop. 5.5.9.1–Lemma 5.5.9.15, pp. 534–543); Not. 5.3.6.1, Prop. 5.3.6.2, pp. 430–433; Lemma 5.1.6.7, p. 348, and Cor. 5.1.6.12, p. 351; Prop. 6.2.1.1, p. 589; Lemmas 6.3.3.6–6.3.3.7, pp. 625–626; Def. 7.3.4.2 and Exs. 7.3.4.4–7.3.4.6, p. 787, and Ex. 7.3.4.7, p. 788; Prop. A.3.7.6, pp. 929–930.
- **HA.** Jacob Lurie, *Higher Algebra*, author's PDF, version of 18 September 2017,
  [math.ias.edu/~lurie/papers/HA.pdf](https://www.math.ias.edu/~lurie/papers/HA.pdf). Statement numbers and pages
  are those of this PDF, whose PDF and printed page numbers agree.
  Cited: Lemma 1.3.3.10, pp. 102–103; Lemma 4.8.4.2 (first assertion), p. 731; Notation 5.3.2.8 and Lemma 5.3.2.9, p. 900; Lemmas 7.3.5.10–7.3.5.11, pp. 1324–1326; Prop. A.7.10 and Rem. A.7.11, p. 1440.
- **SAG.** Jacob Lurie, *Spectral Algebraic Geometry*, author's PDF, version of 3 February 2018,
  [math.ias.edu/~lurie/papers/SAG-rootfile.pdf](https://www.math.ias.edu/~lurie/papers/SAG-rootfile.pdf). Statement
  numbers and pages are those of this PDF, whose PDF and printed page numbers agree.
  Cited: Lemma 4.5.3.1, p. 403; Def. 20.4.1.1, p. 1544; Rem. 20.4.1.10, p. 1545; Warn. 20.4.3.4, p. 1549; Notation 21.1.1.4, p. 1583; Def. 21.1.2.1, Rem. 21.1.2.2, p. 1584; Ex. 21.1.2.3, Def. 21.1.2.5, Rems. 21.1.2.6–21.1.2.7, pp. 1585–1586; Rem. 21.1.2.8, Ex. 21.1.2.9, Thm. 21.1.2.10, Rem. 21.1.2.11, p. 1586; Rem. 21.1.2.12, Ex. 21.1.2.13, Lemma 21.1.2.14 and the proof of Thm. 21.1.2.10, pp. 1587–1589; Def. A.7.2.1 and Warn. A.7.2.2, p. 1828.
- **Adámek–Rosický.** Jiří Adámek and Jiří Rosický, *Locally presentable and accessible categories*, London Mathematical Society Lecture Note Series 189, Cambridge University Press, 1994. Cited: Thm. 1.64, Cor. 2.47 (a Check of §1.1).
- **Dugger.** Daniel Dugger, *Combinatorial model categories have presentations*, Advances in Mathematics 164 (2001), 177–201, [arXiv:math/0007068](https://arxiv.org/abs/math/0007068). Cited: Thm. 1.1, through ModelCategoryTheory, Part EnrichedLocalization §3.4.
