# Roadmap: marked straightening and the ∞-category `Cat∞`

**Summary.** This Part proves the straightening theorem for marked simplicial sets and draws its consequences
for `Cat∞`, the ∞-category of small ∞-categories.

It builds on the Cartesian model structure and mapping simplices of Part CartesianFibrations, the unmarked
straightening of Part InfinityCategoryFoundations, and the existence of small limits and colimits in `Cat∞`
(Part LimitsAndKanExtensions §3.8). Part CartesianFibrations treats Cartesian fibrations over ∞-categories; this
Part treats them over arbitrary bases, through straightening.

- **Marked straightening (Layer 1).** Marked straightening and unstraightening are defined in §1.1.
  Straightening is a left Quillen functor from the Cartesian model structure over S to the projective model
  structure on simplicial functors `C ⥤ Set⁺_Δ`, and a Quillen equivalence when `C[S] → Cᵒᵖ` is an equivalence
  of simplicial categories; dually for coCartesian fibrations.
- **Cartesian fibrations over arbitrary bases (Layer 2).** Invariance under categorical equivalence of the base;
  Cartesian fibrations are categorical fibrations, and base change along them preserves categorical
  equivalences; the fiberwise criterion; the comparison of the Joyal and Cartesian structures; the universal
  Cartesian fibration and classifying maps into `Cat∞ᵒᵖ` (§2.1), with the two readings of "classifies" agreeing
  for right fibrations.
- **Limits, colimits and descent in `Cat∞` (Layer 3).** Limits are ∞-categories of Cartesian sections and
  colimits are obtained by inverting Cartesian edges; coCartesian fibrations satisfy descent across colimits of
  their bases; `Cat∞` is generated under colimits by Δ[0] and Δ[1].
- **Fiberwise Kan extensions (Layer 4).** The fiberwise criterion for Kan extensions along maps of coCartesian
  fibrations.
- **Diagrams of adjoints and localizations (Layer 5).** Adjointable squares assemble into coherent diagrams of
  left adjoints; localization commutes with colimits of ∞-categories; coCartesian fibrations with left derivable
  transports localize fiberwise.

**Headline theorems.**
- The straightening theorem (HTT, Thm. 3.2.0.1, p. 187).
- Invariance under change of base (HTT, Prop. 3.3.1.1, p. 222).
- Cartesian fibrations are categorical fibrations (HTT, Prop. 3.3.1.7, p. 227).
- The Joyal–Cartesian comparison (HTT, Prop. 3.1.5.3, p. 183).
- Explicit descriptions of limits and colimits in `Cat∞` (HTT, Prop. 3.3.3.1, p. 232; Cor. 3.3.3.2, p. 234; Prop. 3.3.4.2, p. 236;
  Cor. 3.3.4.3, p. 237).
- Descent and generators of `Cat∞` (Nikolaus–Scholze, Lemmas A.16 and A.17, pp. 140–141).
- The fiberwise criterion for Kan extensions (HTT, Prop. 4.3.3.10, p. 308).
- The diagram-level passage to left adjoints (Liu–Zheng, Prop. 2.2.4, pp. 79–80).
- The fiberwise localization of left derivable coCartesian fibrations (Nikolaus–Scholze, Prop. A.14, p. 138).

## Scope and ownership

From the earlier Parts of this family: unmarked straightening, its base change, the classification of right
fibrations by maps to the opposite of spaces and the classifying maps of small right fibrations are Part
InfinityCategoryFoundations Layer 7; Cartesian edges and fibrations, the Cartesian and coCartesian
model structures on marked simplicial sets, mapping simplices, and base change, fiberwise criteria and categorical
fibrations over ∞-category bases are Part CartesianFibrations; the existence of small limits and colimits in `Cat∞`
through the model `N((Set⁺_Δ)°)`, limits in spaces, colimits in spaces and Kan extensions are Part
LimitsAndKanExtensions; adjunctions, the localization `C[W⁻¹]` and absolute Kan extensions are Part
AdjunctionsAndLocalizations. The model-categorical background (weak saturation, the small object argument, Quillen
adjunctions, projective and injective structures, simplicial and excellent model categories, the Bergner structure
and homotopy limits) is the ModelCategoryTheory family.

Already in the library, and cited rather than planned: the ∞-category `Cat∞` as a simplicial set (Tau Ceti
`SSet.catInfty`), marked simplicial sets (Tau Ceti `TauCeti.MarkedSSet`), Cartesian fibrations and their stability
under base change (Tau Ceti `SSet.CartesianFibration`, `SSet.CartesianFibration.of_isPullback`), and the model
structure on an over category (Mathlib `HomotopicalAlgebra.ModelCategory.over`).

## Conventions

Locators such as (HTT, Prop. 5.2.7.8, p. 385) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.1.2` here and `Part Straightening §2.1.2` elsewhere, is one
target.

- **∞-categories.** An ∞-category is a quasicategory, Mathlib `SSet.Quasicategory`. Witness Check: `Λ[2, 1]` is not
  one (its two edges have no composite), while the nerve of any category is.
- **Categorical equivalences and fibrations** are those of Part InfinityCategoryFoundations §2.1 (HTT, Def. 1.1.5.14, p. 43) and Part
  InfinityCategoryFoundations §9.4: categorical fibrations have the right lifting property against monic categorical
  equivalences, and they agree with the Kerodon form through homotopy categories of functor ∞-categories by Part
  InfinityCategoryFoundations §9.7 (HTT, Prop. 2.2.5.8). Witness Check: the inclusion `{0} ⟶ J`, J the nerve of the
  free-living isomorphism, is an inner fibration but not a categorical fibration (the isomorphism of J does not
  lift), and `∂Δ[1] ⊆ Δ[1]` is not a categorical equivalence: for C = Δ[0] ⊔ Δ[0], `h Fun(Δ[1], C)` is discrete with
  2 objects and `h Fun(∂Δ[1], C)` with 4.
- **Arbitrary bases.** "Over an arbitrary base" means over any simplicial set S, not necessarily an ∞-category; the
  forms over ∞-category bases are Part CartesianFibrations Layer 7. Witness Check: `Λ[2, 1]` is a base of the first
  kind and not of the second, and over it the identity of `Λ[2, 1]` is a Cartesian fibration whose total space is not
  an ∞-category.
- **Variance.** Cartesian fibrations lift edges with prescribed target and are classified by `S ⟶ Cat∞ᵒᵖ`;
  coCartesian ones (Part CartesianFibrations §1.1, HTT, Def. 2.4.2.1) lift with prescribed source and are classified by
  `S ⟶ Cat∞`. Witness Check: for an object d of an ∞-category D, the right fibration `D_{/d} ⟶ D` is Cartesian, and
  transport along an edge `x ⟶ x'` sends `x' ⟶ d` to its composite `x ⟶ d`, a functor from the fiber over x' to the
  fiber over x.
- **Marked simplicial sets** are Tau Ceti `TauCeti.MarkedSSet` (Set⁺_Δ), with `flat` (only degenerate edges marked)
  and `sharp` (all edges marked). For a Cartesian fibration `p : X ⟶ S`, X^♮ marks the p-Cartesian edges (Part
  CartesianFibrations §5.3). Witness Check: `Δ[1]^♭` and `Δ[1]^♯` have the same underlying simplicial set and differ in
  one marked edge.
- **Straightening variance.** Marked straightening takes φ : C[S] ⟶ Cᵒᵖ and produces simplicial functors
  C ⥤ Set⁺_Δ. Witness Check: for S = Δ[1], C = C[Δ[1]]ᵒᵖ and φ the identity of C[Δ[1]], the straightening of `Δ[1]^♭` is `Δ[1]^♭`
  at the vertex 0 and Δ[0] at the vertex 1 (§1.2).
- **Model structures on one category.** The Kan–Quillen, Joyal, Cartesian and coCartesian structures share
  underlying categories, so each lives on a type synonym with its bridge equivalence, never as a global instance.
  Witness Check: `Λ[2, 0] ⊆ Δ[2]` is a Kan–Quillen trivial cofibration but not a categorical equivalence. For
  C = Δ[1], `h Fun(Δ[2], C)` and `h Fun(Λ[2, 0], C)` are posets with 4 and 5 elements.
- **Spaces.** The ∞-category of spaces is Part InfinityCategoryFoundations §7.1's `S = N(Kan)`, written `𝒮` here to keep it
  distinct from a base simplicial set S, and identified with the full simplicial subset of `Cat∞` on the Kan
  complexes: for Kan complexes K and L the core of `Fun(K, L)` is all of it (Tau Ceti `SSet.core_sHom_eq_top`).
  Witness Check: the vertex Δ[1] of `Cat∞` is not in `𝒮`, since `Δ[1]` is not a Kan complex.
- **Universes.** Simplicial sets are `SSet.{u}`. `Cat∞` is a simplicial set in `SSet.{u + 1}` (HTT, Def. 3.0.0.1; Tau
  Ceti `SSet.catInfty`). A Cartesian fibration of `SSet.{u}` is classified after lifting to `SSet.{u + 1}`. Witness
  Check: the fibers of a classified fibration are small, while `Cat∞` itself is not a vertex of `Cat∞`.

## Exact supplier contracts

### From Mathlib

- `SSet.Quasicategory`, `SSet.KanComplex` (`AlgebraicTopology/Quasicategory/Basic.lean`,
  `AlgebraicTopology/SimplicialSet/KanComplex.lean`).
- `SSet.innerAnodyneExtensions` (`AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/Basic.lean`) and
  `SSet.anodyneExtensions` (`.../SimplicialSet/AnodyneExtensions/Basic.lean`).
- `SSet.opFunctor` (`.../SimplicialSet/Op.lean`), `SSet.hoFunctor`, `CategoryTheory.nerve`, `SimplicialNerve`.
- `SSet.QCat.bicategory` (`AlgebraicTopology/Quasicategory/StrictBicategory.lean`) and
  `CategoryTheory.mateEquiv` (`CategoryTheory/Adjunction/Mates.lean`): adjunctions of quasicategories and the mate of a
  square, for Layer 5.
- `HomotopicalAlgebra.ModelCategory` (`AlgebraicTopology/ModelCategory/Basic.lean`),
  `HomotopicalAlgebra.ModelCategory.over` (`AlgebraicTopology/ModelCategory/Over.lean`), the model structure on an
  over category, and `HomotopicalAlgebra.CofibrantBrownFactorization` (`.../ModelCategory/BrownLemma.lean`), Ken
  Brown's lemma.

### From Tau Ceti

- `SSet.Edge.IsCartesian`, `SSet.CartesianFibration`, `SSet.CartesianFibration.comp`,
  `SSet.CartesianFibration.of_isPullback` (`TauCeti/AlgebraicTopology/Quasicategory/Cartesian.lean`).
- `SSet.RightFibration`, `SSet.LeftFibration` (`TauCeti/AlgebraicTopology/SimplicialSet/AnodyneExtensions/LeftRight/`).
- `SSet.catInfty` and `SSet.core_sHom_eq_top` (`TauCeti/AlgebraicTopology/Quasicategory/CatInfty.lean`): `Cat∞`, and
  the core of the functor ∞-category between Kan complexes is all of it.
- `SSet.slice.IsLimit`, `SSet.coslice.IsColimit` (`TauCeti/AlgebraicTopology/Quasicategory/Limit.lean`).
- `TauCeti.MarkedSSet` (`TauCeti/AlgebraicTopology/SimplicialSet/Marked/`).
- `SSet.CatInftyΔ` (`TauCeti/AlgebraicTopology/Quasicategory/CatInfty.lean`): the simplicial category of small
  ∞-categories.
- `SSet.Edge.CompStruct.isEquivalence₀₂` (`TauCeti/AlgebraicTopology/Quasicategory/Core.lean`) and
  `SSet.Edge.isEquivalence_iff_hornFilling_zero` (`TauCeti/AlgebraicTopology/Quasicategory/OuterHorn.lean`).
- `SSet.isWeaklyContractible_iff_isWeakHomotopyEquivalence`
  (`TauCeti/AlgebraicTopology/SimplicialSet/WeakHomotopyEquivalence.lean`).

### From TauCetiRoadmap.InfinityCategoryTheory

- **Part InfinityCategoryFoundations:** `C[−]`, the simplicial nerve, categorical equivalences, fully faithful maps and the
  opposite comparison (§2.1); cones (§1.2); size (§1.1); spaces, unmarked straightening and unstraightening, and the
  classification of right fibrations (§7.1); ∞-categories equivalent to Kan complexes (§5.1); the cube description
  of `C[Δ[n]]` (§2.5); slices and initial objects (§5.5); colimits in overcategories (§8.3); unmarked
  straightening, its base change, straightening over a point and the induction principle over the base
  (§7.2–§7.4); the contravariant structure and the classifying maps of small right fibrations (§7.6, §7.7); inner
  anodyne maps as categorical equivalences, products, categorical fibrations, the Joyal model
  structure and its comparison with simplicial categories (§6.1, §9.3–§9.6).
- **Part CartesianFibrations:** coCartesian fibrations (§1.1); marked simplicial sets (§5.1); Cartesian and
  coCartesian edges (§1.3–§1.5, §1.7); right fibrations and slices of coCartesian fibrations (§2.2, §2.4); functor
  ∞-categories and the forms of categorical equivalence (§3.4); correspondences (§4.1); the Cartesian model
  structure: marked anodyne maps, fibrant objects, pushout-products, marked mapping objects, Cartesian equivalences,
  existence over a base with its coCartesian form, products and enrichment, and the comparison with the
  contravariant and Kan–Quillen structures (§5.2–§5.9); mapping simplices and quasi-equivalences (§6.1–§6.3); base
  change, fiberwise criteria and categorical fibrations over ∞-category bases (§7.2–§7.4).
- **Part LimitsAndKanExtensions:** cofinal maps and Kan extensions (§2.1, §7.1); cofinal maps, their preservation of colimits and contravariant equivalences (§2.3,
  §2.5, §4.6); diagrams in a combinatorial simplicial model category, homotopy colimits as colimits, limits and
  colimits in `N(A°)` and slices of simplicial model categories (§3.1–§3.3, §3.6); limits in spaces (§3.7); the
  existence of small limits and colimits in `Cat∞`, `N((Set⁺_Δ)°) ≃ Cat∞` (§3.8); cofinal maps from nerves of
  categories (§6.4); the existence of Kan extensions, their invariance and Kan extensions along arbitrary maps (§7.4,
  §7.5, §7.6).
- **Part AdjunctionsAndLocalizations:** adjunctions (§1.1), correspondences and associated functors (§1.2), the
  agreement of the definitions of adjunction and coCartesian lifts of adjoints (§1.3), the localization `C[W⁻¹]` (§2.4), the
  underlying ∞-category of a model category (§2.6) and absolute Kan extensions with Quillen derived functors (§2.7).

### From TauCetiRoadmap.ModelCategoryTheory

- **Part ModelCategories:** weak saturation and the small object argument (§1.3, §1.4), left properness and
  homotopy pushouts and pullbacks (§3.4, §3.5), Quillen adjunctions and equivalences (§4.1, §4.2), combinatorial model categories (§6.1), projective diagram structures (§7.2), Reedy categories and the Reedy model
  structure (§7.4, §7.7).
- **Part KanQuillen:** homotopy equivalences of Kan complexes (§1.3); the Kan–Quillen structure and weak homotopy
  equivalences (§3.2); left properness (§3.4) and the colimit lemma for Reedy diagrams (§3.5).
- **Part SimplicialCategories:** enriched diagram categories (§2.1), injective structures (§2.6), homotopy limits and
  colimits (§3.1, §3.2), simplicial model categories (§1.3), the Bergner structure and its trivial fibrations
  (§5.2, §5.4, §5.6, §5.7, §5.9), left
  adjoints of restriction and excellent model categories (§6.1–§6.3).
- **Part EnrichedLocalization:** localizations of simplicial categories and homotopy limits of simplicial categories
  (§2.1, §2.3, §4.4).

## How to read the build

Layer 1 proves the straightening theorem: the formal properties of marked straightening, its behavior on
cofibrations, marked anodyne maps and products, the Quillen adjunction, the Quillen equivalence over simplices and
then over every base, the coCartesian form, and the relative nerve over the nerve of a category. Layer 2 draws the
consequences over an arbitrary base: invariance under change of base, Cartesian fibrations as categorical
fibrations, base change and the fiberwise criterion, the Joyal–Cartesian comparison, classifying maps with the
comparison of the two readings of "classifies" for right fibrations, and Cartesian sections as derived global
sections. Layer 3 identifies limits in `Cat∞` with ∞-categories of Cartesian sections and colimits with total spaces
whose Cartesian edges are inverted, their existence being known from Part LimitsAndKanExtensions §3.8, and proves
descent for coCartesian fibrations and the generation of `Cat∞` by Δ[0] and Δ[1]. Layer 4 proves the fiberwise
criterion for Kan extensions along maps of coCartesian fibrations. Layer 5 treats diagrams of ∞-categories:
adjointable squares and coherent diagrams of left adjoints, colimits of localizations, and derived coCartesian
families.

Layers 1 and 2 open with the definitions they use first: marked straightening and unstraightening (§1.1), and the
universal Cartesian fibration and classifying maps (§2.1). Later Parts cite these definitions there.

## Layer 1: Marked straightening as a Quillen equivalence

### 1.1 Marked straightening and unstraightening

**1.1.1.** Fix a simplicial set S, a simplicial category C and a simplicial functor `φ : C[S] ⟶ Cᵒᵖ`. The unmarked
straightening `St_φ X` of a simplicial set `X ⟶ S` (Part InfinityCategoryFoundations §7.1, HTT, §2.2.1) takes an object C of C
to the mapping space from C to the cone point of `C[X^▷] ⊔_{C[X]} Cᵒᵖ` (HTT, §3.2.1, introduction, p. 188). A vertex
c of X gives a vertex `c̃` of `(St_φ X)(φ c)`, and an edge `f : c ⟶ d` an edge `f̃ : c̃ ⟶ F^* d̃`, where
`F : φ c ⟶ φ d` is the image of f; simplices σ of `Map_{Cᵒᵖ}(C, D)` act by `σ^* : (St_φ X)(D) ⟶ (St_φ X)(C)`,
naturally in X over S (HTT, Notation 3.2.1.1, p. 188).

Define the marked straightening of a marked simplicial set `(X, E)` over `S^♯` as
`St⁺_φ(X, E) = (St_φ X, E_φ)`, where the marked edges `E_φ(C)` of `(St_φ X)(C)` are the edges `G^* f̃`, for
`f : c ⟶ d` in E and G an edge of `Map_{Cᵒᵖ}(C, φ c)`. Define the marked unstraightening `Un⁺_φ F` of a simplicial
functor `F : C ⥤ Set⁺_Δ`, with Set⁺_Δ enriched through `Map^♯` (Part CartesianFibrations §5.8): its simplices are
those of `Un_φ F`, an n-simplex over `σ : Δ[n] ⟶ S` being a map `St_φ(σ) ⟶ F`, and an edge is marked when its map
extends over `St⁺_φ(Δ[1]^♯)` (HTT, Def. 3.2.1.2, p. 189). Write `St⁺_S` and `Un⁺_S` for `C = C[S]ᵒᵖ` and φ the
identity (HTT, Notation 3.2.1.6, p. 190). That `Un⁺_φ` is right adjoint to `St⁺_φ` (HTT, Cor. 3.2.1.5) is proved
in §1.3.

**Checks.**
- For S = Δ[0] and `X = Δ[1]^♯`, the edge `f̃` of `St⁺_φ(X)` given by the nondegenerate edge f of Δ[1] is marked
  and nondegenerate, which rules out `(St_φ X)^♭`. For `X = Δ[1]^♭` the same edge is not marked, since E holds only
  degenerate edges and `G^*` of a degenerate edge is degenerate, which rules out `(St_φ X)^♯`.
- For S = Δ[1] and X = Δ[1] over the identity, `(St⁺_S Δ[1]^♯)(0)` is `Map_{C[Δ[2]]}(0, 2) = Δ[1]` with its
  nondegenerate edge (from {0,2} to {0,1,2}) marked, while for `Δ[1]^♭` only the degenerate edges are marked. So
  the marking is neither always flat nor always sharp, which rules out `(St_φ X)^♭` and `(St_φ X)^♯`.
- `Un⁺_φ` of the constant functor at `Δ[0]^♯` is `S^♯`: every edge is marked.

*Needs:* Part InfinityCategoryFoundations §1.2.2 (HTT, Notation 1.2.8.4), §2.1.1, §2.1.5 (HTT, Def. 1.1.5.5) and
§7.1.4, §7.1.5 (HTT, §2.2.1, St, Un); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1) and §5.8.3;
ModelCategoryTheory, Part SimplicialCategories §2.1.1 (HTT, Def. A.3.3.1).

### 1.2 Markings and small cases of the straightening

**1.2.1.** Prove that the marked edges `G^* f̃` of `St⁺_φ(X, E)`, for f in E, form the smallest natural family of sets
of edges containing `f̃` for every f in E (HTT, Rem. 3.2.1.3, p. 189). So `(X, E) ↦ St⁺_φ(X, E)` is a functor from
marked simplicial sets over `S^♯` to simplicial functors `C ⥤ Set⁺_Δ`, and the marked edges of `St⁺_φ(X^♭)(C)` are the
edges `G^* s₀(c̃)`, for c a vertex of X and G an edge of `Map_{Cᵒᵖ}(C, φ c)`; they are all degenerate when the mapping
objects of C are discrete, as for C the point or `C[Δ[1]]ᵒᵖ`, and not in general.

**Checks.**
- For S = Δ[0], C the point and X = ∅, `St⁺_φ(∅)` is empty: the pushout `C[Δ[0]] ⊔ Cᵒᵖ` has no morphisms from the
  object of C to the cone point. A definition by coslices of X would give a point.
- For S = Δ[1], C = `C[Δ[1]]ᵒᵖ` and φ the identity of `C[Δ[1]]`, `St⁺_φ(Δ[1]^♭)` is Δ[0] at the vertex 1, and at 0 it
  is `Δ[1]^♭`, unlike `St⁺_φ(Δ[1]^♯)` (§1.1): the edge `f̃` is marked exactly when f is. - Marked edges of
  `St⁺_φ(X^♭)` need not be degenerate: for S = Δ[2], φ the identity and `X = {2}^♭`, the value `(St⁺_φ X)(0)` is
  `Map_{C[Δ[2]]}(0, 2) = Δ[1]`, whose nondegenerate edge G gives the marked edge `G^* s₀(2̃) = G`. Its value at 0 is
  therefore `Δ[1]^♯`, Cartesian equivalent to the fiber Δ[0] of the fibrant replacement of `𝟙 Δ[2]`, which `Δ[1]^♭`
  would not be.
- For S = Δ[0], `St⁺_φ(Δ[0]) = Δ[0]`, and `St⁺_φ(Δ[1]^♭)` is `Q¹ = Map_{C[J¹]}(x, y)`, with J¹ the simplicial set Δ[2]
  with its edge `Δ^{0,1}` collapsed to the point x (HTT, §2.2.2). It is isomorphic to Δ[1], and its nondegenerate edge
  is not marked. For `Δ[n]^♭` with n ≥ 2 the value `Qⁿ` is a quotient of the nerve of the poset of nonempty subsets
  of [n], not the cube `Map_{C[Δ[n + 1]]}(0, n + 1)`.

*Needs:* §1.1.1 (HTT, Notation 3.2.1.1, Def. 3.2.1.2); Part InfinityCategoryFoundations §2.1.1, §2.1.5 (HTT, Def.
1.1.5.5) and §7.1.4 (HTT, §2.2.1); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1).

### 1.3 Colimits, change of base and the right adjoint

**1.3.1.** Prove the formal properties of `St⁺_φ`.
- It preserves small colimits (HTT, Prop. 3.2.1.4 (1), p. 189), from the same property of `St_φ` and the description of
  markings in §1.2. *Needs:* §1.2.1; Part InfinityCategoryFoundations §7.1.5 (HTT, §2.2.1, colimits).
- For `p : S' ⟶ S`, `St⁺_φ ∘ p_! ≅ St⁺_{φ ∘ C[p]}` (HTT, Prop. 3.2.1.4 (2), p. 189), and for a simplicial functor
  `π : C ⟶ C'`, `St⁺_{πᵒᵖ ∘ φ} ≅ π_! ∘ St⁺_φ` with π_! the left adjoint of restriction (HTT, Prop. 3.2.1.4 (3), p. 190),
  from the unmarked statements and §1.2. *Needs:* §1.2.1; Part InfinityCategoryFoundations §7.2.1 (HTT, Prop. 2.2.1.1);
  ModelCategoryTheory, Part SimplicialCategories §6.2.1 (HTT, Prop. A.3.3.7), for (3).
- `Un⁺_φ` is right adjoint to `St⁺_φ` (HTT, Cor. 3.2.1.5, p. 190): an n-simplex of `Un⁺_φ(F)` over σ is a map
  `St⁺_φ(σ) ⟶ F`, an edge is marked when it extends over the marked edge `Δ[1]^♯`, and colimit preservation makes this
  the right adjoint. *Needs:* the first bullet; §1.1.1 (HTT, Notation 3.2.1.6); Part InfinityCategoryFoundations §7.1.5 (HTT, §2.2.1,
  unstraightening).

### 1.4 Cofibrations and marked anodyne maps

**1.4.1.** Prove that `St⁺_φ` carries cofibrations to projective cofibrations (HTT, Prop. 3.2.1.7, p. 190) and marked anodyne maps
to projective trivial cofibrations (HTT, Prop. 3.2.1.11, p. 192). Both classes are weakly saturated and `St⁺_φ`
preserves colimits, so by §1.3 (with π_! left Quillen) it suffices to treat generators for S = Δ[n] or S = K and φ the
identity. For cofibrations the generators are `∂Δ[n]^♭ ⊆ Δ[n]^♭` and `Δ[1]^♭ ⟶ Δ[1]^♯`. For marked anodyne maps it
suffices that each generator of HTT, Def. 3.1.1.1 is objectwise a Cartesian equivalence over Δ[0], and the route rests
on three facts about markings (HTT, Lemmas 3.2.1.8–3.2.1.10, p. 191): with E the degenerate edges of `Δ[n] × Δ[1]`
and `{n} × Δ[1]`, the inclusion `(Δ[n] × {1}) ∪ (∂Δ[n] × Δ[1]) ⊆ (Δ[n] × Δ[1], E)` is marked anodyne, a reformulation
of Part CartesianFibrations §1.5; for `K' ⊆ K` and a set A of vertices of K containing the last vertex of every
nondegenerate simplex outside K',
`(K × {1}) ∪ (K' × Δ[1]) ⊆ K × Δ[1]`, marked at degenerate edges and the edges `{a} × Δ[1]` with a in A, is marked
anodyne, simplex by simplex from the first; and for edge sets `E ⊆ E'` of X containing all degenerate edges,
`(X, E) ⟶ (X, E')` is a Cartesian trivial cofibration over Δ[0] exactly when every map from X to an ∞-category that
inverts E inverts E', by the `Map^♭` form of Part CartesianFibrations §5.6. For the flat inner horns and the marked
last horn the straightened map is an isomorphism away from the vertex 0 and at 0 a
pushout of the cube inclusion of Lemma 3.2.1.9, through the cube description of `C[Δ[n + 1]]`. For the composition
generator it is, at 0, the inclusion `(Δ[1] × Δ[1], E) ⊆ (Δ[1] × Δ[1])^♯` with E the
degenerate edges, `Δ[1] × {0}`, `Δ[1] × {1}` and `{1} × Δ[1]`, a pushout of the composition generator followed by one
of the map of Part CartesianFibrations §5.3 (HTT, Cor. 3.1.1.7). For `K^♭ ⟶ K^♯`, every edge of `St⁺(K^♭)(v)` has the
form `g^* ẽ`, and Lemma 3.2.1.10 applies: a map to an ∞-category inverting the marked edges inverts each `ẽ`, then
each `g^* ẽ`.

*Needs:*
- §1.2.1; §1.3.1.
- Part CartesianFibrations §1.3.1, §1.5.2, §5.2.1, §5.3.2, §5.5.2, §5.6.1 and §5.7.1.
- Part CartesianFibrations §5.1.1 (HTT, Def. 3.1.2.2); Part InfinityCategoryFoundations §2.1.1, §2.1.5 (HTT, Def. 1.1.5.5); Part InfinityCategoryFoundations §2.5.1 (HTT, Def. 1.1.5.1
  with Rem. 1.1.5.2, the cube description); Tau Ceti `SSet.Edge.isEquivalence_iff_hornFilling_zero` (HTT,
  Prop. 1.2.4.3).
- ModelCategoryTheory, Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2), §7.2.1 (HTT, Prop. A.2.8.2, projective structure)
  and §6.1.1 (HTT, Def. A.2.6.1); Part SimplicialCategories §6.2.1 (HTT, Prop. A.3.3.7).

### 1.5 Products and the Quillen adjunction

**1.5.1.** Prove that straightening commutes with products up to weak equivalence. For simplicial functors `F : C ⥤ Set⁺_Δ` and
`F' : C' ⥤ Set⁺_Δ`, write `F ⊠ F'` for `(C, C') ↦ F(C) × F'(C')` on `C × C'` (HTT, Notation 3.2.1.12, p. 194).
- For `φ : C[S] ⟶ Cᵒᵖ`, `φ' : C[S'] ⟶ C'ᵒᵖ`, M over S and M' over S', the natural map
  `St⁺_{φ ⊠ φ'}(M × M') ⟶ St⁺_φ(M) ⊠ St⁺_{φ'}(M')` is a weak equivalence of functors `C × C' ⥤ Set⁺_Δ` (HTT,
  Prop. 3.2.1.13, p. 194).
- Over a point, `St⁺` is the functor `T(X, E) = (|X|_Q, E')`, and the map `|X|_Q ⟶ X` of Part InfinityCategoryFoundations §7.3
  (HTT, §2.2.2) induces a Cartesian equivalence `T(M) ⟶ M` for every marked simplicial set M (HTT, Prop. 3.2.1.14,
  p. 195).
- Combining the two, `St⁺_φ(M × K) ⟶ St⁺_φ(M) ⊠ K` is a weak equivalence for every marked simplicial set K (HTT,
  Cor. 3.2.1.15, p. 196).

The route: by filtered colimits, §1.4 and left properness, reduce to simplices and marked edges, and by §1.3 to
`M = M' = Δ[1]^♭` (HTT, Prop. 3.2.1.13, last step of the proof, p. 195), where both sides are computed from
`C[(Δ[1] × Δ[1])^▷]`, two copies of `C[Δ[3]]` glued along `C[Δ[2]]`, by the cube description; the point case uses the
same reduction.

*Needs:*
- §1.2.1; §1.3.1; §1.4.1.
- Part CartesianFibrations §5.2.1, §5.6.1 and §5.7.1.
- Part InfinityCategoryFoundations §2.5.1 (HTT, Def. 1.1.5.1 with Rem. 1.1.5.2) and §7.3.2 (HTT, Prop. 2.2.2.7); Part InfinityCategoryFoundations §2.1.1, §2.1.5 (HTT, Def. 1.1.5.5); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1) and Part CartesianFibrations §5.1.1 (HTT, Def. 3.1.2.2).
- ModelCategoryTheory, Part ModelCategories §3.4.1 (HTT, Def. A.2.4.1) and §3.5.1 (HTT, §A.2.4, homotopy pushouts).

**1.5.2.** Prove that `St⁺_φ` carries Cartesian equivalences to objectwise Cartesian equivalences (HTT, Cor. 3.2.1.16, p. 196), so
that `(St⁺_φ, Un⁺_φ)` is a Quillen adjunction between marked simplicial sets over S with the Cartesian structure and
simplicial functors `C ⥤ Set⁺_Δ` with the projective structure (HTT, Thm. 3.2.0.1 (1), p. 187). The route: reduce by
§1.4 to fibrant objects, where Cartesian equivalences have strong homotopy inverses (Part CartesianFibrations §5.6),
carried to homotopies by the product comparison of §1.5.1; with §1.4 for cofibrations this is the Quillen adjunction. The
projective structure is
the one on enriched diagrams in the excellent model category Set⁺_Δ (Part CartesianFibrations §5.8).

*Needs:* §1.4.1; §1.5.1 (HTT, Cor. 3.2.1.15); Part CartesianFibrations §5.6.1, §5.6.2, §5.7.1 and §5.8.4; ModelCategoryTheory,
Part ModelCategories §1.4.1 (HTT,
Prop. A.1.2.5 (1)) and §7.2.1 (HTT, Prop. A.2.8.2); Part SimplicialCategories §6.1.1 (HTT, Prop. A.3.3.2).

### 1.6 The Quillen equivalence over Δ[n]

**1.6.1.** Prove that `(St⁺_{Δ[n]}, Un⁺_{Δ[n]})` is a Quillen equivalence for every n (HTT, Prop. 3.2.3.4, p. 209). The route
uses three lemmas. `T = St⁺_{Δ[0]}` is a Quillen self-equivalence of Set⁺_Δ (HTT, Lemma 3.2.3.1, p. 206), being weakly
equivalent to the identity by §1.5. For φ essentially surjective on homotopy categories, `Un⁺_φ` reflects weak
equivalences between fibrant objects (HTT, Lemma 3.2.3.2, p. 206), its fiber over c being `U(F(φ c))` by §1.3. For a
composable sequence θ of length n the maps `T(A_i^♭) ⟶ St⁺_{Δ[n]}(M^♮(θ))(i)` are Cartesian equivalences (HTT,
Lemma 3.2.3.3, p. 207), by induction on n with §1.3–§1.5. It then suffices that the derived unit is an
equivalence at each fibrant `X^♮`, and by Part CartesianFibrations §6.3 X receives a quasi-equivalence from a mapping
simplex.

*Needs:*
- §1.3.1; §1.4.1; §1.5.1, §1.5.2.
- Part CartesianFibrations §5.3.1, §5.6.1, §5.6.2, §5.8.1, §6.1.1, §6.2.1 and §6.3.2, §6.3.3 (HTT, Props. 3.2.2.7, 3.2.2.14).
- ModelCategoryTheory, Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1), §3.5.1 (HTT, §A.2.4, homotopy pushouts) and §4.1.1
  (HTT, §A.2.5, Quillen adjunctions).

### 1.7 The straightening theorem over every base

**1.7.1.** Prove the straightening theorem: for a simplicial set S, a simplicial category C and `φ : C[S] ⟶ Cᵒᵖ`, the adjunction
`(St⁺_φ, Un⁺_φ)` is a Quillen adjunction between marked simplicial sets over S with the Cartesian structure and
simplicial functors `C ⥤ Set⁺_Δ` with the projective structure, and a Quillen equivalence when φ is an equivalence of
simplicial categories (HTT, Thm. 3.2.0.1, p. 187). The first part is §1.5. For the second, reduce to φ the identity,
since `St⁺_φ` is `St⁺_S` followed by pushforward along φ (§1.3; HTT, §3.2.4, opening reduction in the proof of
Thm. 3.2.0.1, p. 210). Through the comparison maps of §1.5, `Un⁺_S` is a simplicial functor, and by the criterion for
enriched Quillen equivalences the adjunction is one exactly when `Un⁺_S` is an equivalence from fibrant-cofibrant
simplicial functors to fibrant-cofibrant marked simplicial sets over S (HTT, Lemma 3.2.4.1, p. 210). That is proved by
the induction principle of Part InfinityCategoryFoundations §7.4 (HTT, Lemma 2.2.3.5) over S (HTT, proof of Thm. 3.2.0.1,
pp. 211–213): the class of good S contains simplices by §1.6 and is closed under the required pushouts and sequential
colimits, by comparing homotopy limits of simplicial categories (HTT, Cor. A.3.6.18, Cor. A.3.2.28). The comparison
uses that for
`S' ⊆ S`, restriction `Map^♯_S(X^♮, Y^♮) ⟶ Map^♯_{S'}(X'^♮, Y'^♮)` is a Kan fibration (HTT, Lemma 3.2.4.2, p. 211),
from the pushout-products of Part CartesianFibrations §5.8, and that Set⁺_Δ is excellent (Part
CartesianFibrations §5.8).

*Needs:*
- §1.2.1; §1.3.1; §1.5.1, §1.5.2; §1.6.1.
- Part CartesianFibrations §5.3.1, §5.5.2, §5.7.1 and §5.8.2, §5.8.4.
- Part InfinityCategoryFoundations §7.4.3 (HTT, Lemmas 2.2.3.5, 2.2.3.6); Mathlib `SSet.anodyneExtensions` (HTT, Example 2.0.0.1);
  Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1) and Part CartesianFibrations §5.1.1 (HTT, Def. 3.1.2.2).
- ModelCategoryTheory, Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1), §4.1.1 (HTT, §A.2.5) and §7.2.1 (HTT,
  Prop. A.2.8.2); Part SimplicialCategories §5.9.1 (HTT, Prop. A.3.1.10), §6.3.1 (HTT, Prop. A.3.3.8), §5.6.1 (HTT,
  Rem. A.3.2.14), §5.7.5 (HTT, Example A.3.2.18) and §3.2.1 (HTT, §A.2.8, homotopy limits); Part EnrichedLocalization §2.3.1
  (HTT, Cor. A.3.2.28), §2.1.1 (HTT, Notation A.3.5.1) and §4.4.1, §4.4.3 (HTT, Lemma A.3.6.17; Cor. A.3.6.18).

**1.7.2.** Define the ∞-category of Cartesian fibrations over a simplicial set S as `N(((Set⁺_Δ)/S)°)`, the simplicial nerve of
the full simplicial subcategory of fibrant marked simplicial sets over S (all of them cofibrant), enriched by the
mapping objects `Map^♯_S` of Part CartesianFibrations §5.8. Its objects are the `X^♮` for Cartesian fibrations
`X ⟶ S` (Part CartesianFibrations §5.8, HTT, Prop. 3.1.4.1), and its morphisms are the maps over S carrying Cartesian
edges to Cartesian edges. Prove the straightening equivalence of ∞-categories: for a small simplicial set S,
`Un⁺_S` and the comparison of Part LimitsAndKanExtensions §3.1 give categorical equivalences

    N(((Set⁺_Δ)/S)°)  ⟵  N((C[S]ᵒᵖ ⥤ Set⁺_Δ)°)  ⟶  Fun(Sᵒᵖ, `Cat∞`),

the simplicial functors carrying the projective structure, so that `Fun(Sᵒᵖ, Cat∞)` is equivalent to the ∞-category of
Cartesian fibrations over S, the value of a Cartesian fibration X at a vertex s being equivalent to the fiber `X_s`
(HTT, §3.2, introduction, p. 187, with Prop. 4.2.4.4, p. 276). For `p : S' ⟶ S` the equivalences for S and S' carry
pullback `X ↦ X ×_S S'` to restriction along `pᵒᵖ`, up to natural equivalence. The route: by §1.7.1 with
`φ = 𝟙`, `Un⁺_S` is a simplicial right Quillen equivalence with every object of `(Set⁺_Δ)/S` cofibrant, so by the
criterion for enriched Quillen equivalences it restricts to a weak equivalence of simplicial categories of bifibrant
objects. These are locally Kan, so the right Quillen functor N of the Bergner–Joyal Quillen equivalence carries it to a
categorical equivalence (Ken Brown's lemma). The right-hand map is Part LimitsAndKanExtensions §3.1 for the simplicial
set Sᵒᵖ, the isomorphism `C[Sᵒᵖ] ≅ C[S]ᵒᵖ`, A = U = Set⁺_Δ and the projective structure (HTT, Rem. 4.2.4.5), followed
by `N((Set⁺_Δ)°) ≅ Cat∞` (Part LimitsAndKanExtensions §3.8). The fiber value is the base change of §1.3 to a vertex
with Lemma 3.2.3.1 (§1.6). For pullback, §1.3 read on right adjoints gives `p^* ∘ Un⁺_S ≅ Un⁺_{S'} ∘ C[p]^*`, where
`p^*` preserves fibrant objects and `C[p]^*` is right Quillen for the projective structures; under the comparison of
Part LimitsAndKanExtensions §3.1 the right derived functor of `C[p]^*` is restriction along `pᵒᵖ` (the Checks of
§3.1 there).

**Checks.**
- Over S = Δ[0] the mapping objects `Map^♯(C^♮, D^♮)` are the cores of `Fun(C, D)`, so the nerve is `Cat∞` (Part
  LimitsAndKanExtensions §3.8). With `Map^♭` instead, the mapping object from `Δ[0]^♮` to `Δ[1]^♮` would be
  `Fun(Δ[0], Δ[1]) = Δ[1]`, which is not a Kan complex.
- Over S = Δ[1], for `pr₂ : Δ[1] × Δ[1] ⟶ Δ[1]`, the section `t ↦ (0, t)` is a vertex of
  `Map^♯_S(Δ[1]^♯, (Δ[1] × Δ[1])^♮)`, but the diagonal `t ↦ (t, t)` is not, since `(0, 0) ⟶ (1, 1)` is not
  `pr₂`-Cartesian. Taking all maps over S as morphisms would admit the diagonal.
- `Δ[1]^♭` over Δ[1] (by the identity) is not an object: the identity is a Cartesian fibration all of whose edges
  are Cartesian, so its object is `Δ[1]^♯`, and `Δ[1]^♭` is not fibrant. Nor is it Cartesian equivalent to
  `Δ[1]^♯`: maps `Δ[1]^♭ ⟶ (Δ[1] × Δ[1])^♮` over `Δ[1]^♯` include the diagonal of the previous Check. Admitting all
  marked simplicial sets over S as objects would change the ∞-category.

*Needs:* §1.7.1; §1.3.1 (HTT, Prop. 3.2.1.4 (2), (3)); §1.6.1 (HTT, Lemma 3.2.3.1); Part CartesianFibrations
§5.8.1, §5.8.3 (HTT, Prop. 3.1.4.1; Cor. 3.1.4.4); Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4; Rem. 4.2.4.5, and the
Checks on naturality) and §3.8.1 (`N((Set⁺_Δ)°) ≅ Cat∞`); Part InfinityCategoryFoundations §2.1.2 (the opposite comparison) and §9.6.1
(HTT, Thm. 2.2.5.1, Quillen equivalence part); ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT,
Rem. A.3.1.6, mapping objects of bifibrant objects are Kan complexes) and §5.9.1 (HTT, Prop. A.3.1.10); Part
ModelCategories §4.1.1 (HTT, §A.2.5); Mathlib `HomotopicalAlgebra.CofibrantBrownFactorization` (Ken Brown's lemma,
in dual form), `SimplicialNerve`; Tau Ceti `SSet.catInfty`.

### 1.8 Straightening of coCartesian fibrations

The coCartesian model structure on marked simplicial sets over S, whose weak equivalences are the maps f with `fᵒᵖ`
a Cartesian equivalence over Sᵒᵖ, and the self-duality of the Cartesian structure over Δ[0] under `A ↦ Aᵒᵖ` are
Part CartesianFibrations §5.7 (HTT, Rem. 3.1.3.9, p. 178; Rem. 3.1.4.6, pp. 180–181).

**1.8.1.** Prove that for `φ : C[S] ⟶ C`, with `φ' : C[Sᵒᵖ] ≅ C[S]ᵒᵖ ⟶ Cᵒᵖ` the opposite of φ, the coCartesian straightening
`X ↦ St⁺_{φ'}(Xᵒᵖ)` is a left Quillen functor from the coCartesian structure over S to the projective structure on
`C ⥤ Set⁺_Δ`, and a Quillen equivalence when φ is an equivalence (HTT, Thm. 3.2.0.1, p. 187, for Sᵒᵖ, with
Rem. 3.1.3.9, p. 178); for a coCartesian fibration X, X^♮ marking the coCartesian edges, and φ an equivalence, its
value on `X^♮` at the image of a vertex s is equivalent to `(X_s)ᵒᵖ` (for general φ it is a homotopy colimit: for
`φ : C[Δ[1]] ⟶ ∗` it is not a fiber). When C is an ordinary
category, composing objectwise with `(−)ᵒᵖ`, an automorphism of the model category Set⁺_Δ (Part CartesianFibrations
§5.7, HTT, Rem. 3.1.4.6, the case S = Δ[0]),
gives the right Quillen functor `F ↦ (Un⁺_{φ'}(Fᵒᵖ))ᵒᵖ` to the coCartesian structure, with fiber over s equivalent to
`F(φ s)`. The route: `X ↦ Xᵒᵖ` is by definition an isomorphism of model categories from
the coCartesian structure over S to the Cartesian structure over Sᵒᵖ, so §1.7 for `φ'` transports.

**1.8.2.** For a simplicial category D, write `D^co` for the simplicial category with the same objects and the opposite mapping
simplicial sets. `C ↦ Cᵒᵖ` is not a simplicial functor of `Cat^Δ_∞`: since `Fun(Cᵒᵖ, Dᵒᵖ) = Fun(C, D)ᵒᵖ` and cores
commute with `(−)ᵒᵖ`, it is an isomorphism `τ₀ : Cat^Δ_∞ ⟶ (Cat^Δ_∞)^co`. Write `Tw(K)` for the twisted arrow
simplicial set, `Tw(K)_n = K([n] ⋆ [n]ᵒᵖ)` (HA, Construction 5.2.1.1, p. 804): it is `Q^*` for the cosimplicial
simplicial set `Q[n] = Δ^{[n] ⋆ [n]ᵒᵖ} ≅ Δ[2n+1]`, with left adjoint `Q_!`, so it preserves products, and a vertex of
`Tw(K)` is an edge of K. Write `Tw_*D` for the simplicial category obtained by applying Tw to the mapping objects of D.
Since `([n] ⋆ [n]ᵒᵖ)ᵒᵖ = [n] ⋆ [n]ᵒᵖ` naturally in [n], `Tw(Kᵒᵖ) = Tw(K)` naturally in K, compatibly with products,
exchanging the two projections; so `Tw_*(D^co) = Tw_*D`. The projection `π_K : Tw(K) ⟶ K` along
`[n] ⊆ [n] ⋆ [n]ᵒᵖ` is natural and compatible with products, so it gives a simplicial functor `π : Tw_*D ⟶ D`, and
likewise `π' : Tw_*D = Tw_*(D^co) ⟶ D^co`.

Prove that for a Kan complex K the projection `π_K : Tw(K) ⟶ K` is a trivial fibration, naturally in K and
compatibly with products; hence so is `Tw(K) ⟶ Kᵒᵖ`, by `Tw(Kᵒᵖ) = Tw(K)`, and `Tw(K)` is a Kan complex (no source states this; for
Kan complexes this replaces HA, Prop. 5.2.1.3, p. 805, with Prop. 5.2.1.10, p. 807). The route: a lifting problem of
`∂Δ[m] ⊆ Δ[m]` against `π_K` is, by the adjunction `Q_! ⊣ Tw`, an extension problem for K along
`A_m = Δ^{[m]} ∪ B_m ⊆ Δ^{[m] ⋆ [m]ᵒᵖ} = Δ[2m+1]`, where `B_m = Q_!(∂Δ[m])` is the union of the faces
`Δ^{I ⋆ Iᵒᵖ}` over the proper nonempty `I ⊊ [m]`; these faces meet in the faces of the intersections and are
disjoint for disjoint I, so `B_m` is also their colimit over that poset. As K is a Kan complex, it extends along
every monomorphism that is a weak homotopy equivalence, so it suffices that `A_m` is weakly contractible. For m = 0,
`A_0 = {0} ⊆ Δ[1]`. For m ≥ 1:
- `Δ^{[m]} ∩ B_m = ∂Δ[m]`: a face of `Δ^{[m]}` lies in some `Δ^{I ⋆ Iᵒᵖ}` exactly when it is not all of `Δ^{[m]}`;
- the map `∂Δ[m] = colim_I Δ^I ⟶ colim_I Δ^{I ⋆ Iᵒᵖ} = B_m`, over the direct poset of proper nonempty I, is a map
  of Reedy cofibrant diagrams (the latching maps are the inclusions `∂Δ^I ⊆ Δ^I` and
  `⋃_{J ⊊ I} Δ^{J ⋆ Jᵒᵖ} ⊆ Δ^{I ⋆ Iᵒᵖ}`) that is objectwise a weak homotopy equivalence between simplices; the
  matching categories of a direct category are empty, so the colimit is left Quillen for the Reedy structure (the
  colimit lemma of Part KanQuillen §3.5) and the map is a weak homotopy equivalence by Ken Brown's lemma;
- `A_m = Δ[m] ⊔_{∂Δ[m]} B_m`, so by left properness of the Kan–Quillen structure `Δ[m] ⟶ A_m` is a weak homotopy
  equivalence and `A_m` is weakly contractible.

**Checks.**
- For m = 1, with the vertices of `[1] ⋆ [1]ᵒᵖ` written `0 < 1 < 1' < 0'`, `A_1 ⊆ Δ[3]` is the union of the edges
  `Δ^{0,1}`, `Δ^{0,0'}` and `Δ^{1,1'}`, the path `0' – 0 – 1 – 1'`, which is contractible.
- The Kan hypothesis is used. `Tw(Δ[1])` is the nerve of the zigzag `00 ⟵ 01 ⟶ 11` of edges of Δ[1]: an edge of
  `Tw(K)` from `x₀ ⟶ x₀'` to `x₁ ⟶ x₁'` is a 3-simplex `x₀ ⟶ x₁ ⟶ x₁' ⟶ x₀'` of K. It has no edge from `00` to `11`
  over `0 ⟶ 1`, so `π_{Δ[1]}` does not lift against `∂Δ[1] ⊆ Δ[1]` and is not a trivial fibration.

*Needs:* ModelCategoryTheory, Part KanQuillen §3.2.1 (the Kan–Quillen structure; Kan complexes are its fibrant
objects), Part KanQuillen §3.4.1 (left properness) and Part KanQuillen §3.5.2 (the colimit lemma); Part ModelCategories §7.4 and §7.7.1 (Reedy categories
and the Reedy model structure); Mathlib `SSet.KanComplex`, `HomotopicalAlgebra.CofibrantBrownFactorization`; Tau Ceti
`SSet.isWeaklyContractible_iff_isWeakHomotopyEquivalence`.

**1.8.3.** Prove that for a locally Kan simplicial category D, `π : Tw_*D ⟶ D` and `π' : Tw_*D ⟶ D^co` are trivial fibrations
of the Bergner structure, so that

    N(D)  ⟵  N(Tw_*D)  ⟶  N(D^co)

are trivial fibrations, and `Tw_*D` is locally Kan. Choose a section `s_D` of `N(π)` that is the identity on
vertices and sends an edge g of `N(D)`, a vertex of a mapping object of D, to the edge of `N(Tw_*D)` given by the
vertex `id_g` of Tw of that mapping object. Then the comparison `c_D = N(π') ∘ s_D : N(D) ⟶ N(D^co)` is a
categorical equivalence that is the identity on vertices and on edges, and `s_D ∘ N(π)` is joined to the identity
by a natural equivalence over `N(D)` (no source states this). The route: π is the identity on objects and the trivial fibration
`π_K` on every mapping object (§1.8.2), so it lifts against the generators `C₀` and is a trivial fibration of the
Bergner structure (Part SimplicialCategories §5.2, §5.4); likewise π'. N is right Quillen (Part InfinityCategoryFoundations
§9.6), and the trivial fibrations of the Joyal structure are the trivial fibrations (Part InfinityCategoryFoundations §9.5). The
prescribed values form a section over the 1-skeleton of `N(D)`, which extends along the monomorphism
`sk₁ N(D) ⊆ N(D)` by lifting against `N(π)`. A section of a trivial fibration is a categorical equivalence, and the
natural equivalence `s_D ∘ N(π) ≃ 𝟙` comes from lifting `N(Tw_*D) × ∂J ⊆ N(Tw_*D) × J` against `N(π)`, J the nerve
of the free-living isomorphism (Part InfinityCategoryFoundations §9.5, the trivial-fibration clause of its route).

*Needs:* §1.8.2 (the twisted arrow statement); ModelCategoryTheory, Part SimplicialCategories §5.2.2 (HTT, Prop. A.3.2.4,
proof, condition (3)) and §5.4.2 (HTT, Prop. A.3.2.4, the Bergner structure); Part InfinityCategoryFoundations §9.5.1 (HTT,
Thm. 2.2.5.1, trivial fibrations) and §9.6.1 (HTT, Thm. 2.2.5.1, Quillen equivalence part); Mathlib `SimplicialNerve`.

**1.8.4.** Define the involution `op : Cat∞ ⟶ Cat∞`, `C ↦ Cᵒᵖ` (not stated in the sources; from HTT, Rem. 3.1.4.6, p. 181, and HA,
Construction 5.2.1.1, p. 804), as `op = N(π) ∘ N(τ) ∘ s`, with `τ = Tw_*(τ₀)` the automorphism of
`Tw_*Cat^Δ_∞ = Tw_*((Cat^Δ_∞)^co)` and `s = s_{Cat^Δ_∞}` the section of §1.8.3. Prove:
- op sends the vertex C to `Cᵒᵖ` and an edge `g : C ⟶ D` to `gᵒᵖ`, on the nose; `op ∘ op ≃ 𝟙`, so op is an
  equivalence of ∞-categories. The route: τ squares to the identity and sends the vertex `id_g` of
  `Tw(Fun(C, D)^≃)` to `id_{gᵒᵖ}`, and
  `op ∘ op = N(π) N(τ) (s ∘ N(π)) N(τ) s ≃ N(π) N(τ ∘ τ) s = N(π) ∘ s = 𝟙` by `s ∘ N(π) ≃ 𝟙` (§1.8.3).
- For an ordinary category C and a functor `f : C ⥤ Cat^Δ_∞`, with `N(f) : N(C) ⟶ Cat∞` its nerve (C a simplicial
  category with discrete mapping objects) and `fᵒᵖ` the functor `c ↦ f(c)ᵒᵖ`, `op ∘ N(f) ≃ N(fᵒᵖ)`. The route: Tw
  of a discrete simplicial set is itself (`Tw(K)_n = K_{2n+1}`), so f lifts to `f̃ : C ⥤ Tw_*Cat^Δ_∞` with
  `π ∘ f̃ = f` and `τ ∘ f̃ = (fᵒᵖ)~`; so `op ∘ N(f) = N(π) N(τ) (s ∘ N(π)) N(f̃) ≃ N(π) N(τ ∘ f̃) = N(fᵒᵖ)`.

**Checks.**
- op is not equivalent to the identity of `Cat∞`: for the poset `P = {a < b, a < c}`, `N(P)` has the initial object
  a, while `N(P)ᵒᵖ = N(Pᵒᵖ)` has two minimal objects b and c and no initial object, so `op(N(P)) ≄ N(P)`. On
  `N([1])` it is invisible: `N([1])ᵒᵖ ≅ N([1])`.
- `C ↦ Cᵒᵖ` reverses mapping objects: for `C = Δ[0]` and D the nerve of a nonabelian group G (one object), the
  mapping object `Fun(Δ[0], D)^≃` is `N(G)`, and the identity on vertices and edges is not a map `N(G) ⟶ N(G)ᵒᵖ`,
  since a 2-simplex `(g, h)` with composite `hg` would go to one with composite `gh`. So the identity on vertices
  and edges is not a simplicial map `Fun(C, D)^≃ ⟶ Fun(Cᵒᵖ, Dᵒᵖ)^≃`, and the comparison goes through Tw. (Inversion
  `g ↦ g⁻¹` is an isomorphism `N(G) ≅ N(G)ᵒᵖ`, but it is not the identity on edges.)
- On edges op is not the identity even where it fixes the vertices up to equivalence: for `d : Δ[0] ⟶ Δ[1]`
  picking 0, `op(d) : Δ[0] ⟶ Δ[1]ᵒᵖ` picks 0, the final vertex of `Δ[1]ᵒᵖ`. An equivalence `Δ[1] ≃ Δ[1]ᵒᵖ`
  carries the initial vertex 0 to the initial vertex 1 of `Δ[1]ᵒᵖ`, and 0, 1 are not equivalent there, so
  `op(d) ≄ d` in `Fun(Δ[1], Cat∞)`. This excludes `N(π) ∘ s = 𝟙` (τ omitted) by a computation on an edge.

*Needs:* §1.8.3 (the comparison `c_D`); Tau Ceti `SSet.catInfty`, `SSet.CatInftyΔ`; Mathlib `SSet.opFunctor`,
`SimplicialNerve`, `CategoryTheory.nerve`; Part InfinityCategoryFoundations §9.5.1 (the natural equivalence `s ∘ N(π) ≃ 𝟙`).

**1.8.5.** Define the ∞-category of coCartesian fibrations over S as the simplicial nerve of the simplicial category
whose objects are the `X^♮` for coCartesian fibrations `X ⟶ S`, X^♮ marking the coCartesian edges, with mapping
objects `Map^♯_{Sᵒᵖ}((X^♮)ᵒᵖ, (Y^♮)ᵒᵖ)`; so `X ↦ Xᵒᵖ` identifies it with the ∞-category of Cartesian fibrations over
Sᵒᵖ (§1.7), and its morphisms are the maps over S carrying coCartesian edges to coCartesian edges. Check: over S =
Δ[1], for `pr₂ : Δ[1] × Δ[1] ⟶ Δ[1]`, whose coCartesian edges are those with degenerate first component, the diagonal
is a map over S from `𝟙 Δ[1]` that is not a morphism, since `(0,0) ⟶ (1,1)` is not coCartesian; admitting all maps
over S would accept it. Its mapping objects are the opposites of the Kan complexes whose n-simplices are the maps
`Δ[n]^♯ × X^♮ ⟶ Y^♮` over S; so, with D the simplicial category with these direct mapping objects, it is `N(D^co)`,
and the comparison `c_D : N(D) ⟶ N(D^co)` of §1.8.3 identifies the two choices by a categorical equivalence that is
the identity on vertices and edges. Prove the coCartesian straightening equivalence: for a small simplicial set S, the
straightening equivalence of §1.7 for Sᵒᵖ, applied to `Xᵒᵖ` and followed by composition with op, is an equivalence
from this ∞-category to `Fun(S, Cat∞)` under which the value of X at a vertex s is equivalent to the fiber `X_s` and
its value on an edge `e : s ⟶ t` is equivalent to the coCartesian transport `e_! : X_s ⟶ X_t`; and for `p : S' ⟶ S`
these equivalences carry pullback along p to restriction along p, up to natural equivalence (HTT, §3.2, introduction,
p. 187, for Sᵒᵖ, with Rem. 3.1.3.9, p. 178, and Prop. 3.2.5.21 (3), p. 222, for the values). The route: `(Xᵒᵖ)_s =
(X_s)ᵒᵖ`, the Cartesian transport of `Xᵒᵖ` along `eᵒᵖ` is `(e_!)ᵒᵖ`, and `(X ×_S S')ᵒᵖ = Xᵒᵖ ×_{Sᵒᵖ} S'ᵒᵖ`; so §1.7
for Sᵒᵖ gives an equivalence with values `(X_s)ᵒᵖ` and transports `(e_!)ᵒᵖ`, compatible with pullback, and composing
with op, an equivalence with `op ∘ op ≃ 𝟙` (§1.8.4), restores `X_s` and `e_!`.

**Checks.**
- For S = Δ[0] and X an ∞-category, the value is X, not `Xᵒᵖ`: for `X = N(P)` with P as above, the two differ.
- For S = Δ[1] and the coCartesian fibration `Δ[2] ⟶ Δ[1]` (0 ↦ 0; 1, 2 ↦ 1), with fibers a point and `Δ{1,2}`,
  the edge `0 ⟶ 1` is coCartesian and the transport picks the initial object 1 of `Δ{1,2}`. The value is the edge
  of `Cat∞` from Δ[0] to Δ[1] picking the initial vertex. Without op it would pick the final vertex of
  `Δ{1,2}ᵒᵖ ≅ Δ[1]`; Δ[1] has no nontrivial automorphism, so the two edges are not equivalent.

*Needs:* §1.3.1; §1.7.2; §1.8.3 (the comparison `c_D`) and §1.8.4 (the involution op); Part CartesianFibrations §5.7.2 (HTT, Rem. 3.1.3.9, the coCartesian
structure; Rem. 3.1.4.6); Part InfinityCategoryFoundations §2.1.2, §2.1.4 (HTT, Def. 1.1.5.5, and HTT, §5.1.3, p. 338, the opposite comparison); ModelCategoryTheory, Part
ModelCategories §4.1.1 (HTT, §A.2.5, Quillen adjunctions).

### 1.9 The relative nerve

**1.9.1.** Define, for a small category C and a functor `f : C ⥤ SSet`, the relative nerve `N_f(C)` over `N(C)`: a J-simplex (J a
nonempty finite linearly ordered set) is a functor `σ : J ⥤ C` with maps `τ(J') : Δ^{J'} ⟶ f(σ(max J'))` for all
nonempty `J' ⊆ J`, compatible along `J'' ⊆ J'` through `f(σ(max J'')) ⟶ f(σ(max J'))` (HTT, Def. 3.2.5.2, p. 213).

- `N_f(C) ⟶ N(C)` has fiber `f(C)` over C, and is `N(C)` itself for f constant at Δ[0].
- `f ↦ N_f(C)` has a left adjoint `X ↦ F_X(C)` from simplicial sets over `N(C)` to `SSet^C`, and for `g : C ⥤ D`,
  `N_{f ∘ g}(C) ≅ N_f(D) ×_{N(D)} N(C)` (HTT, §3.2.5, after Def. 3.2.5.2, pp. 213–215).

**Checks.**
- For C = [0], `N_f([0]) = f(0)`: a J-simplex is determined by `τ(J)`. The nerve of the category of elements of the
  vertex sets would give only the discrete set of vertices of f(0).
- For C = [1] and `f : Δ[0] ⟶ Δ[1]` picking the vertex 0, both vertices of f(1) = Δ[1] receive an edge over `0 ⟶ 1`
  from
  the vertex over 0 (an edge over `0 ⟶ 1` ending at b needs an edge `0 ⟶ b` of Δ[1]); the category of elements of the
  vertex sets would give an edge only to the vertex 0. So the relative nerve sees the edges of f(1).
- For C = [1] and `f : Δ[1] ⟶ Δ[0]`, each vertex over 0 has exactly one edge over `0 ⟶ 1` to the point over 1, since
  τ lands in f(1) = Δ[0]. With τ into `f(σ(min J'))`, the vertex 0 would have two, one for each edge of Δ[1] out of 0.

*Needs:* `CategoryTheory.nerve`; Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, smallness).

### Examples

- For S = Δ[0] and C the point, `St⁺` is the functor T of §1.5 and the straightening theorem says that T is a Quillen
  self-equivalence of the Cartesian structure over Δ[0].
- For S = Δ[1] and C = C[Δ[1]]ᵒᵖ, a fibrant functor is a functor `[1]ᵒᵖ ⥤ Set⁺_Δ` between fibrant marked simplicial
  sets,
  and the straightening theorem identifies Cartesian fibrations over Δ[1] up to equivalence with functors between
  ∞-categories, their transports.

### Dependencies

Part CartesianFibrations Layers 5 and 6 (the Cartesian model structure, mapping simplices); Part InfinityCategoryFoundations (`C[−]`, the opposite comparison, unmarked base change,
straightening over a point, the induction principle over S); ModelCategoryTheory, Parts ModelCategories,
SimplicialCategories and EnrichedLocalization (projective, Reedy and excellent model structures, enriched Quillen
equivalences, the Bergner structure, homotopy limits of simplicial categories) and Part KanQuillen (left properness
and the colimit lemma, for the twisted arrow statement of §1.8.2 of this Part).

## Layer 2: Cartesian fibrations over arbitrary bases and their classifying maps

### 2.1 The universal Cartesian fibration and classifying maps

**2.1.1.** For an ∞-category C, let `C^♮` be C with its equivalences marked. The assignment `C ↦ C^♮` is a simplicial
functor `F : Cat^Δ_∞ ⥤ Set⁺_Δ`: an n-simplex of the core `Fun(C, D)^≃` is a map `Δ[n] × C ⟶ D` all of whose
edges `(e, id)` are equivalences, so it sends each edge `(e, g)` with g an equivalence to a composite of two
equivalences (`SSet.Edge.CompStruct.isEquivalence₀₂`), hence it is a simplex of the marked mapping object
from `(Δ[n])^♯ × C^♮` to `D^♮`. Define the universal Cartesian fibration `q : Z ⟶ Cat∞ᵒᵖ` as the underlying
map of `Un⁺_φ F`, with φ the composite of the isomorphism `C[Cat∞ᵒᵖ] ≅ C[Cat∞]ᵒᵖ` (Part InfinityCategoryFoundations §2.1) with the opposite of
the counit `C[N(Cat^Δ_∞)] ⟶ Cat^Δ_∞` (HTT, §3.3.2, pp. 228–229). For a vertex C of `Cat∞ᵒᵖ`, write `U(C)` for the
fiber of q over C.

**Checks.**
- The vertices of `U(C)` are the vertices of C, by the definition of `Un⁺` over a vertex; for C = ∅ the fiber is
  empty.
- The base is `Cat∞ᵒᵖ`, not `Cat∞`. For a functor `g : C ⟶ D`, an edge `D ⟶ C` of `Cat∞ᵒᵖ`, Cartesian transport
  goes from the fiber `U(C)` over its target to `U(D)` and is `g` up to equivalence (§2.5). A classifier over `Cat∞`
  would transport in the direction opposite to g.
- The marked edges of `Un⁺_φ F` over a degenerate edge of `Cat∞ᵒᵖ` are equivalences of the fiber, not all
  edges.

*Needs:* §1.1.1 (marked unstraightening); Part InfinityCategoryFoundations §2.1.2, §2.1.4 (the counit and the opposite comparison); Tau Ceti `SSet.catInfty`,
`SSet.CatInftyΔ`, `SSet.Edge.CompStruct.isEquivalence₀₂`, marked mapping objects.

**2.1.2.** Define, for a Cartesian fibration p : X ⟶ K and a functor f : K ⟶ `Cat∞ᵒᵖ`, that f classifies p when there is
an equivalence of Cartesian fibrations over K from X to the pullback of Z along f: a map over K carrying
p-Cartesian edges to edges marked in `Un⁺_φ F`, whose underlying map is a categorical equivalence (HTT, Def.
3.3.2.2, p. 229). That the marked edges of `Un⁺_φ F` are its q-Cartesian edges, and that every Cartesian
fibration between small simplicial sets has a classifying map, are proved in §2.5. Dually, f : K ⟶ `Cat∞` classifies a coCartesian fibration p when `(op ∘ f)ᵒᵖ` classifies `pᵒᵖ`, with op the
involution of §1.8. That the fiber `X_s` is then equivalent to `f(s)` and the transport `e_!` to `f(e)`, using
`op(C) = Cᵒᵖ` and `op(g) = gᵒᵖ` (§1.8), is proved in §2.5. HTT's wording, `fᵒᵖ` classifies `pᵒᵖ` (HTT, Def.
3.3.2.2, p. 229), would give `f(s) ≃ (X_s)ᵒᵖ`, while HTT, Prop. 3.2.5.21 (3), p. 222, reads the values as the fibers;
the definition here follows the latter.

**Checks.**
- Over K = Δ[0], the vertex Δ[0] of `Cat∞ᵒᵖ` does not classify `Δ[0] ⊔ Δ[0] ⟶ Δ[0]`: `U(Δ[0])` has one vertex
  (first Check above), so a map to it from `Δ[0] ⊔ Δ[0]` identifies two objects with no morphism between them and
  is not fully faithful on homotopy categories. A definition by which every f classifies every p would accept it.
- Over K = Δ[1], the edge of `Cat∞ᵒᵖ` given by `g : Δ[0] ⟶ Δ[1]` picking 1 classifies `Δ[2] ⟶ Δ[1]` (0, 1 ↦ 0;
  2 ↦ 1), whose Cartesian edge into 2 is `1 ⟶ 2`, but not `N({0 < 1, 0 < 2}) ⟶ Δ[1]` (same values), whose only
  edge into 2 is `0 ⟶ 2`, so that its transport picks 0, which is not equivalent to 1 in Δ[1] (§2.5, transports).
  The two fibrations have the same fibers, Δ[1] over 0 and Δ[0] over 1, so a definition by fibers alone would
  accept both.
- The vertex ∅ of `Cat∞ᵒᵖ` classifies the Cartesian fibration ∅ ⟶ Δ[0], whose pullback `U(∅)` is empty, and
  does not classify the identity of Δ[0]: a map over Δ[0] from Δ[0] to `U(∅) = ∅` does not exist.

*Needs:* §2.1.1 (Z and its markings); §1.8.4 (the involution op); Part InfinityCategoryFoundations §2.1.6 (categorical equivalences); Part CartesianFibrations §1.1.1 (coCartesian fibrations, for
the dual); Tau Ceti `SSet.CartesianFibration`, `SSet.Edge.IsCartesian`; Mathlib `SSet.opFunctor`.

### 2.2 Invariance under categorical equivalence of the base

**2.2.1.** Prove that for a categorical equivalence `p : S ⟶ T`, `(p_!, p^*)` is a Quillen equivalence between the Cartesian
structures over S and over T (HTT, Prop. 3.3.1.1, p. 222), so that every Cartesian fibration `X ⟶ S` is equivalent, as
a Cartesian fibration over S, to `S ×_T Y` for a Cartesian fibration `Y ⟶ T` (HTT, Cor. 3.3.1.2, p. 223; `Suggested.lean` declaration
`exists_cartesianFibration_of_isCategoricalEquivalence`). The route:
straightening (§1.3) turns `p_!` into `C[p]_!`, a Quillen equivalence since `C[p]` is an equivalence (§1.7); for the
second statement take Y^♮ a fibrant replacement of `p_! X^♮` (Part CartesianFibrations §5.8) and use the derived unit.

*Needs:* §1.3.1; §1.7.1; Part CartesianFibrations §5.7.1 and §5.8.1; Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14);
ModelCategoryTheory, Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1) and §4.1.1 (HTT, §A.2.5); Part SimplicialCategories
§6.3.1 (HTT, Prop. A.3.3.8).

### 2.3 Cartesian fibrations are categorical fibrations; the Joyal and Cartesian structures over a Kan complex

**2.3.1.** Prove that every Cartesian fibration `p : X ⟶ S`, over an arbitrary simplicial set S, is a categorical fibration (HTT,
Prop. 3.3.1.7, p. 227; `Suggested.lean` declaration `categoricalFibrations_of_cartesianFibration`). Over an ∞-category, and for
pullbacks of
Cartesian fibrations over ∞-categories, this is Part CartesianFibrations §7.4; the statement here removes the
hypothesis on the base. The route (HTT, proof of Prop. 3.3.1.7, p. 227), for a lifting problem with top map
`f₀ : A ⟶ X` and bottom map `B ⟶ S` against a monic categorical equivalence `A ⊆ B`:
1. By §2.2 extend the base along a monic categorical equivalence `S ⊆ T` with T an ∞-category, so that there are a
   Cartesian fibration `Y ⟶ T` and an equivalence `u : X ⟶ Y_S = Y ×_T S` of Cartesian fibrations over S, with a
   strong homotopy inverse `v : Y_S ⟶ X` over S (Part CartesianFibrations §5.6, the fibrant objects `X^♮` and
   `Y_S^♮`).
2. `Y_S ⟶ S` is a pullback of a Cartesian fibration over an ∞-category, hence a categorical fibration (Part
   CartesianFibrations §7.4, HTT, Prop. 3.3.1.7, pullback form). So the lifting problem with top map `u ∘ f₀` has a
   solution `f′ : B ⟶ Y_S` over S.
3. Put `f‴ = v ∘ f′ : B ⟶ X`. Since `v ∘ u` is homotopic to the identity over S, through edges marked in `X^♮`,
   `f‴|A` is joined to `f₀` by a homotopy `A × Δ[1]^♯ ⟶ X^♮` over S ending at `f‴|A`.
4. Extend this homotopy to B with end `f‴`: the inclusion `(A × Δ[1]^♯) ∪ (B^♭ × {1}) ⊆ B^♭ × Δ[1]^♯` is marked
   anodyne (Part CartesianFibrations §5.2–§5.4, pushout-products with `{1}^♯ ⊆ Δ[1]^♯`), and `X^♮` is fibrant over
   `S^♯` because p is Cartesian (Part CartesianFibrations §5.3). Its restriction to `B × {0}` is the required lift.

The coCartesian form follows by passing to opposites.

*Needs:* §2.2.1; Part CartesianFibrations §5.2.1, §5.3.2, §5.4.1, §5.6.2 and §7.4.1 (HTT, Prop. 3.3.1.7 over an ∞-category and
for pullbacks); Part InfinityCategoryFoundations §9.4.1 and §9.5.1; Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14).

**2.3.2.** Prove that for a simplicial set S, the functor `X ↦ X^♭` from simplicial sets over S, with the Joyal structure on the
over category (Part InfinityCategoryFoundations §9.5 with Mathlib's `HomotopicalAlgebra.ModelCategory.over`), to marked simplicial
sets over S with the Cartesian structure (Part CartesianFibrations §5.7), left adjoint to forgetting markings, is a
left Quillen functor, and a Quillen equivalence when S is a Kan complex (HTT, Prop. 3.1.5.3, p. 183). The route:
`(−)^♭` preserves cofibrations, and for a trivial cofibration `X ⊆ Y` over S and a Cartesian fibration `Z ⟶ S`,
restriction `Map^♭_S(Y^♭, Z^♮) ⟶ Map^♭_S(X^♭, Z^♮)` is a trivial fibration, by lifting pushout-products of `X ⊆ Y`
with monomorphisms (Part InfinityCategoryFoundations §9.5, Cartesian closedness) against the categorical fibration `Z ⟶ S` (HTT,
Prop. 3.3.1.7, §2.3.1); so `X^♭ ⟶ Y^♭` is a Cartesian equivalence (Part CartesianFibrations §5.6). Over a Kan complex
S, a Cartesian fibration `Z ⟶ S` has Z an ∞-category whose Cartesian edges are its equivalences (Part
CartesianFibrations §1.3), so `Z^♭ ⟶ Z^♮` is a pushout of `K^♭ ⟶ K^♯` along the core K of Z, marked anodyne (Part
CartesianFibrations §5.2); with Ken Brown's lemma, a categorical equivalence `X ⟶ Z` over S gives a Cartesian
equivalence `X^♭ ⟶ Z^♮`. Conversely, factor `X ⟶ Z` as a trivial cofibration followed by a categorical fibration
`g : Y ⟶ Z`; then `Y ⟶ S` is Cartesian (HTT, Prop. 3.3.1.8, Part CartesianFibrations §7.4), g preserves Cartesian
edges, and `Y^♮ ⟶ Z^♮` is a Cartesian equivalence of fibrant objects with a strong homotopy inverse over S (Part
CartesianFibrations §5.6); so g is a categorical equivalence.

**Checks.**
- Over S = Δ[0], the bifibrant marked simplicial sets are the `C^♮` (Part CartesianFibrations §5.8) and
  `Map^♯(C^♮, D^♮)` is the core of `Fun(C, D)` (Part CartesianFibrations §5.5), so the simplicial category of
  bifibrant objects (HTT, Cor. 3.1.4.4) has coherent nerve `Cat∞` (HTT, §3.3.2, p. 228), and by this result
  `C ↦ C^♭` identifies the Joyal homotopy category with `h Cat∞` (ModelCategoryTheory, Part SimplicialCategories §1.3,
  HTT, Rem. A.3.1.8). The Joyal mapping objects would not do: `Fun(Δ[0], Δ[1]) = Δ[1]` is not a Kan complex.
- Over S = Δ[1] the adjunction is not a Quillen equivalence: for the Cartesian fibration `𝟙 Δ[1]`, the map
  `{1}^♭ ⟶ Δ[1]^♯` is a Cartesian equivalence (Part CartesianFibrations §5.6), but `{1} ⊆ Δ[1]` is not a
  categorical equivalence. So the Kan hypothesis cannot be dropped.
- Over S = Δ[0], `J^♭` (J the nerve of the free-living isomorphism) is not fibrant, since `J^♮ = J^♯`, while
  `Δ[1]^♭ = Δ[1]^♮` is: the left adjoint does not land in fibrant objects, and the comparison `C^♭ ⟶ C^♮` of the
  route is needed.

*Needs:* §2.3.1 (HTT, Prop. 3.3.1.7); Part CartesianFibrations §1.3.1, §5.2.1, §5.5.2, §5.6.1, §5.6.2, §5.7.1, §5.8.1,
§5.8.3 (HTT, Prop. 3.1.4.1; Cor. 3.1.4.4) and §7.4.2 (HTT, Prop. 3.3.1.8); Part InfinityCategoryFoundations §9.3.1 and
§9.5.1, §9.5.3; Mathlib `HomotopicalAlgebra.ModelCategory.over`; Tau Ceti `SSet.catInfty` (HTT, Def. 3.0.0.1); Tau
Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.5, the core);
ModelCategoryTheory, Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1) and §4.1.1 (HTT, §A.2.5, Quillen adjunctions).

### 2.4 Base change and the fiberwise criterion over arbitrary bases

**2.4.1.** Prove that for a Cartesian fibration `X ⟶ S` over an arbitrary simplicial set S and a categorical equivalence
`T ⟶ S`, the projection `X ×_S T ⟶ X` is a categorical equivalence (HTT, Prop. 3.3.1.3, p. 223; `Suggested.lean` declaration
`isCategoricalEquivalence_pullback_fst`). Over an ∞-category S this is Part CartesianFibrations §7.2; the statement
here removes the hypothesis on the base. A route: by §2.2 choose a monic categorical equivalence `S ⊆ S'` with S' an
∞-category and a Cartesian fibration `Y ⟶ S'` with `Y^♮` a fibrant replacement of the pushforward of `X^♮` (Part
CartesianFibrations §5.8), and write `Y_U = Y ×_{S'} U` for a map `U ⟶ S'`. The derived unit of
§2.2 is a Cartesian equivalence `X^♮ ⟶ Y_S^♮` of fibrant objects over S, so the map `X ⟶ Y_S` preserves Cartesian
edges and is a categorical equivalence on every fiber (Part CartesianFibrations §5.6, HTT, Prop. 3.1.3.5). Consider
the square of four maps

    X_T ⟶ X,   X_T ⟶ Y_T,   Y_T ⟶ Y_S,   X ⟶ Y_S.

`X ⟶ Y_S` and its base change `X_T ⟶ Y_T` along `T ⟶ S` are fiberwise equivalences preserving Cartesian edges, hence
categorical equivalences (Part CartesianFibrations §7.3, HTT, Prop. 3.3.1.5, (2) ⇒ (1), over any base; the fiberwise criterion over any base).
`Y_T ⟶ Y_S` is a categorical equivalence by the case of an ∞-category base (Part CartesianFibrations §7.2, HTT,
Prop. 3.3.1.3 over an ∞-category), applied to the categorical equivalence `T ⟶ S` over S'. By two out of
three, the projection `X_T ⟶ X` is a categorical equivalence.

*Needs:* §2.2.1; Part CartesianFibrations §5.6.2 (HTT, Prop. 3.1.3.5), §5.8.1, §7.2.1 (HTT, Prop. 3.3.1.3 over an ∞-category)
and
§7.3.1, §7.3.3 (HTT, Prop. 3.3.1.5, (2) ⇒ (1), over any base); Part InfinityCategoryFoundations §9.5.1; Part InfinityCategoryFoundations §2.1.6 (HTT,
Def. 1.1.5.14).

**2.4.2.** Prove that a pullback square of simplicial sets along a Cartesian fibration, over an arbitrary base, is homotopy
Cartesian for the Joyal structure (HTT, Cor. 3.3.1.4, p. 224): for a Cartesian fibration `X' ⟶ S'` and any map
`S ⟶ S'`, the square with corners `X = X' ×_{S'} S`, `X'`, `S` and `S'` is homotopy Cartesian. The Joyal structure is
not right proper and neither S nor S' need be fibrant, so the route replaces the cospan by a fibrant one (HTT, proof
of Cor. 3.3.1.4, p. 224):
1. By §2.2 (HTT, Cor. 3.3.1.2) choose a monic categorical equivalence `S' ⊆ S″` with S″ an ∞-category, a Cartesian
   fibration `X″ ⟶ S″` and an equivalence `X' ⟶ X″ ×_{S″} S'` of Cartesian fibrations over S', a fiberwise
   equivalence preserving Cartesian edges (Part CartesianFibrations §5.6).
2. Factor `S ⟶ S″` as a categorical equivalence `S ⟶ T` followed by a categorical fibration `T ⟶ S″`. Then T is an
   ∞-category, `X″ ⟶ S″` is a categorical fibration (Part CartesianFibrations §7.4), and the cospan
   `T ⟶ S″ ⟵ X″` is fibrant, so `T ×_{S″} X″` is its homotopy pullback. This cospan is weakly equivalent to
   `S ⟶ S' ⟵ X'`: the maps `S ⟶ T` and `S' ⟶ S″` are categorical equivalences, and so is `X' ⟶ X″`, the composite
   of the categorical equivalence of step 1 (Part CartesianFibrations §7.3, HTT, Prop. 3.3.1.5, (2) ⇒ (1); the fiberwise criterion over any base) with
   `X″ ×_{S″} S' ⟶ X″` (Part CartesianFibrations §7.2).
3. It remains to show that `X ⟶ T ×_{S″} X″` is a categorical equivalence. Pulling the fiberwise equivalence of
   step 1 back along `S ⟶ S'` gives a categorical equivalence `X ⟶ X″ ×_{S″} S` (Part CartesianFibrations §7.3,
   the fiberwise criterion over any base, for the base change along `S ⟶ S'`), and `X″ ×_{S″} S ⟶ X″ ×_{S″} T` is a categorical equivalence
   by Part CartesianFibrations §7.2 (HTT, Prop. 3.3.1.3 over an ∞-category), applied to the categorical equivalence `S ⟶ T` over the
   ∞-category S″. Two out of three concludes.

*Needs:* §2.2.1 (HTT, Cor. 3.3.1.2); Part CartesianFibrations §5.6.2, §7.2.1 (HTT, Prop. 3.3.1.3 over an ∞-category), §7.3.1, §7.3.3 (HTT, Prop. 3.3.1.5, (2) ⇒ (1), over any base; the fiberwise criterion over any base) and §7.4.1 (HTT, Prop. 3.3.1.7 over an
∞-category); Part InfinityCategoryFoundations §9.4.1 and §9.5.1; ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT,
Prop. A.1.2.5 (1), factorizations) and §3.5.1 (HTT, §A.2.4, homotopy pullbacks).

**2.4.3.** Prove that for Cartesian fibrations `p : X ⟶ S`, `q : Y ⟶ S` over an arbitrary simplicial set S and a map `f : X ⟶ Y`
over S carrying p-Cartesian edges to q-Cartesian edges, the following are equivalent: (1) f is a categorical
equivalence; (2) every fiber map `X_s ⟶ Y_s` is a categorical equivalence; (3) `X^♮ ⟶ Y^♮` is a Cartesian
equivalence (HTT, Prop. 3.3.1.5, p. 225; (1) ⇔ (2) is the `Suggested.lean` declaration `isCategoricalEquivalence_iff_fiber`). Part
CartesianFibrations §7.3 states (2) ⇔ (3) ⇒ (1) over every base and (1) ⇒ (2) over an ∞-category base; the
statement here adds only (1) ⇒ (2) over an arbitrary base. A route (HTT, proof of Prop. 3.3.1.5, p. 225): by §2.2
choose a monic categorical equivalence `j : S ⊆ S'` with S' an ∞-category. Take a marked anodyne map
`j_! X^♮ ⟶ X'^♮` over `S'^♯` with `X' ⟶ S'` a Cartesian fibration, and then a marked anodyne map
`X'^♮ ⊔_{j_! X^♮} j_! Y^♮ ⟶ Y'^♮` with `Y' ⟶ S'` a Cartesian fibration (Part CartesianFibrations §5.3, §5.7). This
gives a map `f' : X' ⟶ Y'` over S' preserving Cartesian edges and a strictly commuting square with f.
- `X ⟶ X'_S = X' ×_{S'} S` and `Y ⟶ Y'_S` are derived units of the Quillen equivalence of §2.2, hence Cartesian
  equivalences of fibrant objects over S, so fiberwise equivalences preserving Cartesian edges (Part
  CartesianFibrations §5.6) and categorical equivalences (Part CartesianFibrations §7.3, HTT, Prop. 3.3.1.5, (2) ⇒ (1); the fiberwise criterion over any base).
- If f is a categorical equivalence, so is `f'_S` by two out of three. The projections `X'_S ⟶ X'` and
  `Y'_S ⟶ Y'` are categorical equivalences (Part CartesianFibrations §7.2, HTT, Prop. 3.3.1.3 over the ∞-category
  S'), so f' is one by two out of three, and the ∞-category-base direction (1) ⇒ (2) of Part CartesianFibrations
  §7.3 (HTT, Prop. 3.3.1.5, (1) ⇒ (2), over an ∞-category; Lemma F) makes its fiber maps `X'_s ⟶ Y'_s` categorical equivalences.
- For a vertex s of S, the fiber maps `X_s ⟶ X'_s` and `Y_s ⟶ Y'_s` are categorical equivalences by the first
  bullet, so `X_s ⟶ Y_s` is one by two out of three.

*Needs:*
- §2.2.1.
- Part CartesianFibrations §5.3.2, §5.6.2, §5.7.1, §5.8.1, §7.2.1 (HTT, Prop. 3.3.1.3 over an ∞-category) and §7.3.1, §7.3.2, §7.3.3 (HTT,
  Prop. 3.3.1.5: (2) ⇔ (3) ⇒ (1) over any base, with the fiberwise criterion over any base; (1) ⇒ (2) over an ∞-category base, with Lemma F).
- Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1))
  and §3.4.1 (HTT, Def. A.2.4.1).

### 2.5 Classifying maps and the classification of right fibrations

**2.5.1.** Prove that the universal Cartesian fibration `q : Z ⟶ Cat∞ᵒᵖ` of §2.1, the underlying map of
`Un⁺_φ F` for the simplicial functor `F : C ↦ C^♮`, is a Cartesian fibration, that its q-Cartesian edges are
exactly the marked edges of `Un⁺_φ F`, that its fiber over a vertex C is `U(C)`, with a canonical categorical
equivalence `C ⟶ U(C)` (HTT, §3.3.2, p. 228), and that for the edge `D ⟶ C` of `Cat∞ᵒᵖ` given by a functor
`g : C ⟶ D`, the Cartesian transport `U(C) ⟶ U(D)` corresponds to g under `C ⟶ U(C)` and `D ⟶ U(D)`. More generally,
for a composable sequence `C₀ ⟵ C₁ ⟵ ⋯ ⟵ C_n` of functors of ∞-categories, with `σ : Δ[n] ⟶ Cat∞ᵒᵖ` the opposite
of the nerve of the functor `[n]ᵒᵖ ⥤ Cat^Δ_∞`, `i ↦ C_i`, the marked simplicial set `M^♮` of the sequence (Part
CartesianFibrations §6.1) is Cartesian equivalent over `Δ[n]^♯` to `(σ^*Z)^♮`, by a map `M^♮ ⟶ (σ^*Z)^♮` over
`Δ[n]^♯` that is `C_i ⟶ U(C_i)` on the fibers; so it is a quasi-equivalence (Part CartesianFibrations §6.2). The
mapping simplex of the sequence is in general not a Cartesian fibration, nor even an inner fibration (HTT,
Rem. 3.2.2.4, p. 197): for the sequence `Δ[1] ⟵ Δ[0]` picking 1 it is `Λ[2, 1]`, with no edge from 0 to the vertex
over 1. In particular the composition equivalences of the Cartesian transports of `σ^*Z` correspond to the strict
composites of the sequence: in `M^♮`, a 2-simplex `(f, τ)`, with `f : [2] ⟶ [n]` injective and τ a 2-simplex of
`C_{f(2)}` constant at a vertex, has all three edges marked, so the map to `(σ^*Z)^♮` carries it to a 2-simplex of Cartesian edges, which
exhibits the transport along the long edge as the strict composite. (A merely degenerate τ does not
suffice: for `τ = s₀(e)` with e an edge of `C_{f(2)}`, the edge over `{1, 2}` has component e and is not marked.) A route: F is projectively fibrant, since its values `C^♮` are
fibrant marked simplicial sets over Δ[0] (Part CartesianFibrations §5.8). `Un⁺_φ` is right Quillen (§1.5), so
`Un⁺_φ F` is a fibrant object over `Cat∞ᵒᵖ`, hence isomorphic to `X^♮` for a Cartesian fibration X (Part
CartesianFibrations §5.8, HTT, Prop. 3.1.4.1); so q is a Cartesian fibration whose Cartesian edges are the marked
ones. By base change (§1.3) the fiber over C is the unstraightening over a point of `C^♮`, and the map `C^♮ ⟶ U(C)^♮`
adjoint to the Cartesian equivalence `T(C^♮) ⟶ C^♮` of §1.5 is the derived unit of the Quillen self-equivalence T
(§1.6, HTT, Lemmas 3.2.3.1–3.2.3.2), hence a Cartesian equivalence of fibrant objects over Δ[0], that is a
categorical equivalence `C ⟶ U(C)` (Part CartesianFibrations §5.6). The base `Cat∞ᵒᵖ` is large, so the straightening
theorem is applied here one universe up, to simplicial sets of `SSet.{u + 1}`, in which `Cat∞` is small. For the
transports, over Δ[n]:
- base change along σ (§1.3) identifies the pullback of Z with `Un⁺_{Δ[n]}` of the diagram `i ↦ C_i^♮`;
- HTT, Lemma 3.2.3.3 (§1.6), stated for composable sequences of length n, with the Quillen equivalence over Δ[n]
  of §1.6, compares it with the marked mapping simplex `M^♮` of the sequence (Part CartesianFibrations §6.1): every
  object of `(Set⁺_Δ)/Δ[n]` is cofibrant and `(σ^*Z)^♮` is fibrant, so the comparison is a map
  `M^♮ ⟶ (σ^*Z)^♮` over `Δ[n]^♯`, a Cartesian equivalence that is `C_i ⟶ U(C_i)` on the fibers;
- for n = 1 and the sequence `D ⟵ C` given by g, the marked edges of `M^♮(g)` over `0 ⟶ 1` run from `g(c)` to c,
  and `C^♭ × Δ[1]^♯ ⟶ M^♮(g)`, the identity over 1 and g over 0, preserves markings; composed with the map to
  `(σ^*Z)^♮` it carries each `{c} × Δ[1]` to a Cartesian edge, so the transport of `σ^*Z` is g under
  `C ⟶ U(C)` and `D ⟶ U(D)` (Part CartesianFibrations §6.2, the quasi-equivalence exhibits g as the transport).

*Needs:* §1.3.1; §1.5.1 (the Quillen adjunction; HTT, Prop. 3.2.1.14); §1.6.1 (HTT, Lemmas 3.2.3.1–3.2.3.3; Prop.
3.2.3.4); Part CartesianFibrations §5.6.2, §5.8.1 (HTT, Prop. 3.1.4.1), §6.1.1 (HTT, §3.2.2, mapping simplices; Rem.
3.2.2.4) and §6.2.1 (HTT, Def. 3.2.2.6, quasi-equivalences); §2.1.1 (the universal Cartesian fibration); Tau Ceti
`TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Tau Ceti `SSet.catInfty`, `SSet.CartesianFibration`, `TauCeti.MarkedSSet`;
ModelCategoryTheory, Part ModelCategories §4.1.1 (HTT, §A.2.5) and §7.2.1 (HTT, Prop. A.2.8.2, projective structure).

**2.5.2.** Prove that every Cartesian fibration `X ⟶ S` between small simplicial sets has a classifying map `S ⟶ Cat∞ᵒᵖ` in the
sense of §2.1 (HTT, Def. 3.3.2.2); more precisely, for an uncountable regular cardinal κ, it is
classified by a map to `Cat∞(κ)ᵒᵖ`, the κ-small ∞-categories, exactly when every fiber is essentially κ-small (HTT,
Rem. 3.3.2.3, existence part, p. 229; uniqueness of the classifying map is not claimed). The route: by §1.7, choose a projectively fibrant replacement
`St⁺ X^♮ ⟶ F_X` of functors `C[S]ᵒᵖ ⥤ Set⁺_Δ`. Every object over Δ[0] is cofibrant, and the bifibrant marked
simplicial sets over Δ[0] are the `C^♮`, with `Map^♯(C^♮, D^♮)` the core of `Fun(C, D)` (Part CartesianFibrations
§5.8, HTT, Prop. 3.1.4.1, Cor. 3.1.4.4). So `F_X` is a simplicial functor into the bifibrant marked simplicial sets,
adjoint to a map `g : S ⟶ N((Set⁺_Δ)°)ᵒᵖ ≅ Cat∞ᵒᵖ` (Part LimitsAndKanExtensions §3.8, step 3). By §1.3, read on right
adjoints, `Un⁺(F_X)` is the pullback of `Un⁺_φ F` along g, and the derived unit `X^♮ ⟶ Un⁺(F_X)` is a Cartesian
equivalence of fibrant objects over S, hence a map preserving Cartesian edges and a categorical equivalence (Part
CartesianFibrations §5.6 and §7.3, HTT, Prop. 3.3.1.5, (2) ⇒ (1); the fiberwise criterion over any base); so g classifies X. For κ: the values `F_X(s)` are equivalent to the
fibers `X_s`, by §2.5.1 and the fiberwise form of the Cartesian equivalence `X^♮ ⟶ Un⁺(F_X)` (Part
CartesianFibrations §5.6, HTT, Prop. 3.1.3.5, (3) ⇒ (2)). If they are essentially κ-small, the
inclusion of `Cat∞(κ)` into the full simplicial subset of `Cat∞` on the ∞-categories equivalent to κ-small ones is
fully faithful and essentially surjective, hence a categorical equivalence (Part InfinityCategoryFoundations §2.1), so g is joined by
a homotopy `S × J ⟶ Cat∞ᵒᵖ` to a map into `Cat∞(κ)ᵒᵖ`, J the nerve of the free-living isomorphism. Let W be the
pullback of Z along the homotopy, with ends `W₀` and `W₁` over `S × {0}` and `S × {1}`.
- `W ⟶ S × J ⟶ S` is a Cartesian fibration, as a composite (Tau Ceti `SSet.CartesianFibration.comp`, HTT,
  Prop. 2.4.2.3), since `S × J ⟶ S` is one whose Cartesian edges are those with an equivalence as J-component, here
  all edges (Part CartesianFibrations §1.3).
- The inclusions `W_i ⊆ W` preserve Cartesian edges over S and are categorical equivalences (§2.4, HTT,
  Prop. 3.3.1.3, along the categorical equivalences `S × {i} ⊆ S × J`), hence Cartesian equivalences of fibrant
  objects over S (§2.4, (1) ⇒ (3); Part CartesianFibrations §5.6).
- So the inclusion `W₁ ⊆ W` has a homotopy inverse `W ⟶ W₁` over S preserving Cartesian edges (Part CartesianFibrations §5.6), and
  the composite `X ⟶ W₀ ⟶ W ⟶ W₁` is an equivalence of Cartesian fibrations over S from X to the pullback of Z along
  the map into `Cat∞(κ)ᵒᵖ`, which therefore classifies X (§2.1, HTT, Def. 3.3.2.2). Conversely, the fibers of a pullback of Z along a
map into `Cat∞(κ)ᵒᵖ` are equivalent to its κ-small values. Dually, by §1.8, with the coCartesian model structure of
Part CartesianFibrations §5.7 (HTT, Rem. 3.1.3.9; Rem. 3.1.4.6), a coCartesian fibration `p : X ⟶ S` is classified by a functor
`S ⟶ Cat∞`: if `g : Sᵒᵖ ⟶ Cat∞ᵒᵖ` classifies `pᵒᵖ`, then `f = op ∘ gᵒᵖ` classifies p, since `(op ∘ f)ᵒᵖ ≃ g` by
`op ∘ op ≃ 𝟙` (§1.8) and classification depends only on the classifying map up to equivalence (by pulling Z back
along a homotopy, as in the κ-argument above; the natural equivalence `op ∘ op ≃ 𝟙`, an edge of
`Fun(Cat∞, Cat∞)`, extends along `Δ[1] ⊆ J` to such a homotopy by Part InfinityCategoryFoundations §9.7). For any f
classifying p in the sense of §2.1, the fibers and transports are the values of f, covariantly: for a vertex s,
`(X_s)ᵒᵖ = (Xᵒᵖ)_s ≃ U(op f(s)) ≃ f(s)ᵒᵖ` by `C ⟶ U(C)` and `op(C) = Cᵒᵖ`, so `X_s ≃ f(s)`; for an edge
`e : s ⟶ t`, the edge `(op ∘ f)ᵒᵖ(eᵒᵖ)` of `Cat∞ᵒᵖ` is given by the functor `op(f(e)) = f(e)ᵒᵖ`, so by the
transport statement of §2.5.1 the Cartesian transport `(e_!)ᵒᵖ` of `Xᵒᵖ` along `eᵒᵖ` is `f(e)ᵒᵖ`, and `e_! ≃ f(e)`. A
map that is both a Cartesian and a coCartesian fibration is classified in both ways (HTT, Warning 3.3.2.4, p. 229).

**Checks.**
- Over nerves the two readings of the dual classification agree. For an ordinary category C, a functor
  `f : C ⥤ Cat^Δ_∞` and `fᵒᵖ = (c ↦ f(c)ᵒᵖ)`, `(op ∘ N(f))ᵒᵖ ≃ N(fᵒᵖ)ᵒᵖ` by §1.8, and by §1.3, read on right
  adjoints as in the existence route above, the pullback of Z along `N(fᵒᵖ)ᵒᵖ` is `Un⁺_{φ'}` of `c ↦ (f(c)ᵒᵖ)^♮`;
  so N(f) classifies the coCartesian fibration `(Un⁺_{φ'}(fᵒᵖ))ᵒᵖ` of §1.8, whose fibers are the `f(c)`, as in HTT,
  Prop. 3.2.5.21 (3), p. 222.

*Needs:* §1.3.1; §1.7.1; §1.8.4 (op, with `op ∘ N(f) ≃ N(fᵒᵖ)`); §2.4.1, §2.4.3 (HTT, Props. 3.3.1.3, 3.3.1.5); §2.5.1; Part
InfinityCategoryFoundations §9.7.1 (HTT, Prop. 2.2.5.7, equivalent maps are J-homotopic); Part CartesianFibrations §1.3.1 (HTT, Prop. 2.4.1.5), §5.6.2 (HTT, Prop. 3.1.3.5), §5.7.2 (HTT, Rem. 3.1.3.9; Rem. 3.1.4.6), §5.8.1, §5.8.3 (HTT, Prop. 3.1.4.1; Cor. 3.1.4.4) and §7.3.1, §7.3.3
(HTT, Prop. 3.3.1.5, (2) ⇒ (1); the fiberwise criterion over any base); Part LimitsAndKanExtensions §3.8.1 (step 3, `N((Set⁺_Δ)°) ≅ Cat∞`); Tau Ceti `SSet.catInfty` (HTT,
Def. 3.0.0.1), `SSet.CartesianFibration.comp`; §2.1.2 (HTT, Def. 3.3.2.2; §3.3.2, the universal Cartesian fibration); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15,
smallness), §1.2.1 (HTT,
§1.2.11, full subcategories) and §2.1.6, §2.1.8 (fully faithful and essentially surjective maps).

**2.5.3.** Define the restriction `q' : Z' ⟶ 𝒮ᵒᵖ` of the universal Cartesian fibration `Z ⟶ Cat∞ᵒᵖ` of §2.1 to
the ∞-category 𝒮 of spaces, the full simplicial subset of `Cat∞` on the Kan complexes (HTT, Warning 3.3.2.4, p. 229).
Lurie calls q' the universal right fibration; here that name is reserved for the slice projection
`(𝒮ᵒᵖ)_{/∗} ⟶ 𝒮ᵒᵖ` of Part InfinityCategoryFoundations §7.1 and §7.7, and q' is compared with it in §2.5.4.

- q' is a Cartesian fibration, as a pullback of q, and its fibers `U(K) ≃ K` are Kan complexes by §2.5.1 and Part InfinityCategoryFoundations §5.1 (HTT, Prop. 1.2.5.1); so q' is a right fibration by Part CartesianFibrations §2.2 (HTT, Prop. 2.4.2.4).

**Checks.**
- The fiber of q' over a Kan complex K is equivalent to K; over Δ[0] it is Δ[0].
- `Z ⟶ Cat∞ᵒᵖ` itself is not a right fibration: its fiber over the vertex Δ[1] of `Cat∞` is equivalent to Δ[1], not a
  Kan complex. Restricting to 𝒮 is what makes it one.
- The fiber of q' over `Δ[0] ⊔ Δ[0]` has two vertices and no nondegenerate edges, and over ∅ it is empty: q'
  classifies the identity functor of 𝒮, not a constant one, and is not a categorical equivalence onto 𝒮ᵒᵖ.

*Needs:* §2.5.1; Part CartesianFibrations §2.2.1; §2.1.1, §2.1.2 (HTT, §3.3.2, the universal Cartesian fibration; Def. 3.3.2.2); Part InfinityCategoryFoundations §5.1.1 (HTT, Prop. 1.2.5.1, an ∞-category equivalent to
a Kan complex is one), §7.1.2 (HTT, Def. 1.2.16.1) and §9.7.2 (HTT, Prop. 2.2.5.8); Tau Ceti `SSet.catInfty` (HTT,
Def. 3.0.0.1), `SSet.CartesianFibration.of_isPullback`.

**2.5.4.** Prove that q' is equivalent to the universal right fibration, and that the two readings of "classifies" agree for
right fibrations (HTT, Cor. 3.3.2.7, p. 231, and the `Cat∞` form of HTT, Prop. 3.3.2.5, p. 230):
1. Z' is isomorphic over 𝒮ᵒᵖ to the unstraightening `Z₀ = Un_ε(ι)` of the inclusion of Kan complexes of Part
   InfinityCategoryFoundations §7.7, and so joined to `(𝒮ᵒᵖ)_{/∗}` by the pointwise equivalence `e : (𝒮ᵒᵖ)_{/∗} ⟶ Z₀` of
   Part InfinityCategoryFoundations §7.7 (2); all edges of Z' are marked in `Un⁺_φ F`;
2. for a right fibration `p : X ⟶ K` and a map `g : K ⟶ 𝒮ᵒᵖ`, g classifies p in the sense of Part InfinityCategoryFoundations §7.1,
   through a zigzag of pointwise equivalences with `K ×_{𝒮ᵒᵖ} (𝒮ᵒᵖ)_{/∗}`, exactly when g followed by the inclusion
   `𝒮ᵒᵖ ⊆ Cat∞ᵒᵖ` classifies p as a Cartesian fibration (HTT, Def. 3.3.2.2).

A route for (1): on a Kan complex C the marking `C^♮` is `C^♯`, so the restriction of `C ↦ C^♮` to Kan complexes is
the inclusion of Kan complexes with all edges marked. Base change in the target, along `Kan ⊆ Cat^Δ_∞`, is the second
half of Part InfinityCategoryFoundations §7.2 (`St_{πᵒᵖ ∘ φ} ≅ π_! ∘ St_φ`, read on right adjoints) and its marked form in §1.3;
base change in the base, along `𝒮ᵒᵖ ⊆ Cat∞ᵒᵖ`, is the first half (HTT, Prop. 2.2.1.1), with the opposite comparison of
Part InfinityCategoryFoundations §7.1. Marked unstraightening of a functor with sharp values has the unmarked unstraightening `Un_φ` (Part
InfinityCategoryFoundations §7.1) as underlying simplicial set, with all edges marked: `Un⁺_φ F` has the simplices of `Un_φ F`,
and an edge is marked when its map extends over `St⁺_φ(Δ[1]^♯)`, which is automatic for sharp values (§1.1, HTT,
Def. 3.2.1.2). So `Z' ≅ Z₀` over 𝒮ᵒᵖ.

A route for (2). Maps between right fibrations over K preserve Cartesian edges automatically, all edges being
Cartesian, and by (1) all edges of `K ×_{𝒮ᵒᵖ} Z'` are marked.
- *Cartesian reading ⇒ unmarked reading.* A categorical equivalence `X ⟶ K ×_{𝒮ᵒᵖ} Z'` over K is a fiberwise
  categorical equivalence by §2.4 (HTT, Prop. 3.3.1.5, (1) ⇒ (2), over an arbitrary base). Its fiber maps go between
  Kan complexes, so they are homotopy equivalences (Part CartesianFibrations §7.3, the last step of Lemma F), hence
  pointwise equivalences. With the base change of e along g, pointwise by Part InfinityCategoryFoundations §7.4, this gives the
  zigzag `X ⟶ K ×_{𝒮ᵒᵖ} Z₀ ⟵ K ×_{𝒮ᵒᵖ} (𝒮ᵒᵖ)_{/∗}` of Part InfinityCategoryFoundations §7.1.
- *Unmarked reading ⇒ Cartesian reading.* Composing the zigzag with the base change of e joins X to
  `K ×_{𝒮ᵒᵖ} Z₀` by pointwise equivalences, which are contravariant equivalences (Part InfinityCategoryFoundations §7.6, HTT,
  Cor. 2.2.3.13). Every object of the contravariant structure over K is cofibrant, and `K ×_{𝒮ᵒᵖ} Z₀`, a right
  fibration, is fibrant (Part InfinityCategoryFoundations §7.6, HTT, Cor. 2.2.3.12). So the zigzag is represented by one map
  `X ⟶ K ×_{𝒮ᵒᵖ} Z₀` over K, a contravariant, hence pointwise, equivalence (HTT, Cor. 2.2.3.13). Its fiber maps are
  homotopy equivalences of Kan complexes (ModelCategoryTheory, Part KanQuillen §1.3), hence categorical equivalences
  (Part InfinityCategoryFoundations §9.7: a homotopy into a Kan complex extends along `Δ[1] ⊆ J`),
  so it is a categorical equivalence over the arbitrary base K by Part CartesianFibrations §7.3 (HTT, Prop. 3.3.1.5,
  (2) ⇒ (1), over any base; the fiberwise criterion over any base). With `Z' ≅ Z₀`, g classifies p in the sense of HTT, Def. 3.3.2.2.

Consequences:
- The vertex of Z' over the point Δ[0] is a final object of Z': under `Z' ≅ Z₀` it is the vertex `∗_Z` of
  Part InfinityCategoryFoundations §7.7 (1) (HTT, Prop. 3.3.2.6).
- A Cartesian fibration `p : X ⟶ K` between small simplicial sets is a right fibration exactly when some,
  equivalently every, classifying map `K ⟶ Cat∞ᵒᵖ` factors through `𝒮ᵒᵖ`. The fibers of the pullback of Z along a
  classifying map g are equivalent to the values of g, by §2.5.1 and §2.4 (HTT,
  Prop. 3.3.1.5, (1) ⇒ (2)). An ∞-category equivalent to a Kan complex is a Kan complex, since its homotopy category
  is a groupoid (Part InfinityCategoryFoundations §5.1, HTT, Prop. 1.2.5.1). So if p is a right fibration, its fibers are Kan
  complexes and every classifying map takes values in 𝒮; conversely, if some classifying map does, the fibers of p
  are Kan complexes and p is a right fibration (Part CartesianFibrations §2.2). The smallness hypothesis is needed for
  "every" to have content: a classifying map exists by §2.5.2.

*Needs:* §2.5.1 and §2.5.3 (the restriction q'); §1.3.1 (HTT, Prop. 3.2.1.4 (3)); §2.4.3 (HTT,
Prop. 3.3.1.5, (1) ⇒ (2), over an arbitrary base); Part InfinityCategoryFoundations §5.1.1 (HTT, Prop. 1.2.5.1), §7.2.1 (HTT,
Prop. 2.2.1.1, both halves), §7.4.1 (pointwise equivalences), §7.6.1 (HTT, Cors. 2.2.3.12, 2.2.3.13) and §7.7.1 (classifying maps of small right fibrations); §1.1.1 (marked unstraightening) and §2.1.2 (HTT, Def. 3.3.2.2); Part
InfinityCategoryFoundations §2.1.2 (the opposite comparison) and §7.1.5, §7.1.6, §7.1.8 (unmarked unstraightening; the universal right fibration and the
classification of right fibrations); Part
CartesianFibrations §2.2.1 (HTT, Prop. 2.4.2.4) and §7.3.1, §7.3.2, §7.3.3 (HTT, Prop. 3.3.1.5, (2) ⇒ (1), over any base; the fiberwise criterion over any base;
Lemma F); Part InfinityCategoryFoundations §9.7.2 (HTT, Prop. 2.2.5.8); ModelCategoryTheory, Part KanQuillen §1.3.3 (homotopy equivalences of Kan
complexes); Tau Ceti
`SSet.RightFibration`, `SSet.catInfty`.

### 2.6 Cartesian sections as derived global sections

**2.6.1.** Prove that for a small category C and a strongly fibrant `F : Cᵒᵖ ⥤ Set⁺_Δ`, the ∞-category of Cartesian sections of
`Un⁺_φ F`, that is `Map^♭_{N(C)}(N(C)^♯, Un⁺_φ F)` for the counit `φ : C[N(C)] ⟶ C` (so that straightening takes
values in functors `Cᵒᵖ ⥤ Set⁺_Δ`), is the homotopy limit of F for the injective structure, as an isomorphism in the
homotopy category of Set⁺_Δ (HTT, §3.3.3, used in the proof of Prop. 3.3.3.1, pp. 232–233). Here `Un⁺_φ F` is `X^♮`
for a Cartesian fibration X (§1.5, Part CartesianFibrations §5.8). The route: the maps
`St⁺_φ(K^♯ × Z) ⟶ St⁺_φ(K^♯) ⊠ St⁺(Z) ⟶ δ(St⁺(Z))` are weak equivalences (§1.5, and §1.7 for the final object), so
the derived right adjoints of `Z ↦ K^♯ × Z` and of the constant diagram δ agree under straightening.

*Needs:* §1.5.1, §1.5.2; §1.7.1; Part CartesianFibrations §5.8.1; ModelCategoryTheory, Part SimplicialCategories §3.2.1 (HTT, §A.2.8,
homotopy limits) and §6.1.1 (HTT, Prop. A.3.3.2).

### Examples

- For S = Δ[1], a Cartesian fibration `X ⟶ Δ[1]` is classified by an edge of `Cat∞ᵒᵖ`, that is a functor
  `X₁ ⟶ X₀`, its transport functor (§2.5). Every functor g arises this way: the pullback of Z along the edge given
  by g has transport g, and receives a quasi-equivalence from the marked mapping simplex `M^♮(g)` of Part
  CartesianFibrations §6.1 (§2.5), although `M(g)` itself need not be a Cartesian fibration.
- The inclusion `Λ[2, 1] ⊆ Δ[2]` is a categorical equivalence, so by §2.2 every Cartesian fibration over `Λ[2, 1]`,
  given by two transport functors `X₂ ⟶ X₁ ⟶ X₀`, is the restriction of one over Δ[2], whose transport along the long
  edge is their composite; by §2.4 the total spaces over `Λ[2, 1]` and over Δ[2] are categorically equivalent, although
  `Λ[2, 1]` is not an ∞-category.
- For a Kan complex S and a map `X ⟶ S`, §2.3 and Part CartesianFibrations §7.4 make the three conditions "Cartesian
  fibration", "coCartesian fibration" and "categorical fibration" agree, and Prop. 3.1.5.3 identifies the Joyal
  structure over S with the Cartesian one.

### Dependencies

Layer 1; Part CartesianFibrations (base change, fiberwise criteria and categorical fibrations over ∞-category bases,
the Cartesian and coCartesian model structures, mapping simplices); Part InfinityCategoryFoundations (the Joyal structure, unmarked
base change, the contravariant structure and the classifying maps of §7.7, spaces); Tau Ceti's `Cat∞`; ModelCategoryTheory, Parts ModelCategories and SimplicialCategories.

## Layer 3: Limits, colimits and descent in `Cat∞`

### 3.1 Cofinal base change and Cartesian equivalences

**3.1.1.** Prove that in a pullback square `X' = X ×_S S'` with `X ⟶ S` a Cartesian fibration and `q : S' ⟶ S` such that `qᵒᵖ` is
cofinal, the induced map `X'^♮ ⟶ X^♮` is a Cartesian equivalence in `Set⁺_Δ` over a point (HTT, Lemma 3.3.4.1,
p. 235). A route: first reduce to q a monomorphism (HTT, proof of Lemma 3.3.4.1, p. 235). Choose a monomorphism `S' ⟶ K`
into a contractible Kan complex K and factor q as `S' ⟶ S × K ⟶ S`; the pullback of X to `S × K` is `X × K`, and
`X^♮ × K^♯ ⟶ X^♮` is a Cartesian equivalence over a point (Part CartesianFibrations §5.8–§5.9, K being weakly
contractible), so q may be replaced by the monomorphism `S' ⟶ S × K`, whose opposite is again cofinal since
`S × K ⟶ S` is a trivial fibration. A monomorphism with cofinal opposite is left anodyne (Part LimitsAndKanExtensions
§2.3, HTT, Prop. 4.1.1.3), and the class of maps for which the statement holds is weakly saturated, since Cartesian
equivalences are stable under pushouts and transfinite composites (HTT 3.1.3.7, Part
CartesianFibrations §5.7). For left horn inclusions use the mapping simplex (HTT 3.2.2.7, 3.2.2.14) and the comparison
of the Cartesian and Kan–Quillen structures over a point (HTT 3.1.5.6, 3.1.5.7).

*Needs:* Part LimitsAndKanExtensions §2.3.1; Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Part
LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); Mathlib `SSet.KanComplex`; Tau Ceti `SSet.CartesianFibration`; Part
CartesianFibrations §5.2.1 (HTT, notation of §3.1.1), §5.6.1 (HTT, Prop. 3.1.3.3), §5.7.1 (HTT, Prop. 3.1.3.7), §5.8.2
(HTT, Prop. 3.1.4.2), §5.9.2, §5.9.3 (HTT, Props. 3.1.5.6, 3.1.5.7) and §6.3.2, §6.3.3 (HTT, Props. 3.2.2.7,
3.2.2.14); ModelCategoryTheory, Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2); ModelCategoryTheory, Part KanQuillen
§3.2.1 (HTT, §A.2.7).

### 3.2 Limits in `Cat∞` and in spaces

**3.2.1.** Prove that for `p̄ : K^▷ ⟶ Cat∞ᵒᵖ` classifying a Cartesian fibration `X̄ ⟶ K^▷`, with `X = X̄ ×_{K^▷} K`, `p̄ᵒᵖ` is a
limit diagram in `Cat∞` exactly when restriction of Cartesian sections `Map♭_{K^▷}((K^▷)^♯, X̄^♮) ⟶ Map♭_K(K^♯, X^♮)`
is an equivalence of ∞-categories (HTT, Prop. 3.3.3.1, p. 232). Here `Map♭_K(K^♯, X^♮)` is the ∞-category of sections
carrying every edge to a Cartesian edge. A route in two steps.

1. **Reduction to a strict diagram** (HTT, Prop. 3.3.3.1, first step of the proof, p. 232). For a cofinal
   `f : N(C) ⟶ K` with C a small category (Part LimitsAndKanExtensions §6.4), the section condition holds for p̄
   exactly when it holds for `p̄ ∘ f̄`, `f̄ : N(C^▷) ⟶ K^▷`; and `p̄ ∘ f̄` is equivalent to the nerve of an
   injectively fibrant diagram `(C^▷)ᵒᵖ ⥤ Set⁺_Δ`, by Part LimitsAndKanExtensions §3.1 with A the marked simplicial
   sets and u the counit. A route: f̄ is cofinal (Part LimitsAndKanExtensions §2.3), so f and f̄ are contravariant
   equivalences (Part LimitsAndKanExtensions §4.6), giving Cartesian equivalences of sharp simplicial sets (HTT
   3.1.5.6), along which restriction of Cartesian sections is a categorical equivalence (HTT 3.1.3.3).
   *Needs:* Part LimitsAndKanExtensions §2.3.1, §3.1.1, §4.6.1, §6.4.1; Part CartesianFibrations §5.5.2 (HTT, notation of
   §3.1.3), §5.6.1 (HTT, Prop. 3.1.3.3 and the discussion after it) and §5.9.2 (HTT, Prop. 3.1.5.6).
2. **Comparison with homotopy limits** (HTT, Prop. 3.3.3.1 and its proof, pp. 232–233). For the strict diagram, the
   section condition says that its derived global sections are its homotopy limit over C (HTT 3.3.3.1, sections part,
   §2.6.1); by the dual of Part LimitsAndKanExtensions §3.2.1 this is the limit condition.
   *Needs:* step 1; §2.6.1 (HTT, §3.3.3, the sections step used in the proof of Prop. 3.3.3.1); §2.5.2 (HTT, Rem. 3.3.2.3,
   classifying maps); Part LimitsAndKanExtensions §3.2.1; Mathlib `SimplicialNerve`; Tau Ceti `SSet.CartesianFibration`,
   `SSet.catInfty`, `SSet.slice.IsLimit`; §2.1.2 (HTT, Def. 3.3.2.2); ModelCategoryTheory, Part
   SimplicialCategories §2.6.1 (HTT, Prop. A.2.8.2, injective part) and §3.1.1 (HTT, Prop. A.2.8.7).

**3.2.2.** Prove that for `p : K ⟶ Cat∞ᵒᵖ` classifying a Cartesian fibration `X ⟶ K`, the limit of p in `Cat∞` is
`Map♭_K(K^♯, X^♮)` up to isomorphism in `hCat∞` (HTT, Cor. 3.3.3.2, p. 234). A route: extend p to a limit diagram,
which exists because `Cat∞` has small limits (Part LimitsAndKanExtensions §3.8); its cone-point value is the fiber
`X̄_v`, and restriction of Cartesian sections along the marked anodyne `{v}^♯ ⊆ (K^▷)^♯` is a trivial fibration.
Both X and `X̄ ×_{K^▷} K` are equivalent to the pullback of Z along p, which gives `X ≃ X̄ ×_{K^▷} K`, an equivalence
of Cartesian fibrations over K; restriction of Cartesian sections is invariant under it (Part CartesianFibrations
§5.5).

*Needs:* §3.2.1; Part LimitsAndKanExtensions §3.8.1 (existence of limits in `Cat∞`); §2.5.2 (HTT, Rem.
3.3.2.3, existence part); Tau Ceti `SSet.CartesianFibration`, `SSet.catInfty`, `TauCeti.MarkedSSet`; §2.1.2 (HTT, Def. 3.3.2.2); Part CartesianFibrations §5.2.1 (HTT, notation of §3.1.1), §5.5.2 (HTT, notation of §3.1.3) and
§5.4.1 (HTT, Prop. 3.1.2.3).

**3.2.3.** Prove that for `p̄ : K^◁ ⟶ 𝒮` classifying a left fibration `X̄ ⟶ K^◁` with restriction `X ⟶ K`, p̄ is a limit diagram
exactly when restriction of sections `Map_{K^◁}(K^◁, X̄) ⟶ Map_{K^◁}(K, X̄)` is a homotopy equivalence (HTT,
Cor. 3.3.3.3, p. 234); and that the limit of `p : K ⟶ 𝒮` is the Kan complex of sections `Map_K(K, X)` of the classified
left fibration, up to isomorphism in H (HTT, Cor. 3.3.3.4, p. 234). A route: the identity from the Kan–Quillen to the
Joyal structure is right Quillen, so Kan complexes are closed under homotopy limits of diagrams indexed by categories;
with Part LimitsAndKanExtensions §6.4, §3.1 and §3.2, `𝒮 ⊆ Cat∞` preserves small limits, and limits of diagrams in 𝒮
exist (Part LimitsAndKanExtensions §3.7). Pass to opposites: `X̄ᵒᵖ ⟶ (K^◁)ᵒᵖ = (Kᵒᵖ)^▷` is a right fibration,
classified by the opposite map, with `Map(K, X̄)ᵒᵖ = Map(Kᵒᵖ, X̄ᵒᵖ)`. Apply §3.2.1 and §3.2.2 to it; for
a right fibration every edge is Cartesian (HTT 2.4.2.4), so all sections are marked.

*Needs:* §3.2.1 and §3.2.2; Part LimitsAndKanExtensions §3.1.1, §3.2.1, §3.7.1 and §6.4.1; Mathlib
`SSet.Quasicategory`; Tau Ceti `SSet.LeftFibration`, `SSet.slice.IsLimit`; §2.1.2 (HTT, Def. 3.3.2.2); Part InfinityCategoryFoundations §1.1 (HTT, sizes, §1.2.15) and §7.1.2 (HTT, Def. 1.2.16.1); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1); Part CartesianFibrations
§2.2.1 (HTT, Prop. 2.4.2.4); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7); ModelCategoryTheory, Part
SimplicialCategories §3.1.1 (HTT, Prop. A.2.8.7).

### 3.3 Colimits in `Cat∞`

**3.3.1.** Prove that for `p̄ : K^◁ ⟶ Cat∞ᵒᵖ` classifying a Cartesian fibration `X̄ ⟶ K^◁`, with `X = X̄ ×_{K^◁} K`, the
following are equivalent: `p̄ᵒᵖ` is a colimit diagram in `Cat∞`; `X^♮ ⊆ X̄^♮` is a Cartesian equivalence in
`(Set⁺_Δ)/K^◁`; it is one in `Set⁺_Δ` (HTT, Prop. 3.3.4.2, p. 236). A route in four steps.

1. **Over the cone and over a point** (HTT, Prop. 3.3.4.2, (2) ⇔ (3), p. 236). Factor `X^♮ ⟶ (K^◁)^♯` as a marked
   anodyne map `X^♮ ⟶ Y^♮` followed by a Cartesian fibration `Y ⟶ K^◁` with `X ≅ Y ×_{K^◁} K`, and lift to
   `q : Y ⟶ X̄`. The relative condition says that `q_v` is an equivalence at the cone point v (HTT 3.1.3.5); compare
   with the absolute one through the Cartesian equivalences `Y_v^♮ ⊆ Y^♮` and `X̄_v^♮ ⊆ X̄^♮` (§3.1).
   *Needs:* §3.1.1; Part CartesianFibrations §5.3.2 (HTT, Prop. 3.1.1.6; Rem. 3.1.1.10), §5.6.1 (HTT, Rem. 3.1.3.4; Prop.
   3.1.3.5) and §5.7.1 (HTT, Prop. 3.1.3.7); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)).
2. **Reduction to the nerve of a category** (HTT, Prop. 3.3.4.2, first step of the proof of (1) ⇔ (2), pp. 236–237).
   For `r : N(C) ⟶ K` with `rᵒᵖ` cofinal, both conditions hold for p̄ exactly when they hold for its restriction along
   `N(C^◁) ⟶ K^◁`: the second by §3.1 in the absolute form of step 1, the first by Part LimitsAndKanExtensions §2.5.
   *Needs:* §3.1.1, step 1; Part LimitsAndKanExtensions §2.5.2.
3. **The strict case** (HTT, Prop. 3.3.4.2, proof of (1) ⇔ (2), p. 237). For a projectively fibrant
   `F : (C^◁)ᵒᵖ ⥤ Set⁺_Δ`, in the variance of the Conventions and of §2.6.1, with marked unstraightening `X̄` over
   `N(C^◁)`, `N(F)` is a limit diagram in `Cat∞ᵒᵖ` exactly when `X^♮ ⊆ X̄^♮` is a Cartesian equivalence over `N(C^◁)`.
   (HTT writes F on `C^◁`; the opposite is meant.) A route: the right derived unstraightenings (HTT 3.2.0.1) commute
   with restriction along `Cᵒᵖ ⊆ (C^◁)ᵒᵖ = (Cᵒᵖ)^▷`. The derived left adjoint of this restriction is homotopy left Kan
   extension along `Cᵒᵖ ⊆ (Cᵒᵖ)^▷`, which adds a final object, so by Part LimitsAndKanExtensions §3.2.1 the limit
   condition in `Cat∞ᵒᵖ`, a colimit condition in `Cat∞`, says that F is in its essential image: the value of F at the
   cone point is a homotopy colimit of `F|Cᵒᵖ`. That left adjoint is fully faithful because left Kan extension along a
   full inclusion is (Part LimitsAndKanExtensions §7.4 through Part LimitsAndKanExtensions §3.1); so the condition
   says that the counit at `X̄` is an isomorphism.
   *Needs:* §1.7.1 (HTT, Thm. 3.2.0.1); Part LimitsAndKanExtensions §3.1.1, §3.2.1, §7.4.3; Part InfinityCategoryFoundations §2.1.8 (fully
   faithful functors, HTT §1.2.10); ModelCategoryTheory, Part ModelCategories §7.2.1 (HTT, Prop. A.2.8.2, projective
   part); ModelCategoryTheory, Part SimplicialCategories §6.2.1 (HTT, Prop. A.3.3.7).
4. **Assembly** (HTT, Prop. 3.3.4.2, pp. 236–237). Step 1 gives the last two conditions; for the first two choose C
   with `N(C) ⟶ K` having cofinal opposite (Part LimitsAndKanExtensions §6.4), reduce by step 2, rectify by Part
   LimitsAndKanExtensions §3.1, and apply step 3.
   *Needs:* steps 1–3; Part LimitsAndKanExtensions §3.1.1, §6.4.1; Tau Ceti `SSet.CartesianFibration`,
   `TauCeti.MarkedSSet`; §2.1.2 (HTT, Def. 3.3.2.2); Part InfinityCategoryFoundations §1.2.2 (cones, HTT §1.2.8); Part
   CartesianFibrations §5.2.1 (HTT, notation of §3.1.1) and §5.6.1 (HTT, Prop. 3.1.3.3).

**3.3.2.** Prove that for `p : Kᵒᵖ ⟶ Cat∞` classifying a Cartesian fibration `X ⟶ K`, the colimit of p is `X^♮` up to isomorphism
in `hCat∞`, that is, a fibrant replacement of `X^♮`, X with its Cartesian edges inverted (HTT, Cor. 3.3.4.3, p. 237).
A route: extend p to a colimit diagram, which exists because `Cat∞` has small colimits (Part LimitsAndKanExtensions
§3.8), with cone-point value `X̄_v`; the inclusions `X̄_v^♮ ⊆ X̄^♮ ⊇ X^♮` are Cartesian equivalences by §3.1 and
§3.3.1. `X^♮` itself is usually not fibrant, so X is in general not the colimit (compare HTT, Warning 3.3.4.4,
p. 237).

*Needs:* §3.1.1, §3.3.1; §2.5.2 (HTT, Rem. 3.3.2.3, classifying maps); Part LimitsAndKanExtensions §2.3.1 and
§3.8.1 (existence of colimits in `Cat∞`); Tau Ceti `SSet.CartesianFibration`, `SSet.catInfty`, `SSet.coslice.IsColimit`;
§2.1.2 (HTT, Def. 3.3.2.2 and the introduction to §3.3.2); Part InfinityCategoryFoundations §1.2.2 (cones, HTT §1.2.8); Part
CartesianFibrations §5.2.1 (HTT, notation of §3.1.1) and §5.6.1 (HTT, Prop. 3.1.3.3).


**3.3.3.** Prove that products with a fixed ∞-category preserve colimits in `Cat∞` (no Lurie statement in this form; it
combines HTT, Prop. 3.3.4.2, p. 236, with Prop. 3.1.4.2, p. 179, the marked form of Cor. 2.2.5.4, p. 110):
for an ∞-category `T` and a small colimit diagram `p̄ : K^▷ ⟶ Cat∞` with cone-point value `C`, the diagram
`T × p̄`, with values `T × p̄(k)`, is a colimit diagram with cone-point value `T × C`. In particular, for every
∞-category `E`, `Fun(C, E)` is the limit of the `Fun(p̄(k), E)`, since a map `T × C ⟶ E` is a map
`T ⟶ Fun(C, E)` and `T` is arbitrary. For a large E this is read in `Cat∞` of a universe containing E, where
the colimit diagram remains a colimit diagram, both being homotopy colimits of marked simplicial sets (Part
LimitsAndKanExtensions §3.2, §3.8).

For `K` empty it says that `T × ∅ = ∅` is initial in `Cat∞`; for `T = ∅` it says that the constant diagram
at the initial object `∅` is a colimit diagram, which holds for every `K`.

*Proof route.* Pass to opposites and let `X̄ ⟶ (K^▷)ᵒᵖ` be the Cartesian fibration classified by `p̄`, with
`X` its restriction away from the cone point. Then `T × X̄ ⟶ (K^▷)ᵒᵖ` is a Cartesian fibration whose
Cartesian edges are the pairs of an equivalence of `T` and a Cartesian edge of `X̄`, so that
`(T × X̄)^♮ = T^♮ × X̄^♮` (Part CartesianFibrations §1.3, HTT, Prop. 2.4.1.5: edges over an equivalence are
Cartesian exactly when they are equivalences). It is classified by
`T × p̄`: straightening carries `− × T^♮` to `− ⊠ T^♮` up to weak equivalence (§1.5, HTT, Cor. 3.2.1.15), so the
fibration classified by `T × p̄` is `T × X̄`. By the colimit criterion in `Cat∞` (HTT, Prop. 3.3.4.2), `p̄` is a
colimit diagram exactly when
`X^♮ ⊆ X̄^♮` is a Cartesian equivalence of marked simplicial sets, and the same holds for `T × p̄` and
`(T × X)^♮ ⊆ (T × X̄)^♮`. That map is the product of `T^♮` with the first one, and products with a marked
simplicial set preserve Cartesian equivalences (HTT, Prop. 3.1.4.2 over a point).

*Needs:*
- §3.3.1 (HTT, Prop. 3.3.4.2), §2.5.2 (HTT, Rem. 3.3.2.3, classifying maps) and §1.5.1 (HTT,
  Cor. 3.2.1.15);
- Part CartesianFibrations §1.3.1 (HTT, Prop. 2.4.1.5) and §5.8.2 (HTT, Prop. 3.1.4.2); Part LimitsAndKanExtensions §3.2.1
  and §3.8.1;
- §2.1.1 (HTT, §3.3.2, the universal
  Cartesian fibration); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1);
- Tau Ceti `SSet.catInfty`, `SSet.CartesianFibration`, `SSet.coslice.IsColimit`.

### 3.4 Descent of coCartesian fibrations and generators of `Cat∞`

**3.4.1.** Prove descent for coCartesian fibrations across colimits of their bases (Nikolaus–Scholze, Lemma A.16, p. 140). For an
∞-category S, write `(Cat∞)_{/S}` for the slice of `Cat∞` over S.

1. **Pullback preserves colimits** (Nikolaus–Scholze, Lemma A.16, proof, first claim, p. 140). For a coCartesian
   fibration `p : X ⟶ S` of small ∞-categories, the pullback functor `(Cat∞)_{/S} ⟶ (Cat∞)_{/X}` preserves small
   colimits. A route: model `(Cat∞)_{/S}` as Nikolaus–Scholze do, by simplicial sets over S with the Joyal structure
   created by the forgetful functor (Mathlib `HomotopicalAlgebra.ModelCategory.over`). Strict pullback `A ↦ A ×_S X`
   preserves monomorphisms and colimits, and it preserves categorical equivalences `A ⟶ B` between arbitrary objects
   over S, by base change along a coCartesian fibration over the ∞-category S (Part CartesianFibrations §7.2, HTT,
   Prop. 3.3.1.3 over an ∞-category, coCartesian form). So it is left Quillen and preserves homotopy colimits. The Joyal structure is not simplicial,
   so these homotopy colimits are read through marked simplicial sets. Over a point, `A ↦ A^♭` is a Quillen
   equivalence (§2.3, HTT, Prop. 3.1.5.3 for the Kan complex Δ[0]); composed with `S^♭ ⊆ S^♮` it slices to a Quillen
   equivalence from the Joyal slice over S to marked simplicial sets over `S^♮`, with right adjoint the underlying
   map, since weak equivalences in both slices are created by the forgetful functors and every object is cofibrant. On
   fibrant objects the two pullbacks agree: for a categorical fibration `C ⟶ S`, the marked pullback `C^♮ ×_{S^♮} X^♮`
   is `(C ×_S X)^♮`, because an edge of `C ×_S X` is an equivalence exactly when both components are. Marked
   simplicial sets form a simplicial model category (Part CartesianFibrations §5.8, HTT, Cor. 3.1.4.4), so Part
   LimitsAndKanExtensions §3.6 identifies the underlying ∞-category of the slice over `S^♮` with `(Cat∞)_{/S}`, and
   Part LimitsAndKanExtensions §3.2 turns homotopy colimits into colimits.
   *Needs:* §2.3.2 (HTT, Prop. 3.1.5.3); Part CartesianFibrations §7.2.1 (HTT, Prop. 3.3.1.3 over an ∞-category, coCartesian form); Part
   LimitsAndKanExtensions §3.2.1, §3.6.1; Mathlib `HomotopicalAlgebra.ModelCategory.over`; Tau Ceti
   `SSet.CartesianFibration`, `SSet.catInfty`, `TauCeti.MarkedSSet`; Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1);
   Part CartesianFibrations §5.8.3 (HTT, Cor. 3.1.4.4); ModelCategoryTheory, Part ModelCategories §4.1.1 (HTT, §A.2.5),
   §4.2.1 (Quillen equivalences) and §7.2.1 (HTT, Prop. A.2.8.2, projective part); ModelCategoryTheory, Part
   SimplicialCategories §3.2.1 (homotopy colimits).
2. **The total space is the colimit of its restrictions** (Nikolaus–Scholze, Lemma A.16 (1), p. 140). If S is the
   colimit in `Cat∞` of a small diagram `i ↦ S_i`, and `p : X ⟶ S` is a coCartesian fibration, then X is the colimit
   in `Cat∞` of the diagram `i ↦ X ×_S S_i`. A route: the identity of S is the colimit of the maps `S_i ⟶ S` in
   `(Cat∞)_{/S}`, because colimits in a slice are computed in the underlying ∞-category. Apply step 1, and compute the
   colimit in `(Cat∞)_{/X}` in `Cat∞` again. The strict pullbacks `X ×_S S_i` compute the pullbacks in `Cat∞`, since p
   is a categorical fibration.
   *Needs:* step 1; §2.4.2 (HTT, Cor. 3.3.1.4); Part InfinityCategoryFoundations §8.3.1 (HTT, Prop. 1.2.13.8); Part
   CartesianFibrations §7.4.1 (HTT, Prop. 3.3.1.7, over an ∞-category).
3. **Gluing** (Nikolaus–Scholze, Lemma A.16 (2), p. 140). Let `i ↦ (X_i ⟶ S_i)` be a small diagram of coCartesian
   fibrations, that is, a diagram in `Fun(Δ[1], Cat∞)` whose values are coCartesian fibrations, such that for every
   morphism `i ⟶ j` the square from `X_i ⟶ S_i` to `X_j ⟶ S_j` is a pullback. Let `X ⟶ S` be a categorical fibration
   representing its colimit. Then `X ⟶ S` is a coCartesian fibration, and every comparison map `X_i ⟶ X ×_S S_i` is an
   equivalence. A route in two parts. First, straightening is natural in the base (Nikolaus–Scholze, Lemma A.16, proof
   of (2), p. 140): replace I by `N(C)` for a small category C and the diagram of bases by a strict diagram `i ↦ S_i`
   of simplicial sets (Part LimitsAndKanExtensions §6.4, §3.1). The unstraightening functors `Un_{S_i}` (§1.8, HTT,
   Thm. 3.2.0.1, coCartesian form) commute with base change along the `S_i ⟶ S_j` up to the canonical isomorphisms of
   HTT, Prop. 3.2.1.4 (2), which compose coherently because they compare two colimit formulas. So they form a diagram
   over C of right Quillen equivalences, and passing to underlying ∞-categories by the straightening equivalence
   with its compatibility with pullback (§1.8.5, the coCartesian form of §1.7.2; Part
   LimitsAndKanExtensions §3.1) identifies the diagram `i ↦ X_i`, whose squares are pullbacks, with a point of the
   limit of the `Fun(S_i, Cat∞)`.
   Second, glue: `Fun(−, Cat∞)` carries the colimit S of the `S_i` to that limit, since products with a fixed
   ∞-category preserve colimits in `Cat∞` (§3.3.3). `Cat∞` is large, so this is applied to `Cat∞` of the
   next universe, in which `Cat∞` is small; the inclusion of small ∞-categories into those of the next universe
   preserves small colimits, since both are computed as homotopy colimits of marked simplicial sets (Part
   LimitsAndKanExtensions §3.2.1, §3.8.1). So the point is a functor `F : S ⟶ Cat∞`, which the same
   equivalence over S carries to a coCartesian fibration `X′ ⟶ S` with `X′ ×_S S_i ≃ X_i` naturally in i. By step 2, `X′` is the colimit of the `X_i`, so X and `X′` are
   equivalent over S. Being a coCartesian fibration passes along an equivalence of categorical fibrations over S, by
   the mapping-space criterion for coCartesian edges (HTT, Prop. 2.4.4.3).
   *Needs:* steps 1 and 2; §1.3.1 (HTT, Prop. 3.2.1.4 (2)), §1.7.1 (HTT, Thm. 3.2.0.1), §1.7.2 (the straightening equivalence),
   §1.8.5 (the coCartesian form) and §3.3.3 (products preserve colimits in `Cat∞`); Part LimitsAndKanExtensions §3.1.1, §3.2.1, §3.8.1, §6.4.1; Tau Ceti
   `SSet.CartesianFibration`, `SSet.catInfty`; Part CartesianFibrations §1.7.2 (HTT, Prop. 2.4.4.3) and §7.4.1 (HTT,
   Prop. 3.3.1.7).

**3.4.2.** Prove that `Cat∞` is generated under small colimits by Δ[0] and Δ[1]: every full subcategory of `Cat∞` that is closed
under equivalences, contains Δ[0] and Δ[1], and is closed under small colimits contains every small ∞-category
(Nikolaus–Scholze, Lemma A.17, pp. 140–141; `Suggested.lean` declaration `CatInfty.colimit_induction`). A route by skeletal
induction. Through the Quillen equivalence of §3.4.1, step 1,
over S = Δ[0], homotopy colimits of simplicial sets for the Joyal structure are colimits in `Cat∞`. The Joyal
structure is left proper with every object cofibrant, so coproducts, pushouts along monomorphisms, and unions of
increasing sequences of simplicial subsets are homotopy colimits, hence colimits in `Cat∞`. First, Δ[n] is the
iterated pushout `Δ[1] ⊔_{Δ[0]} ⋯ ⊔_{Δ[0]} Δ[1]` of its spine, which includes into Δ[n] by an inner anodyne map, hence
a categorical equivalence. Next, by induction on n, every simplicial set K of dimension at most n lies in the
subcategory: K is the pushout of its (n−1)-skeleton along the coproduct of the inclusions `∂Δ[n] ⊆ Δ[n]` over its
nondegenerate n-simplices, and `∂Δ[n]` has dimension n − 1. Finally, every simplicial set is the union of its skeleta.

*Needs:* §3.4.1, step 1; §2.3.2 (HTT, Prop. 3.1.5.3); Part LimitsAndKanExtensions §3.2.1; Tau Ceti
`SSet.catInfty`; Mathlib `SSet.innerAnodyneExtensions`; Part InfinityCategoryFoundations §6.1.1 (HTT, Lemma 2.2.5.2) and §9.5.1 (HTT,
Thm. 2.2.5.1, model structure part); ModelCategoryTheory, Part ModelCategories §3.4.1 (HTT, Def. A.2.4.1), §3.5.2 (HTT,
Prop. A.2.4.4) and §7.2.1 (HTT, Prop. A.2.8.2, projective part); ModelCategoryTheory, Part SimplicialCategories §3.2.1
(homotopy colimits).

**Checks.**

- For the empty diagram, S is the initial ∞-category ∅, and step 2 of §3.4.1 says that a coCartesian fibration over ∅ has empty
  total space. For the diagram with one object, step 2 of §3.4.1 is the identity of X.
- Step 2 of §3.4.1 needs p coCartesian. Write Δ[2] as the pushout `Δ{0,1} ⊔_{{1}} Δ{1,2}` in `Cat∞` of its spine. The inclusion
  `Λ[2,0] ⊆ Δ[2]` is a categorical fibration but not a coCartesian one, since the edge `1 ⟶ 2` has no lift starting at
  1. Its restrictions are `Δ{0,1}` over the first edge and the two points `{1} ⊔ {2}` over the second, with pushout
  `Δ{0,1} ⊔ {2}` over `{1}`. That is disconnected, while `Λ[2,0]` is connected through its edge `0 ⟶ 2`.
- Generation needs both generators. The full subcategory of ∞-categories equivalent to Kan complexes contains Δ[0] and
  is closed under small colimits in `Cat∞`, because its inclusion has a right adjoint, the core. It does not contain
  Δ[1], so Δ[0] alone does not generate.

### Examples

- For K = ∅, §3.2 says that the final object of `Cat∞` is Δ[0], the sections over the empty simplicial set, and §3.3
  that the initial object is ∅.
- For K discrete on a set T, §3.2 computes products of ∞-categories as product simplicial sets.
- For K = Δ[1] and a Cartesian fibration `X ⟶ Δ[1]` with transport `X₁ ⟶ X₀`, the colimit of the classified diagram
  is `X^♮` with its Cartesian edges inverted (§3.3), which is X₀ since the colimit of an edge is its target; the
  limit is X₁ (§3.2), the ∞-category of Cartesian sections, each determined by its value over 1.
- For a coCartesian fibration `X ⟶ Δ[2]`, §3.4 writes X as the pushout of its restrictions to the two edges of the
  spine along the fiber over 1. Together with the generation statement (§3.4.2), this reduces many claims about coCartesian
  fibrations to the bases Δ[0] and Δ[1].

### Dependencies

Layers 1 and 2; Part LimitsAndKanExtensions Layers 2, 3, 4, 6 and 7 (cofinality, homotopy colimits, the existence of
limits and colimits in `Cat∞` and of limits in spaces, nerve replacements, Kan extensions); Part CartesianFibrations
(marked simplicial sets, the Cartesian model structure, mapping simplices, categorical fibrations over an ∞-category);
Part InfinityCategoryFoundations (the Joyal structure, colimits in overcategories); ModelCategoryTheory, Parts ModelCategories,
KanQuillen and SimplicialCategories; Mathlib's model structure on over-categories; Tau Ceti `SSet.catInfty`.
## Layer 4: Fiberwise Kan extensions along coCartesian fibrations

### 4.1 Kan extensions along maps of coCartesian fibrations

Left Kan extensions along a map `δ : K ⟶ K′` in HTT's sense (HTT, Def. 4.3.3.2, p. 303) are tested on a fibrant
correspondence representing δ; that the test does not depend on the correspondence (HTT, Prop. 4.3.3.4, p. 304),
the comparison with full inclusions and with the pointwise form, and the fiberwise computation along a full
inclusion over a base (HTT, Lemma 4.3.3.9, p. 307) are Part LimitsAndKanExtensions §7.6. This section proves the
fiberwise criterion along a map of coCartesian fibrations, whose proof builds a fibrant model of a mapping cylinder
by straightening.

**4.1.1. A fibrant cylinder.** Prove that for coCartesian fibrations `X ⟶ S`, `Y ⟶ S` and a map `δ : X ⟶ Y` over S
preserving coCartesian edges, the cylinder `M(δ) = (X × Δ[1]) ⊔_{X × {1}} Y` has a fibrant model: a categorical
equivalence `S ⊆ S'`, a coCartesian fibration `M ⟶ S' × Δ[1]` and a monic categorical equivalence `M(δ) ⟶ M` over
`S × Δ[1]` that is a categorical equivalence on each fiber over S (HTT, Prop. 4.3.3.10, proof, pp. 309–310). A
route: take for S' the nerve of a fibrant replacement of `C[S]`, an ∞-category; straighten the marked cylinder over
`S' × Δ[1]` by coCartesian straightening (§1.8), replace it fibrantly in the projective structure, unstraighten (HTT
3.2.0.1), compare with the original cylinder through base change along the categorical equivalence `S ⊆ S'` and the
mapping simplex (HTT 3.3.1.3 over the ∞-category S', 3.2.2.7), and multiply by a contractible Kan complex to make
the comparison map a monomorphism.

*Needs:* §1.7.1 and §1.8.1 (HTT, Thm. 3.2.0.1, Cartesian and coCartesian forms); §1.5.2 (the Quillen adjunction);
Part CartesianFibrations §5.7.1 (HTT, Prop. 3.1.3.7), §6.3.2 (HTT, Prop. 3.2.2.7), §7.2.1 (HTT, Prop. 3.3.1.3, over an
∞-category) and §7.3.1 (HTT, Prop. 3.3.1.5, fiberwise equivalences); §1.1.1 (HTT, Def. 3.2.1.2); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Part InfinityCategoryFoundations §9.5.1 and §9.6.1 (HTT, Thm. 2.2.5.1); Mathlib `SSet.KanComplex`; Tau
Ceti `SSet.CartesianFibration`.

**4.1.2. Fiberwise criterion along coCartesian fibrations.** Prove that for coCartesian fibrations `X ⟶ S`, `Y ⟶ S`, a
map `δ : X ⟶ Y` over S preserving coCartesian edges, an ∞-category C, maps `f₀ : X ⟶ C` and `f₁ : Y ⟶ C`, and a
natural transformation `α : f₀ ⟶ f₁ ∘ δ`, α exhibits a left Kan extension along
δ exactly when each `α_s` does along `δ_s` (HTT, Prop. 4.3.3.10, p. 308). A route: extend `(f₀, f₁, α)` to the
fibrant model M of §4.1.1; since `M(δ) ⟶ M` is a monic categorical equivalence, the condition on α
is that this extension is a left Kan extension of its restriction to the part of M over `{0}` (HTT, Prop. 4.3.3.4,
Part LimitsAndKanExtensions §7.6); the fiberwise condition holds on all of `S'` by the invariance of Kan extensions
(Part LimitsAndKanExtensions §7.5), and the fiberwise computation along a full inclusion over a base (HTT,
Lemma 4.3.3.9, Part LimitsAndKanExtensions §7.6), applied to the full inclusion of X into M over `S'`, concludes.

*Needs:* §4.1.1 (the fibrant cylinder); Part LimitsAndKanExtensions §7.5.1 (HTT, Lemmas 4.3.2.5, 4.3.2.6) and §7.6.1
(HTT, Prop. 4.3.3.4; Lemma 4.3.3.9); Part LimitsAndKanExtensions §7.1.2, §7.1.3, §7.1.4 (HTT, Defs. 4.3.2.2, 4.3.3.1, 4.3.3.2); Part
InfinityCategoryFoundations §5.5.4 (HTT, Rem. 1.2.13.5); Part CartesianFibrations §4.1.1 (HTT, §2.3.1, correspondences), §1.4.1 (the
discussion after HTT, Prop. 2.4.1.7), §2.4.1 (HTT, Prop. 2.4.3.2) and §6.1.1 (the introduction to HTT, §3.2.2); Tau Ceti
`SSet.CartesianFibration`.

### Examples

- For `Y = S` and δ the identity the criterion says that α is invertible exactly when each `α_s` is: equivalences
  in a functor ∞-category are detected pointwise.
- For `S = Δ[1]` and δ a map of coCartesian fibrations over `Δ[1]`, the criterion reduces a left Kan extension along
  δ to the two fiber extensions over `0` and `1`; the transport functors play no role beyond the hypothesis that δ
  commutes with them.

### Dependencies

Layer 1 (coCartesian straightening and the Quillen adjunction); Part LimitsAndKanExtensions §7.5 and §7.6 (the
definition-level comparisons and the fiberwise computation along a full inclusion); Part CartesianFibrations
(correspondences, coCartesian edges, slices of coCartesian fibrations, mapping simplices, base change and fiberwise
equivalences over an ∞-category, the Cartesian model structure); Part InfinityCategoryFoundations (the Joyal model structure).

## Layer 5: Diagrams of adjoints and of localizations

### 5.1 Adjointable squares and diagrams of left adjoints

**5.1.1.** Define left adjointable squares of ∞-categories (HTT, Def. 7.3.1.2, p. 768). Take a square of ∞-categories
with horizontal functors `q'_* : C' ⟶ D'` and `q_* : C ⟶ D`, vertical functors `p'_* : C' ⟶ C` and
`p_* : D' ⟶ D`, commuting up to a specified equivalence `η : p_* q'_* ≃ q_* p'_*`. It is left adjointable
when `q_*` and `q'_*` have left adjoints `q^*`, `q'^*` and the square of homotopy categories is left
adjointable in the 1-categorical sense (HTT, Def. 7.3.1.1, p. 768): the push-pull transformation
`γ : q^* p_* ⟶ p'_* q'^*`, the mate of `η` under Mathlib's `CategoryTheory.mateEquiv` (HTT, §7.3.1, p. 768),
is an isomorphism. Right adjointable squares are defined dually, with right adjoints `q^!`, `q'^!` and the
mate `p'_* q'^! ⟶ q^! p_*` of `η⁻¹`. Lurie's definition asks only that the square of homotopy categories be
left adjointable, so that only `hq_*` and `hq'_*` need left adjoints. Requiring the adjoints of ∞-categories,
as here and as in Lurie's own applications in HTT, §7.3, is stronger, since an adjoint of a homotopy functor need not
come
from an adjoint of ∞-categories (HTT, p. 362).

- By Part AdjunctionsAndLocalizations §1.3, a left adjoint in Mathlib's bicategory `SSet.QCat.bicategory` is the same
  as a left adjoint in
  HTT's sense, so the condition does not depend on the definition of adjunction used, and it is invariant
  under equivalence of squares.
- A square is right adjointable exactly when its opposite square is left adjointable, and pasting two left
  adjointable squares gives a left adjointable square, since mates are compatible with pasting.

**Checks.**

- Take the nerves of the posets `C = [1]` and `D = C' = D' = ∗`, with `q_* : [1] ⟶ ∗`, `q'_*`, `p_*`
  identities and `p'_* : ∗ ⟶ [1]` picking `1`. The left adjoint `q^*` picks `0`, so `γ` is the morphism
  `0 ⟶ 1` and the square is not left adjointable. It is right adjointable: `q_*` has the right adjoint
  picking `1`, and the right transformation is the identity of `1`. A definition testing right adjoints in
  place of left adjoints would accept this square.
- Transposing the first square (exchanging its horizontal and vertical functors), the horizontal functors
  become `p'_* : ∗ ⟶ [1]`, with left adjoint `[1] ⟶ ∗` since `1` is final, and an identity. The push-pull
  transformation is then the identity of the functor `[1] ⟶ ∗`, so the transposed square is left
  adjointable, unlike the original. A definition symmetric in the two pairs of sides would treat the square
  and its transpose alike.
- The square with `C' = C`, `D' = D`, `q'_* = q_*`, vertical functors identities and `η = id` is left
  adjointable exactly when `q_*` has a left adjoint; for `q_*` the functor from the empty ∞-category to `∗`
  it is not. A definition not requiring the adjoints would accept `∅ ⟶ ∗` vacuously. For a square of nerves
  of categories the definition reduces to the 1-categorical one, since the homotopy category of a nerve is
  the category itself.

*Needs:*
- Part AdjunctionsAndLocalizations §1.3.2 (HTT, Prop. 5.2.2.8, the agreement of the definitions);
- Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14);
- Mathlib `CategoryTheory.mateEquiv`, `SSet.hoFunctor`.

**5.1.2.** Prove that adjointability of a square can be read off from correspondences (HTT, Remark 7.3.1.3, p. 769).
Let `f : M ⟶ Δ[1]` and `f ∘ P : M' ⟶ Δ[1]` be Cartesian fibrations, for a map `P : M' ⟶ M`. They are
correspondences associated to functors `q_* : C ⟶ D` and `q'_* : C' ⟶ D'` between their fibers over `1`
and `0`, and `P` restricts to functors `p'_* : C' ⟶ C` and `p_* : D' ⟶ D` on the fibers. Then:
1. `P` determines, up to homotopy, a transformation `p_* q'_* ⟶ q_* p'_*`, which is an equivalence exactly
   when `P` carries `(f ∘ P)`-Cartesian edges to `f`-Cartesian edges; the square is then a square of
   ∞-categories in the sense of §5.1.1;
2. if moreover `q_*` and `q'_*` have left adjoints, then `f` and `f ∘ P` are also coCartesian fibrations, and
   the push-pull transformation `γ` at an object `d'` of `D'` is computed as follows. Choose an
   `(f ∘ P)`-coCartesian edge `φ : d' ⟶ c'` and an `f`-coCartesian edge `ψ : P(d') ⟶ c`; the
   coCartesian property of `ψ` gives a 2-simplex with edges `ψ`, `P(φ)` and `θ : c ⟶ P(c')`, and `γ(d')` is
   the class of `θ`. So the square is left adjointable exactly when `P` also carries `(f ∘ P)`-coCartesian
   edges to `f`-coCartesian edges.

*Proof route.* Lurie's. Unwind the definitions: the transformation in (1) comes from choosing Cartesian
lifts in `M'` and comparing their images with Cartesian lifts in `M`; for (2), Part AdjunctionsAndLocalizations §1.3
identifies `q^*` with the
transport along coCartesian edges, and the class of `θ` is the mate of the transformation in (1). Then `θ`
is an equivalence exactly when `P(φ)` is coCartesian, by uniqueness of coCartesian lifts up to equivalence.

*Needs:*
- Part AdjunctionsAndLocalizations §1.3.2 (HTT, Prop. 5.2.2.8; Cor. 5.2.2.5, Cartesian fibrations that are coCartesian)
  and §1.2.1 (HTT,
  Prop. 5.2.1.3);
- Part AdjunctionsAndLocalizations §1.1.2, §1.1.3 (HTT, Defs. 5.2.1.1, 5.2.2.1); Part CartesianFibrations §1.1.1 (HTT, Def. 2.4.2.1);
- Part CartesianFibrations §1.4.1 (HTT, Rem. 2.4.1.9, uniqueness of Cartesian lifts) and §1.5.1 (HTT, §2.4.1,
  coCartesian edges);
- Mathlib `CategoryTheory.mateEquiv`; Tau Ceti `SSet.CartesianFibration`, `SSet.Edge.IsCartesian`.

**5.1.3.** Prove the diagram-level form of passing to left adjoints (Liu–Zheng, Prop. 2.2.4, the case of a product of
two simplicial sets, `I = {1, 2}` and `J = {2}`, pp. 79–80; left adjoint squares are their Def. 2.2.1,
p. 77). Let `A` and `B` be simplicial sets and `F : A × B ⟶ Cat∞` a functor such that:
- for every vertex `a` of `A` and edge `e` of `B`, the functor `F(a, e)` has a left adjoint;
- for every edge `d` of `A` and edge `e` of `B`, the square `F(d, e) : Δ[1] × Δ[1] ⟶ Cat∞`, with horizontal
  functors `F(−, e)`, is left adjointable (§5.1.1).

Then there is a functor `F_L : A × Bᵒᵖ ⟶ Cat∞` with:
1. the same restriction as `F` to `A × B₀`, where `B₀` is the set of vertices of `B`;
2. for every vertex `a` and edge `e`, `F_L(a, e)` a left adjoint of `F(a, e)`;
3. for every pair of edges `(d, e)`, the square `F_L(d, e)` the left adjoint square of `F(d, e)`: its
   horizontal functors are the left adjoints, and its commuting equivalence is the push-pull transformation
   `γ`, invertible by hypothesis;
4. compatibility with base change: for maps `A' ⟶ A` and `B' ⟶ B`, the construction for the restriction of
   `F` to `A' × B'` is equivalent to the restriction of `F_L` to `A' × B'ᵒᵖ`.

A single square carries no information beyond its push-pull transformation, which is Mathlib's
`CategoryTheory.mateEquiv` on homotopy categories; the content here is that the left adjoints and their
mates assemble into one coherent diagram. For `A = Δ[0]` it says that a diagram of ∞-categories whose
functors have left adjoints yields a diagram, indexed by `Bᵒᵖ`, of the left adjoints.

*Proof route.* A route through straightening, in place of Liu–Zheng's gluing of multisimplicial sets; HA,
Cor. 4.7.4.18 (3), p. 699, is the case `A = Δ[0]` in this form. Curry `F` to a map `A ⟶ Fun(B, Cat∞)`.
The straightening equivalence over `Bᵒᵖ` (§1.7.2; HTT, §3.2, introduction, with Prop. 4.2.4.4)
identifies `Fun(B, Cat∞)` with the ∞-category of Cartesian fibrations over `Bᵒᵖ` and maps preserving Cartesian
edges. Let `Y_a ⟶ Bᵒᵖ` be the
Cartesian fibration of a vertex `a`: its Cartesian transport along the edge of `Bᵒᵖ` opposite to `e` is
`F(a, e)`. These have left adjoints, so `Y_a` is also a coCartesian fibration whose coCartesian transport
functors are those left adjoints (Part AdjunctionsAndLocalizations §1.3, HTT, Cor. 5.2.2.5). For an edge `d` of `A`,
the map
`Y_{d(0)} ⟶ Y_{d(1)}` preserves Cartesian edges, and by HTT Remark 7.3.1.3 (§5.1.2), applied over each edge
of `Bᵒᵖ`, the second hypothesis says exactly that it also preserves coCartesian edges. So the map
`A ⟶ Fun(B, Cat∞)` lands in the subcategory whose objects are both Cartesian and coCartesian and whose
morphisms preserve both kinds of edges; membership is a condition on vertices and edges, so a map from `A`
lands there as soon as its vertices and edges do. That subcategory is `N(D')`, with D' the simplicial category of
these bi-fibrations over `Bᵒᵖ` and the maps preserving both kinds of edges, an n-simplex of a mapping object being
a map `Δ[n]^♯ × X ⟶ Y` over `Bᵒᵖ` preserving the markings; its mapping objects are unions of components of Kan
complexes, so D' is locally Kan. In the ∞-category of coCartesian fibrations over `Bᵒᵖ` of §1.8, the mapping
objects between these objects are the opposites of those of D', so the same objects and maps form `N(D'^co)`. Compose with the comparison
`c_{D'} : N(D') ⟶ N(D'^co)` of §1.8, a categorical equivalence that is the identity on vertices and edges, and then
with the coCartesian straightening equivalence (§1.8.5), which identifies the ∞-category of
coCartesian fibrations over `Bᵒᵖ` with `Fun(Bᵒᵖ, Cat∞)`. Since `c_{D'}` is the identity on vertices and edges,
the statements below about values on vertices and edges are unaffected. The
composite `A ⟶ Fun(Bᵒᵖ, Cat∞)`, uncurried, is `F_L`, up to equivalence: it has (2) since that equivalence
returns the fibers `F(a, b)` as values and the coCartesian transports, the left adjoints, as values on edges (§1.8.5,
through the involution op), and (3) by HTT Remark 7.3.1.3 again. Its restriction to `A × B₀` is
equivalent to that of `F`, and becomes equal after modifying `F_L` along this equivalence, since restriction
along the monomorphism `A × B₀ ⊆ A × Bᵒᵖ` is a categorical fibration of functor ∞-categories into `Cat∞`.
Base change (4) follows from the compatibility of these equivalences with pullback (§1.7.2 and
§1.8.5).

*Needs:*
- §5.1.1 (HTT, Def. 7.3.1.2) and §5.1.2 (HTT, Remark 7.3.1.3); Part AdjunctionsAndLocalizations §1.3.2, §1.3.3 (HTT, Cor. 5.2.2.5,
  Prop. 5.2.2.8);
- §2.1.1 (HTT, §3.3.2,
  the universal Cartesian fibration); Part CartesianFibrations §1.1.1 (HTT, Def. 2.4.2.1); Part InfinityCategoryFoundations §7.1.4 (HTT, §2.2.1, straightening);
- §1.7.1 (HTT, Thm. 3.2.0.1) and §1.7.2 (the straightening equivalence), §1.3.1 (HTT, Prop. 3.2.1.4, base change),
  §1.8.1 and §1.8.5 (the coCartesian form and its equivalence), §1.8.3 (the comparison `N(D) ⟵ N(Tw_*D) ⟶ N(D^co)`) and §2.5.2 (HTT,
  Rem. 3.3.2.3, classifying maps); Part CartesianFibrations §5.7.2 (HTT, Rem. 3.1.3.9, the coCartesian model
  structure); Part InfinityCategoryFoundations §9.3.1 (HTT, Cor. 2.2.5.4) and §9.5.1 (HTT, Thm. 2.2.5.1, the Joyal model structure,
  for the restriction fibration);
- Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4);
- Tau Ceti `SSet.catInfty`, `SSet.CartesianFibration`.

### 5.2 Colimits of localizations

**5.2.1.** Prove that localization commutes with colimits of ∞-categories (no Lurie statement; Nikolaus–Scholze, in the
proof of Prop. A.14, p. 143). Let `K` be a simplicial set and `F̄, Ḡ : K^▷ ⟶ Cat∞` colimit diagrams with
cone-point values `C` and `D`, joined by a natural transformation `α : F̄ ⟶ Ḡ`. Suppose given, for every
vertex `k` of `K`, a collection `W_k` of morphisms of `F(k)` such that every edge `k ⟶ k'` carries `W_k` into
`W_{k'}`, and suppose that each `α_k : F(k) ⟶ G(k)` exhibits `G(k)` as `F(k)[W_k⁻¹]`. Let `W` be the
collection of the images in `C` of the morphisms of all the `W_k`. Then `α` at the cone point exhibits `D` as
`C[W⁻¹]`.

*Proof route.* For every ∞-category `E`, `Fun(C, E)` is the limit of the `Fun(F(k), E)`: a test ∞-category
`T` sees `Map_{Cat∞}(T × C, E)`, and `T × −` preserves colimits in `Cat∞` (§3.3.3). Here E
ranges over all ∞-categories, including large ones, so the argument runs in `Cat∞` of a universe containing
E. A functor out of `C` inverts `W` exactly when each
restriction inverts `W_k`, so `Fun^W(C, E)` is the limit of the full subcategories `Fun^{W_k}(F(k), E)`. The
limit of the equivalences `Fun(G(k), E) ⟶ Fun^{W_k}(F(k), E)` is the equivalence `Fun(D, E) ⟶ Fun^W(C, E)`.

*Needs:*
- Part AdjunctionsAndLocalizations §2.4.1 (HA, Def. 1.3.4.1);
- Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1), §3.3.1 (HTT, Cor. 4.2.4.8) and §3.8.1 (`Cat∞` has small limits
  and colimits);
- §3.3.1, §3.3.2 (HTT, Prop. 3.3.4.2, Cor. 3.3.4.3, colimits in `Cat∞`) and §3.2.1 (HTT, Prop. 3.3.3.1, limits in `Cat∞`);
- §3.3.3 (products with `T` preserve colimits in `Cat∞`);
- Tau Ceti `SSet.catInfty` (HTT, Def. 3.0.0.1, `Cat∞`), `SSet.coslice.IsColimit`.

Together with the generation of `Cat∞` under small colimits by `Δ[0]` and `Δ[1]` (§3.4
(Nikolaus–Scholze, Lemma A.17)), this reduces statements about localizations over an arbitrary base to
the bases `Δ[0]` and `Δ[1]`.

### 5.3 Left derivable coCartesian fibrations and fiberwise localization

**5.3.1.** Define left derivable coCartesian fibrations (Nikolaus–Scholze, Def. A.8, pp. 135–136). Let `p : X ⟶ S` be a
coCartesian fibration of ∞-categories (Part CartesianFibrations §1.1) and `W` a collection of edges of `X`; write
`W_a` for those in the fiber `X_a` over a vertex `a`, `i_a : X_a ⟶ X_a[W_a⁻¹]` for a localization (Part
AdjunctionsAndLocalizations §2.4) and
`s_! : X_a ⟶ X_b` for the transport along an edge `s : a ⟶ b`. Then `p` is left derivable when:
1. `p` carries every edge of `W` to a degenerate edge of `S`;
2. for every edge `s : a ⟶ b` of `S`, the composite `i_b ∘ s_!` has an absolute right Kan extension
   `Ls_! : X_a[W_a⁻¹] ⟶ X_b[W_b⁻¹]` along `i_a` (Part AdjunctionsAndLocalizations §2.7);
3. for every 2-simplex of `S` with edges `s : a ⟶ b`, `t : b ⟶ c` and `u : a ⟶ c`, the canonical
   transformation `Lt_! ∘ Ls_! ⟶ Lu_!` is an equivalence. It is the transformation that the universal
   property of `Lu_!` assigns to the composite `Lt_! ∘ Ls_! ∘ i_a ⟶ Lt_! ∘ i_b ∘ s_! ⟶ i_c ∘ t_! ∘ s_! ≃
   i_c ∘ u_!`.

- Left derivable fibrations are stable under base change along any `K ⟶ S`.
- If `p` satisfies condition 1 and every transport `s_!` carries `W_a` into `W_b`, then `p` is left
  derivable, with `Ls_!` the induced functor and an invertible transformation, by Nikolaus–Scholze, Ex. A.9
  (Part AdjunctionsAndLocalizations §2.7).

**Checks.**

- Over `S = Δ[0]` every `(X, W)` is left derivable, with `Ls_!` the identity of `X[W⁻¹]`. For `X = S = Δ[1]`
  with `p` the identity and `W` the non-identity edge, condition 1 fails: `W` is not carried to a degenerate
  edge, and no functor from `X[W⁻¹] = Δ[0]` to `S` can make `X ⟶ X[W⁻¹] ⟶ S` equal to `p`. A definition
  without condition 1 would accept it.
- Over `Δ[2]`, take all three fibers the nerve of `[1]`, with `W_a` and `W_b` the non-identity edge and `W_c`
  empty, `s_!` constant at `1` and `t_!` the identity, so `u_! = t_! ∘ s_!` is constant at `1`. Right Kan
  extension along `[1] ⟶ Δ[0]` is the limit, evaluation at `0`, preserved by every functor, so condition 2
  holds. But `Lt_! ∘ Ls_!` picks `t_!(0) = 0` and `Lu_!` picks `u_!(0) = 1`, and the canonical
  transformation is the edge `0 ⟶ 1`, not an equivalence. A definition without condition 3 would accept it.
- For a left Quillen functor that does not preserve all weak equivalences, the fibration of
  §5.3.2 is left derivable. For example, the pushout functor from spans of simplicial sets, with the
  projective model structure, to simplicial sets carries the objectwise weak equivalence from the span
  `Δ[1] ← ∂Δ[1] ⟶ Δ[1]` to the span `Δ[0] ← ∂Δ[1] ⟶ Δ[0]` to the map from a circle to a point. A definition
  asking every `s_!` to preserve `W` would reject it.

*Needs:*
- Part AdjunctionsAndLocalizations §2.4.1 (HA, Def. 1.3.4.1) and §2.7.1, §2.7.2 (Nikolaus–Scholze, App. A, absolute right Kan
  extensions, Ex. A.9);
- Part CartesianFibrations §1.1.1 (HTT, Def. 2.4.2.1);
- Part CartesianFibrations §1.5.1 (HTT, §2.4.1, coCartesian edges and transport) and §7.2.1 (HTT, Prop. 3.3.1.3, base
  change over an ∞-category);
- Tau Ceti `SSet.CartesianFibration`.

**5.3.2.** Prove that the fibrations classified by Quillen functors are left derivable (Nikolaus–Scholze, Exs. A.10 and
A.12, pp. 136–137). Let `F : M ⟶ N` and `G : N ⟶ O` be left Quillen functors of model categories, with
functorial cofibrant replacements in `M` and `N`, and mark the weak equivalences of `M`, `N` and `O`. Then
the coCartesian fibration over `Δ[1]` classified by `N(F)` is left derivable, and so is the coCartesian
fibration over `Δ[2]` classified by the triangle `N(M) ⟶ N(N) ⟶ N(O)` with long edge `N(G ∘ F)`.

Here "classified" is the dual reading of §2.1, in `Cat∞` of a universe containing M, N and O, whose nerves are
large. Write f for the functor `[2] ⥤ Cat^Δ_∞` given by `N(M) ⟶ N(N) ⟶ N(O)`, so that the triangle is `N(f)`,
and p for a coCartesian fibration over Δ[2] that it classifies. By `op ∘ N(f) ≃ N(fᵒᵖ)` (§1.8) and invariance of
classification under equivalence of the classifying map (§2.5), `pᵒᵖ` is classified by `N(fᵒᵖ)ᵒᵖ`, the 2-simplex of
`Cat∞ᵒᵖ` given, along `Δ[2]ᵒᵖ ≅ Δ[2]`, by the sequence `N(O)ᵒᵖ ⟵ N(N)ᵒᵖ ⟵ N(M)ᵒᵖ`. By the transport statement of
§2.5.1 over Δ[n], `(pᵒᵖ)^♮` is then Cartesian equivalent, as a marked simplicial set over `Δ[2]^♯`, to `M^♮` of
that sequence, by a quasi-equivalence `M^♮ ⟶ (pᵒᵖ)^♮` up to the equivalence `pᵒᵖ ≃ σ^*Z`. So
the fibers of p are `N(M)`, `N(N)` and `N(O)`, its transports are `N(F)`, `N(G)` and `N(G ∘ F)`, and its
composition equivalence `t_! ∘ s_! ≃ u_!` corresponds to the strict identity `N(G) ∘ N(F) = N(G ∘ F)`; condition 3
is checked in this model. Over Δ[1] the same argument, with the sequence `N(N)ᵒᵖ ⟵ N(M)ᵒᵖ`, gives fibers
`N(M)`, `N(N)` and transport `N(F)`.

*Proof route.* Nikolaus–Scholze's. Condition 2 is the derived-functor statement of Part AdjunctionsAndLocalizations
§2.7 (Nikolaus–Scholze, Ex. A.10) for `F`, `G`
and `G ∘ F`. For condition 3, `LG ∘ LF` and `L(G ∘ F)` are induced by `X ↦ G(Q F(QX))` and
`X ↦ G(F(QX))`; since `F(QX)` is cofibrant, `Q F(QX) ⟶ F(QX)` is a weak equivalence between cofibrant
objects, which `G` preserves by Ken Brown's lemma.

*Needs:*
- §5.3.1 (Nikolaus–Scholze, Def. A.8); Part AdjunctionsAndLocalizations §2.7.3 (Nikolaus–Scholze, Ex. A.10);
- §1.8.4 (the involution op and `op ∘ N(f) ≃ N(fᵒᵖ)`), §2.1.2 (HTT, Def. 3.3.2.2, the dual reading) and §2.5.2 (HTT,
  Rem. 3.3.2.3, classifying maps; invariance under equivalence of the classifying map) and §2.5.1 (the
  transport statement over Δ[n]); Part CartesianFibrations §6.1.1 (HTT, §3.2.2, mapping simplices);
- Mathlib `HomotopicalAlgebra.CofibrantBrownFactorization`; ModelCategoryTheory, Part ModelCategories §4.1.1
  (HTT, §A.2.5).

**5.3.3.** Prove that localizing a left derivable coCartesian fibration fiberwise gives a coCartesian fibration
(Nikolaus–Scholze, Prop. A.14, p. 138). Let `p : X ⟶ S` be left derivable, `X ⟶ X[W⁻¹]` a localization, and
`X[W⁻¹] ⟶ S` the induced functor, chosen to be a categorical fibration. Then:
1. `X[W⁻¹] ⟶ S` is a coCartesian fibration;
2. for every vertex `a` of `S`, the map of fibers `X_a ⟶ X[W⁻¹]_a` exhibits `X[W⁻¹]_a` as `X_a[W_a⁻¹]`;
3. for every edge `s : a ⟶ b`, the transport `s'_!` of `X[W⁻¹]`, with the transformation that the functor
   `X ⟶ X[W⁻¹]` over `S` provides, exhibits `s'_!` as an absolute right Kan extension of
   `X_a ⟶ X_b ⟶ X[W⁻¹]_b` along `X_a ⟶ X[W⁻¹]_a`; so `s'_!` is the derived transport `Ls_!`.

Whether a categorical fibration over `S` is coCartesian is invariant under equivalence over `S`, so the
statement does not depend on the choice of `X[W⁻¹]`.

*Proof route.* Nikolaus–Scholze's, by descent along the base. Over `Δ[0]` there is nothing to prove. Over
`Δ[1]`, present `X` as the mapping simplex of its transport `φ : X₀ ⟶ X₁`, a pushout of `X₀ × Δ[1]` and `X₁`
along `X₀ × {1}`, which is a pushout in `Cat∞` because one leg is a monomorphism. The absolute right Kan
extension `LF` of condition 2, with its transformation, defines a map from it to the mapping simplex of
`LF`. Decomposing functor ∞-categories out of the two mapping simplices as pullbacks, the universal property
of `LF` identifies the functors out of the second with the functors out of the first that invert `W`, so the
second is the localization. For a general base, the class of `S` over which the statement holds contains
`Δ[0]` and `Δ[1]` and is closed under colimits in `Cat∞`: for `S` the colimit of `S_i`, write `X` as the
colimit of the `X ×_S S_i` by descent for coCartesian fibrations; the localized pieces form pullback squares
over the maps `S_i ⟶ S_j`, since the comparison maps are fiberwise equivalences preserving coCartesian edges;
so they glue to a coCartesian fibration over `S`, by the converse half of descent, whose total space is the
localization of `X` by §5.2. Its fibers are localizations, since every object of `S` is equivalent to the
image of an object of some `S_i`. Assertion 3 holds for edges of `S` that factor through some `S_i`, and
every edge of `S` is, up to equivalence, a composite of such edges, so condition 3 of the definition gives
assertion 3 for all edges. By the generation of `Cat∞` by `Δ[0]` and `Δ[1]` (§3.4) the
class is everything. The fibers of `X` are typically large, as for `N(M)` with `M` a model category, so the
argument runs in `Cat∞` of a universe containing `X` and `S`, where descent and the generation of `Cat∞` hold
as well.

*Needs:*
- §5.2.1 (localization commutes with colimits); §5.3.1 (Nikolaus–Scholze, Def. A.8);
- Part AdjunctionsAndLocalizations §2.4.1 (HA, Def. 1.3.4.1) and §2.7.1 (absolute right Kan extensions);
- §3.4.1, §3.4.2 (Nikolaus–Scholze, Lemma A.16, descent of coCartesian fibrations; Lemma A.17, generators of `Cat∞`), §3.3.1
  (HTT, Prop. 3.3.4.2, colimits in `Cat∞`), §1.8.1 (HTT, Thm. 3.2.0.1, for coCartesian fibrations), §2.3.1
  (categorical fibrations) and §2.4.3 (HTT, Prop. 3.3.1.5, fiberwise equivalences);
- Part CartesianFibrations §6.1.1 (HTT, §3.2.2, introduction, mapping simplices) and §6.2.1 (HTT, Def. 3.2.2.6); Part
  InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, the Joyal model structure, in which
  every object is cofibrant, for the mapping-simplex pushout);
- Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1, homotopy colimits as colimits in `Cat∞`);
- Part CartesianFibrations §1.1.1 (HTT, Def. 2.4.2.1); Tau Ceti `SSet.catInfty`.

**5.3.4.** Prove the base change and lift preservation of derived families (Nikolaus–Scholze, Cor. A.15, pp. 138–139).
Let `p : X ⟶ S` be left derivable. Then:
1. for every functor `K ⟶ S` from an ∞-category `K`, the functor `X ×_S K ⟶ X[W⁻¹] ×_S K` exhibits the
   target as the localization of `X ×_S K` at the edges lying over `W`;
2. if the transport `s_!` along an edge `s : a ⟶ b` carries `W_a` into `W_b`, then `X ⟶ X[W⁻¹]` carries
   `p`-coCartesian lifts of `s` to coCartesian edges.

*Proof route.* Nikolaus–Scholze's. For (1), the base change is left derivable; by §5.3.3 its
localization is a coCartesian fibration over `K` with the same fibers and transports as `X[W⁻¹] ×_S K`, and
the comparison map is a fiberwise equivalence preserving coCartesian edges, hence an equivalence. For (2), by
Ex. A.9 (Part AdjunctionsAndLocalizations §2.7) the derived transport along `s` is the induced functor with an
invertible transformation,
which is the claim.

*Needs:* §5.3.1 and §5.3.3 (Nikolaus–Scholze, Def. A.8, Prop. A.14); §2.4.1 (HTT, Prop. 3.3.1.3, base change; Prop. 3.3.1.5,
fiberwise equivalences); Part AdjunctionsAndLocalizations §2.7.2 (Nikolaus–Scholze, Ex. A.9).


### Examples

- For an adjunction `F ⊣ G` of ∞-categories, the square with `G` on both horizontal sides and identities vertically is
  left adjointable (§5.1), and for `A = Δ[0]`, `B = Δ[1]` the diagram-level statement (§5.1.3) returns the edge `F` of `Cat∞`.
- Localizing the nerve of `[1]` at its non-identity edge gives `Δ[0]`. Localizing the nerve of the poset with `0 < 1`
  and `2 < 1` at both edges gives `Δ[0]` too, by §5.2 applied to the pushout of two copies of `Δ[1]` along `{1}`.
- For a left Quillen functor `F`, §5.3 assembles `F`, its derived functor and the localizations into one coCartesian
  fibration over `Δ[1]` whose fibers are the underlying ∞-categories (Part AdjunctionsAndLocalizations §2.6, §2.7).

### Dependencies

Layers 1–3; Part AdjunctionsAndLocalizations (correspondences, the agreement of the definitions of adjunction, the
localization `C[W⁻¹]`, absolute Kan extensions and Quillen derived functors); Part CartesianFibrations (Cartesian and
coCartesian edges, the coCartesian model structure, products of marked simplicial sets, mapping simplices, base
change and fiberwise equivalences over an ∞-category); Part LimitsAndKanExtensions (diagrams in simplicial model
categories, homotopy colimits, the existence of colimits in `Cat∞`); Part InfinityCategoryFoundations (the Joyal model structure);
ModelCategoryTheory, Part ModelCategories (Quillen adjunctions); Mathlib's mates and Ken Brown's lemma.

## Downstream consumers

This roadmap is used by every later member of the InfinityCategoryTheory family, each of which lists what it uses from it in its own supplier contracts.

## References

- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Cited here: §3.2 (marked straightening,
  pp. 187–215); §3.3.1–§3.3.4 (invariance, categorical fibrations, classifying maps, limits and colimits in `Cat∞`,
  pp. 222–237); Prop. 3.1.5.3, p. 183; Props. 4.3.3.4–4.3.3.10, pp. 304–310; §7.3.1 (adjointable squares,
  pp. 768–769).
- **HA.** Jacob Lurie, *Higher Algebra*, author's PDF, version of 18 September 2017,
  [math.ias.edu/~lurie/papers/HA.pdf](https://www.math.ias.edu/~lurie/papers/HA.pdf). Statement numbers and pages
  are those of this PDF, whose PDF and printed page numbers agree.
  Cited here: Cor. 4.7.4.18 (3),
  p. 699 (compared in §5.1).
- **Nikolaus–Scholze.** Thomas Nikolaus and Peter Scholze, *On topological cyclic homology*, Acta Mathematica 221
  (2018), 203–409, [arXiv:1707.01799](https://arxiv.org/abs/1707.01799); page numbers are those of arXiv version 2.
  Cited here: Def. A.8, Exs. A.10 and A.12, Prop. A.14, Cor. A.15, Lemmas A.16 and A.17, pp. 135–143.
- **Liu–Zheng.** Yifeng Liu and Weizhe Zheng, *Enhanced six operations and base change theorem for higher Artin
  stacks*, [arXiv:1211.5948](https://arxiv.org/abs/1211.5948). Cited here: Def. 2.2.1 and Prop. 2.2.4 (partial
  adjoints), pp. 77–80, with page numbers of arXiv version 4.
