# Roadmap: simplicial model categories, enriched diagrams and the Bergner model structure

**Summary.** This Part builds the homotopy theory of enriched categories and of diagrams.

It builds on Part ModelCategories and Part KanQuillen.

- **Monoidal and enriched model categories (Layer 1).** Left Quillen bifunctors and monoidal, enriched and
  simplicial model categories, with a recognition theorem.
- **The injective model structure (Layer 2).** Objectwise generation and the injective model structure on
  diagram categories.
- **Homotopy limits (Layer 3).** Homotopy limits, homotopy colimits and homotopy Kan extensions.
- **Reedy diagrams and realization (Layer 4).** Reedy diagrams compared with injective and projective ones,
  coends, and the realization of simplicial objects.
- **Enriched categories (Layer 5).** The model structure on the category `Cat_S` of small S-enriched categories
  for a combinatorial monoidal model category S (Bergner's model structure for S = simplicial sets), with its
  fibrant objects and fibrations for an excellent S; simplicial sets are excellent.
- **Enriched diagrams (Layer 6).** The projective and injective model structures on enriched diagram categories.

**Headline theorems.**
- Existence of the model structure on `Cat_S` (HTT, Prop. A.3.2.4, p. 876), with its fibrant objects and
  fibrations (HTT, Thm. A.3.2.24, p. 883).
- Simplicial sets are excellent (HTT, Ex. A.3.2.18, p. 881).
- Existence of the projective and injective enriched diagram model structures (HTT, Prop. A.3.3.2, p. 888), and
  their invariance under weak equivalences of the indexing S-enriched category (HTT, Prop. A.3.3.8, p. 890).

## Scope and ownership

Already in the library, and cited rather than planned (see Exact supplier contracts): Mathlib's
model categories, lifting properties, the small object argument, locally presentable categories,
enriched and simplicial categories, the scoped Kan–Quillen cofibrations and fibrations; Tau Ceti's
weak homotopy equivalences, the homotopy category of a simplicial category, the diagonal of a
bisimplicial object, matching maps and hypercovers, unit-graded natural transformations and tensor
products of enriched categories.

Left to other roadmaps: weakly saturated classes, presentable 1-categories, enriched and tensored
categories, model categories, Quillen adjunctions, combinatorial and left proper model categories,
transferred model structures, the projective model structure on ordinary diagrams and the Reedy
model structure are Part ModelCategories'; the Kan–Quillen model structure, `Ex^∞`, homotopy groups
and connectivity of simplicial sets are Part KanQuillen's. No statement of this Part involves the
realization-based weak equivalences of Tau Ceti (the scoped instance in
`TauCeti/AlgebraicTopology/SimplicialSet/WeakEquivalence.lean`). The two classes agree:
GeneralizedCohomology §G2.1 defines the realization weak equivalences (a bijection on components and
isomorphisms on all based homotopy groups of the realization) and proves that they are characterized
by the Kan-group criterion after fibrant replacement, and Part KanQuillen §3.1 proves the same
criterion, with `Ex^∞` as the fibrant replacement, for `SSet.IsWeakHomotopyEquivalence`. Quasicategories, the coherent nerve,
straightening and presentable ∞-categories are later Parts of the InfinityCategoryTheory family.
Chunks, localization and homotopy (co)limits in `Cat_S`, Bousfield localization, Dugger's theorem
and weak exponentials are Part EnrichedLocalization, the next Part of this family.

## Conventions

Locators such as (HTT, Prop. A.3.2.4, p. 876) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.3.2` here and `Part SimplicialCategories §2.3.2` elsewhere,
is one target.

- **∞-categories.** An ∞-category is a quasicategory, Mathlib `SSet.Quasicategory`; this Part meets
  them only in its Downstream consumers.
  Check: the nerve of an ordinary category is an ∞-category (Mathlib
  `CategoryTheory.Nerve.quasicategory`), while `Λ[2,1]` is not one, since its two edges have no
  composite.
- **Model categories.** A model category is Mathlib `HomotopicalAlgebra.ModelCategory`, with
  `cofibrations`, `fibrations`, `weakEquivalences`, `trivialCofibrations`, `trivialFibrations`,
  `IsCofibrant`, `IsFibrant`. A theorem asserting that a model structure exists says that some term
  `M : ModelCategory A` has the prescribed classes, so no second instance is placed on a type; two
  model structures on one category (injective and projective, Reedy, a localization) are compared
  through the identity functor. Weakly saturated classes, the class `weakSaturation` they generate,
  and combinatorial and left proper model categories are Part ModelCategories' (HTT, Def. A.1.2.2,
  Def. A.2.6.1, Def. A.2.4.1): `Suggested.lean` restates `IsWeaklySaturated`, `weakSaturation`,
  `IsCombinatorial` and `IsLeftProper` with the same bodies and docstrings as Part
  ModelCategories, so the two Parts agree.
  Check: on a functor category the injective and projective structures have the same weak
  equivalences but different cofibrations: for `J = [1]` and A simplicial sets, the diagram
  `Δ[0] ⊔ Δ[0] → Δ[0]` is injectively cofibrant and not projectively cofibrant (§2.1), so one
  instance on `J ⥤ A` could not carry both.
- **Kan–Quillen classes.** On simplicial sets the cofibrations are the monomorphisms and the
  fibrations the Kan fibrations (Mathlib's scoped instances in `SSet.modelCategoryQuillen`). The
  weak equivalences are the weak homotopy equivalences, Tau Ceti `SSet.IsWeakHomotopyEquivalence`:
  maps inducing a bijection `π₀ Fun(Y, Z) → π₀ Fun(X, Z)` for every Kan complex Z (Kerodon,
  Definition 3.1.7.12), as in Part KanQuillen. As a class of morphisms this is
  `weakHomotopyEquivalences`, restated from Part KanQuillen with the same one-line body. The model
  structure itself is Part KanQuillen's.
  Check: `Δ[1] → Δ[0]` is a weak homotopy equivalence and `∂Δ[1] → Δ[0]` is not: for
  `Z = Δ[0] ⊔ Δ[0]`, `π₀ Fun(Δ[0], Z)` has two elements and `π₀ Fun(∂Δ[1], Z)` four.
  `Λ[2,1] ⊆ Δ[2]` is a monomorphism and a weak homotopy equivalence, `∂Δ[2] ⊆ Δ[2]` a monomorphism
  and not one.
- **Pushout-products.** For a bifunctor `F : A × B → C` and maps `i : X → X'`, `j : Y → Y'`, the
  pushout-product `i □ j` is the map `F(X', Y) ⊔_{F(X, Y)} F(X, Y') → F(X', Y')`, Mathlib's
  `Functor.PushoutObjObj` with its map `ι`.
  Check: for the product of simplicial sets, `(∅ ⊆ Δ[0]) □ (∂Δ[1] ⊆ Δ[1])` is `∂Δ[1] ⊆ Δ[1]`, and
  `(∂Δ[1] ⊆ Δ[1]) □ (∂Δ[1] ⊆ Δ[1])` is the inclusion of the boundary of the square, with four edges
  and four vertices, into `Δ[1] × Δ[1]`.
- **Enriched categories.** For a monoidal category S, an S-enriched category is Mathlib
  `CategoryTheory.EnrichedCategory S C`, with mapping objects `Map_C(X, Y) = (X ⟶[S] Y)`, and an
  S-enriched functor is Mathlib `CategoryTheory.EnrichedFunctor`. A simplicial category is an
  `SSet`-enriched category. `Cat_S` is the category of S-enriched categories whose objects form a
  type in a fixed universe, with S-enriched functors as morphisms; `∅` is an initial object of S,
  `𝟙_S` its unit and `[0]_S` the S-enriched category with one object and endomorphism object `𝟙_S`.
  Check: an ordinary category is a `Type`-enriched category for the Cartesian product, and its
  enriched functors to another are its functors; a simplicial category with two objects,
  `Map(X, Y) = ∂Δ[1]` and `Map(Y, X) = ∅` has no morphism from Y to X.
- **Size.** S, A and the diagram categories are large; `Cat_S` is formed one universe above the
  object types of its members. For a combinatorial S-enriched model category A, the full
  subcategory `A°` of fibrant-cofibrant objects has objects one universe up, and statements in
  `hCat_S` involving `A°` and a small C are made in that universe, C being lifted.
  Check: for A simplicial sets, `A°` is the simplicial category of Kan complexes, whose objects do
  not form a small type; a one-object small simplicial category lifts to a one-object category with
  the same endomorphism simplicial set.
- **Homotopy categories.** `hA` is the localization of a model category at its weak equivalences and
  `[X]` the image of X. For an S-enriched C, `hC` is the `hS`-enriched category with the objects of C
  and mapping objects `[Map_C(X, Y)]` (change of enrichment along `S → hS`; Part ModelCategories §8.2 (HTT, Rem. A.1.4.3)). For S simplicial sets the underlying category of `hC` is Tau Ceti
  `TauCeti.SimplicialHomotopyCategory`, with morphisms `π₀ Map_C(X, Y)`.
  Check: for C with one object and `Map = ∂Δ[1]`, the endomorphisms of the object in the underlying
  category of `hC` form the two-element set `π₀ ∂Δ[1]`; with `Map = Δ[1]` they form a point.
- **Directions.** For `f : C → C'` the restriction is `f^*`, with left adjoint `f_!` and right
  adjoint `f_*`; adjunctions are written left adjoint first. A homotopy right Kan extension is a map
  `G → f_* F` (equivalently `f^* G → F`).
  Check: for `C` empty and `C'` a point, `f_*` sends the unique diagram to the terminal object and
  `f_!` to the initial object.

## Exact supplier contracts

### From Mathlib

- `HomotopicalAlgebra.ModelCategory` (`Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`), with
  `HomotopicalAlgebra.cofibrations`, `fibrations`, `weakEquivalences`, `trivialCofibrations`,
  `trivialFibrations` (`ModelCategory/CategoryWithCofibrations.lean`), `IsCofibrant`, `IsFibrant`
  (`ModelCategory/IsCofibrant.lean`) and `HomotopicalAlgebra.leftHomotopyClassEquivRightHomotopyClass`.
  Only the axioms of a closed model category are assumed; functorial factorizations are not.
- `CategoryTheory.MorphismProperty.llp`, `rlp` (`MorphismProperty/LiftingProperty.lean`),
  `MorphismProperty.IsSmall`, `MorphismProperty.HasSmallObjectArgument`,
  `MorphismProperty.llp_rlp_of_hasSmallObjectArgument` (`SmallObject/`),
  `MorphismProperty.functorCategory`, `MorphismProperty.monomorphisms`,
  `MorphismProperty.IsStableUnderCobaseChange`, `MorphismProperty.IsStableUnderTransfiniteComposition`,
  `MorphismProperty.IsStableUnderRetracts`, `MorphismProperty.IsStableUnderFilteredColimits`.
- `CategoryTheory.IsLocallyPresentable` (`Presentable/LocallyPresentable.lean`).
- `CategoryTheory.Functor.PushoutObjObj` (`Limits/Shapes/Pullback/PullbackObjObj.lean`) for
  pushout-products; `CategoryTheory.MonoidalCategory.curriedTensor`; `CategoryTheory.MonoidalClosed`;
  `CategoryTheory.CartesianMonoidalCategory`.
- `CategoryTheory.EnrichedCategory`, `EnrichedFunctor`, `EnrichedFunctor.comp`,
  `EnrichedOrdinaryCategory`, `eHomEquiv`, `ForgetEnrichment` (`CategoryTheory/Enriched/`), and the
  instance `EnrichedFunctor.category` (`Enriched/Basic.lean`), whose morphisms are the natural
  transformations of underlying ordinary functors; it is not the diagram category of §2.1.
  `CategoryTheory.SimplicialCategory` with its instance on `SSet`, `SimplicialThickening`,
  `SimplicialNerve`. `CategoryTheory.TransportEnrichment` and `enrichedCategoryTypeOfCategory`
  (`Enriched/Basic.lean`), `CategoryTheory.Codiscrete` (`CodiscreteCategory.lean`), `ULiftHom`,
  `Limits.colimConstAdj` and `Functor.Monoidal.ofChosenFiniteProducts`: an ordinary category with
  discrete mapping simplicial sets, from which `[1]_S` and `[1]^∼_S` are built for S simplicial sets
  (§5.6).
- `CategoryTheory.Functor.lan`, `Functor.ran`, `Functor.IsLeftKanExtension` (pointwise over comma
  categories), `Functor.EssSurj`, `Limits.HasStrictInitialObjects`.
- `CategoryTheory.LocalizerMorphism` and `LocalizerMorphism.IsLocalizedEquivalence`
  (`Localization/LocalizerMorphism.lean`): a functor compatible with classes of weak equivalences
  and the condition that it induces an equivalence of localizations.
- `CategoryTheory.LocalizedMonoidal`, `Localization.Monoidal.toMonoidalCategory` and
  `MorphismProperty.IsMonoidal` (`Localization/Monoidal/Basic.lean`): the monoidal homotopy
  category `hS`, along which `TransportEnrichment` forms `hC` (§5.1).
- `HomotopicalAlgebra.ReedyStructure` and `SimplexCategory.reedyStructure`.
- Simplicial sets: `SSet.KanComplex`, `SSet.anodyneExtensions`, `SSet.anodyneExtensions_pushoutObjObjι`
  (the pushout-product of a monomorphism and an anodyne extension is anodyne), and the scoped
  `SSet.modelCategoryQuillen` cofibrations and fibrations with their generating sets
  `SSet.modelCategoryQuillen.I` (boundary inclusions) and `SSet.modelCategoryQuillen.J` (horn
  inclusions).

### From Tau Ceti

- `SSet.IsWeakHomotopyEquivalence` (`TauCeti/AlgebraicTopology/SimplicialSet/WeakHomotopyEquivalence.lean`),
  with two out of three: the weak equivalences of simplicial sets throughout.
- `SSet.rlp_monomorphisms_iff` (`SimplicialSet/TrivialFibration.lean`) and `SSet.IsWeaklyContractible`
  (`SimplicialSet/WeaklyContractible.lean`).
- `CategoryTheory.EnrichedCat.category` (`TauCeti/CategoryTheory/Enriched/EnrichedCat.lean`): the
  ordinary category of `V`-enriched categories and `V`-functors, the carrier of `Cat_S`.
- `TauCeti.SimplicialHomotopyCategory` and `CategoryTheory.EnrichedFunctor.mapHomotopyCategory`
  (`TauCeti/AlgebraicTopology/SimplicialCategory/HomotopyCategory.lean`): the homotopy category of a
  simplicial category and the functor induced by a simplicial functor. Tau Ceti's
  `CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence` (`SimplicialCategory/DwyerKan.lean`) tests
  mapping simplicial sets with the realization-based class and is not used (§5.1).
- `TauCeti.UnitGradedNatTrans`, `TauCeti.UnitGradedNatTrans.comp`, `TauCeti.UnitGradedNatTrans.id`
  (`CategoryTheory/Enriched/NaturalTransformation.lean`): enriched natural transformations, their
  composition and identities, the morphisms of the diagram category of §2.1;
  `TauCeti.tensorEnrichedCategory` (`CategoryTheory/Enriched/TensorProduct.lean`): the tensor product
  `C ⊗ D` of S-enriched categories.
- `CategoryTheory.SimplicialObject.diag` (`TauCeti/AlgebraicTopology/SimplicialObject/Bisimplicial.lean`):
  the diagonal of a bisimplicial object; `CategoryTheory.SimplicialObject.matchingMap`
  (`SimplicialObject/Matching.lean`) and `CategoryTheory.SimplicialObject.IsHypercover`
  (`SimplicialObject/Hypercover.lean`): matching maps and hypercovers (§4.5).

### From TauCetiRoadmap.ModelCategoryTheory.ModelCategories

Part ModelCategories supplies: weakly saturated classes and the small object argument
(HTT, Def. A.1.2.2, Prop. A.1.2.5 (1)); presentable categories and κ-compact objects (HTT, Def. A.1.1.1,
A.1.1.2); enriched, tensored and cotensored categories and change of enrichment (HTT, Rem. A.1.4.3,
the definitions before Ex. A.1.4.5); trees and good trees (HTT, Def. A.1.5.1, Notation A.1.5.2,
Rem. A.1.5.5, Lemmas A.1.5.6, A.1.5.11, Cor. A.1.5.13); model categories, homotopy categories and homotopy
relations (HTT, Def. A.2.1.1, Prop. A.2.2.1, Prop. A.2.3.1); left properness and homotopy pushouts
(HTT, Def. A.2.4.1, Prop. A.2.4.2, homotopy pushout squares, §A.2.4, p. 833, Prop. A.2.4.4); Quillen
adjunctions and equivalences (HTT, §A.2.5, Prop. A.2.5.1); combinatorial model categories, perfect
and accessible classes, Smith's recognition theorem and transfer (HTT, Def. A.2.6.1, Cor. A.2.6.7,
A.2.6.8, A.2.6.10, A.2.6.12, A.2.6.15); the classes of Def. A.2.8.1 and the projective model
structure on `Fun(C, A)` (HTT, Def. A.2.8.1, Prop. A.2.8.2, projective assertion, Lemma A.2.8.10);
Reedy categories, latching and matching objects, good filtrations, coends and the Reedy model
structure (HTT, Def. A.2.9.1, Ex. A.2.9.5, A.2.9.6, Notation A.2.9.7, Ex. A.2.9.8, Notation A.2.9.11,
Rem. A.2.9.12, Prop. A.2.9.19, the coend construction after Cor. A.2.9.25).

### From TauCetiRoadmap.ModelCategoryTheory.KanQuillen

Part KanQuillen supplies the Kan–Quillen model structure on simplicial sets with the weak homotopy
equivalences (HTT, §A.2.7; Kerodon, Prop. 3.3.7.6, Cor. 3.3.7.7): anodyne maps are the
monomorphisms that are weak homotopy equivalences, trivial fibrations the Kan fibrations that are
weak homotopy equivalences, combinatorial generation by boundary and horn inclusions, stability
under filtered colimits, left and right properness, `Ex^∞`, homotopy groups, the long exact sequence
and n-connective maps with their closure under composition and homotopy pushouts. Below, "Part
KanQuillen (the model structure)" cites this package.

## How to read the build

Layer 1 defines left Quillen bifunctors and monoidal, enriched and simplicial model categories.
Layers 2–4 work with diagrams in one model category: the injective structure, homotopy Kan
extensions, Reedy comparisons, realization and diagonals. Layer 5 constructs the model structure on
`Cat_S` and describes its fibrations; Layer 6 constructs the enriched diagram structures.

## Layer 1: Monoidal and enriched model categories

### 1.1 Left Quillen bifunctors

**1.1.1.** Define a left Quillen bifunctor `F : A × B → C` relative to classes of cofibrations and weak
equivalences on A, B and C: F preserves small colimits in each variable separately, and for
cofibrations `i : X → X'` of A and `j : Y → Y'` of B the pushout-product `i □ j` is a cofibration
of C, which is moreover a weak equivalence when i or j is a trivial cofibration (HTT, Def. A.3.1.1,
p. 869; `IsLeftQuillenBifunctor`, which takes the six classes as arguments). Only these classes
enter, so the notion applies to simplicial sets with the Kan–Quillen classes before their model
structure is built.

- For a left Quillen bifunctor and a cofibrant X of A, `F(X, −)` is a left Quillen functor from B to
  C (take i to be `∅ → X`), and dually for a cofibrant Y of B.
- Left Quillen bifunctors are stable under swapping the two variables.

**Checks.**

- The product of simplicial sets, with the monomorphisms as cofibrations and the isomorphisms as
  weak equivalences on the target, satisfies the cofibration clause (pushout-products of
  monomorphisms are monomorphisms) but not the triviality clause:
  `(∅ ⊆ Δ[0]) □ (Δ{0} ⊆ Δ[1]) = (Δ{0} ⊆ Δ[1])` is not an isomorphism. A definition omitting the
  triviality clause would accept it.
- The constant bifunctor at `Δ[0]` on simplicial sets has every pushout-product equal to the
  identity of `Δ[0]`, a trivial cofibration, but it does not preserve the empty colimit in either
  variable; a definition omitting the colimit clause would accept it.
- For `i = (Δ{0} ⊆ Δ[1])` and `j = (∅ ⊆ Δ[0])`, `i □ j = (Δ{0} ⊆ Δ[1])` is a trivial cofibration, while `F(i, j) = (∅
  → Δ[1])` is not a weak equivalence: a definition using `F(i, j) : F(X, Y) → F(X', Y')` in place of the
  pushout-product would reject the product of simplicial sets. (For `i = j = (∂Δ[1] ⊆ Δ[1])` both tests accept it,
  since `∂Δ[1] × ∂Δ[1] → Δ[1] × Δ[1]` is a monomorphism too.)

*Needs:* Mathlib `Functor.PushoutObjObj`, `MorphismProperty`; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1).

### 1.2 Monoidal model categories and the product of simplicial sets

**1.2.1.** Define a monoidal model category: a monoidal category S with a model structure such that the tensor
product is a left Quillen bifunctor, the unit `𝟙_S` is cofibrant and the monoidal structure is
closed on both sides (HTT, Def. A.3.1.2, p. 869). Right-closedness is Mathlib's `MonoidalClosed` on
the monoidal opposite; for a braided S it follows from left-closedness.

- The homotopy category `hS` of a monoidal model category is monoidal, and the localization
  `S → hS` is monoidal on cofibrant objects.
- Every S-enriched category C has an `hS`-enriched homotopy category `hC` (Conventions;
  `EnrichedHomotopyCategory`, over `HomotopyMonoidal`, when the weak equivalences are stable under
  tensoring with an object).

**Checks.**

- Chain complexes of abelian groups with the tensor product and the injective model structure
  (cofibrations the monomorphisms, weak equivalences the quasi-isomorphisms) have a cofibrant unit
  ℤ, and `ℤ ⊗ −` is the identity, but for `i = (ℤ → ℤ)`, multiplication by 2 in degree 0, and
  `j = (0 → ℤ/2)`, `i □ j` is the zero map `ℤ/2 → ℤ/2`, not a monomorphism. A definition testing the
  bifunctor clause only on the unit would accept this structure; simplicial sets with the Cartesian
  product and the Kan–Quillen structure pass the full clause (HTT, Ex. A.3.1.4, p. 869).
- Simplicial sets with the coproduct as tensor product have the cofibrant unit `∅`, but `X ⊔ −`
  sends the initial object to X, so the tensor is not a left Quillen bifunctor and the coproduct
  structure is not a monoidal model structure.
- Sets with the model structure whose weak equivalences and fibrations are all maps and whose
  cofibrations are the isomorphisms, with the Cartesian product, satisfy the bifunctor clause (a
  pushout-product of isomorphisms is an isomorphism) but not the unit clause: `∅ → {∗}` is not an
  isomorphism, so `{∗}` is not cofibrant.

*Needs:* §1.1.1; Mathlib `MonoidalClosed`; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1).

**1.2.2.** Prove that the Cartesian product of simplicial sets is a left Quillen bifunctor for the
monomorphisms and the weak homotopy equivalences, so that simplicial sets form a monoidal model
category, closed by the internal mapping object (HTT, Ex. A.3.1.4, p. 869;
`isLeftQuillenBifunctor_curriedTensor_sSet`). The product preserves colimits in each variable
because simplicial sets are Cartesian closed; the pushout-product of monomorphisms is a
monomorphism; and the pushout-product of a monomorphism with an anodyne extension is anodyne
(Mathlib `SSet.anodyneExtensions_pushoutObjObjι`), hence a weak homotopy equivalence.

*Needs:* §1.1.1, §1.2.1; Mathlib `SSet.anodyneExtensions_pushoutObjObjι`,
`CartesianMonoidalCategory`, `MonoidalClosed`; Part KanQuillen (the model structure).

**1.2.3.** Prove that simplicial sets with the Kan–Quillen structure and the Cartesian product are
combinatorial, have weak equivalences stable under filtered colimits, have the monomorphisms as
cofibrations, stable under products, and have the product as a left Quillen bifunctor
(HTT, Ex. A.3.1.4, p. 869, and the first part of Ex. A.3.2.18, p. 881). These are conditions (A1)–(A4)
of §5.6, and §5.6–§5.7 cite this statement for them. The route collects the statements of Part
KanQuillen and §1.2.2.

*Needs:* §1.2.2; Part KanQuillen §3.3.1 (combinatorial generation and filtered
colimits); Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1).

### 1.3 Enriched and simplicial model categories

**1.3.1.** Define, for a monoidal model category S, an S-enriched model category: an S-enriched category A with
a model structure on its underlying category such that A is tensored and cotensored over S and the
tensor `⊗ : A × S → A` is a left Quillen bifunctor (HTT, Def. A.3.1.5, p. 869). For S simplicial
sets this is a simplicial model category.

- For a cofibrant X and a fibrant Y of a simplicial model category, `Map_A(X, Y)` is a Kan complex
  and its set of components is `Hom_hA(X, Y)` (HTT, Rem. A.3.1.8, p. 872).
- By adjunction, the condition on the tensor is equivalent to: for a cofibration `i : X → X'` and a
  fibration `p : Y → Y'`, the map `Map(X', Y) → Map(X, Y) ×_{Map(X, Y')} Map(X', Y')` is a
  fibration of S, trivial when i or p is (HTT, Rem. A.3.1.6, pp. 869–870). In particular, for a
  fibrant Z, `Map(−, Z)` carries trivial cofibrations to trivial fibrations, hence (Ken Brown's
  lemma) weak equivalences between cofibrant objects to weak equivalences of S.
- For S-enriched model categories C, D, a Quillen adjunction `F ⊣ G` of underlying categories and
  an S-enriched structure on G, the enrichment of G determines natural maps
  `β_{X,K} : K ⊗ F(X) → F(K ⊗ X)` for X in C and K in S, and G's enrichment can be recovered from
  them (HTT, the construction after Rem. A.3.1.8, p. 872).

**Checks.**

- Simplicial sets are a simplicial model category over themselves, with `Map(X, Y)` the internal
  mapping object; for `X = Δ[0]`, `Map(Δ[0], Y) = Y`, a Kan complex exactly when Y is fibrant, as
  the first bullet predicts.
- Simplicial sets with the model structure whose weak equivalences are the isomorphisms and whose
  cofibrations and fibrations are all maps, tensored by the product, are not a simplicial model
  category: for `i = (∅ → Δ[0])` and the Kan–Quillen trivial cofibration `j = (Δ{0} ⊆ Δ[1])`,
  `i □ j = j` is not an isomorphism. A definition asking the tensor to be left Quillen only in the
  model-category variable would accept it, since there every map is a cofibration.
- For cofibrant X, `X ⊔ X = X ⊗ ∂Δ[1] → X ⊗ Δ[1]` is a cofibration and `X ⊗ Δ[1] → X` a weak
  equivalence, so `X ⊗ Δ[1]` is a cylinder object; for A simplicial sets and `X = Δ[0]` this is the
  cylinder `∂Δ[1] ⊆ Δ[1] → Δ[0]`.

*Needs:* §1.1.1, §1.2.1, §1.2.2; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part
ModelCategories §8.2.2 (HTT, the definitions of tensored and cotensored categories before Ex. A.1.4.5),
§3.1.1 (HTT, Prop. A.2.2.1, for `π₀ Map = Hom_h`), §4.1.1 (HTT, §A.2.5, for Ken Brown's lemma).

### 1.4 Recognizing simplicial model categories

**1.4.1.** Prove that for a simplicial category C with a model structure (not assumed compatible), in which
every object is cofibrant and weak equivalences are stable under filtered colimits, the tensor
`C ⊗ −` sends weak equivalences of simplicial sets to weak equivalences of C, provided C is tensored
and cotensored, the pushout-product of a monomorphism of simplicial sets with a cofibration of C is
a cofibration, and every projection `C ⊗ Δ[n] → C` is a weak equivalence (HTT, Prop. A.3.1.7, proof,
the step for `C ⊗ −`, pp. 870–871). Route: a weak equivalence `K → K'` factors through
`K → K' × K''` with `K → K''` a monomorphism into a contractible Kan complex, reducing to trivial
cofibrations; the monomorphisms carried to weak equivalences form a weakly saturated class, and it
contains each horn inclusion by induction on dimension, comparing through a vertex and two out of
three.

*Needs:* §1.3.1; Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2), §8.2.2 (HTT, the definitions before
Ex. A.1.4.5); Part KanQuillen (the model structure).

**1.4.2.** Prove that under the same hypotheses `− ⊗ K` preserves weak equivalences of C for every simplicial
set K (HTT, Prop. A.3.1.7, proof, the step for `− ⊗ K`, p. 871). Route: fix a weak equivalence g of
C and induct on the dimension of K; Zorn's lemma on subcomplexes L with `g ⊗ L` a weak equivalence
(chains are handled by stability under filtered colimits); attaching a nondegenerate simplex is a
homotopy pushout in the left proper C, and `g ⊗ Δ[n]` is a weak equivalence by the condition on
projections and two out of three.

*Needs:* the setting of §1.4.1 (not its conclusion); Part
ModelCategories §3.4.1 (HTT, Def. A.2.4.1, Prop. A.2.4.2), §3.5.1 (HTT, homotopy pushout
squares, §A.2.4, p. 833), §3.5.2 (HTT, Prop. A.2.4.4).

**1.4.3.** Prove the recognition theorem: under the same hypotheses, C is a simplicial model category exactly
when it is tensored and cotensored over simplicial sets, the pushout-product of a monomorphism of
simplicial sets with a cofibration of C is a cofibration, and every projection `C ⊗ Δ[n] → C` is a
weak equivalence (HTT, Prop. A.3.1.7, p. 870). Route: the forward direction uses that
`Δ[0] → Δ[n]` is a trivial cofibration and the left Quillen bifunctor axiom; for the converse the
§1.4.1 and §1.4.2 show that `i □ j` is a weak equivalence when i or j is trivial, through the
left properness of C (every object is cofibrant).

*Needs:* §1.1.1, §1.3.1, §1.4.1, §1.4.2; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT,
Def. A.2.1.1); Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2), §3.4.1 (HTT, Def. A.2.4.1,
Prop. A.2.4.2), §3.5.1 (HTT, homotopy pushout squares, §A.2.4, p. 833); Part KanQuillen (the model
structure).

### Examples

- Simplicial sets form a monoidal model category and a simplicial model category over themselves
  (§1.2, §1.3).
- For a simplicial model category A and any simplicial set K, `X ↦ X ⊗ K` preserves weak
  equivalences between cofibrant objects; when every object is cofibrant (§1.4), it preserves all
  weak equivalences.
- For `K = Δ[0]` the comparison map `β_{X,Δ[0]}` of §1.3 is an isomorphism, the base case of the
  route in §5.9.

### Dependencies

Mathlib model categories, pushout-products and enriched categories; Tau Ceti's weak homotopy
equivalences; Part ModelCategories (weakly saturated classes, tensored categories, model
categories, left properness, combinatorial model categories); Part KanQuillen (the Kan–Quillen
model structure and its properties).

## Layer 2: Objectwise generation and the injective model structure

### 2.1 Enriched diagram categories and their classes

**2.1.1.** Define, for a small S-enriched category C and a combinatorial S-enriched model category A, the
diagram category `A^C`: a type synonym of `EnrichedFunctor S C A` (Mathlib's instance
`EnrichedFunctor.category` on that type has the transformations of underlying ordinary functors as
morphisms), with the S-enriched natural transformations, Tau Ceti `TauCeti.UnitGradedNatTrans`, as
morphisms, composed by `TauCeti.UnitGradedNatTrans.comp`. For S = A = simplicial sets this is
`SSetDiagram C`, whose category axioms are `unitComp_id_left`, `unitComp_id_right` and
`unitComp_assoc`, with components `SSetDiagram.app` and restriction along a simplicial functor built
from `whiskerUnit`. In `A^C` define five classes of maps `F → G`:
injective cofibrations, projective fibrations and weak equivalences are the maps with every
component `F(C) → G(C)` a cofibration, fibration or weak equivalence of A; injective fibrations are
the maps with the right lifting property against injective cofibrations that are weak equivalences,
and projective cofibrations those with the left lifting property against projective fibrations that
are weak equivalences (HTT, Def. A.3.3.1, p. 888).

- `A^C` is again enriched, tensored and cotensored over S, with tensors and cotensors computed
  objectwise (HTT, Rem. A.3.3.4, p. 888).
- For S the category of sets with the Cartesian product and an ordinary category C, `A^C` is the
  functor category `Fun(C, A)` and the five classes are those of Part ModelCategories §7.1
  (HTT, Def. A.2.8.1).

**Checks.**

- For C the empty S-enriched category, `A^C` is the terminal category and all five classes contain
  its only map; a definition by "some component" in place of "every component" would leave the
  identity of the empty diagram outside the weak equivalences.
- For C = `[0]_S`, `A^C` is A and the five classes are the cofibrations, fibrations, weak
  equivalences, fibrations and cofibrations of A; a definition of injective fibrations as objectwise
  fibrations would agree here but differ on `[1]`, where an injective fibration `F → G` must also
  make `F(0) → F(1) ×_{G(1)} G(0)` a fibration.
- For C = `[1]` (two objects and one non-identity map), A simplicial sets and S sets, the diagram
  `F = (Δ[0] ⊔ Δ[0] → Δ[0])` has cofibrant values, so `∅ → F` is an injective cofibration; it is not
  a projective cofibration, because a projectively cofibrant diagram on `[1]` has `F(0) → F(1)` a
  cofibration and `Δ[0] ⊔ Δ[0] → Δ[0]` is not a monomorphism. A definition of projective
  cofibrations as objectwise cofibrations would accept it.

*Needs:* §1.3.1; Tau Ceti `TauCeti.UnitGradedNatTrans`, `TauCeti.UnitGradedNatTrans.comp`,
`TauCeti.UnitGradedNatTrans.id`; Mathlib `EnrichedFunctor`; Mathlib `HomotopicalAlgebra.ModelCategory`
(HTT, Def. A.2.1.1); Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1), §7.1.1 (HTT, Def. A.2.8.1).

### 2.2 Compact objects of diagram categories

**2.2.1.** Prove that for a κ-accessible category A, enriched, tensored and cotensored over S, and a small
S-enriched category C with fewer than κ objects whose cotensors `A ↦ A^{Map_C(X, Y)}` preserve
κ-filtered colimits, the diagram category `A^C` is κ-accessible and an object F is κ-compact exactly
when each `F(C)` is κ-compact in A (HTT, Lemma A.3.3.3, proof, condition (iv), p. 896). Route: the
ordinary-category proof of the ∞-categorical statement HTT Prop. 5.4.4.3 carries over: colimits in
`A^C` are objectwise, evaluation has a left adjoint built from tensors with mapping objects, and
compactness transfers through these adjoints.

*Needs:* §2.1.1; Part ModelCategories §1.1.1 (HTT, Def. A.1.1.1), §1.2.1 (HTT, Def. A.1.1.2).

### 2.3 Slices

**2.3.1.** Fix, for the proof in §2.4, a presentable A enriched, tensored and cotensored over a presentable S,
a small C, a small set `S₀` of morphisms of A with κ-compact sources and targets, a regular κ as in
§2.2, a map `f : F → G` of `A^C`, and for every object C a κ-good `S₀`-tree `{Y(C)_α}_{α ∈ A(C)}`
from `F(C)` to `G(C)`. Define a slice to be a family of downward-closed subsets `B(C) ⊆ A(C)`
together with structure maps `∐_{C'} Y(C')_{B(C')} ⊗ Map_C(C', C) → Y(C)_{B(C)}` that make
`C ↦ Y(C)_{B(C)}` an S-enriched functor between F and G; a slice is κ-small when each `B(C)` is,
and two slices are compatible when their structure maps agree on the intersection (HTT, Lemma
A.3.3.3, proof, the definition of slices, pp. 897–899). The structure maps are data, so a slice is a
structure, not a predicate.

**Checks.**

- For C = `[0]_S` a slice is a downward-closed subset of the tree, the structure map being forced;
  a subset that is not downward closed carries no stage `Y_B`, so it is not a slice.
- For C empty there is exactly one slice, the empty family.
- The family `B(C) = ∅` is a slice with stages `F(C)`, and `B(C) = A(C)` one with stages `G(C)`; for
  a nonempty C, a family that is downward closed objectwise but whose stages are not carried into
  each other by `Map_C(C', C)` is not a slice, which a definition by subsets alone would accept.

*Needs:* §2.1.1, §2.2.1 (the choice of κ); Part ModelCategories §2.1.1 (HTT, Def. A.1.5.1, Notation
A.1.5.2), §2.4.1 (HTT, Cor. A.1.5.13, the κ-good trees).

**2.3.2.** Prove that every family of κ-small subsets `B₀(C) ⊆ A(C)` is contained in a κ-small slice
(HTT, Lemma A.3.3.15, p. 897). Route: enlarge to downward-closed sets, then use κ-compactness of the
partial trees to factor each composite through a κ-small stage, and iterate countably many times.

*Needs:* §2.3.1; Part ModelCategories §1.1.1 (HTT, Def. A.1.1.1),
§2.1.1 (HTT, Notation A.1.5.2).

**2.3.3.** Prove that for a slice `M'` on `{A'(C)}` and κ-small subsets `B₀(C)`, there is a κ-small slice N on
sets `B(C) ⊇ B₀(C)` such that `{B(C) ∩ A'(C)}` carries a slice `N'` compatible with both N and `M'`
(HTT, Lemma A.3.3.16, p. 899). Route: alternate stages; in one stage, given κ-small slices
`N_{i−1}` and `N'_{i−1}` with `B'_{i−1}(C) ⊆ B_{i−1}(C) ∩ A'(C)`, apply §2.3.2 to the
enlarged index sets, once inside `A'` and once in `A`, to get κ-small slices `N_i` and `N'_i` enlarging
them, with `B_{i−1}(C) ∩ A'(C) ⊆ B'_i(C) ⊆ A'(C)`, `N'_i` compatible with `M'`, and the structure maps
of successive stages compatible (HTT, Lemma A.3.3.16, proof, conditions (a)–(e), pp. 899–900). The union
of the countably many stages is κ-small because κ is uncountable.

*Needs:* §2.3.1, §2.3.2.

### 2.4 Objectwise saturated classes are generated by sets

**2.4.1.** Prove that if each component `f(C) : F(C) → G(C)` of a map f of `A^C` is a pushout of a member of
`S₀`, then f is a pushout of a member of the set S of injective cofibrations between κ-compact
objects lying objectwise in the class generated by `S₀` (HTT, Lemma A.3.3.17, p. 901). Route: write
F as a κ-filtered colimit of κ-compact diagrams (§2.2), choose a single stage through which every
attaching map and its compatibilities factor (C has fewer than κ objects), and push out from there.

*Needs:* §2.2.1; the setting of §2.3.1; Part ModelCategories §1.1.1 (HTT, Def. A.1.1.1).

**2.4.2.** Prove that for a presentable A enriched, tensored and cotensored over a presentable S, a small set
`S₀` of morphisms of A with generated weakly saturated class `S̄₀`, and a small S-enriched C, the
class of maps of `A^C` whose components all lie in `S̄₀` is the weakly saturated class generated by a
small set of maps of `A^C` (HTT, Lemma A.3.3.3, p. 888). Route: choose κ as in §2.2 with `S₀`
between κ-compact objects, and let S be the injective cofibrations between κ-compact objects lying
objectwise in `S̄₀`; given a map lying objectwise in `S̄₀`, write each component as a transfinite
composite of pushouts of `S₀` by a κ-good tree (Part ModelCategories), and build by transfinite
induction, with the slices of §2.3, a filtration of the map whose steps are objectwise pushouts of
members of `S₀`; each step is a pushout of a member of S by §2.4.1.

*Needs:* §2.2.1, §2.3.1–§2.3.3, §2.4.1; Part
ModelCategories §1.1.1 (HTT, Def. A.1.1.1), §1.2.1 (HTT, Def. A.1.1.2), §1.3.1 (HTT, Def. A.1.2.2,
Rem. A.1.2.4), §2.1.1 (HTT, Notation A.1.5.2), §2.2.1 (HTT, Rem. A.1.5.5, Lemma A.1.5.6), §2.3.1 (HTT,
Lemma A.1.5.11), §2.4.1 (HTT, Cor. A.1.5.13), §8.2.2 (HTT, the definitions before Ex. A.1.4.5).

### 2.5 Ordinary diagrams

**2.5.1.** Prove that for a presentable category A, a small category C and a small set `S₀` of morphisms of A
generating the weakly saturated class `S̄₀`, the maps of `Fun(C, A)` lying objectwise in `S̄₀` form
the weakly saturated class generated by a small set (HTT, Lemma A.2.8.3, p. 848;
`exists_isSmall_weakSaturation_eq_functorCategory`). Route: the case of §2.4 with S the category of sets.
The Lean statement uses `weakSaturation`.

*Needs:* §2.4.2; Part ModelCategories §1.2.1 (HTT, Def. A.1.1.2), §1.3.1 (HTT, Def. A.1.2.2,
Rem. A.1.2.4); Mathlib `MorphismProperty.functorCategory`.

### 2.6 The injective model structure

**2.6.1.** Prove that for a combinatorial model category A and a small category C, `Fun(C, A)` carries a
combinatorial model structure, the injective model structure, whose cofibrations are the injective
cofibrations and whose weak equivalences are the objectwise weak equivalences; its fibrations are
the injective fibrations (HTT, Prop. A.2.8.2, injective assertion, p. 848;
`exists_injectiveModelCategory`). Route: apply Smith's recognition theorem; the injective
cofibrations are generated by a set by §2.5 applied to generating cofibrations, the trivial ones by
§2.5 applied to generating trivial cofibrations, objectwise weak equivalences are perfect, and maps
with the right lifting property against injective cofibrations are trivial projective fibrations by
the projective structure.

*Needs:* §2.2.1 (for κ-accessibility of `Fun(C, A)`), §2.5.1; Part ModelCategories §1.3.1 (HTT,
Def. A.1.2.2), §6.1.2 (HTT, Cor. A.2.6.8), §6.3.1 (HTT, Prop. A.2.6.10), §7.1.1 (HTT, Def. A.2.8.1), §7.2.1
(HTT, Prop. A.2.8.2, projective assertion).

**2.6.2.** Prove that for a combinatorial A and a small C both the projective and the injective model
structures exist on `Fun(C, A)` with the objectwise weak equivalences, so that the identity is a
left Quillen equivalence from the projective to the injective structure (HTT, Prop. A.2.8.2,
p. 848). Route: combine §2.6.1 with the projective structure; every projective
cofibration is an injective cofibration.

*Needs:* §2.6.1; Part ModelCategories §7.2.1 (HTT, Prop. A.2.8.2, projective
assertion), §4.1.1–§4.2.1 (HTT, §A.2.5).

### Examples

- For C discrete, the projective and injective structures on `Fun(C, A)` coincide with the product
  model structure.
- For C = `[1]` and A simplicial sets, the injective cofibrations are the maps of arrows with
  monomorphic components, while `∅ → (Δ[0] ⊔ Δ[0] → Δ[0])` is an injective cofibration that is
  not a projective one (§2.1).
- For C empty, both structures are the unique model structure on the terminal category.

### Dependencies

Layer 1; Tau Ceti unit-graded natural transformations; Part ModelCategories (presentable categories,
weakly saturated classes and trees, Smith's theorem, the projective structure).

## Layer 3: Homotopy limits and homotopy Kan extensions

### 3.1 Restriction functors are Quillen

**3.1.1.** Prove that for a combinatorial model category A and a functor `f : C → C'` of small categories,
`(f_!, f^*)` is a Quillen adjunction of projective structures and `(f^*, f_*)` a Quillen adjunction
of injective structures (HTT, Prop. A.2.8.7, p. 851). Route: `f^*` preserves objectwise weak
equivalences, projective fibrations and injective cofibrations; apply the right-adjoint and
left-adjoint criteria for Quillen adjunctions. Mathlib's `Functor.lan` and `Functor.ran` supply the
adjoints.

*Needs:* §2.6.1; Mathlib `Functor.lan`, `Functor.ran`; Part ModelCategories §4.1.1 (HTT, §A.2.5), §6.1.1
(HTT, Def. A.2.6.1), §7.1.1 (HTT, Def. A.2.8.1), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion).

### 3.2 Homotopy Kan extensions, homotopy limits and homotopy colimits

**3.2.1.** Define, for a combinatorial A, a functor `f : C → C'` of small categories, `F` in `Fun(C, A)`, `G` in
`Fun(C', A)` and `η : G → f_* F`: η exhibits G as a homotopy right Kan extension of F when for some
(equivalently every) objectwise weak equivalence `F → F'` with `F'` injectively fibrant, the
composite `G → f_* F → f_* F'` is an objectwise weak equivalence. For C' the one-object category, a
cone `α` from the constant diagram at an object X to F exhibits X as a homotopy limit of F when it
exhibits X as a homotopy right Kan extension; homotopy left Kan extensions and homotopy colimits
are dual, with projectively cofibrant replacements `F' → F` and `f_!` (HTT, the definitions after
Prop. A.2.8.7, p. 851).

- Independence of the choice of `F'`: `f_*` is right Quillen for the injective structures (§3.1),
  so it preserves weak equivalences between injectively fibrant objects.
- A homotopy right Kan extension of F need not exist, but it exists after replacing F by a weakly
  equivalent diagram; for injectively fibrant F the identity of `f_* F` is one (HTT, Rem. A.2.8.8,
  p. 851).
- A cone `α : X → lim F` exhibits X as a homotopy limit exactly when the induced map in `hA` is the
  derived limit.

**Checks.**

- For C empty and C' a point, the homotopy limit of the empty diagram is a fibrant replacement of
  the terminal object: any X with `X → ∗` a weak equivalence qualifies; the ordinary limit
  definition would accept only the terminal object up to isomorphism.
- For A simplicial sets and C = `{0 → 2 ← 1}` with the diagram `Δ[0] → Δ[0] ← Δ[0]`, any contractible
  Kan complex is a homotopy pullback, while for `Δ[0] → S¹ ← Δ[0]`, with `S¹ = Δ[1]/∂Δ[1]`, the
  ordinary pullback `Δ[0]` is not a homotopy pullback: the homotopy pullback is the loop space of
  `Ex^∞ S¹`, with components indexed by ℤ.
- For C a point, `X → F(∗)` exhibits X as a homotopy limit exactly when it is a weak equivalence:
  with `F(∗) = Δ[1]`, the inclusion `Δ{0} ⊆ Δ[1]` qualifies and `∂Δ[1] ⊆ Δ[1]` does not; a
  definition by isomorphism with the ordinary limit would reject `Δ{0} ⊆ Δ[1]`.
- For `f = id_C`, `η : G → F` exhibits G as a homotopy right Kan extension exactly when it is an
  objectwise weak equivalence; the strict notion would ask for an isomorphism.
- For A simplicial sets, `f : {0} ⊆ [1]` and `F = ∂Δ[1]`, a diagram `G = (G(0) → G(1))` is a
  homotopy right Kan extension when `G(0) → ∂Δ[1]` is a weak equivalence and `G(1)` is weakly
  contractible (the value of `f_*` at 1 is a limit over the empty category); the ordinary right Kan
  extension `∂Δ[1] → Δ[0]` qualifies, while `G(1) = ∂Δ[1]` does not.

*Needs:* §2.6.1, §2.6.2, §3.1.1; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part
ModelCategories §4.1.1 (HTT, §A.2.5: right Quillen functors preserve weak equivalences between fibrant
objects), §6.1.1 (HTT, Def. A.2.6.1).

### 3.3 The pointwise criterion

**3.3.1.** Prove that for a combinatorial A, a functor `f : C → D` of small categories, F in `Fun(C, A)`, G in
`Fun(D, A)` and `α : f^* G → F`, α exhibits G as a homotopy right Kan extension of F exactly when for
every object D of D, α exhibits `G(D)` as a homotopy limit of F restricted along `C ×_D D_{D/} → C`
(HTT, Prop. A.2.8.9, p. 852). Route: reduce to injectively fibrant F; the pointwise formula for
`f_*` (Mathlib's pointwise right Kan extensions) reduces the claim to restriction along
`C ×_D D_{D/} → C` preserving injective fibrations, which holds because that functor is cofibered in
sets (Part ModelCategories §7.3 (HTT, Lemma A.2.8.10)). The weak equivalences here are those of A.

*Needs:* §3.1.1, §3.2.1 (with Rem. A.2.8.8); §2.6.1; Mathlib `Functor.ran`; Mathlib
`HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part ModelCategories §6.1.1 (HTT,
Def. A.2.6.1), §7.3.1 (HTT, Lemma A.2.8.10).

### 3.4 Homotopy limits over posets

**3.4.1.** Prove that for a combinatorial A, an inclusion of posets `i : B₀ ⊆ B` with a retraction r satisfying
`r(b) ≤ b`, and a diagram F on B, a map `X → lim F` exhibits X as a homotopy limit of F exactly when
it exhibits X as a homotopy limit of `i^* F` (HTT, Lemma A.3.6.12, p. 919). Route: assume F
injectively fibrant; `lim F = lim i^* F`, and `i^*` preserves injective fibrations because it is
right adjoint to `r^*`, which preserves injective trivial cofibrations.

*Needs:* §2.6.1, §3.2.1; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part
ModelCategories §6.1.1 (HTT, Def. A.2.6.1), §7.1.1 (HTT, Def. A.2.8.1).

**3.4.2.** Prove that for a combinatorial A, a small category C with a final object `C₀`, a diagram F and
`α : X → lim F` with every `X → F(C)` a weak equivalence, α exhibits X as a homotopy limit of F
(HTT, Lemma A.3.6.13, p. 919). Route: assume F projectively fibrant; the constant diagram at `F(C₀)` is
injectively fibrant and receives a weak equivalence from F, and its limit is `F(C₀)`.

*Needs:* §2.6.1, §3.2.1; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part
ModelCategories §6.1.1 (HTT, Def. A.2.6.1), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion).

**3.4.3.** Prove that for a combinatorial A, a poset A, `B = {(a, b) ∈ Aᵒᵖ × A : a ≥ b}` with projection
`π : B → Aᵒᵖ`, and `α : π^* G → F` whose components `G(a) → F(a, b)` are weak equivalences, α exhibits
G as a homotopy right Kan extension of F (HTT, Lemma A.3.6.14, p. 920). Route: by §3.3 it suffices
to show that `G(a₀)` is a homotopy limit of F over `{(a, b) : a ≤ a₀}`; reduce to the fiber
`a = a₀` by §3.4.1 and conclude by §3.4.2 (that fiber has the
final object `(a₀, a₀)`).

*Needs:* §3.3.1, §3.4.1, §3.4.2; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1).

### Examples

- For A simplicial sets and the poset `ℕᵒᵖ`, a tower of Kan fibrations `⋯ → X₂ → X₁ → X₀` between Kan complexes is
  injectively fibrant, so its limit is its homotopy limit (§3.2). The constant tower at `Λ[2, 1]` shows that fibrancy
  of `X₀` is needed: every map in it is a Kan fibration, while `Λ[2, 1] → Δ[0]` is not.
- The homotopy pullback of `Δ[0] → Ex^∞ S¹ ← Δ[0]` has π₀ in bijection with ℤ (§3.2).
- For `f : C → ∗`, §3.3 reduces to the definition of homotopy limits, since `C ×_∗ ∗_{∗/} = C`.

### Dependencies

Layer 2; Mathlib Kan extensions; Part ModelCategories §4.1 (Quillen adjunctions), §7.1–§7.3 (Def. A.2.8.1,
the projective structure, Lemma A.2.8.10).

## Layer 4: Reedy diagrams, coends and realization

### 4.1 Reedy, injective and projective structures

**4.1.1.** Prove that on bisimplicial sets, regarded as `Fun(Δᵒᵖ, SSet)` with the Reedy model structure, the
Reedy cofibrations are the monomorphisms, so the Reedy model structure coincides with the injective
one (HTT, Ex. A.2.9.21, p. 862). Route: Reedy cofibrations are characterized by their relative
latching maps, and for diagrams of simplicial sets on `Δᵒᵖ` these are monomorphisms exactly when the
map is (Part ModelCategories §7.5 (HTT, Ex. A.2.9.8)).

*Needs:* §2.6.1; Part ModelCategories §7.5.2 (HTT, Ex. A.2.9.8), §7.7.1 (HTT, Prop. A.2.9.19); Part
KanQuillen (the model structure).

**4.1.2.** Prove that for a Reedy category J with `J_L = J` and any model category A, the Reedy model structure
on `Fun(J, A)` has the objectwise weak equivalences and the injective cofibrations, so it is the
injective structure, which therefore exists without A combinatorial; dually for `J_R = J` and the
projective structure; and in general a map is a Reedy (trivial) cofibration exactly when its
restriction to `J_R` is a projective (trivial) cofibration, and a Reedy (trivial) fibration exactly
when its restriction to `J_L` is an injective (trivial) fibration (HTT, Ex. A.2.9.22, p. 863).

- For a Reedy category J and a combinatorial A, the identity of `Fun(J, A)` is a left Quillen
  equivalence from the projective to the Reedy structure and from the Reedy to the injective one,
  since projective cofibrations are Reedy cofibrations, which are injective cofibrations, and the
  three structures share their weak equivalences (HTT, Rem. A.2.9.23, p. 863).

*Needs:* §2.6.1, §2.6.2; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part ModelCategories
§4.2.1 (HTT, Prop. A.2.5.1), §6.1.1 (HTT, Def. A.2.6.1), §7.1.1 (HTT, Def. A.2.8.1), §7.4.1 (HTT,
Def. A.2.9.1), §7.5.1, §7.5.2 and §7.7.1 (HTT, Prop. A.2.9.19).

### 4.2 Latching criteria and transfinite colimits

**4.2.1.** Prove that for a small category C whose objects carry a well-ordering with `Hom(X, Y)` empty for
`X > Y` and `{id}` for `X = Y`, and any model category A, a map `F → G` of `Fun(C, A)` is a (trivial)
projective cofibration exactly when every relative latching map
`F(C) ⊔_{colim_{D→C, D≠C} F(D)} colim_{D→C, D≠C} G(D) → G(C)` is a (trivial) cofibration, and dually a
map of `Fun(Cᵒᵖ, A)` is a (trivial) injective fibration exactly when every relative matching map is a
(trivial) fibration (HTT, Cor. A.2.9.24, p. 863). Route: C is a Reedy category with `C = C_R`; combine
§4.1 with the Reedy model structure.

*Needs:* §4.1.2; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part ModelCategories
§7.1.1 (HTT, Def. A.2.8.1), §7.4.1 (HTT, Def. A.2.9.1), §7.5.1, §7.5.2 and §7.7.1 (HTT, Prop. A.2.9.19).

**4.2.2.** Prove that for a model category A and an ordinal α, a map `F → F'` of diagrams on `{β < α}` that is
objectwise a weak equivalence between diagrams whose latching maps `colim_{γ<β} F(γ) → F(β)` are
cofibrations induces a weak equivalence of colimits; dually for limits of towers of fibrations
(HTT, Cor. A.2.9.25, p. 864). Route: `colim` is left adjoint to the constant diagram, a Quillen
adjunction for the projective structure, which here exists for any A by §4.2.1; Ken
Brown's lemma applies to the projectively cofibrant F and `F'`.

*Needs:* §4.2.1 (which supplies the projective structure for any A, so §2.6 is not
used); Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part ModelCategories §4.1.1
(HTT, §A.2.5).

### 4.3 Coends as left Quillen bifunctors

**4.3.1.** Prove that for a left Quillen bifunctor `⊗ : A × B → C` and a Reedy category J, the coend
`∫_J : Fun(J, A) × Fun(Jᵒᵖ, B) → C` is a left Quillen bifunctor for the Reedy structures on both
factors (`Jᵒᵖ` with the opposite Reedy structure) (HTT, Prop. A.2.9.26, p. 865). Route: choose a good
filtration of J and show by induction along it that the partial pushout-product maps are
cofibrations, trivial when either factor is, using the latching characterization of Reedy
cofibrations. This is the Reedy form of the coend.

- The projective–injective form: for combinatorial A and B and any small category J, the coend is
  a left Quillen bifunctor for the projective structure on `Fun(J, A)` and the injective structure
  on `Fun(Jᵒᵖ, B)` (HTT, Rem. A.2.9.27, p. 866). Route: on a generating projective cofibration
  `F^J_X → F^J_{X'}` attached at J along a cofibration `X → X'`, the pushout-product with an
  injective cofibration `G → G'` is `(X → X') □ (G(J) → G'(J))`.
- For a simplicial model category A and a Reedy cofibrant cosimplicial object `X^•` of A, the coend
  against `X^•` is a left Quillen functor from bisimplicial sets, with the Reedy structure, which
  is the injective one (§4.1), to A (HTT, Ex. A.2.9.28, p. 867): the Reedy form for
  `⊗ : A × SSet → A` and `J = Δ`, with one variable fixed.

*Needs:* §1.1.1, §1.3.1, §2.6.1, §4.1.1; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part
ModelCategories §6.1.1 (HTT, Def. A.2.6.1), §7.1.1 (HTT, Def. A.2.8.1), §7.2.1 (HTT, Prop. A.2.8.2,
projective assertion), §7.4.1 (HTT, Def. A.2.9.1, Ex. A.2.9.6, Notation A.2.9.11, Rem. A.2.9.12), §7.5.2
(HTT, Prop. A.2.9.19 with its classes), §8.3 (HTT, the coend construction after Cor. A.2.9.25).

### 4.4 Geometric realization of simplicial objects

**4.4.1.** Prove that for a simplicial model category A, the standard cosimplicial simplicial set
`Δ^• : [n] ↦ Δ[n]` is a Reedy cofibrant replacement of the constant cosimplicial object at `Δ[0]`
and geometric realization `|X| = ∫(X, Δ^•)` is left Quillen for the Reedy structure on simplicial
objects of A; when A is moreover combinatorial, so that the projective structure exists (§2.6), the
colimit functor `X ↦ ∫(X, Δ[0])` is left Quillen for the projective structure (HTT, Ex. A.2.9.29,
p. 867); the same Example notes that the colimit functor is not left Quillen for the Reedy
structure. Route: the Reedy and projective–injective forms of §4.3 for `⊗ : A × SSet → A` and
`J = Δ`.

*Needs:* §1.3.1, §4.3.1, §2.6.2; Mathlib `SimplexCategory.reedyStructure`; Part ModelCategories §4.1.1 (HTT,
§A.2.5), §7.4 (HTT, Ex. A.2.9.5), §7.7.1 (HTT, Prop. A.2.9.19), §8.3 (HTT, the coend construction
after Cor. A.2.9.25).

**4.4.2.** Prove that for a combinatorial simplicial model category A and a simplicial object X of A there is a
canonical map `hocolim X → |X|` in `hA`, an isomorphism when X is Reedy cofibrant
(HTT, Cor. A.2.9.30, p. 867). Route: choose a projectively cofibrant `X' → X`; `hocolim X = colim X'`, and
the zigzag `∫(X', ∗) ← ∫(X', Δ^•) → ∫(X, Δ^•)` gives the map; the first arrow is a weak equivalence
by the projective–injective form of §4.3, and the second is one for Reedy cofibrant X by the Reedy
form, since projectively cofibrant objects are Reedy cofibrant (§4.1).

*Needs:* §3.2.1, §4.1.2, §4.3.1, §4.4.1; §2.6.1; Mathlib `HomotopicalAlgebra.ModelCategory`
(HTT, Def. A.2.1.1); Part ModelCategories §4.1.1 (HTT, §A.2.5), §6.1.1 (HTT, Def. A.2.6.1), §7.2.1 (HTT,
Prop. A.2.8.2, projective assertion), §7.7.1 (HTT, Prop. A.2.9.19).

**4.4.3.** Prove that for A simplicial sets the map of §4.4.2 is always an isomorphism: the
diagonal `[n] ↦ X_{n,n}` of a bisimplicial set is its homotopy colimit as a simplicial object of
simplicial sets (HTT, Ex. A.2.9.31, p. 868). Route: every bisimplicial set is Reedy cofibrant (§4.1),
and the coend `∫(X, Δ^•)` is the diagonal: its m-simplices are the coend over n of
`X_{n,m} × Hom([m], [n])`, which is `X_{m,m}` by the co-Yoneda lemma.

*Needs:* §3.2.1, §4.1.1, §4.4.2.

### 4.5 Diagonals of bisimplicial sets and hypercovers

**4.5.1.** The diagonal `[n] ↦ X_{n,n}` of a bisimplicial set `X : Δᵒᵖ → SSet` is Tau Ceti
`CategoryTheory.SimplicialObject.diag` at the category of types (`SSet` is by definition
`SimplicialObject (Type u)`). Here `X_k = X([k])` is a simplicial set and `X_{k,l}` its set of
l-simplices. Prove that the diagonal preserves colimits and monomorphisms, since both are computed
degreewise, and that it is naturally isomorphic to the coend `∫(X, Δ^•)` of §4.4 (the identification
used in HTT, Ex. A.2.9.31, p. 868). The following pin the
convention of `diag`:

- For the external product `Δ[p] ⊠ Δ[q]`, `([k], [l]) ↦ Δ[p]_k × Δ[q]_l`, the diagonal is
  `Δ[p] × Δ[q]`, which has `(p + q choose p)` nondegenerate simplices of the top dimension `p + q`.
- For X empty the diagonal is empty, and for X the terminal bisimplicial set it is `Δ[0]`.
- For `X = Δ[0] ⊠ Δ[1]`, `([k], [l]) ↦ Δ[1]_l`, the diagonal is `Δ[1]`, which is connected, while the
  wrong definition `[n] ↦ X_{n,0}` gives the constant simplicial set on the two vertices of `Δ[1]`,
  with two components.

*Needs:* Tau Ceti `CategoryTheory.SimplicialObject.diag`; §4.4.1.

**4.5.2.** Prove that if every component `f_k : X_k → Y_k` of a map of bisimplicial sets is a weak homotopy
equivalence, the diagonal of f is a weak equivalence (Goerss–Jardine, Prop. IV.1.7;
`isWeakHomotopyEquivalence_diag_map`). Route: skeletal induction in the outer direction; the diagonal preserves
pushouts; after replacing f by a monomorphism, each stage `X ∪ sk_k Y` is a pushout along the pushout-product of the
relative latching map `X_k ⊔_{L_k X} L_k Y → Y_k` with `∂Δ[k] ⊆ Δ[k]` (the components `f_k` alone ignore degeneracies:
for `X = ∅` and Y the constant point they give `∂Δ[k] ⊆ Δ[k]` while `diag Y = Δ[0]`), and the colimit of the stages is
a weak equivalence by §4.2 (latching maps of the skeletal filtration are monomorphisms) and Ken Brown's lemma.

*Needs:* Tau Ceti `CategoryTheory.SimplicialObject.diag`; §4.5.1 (the
diagonal preserves pushouts); §4.2.2; Part ModelCategories §3.5.1 (HTT, homotopy
pushout squares, §A.2.4, p. 833), §3.5.2, §4.1.1 (HTT, §A.2.5), §7.7.1 (HTT, Prop. A.2.9.19); Part KanQuillen
§3.4.1 (properness) and the model structure.

**4.5.3.** Prove that a map f of bisimplicial sets whose components `f_k` are weak homotopy equivalences for
`k ≤ n` has n-connective diagonal, where m-connective maps of simplicial sets are those of Part
KanQuillen §4.1, read through `Ex^∞` (HTT, Lemma 6.5.3.10, pp. 697–698, in the case of the
∞-topos of spaces, to which its proof reduces; the proof of HA Lemma 1.3.3.10, pp. 102–103, applies it).
Route: prove the graded form, that the diagonal is n-connective when every `f_k` is
`(n − k)`-connective (every map being m-connective for `m < 0`), by the induction of
§4.5.2: the k-th stage is a homotopy pushout of `f_k □ (∂Δ[k] ⊆ Δ[k])`, which is n-connective
when `f_k` is `(n − k)`-connective; n-connective maps are closed under composition and homotopy
pushouts, and connectivity passes to colimits of sequences of monomorphisms because homotopy groups
of `Ex^∞` commute with them.

*Needs:* §4.5.2; Part KanQuillen §1.1 and §2.2.1 (homotopy groups of `Ex^∞`), §4.1.1
(connective maps and their composites), §4.3.1 (homotopy pushouts of connective maps).

**4.5.4.** Prove that for an augmented simplicial object `U_• → X` in Kan complexes that is Reedy fibrant and
whose matching maps `U_n → M_n(U)` (with `M₀(U) = X`) are surjective on π₀, the diagonal of `U_•`
maps to X by a weak equivalence (the case of spaces of HTT, Lemma 6.5.3.11, p. 698, with the
hypercompleteness of spaces, Rem. 6.5.4.7, p. 703, as used in the proof of HTT Lemma 5.5.8.13, p. 534). Matching maps are Tau Ceti's
`CategoryTheory.SimplicialObject.matchingMap`; for `X = Δ[0]` the hypotheses imply Tau Ceti's `CategoryTheory.SimplicialObject.IsHypercover`, since a
Kan fibration surjective on π₀ is surjective in every degree. Route: each matching map is a Kan
fibration surjective on vertices, hence surjective on k-simplices for every k (lift a vertex, then extend along `{0} ⊆ Δ[k]`); so for each k
the augmented simplicial set `U_{•,k} → X_k` is a trivial fibration onto the constant simplicial set
`X_k`, and the diagonal statement applies.

*Needs:* the diagonal of a levelwise weak homotopy equivalence (§4.5.2);
§4.4.3; Tau Ceti
`CategoryTheory.SimplicialObject.matchingMap`; Part ModelCategories §7.5.1 (HTT, Notation A.2.9.7,
Prop. A.2.9.19); Part KanQuillen (the model structure).

### Examples

- The Čech nerve of a trivial Kan fibration `U → X` of Kan complexes is a hypercover in the sense of
  §4.5: its degree-0 matching map is `U → X` and the higher ones are isomorphisms.
- For a simplicial set K, the bisimplicial set `([k], [l]) ↦ K_l` has diagonal K and homotopy colimit
  K (§4.4).
- The map `Δ[0] ⊠ Δ[1] → Δ[0] ⊠ Δ[0]` is the weak homotopy equivalence `Δ[1] → Δ[0]` in every degree k, and its
  diagonal is `Δ[1] → Δ[0]` (§4.5). Taking `Δ[1] ⊠ Δ[0] → Δ[0] ⊠ Δ[0]` instead would not be an instance: under
  §4.5.1's convention its component in degree k is a map of discrete simplicial sets on k + 2 and one element.

### Dependencies

Layers 1–3; Mathlib Reedy structures; Part ModelCategories (Reedy model structures, coends); Part
KanQuillen (the model structure, `Ex^∞`, connectivity).

## Layer 5: The model structure on S-enriched categories

### 5.1 Weak equivalences of S-enriched categories

**5.1.1.** Define, for a monoidal model category S, a weak equivalence of S-enriched categories: an S-enriched
functor `F : C → C'` such that the induced functor `hC → hC'` is an equivalence of `hS`-enriched
categories; equivalently, every `Map_C(X, Y) → Map_{C'}(FX, FY)` is a weak equivalence of S and every
object of `C'` is isomorphic in the underlying category of `hC'` to some `F(X)` (HTT, Def. A.3.2.1,
p. 875; `IsEnrichedWeakEquivalence`, the second form, with class `enrichedWeakEquivalences`).

- Weak equivalences satisfy two out of three and contain the isomorphisms.
- For S simplicial sets they are the Dwyer–Kan equivalences: weak homotopy equivalences on mapping
  simplicial sets and essentially surjective on Tau Ceti's homotopy categories
  (`CategoryTheory.EnrichedFunctor.mapHomotopyCategory`). This is `IsCombinatorialDwyerKanEquivalence`, with class
  `combinatorialDwyerKanEquivalences` on Tau Ceti's `CategoryTheory.EnrichedCat.category`. It differs from Tau
  Ceti's `IsDwyerKanEquivalence` only in testing mapping simplicial sets with weak homotopy
  equivalences instead of the realization-based class. The prefix "combinatorial" marks this
  parallel: names whose definition fixes the combinatorial weak homotopy equivalences, where Tau Ceti
  has a realization-based counterpart, carry it.
- A weak equivalence induces an equivalence of underlying categories of homotopy categories.

**Checks.**

- For S simplicial sets, the inclusion of `[0]_S` into the simplicial category with two objects and
  all mapping objects `Δ[0]` is a weak equivalence (the second object is isomorphic to the first in
  the homotopy category); a definition requiring a bijection on objects would reject it.
- The inclusion of `[0]_S` into `[1]_S` (two objects, `Map(X, Y) = Δ[0]`, `Map(Y, X) = ∅`) is fully
  faithful on mapping objects but not essentially surjective, since Y is not isomorphic to X in
  `h[1]_S`; a definition with only the mapping-object clause would accept it.
- Let G be the Kan loop group of `S² = Δ[2]/∂Δ[2]`, a simplicial group with one vertex component
  and non-trivial homotopy. The functor from the one-object simplicial category with endomorphisms
  G to `[0]_S` induces an equivalence of underlying categories of homotopy categories (both have one
  object and one morphism), but `G → Δ[0]` is not a weak equivalence, so it is not a weak
  equivalence of simplicial categories; a definition by the underlying categories of `hC` would
  accept it.

*Needs:* §1.2.1; Tau Ceti `CategoryTheory.EnrichedFunctor.mapHomotopyCategory`,
`SSet.IsWeakHomotopyEquivalence`; Part ModelCategories §8.2.1 (HTT, Rem. A.1.4.3), §3.1.1 (HTT,
Prop. A.2.2.1).

### 5.2 Presentability and generators of `Cat_S`

**5.2.1.** Prove that for a presentable closed monoidal S, `Cat_S` has small colimits and is locally presentable,
with an explicit description of coproducts, of pushouts along functors bijective on objects, and of
the objects of colimits (implicit in HTT, Prop. A.3.2.4, p. 876; Kelly–Lack). Route: `Cat_S` is
monadic over S-graphs with a fixed object set, fibered over sets of objects; alternatively build free
S-categories on S-graphs and coequalizers directly.

*Needs:* Part ModelCategories §1.2.1 (HTT, Def. A.1.1.2); Mathlib `EnrichedCategory`,
`IsLocallyPresentable`; Tau Ceti `CategoryTheory.EnrichedCat.category`; KL01 (presentability).

**5.2.2.** Define the generators of `Cat_S`: for an object K of S, `[1]_K` is the S-enriched category with two
objects X, Y, `Map(X, X) = Map(Y, Y) = 𝟙_S`, `Map(X, Y) = K` and `Map(Y, X) = ∅`; `[1]_S = [1]_{𝟙_S}`;
and `C₀` is the set consisting of `∅ → [0]_S` and the maps `[1]_K → [1]_L` for `K → L` in a set of
generating cofibrations of S (HTT, the notation after Rem. A.3.2.3, p. 876, and Prop. A.3.2.4,
p. 876).

- An S-enriched functor has the right lifting property against `C₀` exactly when it is surjective on
  objects and a trivial fibration of S on every mapping object; such a functor is a weak equivalence
  (HTT, Prop. A.3.2.4, proof, condition (3), p. 876).
- Functors `[1]_K → C` correspond to pairs of objects x, y of C and maps `K → Map_C(x, y)`.

**Checks.**

- For S simplicial sets and `K = ∅`, `[1]_∅` is the discrete simplicial category on two objects, and
  `[1]_{∂Δ[0]} → [1]_{Δ[0]}` is `[1]_∅ → [1]_S`, which adjoins a morphism; a definition with
  `Map(Y, X) = 𝟙_S` would give the "walking isomorphism" `[1]^∼_S` instead (§5.6), whose functors to
  C pick out pairs of inverse maps.
- Lifting against `∅ → [0]_S` alone is surjectivity on objects: the inclusion `[0]_S → [1]_S` fails
  it, and every identity-on-objects functor satisfies it.
- A functor bijective on objects with every mapping map `Δ[1] → Δ[0]` (a trivial fibration but not an
  isomorphism) lifts against `C₀`, while one with a mapping map `∂Δ[1] → Δ[0]` does not lift against
  `[1]_{∂Δ[1]} → [1]_{Δ[1]}`.

*Needs:* §5.1.1, §5.2.1.

### 5.3 Attaching a cell

**5.3.1.** In the setting of an S-enriched category C, objects x, y, a cofibration `K → L` of S and
`h : K → Map_C(x, y)`, define the words of the cell attachment: for objects w, z, `M^k(w, z)` is the
iterated tensor `Map_C(y, z) ⊗ L ⊗ Map_C(y, x) ⊗ ⋯ ⊗ L ⊗ Map_C(w, x)` with k factors L,
`N^k(w, z) → M^k(w, z)` is the iterated pushout-product of `K → L` in the L-factors, `N^k → Map^{k−1}`
composes a K-factor into C through h, `Map^0 = Map_C`, `Map^k = Map^{k−1} ⊔_{N^k} M^k` and
`Map'(w, z) = colim_k Map^k(w, z)`, naturally in `(C, h)` (HTT, Prop. A.3.2.4, proof, the words of a
cell attachment, pp. 877–878).

**Checks.**

- For S sets, `K = ∅`, `L = {∗}` and `x = y` the object of `[0]_S`, `M^k(x, x)` is a point for every
  k and `N^k` is empty, so `Map'(x, x) = ℕ`, the free monoid on one generator; a definition with
  words of length at most one would miss the composite of the new loop with itself.
- For S sets, `K = ∅`, `L = {∗}` and C discrete on x ≠ y, words of length k ≥ 2 contain the empty
  factor `Map_C(y, x)`, so C' is `[1]_S`, the pushout `C ⊔_{[1]_∅} [1]_S`.
- For S simplicial sets, `K = ∂Δ[1]`, `L = Δ[1]` and `k = 2`, `N^2 → M^2` contains
  `Map ⊗ ∂(Δ[1] × Δ[1]) ⊗ Map`; a definition gluing only along `∂Δ[1] × ∂Δ[1]` would not identify
  the boundary edges with words composed through h, and C' would have extra 1-simplices.

*Needs:* §5.2.2; Mathlib `MonoidalClosed`.

**5.3.2.** Prove that concatenation of words, composing in C at the junctions, makes `Map'` the mapping
objects of an S-enriched category `C'` with the objects of C, with S-enriched functors `C → C'` and
`[1]_L → C'` agreeing on `[1]_K` (HTT, Prop. A.3.2.4, proof, p. 877). Route: composition
`M^j ⊗ M^k → M^{j+k}` descends along the pushouts because it respects composition through h;
associativity and units reduce to those of C and monoidal coherence (the tensor distributes over
colimits since S is closed).

*Needs:* §5.3.1.

**5.3.3.** Prove that `C'` is the pushout `C ⊔_{[1]_K} [1]_L` in `Cat_S` (HTT, Prop. A.3.2.4, proof,
pp. 877–878). Route: a functor out of `C'` is determined by its restrictions to C and to `[1]_L`,
because words are generated by these under composition; build the factorization of a cocone stage by
stage along the filtration.

*Needs:* §5.3.2; §5.2.2 (generators).

**5.3.4.** Prove that the pushout `C ⊔_{[1]_K} [1]_L` has the objects of C and mapping objects carrying an
exhaustive filtration `Map_C = Map^0 → Map^1 → ⋯` whose k-th step is a pushout of `N^k → M^k`,
naturally in C (HTT, Prop. A.3.2.4, proof, pp. 877–878). Route: read the filtration off the words
model through §5.3.1–§5.3.3. Lurie writes the argument for simplicial sets; it runs
for general S through coproducts and tensors.

*Needs:* §5.3.1–§5.3.3.

### 5.4 The model structure on `Cat_S`

**5.4.1.** Prove that for S combinatorial monoidal with every object cofibrant and weak equivalences stable
under filtered colimits, a pushout of a weak equivalence `F : C → D` along a member of `C₀` applied
to C, that is the map `C' → D ⊔_C C'` for `C → C'` a pushout of a member of `C₀`, is a weak
equivalence (HTT, Prop. A.3.2.4, proof, condition (2), pp. 876–878). Route: adjoining an object is
immediate; for a cell attachment induct along the filtration of §5.3, each stage being a homotopy
pushout in the left proper S, with the maps of words `N^k → N^k_D` and `M^k → M^k_D` weak equivalences
because every object is cofibrant and the tensor is left Quillen; pass to the colimit by stability
under filtered colimits.

*Needs:* §1.1.1, §1.2.1, §5.1.1, §5.3.1, §5.3.4; Part ModelCategories §3.4.1 (HTT, Def. A.2.4.1, Prop. A.2.4.2), §3.5.1
(HTT, homotopy pushout squares, §A.2.4, p. 833), §3.5.2 (HTT, Prop. A.2.4.4), §4.1.1 (HTT, §A.2.5, for tensoring with a
cofibrant object).

**5.4.2.** Prove that for a combinatorial monoidal model category S in which every object is cofibrant and weak
equivalences are stable under filtered colimits, `Cat_S` carries a left proper combinatorial model
structure whose cofibrations form the weakly saturated class generated by `C₀` and whose weak
equivalences are those of §5.1 (HTT, Prop. A.3.2.4, p. 876). For S simplicial sets this is Bergner's
model structure on simplicial categories (for the existence of the model structure, Bergner,
Thm. 1.1; §1.2 gives the hypotheses). In Lean, `exists_enrichedCatModelCategory` states the left
proper (`IsLeftProper`) combinatorial model structure with weak equivalences
`enrichedWeakEquivalences` and cofibrations the left lifting class of `enrichedTrivialFibrations`
(the functors surjective on objects and trivial fibrations of S on mapping objects, equivalent to
`C₀`-generation by §5.2); `exists_bergnerModelCategory` states the case S simplicial sets, with weak
equivalences `combinatorialDwyerKanEquivalences` and cofibrations the left lifting class of
`bergnerTrivialFibrations`. Route: verify the hypotheses of the recognition theorem for left
proper combinatorial model structures (Part ModelCategories §6.3 (HTT, Prop. A.2.6.15)): perfectness by
the first bullet, pushout stability by §5.4.1, and the lifting condition by §5.2.

- If the weak equivalences of S are stable under filtered colimits, so are those of `Cat_S`, and if S
  is moreover combinatorial they form a perfect class (HTT, Rem. A.3.2.3, p. 875). Route: filtered
  colimits in `Cat_S` are computed on objects and mapping objects, and the weak equivalences are the
  preimage of an accessible class under an accessible functor.
- A monoidal left Quillen functor `f : S → S'` between model categories satisfying these hypotheses,
  with right adjoint g, induces by change of enrichment a Quillen adjunction `Cat_S ⇄ Cat_{S'}`, a
  Quillen equivalence when `(f, g)` is one (HTT, Rem. A.3.2.6, p. 879). Route: the left adjoint
  sends `C₀` to `C₀` and the right adjoint preserves trivial fibrations (§5.2); for the equivalence,
  compare weak equivalences through the derived adjunction on mapping objects.

*Needs:* §1.2.1, §1.2.3, §5.1.1, §5.2.1, §5.2.2, §5.3.4, §5.4.1; Mathlib `HomotopicalAlgebra.ModelCategory`
(HTT, Def. A.2.1.1), `MorphismProperty.llp`, `MorphismProperty.llp_rlp_of_hasSmallObjectArgument`
(the cofibrations as the left lifting class of `enrichedTrivialFibrations`), `LocalizedMonoidal`,
`TransportEnrichment` (the homotopy category `hC` of `IsEnrichedWeakEquivalence`); Tau Ceti
`CategoryTheory.EnrichedCat.category`; Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2), §3.4.1 (HTT,
Def. A.2.4.1: left properness, `IsLeftProper`), §3.5.1 (HTT, homotopy pushout squares, §A.2.4, p. 833),
§4.1.1–§4.2.1 (HTT, §A.2.5, Prop. A.2.5.1), §5.5.1 (HTT, Def. A.2.6.12), §6.1.1 (HTT, Def. A.2.6.1), §6.3.2
(HTT, Prop. A.2.6.15), §8.2.1 (HTT, Rem. A.1.4.3); Ber07, Thm. 1.1 (S simplicial sets).

**5.4.3.** Prove that, for S as in §5.4.2, a cofibration `f : C → C'` of `Cat_S` induces a cofibration
`Map_C(X, Y) → Map_{C'}(fX, fY)` of S for all objects X and Y of C (HTT, Rem. A.3.2.5, p. 879). Route: f is a
retract of a transfinite composite of pushouts of members of `C₀`, and the property is stable under retracts and,
since filtered colimits in `Cat_S` are computed on objects and mapping objects (the first bullet of §5.4.2), under
transfinite composites. Adjoining an object leaves the old mapping objects unchanged; for a cell attachment along
a cofibration `K → L`, each step `Map^{k−1} → Map^k` of the filtration of §5.3 is a pushout of `N^k → M^k`, an
iterated pushout-product of `K → L` with cofibrant objects, hence a cofibration because every object is cofibrant
and the tensor product is a left Quillen bifunctor.

*Needs:* §1.1.1, §1.2.1, §5.2.2 (the generators `C₀`), §5.3.4 (the filtration), §5.4.2 and its first bullet
(filtered colimits computed on mapping objects); Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2), §1.4.1 (HTT, Prop. A.1.2.5 (1)).

### 5.5 Equivalences, local fibrancy and local fibrations

**5.5.1.** Define a quasi-fibration of ordinary categories: a functor `F : C → D` such that for every object X of
C and isomorphism `e : F(X) ≅ Y` of D there are an object `Y'` of C with `F(Y') = Y` and an isomorphism
`e' : X ≅ Y'` with `F(e') = e` (HTT, Def. A.3.2.7, p. 879; `IsQuasiFibration`). This is the
isofibration condition.

- Quasi-fibrations are stable under composition and base change and contain the isomorphisms.
- Every functor into a discrete category is a quasi-fibration.

**Checks.**

- The inclusion of the one-object category into the walking isomorphism `{0 ≅ 1}` is not a
  quasi-fibration (the isomorphism `0 ≅ 1` has no lift starting at 0 with target over 1, since 1 is not
  in the image), although it is an equivalence; a definition by "lifts up to isomorphism of the target"
  would accept it.
- The identity of any category and the projection `C × D → D` are quasi-fibrations.
- A functor from the discrete category on two objects onto the walking isomorphism, bijective on
  objects, is not a quasi-fibration (the isomorphism `0 ≅ 1` has no preimage), while it is surjective
  on objects; a definition by surjectivity on objects would accept it.

*Needs:* none.

**5.5.2.** Define, for a monoidal model category S and an S-enriched category C: a morphism f of C is an
equivalence when its class is an isomorphism in `hC`; C is locally fibrant when every `Map_C(X, Y)` is
fibrant; an S-enriched functor `F : C → C'` is a local fibration when every
`Map_C(X, Y) → Map_{C'}(FX, FY)` is a fibration of S and `hC → hC'` is a quasi-fibration
(HTT, Def. A.3.2.9, p. 879).

- When `C'` is locally fibrant and F is a fibration on mapping objects, the quasi-fibration condition
  is equivalent to: every equivalence `F(X) → Y` of `C'` lifts to an equivalence `X → Y'` of C with
  `F(Y') = Y` (HTT, Rem. A.3.2.10, p. 879). Route: since `𝟙_S` is cofibrant and the mapping maps are
  fibrations, a homotopy class lifts to an isomorphism exactly when a representative lifts to an
  equivalence (Part ModelCategories §3.2 (HTT, Prop. A.2.3.1)).
- Local fibrations are stable under composition and base change.

**Checks.**

- Locally fibrant: the simplicial category of Kan complexes is, while that of all simplicial sets
  is not (`Map(Δ[0], Λ[2,1]) = Λ[2,1]` is not a Kan complex); `[1]_{Λ[2,1]}` is not, `[1]_{Δ[0]}`
  is; for S sets with every object fibrant, every S-enriched category is.
- Local fibration: for S simplicial sets, a functor `C → [0]_S` is one exactly when C is locally fibrant (`h[0]_S` is a
  point, so the quasi-fibration clause is automatic); `[1]_{Λ[2,1]} → [1]_{Δ[0]}` is bijective on
  objects and its homotopy categories have only identities as isomorphisms, but its mapping map
  `Λ[2,1] → Δ[0]` is not a Kan fibration, so it is not one, which a definition by the
  quasi-fibration clause alone would accept.
- Equivalence: for S sets the equivalences are the isomorphisms; in the simplicial category of Kan
  complexes `Δ[1] → Δ[0]` is an equivalence and not an isomorphism.
- The functor `[0]_S → [0]_S ⊔ [0]_S`, an inclusion of a summand, is a local fibration: its mapping
  maps are identities and `h` of it is the inclusion of a component, a quasi-fibration; the inclusion
  of `[0]_S` into the walking isomorphism `[1]^∼_S` is not, although its mapping map is the identity
  of `Δ[0]`.
- Let C be the simplicial category with objects X, Y, `Map(X, Y) = {f}`, `Map(Y, X) = {g}`, and
  `Map(X, X)`, `Map(Y, Y)` both `Δ[1]` as a monoid under the maximum of vertices, with `g ∘ f` and
  `f ∘ g` the vertex 1. Then f is not invertible in the underlying category (`g ∘ f` is not the
  vertex 0), but it is an equivalence, since `π₀ Δ[1]` is a point; a definition by invertibility in
  the underlying category would reject it. In `[1]_S` the non-identity morphism is not an
  equivalence.

*Needs:* §5.1.1, §5.5.1; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part ModelCategories §3.2.1 (HTT, Prop. A.2.3.1).

### 5.6 The invertibility hypothesis and excellent model categories

**5.6.1.** Define `[1]^∼_S`, the S-enriched category with objects X, Y and every mapping object `𝟙_S`
(HTT, Notation A.3.2.11, p. 880; for S simplicial sets `invertibleInterval`, with `interval` for
`[1]_S` and `interval.toInvertible` for the map between them), and the invertibility hypothesis: S, satisfying the hypotheses of §5.4,
satisfies it when for every cofibration `[1]_S → C` classifying a morphism f that is invertible in
`hC`, the pushout `C → C⟨f⁻¹⟩ = C ⊔_{[1]_S} [1]^∼_S` is a weak equivalence (HTT, Def. A.3.2.12, p. 880).

- It suffices to check the condition for fibrant C (HTT, Rem. A.3.2.13, p. 880). Route: a trivial
  cofibration `C → C'` to a fibrant `C'` induces a weak equivalence `C⟨f⁻¹⟩ → C'⟨f⁻¹⟩` by left
  properness of `Cat_S`.
- Equivalently, for a factorization `[1]_S → E → [1]^∼_S` into a cofibration and a weak equivalence
  and `C[f⁻¹] = C ⊔_{[1]_S} E`: for every C and every equivalence f of C, `C → C[f⁻¹]` is a weak
  equivalence; `C ↦ C[f⁻¹]` preserves weak equivalences, and `C[f⁻¹] → C⟨f⁻¹⟩` is a weak equivalence
  when `[1]_S → C` is a cofibration (HTT, Rem. A.3.2.14, p. 880). Route: left properness of `Cat_S` and
  homotopy invariance of pushouts along cofibrations.
- For fibrant C and an equivalence `f : X → Y`, a section of the trivial cofibration `C → C[f⁻¹]`
  gives `E → C`, a homotopy between the two objects `[0]_S → C` picked out by X and Y; relatively, for a
  fibration `F : C → D` and an equivalence f with `F(f) = id_D`, the two objects are homotopic in
  `(Cat_S)_{/D}` (HTT, Rem. A.3.2.15, p. 881). Route: `E` is a cylinder object for `[0]_S`, and the
  invertibility hypothesis in the second form makes `C → C[f⁻¹]` a trivial cofibration.

**Checks.**

- `[1]^∼_S`: its two objects are isomorphic in the underlying category, so `[0]_S → [1]^∼_S` is a
  weak equivalence, while `[0]_S → [1]_S` is not; for S sets it is the walking isomorphism, and a
  definition with `Map(Y, X) = ∅` would give `[1]_S`. The functor `[1]^∼_S → [0]_S` is surjective
  on objects and the identity on every mapping object, so it lies in the right lifting class of
  `C₀` (§5.2).
- For S sets with the model structure whose weak equivalences are the bijections and whose
  cofibrations and fibrations are all maps, `Cat_S` is the category of small categories with the
  equivalences of categories as weak equivalences, and for an isomorphism f of a category C the
  pushout `C ⊔_{[1]} [1]^∼` is isomorphic to C (the adjoined inverse is forced to be the existing
  one); so this S satisfies the invertibility hypothesis.
- For C = `[1]_S` and f its non-identity morphism, f is not invertible in `hC`, and indeed
  `[1]_S → [1]_S⟨f⁻¹⟩ = [1]^∼_S` is not a weak equivalence, its map `∅ → 𝟙_S` on `Map(Y, X)` not
  being one; the clause "invertible in `hC`" cannot be dropped.

*Needs:* §5.1.1, §5.2.2, §5.4.2 (model structure and left properness), §5.5.2; Mathlib
`HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part ModelCategories §3.1.1 (HTT,
Prop. A.2.2.1, cylinder objects for the homotopies of Rem. A.3.2.15), §3.4.1 (HTT, Def. A.2.4.1), §3.5.2
(HTT, Prop. A.2.4.4).

**5.6.2.** Define an excellent model category: a model category S with a symmetric monoidal structure such
that (A1) S is combinatorial, (A2) every monomorphism is a cofibration, every object is cofibrant and
cofibrations are stable under products, (A3) weak equivalences are stable under filtered colimits,
(A4) the tensor product is a left Quillen bifunctor, and (A5) S satisfies the invertibility hypothesis
(HTT, Def. A.3.2.16, p. 881). When initial objects of S are strict, as for simplicial sets and marked
simplicial sets, `∅ → X` is a monomorphism and the clause "every object is cofibrant" follows from the
first clause of (A2) (compare HTT, Rem. A.3.2.17, p. 881); it is part of (A2) here so that (A5), which needs
the hypotheses of §5.4, makes sense for every excellent S. An excellent model category is left
proper.

**Checks.**

- Sets with the bijections as weak equivalences, all maps as cofibrations and fibrations and the
  Cartesian product satisfy (A1)–(A5) (HTT, Ex. A.3.2.19, p. 881), (A5) by the second Check of
  §5.6.1. A version of (A5) without the clause "invertible in `hC`" fails
  here: for C = `[1]` and f its non-identity map, `[1] → [1]^∼` is not an equivalence of categories.
- Sets with all maps as weak equivalences and fibrations and the isomorphisms as cofibrations fail
  (A2): `∅ → {∗}` is a monomorphism and not a cofibration, so a definition without (A2) would admit
  a structure in which not every object is cofibrant and §5.4 does not apply.
- Simplicial sets with the Kan–Quillen structure and the coproduct as tensor product satisfy
  (A1)–(A3) but fail (A4) (§1.2: `X ⊔ −` does not preserve the initial object); with the Cartesian
  product they are excellent (§5.7).

*Needs:* §1.1.1, §1.2.1, §5.6.1; §5.1.1; Mathlib
`HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part ModelCategories §3.4.1 (HTT, Def. A.2.4.1,
Prop. A.2.4.2, for left properness), §6.1.1 (HTT, Def. A.2.6.1).

### 5.7 Simplicial sets are excellent

**5.7.1.** Prove that, for S simplicial sets, the invertibility hypothesis may be checked for cofibrant C, a
retract of a levelwise free simplicial category, and f a generator of C in degree 0 (Dwyer–Kan,
*Simplicial localizations of categories*, §§4–6, the theorem cited at HTT Ex. A.3.2.18, p. 881).
Route: the homotopy-invariant form `C ↦ C[f⁻¹]` of §5.6 is invariant under weak equivalence of C by
left properness of the model structure of §5.4.

*Needs:* §5.4.2, §5.6.1; §1.2.3 (simplicial sets satisfy (A1)–(A4)).

**5.7.2.** Prove that for a levelwise free simplicial category C and a generator f in degree 0, `C[f⁻¹]` is
weakly equivalent to the levelwise localization `[n] ↦ C_n[f⁻¹]` of free categories (Dwyer–Kan,
*Simplicial localizations of categories*, §§4–5). Route: compute the pushout along `[1]_S → E` with the
cell-attachment filtration of §5.3 and compare with the free localization in each degree.

*Needs:* §5.7.1; §5.3.4.

**5.7.3.** Prove that if f becomes invertible in `π₀ C`, then `C → ([n] ↦ C_n[f⁻¹])` is a weak equivalence of
simplicial categories (Dwyer–Kan, *Simplicial localizations of categories*, §6). Route: compare mapping
spaces through the diagonals of the bisimplicial sets of zigzags, and apply the diagonal lemma of §4.5.

*Needs:* §5.7.2; §4.5.2 (the diagonal of a levelwise weak homotopy equivalence); §5.1.1.

**5.7.4.** Prove that simplicial sets with the Kan–Quillen structure and the Cartesian product satisfy the
invertibility hypothesis (Dwyer–Kan, *Simplicial localizations of categories*, as cited at
HTT Ex. A.3.2.18, p. 881; `combinatorialDwyerKanEquivalences_of_isPushout_interval_toInvertible`). Route:
§5.7.1–§5.7.3.

*Needs:* §5.7.1–§5.7.3; §1.2.3; §5.6.1.

**5.7.5.** Prove that simplicial sets with the Kan–Quillen structure and the Cartesian product form an excellent
model category (HTT, Ex. A.3.2.18, p. 881). Route: (A1)–(A4) are §1.2 and (A5) is
§5.7.4.

*Needs:* §1.2.3, §5.6.2, §5.7.4; Part KanQuillen (the model structure).

### 5.8 Fibrant objects and fibrations

**5.8.1.** Prove that for S satisfying (A1)–(A4), a fibration `F : C → D` of `Cat_S` is a fibration of S on every
mapping object (in particular a fibrant S-enriched category is locally fibrant), and that if S is
excellent and D is fibrant, F is moreover a local fibration (HTT, Thm. A.3.2.24, proof of the "only
if" direction, pp. 884–885). Route: lifting against `[1]_K → [1]_L` for trivial cofibrations
`K → L`; the quasi-fibration clause verifies condition (ii') of §5.5 by lifting an equivalence along
`[1]_S → E` of §5.6, which is a trivial cofibration under (A5).

*Needs:* §5.4.2, §5.5.1, §5.5.2 (with the equivalent condition), §5.6.1 (invertibility hypothesis and
its second form), §5.6.2.

**5.8.2.** Prove, for an excellent S, that for each object K of S the S-enriched category `C^K`, with the objects
of C and `Map_{C^K}(X, Y) = Map_C(X, Y)^K`, is functorial in C and contravariantly in K (this does not
enrich `Cat_S` over S, since `D ↦ D^K` does not take colimits in K to limits, so `Cat_S` is not cotensored
over S in the sense of Part ModelCategories §8.2); that for S-enriched categories B, C and every
function φ from the objects of B to those of C there is an object `Map^φ_{Cat_S}(B, C)` of S with
`Hom_S(K, Map^φ_{Cat_S}(B, C))` naturally in bijection with the S-enriched functors `B → C^K` that are φ
on objects; and that for a commutative square of S-enriched categories `u : C → C'`, `u' : D → D'`,
`F : C → D`, `F' : C' → D'` whose squares of mapping objects are homotopy pullbacks of fibrant objects
with fibrations as vertical maps, and for `G : A → B` a transfinite composite of pushouts of maps
`[1]_K → [1]_L` along cofibrations `K → L` of S, with φ a function from the objects of B to those of
C, the induced square of the objects `Map^φ_{Cat_S}(B, C)` representing functors that are φ on
objects is a homotopy pullback of fibrant objects with fibrations as vertical maps (HTT, Lemma
A.3.2.26 and the construction before it, pp. 883–884). Route: `Map^φ_{Cat_S}(B, C)` is the equalizer,
formed in S, of the two maps from `∏_{X,Y} Map_C(φX, φY)^{Map_B(X, Y)}` that encode compatibility with
composition and identities, which exists since S is complete and closed; the class of such G is
closed under pushouts and transfinite composites, which `Map^φ` takes to pullbacks and inverse limits
of towers of fibrations; for a single cell the square is obtained by the internal homs of S out of
`K → L` from the given mapping squares, and is controlled by the left Quillen bifunctor axiom (A4)
with every object cofibrant.

*Needs:* §1.1.1, §5.2.2 (the generators `[1]_K → [1]_L`), §5.6.2 (excellence); Mathlib
`HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part ModelCategories §1.3.1 (HTT,
Def. A.1.2.2), §3.5.1 (HTT, homotopy pushout squares, §A.2.4, p. 833), §6.1.1 (HTT, Def. A.2.6.1), §8.2.2 (HTT,
the definitions before Ex. A.1.4.5).

**5.8.3.** Prove that for an excellent S, a local fibration `C → D` with D fibrant is a fibration of `Cat_S`; in
particular a locally fibrant S-enriched category is fibrant (HTT, Thm. A.3.2.24, proof of the "if"
direction, pp. 885–886). Route: factor the functor as a trivial cofibration followed by a fibration,
reduce the lifting problem to generating cofibrations by §5.6 (the relative homotopy of the third
bullet) and the homotopy lifting of Part ModelCategories, and conclude with §5.8.2.

*Needs:* §5.4.2, §5.5.2, §5.6.1, §5.6.2, §5.8.1, §5.8.2; Part ModelCategories §1.4.1 (HTT,
Prop. A.1.2.5 (1): the small object argument, for the retract of a cell complex), §3.2.1 (HTT,
Prop. A.2.3.1), §8.2.2 (HTT, the definitions before Ex. A.1.4.5).

**5.8.4.** Prove that for an excellent S an S-enriched category is fibrant in `Cat_S` exactly when it is locally
fibrant, and an S-enriched functor `F : C → D` with D fibrant is a fibration exactly when it is a local
fibration (HTT, Thm. A.3.2.24, p. 883). The first assertion for S simplicial sets is
`isFibrant_iff_isLocallyKan`, with locally Kan simplicial categories `IsLocallyKan`; the second, for
S simplicial sets, is `fibration_iff_isQuasiFibration`: Kan fibrations on mapping simplicial sets and
a quasi-fibration of homotopy categories. Route for `fibration_iff_isQuasiFibration`: for D fibrant
it is assertion (2) above for S simplicial sets, which are excellent by §5.7, and it follows from
§5.8.1 and §5.8.3; the hypothesis that D is fibrant is dropped by
Bergner's theorem (HTT, Rem. A.3.2.25, p. 883; Ber07, Thm. 1.1).

*Needs:* §5.5.1, §5.5.2 (local fibrations and `IsQuasiFibration`), §5.6.2, §5.8.1, §5.8.3; for S simplicial sets also §5.4.2 (`exists_bergnerModelCategory`), §5.7.5 (excellence),
Mathlib `SSet.KanComplex`, Tau Ceti `CategoryTheory.EnrichedFunctor.mapHomotopyCategory`, and, for
the form without D fibrant, Ber07, Thm. 1.1; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT,
Def. A.2.1.1); Part ModelCategories §3.5.1 (HTT, homotopy pushout squares, §A.2.4, p. 833), §6.1.1 (HTT,
Def. A.2.6.1).

**5.8.5.** Prove that for a monoidal left Quillen functor `T : S → S'` between model categories satisfying
(A1)–(A4), if S satisfies (A5) so does `S'` (HTT, Lemma A.3.2.20, p. 882). Route: reduce to fibrant C;
transport the factorization `[1]_S → E → [1]^∼_S` along the left adjoint of §5.4.2 (second bullet); the right adjoint G
sends C to a locally fibrant S-enriched category (§5.8.1, which needs no (A5)), so
the image of f is an equivalence there by §5.5, and `C → C[f⁻¹]` is a pushout of the image of the
trivial cofibration `G(C) → G(C)[f₀⁻¹]`.

*Needs:* §5.4.2 (change of enrichment), §5.5.2, §5.6.1, §5.6.2 (definitions and bullets), §5.8.1; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part ModelCategories §4.1.1 (HTT, §A.2.5).

### 5.9 Enriched Quillen equivalences through bifibrant objects

**5.9.1.** Prove that for S-enriched model categories C and D and a Quillen adjunction `F ⊣ G` of underlying
categories with G S-enriched, if every object of C is cofibrant and every `β_{X,K}` with X, K cofibrant
is a weak equivalence, then `(F, G)` is a Quillen equivalence exactly when G restricts to a weak
equivalence of S-enriched categories `D° → C°` (HTT, Prop. A.3.1.10, p. 873). Route: through
`π₀ Map = Hom_h` (§1.3), the derived unit is an isomorphism exactly when G is fully faithful on mapping
objects of bifibrant objects, using the β maps to compare `F` with tensors; essential surjectivity of
the derived right adjoint matches that of G on `hD° → hC°`.

- For simplicial model categories C, D and a Quillen adjunction `F ⊣ G` with G simplicial, every
  `β_{X,K} : K ⊗ F(X) → F(K ⊗ X)` with X cofibrant is a weak equivalence, so the hypothesis on β
  holds automatically for S simplicial sets (HTT, Rem. A.3.1.9, p. 873). Route: the K for which
  `β_{X,K}` is a weak equivalence are closed under weak equivalences, homotopy pushouts and
  coproducts and contain `Δ[0]`.

*Needs:* §1.3.1 (the β maps and `π₀ Map = Hom_h`), §5.1.1; Mathlib `HomotopicalAlgebra.ModelCategory`
(HTT, Def. A.2.1.1); Part ModelCategories §3.5.1 (HTT, homotopy pushout squares, §A.2.4, p. 833), §4.1.1–§4.2.1
(HTT, §A.2.5, Prop. A.2.5.1); Part KanQuillen (the model structure, for the bullet).

### Examples

- `[1]_{Δ[0]}` is fibrant in Bergner's model structure; `[1]_{Λ[2,1]}` is not, since `Λ[2,1]` is not a
  Kan complex (§5.8).
- The simplicial category of Kan complexes `Kan` is fibrant, and the inclusion `[0]_S → [1]^∼_S` is a weak
  equivalence but not a cofibration: in a cell complex built from `C₀` the 0-arrows form a free category, which
  has no isomorphism between distinct objects (§5.4, §5.6).
- In `[1]^∼_S` the two objects are homotopic as maps `[0]_S → [1]^∼_S` (§5.6, HTT, Rem. A.3.2.15),
  while in `[1]_S` they are not, since `[1]_S` has no equivalence between them.
- For S sets with the trivial model structure and the Cartesian product, `Cat_S` with the structure of
  §5.4 is the canonical model structure on small categories, whose weak equivalences are the
  equivalences of categories and whose fibrations are the quasi-fibrations of §5.5.

### Dependencies

Layers 1 and 4 (the diagonal lemma); Part ModelCategories (perfect classes, the recognition theorem
for left proper combinatorial model structures, homotopy pushouts, homotopy lifting); Part KanQuillen;
Dwyer–Kan for the invertibility hypothesis.

## Layer 6: Enriched diagram model structures

### 6.1 Projective and injective structures on `A^C`

**6.1.1.** Prove that for an excellent S, a combinatorial S-enriched model category A and a small S-enriched
category C, `A^C` carries two combinatorial model structures with the objectwise weak equivalences:
the projective one, with the projective cofibrations and fibrations, and the injective one, with the
injective cofibrations and fibrations (HTT, Prop. A.3.3.2, p. 888). Route: as in §2.6, with the
objectwise generation lemma of §2.4 in place of §2.5. For S = A = simplicial sets these are
`exists_projectiveModelCategory_sSetDiagram` and `exists_injectiveModelCategory_sSetDiagram`, on
`SSetDiagram C` with the classes `objectwiseWeakEquivalences`, `objectwiseFibrations` and
`objectwiseMonomorphisms`.

- The projective cofibrations are generated by the maps `F^C_X → F^C_{X'}`, with
  `F^C_X(D) = X ⊗ Map_C(C, D)`, for objects C of C and cofibrations `X → X'` of A; hence every
  projective cofibration is an injective cofibration and every injective fibration a projective
  fibration (HTT, Rem. A.3.3.5, p. 889). Route: by the enriched Yoneda lemma, maps `F^C_X → G` are
  maps `X → G(C)`.
- With either structure, `A^C` is an S-enriched model category, tensored and cotensored objectwise as in §2.1
  (HTT, Rem. A.3.3.4, pp. 888–889). Route: for the injective structure, the pushout-product of an injective
  cofibration with a cofibration of S is computed objectwise, so it is an injective cofibration, trivial when
  either factor is; for the projective structure use the equivalent form through cotensors (§1.3, HTT,
  Rem. A.3.1.6): the pullback-power of a projective fibration with a cofibration of S is computed objectwise, so
  it is a projective fibration, trivial when either is.

*Needs:* §1.3.1, §2.1.1, §2.2.1, §2.4.2, §2.6.1, §5.6.2 (excellence); Mathlib `HomotopicalAlgebra.ModelCategory`
(HTT, Def. A.2.1.1); Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)), §6.1.1 (HTT, Def. A.2.6.1,
Cor. A.2.6.8), §6.3.1 (HTT, Prop. A.2.6.10), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion, whose
proof is adapted).

### 6.2 Functoriality in C

**6.2.1.** Prove that for an excellent S, a combinatorial S-enriched model category A and an S-enriched functor
`f : C → C'` of small S-enriched categories, restriction `f^*` has both adjoints, `(f_!, f^*)` is a
Quillen adjunction of projective structures and `(f^*, f_*)` a Quillen adjunction of injective
structures (HTT, Prop. A.3.3.7, p. 889). Route: the adjoints are enriched Kan extensions, which exist
because A is tensored and cotensored; `f^*` preserves objectwise classes.

*Needs:* §1.3.1, §2.1.1, §5.6.2 (excellence), §6.1.1; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT,
Def. A.2.1.1); Part ModelCategories §4.1.1 (HTT, §A.2.5), §6.1.1 (HTT, Def. A.2.6.1), §8.2.2 (HTT, the
definitions before Ex. A.1.4.5).

### 6.3 Invariance under weak equivalences of C

**6.3.1.** Prove that for an excellent S, a combinatorial S-enriched model category A and a weak equivalence
`f : C → C'` of small S-enriched categories, `(f_!, f^*)` is a Quillen equivalence of projective
structures and `(f^*, f_*)` one of injective structures (HTT, Prop. A.3.3.8, p. 890). Route: both
assertions say that `f^*` induces an equivalence of homotopy categories; first treat the case where every
`Map_C(C, D) → Map_{C'}(fC, fD)` is a cofibration of S, check the derived unit on the generators `F^C_X` (§6.1) and the derived
counit by essential surjectivity; reduce the general case to this one by factoring f in `Cat_S`
(§5.4): a trivial cofibration to a fibrant category has cofibrations as mapping maps (§5.4.3; HTT, Rem. A.3.2.5), and the remaining factors pass through a product with a
fibrant weakly contractible category, whose mapping objects are fibrant (§5.8), with
monomorphisms as mapping maps, cofibrations by (A2). For S = A = simplicial sets, `isLocalizedEquivalence_restriction` states it as: restriction
along a Dwyer–Kan equivalence (`restriction`, `restrictionLocalizerMorphism`) induces an
equivalence of localizations at the objectwise weak equivalences, which is what both Quillen
equivalences say, since `f^*` preserves all weak equivalences.

*Needs:* §1.3.1, §2.1.1, §5.1.1, §5.4.3 (mapping maps of cofibrations, HTT, Rem. A.3.2.5), §5.6.2, §5.8.1 (fibrant objects are
locally fibrant), §6.1.1, §6.2.1; Mathlib `LocalizerMorphism.IsLocalizedEquivalence`; Mathlib
`HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Part ModelCategories §1.3.1 (HTT,
Def. A.1.2.2), §4.1.1–§4.2.1 (HTT, §A.2.5, Prop. A.2.5.1), §6.1.1 (HTT, Def. A.2.6.1).

### 6.4 Homotopy Kan extensions through mapping objects

**6.4.1.** Prove that for an excellent S, a combinatorial S-enriched model category A, `f : C → C'` of small
S-enriched categories, projectively fibrant `F` in `A^C` and `G` in `A^{C'}`, and `η : G → f_* F`, the
following are equivalent: η exhibits G as a homotopy right Kan extension of F (defined as in §3.2 with
the injective structures of §6.1 and the adjunction of §6.2); for every cofibrant object X of A,
`η_X : G_X → f_* F_X` exhibits `G_X` as a homotopy right Kan extension of `F_X` in `S^{C'}`, where
`F_X(C) = Map_A(X, F(C))`; and the same for every fibrant-cofibrant X (HTT, Prop. A.3.3.12, p. 894).
Route: replace F by an injectively fibrant `F'`; `Map_A(X, −)` preserves weak equivalences between
fibrant objects for cofibrant X; then test weak equivalences of A between fibrant objects on mapping
objects from bifibrant X.

*Needs:* §1.3.1, §2.1.1, §3.2.1, §5.6.2, §6.1.1, §6.2.1; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT,
Def. A.2.1.1); Part ModelCategories §4.1.1 (HTT, §A.2.5: `Map_A(X, −)` preserves weak equivalences
between fibrant objects), §6.1.1 (HTT, Def. A.2.6.1).

**6.4.2.** Prove that for S and A as in §6.4.1 and a small ordinary category C, regarded as an S-enriched
category through the colimit-preserving
monoidal functor `Set → S`, `T ↦ ∐_T 𝟙_S`, the category `A^C` is `Fun(C, A)`, naturally in C and A, with the
same injective model structure, so that along functors of ordinary categories the homotopy right Kan extensions of
§6.4.1 are those of §3.2 (HTT, Rem. A.3.3.11, p. 894). Route: an S-enriched functor out of the
free S-enriched category on C is an ordinary functor, by adjunction on mapping objects, and both injective
structures have the objectwise cofibrations and weak equivalences; the identification commutes with restriction
along a functor of ordinary categories, so the right adjoints `f_*` of §6.2 and of §3.1 agree.

*Needs:* §2.1.1, §2.6.1, §3.1.1, §3.2.1, §6.1.1, §6.2.1; Part ModelCategories §7.1.1 (HTT, Def. A.2.8.1).

**6.4.3.** Define, for a locally fibrant S-enriched category A that need not underlie a model category, an
S-enriched functor `f : C → C'` of small S-enriched categories, F in `A^C`, G in `A^{C'}` and
`η : f^* G → F`: η exhibits G as a homotopy right Kan extension of F when for every object A of A the
induced `η_A : G_A → f_* F_A` exhibits `G_A` as a homotopy right Kan extension of `F_A` in `S^{C'}`;
for a Cartesian S and `C'` the final S-enriched category, a family `B → F(C)` exhibits B as a homotopy
limit of F when for every A the map `Map_A(A, B) → holim Map_A(A, F(−))` is a weak equivalence
(HTT, Rem. A.3.3.13, p. 895). Dually for homotopy colimits, testing with `Map_A(−, A)`.

- It is invariant under weak equivalences of locally fibrant S-enriched categories.

**Checks.**

- For A = `Kan` (Kan complexes) and C a point, a map `B → F(∗)` exhibits B as a homotopy limit exactly
  when it is a homotopy equivalence; for A all simplicial sets the same test with non-Kan targets would
  fail, which is why local fibrancy is assumed.
- For C empty, the homotopy limit of the empty diagram in `Kan` is any contractible Kan complex: the
  test map `Map(A, B) → Δ[0]` must be a weak equivalence for every A.
- For A = `Kan` and the diagram `Δ[0] → S ← Δ[0]` with S a Kan model of the circle, the based loop
  space ΩS is a homotopy limit and `Δ[0]` is not: `Map(Δ[0], ΩS)` has components indexed by ℤ while
  `Map(Δ[0], Δ[0])` is a point. This agrees with §3.2.

*Needs:* §3.2.1, §5.5.2 (local fibrancy), §6.4.2.

### Examples

- For C = `[0]_S`, `A^C = A` and both structures of §6.1 are the given one.
- For S simplicial sets and C the simplicial category with one object and endomorphisms a simplicial
  group Γ, `A^C` is the category of Γ-objects of A, and §6.3 applied to a weak equivalence of simplicial
  groups `Γ → Γ'` gives a Quillen equivalence of Γ-objects and `Γ'`-objects.
- §6.4 for `A = Kan` gives the homotopy limits used by the coherent nerve in the downstream Parts.

### Dependencies

Layers 1–5; Part ModelCategories (Smith's theorem, Quillen adjunctions).

## Downstream consumers

This roadmap is used by every later member of the ModelCategoryTheory family and every member of the InfinityCategoryTheory family, each of which lists what it uses from it in its own supplier contracts.

## References

- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Monoidal and
  enriched model categories: Def. A.3.1.1, A.3.1.2, Ex. A.3.1.4, Def. A.3.1.5, p. 869; recognition:
  Prop. A.3.1.7, p. 870; enriched right adjoints: Rem. A.3.1.8–A.3.1.9, Prop. A.3.1.10, pp. 872–873;
  injective structures and homotopy Kan extensions: Prop. A.2.8.2, Lemma A.2.8.3, p. 848,
  Prop. A.2.8.7–A.2.8.9, pp. 851–852; Reedy comparisons and realization: Ex. A.2.9.21–A.2.9.31,
  pp. 862–868; `Cat_S`: Def. A.3.2.1–Lemma A.3.2.26, pp. 875–886; enriched diagrams: Def. A.3.3.1–Lemma
  A.3.3.17, pp. 888–901; homotopy limits over posets: Lemmas A.3.6.12–A.3.6.14, pp. 919–920; diagonals
  and hypercovers of spaces: Lemmas 6.5.3.10–6.5.3.11, pp. 697–698, Rem. 6.5.4.7, p. 703, and the
  proof of Lemma 5.5.8.13, p. 534.
- **HA.** Jacob Lurie, *Higher Algebra*, author's PDF, version of 18 September 2017,
  [math.ias.edu/~lurie/papers/HA.pdf](https://www.math.ias.edu/~lurie/papers/HA.pdf). Statement numbers and pages
  are those of this PDF, whose PDF and printed page numbers agree.
  Lemma 1.3.3.10, pp. 102–103 (the connectivity
  input, §4.5).
- **Ber07.** J. E. Bergner, *A model category structure on the category of simplicial categories*,
  Trans. Amer. Math. Soc. 359 (2007), 2043–2058, [arXiv:math/0406507](https://arxiv.org/abs/math/0406507).
  Thm. 1.1 (the model structure for S simplicial sets, §5.4, §5.8).
- **DK80.** W. G. Dwyer and D. M. Kan, *Simplicial localizations of categories*, J. Pure Appl. Algebra
  17 (1980), 267–284 (cited by locator). §§4–6 (the invertibility hypothesis for simplicial sets, §5.7).
- **GJ99.** P. G. Goerss and J. F. Jardine, *Simplicial homotopy theory*, Progress in Mathematics 174,
  Birkhäuser, 1999 (cited by locator). Prop. IV.1.7 (diagonals of levelwise weak equivalences, §4.5).
- **Kerodon.** Jacob Lurie, *Kerodon*, an online resource for homotopy-coherent mathematics,
  [kerodon.net](https://kerodon.net). Definition 3.1.7.12 (weak homotopy equivalences, Conventions);
  Proposition 3.3.7.6 and Corollary 3.3.7.7 (the Kan–Quillen classes, Part KanQuillen's contract).
- **KL01.** G. M. Kelly and S. Lack, *V-Cat is locally presentable or locally bounded if V is so*,
  Theory Appl. Categ. 8 (2001), 555–575, [journal copy](http://www.tac.mta.ca/tac/volumes/8/n23/8-23abs.html).
  The presentability of `Cat_S` (§5.2).
