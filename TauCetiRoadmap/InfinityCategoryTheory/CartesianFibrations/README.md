# Roadmap: Cartesian fibrations and the Cartesian model structure

**Summary.** This Part builds the theory of Cartesian and coCartesian fibrations of simplicial sets. Marked
straightening is Part Straightening's.

It builds on the Joyal model structure, left fibrations and unmarked straightening of Part
InfinityCategoryFoundations.

- **Cartesian edges and fibrations (Layers 1–2).** coCartesian fibrations are defined in §1.1. Cartesian, locally
  Cartesian and coCartesian edges and fibrations, with their lifting and mapping-space criteria and fiberwise
  equivalence criteria (HTT, Cor. 2.4.2.10, p. 143; Cor. 2.4.4.6, p. 150).
- **Categorical equivalences (Layer 3).** Joyal's theorem that the fibrant objects of the Joyal structure are the
  ∞-categories (Part InfinityCategoryFoundations §9.5; HTT, Thm. 2.4.6.1, p. 154) and the comparison of the forms of
  categorical equivalence (Part InfinityCategoryFoundations §9.7; HTT, Prop. 2.2.5.8, p. 112) give the invariance of
  functor ∞-categories under categorical equivalence; between ∞-categories, the categorical equivalences are the
  equivalences of quasicategories.
- **Correspondences (Layer 4).** Correspondences, bifibrations and arrow ∞-categories.
- **The Cartesian model structure (Layer 5).** The Cartesian and coCartesian model structures on marked simplicial
  sets over every base (HTT, Prop. 3.1.3.7, p. 175; Rem. 3.1.3.9, p. 178).
- **Mapping simplices (Layer 6).** Every Cartesian fibration over a simplex is replaced by a mapping simplex (HTT,
  Prop. 3.2.2.7, p. 198).
- **Base change and fiberwise criteria (Layer 7).** The results listed below.

**Headline theorems.**
- Functor ∞-categories are invariant under categorical equivalence (HTT, Prop. 1.2.7.3, p. 57).
- Base change: for a Cartesian or coCartesian fibration `p : X ⟶ S` over an ∞-category, pullback along p carries
  categorical equivalences over S to categorical equivalences (HTT, Prop. 3.3.1.3, p. 223, over an ∞-category
  base), and pullback along any (co)Cartesian fibration carries inner anodyne maps to monic categorical
  equivalences.
- The fiberwise criterion: a map of Cartesian fibrations preserving Cartesian edges is a categorical equivalence
  when it is one on every fiber, over any base, and conversely over an ∞-category (HTT, Prop. 3.3.1.5, p. 225).
- Cartesian and coCartesian fibrations over ∞-categories, and their pullbacks, are categorical fibrations, and over
  a Kan complex the Cartesian, coCartesian and categorical fibrations coincide (HTT, Prop. 3.3.1.7, p. 227, over an
  ∞-category base; Prop. 3.3.1.8, p. 228).
- Spaces of sections into a categorical fibration are invariant under categorical equivalence of the source.

## Scope and ownership

Already in the library, and cited rather than planned:
- the pushout-product of an inner anodyne map with a monomorphism is inner anodyne, and the inner-fibration half of
  its adjoint form (HTT, Cor. 2.3.2.4, p. 118; first half of Cor. 2.3.2.5, p. 119): Mathlib
  `SSet.innerAnodyneExtensions_pushoutObjObjι` and `SSet.innerFibration_pullbackObjObjπ`;
- functor ∞-categories `Fun(K, C)` are ∞-categories (HTT, Prop. 1.2.7.3 (1), p. 57): Mathlib's instance
  `Quasicategory ((ihom K).obj C)`;
- isomorphisms are Cartesian fibrations, and Cartesian fibrations are stable under base change and composition
  (HTT, Prop. 2.4.2.3, p. 139): Tau Ceti `SSet.CartesianFibration.of_isIso`, `SSet.CartesianFibration.of_isPullback`,
  `SSet.CartesianFibration.comp`; parts (1), (2) and the forward half of (3) of HTT, Prop. 2.4.1.3, p. 133: Tau Ceti
  `SSet.Edge.isCartesian_of_isIso`, `SSet.Edge.IsCartesian.of_isPullback`, `SSet.Edge.IsCartesian.comp`;
- the class of marked anodyne maps (HTT, Def. 3.1.1.1, p. 165): Tau Ceti `TauCeti.MarkedSSet.markedAnodyneExtensions`,
  the lifting closure of the four generating families.

Left to other Parts. The Joyal model structure with Joyal's theorem on its fibrant objects (HTT, Thm. 2.4.6.1, with
Lemmas 2.4.5.1 and 2.4.6.2–2.4.6.4), categorical fibrations over an ∞-category (HTT, Cor. 2.4.6.5), inner anodyne maps, categorical fibrations as a lifting class, the
covariant and contravariant structures, unmarked straightening, minimal models and the reduction of base-change
statements to simplices (HTT, Prop. 3.2.2.8) are Part InfinityCategoryFoundations. Marked straightening and
unstraightening as constructions are Part Straightening's (§1.1). The straightening theorem and what is proved through it are not stated here:
invariance of Cartesian fibrations under categorical equivalence of the base (HTT, Prop. 3.3.1.1), the forms of HTT,
Props. 3.3.1.3 and 3.3.1.7 over an arbitrary simplicial set, the converse half of HTT, Prop. 3.3.1.5 over an
arbitrary simplicial set, homotopy pullbacks along Cartesian fibrations (HTT, Cor. 3.3.1.4), the comparison of the
Joyal and Cartesian structures (HTT, Prop. 3.1.5.3) and classifying maps; Part Straightening states them. Cofinality
and Kan extensions are Part LimitsAndKanExtensions. The model-categorical background (weak saturation, the small
object argument, homotopy categories of model categories, properness and homotopy pullbacks, Quillen adjunctions,
perfect classes and Smith's theorem, the Kan–Quillen and Bergner structures, simplicial and excellent model
categories) is the ModelCategoryTheory family.

## Conventions

Locators such as (HTT, Prop. 5.2.7.8, p. 385) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.2.2` here and `Part CartesianFibrations §2.2.2` elsewhere,
is one target.

- **∞-categories.** An ∞-category is a quasicategory, Mathlib `SSet.Quasicategory`. Witness Check: `Λ[2, 1]` is not
  one (its two edges have no composite), while the nerve of any category is.
- **Categorical equivalences** are those of Part InfinityCategoryFoundations §2.1 (HTT, Def. 1.1.5.14, p. 43): maps inducing an
  equivalence of simplicial categories after `C[−]`. The `Suggested.lean` declaration `IsCategoricalEquivalence` uses the
  equivalent form: restriction `h Fun(B, C) ⟶ h Fun(A, C)` is an equivalence for every ∞-category C
  (Kerodon, §4.5.4, Def. 4.5.4.1 and Prop. 4.5.4.8). The two agree by Part InfinityCategoryFoundations §9.7 (HTT, Prop. 2.2.5.8,
  p. 112), and for ∞-categories they agree with Tau Ceti's `SSet.QCat.IsCategoricalEquivalence` by §3.4. Both satisfy two-out-of-three. Witness Check: `Λ[2, 1] ⊆ Δ[2]` is a
  categorical equivalence (Part InfinityCategoryFoundations §6.1, HTT, Lemma 2.2.5.2), but `∂Δ[1] ⊆ Δ[1]` is not: for
  C = Δ[0] ⊔ Δ[0], the category `h Fun(Δ[1], C)` is discrete with 2 objects and `h Fun(∂Δ[1], C)` is discrete
  with 4.
- **Classes of maps.** Categorical fibrations are those of Part InfinityCategoryFoundations §9.4: maps with the right lifting
  property against every monomorphism that is a categorical equivalence (HTT's Joyal fibrations; Kerodon,
  Def. 4.5.6.5, calls them isofibrations, a word this roadmap does not use for simplicial sets). Over an ∞-category
  they are the inner fibrations along which equivalences lift (Part InfinityCategoryFoundations §10.2; §3.3 for lifts with
  prescribed target). Trivial fibrations are the maps with the right
  lifting property against all monomorphisms. Witness Check: the inclusion `{0} ⟶ J`, J the nerve of the free-living
  isomorphism, is an inner fibration but not a categorical fibration (the isomorphism of J does not lift).
- **Cartesian fibrations as categorical fibrations.** Where a statement about a Cartesian fibration of arbitrary
  simplicial sets uses that it is a categorical fibration, the roadmap states it with the hypothesis that the
  fibration is a categorical fibration, which holds over ∞-category bases and for product projections by §7.4; the
  statements so restated are listed under Downstream consumers. Witness Check: `{0} ⊆ Δ[1]` is a Cartesian fibration
  over the ∞-category Δ[1] and a categorical fibration, while the inner fibration `{0} ⟶ J` above is neither Cartesian
  nor categorical.
- **Model structures on one category.** The Kan–Quillen, Joyal, covariant, contravariant, Cartesian and coCartesian
  structures share underlying categories, so each lives on a type synonym with its bridge equivalence, never as a
  global instance. Witness Check: `Λ[2, 0] ⊆ Δ[2]` is a Kan–Quillen trivial cofibration but not a categorical
  equivalence. For C = Δ[1], the categories `h Fun(Δ[2], C)` and `h Fun(Λ[2, 0], C)` are posets with 4 and 5 elements
  (monotone triples a ≤ b ≤ c, against triples with a ≤ b and a ≤ c), so they are not equivalent and the two
  structures differ.
- **Variance.** Cartesian fibrations lift edges with prescribed target, and their transport functors run against the
  edges of the base; coCartesian ones (§1.1, HTT, Def. 2.4.2.1) lift with prescribed source.
  Witness Check: for an object d of an ∞-category D, the right fibration `D_{/d} ⟶ D` is Cartesian, and transport
  along an edge `x ⟶ x'` sends `x' ⟶ d` to its composite `x ⟶ d`, a functor from the fiber over x' to the fiber
  over x.
- **Duality.** `S ↦ Sᵒᵖ` (Mathlib `SSet.opFunctor`) preserves monomorphisms, categorical equivalences (through the
  opposite comparison of Part InfinityCategoryFoundations §2.1), inner anodyne maps and categorical fibrations, sends `Λ[n, i]` to
  `Λ[n, n − i]`, and exchanges Cartesian with coCartesian fibrations and right with left fibrations; a statement
  about one variance is proved by applying its dual to `pᵒᵖ`. Witness Check: `{1} ⊆ Δ[1]` is a left fibration and not
  a right fibration (the edge `0 ⟶ 1` has no lift ending at 1); its opposite is `{0} ⊆ Δ[1]`, a right fibration and
  not a left one.
- **Pullbacks.** For `q : Y ⟶ B` and a map `A ⟶ B`, write `Y_A = Y ×_B A`, and `Y_b` for the fiber over a vertex b.
  Pullback along q is a functor from simplicial sets over B to simplicial sets that preserves colimits (colimits of
  simplicial sets are universal) and monomorphisms. Witness Check: for q = `𝟙 B`, `Y_A = A`; for B = Δ[0],
  `Y_A = Y × A`; and for `q : {0} ⊆ Δ[1]` and `A = {1}`, `Y_A = ∅`, so pullback does not preserve nonempty objects.
- **Mapping objects over a base.** For maps `A ⟶ X` and `N ⟶ X`, `Map_X(A, N)` is the fiber of
  `Fun(A, N) ⟶ Fun(A, X)` over the vertex `A ⟶ X`: its n-simplices are the maps `A × Δ[n] ⟶ N` over X. Witness Check:
  for X = Δ[0] it is `Fun(A, N)`; for `N = C × X ⟶ X` a product projection it is `Fun(A, C)`; and for
  `N = {0} ⊆ Δ[1] = X` and `A = Δ[1]` with the identity it is empty, although `Fun(Δ[1], {0})` is not.
- **Marked simplicial sets** are Tau Ceti `TauCeti.MarkedSSet` (Set⁺_Δ), with `flat` (only degenerate edges marked)
  and `sharp` (all edges marked). For a Cartesian fibration `p : X ⟶ S`, X^♮ marks the p-Cartesian edges (§5.3).
  Witness Check: `Δ[1]^♭` and `Δ[1]^♯` have the same underlying simplicial set and differ in one marked edge.
- **Universes.** Simplicial sets are `SSet.{u}`, and every statement is about simplicial sets of one universe.
  Witness Check: the categorical equivalences of `SSet.{u}` are tested against ∞-categories of `SSet.{u}`; for maps
  of ∞-categories the test is equivalent to having a homotopy inverse (§3.4), which does not mention the universe.

## Exact supplier contracts

### From Mathlib

- `SSet.Quasicategory`, `SSet.KanComplex` (`AlgebraicTopology/Quasicategory/Basic.lean`,
  `AlgebraicTopology/SimplicialSet/KanComplex.lean`); `SSet.InnerFibration`, `SSet.innerFibrations`,
  `SSet.innerHornInclusions`, `SSet.quasicategory_iff_innerFibration`
  (`AlgebraicTopology/Quasicategory/InnerFibration.lean`).
- `SSet.innerAnodyneExtensions` (`AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/Basic.lean`);
  `SSet.innerAnodyneExtensions_pushoutObjObjι`, `SSet.innerFibration_pullbackObjObjπ`,
  `SSet.innerAnodyneExtensions_unionProd_ι` (`.../AnodyneExtensions/Inner/PushoutProduct.lean`).
- `SSet.Subcomplex.unionProd` (`AlgebraicTopology/SimplicialSet/Monoidal.lean`), `SSet.horn`, `SSet.boundary`,
  `SSet.stdSimplex`, `SSet.opFunctor` (`.../SimplicialSet/Op.lean`).
- `SSet.Edge`, `SSet.Edge.map`, `SSet.Edge.InvStruct` (`AlgebraicTopology/SimplicialSet/CompStruct.lean`).
- `SSet.hoFunctor` (`AlgebraicTopology/SimplicialSet/HomotopyCat.lean`), `CategoryTheory.nerve`,
  `CategoryTheory.nerveAdjunction` (`.../SimplicialSet/NerveAdjunction.lean`), `MonoidalClosed.pre`, `ihom`.
- `SSet.QCat` (`AlgebraicTopology/Quasicategory/StrictBicategory.lean`), the strict bicategory of quasicategories.
- `CategoryTheory.SimplicialThickening`, `CategoryTheory.SimplicialNerve` (`AlgebraicTopology/SimplicialNerve.lean`).
- `HomotopicalAlgebra.ModelCategory` (`AlgebraicTopology/ModelCategory/Basic.lean`);
  `HomotopicalAlgebra.ModelCategory.over` (`AlgebraicTopology/ModelCategory/Over.lean`), the model structure on an
  over category; `MorphismProperty.IsWeakFactorizationSystem`
  (`CategoryTheory/MorphismProperty/WeakFactorizationSystem.lean`); `MorphismProperty.rlp`, `MorphismProperty.llp`
  (`CategoryTheory/MorphismProperty/LiftingProperty.lean`); `MorphismProperty.monomorphisms`;
  `SSet.rlp_monomorphisms` (`AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean`), the right lifting class
  of the monomorphisms is that of the boundary inclusions; `SSet.anodyneExtensions`
  (`.../SimplicialSet/AnodyneExtensions/Basic.lean`).
- `CategoryTheory.ObjectProperty.homMk` (`CategoryTheory/ObjectProperty/FullSubcategory.lean`); `CategoryTheory.Over`
  (`CategoryTheory/Comma/Over/Basic.lean`).
- `CategoryTheory.Functor.IsPreFibered`, `CategoryTheory.Functor.IsFibered`
  (`CategoryTheory/FiberedCategory/Fibered.lean`); `Functor.IsCartesian`, `Functor.IsStronglyCartesian`
  (`.../FiberedCategory/Cartesian.lean`); `Functor.IsStronglyCocartesian` (`.../FiberedCategory/Cocartesian.lean`).

Nothing is assumed of these beyond their statements at the pin.

### From Tau Ceti

- `SSet.Edge.IsCartesian`, `SSet.CartesianFibration`, `SSet.Edge.isCartesian_of_isIso`,
  `SSet.Edge.IsCartesian.of_isPullback`, `SSet.Edge.IsCartesian.comp`, `SSet.CartesianFibration.of_isIso`,
  `SSet.CartesianFibration.of_isPullback`, `SSet.CartesianFibration.comp`
  (`TauCeti/AlgebraicTopology/Quasicategory/Cartesian.lean`). There is no coCartesian counterpart; coCartesian edges
  and fibrations are those of §1.1, through `SSet.opFunctor`.
  **Checks** (`SSet.Edge.IsCartesian`, `SSet.CartesianFibration`, `SSet.Edge.isCartesian_of_isIso`).
  - For p an isomorphism every edge is p-Cartesian, and p is a Cartesian
    fibration.
  - The inclusion {0} ⊆ Δ[1] is a Cartesian fibration (no edge of Δ[1] has its target over 0 except the
    degenerate one), while {1} ⊆ Δ[1] is not: the edge 0 → 1 has no lift ending at 1. The direction of lifting
    is pinned.
  - For S = Δ[0], the p-Cartesian edges of an ∞-category X are its equivalences; the nondegenerate edge of
    Δ[1] is not Δ[1] → Δ[0]-Cartesian.
- `SSet.Edge.IsEquivalence`, `SSet.core` (`TauCeti/AlgebraicTopology/Quasicategory/Core.lean`);
  `SSet.Edge.isEquivalence_iff_hornFilling_zero` (`TauCeti/AlgebraicTopology/Quasicategory/OuterHorn.lean`).
- `SSet.Edge.opEquiv` (`TauCeti/AlgebraicTopology/SimplicialSet/Op.lean`): the edges of `Xᵒᵖ` are those of X with
  source and target exchanged.
- `SSet.QCat.IsCategoricalEquivalence` (`TauCeti/AlgebraicTopology/Quasicategory/CategoricalEquivalence.lean`): an
  equivalence in the bicategory `SSet.QCat`.
- `SSet.RightFibration`, `SSet.LeftFibration`, `SSet.rightFibration_pullbackObjObjπ`
  (`TauCeti/AlgebraicTopology/SimplicialSet/AnodyneExtensions/LeftRight/`): for a right fibration `N ⟶ X` and a
  monomorphism `K ⊆ L`, the pullback-hom `Fun(L, N) ⟶ Fun(K, N) ×_{Fun(K, X)} Fun(L, X)` is a right fibration.
  Tau Ceti's `SSet.CategoricalFibration` is not used; categorical fibrations are those of Part
  InfinityCategoryFoundations §9.4.1.
- `TauCeti.MarkedSSet`, `TauCeti.MarkedSSet.flat`, `TauCeti.MarkedSSet.sharp`, `TauCeti.MarkedSSet.toSharp`,
  `TauCeti.MarkedSSet.ofEdges` (`TauCeti/AlgebraicTopology/SimplicialSet/Marked/Basic.lean`);
  `TauCeti.MarkedSSet.mapFlat`, `TauCeti.MarkedSSet.mapSharp` (`.../Marked/MappingSpace.lean`);
  `TauCeti.MarkedSSet.markedAnodyneExtensions` (`.../Marked/Anodyne.lean`). Forgetting the marking is `TauCeti.MarkedSSet.forget`.
  **Checks** (`TauCeti.MarkedSSet`, `TauCeti.MarkedSSet.flat`, `TauCeti.MarkedSSet.sharp`).
  - Δ[0] has exactly one marking, and Δ[1] has two (`Δ[1]^♭` and `Δ[1]^♯`); a definition allowing
    degenerate edges to be unmarked would give Δ[0] two.
  - The identity of Δ[1] is a morphism `Δ[1]^♭ → Δ[1]^♯` but not `Δ[1]^♯ → Δ[1]^♭`.
  - Forgetting the marking is left adjoint to `X ↦ X^♯` and right adjoint to `X ↦ X^♭`.

### From TauCetiRoadmap.InfinityCategoryTheory.InfinityCategoryFoundations

- §1.2 and §2.1: functor ∞-categories, the core, full subcategories, cones, final and initial objects;
  rigidification, homotopy categories, mapping objects, categorical equivalences, fully faithful maps and the
  opposite comparison.
- Layers 2–5: equivalences and essential surjectivity, the comparison of `hS` with `SSet.hoFunctor`, left fibrations
  and left anodyne maps, pushout-products and exponentials, joins and slices, Kan complexes and cores, mapping
  spaces, left fibrations over Kan complexes, final objects.
- Layers 6–8: rigidification of inner anodyne maps (§6.1, HTT, Lemma 2.2.5.2), the covariant and contravariant model
  structures, unmarked straightening over a point and pointwise equivalences of right fibrations, the mapping-space
  comparison and final objects through the homotopy category.
- Layer 9: generators of inner anodyne maps, products of categorical equivalences, categorical fibrations, the
  Joyal model structure with its Cartesian closedness and Joyal's theorem on its fibrant objects (§9.5, HTT,
  Thm. 2.4.6.1), its Quillen equivalence with the Bergner structure, and the forms of categorical equivalence
  (§9.7, HTT, Props. 2.2.5.7 and 2.2.5.8).
- §10.2: categorical fibrations over an ∞-category (HTT, Cor. 2.4.6.5); §10.5: base change of categorical
  equivalences is tested over simplices (HTT, Prop. 3.2.2.8).

### From TauCetiRoadmap.ModelCategoryTheory

- Part ModelCategories: weak saturation and the small object argument (§1.3, §1.4), the homotopy category of
  bifibrant objects (§3.1), homotopy extension (§3.2), properness and homotopy pullbacks and pushouts (§3.4, §3.5),
  Quillen adjunctions and equivalences (§4.1, §4.2), perfect classes, combinatorial model categories and Smith's
  theorem (§5.5, §6.1, §6.3).
- Part KanQuillen: homotopy equivalences of Kan complexes (§1.3), weak homotopy equivalences and the Kan–Quillen
  structure with its properness (§3.1, §3.2, §3.4).
- Part SimplicialCategories: monoidal and simplicial model categories (§1.2, §1.3), the Bergner structure (§5.4) and
  excellent model categories (§5.6–5.8).

## How to read the build

Layers 1–2 develop Cartesian and coCartesian edges and fibrations: lifting, uniqueness and mapping-space criteria,
local lifts, and the fiberwise equivalence criteria over ∞-categories. Layer 3 takes the fibrant objects of the Joyal
structure and the categorical fibrations over an ∞-category from Part InfinityCategoryFoundations, states the latter for lifts
with prescribed target, and with the forms of categorical equivalence of Part InfinityCategoryFoundations §9.7 proves the
invariance of functor ∞-categories and compares categorical equivalences of ∞-categories with Tau Ceti's. Layer 4 treats correspondences, bifibrations and arrow ∞-categories. Layer 5 builds the Cartesian and
coCartesian model structures on marked simplicial sets over a base. Layer 6 replaces Cartesian fibrations over a
simplex by mapping simplices. Layer 7 draws the consequences that need no straightening: base change along a
(co)Cartesian fibration, first for inner anodyne maps over any base and then for categorical equivalences over an
∞-category; the fiberwise criterion; categorical fibrations over ∞-categories and Kan complexes; invariance of section
spaces; and functor fibrations.

Two sections hold definitions that later Parts cite: §1.1 defines coCartesian edges and fibrations, and §5.1 the
cofibrations of marked simplicial sets.

## Layer 1: Cartesian and coCartesian edges

### 1.1 CoCartesian edges and fibrations

**1.1.1.** Define, for a map `p : X ⟶ S`, an edge `f : x ⟶ y` of X to be p-coCartesian when it is `pᵒᵖ`-Cartesian as the
edge `y ⟶ x` of `Xᵒᵖ`, and p to be a coCartesian fibration when `pᵒᵖ : Xᵒᵖ ⟶ Sᵒᵖ` is a Cartesian fibration (HTT,
Def. 2.4.2.1, p. 139, second sentence; Conventions, duality). The `Suggested.lean` declarations are
`Edge.IsCocartesian` and `CocartesianFibration`, defined through Mathlib `SSet.opFunctor` and Tau Ceti
`SSet.Edge.opEquiv`, `SSet.Edge.IsCartesian` and `SSet.CartesianFibration`.

- Unwound: p is an inner fibration, and for every edge `e : s ⟶ s'` of S and vertex x over s there is a
  p-coCartesian edge `x ⟶ x'` over e.

**Checks.**
- The inclusion `{1} ⊆ Δ[1]` is a coCartesian fibration and not a Cartesian one, and `{0} ⊆ Δ[1]` the reverse
  (the supplier contract of `SSet.CartesianFibration`): the duality is not the identity.
- The inclusion `∂Δ[1] ⊆ Δ[1]` is an inner fibration (a nerve of a functor) but not a coCartesian fibration: the
  edge `0 ⟶ 1` has no lift starting at 0. A definition asking only for an inner fibration with ∞-categorical
  fibers would accept it.
- Every ∞-category X is a coCartesian fibration over Δ[0]: `Xᵒᵖ` is an ∞-category, the only edges of Δ[0] are
  degenerate, and they lift to identities, which are Cartesian over Δ[0] because over a point the Cartesian edges
  of an ∞-category are its equivalences (the supplier contract of `SSet.Edge.IsCartesian`). For the same reason the
  edge `0 ⟶ 1` of Δ[1] is not coCartesian over Δ[0].

*Needs:* Tau Ceti `SSet.CartesianFibration`, `SSet.Edge.IsCartesian`; Mathlib `SSet.opFunctor`.

### 1.2 The horn criterion and cancellation for Cartesian edges

**1.2.1.** Prove two characterizations of the p-Cartesian edges f of X for an inner fibration `p : X ⟶ S`.
- **Horn form** (HTT, Rem. 2.4.1.4, p. 134): f is p-Cartesian exactly when, for every n ≥ 2, every square from
  `Λ[n, n] ⟶ X` over `Δ[n] ⟶ S` whose horn sends the last edge to f has a diagonal filler. The route unwinds the slice
  lifting problems through joins, `Δ[k] ⋆ Δ[0] ≅ Δ[k + 1]`.
- **Cancellation** (HTT, Prop. 2.4.1.3 (3), converse half, p. 133; `Suggested.lean` declaration
  `Edge.isCartesian_of_isCartesian_comp`): for a second inner fibration `q : S ⟶ Z` with
  `p f` q-Cartesian, f is p-Cartesian when it is `(p ≫ q)`-Cartesian. The route: the comparison of slices is a right
  fibration with contractible fibers.

*Needs:* `SSet.Edge.IsCartesian`, `SSet.Edge.IsCartesian.comp`; Tau Ceti `SSet.slice.homEquiv`,
`SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2), §4.2.1 (HTT, Prop. 2.1.2.1) and §5.3.1 (HTT, Lemma 2.1.3.3), §5.3.2
(HTT, Lemma 2.1.3.4); Mathlib `SSet.rlp_monomorphisms` (HTT, Example 2.0.0.2).

### 1.3 Cartesian edges and equivalences

**1.3.1.** Prove that for an inner fibration `p : C ⟶ D` of ∞-categories, a morphism f of C is an equivalence exactly
when it is p-Cartesian and `p f` is an equivalence of D (HTT, Prop. 2.4.1.5, p. 134; `Suggested.lean` declaration
`Edge.isEquivalence_iff_isCartesian`). In particular, for an inner fibration of ∞-categories every degenerate edge is
p-Cartesian (HTT, Cor. 2.4.1.6, p. 135). For a Cartesian fibration over any base the same holds: a degenerate edge is
locally p-Cartesian (§1.6, second Check), and locally Cartesian edges of a Cartesian fibration are Cartesian (§2.3.2).
For an inner fibration over an arbitrary base it fails: take S = Δ[2] with the edge from 1 to 2 collapsed to a vertex
s and X the image in S of the edge from 0 to 2; the pullback over `Δ[2] ⟶ S` is `Λ[2, 2] ⊆ Δ[2]`, in which the
degenerate edge at s becomes the edge from 1 to 2 and the edge from 0 to 2 does not factor through 1. The route is
§1.2 applied to `C ⟶ D ⟶ Δ[0]`: over a point, the horn criterion with Part InfinityCategoryFoundations §5.1 (HTT,
Prop. 1.2.4.3) says that the Cartesian edges of an ∞-category are its equivalences.

*Needs:* §1.2.1; `SSet.Edge.IsCartesian.comp` (HTT, Prop. 2.4.1.3 (3), forward half); Part InfinityCategoryFoundations §5.1 (HTT,
Prop. 1.2.4.3) and §2.3.1 (HTT, §1.2.4).

### 1.4 Cartesian edges in 2-simplices and uniqueness of lifts

**1.4.1.** Prove that for an inner fibration `p : C ⟶ D` of ∞-categories and a 2-simplex with edges `f : C₀ ⟶ C₁`, `g : C₁ ⟶ C₂`,
`h : C₀ ⟶ C₂`, if g is p-Cartesian then f is p-Cartesian exactly when h is (HTT, Prop. 2.4.1.7, p. 135;
`Suggested.lean` declaration `Edge.isCartesian_iff_of_compStruct`). The route
compares slices over subsets of Δ[2] by right fibrations, trivial along left anodyne inclusions. Consequently Cartesian
lifts are unique up to equivalence (HTT, Rem. 2.4.1.9, p. 137): for a vertex x and an edge `f̄ : s ⟶ p x`, the fiber
`F = X_{/x} ×_{S_{/p x}} {f̄}` is an ∞-category in which every p-Cartesian lift `f : x' ⟶ x` of f̄ is final, since
`F_{/f} ⟶ F` is a base change of the trivial fibration defining Cartesianness; with §1.3, an edge equivalent in F to
a p-Cartesian edge is p-Cartesian.

*Needs:* `SSet.Edge.IsCartesian`; §1.3.1; Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2), §4.2.1 (HTT, Prop. 2.1.2.1), §4.3.2
(HTT, Prop. 2.1.2.5), §5.3.2 (HTT, Lemma 2.1.3.4), §8.2.1 (HTT, Cor. 1.2.12.5) and §5.5.3 (HTT, Prop. 1.2.12.9); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12, final objects); Mathlib `SSet.rlp_monomorphisms` (HTT, Example 2.0.0.2).

### 1.5 Coslice and prism criteria for coCartesian edges

**1.5.1.** Prove that for `p : X ⟶ S`, an edge `f : x ⟶ y` is p-coCartesian (§1.1) exactly when the coslice map `X_{f/} ⟶ X_{x/} ×_{S_{p x/}} S_{p f/}` is a
trivial fibration (HTT, §2.4.1, after Prop. 2.4.1.7, p. 136), through `(K ⋆ L)ᵒᵖ ≅ Lᵒᵖ ⋆ Kᵒᵖ`. Every result about
Cartesian edges has a coCartesian dual, obtained by applying it to `pᵒᵖ` (Conventions, duality); in the horn criterion
`Λ[n, n]` becomes `Λ[n, 0]` and the last edge the first.

**Checks.**
- For the projection `Δ[1] ⟶ Δ[0]`, the edge `0 ⟶ 1` is neither: over a point both mean equivalence, and `0 ⟶ 1` is
  not invertible in Δ[1]. A definition "coCartesian = image in S is degenerate" fails here.
- Let E be the poset `a < b`, `a' < b` with a, a' over 0 and b over 1, and `p = nerve(E ⟶ [1])`. The edge `a ⟶ b` is
  p-coCartesian (b is the only object over 1) but not p-Cartesian (`a' ⟶ b` does not factor through a). So the two
  notions differ, and for nerves they are Mathlib's `Functor.IsStronglyCocartesian` and `Functor.IsStronglyCartesian`.

*Needs:* `SSet.Edge.IsCartesian` (HTT, Def. 2.4.1.1), `SSet.opFunctor`; §1.1.1 (HTT, Def. 2.4.2.1, the
coCartesian half).

**1.5.2.** Prove that for an inner fibration `p : Y ⟶ S`, an edge e is p-coCartesian exactly when, for each n ≥ 1, every map
`(Δ[n] × {0}) ∪ (∂Δ[n] × Δ[1]) ⟶ Y` sending `{0} × Δ[1]` to e, over a map `Δ[n] × Δ[1] ⟶ S`, extends over
`Δ[n] × Δ[1]` (HTT, Prop. 2.4.1.8, p. 136). The route is the filtration of `Δ[n] × Δ[1]` by simplices from Part InfinityCategoryFoundations §3.2 (HTT, Prop. 2.1.2.6), where the only outer horn met is filled by the coCartesian edge; for the
converse, the retract argument of the same proposition and Part InfinityCategoryFoundations §3.2.

*Needs:* §1.2.1; §1.3.1; §1.5.1 (the coslice form); Part InfinityCategoryFoundations §3.2.1 (HTT, Prop. 2.1.2.6).

### 1.6 Locally Cartesian edges

**1.6.1.** Define, for an inner fibration `p : X ⟶ S`, an edge e of X to be locally p-Cartesian when it is Cartesian for the projection
`X ×_S Δ[1] ⟶ Δ[1]`, where `Δ[1] ⟶ S` is `p e` (HTT, Def. 2.4.1.11, p. 138).

- A p-Cartesian edge is locally p-Cartesian (base change, `SSet.Edge.IsCartesian.of_isPullback`).
- For a pullback of p along `S' ⟶ S`, an edge of the pullback is locally Cartesian exactly when its image in X is
  (HTT, Rem. 2.4.1.12, p. 138): both are the Cartesian condition over the same Δ[1].

**Checks.**
- For the nerve `N(P) ⟶ N(B)` of a functor P of categories, the locally Cartesian edges are Mathlib's
  `Functor.IsCartesian` morphisms (cartesian among lifts of the same arrow), while the Cartesian edges are the
  `Functor.IsStronglyCartesian` ones. Defining "locally" by the strong condition would erase the distinction.
- Over S = Δ[0], `X ×_S Δ[1] = X × Δ[1]`, and for an ∞-category X the edge (e, ι) is Cartesian exactly when e is an
  equivalence (§1.3). So for X = Δ[1] the edge `0 ⟶ 1` is not locally Cartesian over the point.
- Let P be the poset with `x₀ < y₀ < x₂` and `x₀ < x₁ < x₂`, mapped to [2] by x₀, y₀ ↦ 0, x₁ ↦ 1, x₂ ↦ 2. For
  `nerve(P ⟶ [2])` the edge `x₁ ⟶ x₂` over `1 ⟶ 2` is locally Cartesian (x₁ is the only object over 1) but not
  Cartesian: `y₀ ⟶ x₂` lies over `0 ⟶ 2` and does not factor through x₁. A definition
  identifying locally Cartesian with Cartesian edges fails here.

*Needs:* `SSet.Edge.IsCartesian` (HTT, Def. 2.4.1.1), `SSet.Edge.IsCartesian.of_isPullback`.

### 1.7 Mapping-space criteria for Cartesian edges

**1.7.1.** Prove that for a simplicial functor `F : C ⟶ D` between fibrant simplicial categories inducing Kan fibrations on
mapping spaces, `N(F)` is an inner fibration of ∞-categories, and a morphism `f : C' ⟶ C''` of C is `N(F)`-Cartesian
exactly when, for every object C, the square formed by composition with f on `Map_C(C, −)` and on `Map_D(F C, F −)` is
homotopy Cartesian (HTT, Prop. 2.4.1.10, p. 137). The route compares right mapping spaces of `N(C)` with those of C.

*Needs:* `SSet.Edge.IsCartesian`; Part InfinityCategoryFoundations §8.1.2 (HTT, Thm. 2.2.0.1), §7.3.3 (HTT, Prop. 2.2.2.13), §4.2.1
(HTT, Prop. 2.1.2.1), §5.3.2 (HTT, Lemma 2.1.3.4) and §2.6.1 (HTT, Rem. 1.1.5.11).

**1.7.2.** Prove the following about mapping spaces along an inner fibration `p : C ⟶ D` of ∞-categories, with X, Y objects of C.
- The map of right mapping spaces `Hom^R_C(X, Y) ⟶ Hom^R_D(p X, p Y)` is a Kan fibration (HTT, Lemma 2.4.4.1, p. 148):
  it is a right fibration between Kan complexes, a fiber of the right fibration `C_{/Y} ⟶ C ×_D D_{/p Y}`.
- For `ē : p X ⟶ p Y` with a locally p-Cartesian lift `e : X' ⟶ Y`, the fiber over ē is homotopy equivalent to
  `Map_{C_{p X}}(X, X')`, giving a fiber sequence `Map_{C_{p X}}(X, X') ⟶ Map_C(X, Y) ⟶ Map_D(p X, p Y)` (HTT,
  Prop. 2.4.4.2, p. 149): composition with e identifies the fiber with mapping spaces in the pullback over Δ[1], where
  e is Cartesian.
- A morphism `f : Y ⟶ Z` of C is p-Cartesian exactly when, for every object X, the map
  `C_{/f} ×_C {X} ⟶ (C_{/Z} ×_{D_{/p Z}} D_{/p f}) ×_C {X}` is a homotopy equivalence of Kan complexes; equivalently,
  composition with f gives a homotopy Cartesian square of mapping spaces (HTT, Prop. 2.4.4.3, p. 149). The comparison
  is a right fibration with these fiber maps.

*Needs:* §1.6.1; Part InfinityCategoryFoundations §4.2.1 (HTT, Prop. 2.1.2.1), §4.3.2 (HTT, Prop. 2.1.2.5), §5.2.2 (HTT, Prop. 1.2.2.3),
§5.3.1 (HTT, Lemma 2.1.3.3), §5.3.2 (HTT, Lemma 2.1.3.4) and §8.1.1 (HTT, Prop. 2.2.4.1); Part InfinityCategoryFoundations §2.1.7 (HTT, §1.2.2, right mapping
spaces); Mathlib `SSet.anodyneExtensions`, `SSet.rlp_monomorphisms` (HTT, Examples 2.0.0.1, 2.0.0.2);
ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, homotopy pullbacks).

### Examples

- Over Δ[0], the Cartesian and the coCartesian edges of an ∞-category are both its equivalences (§1.3, §1.5).
- For ∞-categories C and D and an equivalence f of C, every edge `(f, g)` of `C × D` is Cartesian for the projection
  `C × D ⟶ D`: it is the base change of the Cartesian edge f of `C ⟶ Δ[0]` (§1.3; Tau Ceti
  `SSet.Edge.IsCartesian.of_isPullback`).

### Dependencies

Tau Ceti's Cartesian edges; §1.1 (coCartesian edges); Part InfinityCategoryFoundations §1.2 (final objects), §2.1 (mapping
objects), §2.3 and §2.6 (equivalences, the two homotopy categories), §3.2 (left anodyne generators), §4.1–4.3 (joins and
slices), §5.1–5.3 and §5.5 (Kan complexes, mapping spaces, right fibrations, final objects), §7.3 and §8.1–8.2 (the
mapping-space comparison, final objects through the homotopy category); ModelCategoryTheory, Part ModelCategories
§3.5.

## Layer 2: Cartesian and locally Cartesian fibrations, and fiberwise equivalences

### 2.1 Nerves of Grothendieck fibrations

**2.1.1.** Prove that for a functor P of ordinary categories, `nerve P` is a Cartesian fibration exactly when P is a Grothendieck
fibration, Mathlib `Functor.IsFibered` (HTT, Rem. 2.4.2.2, p. 139; `Suggested.lean` declaration
`cartesianFibration_nerveMap_iff`). The route is §1.2's horn criterion: in a nerve,
fillers for `Λ[n, n]` exist and are unique for n ≥ 4. For n = 3 they exist because the last edge is strongly
Cartesian, which makes the missing face commute. The case n = 2 is strong Cartesianness.

*Needs:* §1.2.1; `SSet.CartesianFibration`, `CategoryTheory.Functor.IsFibered`,
`CategoryTheory.nerve`.

### 2.2 Right fibrations as Cartesian fibrations

**2.2.1.** Prove that for an inner fibration p the following are equivalent: p is a Cartesian fibration all of whose edges are
p-Cartesian; p is a right fibration; p is a Cartesian fibration whose fibers are Kan complexes (HTT, Prop. 2.4.2.4, p.
140; `Suggested.lean` declaration `rightFibration_iff_cartesianFibration` for the first two). The route: all edges Cartesian is lifting
against `Λ[n, n]`, n ≥ 2 (§1.2), Cartesian lifts add n = 1, and §1.4 gives the third condition.

*Needs:* §1.2.1; §1.4.1; Part InfinityCategoryFoundations §5.1.1 (HTT, Prop. 1.2.5.1); Tau Ceti
`SSet.RightFibration` (HTT, Def. 2.0.0.3) and `SSet.CartesianFibration` (HTT, Def. 2.4.2.1).

**2.2.2.** Prove that for a Cartesian fibration `p : X ⟶ S`, the simplicial subset `X' ⊆ X` of simplices all of whose edges are
p-Cartesian gives a right fibration `p|X'` (HTT, Cor. 2.4.2.5, p. 140), by §2.2.1, with §1.2 and §1.4
after base change to simplices.

*Needs:* §2.2.1 (HTT, Prop. 2.4.2.4); §1.2.1; §1.4.1; `SSet.Edge.IsCartesian.of_isPullback`.

### 2.3 Locally Cartesian fibrations and criteria for Cartesianness

**2.3.1.** Define a locally Cartesian fibration as an inner fibration `p : X ⟶ S` such that, for every edge `Δ[1] ⟶ S`, the
pullback `X ×_S Δ[1] ⟶ Δ[1]` is a Cartesian fibration (HTT, Def. 2.4.2.6, p. 141).

- Equivalently, p is an inner fibration and every edge `s ⟶ p x` of S lifts to a locally p-Cartesian edge ending at x.
- Cartesian fibrations are locally Cartesian; locally Cartesian fibrations are stable under base change (§1.6).
- A locally Cartesian fibration assigns to each edge `s ⟶ s'` of S a functor `X_{s'} ⟶ X_s`, defined up to
  equivalence; each 2-simplex of S gives a natural transformation from the composite of two transports to the third,
  and p is Cartesian exactly when these transformations are equivalences (HTT, Rem. 2.4.2.9, p. 142).

**Checks.**
- Every inner fibration over Δ[0] is locally Cartesian: the pullback along `Δ[1] ⟶ Δ[0]` is the projection
  `X × Δ[1] ⟶ Δ[1]`, a Cartesian fibration with lifts `(𝟙 x, ι)`. A definition demanding nondegenerate lifts in X
  would exclude `X ⟶ Δ[0]`.
- `{1} ⊆ Δ[1]` is an inner fibration (a nerve of a functor) and not locally Cartesian: the edge `0 ⟶ 1` has no lift
  ending at 1. A definition asking only for lifts of degenerate edges, or only for ∞-categorical fibers, would accept
  it.
- Let P be the poset with `x₀ < y₀ < x₂` and `x₀ < x₁ < x₂`, mapped to [2] by x₀, y₀ ↦ 0, x₁ ↦ 1, x₂ ↦ 2. Then
  `nerve(P ⟶ [2])` is a locally Cartesian fibration (the local lifts ending at x₂ are `x₁ ⟶ x₂` over `1 ⟶ 2` and
  `y₀ ⟶ x₂` over `0 ⟶ 2`, and `x₀ ⟶ x₁` over `0 ⟶ 1`), but it is not Cartesian: the composite `x₀ ⟶ x₂` of local
  lifts is not locally Cartesian, since `y₀ ⟶ x₂` does not factor through x₀. The functor is Mathlib
  `Functor.IsPreFibered` but not `Functor.IsFibered`; over Δ[1] the two notions agree, so Δ[2] is the smallest
  separating base.

*Needs:* §1.6.1; `SSet.CartesianFibration`, `SSet.InnerFibration`.

**2.3.2.** Prove three criteria for Cartesianness over a locally Cartesian fibration p.
- **Edges** (HTT, Lemma 2.4.2.7, p. 141; `Suggested.lean` declaration
  `Edge.isCartesian_iff_isLocallyCartesian_iff`, for the first two conditions). For an edge `f : x' ⟶ x` of X the following are equivalent: f is
  p-Cartesian; for every 2-simplex with edges `g : x'' ⟶ x'`, f and `h : x'' ⟶ x`, g is locally p-Cartesian exactly
  when h is; in every such 2-simplex, h is locally p-Cartesian when g is. The route reduces to S = Δ[2] by pullback,
  then compares slices as in §2.3.
- **Composites** (HTT, Prop. 2.4.2.8, p. 142; `Suggested.lean` declaration
  `tfae_cartesianFibration_of_locallyCartesianFibration`). The following are equivalent: p is Cartesian; in every 2-simplex
  `x ⟶ x' ⟶ z` whose two short edges are locally Cartesian, the long edge is locally Cartesian; every locally Cartesian
  edge is Cartesian. The route is the edge criterion with §1.4's uniqueness of lifts.
- **Low-dimensional bases** (HTT, Cor. 2.4.2.10, p. 143; `Suggested.lean` declaration `cartesianFibration_iff_pullback_stdSimplex`). An inner
  fibration p is a Cartesian fibration exactly when every pullback `X ×_S Δ[n] ⟶ Δ[n]` with n ≤ 2 is one. Necessity is
  base change; sufficiency is the composite criterion, since local Cartesianness is tested over Δ[1] and the composite
  condition over Δ[2] (§1.6).

*Needs:* §1.4.1; §1.6.1; `SSet.Edge.IsCartesian.of_isPullback`, `SSet.CartesianFibration.of_isPullback`; Part
InfinityCategoryFoundations §4.2.1 (HTT, Prop. 2.1.2.1), §4.3.2 (HTT, Prop. 2.1.2.5) and §5.3.2 (HTT, Lemma 2.1.3.4); Mathlib
`SSet.rlp_monomorphisms` (HTT, Example 2.0.0.2).

### 2.4 Slices of coCartesian fibrations

**2.4.1.** Prove that for a coCartesian fibration `p : C ⟶ D` and `q : K ⟶ C`, the map `p' : C_{/q} ⟶ D_{/p q}` is a
coCartesian fibration, whose coCartesian edges are those with p-coCartesian image in C (HTT, Prop. 2.4.3.2, p. 146).
The route writes lifting problems through joins, where horns of `Δ[n] ⋆ K` become horns of larger simplices, and uses
the dual horn criterion of §1.5.

*Needs:* §1.5.1; Part InfinityCategoryFoundations §4.2.1 (HTT, Prop. 2.1.2.1) and §4.1.1 (HTT, Lemma 2.1.2.3); §1.1.1 (HTT, Def. 2.4.2.1); Part InfinityCategoryFoundations §1.2.2 (HTT, Notation 1.2.8.4).

### 2.5 Fiberwise equivalence criteria

**2.5.1.** Prove that if `p : C ⟶ D` and `q : D ⟶ E` are maps of ∞-categories with q and `p ≫ q` locally Cartesian fibrations, p
carries locally `(p ≫ q)`-Cartesian edges to locally q-Cartesian edges, and each fiber map `C_Z ⟶ D_Z` is a
categorical equivalence, then p is a categorical equivalence (HTT, Cor. 2.4.4.4, p. 150; `Suggested.lean` declaration
`isCategoricalEquivalence_of_fiber_of_locallyCartesianFibration`). The route: fiber by fiber,
with the fiber sequences of §1.7.

*Needs:* §2.3.1; §1.7.2; Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14; Def. 1.2.10.1,
full faithfulness); Part InfinityCategoryFoundations §2.4.1 (HTT, Def. 1.2.10.1, essential surjectivity), §2.6.4 (HTT, §1.2.10, after
Rem. 1.2.10.2, the characterization of equivalences) and §8.1.1 (HTT, Prop. 2.2.4.1).

**2.5.2.** Prove that for a Cartesian fibration `p : C ⟶ D` of ∞-categories and a categorical equivalence `q : D' ⟶ D` of
∞-categories, the projection `D' ×_D C ⟶ C` is a categorical equivalence (HTT, Cor. 2.4.4.5, p. 150). The route: the
fiber sequences of §1.7 give full faithfulness; for essential surjectivity, an equivalence `q d' ≃ p c` lifts to a
Cartesian edge, which is an equivalence by §1.3.

*Needs:* §1.3.1; §1.7.2; Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14; Def. 1.2.10.1,
full faithfulness); Part InfinityCategoryFoundations §2.4.1 (HTT, Def. 1.2.10.1, essential surjectivity), §2.6.4 (HTT, §1.2.10, after
Rem. 1.2.10.2, the characterization of equivalences).

**2.5.3.** Prove that a Cartesian fibration of ∞-categories is a categorical equivalence exactly when it is a trivial fibration
(HTT, Cor. 2.4.4.6, p. 150; `Suggested.lean` declaration `isCategoricalEquivalence_iff_rlp_monomorphisms`). The route: for a categorical
equivalence the fibers in §1.7 are contractible, so all edges are Cartesian and p is a right fibration with
contractible fibers (§2.2). The converse holds because trivial fibrations are categorical equivalences (Part InfinityCategoryFoundations
§9.5).

*Needs:* Part InfinityCategoryFoundations §9.5.1; §2.2.1; §1.7.2; Part InfinityCategoryFoundations §5.1.1 (HTT, Prop. 1.2.5.1) and §5.3.2 (HTT, Lemma 2.1.3.4); Mathlib `SSet.rlp_monomorphisms` (HTT, Example 2.0.0.2); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14; Def. 1.2.10.1, full faithfulness).

### 2.6 Locally Cartesian fibrations over a locally Cartesian base

**2.6.1.** Prove that for locally Cartesian fibrations `p : X ⟶ S`, `q : Y ⟶ S` and an inner fibration `r : X ⟶ Y` over S
preserving locally Cartesian edges and inducing locally Cartesian fibrations `r_s` on fibers, r is a locally Cartesian
fibration; and an edge `e : x ⟶ x''` of X is locally r-Cartesian exactly when it is the long edge of a 2-simplex `x ⟶
x' ⟶ x''` over the degenerate 2-simplex on `p e`, whose edge `x' ⟶ x''` is locally p-Cartesian and whose edge `x ⟶ x'`
is locally `r_{p x}`-Cartesian (HTT, Prop. 2.4.2.11, p. 143; `Suggested.lean` declaration
`locallyCartesianFibration_of_fiber`, for the first assertion). The route reduces to S = Δ[1] and composes lifts, with
§1.4 for uniqueness.

*Needs:* §2.3.1 (the definition), §2.3.2 (the edge criterion); §1.2.1; §1.4.1; §2.5.

### 2.7 Initial objects and initial sections

**2.7.1.** Prove that if every fiber of a Cartesian fibration `p : X ⟶ S` has an initial object, then the full simplicial subset
`X' ⊆ X` on the vertices initial in their fiber gives a trivial fibration `p|X'`, and a section of p is an initial
object of `Map_S(S, X)` exactly when it factors through X' (HTT, Prop. 2.4.4.9, p. 151). The route uses two lemmas:
for a Cartesian fibration of ∞-categories, an object initial in its fiber with initial image is initial (HTT, Lemma 2.4.4.7, p. 151), by the fiber sequence of §1.7; and for n > 0 every square from `∂Δ[n] ⟶ X` over `Δ[n] ⟶ S` sending
0 to a fiberwise initial object has a filler, by base change to Δ[n] (HTT, Lemma 2.4.4.8, p. 151). This gives lifting
against `∂Δ[n] ⊆ Δ[n]` for n > 0; for sections, the same lemma over `S × Δ[n]` applies.

*Needs:*
- §1.7.2; Part InfinityCategoryFoundations §9.2.2; `SSet.CartesianFibration.of_isPullback`.
- Part InfinityCategoryFoundations §8.2.1 (HTT, Cor. 1.2.12.5) and §5.5.2 (HTT, Prop. 1.2.12.4), §5.5.3 (HTT, Prop. 1.2.12.9); Mathlib `SSet.rlp_monomorphisms` (HTT, Example 2.0.0.2).

### Examples

- For ordinary categories C and D with C non-empty, the projection `C × D ⟶ C` is a Grothendieck fibration whose
  Cartesian morphisms are the pairs `(f, g)` with g an isomorphism, so by §2.1 its nerve is a Cartesian fibration. By
  §2.2 the nerve is a right fibration exactly when D is a groupoid, that is when its fiber `nerve D` is a Kan complex.

### Dependencies

Layer 1; Part InfinityCategoryFoundations §1.2, §2.4, §2.6, §4.1–4.2, §5.1, §5.3, §5.5, §8.1–8.2, §9.2 and §9.5 (notation for
slices, essential surjectivity, joins and slices, right fibrations, final and initial objects, the mapping-space
comparison, the Joyal structure); Part InfinityCategoryFoundations §2.1.

## Layer 3: Joyal-fibrant objects, categorical fibrations and categorical equivalences

### 3.1 Invariance of slices under categorical equivalence

**3.1.1.** Prove that for a fully faithful map `p : C ⟶ D` of ∞-categories, a diagram `j : K ⟶ C` and an object x of C, the map
of Kan complexes `C_{j/} ×_C {x} ⟶ D_{p j/} ×_D {p x}` is a homotopy equivalence (HTT, Lemma 2.4.5.1, p. 152, coslice
form). The slice form is step 1 of Joyal's theorem in Part InfinityCategoryFoundations §9.5; this is its opposite, applied to
`pᵒᵖ : Cᵒᵖ ⟶ Dᵒᵖ` and `jᵒᵖ`, since `(C_{j/})ᵒᵖ = (Cᵒᵖ)_{/jᵒᵖ}` and full faithfulness is invariant under `(−)ᵒᵖ`
(the opposite comparison of Part InfinityCategoryFoundations §2.1).

*Needs:* Part InfinityCategoryFoundations §9.5.2 (HTT, Lemma 2.4.5.1, slice form, step 1 of Joyal's theorem) and §2.1.8 (HTT,
Def. 1.2.10.1, full faithfulness, and HTT, §5.1.3, the opposite comparison); Mathlib `SSet.opFunctor`.

**3.1.2.** Prove that if `q : C ⟶ C'` is a categorical equivalence of ∞-categories and `p : K ⟶ C` any diagram, then
`C_{/p} ⟶ C'_{/q p}` and `C_{p/} ⟶ C'_{q p/}` are categorical equivalences (HTT, Prop. 1.2.9.3, second assertion, p. 61, for
slices, proved in §2.4.5; the coslice form is its opposite). The route: the coslice map is a fiberwise homotopy
equivalence of left fibrations (Lemma 2.4.5.1), hence an equivalence by §2.5 after base change along q.

*Needs:* §3.1.1 (HTT, Lemma 2.4.5.1); §2.5.1, §2.5.2; Part InfinityCategoryFoundations §2.4.1 (HTT, Def. 1.2.10.1).

### 3.2 Lifting along categorical equivalences

The lifting lemmas along a categorical equivalence of ∞-categories, for special outer horns and for monomorphisms
with a natural equivalence on the source (HTT, Lemmas 2.4.6.2 and 2.4.6.3, p. 154), and the retraction of an
∞-category C off a monic categorical equivalence `C ⊆ D` (HTT, Lemma 2.4.6.4, p. 155) are steps 2–4 of Joyal's
theorem in Part InfinityCategoryFoundations §9.5, and this Part cites them there. No other section of this Part uses them.

*Needs:* Part InfinityCategoryFoundations §9.5.2 (HTT, Lemmas 2.4.6.2–2.4.6.4, steps 2–4 of Joyal's theorem).

### 3.3 Joyal-fibrant objects and categorical fibrations over an ∞-category

Joyal's theorem, that the fibrant objects of the Joyal structure are exactly the ∞-categories, is Part
InfinityCategoryFoundations §9.5 (HTT, Thm. 2.4.6.1, p. 154), and Joyal's description of the categorical fibrations over an
∞-category, as the inner fibrations along which equivalences lift with prescribed source, is Part InfinityCategoryFoundations
§10.2 (HTT, Cor. 2.4.6.5, p. 155). This Part cites both there. For Cartesian fibrations the lifts come with
prescribed target, so this section states the opposite form.

**3.3.1.** Prove that for `p : C ⟶ D` with D an ∞-category, p is a categorical fibration exactly when p is an inner fibration
and, for every equivalence `f : d ⟶ d'` of D and object c' with `p c' = d'`, there is an equivalence `f̃ : c ⟶ c'`
with `p f̃ = f` (HTT, Cor. 2.4.6.5, p. 155, applied to `pᵒᵖ`; `Suggested.lean` declaration
`categoricalFibration_iff_innerFibration_and_exists_lift_target`). The route: `Dᵒᵖ` is an ∞-category; `(−)ᵒᵖ`
preserves inner fibrations, equivalences, monomorphisms and categorical equivalences (Conventions, duality), hence
categorical fibrations; and an equivalence of D with prescribed target is an equivalence of `Dᵒᵖ` with prescribed
source. So the condition for p is the condition of Part InfinityCategoryFoundations §10.2 for `pᵒᵖ`.

**Checks.**
- `{1} ⊆ Δ[1]` is a categorical fibration (the only equivalences of Δ[1] are degenerate), and satisfies the
  condition here; `{0} ⟶ J` satisfies neither form, the equivalence `1 ⟶ 0` of J having no lift ending at 0.
- The condition concerns equivalences only: asking every edge with prescribed target to lift would reject the
  categorical fibration `{1} ⊆ Δ[1]`, since `0 ⟶ 1` has no lift ending at 1.

*Needs:* Part InfinityCategoryFoundations §10.2.4 (HTT, Cor. 2.4.6.5), §9.4.1, §2.1.2 (HTT, §5.1.3, the opposite comparison, under which categorical
equivalences are stable) and §2.3.1 (equivalences); Mathlib `SSet.opFunctor`, `SSet.InnerFibration`.

### 3.4 Functor ∞-categories and the forms of categorical equivalence

The two comparisons of the forms of categorical equivalence are Part InfinityCategoryFoundations §9.7: for an ∞-category C and
a simplicial set K, two maps `K ⟶ C` are equivalent objects of `Fun(K, C)` exactly when they are left homotopic in
the Joyal structure (HTT, Prop. 2.2.5.7, p. 111), and a map is a categorical equivalence exactly when restriction
`h Fun(B, C) ⟶ h Fun(A, C)` is an equivalence for every ∞-category C (HTT, Prop. 2.2.5.8, p. 112). This section
uses them.

*Needs:* Part InfinityCategoryFoundations §9.7.1 (HTT, Prop. 2.2.5.7), §9.7.2 (HTT, Prop. 2.2.5.8).

**3.4.1.** Prove that `Fun(K, C)` is invariant under categorical equivalence in each variable: if `C ⟶ D` is a categorical
equivalence of ∞-categories, so is `Fun(K, C) ⟶ Fun(K, D)` for every simplicial set K (HTT, Prop. 1.2.7.3 (2), p. 57;
`Suggested.lean` declaration `isCategoricalEquivalence_ihom_map`); and if C is an ∞-category and `K ⟶ K'` a categorical equivalence, so is
`Fun(K', C) ⟶ Fun(K, C)` (HTT, Prop. 1.2.7.3 (3), p. 57; `Suggested.lean` declaration `isCategoricalEquivalence_pre_app`). The route works
in the homotopy category of the Joyal structure: the class of `X × Y` is a product of the classes of X and Y (Part InfinityCategoryFoundations §9.3,
after fibrant replacement), and for an ∞-category C the maps from the class of X to that of C are the equivalence
classes of objects of `Fun(X, C)` (HTT, Prop. 2.2.5.7, Part InfinityCategoryFoundations §9.7, with Joyal's theorem, Part InfinityCategoryFoundations §9.5). So the class of `Fun(K, C)` is the exponential of
the classes of C and K, which gives both assertions.

*Needs:* Part InfinityCategoryFoundations §9.3.1; Part InfinityCategoryFoundations §9.5.2 (HTT, Thm. 2.4.6.1); Part InfinityCategoryFoundations §9.7.1 (HTT, Prop. 2.2.5.7); Mathlib instance `Quasicategory ((ihom K).obj C)`;
Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2) and §2.1.6 (HTT, Def. 1.1.5.14); ModelCategoryTheory, Part
ModelCategories §3.1.2 (HTT, §A.2.2, p. 830, the homotopy category of bifibrant objects).

**3.4.2.** Prove that for ∞-categories C and D, a map `f : C ⟶ D` is a categorical equivalence exactly when it is an equivalence
in Mathlib's bicategory of quasicategories, that is Tau Ceti's `SSet.QCat.IsCategoricalEquivalence`: some `g : D ⟶ C`
has `g ∘ f` and `f ∘ g` isomorphic to the identities in `h Fun(C, C)` and `h Fun(D, D)` (not stated in the sources; from HTT Prop. 2.2.5.7 via
Part InfinityCategoryFoundations §9.7, and HTT §A.2.2, p. 830; `Suggested.lean` declaration `isCategoricalEquivalence_iff_qcat`). The route: C and D are bifibrant (Part InfinityCategoryFoundations §9.5), so f is a
weak equivalence exactly when it has a homotopy inverse, and left homotopy is isomorphism in `h Fun` by Prop. 2.2.5.7
(Part InfinityCategoryFoundations §9.7).

*Needs:* Part InfinityCategoryFoundations §9.5.2 (HTT, Thm. 2.4.6.1); Part InfinityCategoryFoundations §9.7.1 (HTT, Prop. 2.2.5.7); `SSet.QCat.IsCategoricalEquivalence`;
ModelCategoryTheory, Part ModelCategories §3.1.2 (HTT, §A.2.2, p. 830).

### Examples

- The nerve of a category is Joyal-fibrant; `Λ[2, 1]` is not, and its fibrant replacement is the inclusion into Δ[2].

### Dependencies

Layers 1–2; Part InfinityCategoryFoundations §1.2, §2.1, §2.3–2.4, §5.1, §9.3–9.5, §9.7 and §10.2 (functor ∞-categories and the
core, opposites, equivalences, the Joyal structure with Joyal's theorem on its fibrant objects, the forms of
categorical equivalence, categorical fibrations over an ∞-category); ModelCategoryTheory, Part ModelCategories §3.1.

## Layer 4: Correspondences, bifibrations and arrow ∞-categories

### 4.1 Correspondences

**4.1.1.** Define a correspondence from an ∞-category C to an ∞-category C' as an ∞-category M with a map `M ⟶ Δ[1]` and
isomorphisms of its fiber over 0 with C and its fiber over 1 with C' (HTT, Def. 2.3.1.3, p. 115).

- The map `M ⟶ Δ[1]` is automatically an inner fibration, since `Δ[1]` is the nerve of a category and M an ∞-category.
- The opposite `Mᵒᵖ ⟶ Δ[1]ᵒᵖ ≅ Δ[1]` is a correspondence from C'ᵒᵖ to Cᵒᵖ: the isomorphism exchanges the two
  vertices, so the fiber of Mᵒᵖ over 0 is C'ᵒᵖ.

**Checks.**
- `C ⊔ C' ⟶ Δ[1]`, sending C to 0 and C' to 1, is a correspondence with no edges between the fibers; it is neither a
  Cartesian fibration (when C' is nonempty) nor a coCartesian one (when C is nonempty), so a definition requiring a
  Cartesian or coCartesian fibration would exclude it.
- `Λ[2, 1] ⟶ Δ[1]` sending 0 and 1 to 0 and 2 to 1 has ∞-categories as fibers (Δ[1] over 0, Δ[0] over 1) but is not a
  correspondence: `Λ[2, 1]` is not an ∞-category. A definition asking only for ∞-categorical fibers would accept it.
- The join `C ⋆ C' ⟶ Δ[0] ⋆ Δ[0] = Δ[1]` is a correspondence in which every pair (x, y) has a contractible space of
  edges, while in the identity correspondence `C × Δ[1] ⟶ Δ[1]` the edges from (x, 0) to (y, 1) are the edges
  `x ⟶ y` of C: for C = C' = Δ[1] these are Δ[3] and the square `Δ[1] × Δ[1]`, so correspondences with the same
  fibers need not be isomorphic.

*Needs:* `SSet.Quasicategory`.

### 4.2 Bifibrations

**4.2.1.** Define a map `p : X ⟶ S × T` to be a bifibration when it is an inner fibration and, for n ≥ 1, every square from
`Λ[n, 0] ⟶ X` over `f : Δ[n] ⟶ S × T` has a filler when the T-component of f sends `Δ^{0,1}` to a degenerate edge, and
every square from `Λ[n, n] ⟶ X` over f has a filler when the S-component of f sends `Δ^{n−1,n}` to a degenerate edge
(HTT, Def. 2.4.7.2, p. 157). A bifibration is covariant in S and contravariant in T.

- p is a bifibration exactly when `pᵒᵖ : Xᵒᵖ ⟶ Tᵒᵖ × Sᵒᵖ` is one.
- Over a vertex t of T, a bifibration restricts to a left fibration over S; over a vertex s, to a right fibration over
  T.

**Checks.**
- With T = Δ[0], a bifibration over S × Δ[0] is exactly a left fibration over S; with S = Δ[0], a right fibration over
  T. A symmetric definition would get one of these wrong.
- The vertex inclusion `{1} ⊆ Δ[1]` is a left fibration and not a right fibration (the edge `0 ⟶ 1` has no lift
  ending at 1). So `{1} ⟶ Δ[1] × Δ[0]` is a bifibration while `{1} ⟶ Δ[0] × Δ[1]` is not: the two factors play
  different roles.
- The diagonal `J ⟶ J × J` is an inner fibration (a nerve of a functor) but not a bifibration: the edge
  `(0, 0) ⟶ (1, 0)` of J × J, whose T-component is degenerate, has no lift starting at 0, since every edge of J maps
  to
  a pair (e, e).

*Needs:* `SSet.InnerFibration` (HTT, Def. 2.0.0.3, inner case).

**4.2.2.** Prove that for a bifibration `p : X ⟶ S × T` with S an ∞-category, the composite `q : X ⟶ T` is a Cartesian
fibration, and an edge e of X is q-Cartesian exactly when the S-component of `p e` is an equivalence of S (HTT,
Lemma 2.4.7.5, p. 158; `Suggested.lean` declaration `cartesianFibration_comp_snd_of_isBifibration`). The route: edges lying over degenerate edges of S are q-Cartesian by the `Λ[n, n]` condition
and
§1.2; a general q-Cartesian edge is equivalent to one of these (§1.4), and left fibrations are conservative.

*Needs:* §4.2.1 (the definition); §1.2.1; §1.3.1; §1.4.1;
Part InfinityCategoryFoundations §3.1.1 (HTT, Prop. 2.1.1.5).

### 4.3 Equivalences of bifibrations

**4.3.1.** Prove that equivalences of bifibrations are detected on fibers: for maps `p : X ⟶ Y` and `q : Y ⟶ S × T` with q and
`p ≫ q` bifibrations, if p induces a homotopy equivalence of fibers over every vertex of S × T then p is a categorical
equivalence (HTT, Prop. 2.4.7.6, p. 158). The route reduces to simplices S, T as in Part InfinityCategoryFoundations §7.3 (HTT,
Prop. 2.2.2.7), then applies §2.5 (HTT, Cor. 2.4.4.4) twice: first to the maps of fibers over each vertex of T, which
are maps of left fibrations over S, then to p itself, with the Cartesian edges described by §4.2 (HTT, Lemma 2.4.7.5).

*Needs:* Part InfinityCategoryFoundations §9.5.1; §2.5.1; §4.2.1, §4.2.2; Part InfinityCategoryFoundations §7.3.2 (HTT, Prop. 2.2.2.7).

### 4.4 Arrow ∞-categories and comma fibrations

**4.4.1.** Prove that for an inner fibration `q : M ⟶ Δ[1]` with fibers C over 0 and D over 1, evaluation at the endpoints makes
the ∞-category of sections `Map_{Δ[1]}(Δ[1], M)` a bifibration over D × C, with D the covariant factor and C the
contravariant factor (HTT, Prop. 2.4.7.10, p. 160). HTT writes C × D; its proof puts the target factor first. The route: the lifting conditions are pushout-products of horns with `Δ[1]`,
inner anodyne or special outer horns. For the correspondence `C × Δ[1] ⟶ Δ[1]` of an ∞-category C this says that
`Fun(Δ[1], C) ⟶ C × C`, target first, is a bifibration (HTT, Cor. 2.4.7.11, p. 161; `Suggested.lean` declaration
`isBifibration_ihom_stdSimplex_one`). In particular, for vertices x over 0 and y over 1 of a
correspondence M (§4.1), the edges `x ⟶ y` of M are the vertices of the fiber of this bifibration over (y, x), a Kan
complex, being a left fibration over a point (§4.2; Part InfinityCategoryFoundations §5.1, HTT, Prop. 1.2.5.1); it is covariant in
y and contravariant in x.

*Needs:* §4.1.1; §4.2.1; `SSet.innerAnodyneExtensions_pushoutObjObjι`; Mathlib instance `Quasicategory ((ihom K).obj C)`;
Part InfinityCategoryFoundations §5.1.1 (HTT, Props. 1.2.4.3, 1.2.5.1) and §3.2.1 (HTT, Prop. 2.1.2.6).

**4.4.2.** Prove that for a functor `f : C ⟶ D` of ∞-categories, the projection
`p : Fun(Δ[1], D) ×_{Fun({1}, D)} C ⟶ Fun({0}, D)` is a Cartesian fibration, and a morphism is p-Cartesian exactly when its image in C is an equivalence (HTT, Cor.
2.4.7.12, p. 161; `Suggested.lean` declaration `cartesianFibration_commaTargetSource`). The route: the base change of the bifibration of Cor. 2.4.7.11 along `f × 𝟙 : C × D ⟶ D × D`
(target factor first) is a bifibration over C × D, and Lemma 2.4.7.5 applies with S = C.

**Checks** (the `Suggested.lean` constructions `evalVertex`, `commaTarget` and `commaTargetSource`).
- `evalVertex C 0` sends a vertex `x ⟶ y` of `Fun(Δ[1], C)` to its source x and `evalVertex C 1` to its target y; an
  evaluation indexed by the omitted face `δ j` would exchange them.
- For D = Δ[1] and f = 𝟙, `commaTarget f` has 3 vertices, the 3 edges of Δ[1], and `commaTargetSource f` sends
  `0 ⟶ 1` to 0. With the two evaluation legs exchanged it would send it to 1.
- For f the vertex `{1} ⊆ Δ[1]`, the vertices of `commaTarget f` are `0 ⟶ 1` and `1 ⟶ 1`; for f = `{0} ⊆ Δ[1]` there
  is only `0 ⟶ 0`. Arrows are constrained at their target, not their source.

*Needs:* §4.2.1, §4.2.2; §4.4.1 (HTT, Cor. 2.4.7.11).

### Examples

- For a functor `f : C ⟶ D` of ∞-categories, the Cartesian fibration `Fun(Δ[1], D) ×_{Fun({1}, D)} C ⟶ D` of §4.4 has
  fiber over d the comma ∞-category of arrows from d to the image of f. For C = Δ[0] and `f = d₀ : Δ[0] ⟶ D` it is
  `Fun(Δ[1], D) ×_D {d₀} ⟶ D`, equivalent to the right fibration `D_{/d₀} ⟶ D`, all of whose edges are Cartesian
  (§2.2).

### Dependencies

Layers 1–2; Part InfinityCategoryFoundations §2.5, §3.1, §3.2, §4.2, §5.1, §7.3 and §9.5 (rigidified simplices, left fibrations,
slices, outer horns, the Joyal structure);
Mathlib's inner anodyne pushout-products.

## Layer 5: The Cartesian model structure on marked simplicial sets

### 5.1 Marked simplicial sets and cofibrations

Marked simplicial sets (HTT, Def. 3.1.0.1, p. 164) are those of the Conventions, Tau Ceti `TauCeti.MarkedSSet`
with `X^♭` and `X^♯`; their Checks are in the supplier contract, and later Parts cite this section for them.

**5.1.1.** Define a morphism of marked simplicial sets to be a cofibration when its underlying map of simplicial sets is a
monomorphism (HTT, Def. 3.1.2.2, p. 170). The `Suggested.lean` declaration is
`markedCofibrations`, the inverse image of Mathlib's `MorphismProperty.monomorphisms` under
`TauCeti.MarkedSSet.forget`. These are the cofibrations of every model structure of this layer.

**Checks.**
- `Δ[1]^♭ ⟶ Δ[1]^♯` is a cofibration, although it is not an isomorphism and does not reflect markings. A
  definition by inclusions of marked simplicial subsets (marked edges pulled back from the target) would exclude
  it.
- `∂Δ[1]^♭ ⟶ Δ[1]^♭` is a cofibration, while `Δ[1]^♯ ⟶ Δ[0]` is not, although both preserve markings and the
  second carries every marked edge to a marked edge: its underlying map collapses the edge `0 ⟶ 1` and identifies the
  two vertices. A definition by a condition on markings alone cannot separate the two.
- The fold map `Δ[0] ⊔ Δ[0] ⟶ Δ[0]` is not a cofibration: it is surjective and preserves markings, but it identifies
  two vertices. A definition asking for injectivity only on nondegenerate edges, or on marked edges other than the
  degenerate ones, would accept it, since `Δ[0] ⊔ Δ[0]` has no such edges.

*Needs:* Tau Ceti `TauCeti.MarkedSSet`, `TauCeti.MarkedSSet.forget`; Mathlib `MorphismProperty.monomorphisms`.

### 5.2 Marked anodyne maps and their generators

The class of marked anodyne maps is Tau Ceti's `TauCeti.MarkedSSet.markedAnodyneExtensions`, the left lifting class of
the right lifting class of four generating families (HTT, Def. 3.1.1.1, p. 165): flat inner horns; `Λ[n, n] ⊆ Δ[n]`
marked at degenerate edges and the last edge; `Λ[2, 1]^♯ ⊔_{Λ[2, 1]^♭} Δ[2]^♭ ⟶ Δ[2]^♯`; and `K^♭ ⟶ K^♯` for Kan
complexes K.

**5.2.1.** Prove that this class is the weakly saturated class generated by the four families, and that the generators may be
changed in two ways without changing the class: the fourth family restricted to Kan complexes with countably many
simplices, so that the generators form a set (HTT, Rem. 3.1.1.3, p. 166); and the first family enlarged to `A^♭ ⟶ B^♭`
for every inner anodyne `A ⟶ B` (HTT, Rem. 3.1.1.4, p. 166). The route: every edge of a Kan complex K lies in a Kan
subcomplex with countably many simplices (fill horns countably often), so `K^♭ ⟶ K^♯` is a transfinite composite of
pushouts of the countable generators; the generators then form a set, the small object argument identifies the
lifting class with the weak saturation, and `(−)^♭` preserves the colimits that define weak saturation. A third generating set uses products with `Δ[1]^♯`: the maps
`(A^♭ × Δ[1]^♯) ∪ (B^♭ × {1}^♯) ⊆ B^♭ × Δ[1]^♯` for monomorphisms `A ⊆ B`, or only for `∂Δ[n] ⊆ Δ[n]`, generate one
weakly saturated class, which contains the second family and lies in the class generated by the first two (HTT,
Prop. 3.1.1.5, p. 166); the route is the filtration of `Δ[n] × Δ[1]` of Part InfinityCategoryFoundations §3.2 (HTT, Prop. 2.1.2.6),
with markings followed through.

*Needs:* `TauCeti.MarkedSSet.markedAnodyneExtensions`, `TauCeti.MarkedSSet.flat`, `SSet.innerAnodyneExtensions`; Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Part InfinityCategoryFoundations §3.2.1 (HTT, Prop. 2.1.2.6); ModelCategoryTheory, Part
ModelCategories §1.3.1 (HTT, Def. A.1.2.2) and §1.4.1 (HTT, Prop. A.1.2.5 (1)).

### 5.3 Cartesian fibrations as marked fibrant objects

**5.3.1.** Define, for a Cartesian fibration `p : X ⟶ S`, the marked simplicial set X^♮ as X with exactly the p-Cartesian edges
marked, with its map `X^♮ ⟶ S^♯` (HTT, Def. 3.1.1.8, p. 168). It depends on p, not only on X. Degenerate edges are
p-Cartesian (§1.3), so X^♮ is a marked simplicial set. The `Suggested.lean` declaration is `natural`, which marks the degenerate edges
explicitly, so that it is defined for every map p.

**Checks.**
- For a Kan complex K, `(K ⟶ Δ[0])^♮ = K^♯`: over a point the Cartesian edges are the equivalences (§1.3), and every
  edge of a Kan complex is one.
- For the ∞-category Δ[1] over Δ[0], `Δ[1]^♮ = Δ[1]^♭`: the edge `0 ⟶ 1` is not an equivalence. A definition marking
  all edges over degenerate ones would give `Δ[1]^♯`.
- For `𝟙 Δ[1]`, `Δ[1]^♮ = Δ[1]^♯`, while for `Δ[1] ⟶ Δ[0]` it is `Δ[1]^♭`: the same simplicial set with two markings,
  so the construction depends on p.

*Needs:* `TauCeti.MarkedSSet`, `TauCeti.MarkedSSet.toSharp`, `SSet.Edge.IsCartesian`, `SSet.CartesianFibration`; §2.2.1.

**5.3.2.** Prove that a map `p : X ⟶ S` of marked simplicial sets has the right lifting property against all marked anodyne maps
exactly when: p is an inner fibration of underlying simplicial sets; an edge of X is marked exactly when it is
p-Cartesian and its image is marked; and every marked edge `s ⟶ p y` of S lifts to a marked edge ending at y (HTT,
Prop. 3.1.1.6, p. 167). Over `S^♯` this says that `(Y, E) ⟶ S^♯` has the lifting property exactly when `Y ⟶ S` is a
Cartesian fibration and `(Y, E) = Y^♮` (HTT, Rem. 3.1.1.10, p. 169; `Suggested.lean` declaration
`cartesianFibration_iff_rlp_markedAnodyneExtensions`, with X^♮ for every map). The route checks the four families against §1.2
(inner fibration, marked edges Cartesian), §1.4 (Cartesian edges over marked edges marked) and §2.2. As a consequence,
`Λ[2, 2]^♯ ⊔_{Λ[2, 2]^♭} Δ[2]^♭ ⟶ Δ[2]^♯` is marked anodyne (HTT, Cor. 3.1.1.7, p. 168): by the small object argument
it suffices that maps with the lifting property satisfy it, which is cancellation of Cartesian edges (§1.4).

*Needs:* `TauCeti.MarkedSSet.markedAnodyneExtensions`, `SSet.CartesianFibration`; §1.2.1; §1.3.1; §1.4.1; Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.5); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)).

### 5.4 Pushout-products and slices along marked anodyne maps

**5.4.1.** Prove that the pushout-product of a marked anodyne map with a cofibration of marked simplicial sets (§5.1, HTT, Def. 3.1.2.2) is marked anodyne (HTT, Prop. 3.1.2.3,
p. 170). The route reduces both sides to generators by weak saturation and checks the cases, using §5.2's product
generators, the composition generator of §5.3 and Mathlib's pushout-product theorem for the inner case.

*Needs:* §5.2.1; §5.3.2; `SSet.innerAnodyneExtensions_pushoutObjObjι`; §5.1.1 (HTT, Defs. 3.1.0.1,
3.1.2.2); ModelCategoryTheory, Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2).

**5.4.2.** Prove that for an inner fibration `p : X ⟶ S`, a marked anodyne `f : A ⟶ B` and `q : B ⟶ X` carrying marked edges to
p-Cartesian edges, the map `X_{/q} ⟶ X_{/q f} ×_{S_{/p q f}} S_{/p q}` is a trivial fibration (HTT, Prop. 3.1.1.11,
p. 169). The route reduces to the generators by weak saturation; for those whose underlying map is left anodyne the
result is Part InfinityCategoryFoundations §4.3 (HTT, Prop. 2.1.2.5), and the others use the horn criterion of §1.2.

*Needs:* §5.2.1; §1.2.1; Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5); Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2); Mathlib
`SSet.rlp_monomorphisms` (HTT, Example 2.0.0.2); ModelCategoryTheory, Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2).

### 5.5 Marked mapping objects and exponentials

**5.5.1.** Define the category of marked simplicial sets over a simplicial set S as the over category of Set⁺_Δ at `S^♯`: its
objects are marked simplicial sets X with a map of underlying simplicial sets to S, every marking being allowed since
all edges of `S^♯` are marked, and its morphisms are the maps of marked simplicial sets over S (HTT, Notation 3.1.0.2,
p. 164). For S = Δ[0] it is Set⁺_Δ itself.

**5.5.2.** Define, for marked simplicial sets X and Y over a simplicial set S, the simplicial sets `Map^♭_S(X, Y)` and
`Map^♯_S(X, Y)` whose n-simplices are the maps `Δ[n]^♭ × X ⟶ Y`, respectively `Δ[n]^♯ × X ⟶ Y`, over S (HTT, §3.1.3,
introduction, p. 172). For S = Δ[0] these are Tau Ceti's `TauCeti.MarkedSSet.mapFlat` and
`TauCeti.MarkedSSet.mapSharp`.

- Marked simplicial sets are Cartesian closed: the internal hom `Y^X` has underlying simplicial set `Map^♭(X, Y)` and
  marks the edges given by maps `Δ[1]^♯ × X ⟶ Y`; `Map^♯(X, Y)` is the simplicial subset of simplices all of whose
  edges are marked.
- `Map^♯_S(X, Y) ⊆ Map^♭_S(X, Y)`, both are functorial in X and Y, and they are compatible with base change in S.
- For X over S and a Cartesian fibration `Y ⟶ S`, `Map^♭_S(X, Y^♮)` is an ∞-category and `Map^♯_S(X, Y^♮)` is its
  largest Kan complex (HTT, Rem. 3.1.3.1, p. 172): inner horn lifting comes from §5.4, and the marked edges of the
  internal hom are the natural transformations whose components are fiberwise Cartesian edges, that is equivalences
  (§1.3).

**Checks.**
- For X = Δ[0]^♭ over S = Δ[0], both mapping objects of `(Y, E)` have vertices Y₀; `Map^♭` is Y while `Map^♯` is the
  simplicial subset of simplices with every edge in E. For Y = Δ[1]^♭ this is Δ[1] against `∂Δ[1]`, which a definition
  ignoring markings cannot distinguish.
- For S = Δ[1], X = `{0}^♭` over the vertex 0 and Y = `Δ[1]^♯` over Δ[1] by the identity, `Map^♭_S(X, Y) = Δ[0]`,
  while
  the absolute `Map^♭(X, Y)` is Δ[1]: a definition ignoring the base would give Δ[1].
- For X = Δ[1]^♯ and Y = Δ[1]^♭ over Δ[0], `Map^♭(X, Y)` has the two constant maps as vertices only: a map must send
  the marked edge to a marked, hence degenerate, edge. A marking-blind mapping object would have three vertices.
- Over S = Δ[1], `Δ[1]^♯` and `Δ[1]^♭`, each with the identity to S, are two different objects, and the vertex
  inclusions `{0}^♭` and `{1}^♭` are not isomorphic over S although their marked simplicial sets are: markings are
  not inherited from S, and the map to S is part of the data. Taking objects over `S^♭` would exclude `Δ[1]^♯`.

*Needs:* `TauCeti.MarkedSSet.mapFlat`, `TauCeti.MarkedSSet.mapSharp`; §1.3.1; §5.3.1, §5.3.2 and §5.4.1, for the third bullet; Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.5, the core); §5.5.1 (HTT, Notation 3.1.0.2); Mathlib `CategoryTheory.Over`.

**5.5.3.** Prove that for a Cartesian fibration `p : X ⟶ S` and any simplicial set K, `X^K ⟶ S^K` is a Cartesian fibration whose
Cartesian edges are those whose image under evaluation at every vertex of K is p-Cartesian (HTT, Prop. 3.1.2.1,
p. 169). The route applies §5.4 to `(X^♮)^{K^♭} ⟶ (S^K)^♯` and concludes with §5.3.

*Needs:* §5.3.1, §5.3.2; §5.4.1; §5.5.2.

### 5.6 Cartesian equivalences

**5.6.1.** Define a Cartesian equivalence as a map `f : X ⟶ Y` of marked simplicial sets over S such that for every Cartesian
fibration `Z ⟶ S` precomposition `Map^♯_S(Y, Z^♮) ⟶ Map^♯_S(X, Z^♮)` is a homotopy equivalence of Kan complexes (HTT,
definition after Prop. 3.1.3.3, p. 173).

- Equivalently, every `Map^♭_S(Y, Z^♮) ⟶ Map^♭_S(X, Z^♮)` is a categorical equivalence (HTT, Prop. 3.1.3.3, p. 173).
  The route applies the `Map^♯` condition to `Z^K ×_{S^K} S` (§5.5) and uses that a functor of ∞-categories is a
  categorical equivalence exactly when every map of cores `Fun(K, C)^≃ ⟶ Fun(K, D)^≃` is a homotopy equivalence (HTT,
  Lemma 3.1.3.2, p. 172; with K = D this gives a one-sided inverse, and repeating gives a homotopy inverse).
- Cartesian equivalences satisfy two-out-of-three and are closed under retracts.
- Every map over S that is marked anodyne is a Cartesian equivalence (HTT, Rem. 3.1.3.4, p. 173): its
  pushout-products with `A^♭ ⊆ B^♭` are marked anodyne (§5.4), so restriction on `Map^♭_S(−, Z^♮)` is a trivial
  fibration by §5.3.
- Two maps `f, g : X ⟶ Y` over S are strongly homotopic when some contractible Kan complex maps to `Map^♭_S(X, Y)` with
  f and g in its image (HTT, after Rem. 3.1.3.4, p. 174); for Y = Z^♮ this means f and g are equivalent objects of
  `Map^♭_S(X, Z^♮)`.

**Checks.**
- Over S = Δ[0], `Δ[1]^♭ ⟶ Δ[1]^♯` is not a Cartesian equivalence: against Z = Δ[1] (so Z^♮ = Δ[1]^♭) the source has
  three maps to Δ[1] and the target two, and both mapping spaces are discrete. A definition testing only Kan complexes
  Z would accept it, since then `Z^♮ = Z^♯`.
- Over S = Δ[0], for a Kan complex K, `K^♭ ⟶ K^♯` is a Cartesian equivalence (it is marked anodyne), although it is
  not an isomorphism.
- Over S = Δ[1], the map `{1}^♯ ⟶ Δ[1]^♯` is a Cartesian equivalence (it is the n = 1 member of the second generating
  family, marked anodyne), while `{0}^♯ ⟶ Δ[1]^♯` is not: for the Cartesian fibration `Z = {0} ⊆ Δ[1]` the space of
  marked sections over Δ[1] is empty and the space of maps from `{0}^♯` is Δ[0]. This pins the variance: Cartesian
  sections are determined by their value at the target end.
- For X = Δ[0]^♭ and Y = Δ[1]^♭ over Δ[0], the two vertices are not strongly homotopic: `Map^♭(X, Y) = Δ[1]` receives
  no map from a contractible Kan complex hitting both ends, since such a map would need an edge `1 ⟶ 0`. A definition
  "joined by an edge of `Map^♭`" would call them homotopic.
- For Y = J^♮ over Δ[0] (J the free-living isomorphism), the two vertices are strongly homotopic, through the identity
  of the contractible Kan complex J: the relation sees invertibility, not mere existence of an edge.

*Needs:* §3.4.1, §3.4.2; §5.3.1, §5.3.2; §5.4.1; §5.5; Part InfinityCategoryFoundations §5.1.2 (HTT, Prop. 1.2.5.3); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.5, the core) and §2.1.6 (HTT,
Def. 1.1.5.14); Mathlib `SSet.rlp_monomorphisms` (HTT, Example 2.0.0.2);
ModelCategoryTheory, Part KanQuillen §1.3 (homotopy equivalences of Kan complexes).

**5.6.2.** Prove that for `p : X ⟶ Y` and `q : Y ⟶ S` with q and `p ≫ q` Cartesian fibrations and p carrying `(p ≫ q)`-Cartesian
edges to q-Cartesian edges, the following are equivalent: `X^♮ ⟶ Y^♮` is a Cartesian equivalence; p has a strong
homotopy inverse over S; each fiber map `X_s ⟶ Y_s` is a categorical equivalence (HTT, Prop. 3.1.3.5, p. 174, which
leaves the edge hypothesis implicit; it is what makes p a map `X^♮ ⟶ Y^♮`, as stated in HTT, Prop. 3.3.1.5). The
route: the first two are equivalent through `Map^♭`; the third implies the second by induction over the simplices of
S with §2.5, §5.2's product generators and homotopy extension.

*Needs:* Part InfinityCategoryFoundations §9.5.1; §2.5.1; §5.2.1; §5.3.1; §5.6.1;
ModelCategoryTheory, Part ModelCategories §3.2.1 (HTT, Prop. A.2.3.1).

**5.6.3.** Prove that for a cofibration `X ⟶ Y` over S and a Cartesian fibration `Z ⟶ S`, the restriction
`Map^♯_S(Y, Z^♮) ⟶ Map^♯_S(X, Z^♮)` is a Kan fibration; in particular each `Map^♯_S(X, Z^♮)` is a Kan complex (HTT,
Lemma 3.1.3.6, p. 175). The route: for a right anodyne `A ⊆ B`, `A^♯ ⊆ B^♯` is marked anodyne, so §5.4 makes the
restriction a right fibration between Kan complexes, hence a Kan fibration.

*Needs:* §5.3.1, §5.3.2; §5.4.1; §5.5.1, §5.5.2; Part InfinityCategoryFoundations §5.3.1 (HTT, Lemma 2.1.3.3); Mathlib `SSet.anodyneExtensions` (HTT, Example 2.0.0.1); §5.1.1 (HTT, Def. 3.1.2.2).

### 5.7 The Cartesian and coCartesian model structures over a base

**5.7.1.** Prove that for every simplicial set S, marked simplicial sets over S carry a left proper combinatorial model structure
whose cofibrations are the maps with monomorphic underlying map, whose weak equivalences are the Cartesian
equivalences
and whose fibrations are determined by lifting (HTT, Prop. 3.1.3.7, pp. 175–178). For S = Δ[0] this is the Cartesian
structure on Set⁺_Δ. The route is Smith's theorem. A functorial fibrant replacement `X ⟶ T(X) ⟶ S^♯`, commuting with
filtered colimits, with values `Z^♮`, detects Cartesian equivalences as fiberwise categorical equivalences; it comes from the small object argument on the first three
generating families and the maps `A^♭ ⊆ A` over vertices of S, where A is the quotient of Δ[3] whose maps to X are a
3-simplex σ and an edge e with `d₁σ = s₀e` and `d₂σ = s₁e`, marked at its degenerate edges and the image of
`Δ^{0,1}`. Then Cartesian equivalences are perfect, as the inverse image under T of fiberwise categorical equivalences; stable under pushout along cofibrations, by Lemma 3.1.3.6 and right
properness of the Kan–Quillen structure; and contain the maps with the right lifting property
against all cofibrations, which have a section fiberwise homotopic to the identity.

*Needs:*
- Part InfinityCategoryFoundations §9.5.1; §1.3.1; §1.4.1; §5.2.1; §5.3.1, §5.3.2; §5.4.1;
  §5.6.
- Part InfinityCategoryFoundations §5.1.2 (HTT, Prop. 1.2.5.3); §5.1.1 (HTT, Def. 3.1.2.2).
- ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)), §6.1.1 (HTT, Def. A.2.6.1), §5.5.1 (HTT, Def. A.2.6.12; Example A.2.6.13; Cor. A.2.6.14) and §6.3.2 (HTT, Prop. A.2.6.15); Part KanQuillen §3.2.1 and §3.4.1 (HTT, §A.2.7, the Kan–Quillen structure and its right properness).

**5.7.2.** Define the coCartesian model structure on marked simplicial sets over S: the cofibrations are the maps with
monomorphic underlying map, the weak equivalences are the coCartesian equivalences, that is the maps f with `fᵒᵖ` a
Cartesian equivalence over Sᵒᵖ, and the fibrations are determined by lifting (HTT, Rem. 3.1.3.9, p. 178). It is the
transport of the Cartesian structure over Sᵒᵖ along the isomorphism of categories `X ↦ Xᵒᵖ`.

- `X ↦ Xᵒᵖ` is an isomorphism of model categories from the coCartesian structure over S to the Cartesian structure
  over Sᵒᵖ, by definition.
- Over Δ[0] the Cartesian and coCartesian structures coincide, so `A ↦ Aᵒᵖ` is an automorphism of the model category
  Set⁺_Δ with the Cartesian structure (HTT, Rem. 3.1.4.6, pp. 180–181, the case S = Δ[0]). Route: the Cartesian
  fibrations `Z ⟶ Δ[0]` are the ∞-categories Z, and Z^♮ marks the equivalences (§1.3, §5.3), which are also the
  coCartesian edges; so `Map^♭(A, Z^♮) ≅ Map^♭(Aᵒᵖ, (Zᵒᵖ)^♮)ᵒᵖ` (§5.5), `Z ↦ Zᵒᵖ` is a bijection on ∞-categories,
  and `(−)ᵒᵖ` preserves categorical equivalences, so by the `Map^♭` form of §5.6 (HTT, Prop. 3.1.3.3) `A ⟶ B` is a
  Cartesian equivalence exactly when `Aᵒᵖ ⟶ Bᵒᵖ` is.

**Checks.**
- Over S = Δ[1], `{0}^♯ ⟶ Δ[1]^♯` is a coCartesian equivalence and `{1}^♯ ⟶ Δ[1]^♯` is not, the reverse of the
  Cartesian case (§5.6): the opposite of Δ[1] exchanges its vertices. So the two structures differ over Δ[1].
- Over Δ[1], `{0}^♯` with its inclusion is not fibrant in the coCartesian structure: against the trivial cofibration
  `{0}^♯ ⊆ Δ[1]^♯` of the first Check, a lift of the identity of `{0}^♯` would be a map `Δ[1] ⟶ {0}` over the
  identity of Δ[1], and there is none.
- Over Δ[0], `Δ[1]^♭ ⟶ Δ[1]^♯` is neither a Cartesian nor a coCartesian equivalence (§5.6), although its underlying
  map is the identity: a definition of coCartesian equivalences through underlying simplicial sets would accept it.

*Needs:* §1.3.1; §5.3.1; §5.5.2; §5.6.1; §5.7.1 (the Cartesian structure over Sᵒᵖ); Mathlib `SSet.opFunctor`; §1.1.1 (HTT, Def. 2.4.2.1); Part InfinityCategoryFoundations §2.1.2 (the opposite comparison).

### 5.8 Fibrant objects, products and enrichment

**5.8.1.** Prove that a marked simplicial set over S is fibrant in the Cartesian structure exactly when it is isomorphic to Y^♮
for a Cartesian fibration `Y ⟶ S` (HTT, Prop. 3.1.4.1, p. 178). The route: a fibrant X has a marked anodyne map to
some Z^♮, by the small object argument on the set of generators of §5.2 (HTT, Rem. 3.1.1.3), a trivial cofibration along which X extends, so X is a retract of Z^♮; conversely Y^♮ lifts against a
trivial cofibration `A ⟶ B` by correcting a homotopy along the marked anodyne inclusion
`(A × Δ[1]^♯) ∪ (B × {1}^♯) ⊆ B × Δ[1]^♯` (§5.4).

*Needs:* §5.2.1 (HTT, Rem. 3.1.1.3, the generators form a set); §5.3.1, §5.3.2; §5.4.1; §5.6.1; §5.7.1; ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)).

**5.8.2.** Prove that products of marked simplicial sets are compatible with the Cartesian structures: for Z over T, the functor
`X ↦ X × Z` from marked simplicial sets over S to those over S × T preserves Cartesian equivalences (HTT,
Prop. 3.1.4.2, p. 179), so the pushout-product of a cofibration over S with a cofibration over T is a cofibration over
S × T, trivial when either factor is trivial (HTT, Cor. 3.1.4.3, p. 179). The route: for a Cartesian equivalence
`f : X ⟶ Y`, reduce to fibrant X and Y by marked anodyne replacements (§5.4, §5.6); there f has a strong homotopy
inverse g (§5.6), and `g × 𝟙` is one for `f × 𝟙`. The pushout-product statement follows by two-out-of-three (§5.7).

*Needs:* §5.4.1; §5.6.1, §5.6.2; §5.7.1; §5.8.1 (HTT, Prop. 3.1.4.1); §5.1.1 (HTT, Def. 3.1.2.2);
ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)).

**5.8.3.** Prove that with the mapping simplicial sets `Map^♯_S(X, Y)` and the tensor `K^♯ × X`, marked simplicial sets over S
form a simplicial model category for the Cartesian structure (HTT, Cor. 3.1.4.4, p. 180). The route: the
pushout-product axiom is §5.8 with T = Δ[0], and for anodyne `Y ⟶ Y'`, `Y^♯ ⟶ Y'^♯` is a Cartesian equivalence since
`Map^♯(Y^♯, Z^♮) = Fun(Y, Z^≃)`.

*Needs:* §1.3.1; §5.7.1; §5.8.2 (HTT, Cor. 3.1.4.3); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.5, the core);
ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5) and §1.2.2 (HTT, Example A.3.1.4, Kan–Quillen as a monoidal model structure); Part KanQuillen §3.1.1 (weak homotopy equivalences).

**5.8.4.** Prove that Set⁺_Δ, with the Cartesian structure over Δ[0] and the Cartesian product, is an excellent model category
(HTT, Example A.3.2.22, p. 882). The route: `K ↦ K^♯` is a monoidal left Quillen functor from the Kan–Quillen
structure, so the invertibility hypothesis follows from A.3.2.18 and A.3.2.20; weak equivalences are stable under
filtered colimits (§5.7) and the product is a left Quillen bifunctor (§5.8).

*Needs:* §5.7.1; §5.8.2; ModelCategoryTheory, Part SimplicialCategories §5.6.1 (HTT, Defs. A.3.2.12, A.3.2.16), §5.7.4 (HTT, Example A.3.2.18) and §5.8.5 (HTT, Lemma A.3.2.20); Part ModelCategories §4.1.1 (HTT, §A.2.5, Quillen adjunctions).

**5.8.5.** Prove that the fibrant objects of the coCartesian structure over S (§5.7) are the marked simplicial sets marking
exactly the p-coCartesian edges of a coCartesian fibration `p : X ⟶ S` (the dual of HTT, Prop. 3.1.4.1, p. 178,
through Rem. 3.1.3.9, p. 178): through
`X ↦ Xᵒᵖ`, this is §5.8.1 over Sᵒᵖ. For instance `{0}^♯` over Δ[1] is fibrant in the
Cartesian structure, as `{0} ⊆ Δ[1]` is a Cartesian fibration all of whose edges are degenerate, but not in the
coCartesian one (§5.7), since `{0} ⊆ Δ[1]` is not a coCartesian fibration: `0 ⟶ 1` has no lift starting at 0.

*Needs:* §5.7.2 (the coCartesian structure, HTT, Rem. 3.1.3.9); §5.8.1 (HTT, Prop. 3.1.4.1); §1.1.1 (HTT, Def. 2.4.2.1).

### 5.9 Forgetting markings: the contravariant and Kan–Quillen structures

**5.9.1.** Prove that marked simplicial sets over S carry a left proper combinatorial model structure whose cofibrations are the
maps with monomorphic underlying map and whose weak equivalences are the maps f with `f^♯` a Cartesian equivalence
(HTT,
Prop. 3.1.5.2, p. 182), by Smith's theorem as in §5.7.

*Needs:* §5.6.1; §5.7.1; §5.1.1 (HTT, Def. 3.1.2.2); ModelCategoryTheory, Part ModelCategories §5.5.1
(HTT, Cor. A.2.6.14) and §6.3.2 (HTT, Prop. A.2.6.15).

**5.9.2.** Prove that forgetting markings, with right adjoint `X ↦ X^♯`, is a Quillen equivalence from the structure of §5.9.1 to the contravariant model structure on simplicial sets over S (HTT, Prop. 3.1.5.6, p. 185). The
route: `Map^♯_S(Y^♯, Z^♮)` is the mapping space into the right fibration of Cartesian edges of Z (§2.2), so forgetting
markings detects weak equivalences; the counit at a fibrant object, a right fibration, is an isomorphism.

*Needs:* §2.2.2; §5.3.1; §5.9.1 (HTT, Prop. 3.1.5.2); Part InfinityCategoryFoundations §7.6.1 (HTT, Cor. 2.2.3.12) and §6.4.1 (HTT, after Prop. 2.1.4.8, the contravariant structure);
ModelCategoryTheory, Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1); Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5).

**5.9.3.** Prove that the identity of simplicial sets over S is a left Quillen functor from the contravariant structure to the
Kan–Quillen structure, and a Quillen equivalence (the two structures coincide) when S is a Kan complex (HTT, Prop.
3.1.5.7, p. 186). The route: Kan fibrations are right fibrations, and over a Kan complex conversely.

*Needs:* Part InfinityCategoryFoundations §5.3.2 (HTT, Lemma 2.1.3.4), §7.6.1 (HTT, Cor. 2.2.3.12) and §6.4.1 (the contravariant structure); Mathlib `SSet.anodyneExtensions` (HTT, Example 2.0.0.1);
ModelCategoryTheory, Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1) and §4.1.1 (HTT, §A.2.5); Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5);
Part KanQuillen §3.2.1 (HTT, §A.2.7, the Kan–Quillen structure).

### Examples

- Over S = Δ[0], the fibrant objects are `C^♮` for ∞-categories C, marking exactly the equivalences, and a map of
  ∞-categories is a Cartesian equivalence `C^♮ ⟶ D^♮` exactly when it is a categorical equivalence.

### Dependencies

Layers 1–3 (§3.4 for Cartesian equivalences); Tau Ceti's marked simplicial sets; §5.1; Part InfinityCategoryFoundations §1.2 and §2.1; Part InfinityCategoryFoundations §3.2, §4.1, §4.3,
§5.1–5.3, §6.4, §7.6 and §9.5 (left anodyne maps, slices, mapping spaces, the Joyal and contravariant structures); ModelCategoryTheory, Parts ModelCategories, KanQuillen and SimplicialCategories.

## Layer 6: Mapping simplices and Cartesian fibrations over a simplex

### 6.1 Mapping simplices

**6.1.1.** Define, for a composable sequence `φ : A₀ ⟵ A₁ ⟵ ⋯ ⟵ Aₙ` of simplicial sets, the mapping simplex `M(φ)` over Δ[n]: its
J-simplices (J a nonempty finite linearly ordered set with largest element j) are pairs of an order-preserving
`f : J ⟶ [n]` and a simplex `σ : Δ^J ⟶ A_{f(j)}`; along `p : J ⟶ J'` the pair goes to `(f ∘ p, e ∘ σ ∘ p)`, with e the
composite map `A_{f(j')} ⟶ A_{f(p(j))}` of φ (HTT, §3.2.2, introduction, p. 197). `M^♮(φ)` marks the edges whose
component in the last factor is degenerate.

- The fiber of `M(φ) ⟶ Δ[n]` over i is A_i; for n = 0, `M(φ) = A₀`.
- A ladder of maps `A_i ⟶ B_i` induces `M(φ) ⟶ M(ψ)`, a categorical equivalence when each `A_i ⟶ B_i` is one (HTT,
  Rem. 3.2.2.5, p. 198), by induction on n with left properness of the Joyal structure.
- Base change of `M(φ)` along `Δ[m] ⟶ Δ[n]` is the mapping simplex of the restricted sequence.

**Checks.**
- For n = 1 and `φ = 𝟙 : A ⟵ A`, `M(φ) ≅ A × Δ[1]` and `M^♮(φ) = A^♭ × Δ[1]^♯`: an edge over `0 ⟶ 1` is marked only
  when its A-component is degenerate. Marking every edge over a nondegenerate edge of Δ[n] would mark `(e, ι)` for
  every edge e of A, which for A = Δ[1] is not a Cartesian edge of `Δ[1] × Δ[1] ⟶ Δ[1]`.
- For `φ : Δ[0] ⟵ ∅`, `M(φ) = Δ[0]` sitting over 0. Taking σ in `A_{f(min J)}` instead would not even give a
  simplicial set for `Δ[0] ⟵ ∅`: an edge over `0 ⟶ 1` would have no target vertex.
- For n = 1 and `φ : Δ[0] ⟵ A`, `M(φ) = (A × Δ[1]) ⊔_{A × {0}} Δ[0]`, with the point over 0 and A over 1; it is
  categorically equivalent to the left cone `Δ[0] ⋆ A`. In general for n = 1 it is the mapping cylinder of `A₁ ⟶ A₀`.

*Needs:* Part InfinityCategoryFoundations §9.5.1; ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, homotopy pushouts); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14).

### 6.2 Quasi-equivalences

**6.2.1.** Define, for a Cartesian fibration `p : X ⟶ Δ[n]` and a composable sequence φ, a quasi-equivalence as a map
`q : M(φ) ⟶ X` over Δ[n] carrying the marked edges of `M^♮(φ)` to p-Cartesian edges, so that q is a map
`M^♮(φ) ⟶ X^♮`, and inducing categorical equivalences `A_i ⟶ X_i` on every fiber (HTT, Def. 3.2.2.6, p. 198).

- Quasi-equivalences are stable under base change along `Δ[m] ⟶ Δ[n]`.
- Composing with a ladder of fiberwise categorical equivalences preserves quasi-equivalences (§6.1).

**Checks.**
- For φ : Δ[0] ⊔ Δ[0] ⟵ Δ[0] (the first point) and p = 𝟙 Δ[1], the projection `M(φ) ⟶ Δ[1]` carries marked edges to
  Cartesian edges and is an equivalence on the fiber over 1, but not over 0 (two points to one). So the condition is
  on every fiber, not only the last.
- For `X = Δ[1] ⟶ Δ[1]` (the identity) and `φ : Δ[0] ⟵ Δ[0]`, the isomorphism `M(φ) ≅ Δ[1]` is a quasi-equivalence.
  For `φ : Δ[0] ⟵ ∅`, `M(φ) = Δ[0]` lies over 0, and the inclusion `{0} ⟶ Δ[1]` is not a quasi-equivalence: on the
  fiber over 1 it is `∅ ⟶ Δ[0]`, which is not a categorical equivalence.
- For an ∞-category C, p the projection `C × Δ[1] ⟶ Δ[1]` and φ the identity of C, the identity of `M(φ) = C × Δ[1]`
  is
  a quasi-equivalence: its marked edges (e, ι) with e degenerate are p-Cartesian. A map sending a marked edge to
  (f, ι) with f not an equivalence fails the second condition, since that edge is not Cartesian.

*Needs:* §6.1.1; §5.3.1; `SSet.Edge.IsCartesian`, `SSet.CartesianFibration`; Part InfinityCategoryFoundations §2.1.6 (HTT,
Def. 1.1.5.14).

### 6.3 Replacing a Cartesian fibration over Δ[n] by a mapping simplex

**6.3.1.** Prove that every quasi-equivalence is a categorical equivalence (HTT, Prop. 3.2.2.10, p. 201). The route is induction
on n, splitting `C[M(φ)]` and `C[X]` at the last vertex. Mapping spaces into the last fiber are compared by the
mapping-space description of Cartesian edges (§1.7) and by the fact that in `C[M(φ)]`, composition with the edge
`y' ⟶ y` over `Δ^{n−1,n}` induces weak homotopy equivalences `Map(x, y') ⟶ Map(x, y)` for x outside the last fiber
(HTT, Lemma 3.2.2.9, p. 200), proved through pushouts in `Cat_Δ` and the product comparison
`C[A × Δ[1]] ⟶ C[A] × C[Δ[1]]` (Part InfinityCategoryFoundations §9.6, HTT, Cor. 2.2.5.6).

*Needs:*
- Part InfinityCategoryFoundations §9.5.1 and §9.6.2 (HTT, Cor. 2.2.5.6); §1.7.1; §6.1.1; §6.2.1.
- ModelCategoryTheory, Part SimplicialCategories §5.4.2 (HTT, Prop. A.3.2.4); Part KanQuillen §3.1.1 (weak homotopy equivalences); Part ModelCategories §3.5.1 (HTT, §A.2.4, homotopy pushouts).

**6.3.2.** Prove that for a Cartesian fibration `p : X ⟶ Δ[n]`, there is a composable sequence φ with a quasi-equivalence
`M(φ) ⟶ X`, and for every quasi-equivalence `M(φ) ⟶ X` and every `T ⟶ Δ[n]`, the base change
`M(φ) ×_{Δ[n]} T ⟶ X ×_{Δ[n]} T` is a categorical equivalence (HTT, Prop. 3.2.2.7, p. 198). The route: existence is
the
case A = ∅ of HTT, Prop. 3.2.2.11, p. 202 (every map `A^♭ × Δ[n]^♯ ⟶ X^♮` over `Δ[n]^♯` factors through some
`M^♮(φ)` by a quasi-equivalence), proved by induction on n, lifting through §5.3 and factoring `A ⟶ Aₙ ⟶ Xₙ`. Base
change reduces to simplices T by Part InfinityCategoryFoundations §10.5 (HTT, Prop. 3.2.2.8), where it is Prop. 3.2.2.10 (§6.3.1).

*Needs:*
- Part InfinityCategoryFoundations §10.5.1 (HTT, Prop. 3.2.2.8); §5.3.1, §5.3.2; §5.4.1; §6.1.1; §6.2.1; §6.3.1 (HTT, Prop. 3.2.2.10).
- Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7, the Kan–Quillen factorizations).

**6.3.3.** Prove that a quasi-equivalence `M(φ) ⟶ X` induces a Cartesian equivalence `M^♮(φ) ⟶ X^♮` over `Δ[n]^♯` (HTT,
Prop. 3.2.2.14, p. 205). The route checks the `Map^♭` form of §5.6: precomposition with a categorical equivalence
(Prop. 3.2.2.10) induces categorical equivalences on functor ∞-categories, and the marked conditions match.

*Needs:* Part InfinityCategoryFoundations §9.5; §3.4.1 (HTT, Prop. 1.2.7.3 (3)); §5.5.2; §5.6.1; §6.2.1; §6.3.1 (HTT, Prop. 3.2.2.10); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11, full subcategories) and §2.1.6 (HTT, Def. 1.1.5.14).

### Examples

- For n = 1 and `φ : A₀ ⟵ A₁` a functor F of ∞-categories, `M(φ)` is the mapping cylinder of F; a quasi-equivalence
  from it to a Cartesian fibration `X ⟶ Δ[1]` exhibits F as the transport functor of X along `0 ⟶ 1`, up to
  equivalence.

### Dependencies

Layers 1, 3 and 5; Part InfinityCategoryFoundations §6.1, §9.5, §9.6 and §10.5 (rigidification of inner anodyne maps, the Joyal
structure, the comparison with simplicial categories, testing over simplices); §5.1; Part InfinityCategoryFoundations §1.2 and §2.1; ModelCategoryTheory, Parts
ModelCategories, KanQuillen and SimplicialCategories.

## Layer 7: Base change, fiberwise criteria and categorical fibrations

### 7.1 Inner anodyne base change along a (co)Cartesian fibration

**7.1.1. Inner anodyne base change along a (co)Cartesian fibration.** Prove that for any simplicial set B, a
Cartesian or coCartesian fibration `q : Y ⟶ B` and an inner anodyne map
`j : A ⟶ A'` over B, the induced map `Y_A ⟶ Y_{A'}` is a monomorphism and a categorical equivalence. For `A' = B` this
is the inner-anodyne half of HTT, Prop. 3.3.1.3, p. 223, over every base. The `Suggested.lean` declaration
`isCategoricalEquivalence_pullback_map_of_innerAnodyne` states the categorical-equivalence half; the monomorphism half
holds because pullback preserves monomorphisms.

The route has two steps; the coCartesian case is the dual, applied to `qᵒᵖ`, since `(−)ᵒᵖ` preserves inner anodyne
maps and categorical equivalences.
- **Horn case.** Let `q : Y ⟶ Δ[n]` be Cartesian and `0 < i < n`. Choose a composable sequence
  `φ : A₀ ⟵ A₁ ⟵ ⋯ ⟵ Aₙ` and a quasi-equivalence `M(φ) ⟶ Y` over Δ[n] (§6.3, HTT, Prop. 3.2.2.7 (1)); by §6.3
  (HTT, Prop. 3.2.2.7 (2)) its base changes along `Δ[n] ⟶ Δ[n]` and `Λ[n, i] ⊆ Δ[n]` are categorical equivalences, so
  in the square formed by `M(φ)_{Λ[n, i]} ⊆ M(φ)` and `Y_{Λ[n, i]} ⊆ Y` the two vertical maps are categorical
  equivalences. The top map is a pushout of `Aₙ × Λ[n, i] ⊆ Aₙ × Δ[n]`. A J-simplex `(u, σ)` of `M(φ)` (§6.1) lies
  over `Λ[n, i]` unless the image of u contains `[n] ∖ {i}`; that set contains n because `i < n`, so then
  `u(max J) = n` and σ is a simplex of Aₙ. The map `Aₙ × Δ[n] ⟶ M(φ)`, `(τ, u) ↦ (u, φ ∘ τ)`, is therefore a
  bijection from the simplices outside `Aₙ × Λ[n, i]` onto those outside `M(φ)_{Λ[n, i]}`, and `Aₙ × Λ[n, i]` is the
  preimage of `M(φ)_{Λ[n, i]}`: the square is levelwise a pushout of sets. `Aₙ × Λ[n, i] ⊆ Aₙ × Δ[n]` is the
  pushout-product of `∅ ⊆ Aₙ` with an inner horn, hence inner anodyne (Mathlib
  `SSet.innerAnodyneExtensions_pushoutObjObjι`), so the top map is inner anodyne and a categorical equivalence (Part
  InfinityCategoryFoundations §6.1, HTT, Lemma 2.2.5.2). Two-out-of-three gives the bottom map.
- **General case.** Let 𝒢 be the class of maps j over B such that `Y_j` is a monic categorical equivalence. Pullback
  along q preserves pushouts, transfinite composites, retracts and monomorphisms (Conventions), and monic categorical
  equivalences are a left lifting class (Part InfinityCategoryFoundations §9.5), so 𝒢 is weakly saturated. It contains every
  inner horn over B: pull back along `Δ[n] ⟶ B`, where the pullback of q is Cartesian (Tau Ceti
  `SSet.CartesianFibration.of_isPullback`), and apply the horn case. An inner anodyne map over B lies in the weak
  saturation, among maps over B, of the inner horns over B: factor it by the small object argument as a relative
  cell complex of inner horns over B followed by a map r with the right lifting property against them; a lifting
  problem against an inner horn over B is an ordinary one, so r is an inner fibration, j lifts against r over B, and
  j is a retract of the cell complex.

*Needs:*
- §6.1.1 (mapping simplices); §6.3.2 (HTT, Prop. 3.2.2.7); Tau Ceti `SSet.CartesianFibration.of_isPullback`.
- Mathlib `SSet.innerAnodyneExtensions_pushoutObjObjι`, `SSet.innerHornInclusions`, `SSet.innerFibrations`,
  `SSet.opFunctor`.
- Part InfinityCategoryFoundations §6.1.1 (HTT, Lemma 2.2.5.2), §9.1.1 (inner anodyne maps as the weak saturation of the inner
  horns) and §9.5.1 (monic categorical equivalences as a left lifting class); Part InfinityCategoryFoundations §2.1.6 (HTT,
  Def. 1.1.5.14, and the opposite comparison).
- ModelCategoryTheory, Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2) and §1.4.1 (HTT, Prop. A.1.2.5 (1)).

### 7.2 Base change along a (co)Cartesian fibration over an ∞-category

**7.2.1. Base change along a (co)Cartesian fibration.** Prove that for an ∞-category S, a Cartesian or
coCartesian fibration `p : X ⟶ S` and a map `g : T ⟶ T'` over S that is a categorical equivalence, the induced map
`X_T ⟶ X_{T'}` is a categorical equivalence. For `T' = S` this is HTT, Prop. 3.3.1.3, p. 223, over an ∞-category
base: for a categorical equivalence `t : T ⟶ S`, the projection `X ×_S T ⟶ X` is a categorical equivalence (`Suggested.lean`
declaration `isCategoricalEquivalence_pullback_fst_of_quasicategory`).

The route, for p Cartesian (the coCartesian case is the dual):
- **Between ∞-categories.** If `h : T₁ ⟶ T₁'` is a categorical equivalence of ∞-categories over S, then
  `X_{T₁'} ⟶ T₁'` is a Cartesian fibration of ∞-categories (base change, Tau Ceti
  `SSet.CartesianFibration.of_isPullback`; an inner fibration over an ∞-category has an ∞-category as source), and
  `X_{T₁} = T₁ ×_{T₁'} X_{T₁'} ⟶ X_{T₁'}` is a categorical equivalence by §2.5 (HTT, Cor. 2.4.4.5).
- **General.** Factor `T' ⟶ S` as an inner anodyne `ι' : T' ⟶ T₁'` followed by an inner fibration `T₁' ⟶ S`; T₁' is an
  ∞-category because S is. Factor `ι' ∘ g` as an inner anodyne `ι : T ⟶ T₁` followed by an inner fibration
  `h : T₁ ⟶ T₁'`; T₁ is an ∞-category, every map lies over S, and h is a categorical equivalence by two-out-of-three,
  since ι, ι' and g are. Pulling X back along the resulting square, `X_T ⟶ X_{T₁}` and `X_{T'} ⟶ X_{T₁'}` are
  categorical equivalences by inner anodyne base change (§7.1, applied to the Cartesian fibrations `X_{T₁} ⟶ T₁` and `X_{T₁'} ⟶ T₁'`, using
  `X_T = T ×_{T₁} X_{T₁}`), and `X_{T₁} ⟶ X_{T₁'}` by the first step. Two-out-of-three finishes.

The hypothesis that S is an ∞-category is used only to make T₁' an ∞-category. The `Suggested.lean` declaration for the statement of this
section is `isCategoricalEquivalence_pullback_map_of_quasicategory`.

*Needs:*
- §2.5.2 (HTT, Cor. 2.4.4.5); §7.1.1; Tau Ceti `SSet.CartesianFibration.of_isPullback`; Mathlib
  `SSet.quasicategory_iff_innerFibration`, `SSet.innerAnodyneExtensions`, `SSet.innerFibrations`.
- Part InfinityCategoryFoundations §6.1.1 (HTT, Lemma 2.2.5.2); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14, two-out-of-three).
- ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1), the factorizations).

### 7.3 Fiberwise criteria for categorical equivalence

**7.3.1. Fiberwise criterion over any base.** Prove that for any simplicial set C, coCartesian fibrations
`K ⟶ C`, `K̄ ⟶ C` and a map `F : K ⟶ K̄` over C that carries coCartesian edges to coCartesian edges and induces a categorical equivalence `K_c ⟶ K̄_c` on the fiber over
every vertex c, the map `K ×_C C' ⟶ K̄ ×_C C'` is a categorical equivalence for every `C' ⟶ C`; in particular F is
one. The dual statement for Cartesian fibrations is the implication (2) ⇒ (1) of HTT, Prop. 3.3.1.5, p. 225, over
every base. The `Suggested.lean` declarations are `isCategoricalEquivalence_pullback_map_of_fiber` and, for the
Cartesian dual with `C' = C`, `isCategoricalEquivalence_of_fiber`. The route: by Part InfinityCategoryFoundations §10.5 (HTT, Prop. 3.2.2.8) it suffices to treat `C' = Δ[n]`, along a
simplex σ. There both pullbacks are ∞-categories, inner fibrations over Δ[n], and `F_σ` is a map of coCartesian
fibrations of ∞-categories which is a categorical equivalence on fibers. It carries coCartesian edges to
coCartesian edges: a coCartesian edge e of `K_σ` and the pullback e' of a coCartesian lift in K of the same edge of C
with the same source are both coCartesian lifts of one edge with one source, so they differ by an equivalence in a
fiber (§1.4, dually, with Tau Ceti `SSet.Edge.IsCartesian.of_isPullback`); F carries e' to a coCartesian edge, and
coCartesian edges are closed under composition with equivalences in the fiber (§1.3 and §1.4, dually). So `F_σ` is a
categorical equivalence by §2.5 (HTT, Cor. 2.4.4.4, dually).

*Needs:* §1.3.1; §1.4.1; §1.5.1; §2.5.1 (HTT, Cor. 2.4.4.4); Part InfinityCategoryFoundations §10.5.1 (HTT, Prop. 3.2.2.8); Tau Ceti
`SSet.Edge.IsCartesian.of_isPullback`, `SSet.CartesianFibration.of_isPullback`; §1.1.1 (HTT,
Def. 2.4.2.1).

**7.3.2. Fibers of a categorical equivalence of categorical fibrations** (Lemma F). Prove that for a simplicial set C
and a map `f : X ⟶ Y` over C between categorical fibrations `X ⟶ C` and `Y ⟶ C`, if f is a categorical equivalence
then every fiber map `X_c ⟶ Y_c` is a categorical equivalence; and if `X ⟶ C` and `Y ⟶ C` are left or right
fibrations, the fibers are Kan complexes and `X_c ⟶ Y_c` is a homotopy equivalence (HTT, Prop. 3.3.1.5, (1) ⇒ (2), for
categorical fibrations over an ∞-category, and its use in HTT, Cor. 4.2.1.7, p. 260, for left fibrations;
`Suggested.lean` declaration `isCategoricalEquivalence_fiber_of_categoricalFibration` for the first assertion). The
route: X and Y are bifibrant in the Joyal structure on simplicial sets over C (Mathlib
`HomotopicalAlgebra.ModelCategory.over`, ModelCategoryTheory, Part ModelCategories §3.3, with Part
InfinityCategoryFoundations §9.5), in which `− × J` is a cylinder: `X × ∂J ⊆ X × J` is a monomorphism and `X × J ⟶ X`
a categorical equivalence (Part InfinityCategoryFoundations §9.3, J ⟶ Δ[0] being a trivial fibration). A weak
equivalence between bifibrant objects is a homotopy equivalence, so f has a J-homotopy inverse over C; restricting the
inverse and the J-homotopies to the fiber over c gives a J-homotopy equivalence `X_c ⇄ Y_c`. A J-homotopy `K × J ⟶ L`
between two maps induces a natural isomorphism between the induced functors `h Fun(L, D) ⟶ h Fun(K, D)` for every
∞-category D, so a J-homotopy equivalence is a categorical equivalence in Joyal's form, hence a categorical
equivalence (Part InfinityCategoryFoundations §9.7, HTT, Prop. 2.2.5.8). For left or right fibrations the fibers are
Kan complexes (Part InfinityCategoryFoundations §5.1, HTT, Prop. 1.2.5.1), and a categorical equivalence between Kan
complexes is a homotopy equivalence: by §3.4 (the comparison with `SSet.QCat.IsCategoricalEquivalence`) it has an
inverse up to isomorphism in the homotopy categories of functor ∞-categories, and an isomorphism of `h Fun(K, L)` is
represented by an edge of `Fun(K, L)`, a homotopy `K × Δ[1] ⟶ L`.

*Needs:*
- Part InfinityCategoryFoundations §9.7.2 (HTT, Prop. 2.2.5.8); §3.4.2 (the comparison with `SSet.QCat.IsCategoricalEquivalence`); Mathlib
  `HomotopicalAlgebra.ModelCategory.over`.
- Part InfinityCategoryFoundations §9.3.1, §9.4.1 and §9.5.1 (the Joyal structure); Part InfinityCategoryFoundations §5.1.1 (HTT, Prop. 1.2.5.1) and
  §2.3.1 (HTT, §1.2.4); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14).
- ModelCategoryTheory, Part ModelCategories §3.1.2 (HTT, §A.2.2, homotopy equivalences of bifibrant objects) and §3.3.1
  (the model structure over an object); Part KanQuillen §1.3 (homotopy equivalences of Kan complexes).

**7.3.3. Fiberwise criterion for Cartesian fibrations.** For Cartesian fibrations `p : X ⟶ S`, `q : Y ⟶ S` and a map
`f : X ⟶ Y` over S carrying p-Cartesian edges to q-Cartesian edges, consider the conditions (1) f is a categorical
equivalence; (2) every fiber map `X_s ⟶ Y_s` is a categorical equivalence; (3) `X^♮ ⟶ Y^♮` is a Cartesian
equivalence over S. Prove that (2) and (3) are equivalent and imply (1) for every S, and when S is an ∞-category all three
are equivalent (HTT, Prop. 3.3.1.5, p. 225; `Suggested.lean` declaration `isCategoricalEquivalence_iff_fiber_of_quasicategory`).
The route: (2) ⇔ (3) is §5.6 (HTT, Prop. 3.1.3.5); (2) ⇒ (1) is the fiberwise criterion over any base, dually. For (1) ⇒ (2) over
an ∞-category S, p and q are categorical fibrations: they are inner fibrations, and an equivalence of S with
prescribed target lifts to a Cartesian edge, which is an equivalence (§1.3), so §3.3 (HTT, Cor. 2.4.6.5, prescribed-target form)
applies. Lemma F then applies.

*Needs:* §1.3.1; §3.3.1 (HTT, Cor. 2.4.6.5); §5.6.2 (HTT, Prop. 3.1.3.5); §7.3.1 and §7.3.2 (the fiberwise criterion
over any base; Lemma F); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1).

**7.3.4.** Prove that if in a pullback square `W = X ×_Z Y` every map, together with `Z ⟶ S`, is a right fibration, then the
square is homotopy Cartesian for the contravariant model structure on simplicial sets over S (HTT, Cor. 3.3.1.6,
p. 226). The route compares fibers with a fibrant replacement of the cospan `X ⟶ Z ⟵ Y` in the injective (or Reedy) sense,
a cospan `X' ⟶ Z' ⟵ Y'` of fibrant objects over S with `X' ⟶ Z'` a contravariant fibration, so that
`W' = X' ×_{Z'} Y'` is a homotopy pullback: a map of right fibrations over S is a contravariant equivalence exactly
when it is a homotopy equivalence on every fiber (HTT, Cor. 2.2.3.13), the replacement induces homotopy equivalences
on the fibers of X, Y and Z, and on the fibers over a vertex of S, the maps `X_s ⟶ Z_s` and `X'_s ⟶ Z'_s` are right
fibrations between Kan complexes, hence Kan fibrations (HTT, Lemma 2.1.3.3, dually), so both fiber squares are
homotopy pullbacks of Kan complexes by right properness of the Kan–Quillen structure (see also HTT, Prop. 2.1.3.1).
So `W ⟶ W'` is a fiberwise homotopy equivalence.

*Needs:* Part InfinityCategoryFoundations §5.3.1 (HTT, Lemma 2.1.3.3), §5.4.2 (HTT, Prop. 2.1.3.1), §7.6.1 (HTT, Cors. 2.2.3.12,
2.2.3.13) and §6.4.1 (HTT, after Prop. 2.1.4.8, the contravariant structure); ModelCategoryTheory, Part ModelCategories
§3.5.1 (HTT, §A.2.4, homotopy pullbacks) and Part KanQuillen §3.4.1 (properness of the Kan–Quillen structure).

### 7.4 (Co)Cartesian fibrations over ∞-categories and over Kan complexes

**7.4.1. (Co)Cartesian fibrations over an ∞-category are categorical fibrations.** Prove that a Cartesian
or coCartesian fibration `p : X ⟶ S` is a categorical fibration whenever S is an ∞-category,
and therefore whenever p is a pullback of such a fibration, for example a product projection `C × K ⟶ K` with C an
∞-category and K any simplicial set (HTT, Prop. 3.3.1.7, p. 227, for these bases; `Suggested.lean` declarations
`categoricalFibration_of_cartesianFibration_or_cocartesianFibration` and, for product projections,
`categoricalFibration_snd`). The route: over an ∞-category S,
p is an inner fibration along which equivalences of S lift with prescribed target, to Cartesian edges, which are
equivalences (§1.3), so p is a categorical fibration by the prescribed-target form of HTT, Cor. 2.4.6.5 (§3.3).
For coCartesian p, the prescribed-source form (Part InfinityCategoryFoundations §10.2) applies directly. Categorical fibrations are stable under base change (Part InfinityCategoryFoundations §9.4).

*Needs:* §1.3.1; §1.5.1; §3.3.1 (HTT, Cor. 2.4.6.5); Part InfinityCategoryFoundations §10.2.4 (HTT, Cor. 2.4.6.5) and §9.4.1; §1.1.1 (HTT, Def. 2.4.2.1); Part InfinityCategoryFoundations §2.1.2 (the opposite
comparison); Mathlib `SSet.opFunctor`.

**7.4.2.** Prove that for a map `p : X ⟶ S` to a Kan complex S the following are equivalent: p is a Cartesian fibration; p is a
coCartesian fibration; p is a categorical fibration (HTT, Prop. 3.3.1.8, p. 228; `Suggested.lean`
declaration `tfae_cartesianFibration_categoricalFibrations`). The route: a Kan complex is an ∞-category, so Cartesian
and coCartesian fibrations over S are categorical by §7.4.1. Conversely, X is an ∞-category, as
`X ⟶ S ⟶ Δ[0]` is a composite of categorical fibrations (Part InfinityCategoryFoundations §9.4, §9.5). Every edge of S is an
equivalence, so by §1.3 the p-Cartesian edges are the equivalences of X, and it suffices to lift an edge
`e : s ⟶ p y` to an equivalence ending at y. Extend e along an anodyne map `Δ[1] ⟶ K` to `K ⟶ S`, with K a
contractible Kan complex (the Kan–Quillen factorization); `K ⟶ Δ[0]` is a trivial fibration, hence a categorical
equivalence (Part InfinityCategoryFoundations §9.5), so the inclusion of the end vertex into K is a monic categorical
equivalence; `K ⟶ S` then lifts to X with that vertex sent to y, and the image of the edge, an equivalence, is the
required lift. The coCartesian case is the same argument for `pᵒᵖ`, as `Sᵒᵖ` is a Kan complex and `(−)ᵒᵖ` preserves
categorical fibrations.

- A categorical fibration over a Kan complex whose fibers are Kan complexes is a right and a left fibration (§2.2,
  HTT, Prop. 2.4.2.4, and its dual), hence a Kan fibration (HTT, Lemma 2.1.3.3).
- One whose fibers are contractible Kan complexes is a trivial fibration (HTT, Lemma 2.1.3.4, for right fibrations),
  so its Kan complex of sections over S is contractible: it is a fiber of the trivial fibration
  `Fun(S, X) ⟶ Fun(S, S)`.
- Over a Kan complex S, the Cartesian and coCartesian structures on marked simplicial sets over S (§5.7) coincide, so
  the Cartesian structure over S is self-dual (HTT, Rem. 3.1.4.6, pp. 180–181): a map over S is a Cartesian
  fibration exactly when it is a coCartesian one, both the Cartesian and the coCartesian edges of such a fibration are
  the equivalences of its source (§1.3), and the route of §5.7 for S = Δ[0] applies over S.
- The Kan hypothesis is needed: over Δ[1], `{0} ⊆ Δ[1]` is a Cartesian, hence categorical, fibration (its vertex lies
  over 0, where only a degenerate edge ends) but not a coCartesian one (§5.8: `0 ⟶ 1` has no lift starting at 0), and `{1} ⊆ Δ[1]` is a categorical
  fibration (Part InfinityCategoryFoundations §10.2: the only equivalences of Δ[1] are degenerate) but not a Cartesian one, since `0 ⟶ 1` has no lift
  ending at 1.

*Needs:* Part InfinityCategoryFoundations §9.4.1 and §9.5.1; §1.3.1; §1.5.1; §2.2.1 (HTT, Prop. 2.4.2.4); Part InfinityCategoryFoundations §9.5.2 (HTT, Thm. 2.4.6.1) and §10.2.4 (HTT,
Cor. 2.4.6.5); §5.5.2; §5.6.1; §5.7.2 (HTT, Rem. 3.1.3.9); §5.8.5; §7.4.1 (HTT, Prop. 3.3.1.7 for ∞-category bases); Part
InfinityCategoryFoundations §5.3.1 (HTT, Lemma 2.1.3.3), §5.3.2 (HTT, Lemma 2.1.3.4); §1.1.1 (HTT, Def. 2.4.2.1); Part InfinityCategoryFoundations §2.1.2 (HTT, §5.1.3, the opposite comparison); ModelCategoryTheory, Part KanQuillen §3.2.1 (the Kan–Quillen structure); Mathlib
`SSet.rlp_monomorphisms` (HTT, Example 2.0.0.2).

### 7.5 Invariance of section spaces under categorical equivalence

**7.5.1. Invariance of sections under categorical equivalence.** Prove that for a categorical fibration
`N ⟶ X` and a map `f : A ⟶ B` over X that is a categorical equivalence,
restriction `Map_X(B, N) ⟶ Map_X(A, N)` of the mapping objects of the Conventions is a categorical equivalence; that if `N ⟶ X` is moreover a right fibration,
both are Kan complexes and restriction is a homotopy equivalence; and that when f is a trivial fibration, restriction
is a categorical equivalence for every map `N ⟶ X`. The `Suggested.lean` declarations are `mapOver` and
`mapOverRestrict` (the mapping objects and restriction), `isCategoricalEquivalence_mapOverRestrict` for the first
assertion and `isCategoricalEquivalence_mapOverRestrict_of_rlp` for the third. The route factors f in the Joyal structure as a monic
categorical equivalence `i : A ⟶ W` followed by a trivial fibration `t : W ⟶ B`.
- **The monomorphism i.** `Map_X(W, N) ⟶ Map_X(A, N)` is the fiber over the vertex `W ⟶ X` of
  `Fun(W, N) ⟶ Fun(A, N) ×_{Fun(A, X)} Fun(W, X)`. Pushout-products of monomorphisms with monic categorical
  equivalences are monic categorical equivalences (Part InfinityCategoryFoundations §9.5, Cartesian closedness), and `N ⟶ X` is
  a categorical fibration, so this map is a trivial fibration, and so is its fiber.
- **Step t (the trivial fibration t)**, with no hypothesis on N. t has a section s over B, and `s ∘ t` and `𝟙 W` agree after t;
  since `W × ∂J ⊆ W × J` is a monomorphism and t a trivial fibration, there is a J-homotopy `W × J ⟶ W` over B from
  `s ∘ t` to `𝟙 W`. Applying `Map_X(−, N)` gives `s* ∘ t* = 𝟙` and a J-homotopy from `t* ∘ s*` to `𝟙`, so `t*` is a
  J-homotopy equivalence, hence a categorical equivalence (as in Lemma F, §7.3, through Part InfinityCategoryFoundations §9.7).

So `f* = i* ∘ t*` is a categorical equivalence. If `N ⟶ X` is a right fibration, `Fun(A, N) ⟶ Fun(A, X)` is a right
fibration (Tau Ceti `SSet.rightFibration_pullbackObjObjπ`, for `∅ ⊆ A`), so its fiber `Map_X(A, N)` is a right
fibration over a point, a Kan complex (Part InfinityCategoryFoundations §5.1, HTT, Prop. 1.2.5.1), and a categorical equivalence
between Kan complexes is a homotopy equivalence (Lemma F, §7.3).

**Checks** (the `Suggested.lean` constructions `ihomPt`, `mapOver` and `mapOverRestrict`).
- For `b = 𝟙 X`, `Map_X(X, N)` is the simplicial set of sections of `N ⟶ X`; for X = Δ[0] it is `Fun(A, N)`; for
  `N = {0} ⊆ Δ[1] = X` and A = Δ[1] with the identity it is empty, although `Fun(Δ[1], {0}) = Δ[0]` is not.
- For X = Δ[0] and `f = {0} ⊆ Δ[1]`, `mapOverRestrict` is evaluation `Fun(Δ[1], N) ⟶ N` at the vertex 0: for N = Δ[1]
  it sends the vertex `0 ⟶ 1` to 0, where restriction along the wrong vertex would give 1.
- For A = Δ[0], `ihomPt a` is the vertex a of `Fun(Δ[0], X) ≅ X`; for A = X = Δ[1] and a = 𝟙 it is the identity
  vertex of `Fun(Δ[1], Δ[1])`, not one of the two constant maps.

*Needs:*
- Part InfinityCategoryFoundations §9.4.1 and §9.5.1 (factorization), §9.5.3 (Cartesian closedness) and §5.1.1 (HTT, Prop. 1.2.5.1); Mathlib
  `SSet.rlp_monomorphisms`, `MonoidalClosed.pre`, `ihom`.
- Part InfinityCategoryFoundations §9.7.2 (HTT, Prop. 2.2.5.8); §7.3.2 (J-homotopy equivalences, and categorical equivalences between Kan complexes);
  Tau Ceti `SSet.rightFibration_pullbackObjObjπ`, `SSet.RightFibration`; Part InfinityCategoryFoundations §1.2 (HTT, Notation
  1.2.7.2, functor ∞-categories).

### 7.6 Functor fibrations out of a Cartesian fibration

**7.6.1.** Prove that for a Cartesian fibration `p : X ⟶ S` and a coCartesian fibration `q : Y ⟶ Z`, with `Y' ⟶ S` and
`Z' ⟶ S` defined by `Hom_S(K, Y') = Hom(X ×_S K, Y)` and `Hom_S(K, Z') = Hom(X ×_S K, Z)`, the map `q' : Y' ⟶ Z'` is a
coCartesian fibration, and an edge of Y' is q'-coCartesian exactly when the corresponding `Δ[1] ×_S X ⟶ Y` carries
p-Cartesian edges to q-coCartesian edges (HTT, Cor. 3.2.2.12, p. 203). Here an edge of `Δ[1] ×_S X` is p-Cartesian
when its image in X is. Equivalently, it is Cartesian for `Δ[1] ×_S X ⟶ Δ[1]`: that condition is local
p-Cartesianness (§1.6), and locally p-Cartesian edges are p-Cartesian because p is Cartesian (§2.3, HTT,
Prop. 2.4.2.8). Prove also that for a coCartesian fibration `Y ⟶ S`, the simplicial set T over S with
`Hom_S(K, T) = Hom_S(X ×_S K, Y)` is a coCartesian fibration over S, whose coCartesian edges are those carrying
p-Cartesian edges to coCartesian edges (HTT, Cor. 3.2.2.13, p. 205).

The route calls the edges described in the statement *special*. Write `X_e = X ×_S Δ[1]` for an edge e of S.
- **Reduction to sections.** Each lifting problem below is one for q over `W = X ×_S Δ[n]`, against the inclusion
  into W of `X ×_S Λ` for a horn or a vertex Λ of Δ[n]. W is an ∞-category, an inner fibration over Δ[n]. The pullback
  `Y_W = Y ×_Z W ⟶ W` of q is a coCartesian fibration over an ∞-category, hence a categorical fibration (§7.4, HTT,
  Prop. 3.3.1.7). So `Y_W` is fibrant, and every object is cofibrant, in the Joyal structure on simplicial sets over W
  (ModelCategoryTheory, Part ModelCategories §3.3, with Part InfinityCategoryFoundations §9.5). A lifting problem
  `X ×_S Λ ⟶ Y` over `W ⟶ Z` is the same as a section problem for `Y_W ⟶ W` along `X ×_S Λ ⊆ W`. `Y_W` is an
  ∞-category, an inner fibration over W, so §1.2–1.4 apply to `Y_W ⟶ W`.
- **Local comparison.** For any map `W ⟶ Z`, an edge of `Y_W` is `(Y_W ⟶ W)`-coCartesian exactly when its image in Y
  is q-coCartesian. Both maps are coCartesian fibrations, so both conditions are the locally coCartesian ones (§2.3,
  dually), and these are one condition on `Y ×_Z Δ[1] ⟶ Δ[1]` (§1.6). So a map `W ⟶ Y` over Z is special exactly
  when the corresponding section of `Y_W ⟶ W` carries Cartesian edges of `W ⟶ Δ[n]` to `(Y_W ⟶ W)`-coCartesian
  edges. In `Y_W`, equivalences are coCartesian (§1.3, dually), and in a 2-simplex whose first edge is coCartesian,
  the second edge is coCartesian exactly when the long edge is (§1.4, dually).
- **Homotopy extension along a weak equivalence of pairs.** Let `i' : A' ⊆ B'` and `i : A ⊆ W` be monomorphisms over W,
  and `a : A' ⟶ A`, `b : B' ⟶ W` categorical equivalences over W with `i' ≫ b = a ≫ i`. Let `f : A ⟶ Y_W` and
  `g' : B' ⟶ Y_W` be maps over W with `i' ≫ g' = a ≫ f`. Then some `g : W ⟶ Y_W` over W has `i ≫ g = f`, and `b ≫ g`
  and g' are J-homotopic over W. The route: in the localization, put `γ = [b]⁻¹ ≫ [g']`. From `[i'] ≫ [b] = [a] ≫ [i]`
  we get `[i] ≫ [b]⁻¹ = [a]⁻¹ ≫ [i']`, so `[i] ≫ γ = [a]⁻¹ ≫ [a] ≫ [f] = [f]`. Homotopy extension (ModelCategoryTheory,
  Part ModelCategories §3.2, HTT, Prop. A.2.3.1) gives g with `i ≫ g = f` and `[g] = γ`, so `[b ≫ g] = [g']`. B' is
  cofibrant and `Y_W` fibrant, so maps with equal classes are left homotopic (Mathlib `LeftHomotopyRel.iff_map_eq`),
  through every good cylinder (Part ModelCategories §3.1, HTT, Prop. A.2.2.1). `B' × J` is one: `B' × ∂J ⊆ B' × J` is a
  monomorphism, and `B' × J ⟶ B'` is a categorical equivalence (Part InfinityCategoryFoundations §9.3, J ⟶ Δ[0] being a trivial
  fibration).
- **Special lifts.** Fix an edge ē of Z' over an edge `e : s ⟶ s'` of S, and a vertex z̃ of Y' over its source, that
  is, a map `X_s ⟶ Y` over `ē|X_s`. Take `W = X_e`. §6.3 gives `ψ : A₀ ⟵ A₁` and a quasi-equivalence
  `b : M(ψ) ⟶ W`. Both b and its fiber `a : A₀ ⟶ X_s` over 0 are categorical equivalences (§6.2, HTT, Def. 3.2.2.6;
  §6.3, HTT, Prop. 3.2.2.7 (2)).
  - *The model solution.* `M(ψ)` is the pushout of `A₁ × Δ[1] ⟵ A₁ × {0} ⟶ A₀` (§6.1). So a map `g' : M(ψ) ⟶ Y_W`
    over W with `g'|A₀ = a ≫ z̃` is an edge of `Y^{A₁}` with source `A₁ ⟶ A₀ ⟶ Y`, over the edge of `Z^{A₁}` given by
    `A₁ × Δ[1] ⟶ M(ψ) ⟶ W ⟶ Z`. Choose it coCartesian for the coCartesian fibration `Y^{A₁} ⟶ Z^{A₁}`. It is then
    pointwise q-coCartesian (§5.5, HTT, Prop. 3.1.2.1, dually). So g' carries the marked edges `{x} × Δ[1]` of
    `M^♮(ψ)` to `(Y_W ⟶ W)`-coCartesian edges, and the other marked edges, which are degenerate, to degenerate edges.
  - *Transport.* The previous bullet, with `A' = A₀`, `A = X_s` and `f = z̃`, gives `g : W ⟶ Y_W` over W with
    `g|X_s = z̃` and a J-homotopy `H : M(ψ) × J ⟶ Y_W` over W from `b ≫ g` to g'. For a vertex x, H carries `{x} × J`
    into the fiber over `b(x)`, so it gives an equivalence `α_x : g b x ⟶ g' x` of that fiber. For a marked edge
    `m : x ⟶ y`, use the square `m × Δ[1]` in `m × J` along the inverse J-edge. Its 2-simplices are
    `(α_x⁻¹, g b m, d)` and `(g' m, α_y⁻¹, d)`. In the second, g' m and α_y⁻¹ are coCartesian, so d is. In the first,
    α_x⁻¹ and d are coCartesian, so g b m is. So `b ≫ g` carries marked edges to coCartesian edges.
  - *g is special.* A Cartesian edge of W over a degenerate edge of Δ[1] is an equivalence (§1.3), and g carries it to
    an equivalence, which is coCartesian. Let `u : x ⟶ x'` be a Cartesian edge of W over `0 ⟶ 1`. `A₁ ⟶ X_{s'}` is a
    categorical equivalence, so it is essentially surjective: choose a vertex c of A₁ and an equivalence
    `η : b c ⟶ x'` of `X_{s'}`. b carries the marked edge `{c} × Δ[1]` to a Cartesian edge `k : y ⟶ b c` (§6.2). The
    composite `h` of k and η, along a 2-simplex `(k, η, h)`, is Cartesian, η being an equivalence, hence Cartesian (§1.3), and k Cartesian (§1.4). By
    uniqueness of Cartesian lifts with a given target (§1.4), there is a 2-simplex `(ε, h, u)` with `ε : x ⟶ y` an
    equivalence of `X_s`. Apply g. g k is coCartesian by the transport step. In `(g k, g η, g h)` the first edge is
    coCartesian and the second an equivalence, so g h is coCartesian. In `(g ε, g h, g u)` the first edge is an
    equivalence, so g u is coCartesian.

  So g is a special edge of Y' over ē with source z̃.
- **Horns** `Λ[n, i]`, `i < n`. Let `σ₀ : Λ[n, i] ⟶ Y'` lie over `Δ[n] ⟶ Z'`; for `i = 0`, let `n ≥ 2` and let
  `σ₀|Δ^{0,1}` be special. Put `W = X ×_S Δ[n]`. §6.3 gives ψ and a quasi-equivalence `b : M(ψ) ⟶ W`. Both b and its
  restriction `M(ψ)_Λ ⟶ X ×_S Λ`, `Λ = Λ[n, i]`, are categorical equivalences (§6.3, HTT, Prop. 3.2.2.7 (2), with
  `T = Δ[n]` and `T = Λ`). By homotopy extension along a weak equivalence of pairs, with `A' = M(ψ)_Λ` and
  `A = X ×_S Λ`, it suffices to extend the composite `M(ψ)_Λ ⟶ Y_W` over `M(ψ)`: the resulting g restricts to σ₀ on
  `X ×_S Λ`, which is all the horn problem needs. By the pushout computation of §7.1, which uses only `i < n`,
  `M(ψ) = M(ψ)_Λ ⊔_{Aₙ × Λ} Aₙ × Δ[n]`, Aₙ the last term of ψ. So the problem is a horn `Λ[n, i] ⟶ Y^{Aₙ}` over
  `Δ[n] ⟶ Z^{Aₙ}`.
  - For `0 < i < n`, the inner fibration `Y^{Aₙ} ⟶ Z^{Aₙ}` (§5.5) fills it. (Here transport is not needed:
    `X ×_S Λ ⊆ W` is a monic categorical equivalence by §7.1, and `Y_W ⟶ W` is a categorical fibration.)
  - For `i = 0`, the first edge evaluated at a vertex c of Aₙ is the image of a marked edge of `M^♮(ψ)` over
    `Δ^{0,1}`. b carries it to a Cartesian edge of W lying in `X ×_S Δ^{0,1}`, which `σ₀|Δ^{0,1}`, being special,
    carries to a q-coCartesian edge. So the first edge is pointwise coCartesian, hence coCartesian for
    `Y^{Aₙ} ⟶ Z^{Aₙ}` (§5.5), and the horn fills (§1.2, the horn criterion, in the dual form of §1.5).

  So q' is an inner fibration, special edges are q'-coCartesian (§1.2, the horn criterion, dually), and with special
  lifts q' is a coCartesian fibration. This is the "if" half of the edge description.
- **Every q'-coCartesian edge is special.** Let ε be a q'-coCartesian edge over ē, and ε₀ the special lift of ē with
  the same source. Pull back along `ē : Δ[1] ⟶ Z'`. Then `Y'_ē` is an ∞-category, an inner fibration over Δ[1], and
  ε and ε₀ are coCartesian there (Tau Ceti `SSet.Edge.IsCartesian.of_isPullback`, dually). By §1.4 (dually) there
  is a 2-simplex `(ε₀, η, ε)` of `Y'_ē` with η an equivalence over the vertex 1. A 2-simplex of `Y'_ē` with all
  vertices over 1 lies over a degenerate simplex of Δ[1], so η is an equivalence of the fiber
  `Map_Z(X_{s'}, Y)`. That fiber is an ∞-category: it is the fiber over the identity of
  `Fun(X_{s'}, Y_{X_{s'}}) ⟶ Fun(X_{s'}, X_{s'})`, and `Y_{X_{s'}}` is an ∞-category, an inner fibration over the
  ∞-category `X_{s'}`. Evaluation at a vertex x' of `X_{s'}` is a functor to the fiber of `Y_W ⟶ W` over x', so
  `η(x')` is an equivalence of that fiber. The 2-simplex is a map `X ×_S Δ[2] ⟶ Y`, Δ[2] lying over Δ[1] by
  `0 ↦ 0`, `1, 2 ↦ 1`. A Cartesian edge `u : x ⟶ x'` of `X_e` over `0 ⟶ 1` lifts to the 2-simplex `s₁ u` of
  `X ×_S Δ[2]`, whose image is the triangle `(ε₀ u, η(x'), ε u)`. Its first edge is coCartesian and its second an
  equivalence, so ε u is coCartesian. Edges over degenerate edges go to equivalences, as for special lifts. So ε is
  special.
- **The case Z = S.** Let `S ⟶ Z'` be the section corresponding to the projections `X ×_S K ⟶ K ⟶ S`. Then
  `T = Y' ×_{Z'} S`, so `r : T ⟶ S` is a base change of q', hence a coCartesian fibration (Tau Ceti
  `SSet.CartesianFibration.of_isPullback`, dually). An edge of T is r-coCartesian exactly when its image in Y' is
  q'-coCartesian: both maps are coCartesian fibrations, so both conditions are the locally coCartesian ones (§2.3,
  dually), and these are one condition on `Y' ×_{Z'} Δ[1]` (§1.6). So the edge description for T is that for q'.

*Needs:*
- §1.1.1 (HTT, Def. 2.4.2.1); §1.2.1; §1.3.1; §1.4.1; §1.6.1; §2.3.2 (HTT, Prop. 2.4.2.8); Tau Ceti
  `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); §5.3.1; §5.5.3 (HTT, Prop. 3.1.2.1); §6.1.1; §6.2.1 (HTT, Def. 3.2.2.6);
  §6.3.2 (HTT, Prop. 3.2.2.7); §7.1.1 (the pushout computation and inner anodyne base change); §7.4.1 (HTT, Prop.
  3.3.1.7 over an ∞-category base).
- Tau Ceti `SSet.CartesianFibration.of_isPullback`, `SSet.Edge.IsCartesian.of_isPullback`.
- Part InfinityCategoryFoundations §9.3.1 (products with J) and §9.5.1 (the Joyal structure); Part InfinityCategoryFoundations §1.2 (HTT, Notation
  1.2.7.2, functor ∞-categories).
- Mathlib `HomotopicalAlgebra.ModelCategory.over`, `LeftHomotopyRel.iff_map_eq`; ModelCategoryTheory, Part
  ModelCategories §3.1.1 (HTT, Prop. A.2.2.1, homotopies through every good cylinder), §3.2.1 (HTT, Prop. A.2.3.1) and
  §3.3.1 (the model structure over an object).

### Examples

- The coCartesian hypothesis of §7.1 is needed. The nerve of the poset `{0 < 2} ⊔ {1}` maps to Δ[2] by an inner
  fibration that is neither Cartesian nor coCartesian; its pullback to `Λ[2, 1]` is three points, while the nerve has
  two components, so the inner anodyne inclusion `Λ[2, 1] ⊆ Δ[2]` does not pull back to a categorical equivalence.
- For an ∞-category C and any simplicial set K, the projection `C × K ⟶ K` is a categorical fibration (§7.4). For a
  categorical equivalence `A ⟶ B`, taking K = B, §7.5 says that restriction `Fun(B, C) ⟶ Fun(A, C)` is a categorical
  equivalence, which is HTT, Prop. 1.2.7.3 (3) (§3.4).
- For a right fibration `N ⟶ C` over an ∞-category C and an equivalence of ∞-categories `C' ⟶ C`, restriction of
  sections `Map_C(C, N) ⟶ Map_C(C', N)` is a homotopy equivalence of Kan complexes: N is Cartesian (§2.2), hence a
  categorical fibration (§7.4), and §7.5 applies.

### Dependencies

Layers 1–3 and 5–6; Part InfinityCategoryFoundations §1.2, §2.1, §2.3, §5.1, §5.3–5.4, §6.1, §6.4, §7.3, §7.6, §9.1,
§9.3–9.5, §10.2 and §10.5; Tau Ceti's Cartesian fibrations and right fibrations; ModelCategoryTheory, Parts
ModelCategories (§1.3–1.4, §3.1–3.3, §3.5) and KanQuillen (§1.3, §3.2).

## Downstream consumers

This roadmap is used by every later member of the InfinityCategoryTheory family, each of which lists what it uses from it in its own supplier contracts.

## References

- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Cited: §1.1.5 (Def. 1.1.5.14, p. 43); §1.2.2
  (pp. 44–45); §1.2.4–1.2.5 (pp. 51–53); §1.2.7 (Prop. 1.2.7.3, p. 57); §1.2.8 (pp. 58–59); §1.2.9 (Prop. 1.2.9.3,
  p. 61); §1.2.10–1.2.12 (pp. 61–64); §2.0 (Example 2.0.0.2, p. 71); §2.1.1–2.1.4 (pp. 74–89); §2.2.0–2.2.4
  (pp. 90–106); §2.2.5 (pp. 107–112); §2.3.1–2.3.2 (pp. 115–119); §2.4 (pp. 133–161); §3.1 (pp. 165–186); §3.2.2
  (pp. 197–205); §3.3.1 (pp. 223–228); §4.2.1–4.2.2 (pp. 260–265); §4.3.1 (p. 279); §5.1.2 (p. 336); §5.1.3
  (p. 338); §5.4.4 (p. 449); §6.3.5 (p. 634); App. A.1.2 (p. 808); App. A.2.2–A.2.3 (p. 830); App. A.2.4–A.2.6
  (pp. 832–845); App. A.2.7 (pp. 845–847); App. A.3.1 (pp. 869–874); App. A.3.2 (Example A.3.2.22, p. 882).
- **Kerodon.** Jacob Lurie, *Kerodon: an online resource for homotopy-coherent mathematics*,
  [kerodon.net](https://kerodon.net). Cited: §4.5.4, Def. 4.5.4.1 and Prop. 4.5.4.8 (categorical equivalences of simplicial sets through homotopy
  categories of functor ∞-categories), for the form of `IsCategoricalEquivalence`; Def. 4.4.1.4 and Prop. 4.5.6.1
  (categorical fibrations over an ∞-category); Def. 4.5.6.5 (isofibrations).
