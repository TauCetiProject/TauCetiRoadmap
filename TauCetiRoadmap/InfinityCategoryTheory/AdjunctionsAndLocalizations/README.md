# Roadmap: adjunctions, localizations and factorization systems

**Summary.** This Part develops adjoint functors, reflective localizations, localizations at a class of morphisms
and factorization systems for ∞-categories.

It builds on Parts InfinityCategoryFoundations, CartesianFibrations and LimitsAndKanExtensions.

- **Adjoint functors (Layer 1).** Adjunctions and associated functors are defined in §1.1. Adjunctions are related
  to correspondences and to unit transformations; adjoints preserve limits and colimits, exist exactly when
  certain right fibrations are representable, arise from simplicial and Quillen adjunctions, and include Kan
  extension as a left adjoint of restriction.
- **Localizations, factorization systems and derived functors (Layer 2).** Reflective localizations, localization
  functors and retracts are defined in §2.1. Localization functors and reflective subcategories are
  characterized. The localization `C[W⁻¹]` of an ∞-category at a class of morphisms exists, is presented by the
  localization of simplicial categories, and contains reflective localizations as a special case. The underlying
  ∞-category of a model category is defined by such a universal inversion, and is independent of the choice of
  cofibrant, fibrant or bifibrant objects when the factorizations are functorial. Factorization systems are
  related to reflective subcategories of arrow ∞-categories. Absolute Kan extensions along localizations model
  the derived functors of left Quillen functors whose source has a functorial cofibrant replacement.

**Headline theorems.**
- Left adjoints preserve colimits (HTT, Prop. 5.2.3.5, p. 367).
- The representability criterion for adjoints (HTT, Prop. 5.2.4.2, p. 368).
- Kan extension along any map is left adjoint to restriction (HTT, Prop. 4.3.3.7, p. 306).
- The characterization of localization functors (HTT, Prop. 5.2.7.4, p. 383).
- Reflective subcategories are exactly those whose inclusion has a left adjoint (HTT, Prop. 5.2.7.8, p. 385).
- Reflective localizations are localizations (HTT, Prop. 5.2.7.12, p. 386).
- Existence of the localization `C[W⁻¹]` (no source; HA, Remark 1.3.4.2, p. 108, sketches it from HTT,
  Prop. 3.1.3.7).
- Quillen left derived functors are absolute Kan extensions (Nikolaus–Scholze, Ex. A.10, pp. 136–137).

## Scope and ownership

- **From the earlier Parts of this family.** Mapping spaces, slices, limits and colimits, spaces and the Joyal
  model structure are Part InfinityCategoryFoundations'; Cartesian and coCartesian fibrations, correspondences and the
  Cartesian model structure are Part CartesianFibrations'. Kan extensions are defined in Part
  LimitsAndKanExtensions §7.1; their existence along full subcategories and along arbitrary maps, and the trivial
  fibration they form, are Part LimitsAndKanExtensions Layer 7. This Part proves their adjunction properties.
- **Already in the library.** Mathlib has the 1-categorical counterparts: reflective subcategories
  (`CategoryTheory.Reflective`) and localizations (`CategoryTheory.Functor.IsLocalization`). Nothing here restates
  them. Composition of adjunctions in the bicategory of quasicategories (HTT, Prop. 5.2.2.6, p. 360) is Mathlib's
  `CategoryTheory.Bicategory.Adjunction.comp`.
- **Left to later Parts.** Statements about diagrams of ∞-categories, that is functors into `Cat∞`, are Part
  Straightening's: adjointable squares and the coherent diagrams of their left adjoints, the compatibility of
  localization with colimits of ∞-categories, and coCartesian fibrations whose transports are left derivable.
  Presheaf ∞-categories, the Yoneda embedding, idempotent completions, filtered colimits and `Ind_κ` are Part
  PresheavesAndCompletions'; accessible localizations and the adjoint functor theorem are Parts AccessibleInfinityCategories and
  PresentableInfinityCategories'; the comparison of the localization of a simplicial model category with its coherent nerve (the
  Dwyer–Kan theorem) and the derived ∞-categories built from `C[W⁻¹]` are Part DerivedInfinityCategories'; the
  factorization systems of an ∞-topos are Part InfinityTopoi's.

## Conventions

Locators such as (HTT, Prop. 5.2.7.8, p. 385) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.1.2` here and `Part AdjunctionsAndLocalizations §2.1.2`
elsewhere, is one target.

- **∞-categories.** An ∞-category is a quasicategory: a simplicial set `C` with Mathlib's
  `SSet.Quasicategory C`. The bundled form is Mathlib's `SSet.QCat`. Functor ∞-categories are
  `Fun(K, C) = (ihom K).obj C`, with Mathlib's quasicategory instance.
  - *Check.* The nerve of a category is an ∞-category, and for a category `A` the vertices of
    `Fun(Δ[1], nerve A)` are the morphisms of `A`. A notion of ∞-category requiring all horns, not just
    inner ones, to fill would exclude the nerve of `[1]`: the outer horn `Λ[2, 0]` with edges `0 → 1` and
    `0 → 0` has no filler there.
- **Adjunctions.** An adjunction `f ⊣ g` between `f : C ⟶ D` and `g : D ⟶ C` is the one of §1.1:
  an adjunction in Mathlib's bicategory `SSet.QCat.bicategory`. Its hom-categories are the homotopy categories of
  the functor ∞-categories. HTT's definition through correspondences over `Δ[1]` (HTT, Def. 5.2.2.1, p. 358) is
  equivalent to it by §1.3.
  - *Check.* For categories `A`, `B` and functors `F ⊣ G`, the nerves form an adjunction: the unit and
    counit are edges of `Fun(nerve A, nerve A)` and `Fun(nerve B, nerve B)`, and the triangle identities
    hold on the nose. A definition that only asked for a unit, with no counit, would make the inclusion of
    `1` into the nerve of `[1]` left adjoint to the functor to `Δ[0]`, through the identity unit. It is not
    one, since `1` is not initial.
- **Correspondences and variance.** A correspondence from `C` to `D` is an inner fibration `M ⟶ Δ[1]` with fibers
  `C` over `0` and `D` over `1` (Part CartesianFibrations §4.1, HTT, Def. 2.3.1.3). When it is a Cartesian
  fibration it is associated to a functor `D ⟶ C`, transporting objects backwards along `0 ⟶ 1`; when it is
  coCartesian, to a functor `C ⟶ D` (§1.1, HTT, Def. 5.2.1.1).
  - *Check.* For a functor `g : D ⟶ C` of categories, the nerve of the category with objects those of `C ⊔ D`,
    morphisms `c ⟶ d` the morphisms `c ⟶ g d` of `C`, and no morphisms from `D` to `C`, is a Cartesian
    correspondence associated to `g`: a Cartesian lift of `0 ⟶ 1` ending at `d` is the identity `g d ⟶ g d`. Reading
    the variance the other way would associate it to a functor `C ⟶ D`, which need not exist: for `D = ∅` and `C`
    nonempty there is none.
- **Mapping spaces.** `Map_C(x, y)` is the right mapping space, Tau Ceti `SSet.rightMappingSpace`.
  It is regarded as an object of the homotopy category `H` of spaces. A map of mapping spaces is "an
  isomorphism in `H`" when it is a weak homotopy equivalence of Kan complexes. Fully faithful functors are
  Tau Ceti's `SSet.IsFullyFaithful`.
  - *Check.* In the nerve of `[1]`, `Map(0, 1)` is contractible and `Map(1, 0)` is empty. In `S`, for `X` a
    circle, `Map_S(∗, X)` is a circle; a mapping "space" made of the edges `∗ ⟶ X` of `S` up to homotopy would
    be the one-point set `π₀ X` and would lose the loop.
- **Limits and colimits.** A colimit of `p : K ⟶ C` is an initial vertex of the coslice `C_{p/}`, Tau
  Ceti's `SSet.coslice.IsColimit p`, and a limit is a terminal vertex of `C_{/p}`, Tau Ceti's
  `SSet.slice.IsLimit p`. A functor preserves a colimit when the induced map of coslices
  (Tau Ceti `SSet.coslice.map`) carries a colimit cocone to a colimit cocone.
  - *Check.* For `K` empty, a colimit is an initial vertex of `C`: in the nerve of `[1]` the colimit of
    the empty diagram is `0` and the limit is `1`. In a Kan complex `Z` with one vertex `x` modeling
    `K(ℤ, 2)`, the vertex `x` is initial in the homotopy category (it has one morphism to itself) but is
    not an initial vertex, since `Map(x, x)` is a circle. A definition through the homotopy category would
    accept it.
- **Spaces.** `S` is the ∞-category of spaces of Part InfinityCategoryFoundations §7.1 (HTT, Def. 1.2.16.1, p. 69): the
  simplicial nerve of the Kan complexes of the base universe. "Small" means in the base universe.
  - *Check.* In `S`, `Δ[0]` and the nerve of the contractible groupoid with two objects are equivalent
    objects. A version built from the 1-category of Kan complexes, without inverting homotopy equivalences,
    would make them different, since they are not isomorphic there.
- **Trivial fibrations and weak homotopy equivalences.** A trivial fibration is a map with the right lifting
  property against all monomorphisms (Mathlib `SSet.rlp_monomorphisms`; Tau Ceti `SSet.rlp_monomorphisms_iff`
  compares it with the Kan-fibration form, HTT, Example 2.0.0.2). Weak homotopy equivalences are those of
  ModelCategoryTheory, Part KanQuillen §3.1: bijections on `π₀` of maps into every Kan complex.
  - *Check.* `∂Δ[1] ⟶ Δ[0]` is not a trivial fibration: the square with top edge the identity of `∂Δ[1]` and
    bottom edge `Δ[1] ⟶ Δ[0]` has no diagonal `Δ[1] ⟶ ∂Δ[1]`, since `∂Δ[1]` has no edge joining its two vertices. A
    definition asking only for surjectivity on vertices would accept it.
- **Localization.** A reflective localization is a functor `f : C ⟶ D` with a fully faithful right adjoint, and
  a localization functor an endofunctor equivalent to `g ∘ f` for such an `f` with right adjoint `g`; both are
  defined in §2.1 (HTT, Def. 5.2.7.2 and §5.2.7, p. 383, where the first is called a localization). In this Part
  the bare word "localization", or "localization at `W`", means the universal inversion `C[W⁻¹]` of a class of
  morphisms (HA, Def. 1.3.4.1, p. 108), defined in §2.4, which also compares the two notions.
  - *Check.* In the nerve of `[1]`, the functor `f : [1] ⟶ {1}` to the full subcategory on `1` is a
    reflective localization: its right adjoint is the inclusion, which is fully faithful. The composite
    endofunctor `L`, constant at `1`, is the associated localization functor, but it is not itself a
    reflective localization: a right adjoint `R` of `L` would need `Map(c, R 0) ≃ Map(L c, 0) = Map(1, 0) = ∅`
    for every `c`, impossible at `c = R 0`. The full subcategory `{0}` is not reflective: the retraction
    `[1] ⟶ {0}` is not left adjoint to the inclusion, since `Map(1, 0) = ∅` while `Map_{{0}}(0, 0)` is a point
    (§2.2.1, last Check). Yet the abstract functor `[1] ⟶ Δ[0]` is a reflective localization, through the vertex
    `1` (§2.1.1, first Check). A convention that read "reflective localization onto `C⁰`" as "the retraction is left
    adjoint to the given inclusion" would reject the second statement; one that ignored the side of the adjoint
    would accept `{0}` as reflective; one that confused the functor with the endofunctor would accept `L`.

## Exact supplier contracts

### From Mathlib

- `SSet.Quasicategory`, `SSet.QCat`, `SSet.QCat.bicategory` (`Mathlib/AlgebraicTopology/Quasicategory/`
  `Basic.lean`, `StrictBicategory.lean`): ∞-categories, bundled, and their bicategory whose 2-cells are
  morphisms in the homotopy categories of functor ∞-categories. Assumed: nothing beyond the definitions.
- `CategoryTheory.Bicategory.Adjunction`, `CategoryTheory.Bicategory.Adjunction.comp`
  (`Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean`): adjunctions in a bicategory and their
  composite.
- The instance `Quasicategory ((ihom K).obj C)` for a quasicategory `C`
  (`Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/PushoutProduct.lean`), and
  `SSet.innerAnodyneExtensions_pushoutObjObjι` in the same directory: the pushout-product of an inner anodyne
  map with a monomorphism is inner anodyne (HTT, Cor. 2.3.2.4).
- `SSet.KanComplex`, `SSet.rlp_monomorphisms`, `CategoryTheory.MonoidalClosed.pre`, `CategoryTheory.nerve`,
  `CategoryTheory.SimplicialCategory`, `CategoryTheory.SimplicialNerve`, `SSet.hoFunctor`.
- `CategoryTheory.Functor.IsLocalization`, `CategoryTheory.Reflective`: the 1-categorical notions met in
  nerve comparisons.
- `CategoryTheory.MorphismProperty.HasFunctorialFactorization`
  (`Mathlib/CategoryTheory/MorphismProperty/Factorization.lean`): functorial factorizations, as hypotheses
  on model categories.
- `HomotopicalAlgebra.ModelCategory`, `HomotopicalAlgebra.CofibrantObject`, `HomotopicalAlgebra.FibrantObject`,
  `HomotopicalAlgebra.BifibrantObject` and `HomotopicalAlgebra.CofibrantObject.localizerMorphism`
  (`Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`, `Bifibrant.lean`, `CofibrantObjectHomotopy.lean`): model
  categories, their cofibrant, fibrant and bifibrant objects, and the localized equivalence from cofibrant objects
  to the whole category.
- `HomotopicalAlgebra.CofibrantBrownFactorization` (`Mathlib/AlgebraicTopology/ModelCategory/BrownLemma.lean`):
  Ken Brown's lemma.
- 1-categorical comparison notions, used only in Checks and as later comparison targets: `CategoryTheory.Retract`.

### From Tau Ceti

- `SSet.coslice`, `SSet.coslice.map`, `SSet.slice`, `SSet.slice.map` (`TauCeti/AlgebraicTopology/SimplicialSet/`
  `Coslice.lean`, `Slice.lean`): slices and their functoriality.
- `SSet.coslice.IsColimit`, `SSet.slice.IsLimit` (`TauCeti/AlgebraicTopology/Quasicategory/Limit.lean`),
  `SSet.IsInitialVertex`, `SSet.IsTerminalVertex` (`InitialVertex.lean`, `TerminalVertex.lean`).
- `SSet.fullEnhancedSubcategory` and its quasicategory instance (`Quasicategory/FullSubcategory.lean`).
- `SSet.IsFullyFaithful` (`Quasicategory/FullyFaithful.lean`), `SSet.rightMappingSpace`
  (`Quasicategory/RightMappingSpace.lean`), `SSet.Edge.IsEquivalence` and `SSet.core` (`Quasicategory/Core.lean`).
- `SSet.LeftFibration`, `SSet.RightFibration` (`SimplicialSet/AnodyneExtensions/LeftRight/`),
  `SSet.CartesianFibration`, `SSet.Edge.IsCartesian` (`Quasicategory/Cartesian.lean`), `TauCeti.MarkedSSet`
  (`SimplicialSet/Marked/`).
- `SSet.rlp_monomorphisms_iff` (`SimplicialSet/TrivialFibration.lean`): trivial fibrations are the Kan fibrations
  with shrinkable fibers.

### From TauCetiRoadmap.InfinityCategoryTheory

- **Part InfinityCategoryFoundations:** the simplicial nerve, fully faithful maps, `H`-enriched homotopy categories and
  categorical equivalences (§2.1); functor ∞-categories, cores and full subcategories, final and initial objects,
  limits and colimits (§1.2); spaces (§7.1); essential surjectivity (§2.4); the filtration of `Δ[n] × Δ[1]` (§3.2); slices and
  their behavior along left anodyne maps (§4.1–§4.3); morphism spaces (§5.2); left fibrations and transport
  (§5.4); initial objects and the uniqueness of colimits (§5.5); the contravariant structure and fiberwise
  equivalences of left fibrations (§7.6); categorical fibrations, the Joyal model structure and its Quillen
  equivalence with simplicial categories (§9.4–§9.6).
- **Part CartesianFibrations:** coCartesian fibrations (§1.1); marked simplicial sets (§5.1); Cartesian, locally Cartesian and coCartesian edges and their mapping-space
  criteria (§1.4–§1.7); locally Cartesian fibrations (§2.3); fiberwise equivalences (§2.5); initial objects in a
  Cartesian fibration (§2.7); functor ∞-categories (§3.4); correspondences and the source fibration of an arrow
  ∞-category (§4.1, §4.4); marked anodyne maps, Cartesian fibrations as marked fibrant objects, the pointwise
  criterion, Cartesian equivalences and the Cartesian model structure over a point (§5.2, §5.3, §5.5–§5.7);
  mapping simplices and quasi-equivalences (§6.1–§6.3).
- **Part LimitsAndKanExtensions:** fat slices (§1.2); Kan extensions along full subcategories and along maps (§7.1); representable right fibrations (§3.4); the existence of
  Kan extensions and the trivial fibration of Kan extensions (§7.4); the independence of the correspondence for
  Kan extensions along a map (§7.6).

### From TauCetiRoadmap.ModelCategoryTheory

- **Part ModelCategories:** the small object argument (§1.4, HTT, Prop. A.1.2.5 (1)), homotopy extension (§3.2,
  HTT, Prop. A.2.3.1), Quillen adjunctions and derived functors (§4.1, HTT, §A.2.5), combinatorial model
  categories (§6.1, HTT, Def. A.2.6.1).
- **Part KanQuillen:** weak homotopy equivalences (§3.1).
- **Part SimplicialCategories:** simplicial model categories (§1.3, HTT, Def. A.3.1.5) and the Bergner model
  structure on simplicial categories (§5.4).
- **Part EnrichedLocalization:** the localization of a simplicial category at a set of morphisms and its
  universal property in the homotopy category of simplicial categories (§2.1, HTT, Notation A.3.5.1, Lemma
  A.3.5.4, Prop. A.3.5.5).

## How to read the build

Layer 1 relates adjunctions to correspondences and unit transformations, and proves the general facts about
adjoint functors: their detection on homotopy categories, the preservation of limits and colimits, the
representability criterion, adjunctions from simplicial categories and Quillen adjunctions, and Kan extension as
a left adjoint of restriction. Layer 2 builds on Layer 1: reflective subcategories, their identification with
left adjoints of full inclusions and with localization functors; the localization `C[W⁻¹]`, with reflective
localizations as the basic example and its presentation by simplicial categories; factorization systems as
reflective subcategories of arrows; the underlying ∞-category of a model category as a universal inversion of its
weak equivalences; and absolute Kan extensions along localizations, among them the derived functors of left
Quillen functors.

Each layer opens with the definitions it uses first: adjunctions and associated functors (§1.1), and reflective
localizations and retracts (§2.1). Later Parts cite these definitions there.

## Layer 1: Adjoint functors

### 1.1 Adjunctions and associated functors

**1.1.1.** Define an adjunction `f ⊣ g` between functors `f : C ⟶ D` and `g : D ⟶ C` of ∞-categories as an adjunction
between them in the bicategory of ∞-categories, Mathlib's `CategoryTheory.Bicategory.Adjunction` in
`SSet.QCat.bicategory`: a unit `id_C ⟶ g ∘ f` and a counit `f ∘ g ⟶ id_D` whose triangle composites are
homotopic to identities (Kerodon, Def. 6.2.1.1, tag 02EK; HTT, §1.2.7, p. 57, for the functor ∞-categories
involved).

**Checks.**
- For `f : Δ[0] ⟶ Δ[1]` picking `1` and `g : Δ[1] ⟶ Δ[0]`, the identity is a unit `id ⟶ g ∘ f`, but there is
  no counit `f ∘ g ⟶ id`, since its component at `0` would be an edge `1 ⟶ 0`. A unit-only definition would
  accept `f ⊣ g`.
- `Δ[1] ⟶ Δ[0]` has the vertex `1` as right adjoint and `0` as left adjoint, not the reverse: `Map(1, 0)` is
  empty, so `1` is not initial. A definition symmetric in `f` and `g` would accept both.
- On nerves the hom-categories of the bicategory are the functor categories, so an adjunction of ordinary
  categories gives one of their nerves, and conversely.

*Needs:* Mathlib `SSet.QCat.bicategory`, `CategoryTheory.Bicategory.Adjunction`.

**1.1.2.** Define, for a Cartesian fibration `p : M ⟶ Δ[1]` and categorical equivalences `h₀ : C ⟶ M₀` and
`h₁ : D ⟶ M₁` onto the fibers, a functor `g : D ⟶ C` to be associated to `M` when there is
`s : D × Δ[1] ⟶ M` over `Δ[1]` with `s|D × {1} = h₁`, `s|D × {0} = h₀ ∘ g`, and each `s|{x} × Δ[1]`
`p`-Cartesian (HTT, Def. 5.2.1.1, p. 353); dually for coCartesian fibrations, with a functor `C ⟶ D`.

**Checks.**
- For `M = Δ[2] ⟶ Δ[1]` (`0, 1` over `0`, `2` over `1`), the vertex `1 : Δ[0] ⟶ Δ[1]` is associated through
  the Cartesian edge `1 ⟶ 2`. The vertex `0` is not: `Map(1, 0)` is empty but `Map(1, 2)` is a point, so
  `0 ⟶ 2` is not Cartesian. A definition asking only that the edges lie over the edge of `Δ[1]` accepts both.
- The associated functor goes from the fiber over `1` to the fiber over `0`, against the base (Conventions,
  *Correspondences and variance*): in the example above it goes from the fiber `{2}` to the fiber `Δ[1]`.
- For `M` the nerve of the Grothendieck construction over `[1]` of a functor `G : D ⟶ C` of categories, `G` is
  associated. A definition asking only that each `s|{x} × Δ[1]` lie over the edge of `Δ[1]`, not that it be
  Cartesian, would also associate every functor `D ⟶ C` with a transformation to `G`, such as a constant
  functor at an initial object when `C` has one.

*Needs:* Tau Ceti `SSet.CartesianFibration`, `SSet.Edge.IsCartesian`; Part CartesianFibrations §1.1.1 (coCartesian edges); Part InfinityCategoryFoundations §2.1.6.

**1.1.3.** Define HTT's adjunction between ∞-categories `C` and `D` as a map `q : M ⟶ Δ[1]` that is a Cartesian and a
coCartesian fibration, with equivalences from `C` and `D` to its fibers; functors `f : C ⟶ D` and
`g : D ⟶ C` associated to `M` are then left and right adjoint (HTT, Def. 5.2.2.1, p. 358). Its agreement with
the bicategorical definition is proved in §1.3.

**Checks.**
- The same `M = Δ[2] ⟶ Δ[1]` is Cartesian and coCartesian (every edge into `2` is coCartesian), with
  `Δ[1] ⟶ Δ[0]` coCartesian-associated and `1` Cartesian-associated, so `Δ[1] ⟶ Δ[0]` is left adjoint to `1`.
  A definition that swapped the sides would make `1` initial.
- `M = Λ[2, 2] ⟶ Δ[1]` (two vertices over `0`, the cone point over `1`) is coCartesian with the fold map
  associated, but not Cartesian: no edge into the cone point is Cartesian, since its other vertex has no map to
  the source. Accordingly the fold map `Δ[0] ⊔ Δ[0] ⟶ Δ[0]` has no right adjoint. A definition asking for a
  coCartesian fibration only would make it a left adjoint.
- `M = Λ[2, 0] ⟶ Δ[1]` (the vertex `0` over `0`, the vertices `1` and `2` over `1`) is Cartesian with the fold
  map associated, but not coCartesian: `Map(1, 2)` is empty while `Map(0, 2)` is a point, so the edge `0 ⟶ 1` is
  not coCartesian, nor is `0 ⟶ 2`. Accordingly the fold map has no left adjoint. A definition asking for a
  Cartesian fibration only would make it a right adjoint.

*Needs:* §1.1.2 (associated functors); Tau Ceti `SSet.CartesianFibration`; Part CartesianFibrations §1.1.1.

### 1.2 The correspondence of a functor

**1.2.1.** Prove that every functor `g : D ⟶ C` of ∞-categories has an associated Cartesian correspondence, unique up
to equivalence (HTT, Prop. 5.2.1.3, p. 354):

- there is a Cartesian fibration `p : M ⟶ Δ[1]` whose fibers over `0` and `1` are isomorphic to `C` and
  `D` and to which `g` is associated;
- given a categorical equivalence `s : M ⟶ M'` over `Δ[1]` between Cartesian fibrations, under `C` and
  `D` with equivalences onto the fibers, `g` is associated to `M` exactly when it is associated to `M'`;
- any two Cartesian fibrations over `Δ[1]` to which `g` is associated are joined by a span
  `M' ⟵ M ⟶ M''` of categorical equivalences under `C ⊔ D` over `Δ[1]`.

*Proof route.* Lurie's. Factor the map from `(D^♮ × (Δ[1])^♯) ⊔ C^♮` (glued along `D^♮ × {0}`) to
`(Δ[1])^♯` by the small object argument into a marked anodyne map followed by a map with the right lifting
property, and read off a Cartesian fibration through the lifting characterization. The invariance is
homotopy extension in the Joyal model structure, and the span comes from the comparison of mapping simplices
with quasi-equivalences.

*Needs:*
- §1.1.2 (HTT, Def. 5.2.1.1, associated functors); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1, marked
  simplicial sets), Tau Ceti `TauCeti.MarkedSSet`, `SSet.CartesianFibration`;
- Tau Ceti `TauCeti.MarkedSSet.markedAnodyneExtensions` (HTT, Def. 3.1.1.1), §5.3.2 (HTT, Prop. 3.1.1.6, the lifting
  characterization), §6.1.1 (HTT, §3.2.2, mapping simplices), §6.3.1 (HTT, Prop. 3.2.2.10, quasi-equivalences) and §4.1.1
  (HTT, Def. 2.3.1.3, correspondences);
- Part InfinityCategoryFoundations §9.4.1 and §9.5.1 (HTT, §2.2.5, categorical fibrations and the Joyal model structure);
- ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1), small object argument) and §3.2.1 (HTT,
  Prop. A.2.3.1, homotopy extension).

**1.2.2.** Prove that associated functors compose (HTT, Prop. 5.2.1.5, p. 357): for a Cartesian fibration
`p : M ⟶ Δ[2]` with equivalences from `C`, `D`, `E` onto its three fibers, if `f : D ⟶ C` is associated
to the restriction of `M` over the edge `{0, 1}` and `g : E ⟶ D` to the restriction over `{1, 2}`, then
`f ∘ g : E ⟶ C` is associated to the restriction over `{0, 2}`.

*Proof route.* Lurie's: extend the two Cartesian homotopies over `Λ[2, 1]` to `Δ[2]` using that
`E × Λ[2, 1] ⊆ E × Δ[2]` is inner anodyne and that `p` is an inner fibration, and compose Cartesian
edges.

*Needs:*
- §1.1.2 (HTT, Def. 5.2.1.1);
- Part CartesianFibrations §6.1.1 (HTT, §3.2.2, the mapping simplex) and §4.1.1 (HTT, Def. 2.3.1.3);
- Mathlib `SSet.innerAnodyneExtensions_pushoutObjObjι` (HTT, Cor. 2.3.2.4);
- Tau Ceti `SSet.CartesianFibration`.

### 1.3 Unit transformations and the two definitions of adjunction

**1.3.1.** Define unit transformations (HTT, Def. 5.2.2.7, p. 360). For functors `f : C ⟶ D` and `g : D ⟶ C` of
∞-categories, a morphism `u : id_C ⟶ g ∘ f` of `Fun(C, C)` is a unit transformation when, for every object
`c` of `C` and `d` of `D`, the composite `Map_D(f c, d) ⟶ Map_C(g f c, g d) ⟶ Map_C(c, g d)` (apply `g`,
then precompose with `u(c)`) is an isomorphism in `H`.

- The condition depends only on the class of `u` in the homotopy category of `Fun(C, C)`.
- It is invariant under replacing `f` or `g` by an equivalent functor, with `u` transported.
- If `u` is a unit transformation for `(f, g)`, then `f ⊣ g` (§1.3.2).
- For the nerves of `F ⊣ G` between categories, the unit of the 1-categorical adjunction is a unit
  transformation: the composite is the hom-set bijection `Hom(F c, d) ≅ Hom(c, G d)` on discrete mapping
  spaces.

**Checks.**

- For `C = Δ[0]`, `D` the full subcategory of `S` on the connected spaces and `f` picking the point, the
  identity `id_C ⟶ g ∘ f` is not a unit transformation: for `d = S¹` the composite is `S¹ ⟶ ∗`. It is a
  bijection on `π₀`, so a definition testing only `π₀` of the composite would accept it.
- For `C` the nerve of `[1]`, `D = Δ[0]`, `f` the unique functor and `g` picking `1`, the transformation
  `u : id_C ⟶ g ∘ f` with components `0 ⟶ 1` and `id_1` is a unit transformation: every composite
  `Map_D(f c, ∗) ⟶ Map_C(c, 1)` goes from a point to a point. With `g` picking `0` there is no
  transformation `id_C ⟶ g ∘ f` at all, since its component at `1` would be a morphism `1 ⟶ 0`, so `f` is
  not left adjoint to `g`. A definition of the wrong variance, testing a transformation `g ∘ f ⟶ id_C`
  through the composites `Map_C(g d, c) ⟶ Map_D(d, f c)`, would accept `g` picking `0`, with the
  transformation of components `id_0` and `0 ⟶ 1`: every such composite goes from a point to a point. It
  detects `g ⊣ f`, not `f ⊣ g`.
- For `C = Δ[0]`, `D` the nerve of `[1]`, `f` the inclusion of `1` and `g` the unique functor, the
  identity `id_C ⟶ g ∘ f` is not a unit transformation: for `d = 0` the composite goes from the empty space
  `Map_D(1, 0)` to the point `Map_C(∗, ∗)`. With `f` the inclusion of `0` it is one, since `0` is
  initial. A definition asking only for some transformation `id_C ⟶ g ∘ f` would accept both.

*Needs:*
- Part InfinityCategoryFoundations §5.2.1 (HTT, §1.2.2, morphism spaces), Tau Ceti `SSet.rightMappingSpace`;
- Mathlib instance `Quasicategory ((ihom K).obj C)` (HTT, Prop. 1.2.7.3, the functor ∞-category `Fun(C, C)`).

**1.3.2.** Prove that unit transformations characterize adjoints and that the two definitions of adjunction agree
(HTT, Prop. 5.2.2.8, p. 361; §5.2.2, Def. 5.2.2.1, p. 358): for functors `f`, `g` of ∞-categories, the
following are equivalent:

1. `f ⊣ g` in `SSet.QCat.bicategory`;
2. `f` is left adjoint to `g` in HTT's sense: both are associated to one correspondence `M ⟶ Δ[1]` that is
   a Cartesian and a coCartesian fibration;
3. some `u : id_C ⟶ g ∘ f` is a unit transformation.

The unit of a bicategorical adjunction is a unit transformation.

*Proof route.* (1) ⇒ (3): the triangle identities make the unit a unit transformation, since the counit
supplies the inverse in `H` of the composite. (3) ⇒ (1) is Kerodon's characterization of units through
morphism spaces (Kerodon, Cor. 6.2.6.5, tag 02FX, (2) ⇒ (1)), which builds the counit and the triangle identities in the homotopy
categories of `Fun(C, D)` and `Fun(D, C)`. (2) ⇔ (3) is Lurie's Prop. 5.2.2.8: in a correspondence
associated to `f` and `g`, compose the coCartesian lift of `f` with the Cartesian lift of `g` to get `u`,
and read the mapping-space condition off the fiber sequences of Cartesian and coCartesian lifts;
conversely, the mapping-space condition is the criterion for the correspondence of `g` (§1.2) to have
coCartesian lifts.

*Needs:*
- §1.1.1 (HTT, §1.2.7, adjunctions; Defs. 5.2.1.1, 5.2.2.1); Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2);
- §1.2.1 (HTT, Prop. 5.2.1.3);
- §1.3.1 (HTT, Def. 5.2.2.7, unit transformations);
- Part CartesianFibrations §1.7.2 (HTT, Props. 2.4.4.2, 2.4.4.3), §4.1.1 (HTT, Def. 2.3.1.3) and §1.5.1 (HTT, §2.4.1,
  coCartesian edges);
- Kerodon, Cor. 6.2.6.5, tag 02FX (units through morphism spaces), for (3) ⇒ (1);
- Mathlib `SSet.QCat.bicategory`, `CategoryTheory.Bicategory.Adjunction`; Tau Ceti `SSet.Edge.IsCartesian`.

**1.3.3.** Prove that a Cartesian fibration `p : X ⟶ S` is also a coCartesian fibration exactly when, for every edge
`e : s ⟶ s'` of `S`, the transport functor `e^* : X_{s'} ⟶ X_s` associated to the pullback over `e` has a
left adjoint (HTT, Cor. 5.2.2.5, p. 359).

*Proof route.* Lurie's. First, locally coCartesian edges are coCartesian under a composition hypothesis on
2-simplices over the edge (HTT, Lemma 5.2.2.3, p. 358), by reducing to `S = Δ[n]` and the mapping-space
criterion for coCartesian edges. For a Cartesian fibration the hypothesis holds, because composites of
`p`-Cartesian edges are `p`-Cartesian, so an edge is `p`-coCartesian exactly when it is locally
`p`-coCartesian (HTT, Cor. 5.2.2.4, p. 359). This is a condition on each pullback over `Δ[1]`, and a
Cartesian fibration over `Δ[1]` is also coCartesian exactly when it is an adjunction in HTT's sense; apply
the agreement of definitions, §1.3.2.

*Needs:*
- §1.3.2 (HTT, Prop. 5.2.2.8, the agreement of the definitions);
- §1.1 (HTT, Defs. 5.2.1.1, 5.2.2.1; §1.2.7);
- Part CartesianFibrations §1.7.2 (HTT, Prop. 2.4.4.3, mapping-space criterion), §1.6.1 (HTT, Def. 2.4.1.11, locally
  Cartesian edges), §2.3.1 (HTT, Def. 2.4.2.6, locally Cartesian fibrations), §2.3.2 (HTT, Prop. 2.4.2.8), §1.4.1 (HTT,
  Prop. 2.4.1.7, composites of Cartesian edges) and §1.5.1 (HTT, §2.4.1, coCartesian edges);
- Part InfinityCategoryFoundations §5.2.1 (HTT, §1.2.2);
- Tau Ceti `SSet.CartesianFibration`.

### 1.4 Adjoints detected on homotopy categories

**1.4.1.** Prove that a functor whose `H`-enriched homotopy functor has a right adjoint has a right adjoint (HTT, Prop.
5.2.2.12, p. 363): if `f : C ⟶ D` is a functor of ∞-categories and `hf : hC ⟶ hD` has a right adjoint as an
`H`-enriched functor, then `f` has a right adjoint.

*Proof route.* Lurie's. For an inner fibration `p : M ⟶ Δ[1]` from `C = M₀` to `D = M₁`, a morphism
`c ⟶ d` from `C` to `D` is `p`-Cartesian exactly when composition with it induces homotopy equivalences
`Map_C(c', c) ⟶ Map_M(c', d)` for all `c'` (HTT, Lemma 5.2.2.10, p. 362), since over `Δ[1]` the relevant
fibers are empty or contractible. Hence `p` is Cartesian exactly when there is an `H`-enriched functor
`g : hD ⟶ hC` with natural identifications `Map_M(c, d) ≃ Map_C(c, g d)` (HTT, Lemma 5.2.2.11, p. 362): a
representing object `g d` and the identity of `Map_C(g d, g d)` give a Cartesian morphism `g d ⟶ d`. Apply
this to a coCartesian correspondence associated to `f` (dual of Prop. 5.2.1.3), whose mapping spaces are
`Map_D(f c, d)`; it is then also Cartesian, an adjunction in HTT's sense.

*Needs:*
- §1.2.1 (HTT, Prop. 5.2.1.3, dual form);
- §1.3.2 (HTT, Prop. 5.2.2.8, the agreement of the definitions);
- §1.1 (HTT, Defs. 5.2.1.1, 5.2.2.1; §1.2.7); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14, `H`-enriched
  homotopy categories);
- Part CartesianFibrations §1.7.2 (HTT, Prop. 2.4.4.3, the mapping-space criterion) and §4.1.1 (HTT, Def. 2.3.1.3);
- Tau Ceti `SSet.CartesianFibration`, `SSet.Edge.IsCartesian`.

### 1.5 Adjoints preserve limits and colimits

**1.5.1.** Prove that left adjoints preserve colimits and right adjoints preserve limits (HTT, Prop. 5.2.3.5, p. 367;
`Suggested.lean` declarations `isColimit_map_of_adjunction` and
`isLimit_map_of_adjunction`):
if `f ⊣ g` with `f : C ⟶ D`, then `f` carries every colimit cocone of a diagram `p : K ⟶ C` to a colimit
cocone of `f ∘ p`, and `g` carries every limit cone of a diagram in `D` to a limit cone.

*Proof route.* Lurie's, through the correspondence `M ⟶ Δ[1]` of the adjunction and a homotopy
`F : C × Δ[1] ⟶ M` from the inclusion to `f` through coCartesian edges. A colimit cocone `p̄` of `p : K ⟶ C`
stays a colimit cocone in `M`: Cartesian morphisms of `M` lift to Cartesian morphisms of the slices `M_{p/}`,
transport along them is a homotopy equivalence of fibers (HTT, Lemmas 5.2.3.2 and 5.2.3.3, pp. 364–366), so the
restriction `M_{p̄/} ⟶ M_{p/}` is a left fibration and a fiberwise homotopy equivalence, hence a trivial
fibration (HTT, Lemma 5.2.3.4, p. 366). Then `F` moves it to the fiber over `1`: for `P : K × Δ[1] ⟶ M` over
`Δ[1]` through coCartesian edges with `P|K × {0} = p`, restriction `M_{P/} ⟶ M_{p/}` becomes a trivial
fibration over the fiber over `1` (HTT, Lemma 5.2.3.1, p. 363), by fat slices and the initial-object
description of coCartesian edges. The statement for `g` is dual.

*Needs:*
- §1.3.2 (HTT, Prop. 5.2.2.8, the agreement of the definitions);
- §1.1 (HTT, Defs. 5.2.1.1, 5.2.2.1; §1.2.7); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4, colimits);
- Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2), §4.2.1 (HTT, Prop. 2.1.2.1), §4.3.1
  (HTT, Cor. 2.1.2.2), §4.3.2 (HTT, Prop. 2.1.2.5), §5.4.1 (HTT, Lemma 2.1.1.4) and §7.6.1 (HTT, Cor. 2.2.3.13 and
  Remark 2.2.3.3, dual form: fiberwise equivalences of left fibrations); Mathlib `SSet.rlp_monomorphisms` (HTT,
  Example 2.0.0.2);
- Part LimitsAndKanExtensions §1.2.1 (HTT, Prop. 4.2.1.5, fat slices);
- Part CartesianFibrations §2.5.3 (HTT, Cor. 2.4.4.6, dual form), §1.5.2 (HTT, Prop. 2.4.1.8; §2.4.1) and §4.1.1 (HTT,
  Def. 2.3.1.3);
- Tau Ceti `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`, `SSet.coslice.map`, `SSet.slice.map`,
  `SSet.LeftFibration`, `SSet.Edge.IsCartesian`.

### 1.6 The representability criterion for adjoints

**1.6.1.** Prove that a functor `f : C ⟶ D` of ∞-categories has a right adjoint exactly when, for every object `d` of
`D`, the right fibration `C ×_D D_{/d} ⟶ C` is representable (HTT, Prop. 5.2.4.2, p. 368; `Suggested.lean` declaration
`exists_rightAdjoint_iff`). Lurie states
the condition as: the pullback along `f` of every representable right fibration over `D` is representable;
the two agree because representability is invariant under equivalence of right fibrations and every
representable right fibration over `D` is equivalent to some `D_{/d} ⟶ D`. By the final-object
description of representable right fibrations (HTT, Prop. 4.4.4.5), this says that `C ×_D D_{/d}` has a
final object for every `d`.

*Proof route.* Lurie's. Choose a coCartesian correspondence `q : M ⟶ Δ[1]` associated to `f` (dual of Prop.
5.2.1.3). For an object `d` of `D`, there is a `q`-Cartesian morphism into `d` exactly when
`C ×_D D_{/d} ⟶ C` is representable (HTT, Lemma 5.2.4.1, p. 368): such a morphism is a final object of
`C ×_M M_{/d}`, which the coCartesian transformation identifies with `C ×_D D_{/d}`. So `M` is also
Cartesian exactly when the condition holds, which is HTT's definition of an adjunction; conclude with §1.3.

*Needs:*
- §1.2.1 (HTT, Prop. 5.2.1.3, dual form); §1.3.2 (HTT, Prop. 5.2.2.8, the agreement of the definitions);
- §1.1.2 (HTT, Def. 5.2.1.1), §1.1.3 (HTT, Def. 5.2.2.1); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12, final objects; HTT,
  Notation 1.2.7.2);
- Part LimitsAndKanExtensions §3.4.2 (HTT, Def. 4.4.4.4), §3.4.3 (HTT, Prop. 4.4.4.5);
- Part CartesianFibrations §1.7.2 (HTT, Prop. 2.4.4.3), §4.1.1 (HTT, Def. 2.3.1.3) and §1.5.1 (HTT, §2.4.1);
- Mathlib `SSet.rlp_monomorphisms` and Tau Ceti `SSet.rlp_monomorphisms_iff` (HTT, Example 2.0.0.2);
- Tau Ceti `SSet.slice`, `SSet.slice.π`, `SSet.IsTerminalVertex`, `SSet.RightFibration`,
  `SSet.Edge.IsCartesian`.

**1.6.2.** Prove that a section through fiberwise-initial objects is a left adjoint (HTT, Prop. 5.2.4.3, p. 369): if
`p : C ⟶ D` is a Cartesian fibration of ∞-categories with a section `s` such that `s(d)` is initial in the
fiber `C_d` for every `d`, then `s ⊣ p` (`Suggested.lean` declaration
`nonempty_adjunction_of_isInitialVertex`).

*Proof route.* Lurie's. Let `C⁰ ⊆ C` be the full subcategory of fiberwise-initial objects and `M ⊆ C × Δ[1]`
the full subcategory on `C⁰ × {0}` and `C × {1}`. First, `p|C⁰` is a trivial fibration onto `D`, and
`M ⟶ Δ[1]` is a Cartesian fibration whose edges from `(s p x, 0)` to `(x, 1)` out of the initial object
of the fiber are Cartesian (HTT, Prop. 5.2.4.3, first step of the proof, p. 369), by lifting against
`Λ[n, n]` and the initial-object lemma for Cartesian fibrations. `M` is the coCartesian correspondence of
`C⁰ ⊆ C`. Build `H : C × Δ[1] ⟶ C` over `D` from `s ∘ p` to the identity simplex by simplex. On
each simplex, use the filtration of `Δ[n] × Δ[1]` from HTT, Prop. 2.1.2.6: its steps are inner anodyne and
extend through the inner fibration `p`, and the last step, a pushout of `∂Δ[n+1] ⊆ Δ[n+1]` starting at an
initial object of a fiber, is filled by HTT, Lemma 2.4.4.8. Then `s ∘ p` is associated to `M` and `C⁰ ⊆ C` is left adjoint to `s ∘ p`.
Compose with the trivial fibration `p|C⁰`, whose inverse is `s`.

*Needs:*
- §1.3.2 (HTT, Prop. 5.2.2.8, the agreement of the definitions);
- §1.1.2 (HTT, Def. 5.2.1.1), §1.1.3 (HTT, Def. 5.2.2.1); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11, full subcategories) and §1.2 (HTT, §1.2.12, initial objects);
- Part InfinityCategoryFoundations §3.2.1 (HTT, Prop. 2.1.2.6, the filtration of `Δ[n] × Δ[1]`);
- Part CartesianFibrations §2.7.1 (HTT, Lemma 2.4.4.8 and Prop. 2.4.4.9, initial objects in a Cartesian fibration);
- Mathlib `CategoryTheory.Bicategory.Adjunction.comp`.

### 1.7 Adjunctions from simplicial and Quillen adjunctions

**1.7.1.** Prove that adjunctions of fibrant simplicial categories and simplicial Quillen adjunctions induce adjunctions
of ∞-categories:

- a simplicially enriched adjunction between fibrant (locally Kan) simplicial categories induces an
  adjunction of their simplicial nerves (HTT, Cor. 5.2.4.5, p. 370);
- a simplicial Quillen adjunction `F ⊣ G` between simplicial model categories `A` and `A'` induces an
  adjunction between `N(A°)` and `N(A'°)`, the nerves of the fibrant-cofibrant objects: the nerve of the
  full simplicial subcategory on fibrant-cofibrant objects of the correspondence of the enriched adjunction
  is an adjunction (HTT, Prop. 5.2.4.6, p. 371).

*Proof route.* Lurie's, through a mapping-space criterion: for a fibrant simplicial category `M` over `[1]`
with fibers `C` and `D`, `N(M) ⟶ Δ[1]` is a Cartesian fibration exactly when every object `d` of `D`
receives a morphism `c ⟶ d` from `C` inducing homotopy equivalences `Map_C(c', c) ⟶ Map_M(c', d)` for all
`c'` (HTT, Prop. 5.2.4.4, p. 370), by the description of Cartesian edges in nerves of fibrant simplicial
categories. For an enriched adjunction, apply it and its dual to the simplicial correspondence. For a
Quillen adjunction, apply it to the fibrant-cofibrant part: for a fibrant-cofibrant `d` of `A'`, the
derived counit `F(Q G d) ⟶ d` is the required morphism. On homotopy categories the associated functors are
`F ∘ Q` and `G ∘ R`, for cofibrant and fibrant replacements `Q` and `R`: the derived functors of the Quillen
adjunction (HTT, Remark 5.2.4.7, p. 372).

*Needs:*
- §1.3.2 (HTT, Prop. 5.2.2.8, the agreement of the definitions);
- §1.1 (HTT, Defs. 5.2.1.1, 5.2.2.1; §1.2.7); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11) and §2.1.4 (HTT,
  Def. 1.1.5.5, the simplicial nerve), §2.1.6 (HTT, Def. 1.1.5.14);
- Part CartesianFibrations §1.7.1 (HTT, Prop. 2.4.1.10) and §4.1.1 (HTT, Def. 2.3.1.3);
- Mathlib `SSet.rlp_monomorphisms` and Tau Ceti `SSet.rlp_monomorphisms_iff` (HTT, Example 2.0.0.2);
- ModelCategoryTheory, Part ModelCategories §4.1.1 (HTT, §A.2.5, Quillen adjunctions and derived functors);
- ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5);
- ModelCategoryTheory, Part KanQuillen §3.1.1 (weak homotopy equivalences);
- Mathlib `CategoryTheory.SimplicialNerve`, `CategoryTheory.SimplicialCategory`; Tau Ceti
  `SSet.CartesianFibration`.

### 1.8 Kan extensions as left adjoints to restriction

**1.8.1.** Prove that relative left Kan extension is left adjoint to restriction (HTT, Prop. 4.3.2.17, p. 302). Let
`C ⟶ D' ⟵ D` be functors of ∞-categories with `p : D ⟶ D'` a categorical fibration, and `C⁰ ⊆ C` a full
subcategory such that every functor in `Map_{D'}(C⁰, D)` has a `p`-left Kan extension along the inclusion.
Then the left Kan extension functor `Map_{D'}(C⁰, D) ⟶ Map_{D'}(C, D)` is left adjoint to restriction.

*Proof route.* Lurie's: the identity is a unit transformation (§1.3), since restriction of the relevant
mapping spaces is a trivial fibration by the extension lemma.

*Needs:*
- §1.3.2 (HTT, Prop. 5.2.2.8);
- §1.1.1 (HTT, §1.2.7); Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2, Kan extensions); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11);
- Part LimitsAndKanExtensions §7.4.5 (HTT, Lemma 4.3.2.12, Cor. 4.3.2.16);
- Part InfinityCategoryFoundations §9.4.1 (HTT, §2.2.5, categorical fibrations);
- Mathlib `SSet.rlp_monomorphisms` and Tau Ceti `SSet.rlp_monomorphisms_iff` (HTT, Example 2.0.0.2); Part
  InfinityCategoryFoundations §5.2.1 (HTT, §1.2.2).

**1.8.2.** Prove that left Kan extension along any map of simplicial sets is left adjoint to restriction (HTT, Prop.
4.3.3.7, p. 306; `Suggested.lean` declaration `exists_leftAdjoint_restrict`): for `δ : K⁰ ⟶ K¹` and an ∞-category `D` such that every functor `K⁰ ⟶ D` has a left
Kan extension along `δ`, a left Kan extension functor `δ_! : Fun(K⁰, D) ⟶ Fun(K¹, D)` is left adjoint to
`δ^*`.

*Proof route.* Lurie's. Factor `δ` through the mapping cylinder `K⁰ ⟶ M^op(δ) ⟶ K¹` with its retraction
`r`, so that `δ^*` is restriction to `K⁰` after `r^*`. Restriction from `Fun(M^op(δ), D)` to `K⁰` has the
left Kan extension functor as left adjoint. Prop. 4.3.2.17 does not apply to `K⁰ ⊆ M^op(δ)` directly,
since `M^op(δ)` is not an ∞-category in general, so pass to a fibrant correspondence (HTT, Rem. 4.3.3.3,
p. 304): choose a marked anodyne `M(δᵒᵖ)^♮ ⟶ N^♮` over `Δ[1]^♯` with `N ⟶ Δ[1]` a Cartesian fibration, and
put `𝒦 = Nᵒᵖ`, an ∞-category over `Δ[1]` with fiber `𝒦₀` over `0`, a full subcategory. The inclusion
`M^op(δ) ⟶ 𝒦` is a monomorphism and a quasi-equivalence, hence a categorical equivalence, and on fibers over
`0` it is a categorical equivalence `K⁰ ⟶ 𝒦₀`. Since `D` is an ∞-category, restriction along both maps is a
trivial fibration of functor ∞-categories. By the independence statement of Part LimitsAndKanExtensions §7.6
(HTT, Prop. 4.3.3.4), a functor on `M^op(δ)` is a left Kan extension along `δ` exactly when its extension to
`𝒦` is a left Kan extension of its restriction to `𝒦₀`. So, under these trivial fibrations, restriction from
`Fun(M^op(δ), D)` to `K⁰` is restriction from `Fun(𝒦, D)` to `Fun(𝒦₀, D)`, and its left adjoint is the left
Kan extension along the full inclusion `𝒦₀ ⊆ 𝒦` of ∞-categories, by Prop. 4.3.2.17. Restriction `j^*` to `K¹` is a coCartesian
fibration (HTT, Cor. 2.4.7.12 for the identity of `Fun(K⁰, D)ᵒᵖ`: target evaluation on `Fun(Δ[1], Fun(K⁰, D))`
is coCartesian, and `j^*` is its base change along `δ^*`; Part CartesianFibrations §4.4, dual form), and a fiberwise simplicial homotopy from the identity to `r^* ∘ j^*` makes
`r^*F` final in the fiber over `F`, so `r^*` is right adjoint to `j^*` by the dual of Prop. 5.2.4.3 (§1.6).
Compose the two adjunctions. `Suggested.lean` states the existence of the left adjoint, with HTT's Kan
extensions along a map (Part LimitsAndKanExtensions §7.1) written out through the mapping cylinder.

*Needs:*
- §1.8.1 (HTT, Prop. 4.3.2.17); §1.6.2 (HTT, Prop. 5.2.4.3);
- §1.1.1 (HTT, §1.2.7); Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2), §7.1.3 (HTT, Def. 4.3.3.1), §7.1.4 (HTT, Def. 4.3.3.2); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12)
  and §2.1.6 (HTT, Def. 1.1.5.14, categorical equivalences); Tau Ceti `SSet.fiber`; Mathlib pushouts in `SSet`;
- Part CartesianFibrations §4.4.2 (HTT, Cor. 2.4.7.12, dual form, for the identity of `Fun(K⁰, D)ᵒᵖ`: target
  evaluation is coCartesian), §5.3.1, §5.3.2 (marked anodyne maps and fibrant replacement),
  §6.2.1 (HTT, Def. 3.2.2.6, quasi-equivalences) and §6.3.1 (HTT, Prop. 3.2.2.10, quasi-equivalences are
  categorical equivalences), for the fibrant correspondence;
- Part LimitsAndKanExtensions §7.6.1 (HTT, Prop. 4.3.3.4, independence of the correspondence);
- Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1: restriction along a monic categorical equivalence into an
  ∞-category is a trivial fibration);
- Mathlib `CategoryTheory.Bicategory.Adjunction.comp`, `SSet.opFunctor`; Tau Ceti `SSet.CartesianFibration`.

### Examples

- For an adjunction `F ⊣ G` of categories, the nerves form an adjunction of ∞-categories (§1.3). By §1.5
  the nerve of `F` preserves the colimits of the nerve, which recovers the 1-categorical fact for small
  diagrams.
- The functor `C ⟶ Δ[0]` has a right adjoint exactly when `C` has a final object, by §1.6: the slice of
  `Δ[0]` over its vertex is a point, so the pullback is `C` itself. For `C = Δ[0] ⊔ Δ[0]` it has none.
- The simplicial Quillen adjunction between geometric realization and the singular complex gives an
  adjunction between the ∞-categories of fibrant-cofibrant simplicial sets and topological spaces (§1.7),
  whose functors are the derived realization and singular functors.
- For the inclusion `δ : ∂Δ[1] ⊆ Δ[1]` and an ∞-category `D` with binary coproducts, left Kan extension along `δ`
  sends a pair `(x, y)` to the edge `x ⟶ x ⊔ y`, and §1.8 makes it left adjoint to restriction
  `Fun(Δ[1], D) ⟶ Fun(∂Δ[1], D)`: maps from `x ⟶ x ⊔ y` to an edge `a ⟶ b` are pairs of maps `x ⟶ a`, `y ⟶ b`.

### Dependencies

Layer 1 uses: Part InfinityCategoryFoundations (full subcategories, initial and final objects, the simplicial nerve,
`H`-enriched homotopy categories, morphism spaces, slices, left anodyne maps, the filtration of `Δ[n] × Δ[1]`, categorical
fibrations and the Joyal model structure); Part CartesianFibrations (correspondences, Cartesian and coCartesian
edges, their mapping-space criteria, locally Cartesian fibrations, fiberwise equivalences, initial objects in a
Cartesian fibration, marked anodyne maps, mapping simplices and quasi-equivalences, the source fibration of an
arrow ∞-category); Part LimitsAndKanExtensions (fat slices, representable right fibrations, Kan extensions, their existence and
their trivial fibration); ModelCategoryTheory (the small object argument, homotopy extension,
Quillen adjunctions, simplicial model categories, weak homotopy equivalences); Mathlib's bicategory of
quasicategories, and Tau Ceti's slices, limits and fibrations.

## Layer 2: Localizations, factorization systems and derived functors

### 2.1 Reflective localizations and retracts

**2.1.1.** Define a functor `f : C ⟶ D` of ∞-categories to be a reflective localization when it has a fully faithful right
adjoint, and a colocalization when it has a fully faithful left adjoint (HTT, Def. 5.2.7.2, p. 383, where a
reflective localization is called a localization). An endofunctor `L : C ⟶ C` is a localization functor when it
is equivalent to `g ∘ f` for a reflective localization `f` with right adjoint `g` (HTT, §5.2.7, p. 383). The
localization `C[W⁻¹]` at a class of morphisms (HA, Def. 1.3.4.1) is a different notion, defined in §2.4. The
`Suggested.lean` declaration is `IsLocalizationFunctor`.

**Checks.**
- `Δ[1] ⟶ Δ[0]` is a reflective localization, its right adjoint picking the final object `1` and being fully
  faithful, and a colocalization, through the initial object `0`.
- `∂Δ[1] ⟶ Δ[0]` is neither: its right adjoint would pick a final object and its left adjoint an initial one,
  and `∂Δ[1]` has neither.
- The vertex `0 : Δ[0] ⟶ Δ[1]` has a right adjoint, `Δ[1] ⟶ Δ[0]`, since `0` is initial; that adjoint is not
  fully faithful, since `Map(1, 0)` is empty and goes to a point. So it is not a reflective localization. A
  definition asking only for a right adjoint would accept it.
- The nerve of the abelianization functor from groups to abelian groups is a reflective localization, matching
  Mathlib's `CategoryTheory.Reflective`.

*Needs:* §1.1.1 (adjunctions); Part InfinityCategoryFoundations §2.1.8 (fully faithful maps).

**2.1.2.** Define an object `Y` of an ∞-category `C` to be a retract of `X` when it is a retract of `X` in the homotopy
category `hC`: equivalently, there are morphisms `i : Y ⟶ X` and `r : X ⟶ Y` and a 2-simplex of `C` with edges
`i`, `r` and the identity of `Y` (HTT, §4.4.5, p. 321, in the second form).

**Checks.**
- In the nerve of `[1]`, `0` is not a retract of `1`, since there is no edge `1 ⟶ 0`. A definition asking only
  for a morphism `Y ⟶ X` would accept it.
- In the nerve of a category, retracts are the classical ones (Mathlib `CategoryTheory.Retract`).
- In the nerve of the category of sets, the one-point set is a retract of every nonempty set, while `∅` is a
  retract only of `∅`, since a nonempty set has no map to `∅`. So `∅` is not a retract of the one-point set,
  although it maps to it, and being a retract is not symmetric.

*Needs:* Mathlib `SSet.hoFunctor`, `CategoryTheory.Retract`.

### 2.2 Relative localizations and reflective subcategories

**2.2.1.** Define relative localizations (HTT, Def. 5.2.7.6, p. 385). For a full subcategory `C⁰ ⊆ C` of an
∞-category, a morphism `f : c ⟶ d` exhibits `d` as a `C⁰`-localization of `c` when `d` lies in `C⁰` and
composition with `f` induces isomorphisms `Map_{C⁰}(d, e) ⟶ Map_C(c, e)` in `H` for every object `e` of
`C⁰`. `C⁰` is reflective
when every object of `C` has a `C⁰`-localization (HTT, Remark 5.2.7.9, p. 386). The `Suggested.lean` declarations
`IsSubcategoryLocalization` and `IsReflectiveSubcategory` use the initial-object form of the first bullet below.

- A morphism `f : c ⟶ d` with `d` in `C⁰` is a `C⁰`-localization exactly when it is an initial object of
  `C_{c/} ×_C C⁰`, since the mapping spaces out of `f` there are the homotopy fibers of the maps
  `Map_{C⁰}(d, e) ⟶ Map_C(c, e)`; so `C⁰`-localizations are unique up to equivalence, by the contractibility
  of the space of initial objects (HTT, Remark 5.2.7.7, p. 385; Part InfinityCategoryFoundations §5.5 (HTT, Prop. 1.2.12.9)).
- An object of `C⁰` is its own `C⁰`-localization through the identity, and the condition depends only on
  the class of `f` in the homotopy category.

**Checks.**

- For `C` the nerve of `[1]` and `C⁰ = {1}`, the edge `0 ⟶ 1` exhibits `1` as a `C⁰`-localization of
  `0`, so `{1}` is reflective. For `C⁰ = {0}`, the object `1` has no `C⁰`-localization, since `Map(1, 0)` is
  empty. A definition through right adjoints (coreflective) would reverse the two.
- For `C` the nerve of the poset with `0 < 1` and `0 < 2` and `C⁰ = {1, 2}`, the object `0` has no
  `C⁰`-localization: for `d = 1` and `e = 2`, `Map(1, 2)` is empty while `Map(0, 2)` is a point. A
  definition asking only for some morphism from `c` into `C⁰` would accept both `0 ⟶ 1` and `0 ⟶ 2`.
- For `C⁰ = C`, the localizations of `c` are the equivalences out of `c`; a definition asking for
  isomorphisms of simplicial sets of maps would reject every non-identity equivalence in a Kan complex.
- For `C⁰` empty, no object has a `C⁰`-localization. A definition with the universal property but without
  the requirement `d ∈ C⁰` would let every morphism out of `c` serve, since the condition on `e ∈ C⁰` is
  then vacuous.
- For the nerve of a category, a full subcategory is reflective exactly when it is reflective in the
  classical sense. A definition asking only for a retraction `r` of the inclusion `i`, with `r ∘ i = id`,
  would accept `{0}` in the nerve of `[1]` through the constant functor at `0`, which is not a left adjoint:
  `Map(0, 0)` is a point and `Map(1, 0)` is empty.

*Needs:*
- Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11, full subcategories) and §1.2 (HTT, §1.2.12, initial objects), Tau
  Ceti `SSet.fullEnhancedSubcategory`;
- Part InfinityCategoryFoundations §5.2.1 (HTT, §1.2.2) and §5.5.3 (HTT, Prop. 1.2.12.9), §5.5.4 (HTT, Remark 1.2.13.5), Tau Ceti
  `SSet.rightMappingSpace`, `SSet.coslice`, `SSet.IsInitialVertex`.

### 2.3 Reflective subcategories, reflections and localization functors

**2.3.1.** Prove that a reflective subcategory, a left adjoint to a full inclusion and a localization functor are
three descriptions of one structure:

- for a full subcategory `C⁰ ⊆ C`, every object of `C` has a `C⁰`-localization exactly when the inclusion
  `C⁰ ⊆ C` has a left adjoint (HTT, Prop. 5.2.7.8, p. 385; `Suggested.lean` declaration
  `exists_leftAdjoint_fullSubcategoryι_iff`), the full subcategory being Tau Ceti's
  `SSet.fullEnhancedSubcategory`;
- for an endofunctor `L` of an ∞-category `C` with essential image `LC`, the following are equivalent (HTT,
  Prop. 5.2.7.4, p. 383; `Suggested.lean` declaration `isLocalizationFunctor_tfae`):
  1. `L` is equivalent to `g ∘ f` for some functor `f : C ⟶ D` with a fully faithful right adjoint `g`;
  2. `L`, viewed as a functor `C ⟶ LC`, is left adjoint to the inclusion `LC ⊆ C`;
  3. there is a natural transformation `α : id_C ⟶ L` such that `L(α(c))` and `α(L c)` are equivalences
     for every object `c`.

So the essential image of a localization functor is reflective, and for a reflective `C⁰` with reflection
`f` the composite of `f` with the inclusion is a localization functor with essential image `C⁰`. Condition
(1) says that `L` is a localization functor in the sense of §2.1. Condition (3) may be
stated with the two whiskered transformations invertible in the homotopy category of `Fun(C, C)`. A natural
transformation is invertible there exactly
when its components are equivalences, by the pointwise criterion (Part CartesianFibrations §5.5 (HTT, Prop.
3.1.2.1, over a point)).

The inclusion of a reflective subcategory `C⁰` preserves the limits that exist in `C⁰`, by §1.5 applied to
it as a right adjoint. If `C` has colimits of all `K`-indexed diagrams, so does `C⁰`, with the
colimit of `q : K ⟶ C⁰` given by the reflection of a colimit in `C` (no source; observed in HTT, Remark 5.2.7.5, p. 385): the
reflection preserves colimits as a left adjoint (§1.5), and its counit is an equivalence since the
inclusion is fully faithful.

*Proof route.* Lurie's, in two parts. For the first assertion, let `M ⊆ C × Δ[1]` be the correspondence of
the inclusion, a Cartesian fibration over `Δ[1]` associated to it. Its coCartesian edges from `(c, 0)` to
`(d, 1)` are, by the mapping-space test, exactly the `C⁰`-localizations. So `M` is coCartesian exactly when
they exist, which is HTT's definition of a left adjoint; conclude with §1.3. For the second, (2) ⇒ (1) is immediate
(take `D = LC`), and (1) ⇒ (2) replaces `D` by the essential image of the fully faithful `g`, which is `LC`.
For (2) ⇒ (3), take `α` to be the unit. Composition with `α(c)` gives bijections
`π₀ Map_C(L c, d) ⟶ π₀ Map_C(c, d)` for `d` in `LC`, so by Yoneda in `hC`, `α(L c)` is an equivalence.
Injectivity of composition with `α(c)` then shows `L(α(c))` homotopic to `α(L c)`, hence an equivalence.
For (3) ⇒ (2), composition with `α(c)` induces
bijections `π₀ Map_C(L c, d) ⟶ π₀ Map_C(c, d)` for `d` in `LC`, in three steps (HTT, Prop. 5.2.7.4, proof
of (3) ⇒ (2), p. 384):
- for `d` in `LC`, `α(d)` is an equivalence: `d ≃ L d'` for some `d'`, and `α(L d')` is invertible by (3);
- surjectivity: for `g : c ⟶ d` in `hC`, naturality of `α` gives `α(d) ∘ g = L(g) ∘ α(c)`, so
  `g = (α(d)⁻¹ ∘ L(g)) ∘ α(c)`;
- injectivity: if `h ∘ α(c) = h' ∘ α(c)` for `h, h' : L c ⟶ d`, then `L(h) ∘ L(α(c)) = L(h') ∘ L(α(c))`, so
  `L(h) = L(h')` since `L(α(c))` is invertible by (3); naturality gives `α(d) ∘ h = L(h) ∘ α(L c)`, and
  `α(d)` and `α(L c)` are invertible, so `h = h'`.

Apply this to `Fun(K, C)` for every Kan complex `K`, with the induced endofunctor, whose essential image
contains the constant functor at `d`, to get isomorphisms in `H`, and conclude with the unit criterion of §1.3.

*Needs:*
- for both assertions: §1.3.2 (HTT, Prop. 5.2.2.8, the agreement of the definitions); §1.1.1 (HTT, §1.2.7) and §2.1.1 (HTT, Def. 5.2.7.2); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11), §1.2 (HTT, Notation 1.2.7.2) and §2.1.8 (HTT, §1.2.10, fully faithful maps);
- for HTT Prop. 5.2.7.8: §2.2.1 (HTT, Def. 5.2.7.6, Remark 5.2.7.7); §1.2.1 (HTT, Prop. 5.2.1.3); §1.1.2 (HTT, Def. 5.2.1.1), §1.1.3 (HTT, Def. 5.2.2.1); Part CartesianFibrations §1.7.2 (HTT, Prop. 2.4.4.3), §4.1.1 (HTT,
  Def. 2.3.1.3) and §1.5.1 (HTT, §2.4.1); Tau Ceti `SSet.CartesianFibration`, `SSet.fullEnhancedSubcategory`;
- for HTT Prop. 5.2.7.4: Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14); Part CartesianFibrations §5.5.3 (HTT, Prop.
  3.1.2.1); Mathlib `SSet.KanComplex`, instance `Quasicategory ((ihom K).obj C)`; Tau Ceti
  `SSet.IsFullyFaithful`;
- for HTT Remark 5.2.7.5: §1.5.1 (HTT, Prop. 5.2.3.5); Tau Ceti `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`.

### 2.4 Localization at a class of morphisms

**2.4.1.** Define, for an ∞-category `C` and a collection `W` of morphisms of `C`, the statement that a functor
`f : C ⟶ D` into an ∞-category exhibits `D` as the localization `C[W⁻¹]` of `C` at `W` (HA, Def. 1.3.4.1,
p. 108). It means that for every ∞-category `E`, precomposition with `f` is a fully faithful functor
`Fun(D, E) ⟶ Fun(C, E)` whose essential image is the full subcategory `Fun^W(C, E)` of the functors carrying
every morphism of `W` to an equivalence. For an ordinary category `C`, `C[W⁻¹]` means `N(C)[W⁻¹]`. Testing
only the `E` of the universe of `C` and `D` is equivalent to testing every `E`, since the localization built
in §2.4.2 has the universal property against every `E` and is determined up to equivalence by the `E` of that
universe; HTT, Prop. 5.2.7.12 (§2.4.4), may quantify over `E` in the same way. Some authors call this a
Dwyer–Kan localization; here "localization at `W`" always means this notion (`Suggested.lean` declaration
`IsLocalizationAt`), and "reflective localization"
the notion of §2.1, studied in §2.2–§2.3.

- `C[W⁻¹]` is unique up to equivalence when it exists, and `f` carries `W` to equivalences (apply the
  definition to the identity of `D`).
- `f` is essentially surjective: the functor `C ⟶ D'` into the essential image `D' ⊆ D` of `f` inverts `W`,
  so it factors through `f` up to equivalence, and full faithfulness of precomposition makes the composite
  `D ⟶ D' ⊆ D` equivalent to the identity.
- On homotopy categories `f` is a localization of `hC` at the image of `W` in Mathlib's sense
  (`CategoryTheory.Functor.IsLocalization`): functors from a homotopy category to a category `A` are maps to
  the nerve of `A`, and `Fun(D, N(A))` is the nerve of the functor category from `hD` to `A`.
- Adding to `W` morphisms that every `W`-inverting functor inverts, such as the equivalences or the
  composites of morphisms of `W`, does not change `C[W⁻¹]`.

**Checks.**

- For `W` the equivalences of `C`, the identity of `C` exhibits `C` as `C[W⁻¹]`. A definition asking `f` to
  send `W` to identities, rather than to equivalences, would reject the identity of `C` whenever `C` has a
  non-identity equivalence.
- For `C` the nerve of `[1]` and `W` its non-identity morphism, `C[W⁻¹]` is `Δ[0]`. A definition asking only
  for a bijection on objects would accept the identity of the nerve of `[1]`.
- For `W` empty, `C[W⁻¹]` is `C`. A definition through homotopy categories alone would also accept the map
  from `C` to the nerve of `hC`: for a Kan complex with nonzero `π₂`, this map is an isomorphism on
  homotopy categories but not an equivalence.
- For `W` empty, the inclusion of `Δ[1]` into the nerve `J` of the free-living isomorphism is not a
  localization at `W`, although precomposition `Fun(J, E) ⟶ Fun(Δ[1], E)` is fully faithful for every `E`:
  its essential image is the functors inverting the edge, not all functors. A definition with only the
  full-faithfulness clause would accept it.

*Needs:*
- §1.1.1 (HTT, §1.2.7); Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2), §1.2.1 (HTT, §1.2.11, full subcategories) and §2.1.8 (HTT,
  Def. 1.2.10.1, fully faithful maps; Def. 1.1.5.14);
- Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3, functor ∞-categories);
- Mathlib `SSet.Quasicategory`, `CategoryTheory.MonoidalClosed.pre`, `CategoryTheory.nerve`,
  `SSet.hoFunctor`, `CategoryTheory.Functor.IsLocalization`; Tau Ceti `SSet.IsFullyFaithful`,
  `SSet.Edge.IsEquivalence`.

**2.4.2.** Prove that `C[W⁻¹]` exists for every ∞-category `C` and every collection `W` of its morphisms (no
source; HA, Remark 1.3.4.2, p. 108, sketches it from HTT, Prop. 3.1.3.7; `Suggested.lean` declaration
`exists_isLocalizationAt`).

*Proof route.* Lurie's. Enlarge `W` by the degenerate edges, which changes nothing. Take a fibrant
replacement `(C, W) ⟶ D^♮` of the marked simplicial set `(C, W)` in the Cartesian model structure over a
point. For an ∞-category `E`, the marked mapping object `Map^♭((C, W), E^♮)` is `Fun^W(C, E)` and
`Map^♭(D^♮, E^♮)` is `Fun(D, E)`, and a Cartesian equivalence induces categorical equivalences of marked
mapping objects into the fibrant `E^♮`. So `Fun(D, E) ⟶ Fun^W(C, E)` is a categorical equivalence onto a full
subcategory of `Fun(C, E)`.

*Needs:*
- §2.4.1 (HA, Def. 1.3.4.1);
- Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1);
- Part CartesianFibrations §5.3.2 (HTT, Prop. 3.1.1.6, fibrant objects over a point), §5.5.2 (HTT, §3.1.3,
  introduction, marked mapping objects), §5.6.1 (HTT, Prop. 3.1.3.3, Cartesian equivalences) and §5.7.1 (HTT,
  Prop. 3.1.3.7);
- Tau Ceti `TauCeti.MarkedSSet`; Mathlib `HomotopicalAlgebra.ModelCategory`.

**2.4.3.** Prove that the localization of simplicial categories presents `C[W⁻¹]` (no source; it combines HTT,
Lemma A.3.5.4 and Prop. A.3.5.5, pp. 910–911, with HTT, Thm. 2.2.5.1). Let `X` be an ∞-category and `W` a
set of its morphisms. An edge of `X` is a map `Δ[1] ⟶ X`, so `W` gives maps from `C[Δ[1]] = [1]_S` to the
simplicial category `C[X]`; let `C[X][W⁻¹]` be the localization of simplicial categories built from them by
pushout (HTT, Notation A.3.5.1, p. 909), and `C[X][W⁻¹] ⟶ D` a fibrant replacement in the Bergner model
structure. Then the map `X ⟶ N(D)` adjoint to the composite `C[X] ⟶ C[X][W⁻¹] ⟶ D` exhibits the ∞-category
`N(D)` as `X[W⁻¹]`.

*Proof route.* For an ∞-category `E`, write `[Y, E]` for the set of equivalence classes of functors
`Y ⟶ E`, the morphisms from `Y` to `E` in the homotopy category of the Joyal model structure. Choose a
fibrant `D'` with `E ≃ N(D')`. Through the Quillen equivalence `C[−] ⊣ N`, `[N(D), E]` is `[D, D']` in the
homotopy category of simplicial categories, which is `[C[X][W⁻¹], D']`; by HTT, Prop. A.3.5.5 this is the
subset of `[C[X], D']` of classes inverting `W` on homotopy categories, that is the subset of `[X, E]` of the
classes carrying `W` to equivalences. So precomposition is a bijection from `[N(D), E]` to the classes of
`Fun^W(X, E)`. Apply this to `Fun(K, E)` for every simplicial set `K`: since `Fun(K, Fun(Y, E))` is
`Fun(Y, Fun(K, E))`, and a functor into `Fun(K, E)` carries `W` to equivalences exactly when it does at
every vertex of `K` (Part CartesianFibrations §5.5 (HTT, Prop. 3.1.2.1)), precomposition
`Fun(N(D), E) ⟶ Fun^W(X, E)` is a bijection on `[K, −]` for every `K`, hence a categorical equivalence.

*Needs:*
- §2.4.1 (HA, Def. 1.3.4.1);
- Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, the Joyal model structure), §9.6.1 (HTT, Thm. 2.2.5.1, the
  Quillen equivalence with simplicial categories); Part CartesianFibrations §5.5.3 (HTT, Prop. 3.1.2.1);
- Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2) and §2.1.6 (HTT, Def. 1.1.5.14);
- ModelCategoryTheory, Part EnrichedLocalization §2.1.1 (HTT, Notation A.3.5.1; Lemma A.3.5.4; Prop. A.3.5.5)
  and Part SimplicialCategories §5.4.2 (the Bergner model structure).

**2.4.4.** Prove that reflective localizations are localizations (HTT, Prop. 5.2.7.12, p. 386; `Suggested.lean` declaration
`isLocalizationAt_corestrict`). Let `L : C ⟶ C` be a
localization functor with essential image `LC`, and `W` the morphisms `f` of `C` with `L f` an equivalence.
For every ∞-category `D`, composition with `L : C ⟶ LC` is a fully faithful functor
`Fun(LC, D) ⟶ Fun(C, D)`, whose essential image consists of the functors carrying every morphism of `W`
to an equivalence. So `C ⟶ LC` exhibits `LC` as `C[W⁻¹]`. Equivalently, for a reflective subcategory
`C⁰ ⊆ C` with left adjoint `L` and `W` the morphisms inverted by `L`, the composite `C⁰ ⊆ C ⟶ C[W⁻¹]` is an
equivalence (HA, Example 1.3.4.3, p. 108). On homotopy categories this gives a
Mathlib `CategoryTheory.Functor.IsLocalization`. The statement has two halves, full faithfulness of
precomposition with the corestriction of `L` onto its essential image and the description of the essential
image.

*Proof route.* Lurie's. A functor `F : C ⟶ D` inverting `W` is a right Kan extension of its restriction to
`LC`. The morphisms exhibiting `LC`-localizations are the initial objects of `LC ×_C C_{c/}` (Remark
5.2.7.7), so `F` is a right Kan extension exactly when it inverts them. By two out of three, applied to the
square from `f` to `L f`, this happens exactly when `F` inverts `W`. Restriction from these right Kan
extensions to `Fun(LC, D)` is fully faithful (HTT, Prop. 4.3.2.15). Composition with `L` is a right homotopy
inverse to it, so both are equivalences, which gives full faithfulness and the essential image.

*Needs:*
- §2.2.1 (HTT, Def. 5.2.7.6, Remark 5.2.7.7); §2.3.1 (HTT, Prop. 5.2.7.4);
- §2.1.1 (HTT, Def. 5.2.7.2); Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2, in its dual form for right Kan
  extensions); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11), §1.2 (HTT, §1.2.12) and §2.1.8 (HTT, §1.2.10, fully faithful maps);
- Part InfinityCategoryFoundations §2.4.1 (HTT, Def. 1.2.10.1, essential surjectivity);
- Part LimitsAndKanExtensions §7.4.6 (HTT, Prop. 4.3.2.15);
- Mathlib `CategoryTheory.MonoidalClosed.pre`, instance `Quasicategory ((ihom K).obj C)`;
- Tau Ceti `SSet.IsFullyFaithful`, `SSet.Edge.IsEquivalence`.

**2.4.5.** Prove the mapping-space form of the universal property (no source; a direct consequence of HA Def. 1.3.4.1).
A functor `f : C ⟶ D` of ∞-categories exhibits `D` as `C[W⁻¹]` exactly when, for every ∞-category `E`,
precomposition with `f` restricts to a homotopy equivalence from the core of `Fun(D, E)` onto the union of
those path components of the core of `Fun(C, E)` whose functors carry `W` to equivalences. That union is
well defined, since a functor equivalent to a `W`-inverting functor is `W`-inverting. So the space of
functors out of `C[W⁻¹]` is the space of `W`-inverting functors out of `C`.

*Proof route.* For "only if": a fully faithful functor induces on cores a homotopy equivalence onto the
union of the components meeting its essential image, since equivalences are detected on mapping spaces. For
"if": apply the hypothesis to `E` and to `Fun(Δ[1], E)`, using `Fun(Δ[1], Fun(D, E)) ≅ Fun(D, Fun(Δ[1], E))`;
the morphism spaces of `Fun(D, E)` are the fibers of the source-target map from the core of
`Fun(Δ[1], Fun(D, E))` to the product of two cores, so the two homotopy equivalences give equivalences of
morphism spaces, which is full faithfulness, and the statement on components is the essential image.

*Needs:*
- §2.4.1 (HA, Def. 1.3.4.1);
- Part InfinityCategoryFoundations §1.2 (HTT, §1.2.5, the core) and §2.1.8 (HTT, Def. 1.2.10.1);
- Part InfinityCategoryFoundations §5.2.1 (HTT, §1.2.2, morphism spaces as fibers);
- Tau Ceti `SSet.core`, `SSet.IsFullyFaithful`; Mathlib `SSet.KanComplex`.

**2.4.6.** Prove that localization is invariant under homotopy equivalences of pairs (no source; it is the argument
behind HA Remark 1.3.4.16). Let `(C, W)` and `(C', W')` be ∞-categories with collections of morphisms,
and let `i : C' ⟶ C` and `r : C ⟶ C'` be functors carrying `W'` into `W` and `W` into `W'`. Suppose the
composites `i ∘ r` and `r ∘ i` are joined to the identities by finite zigzags of natural transformations whose
components lie in `W` and `W'` respectively. Then the functor `C'[W'⁻¹] ⟶ C[W⁻¹]` induced by `i` is an
equivalence.

*Proof route.* A `W`-inverting functor carries a transformation with components in `W` to a transformation
with invertible components, which is invertible (Part CartesianFibrations §5.5 (HTT, Prop. 3.1.2.1, over a
point)). So precomposition with `i` and `r` are inverse equivalences between `Fun^W(C, E)` and
`Fun^{W'}(C', E)` for every `E`, hence between `Fun(C[W⁻¹], E)` and `Fun(C'[W'⁻¹], E)`; take `E` to be each
localization.

*Needs:* §2.4.1 (HA, Def. 1.3.4.1); Part CartesianFibrations §5.5.3 (HTT, Prop. 3.1.2.1); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14).

### 2.5 Orthogonality and factorization systems

**2.5.1.** Define orthogonality (HTT, Def. 5.2.8.1, p. 387). In an ∞-category `C`, a morphism `f : A ⟶ B` is left
orthogonal to `g : X ⟶ Y`, written `f ⊥ g`, when for every commutative square from `f` to `g` the mapping
space `Map(B, X)` in the double slice `C_{A/ /Y}` is contractible.

- Equivalently (HTT, Remark 5.2.8.3, p. 388), for every lift of `g` to `C_{A/}`, composition with it is a
  homotopy equivalence of the mapping spaces from `B`.
- Equivalently, the square of mapping spaces with corners `Map(B, X)`, `Map(B, Y)`, `Map(A, X)`,
  `Map(A, Y)` is a homotopy pullback.
- Orthogonality is invariant under equivalence of arrows in `Fun(Δ[1], C)`.

**Checks.**

- Every equivalence is left and right orthogonal to every morphism, since the double slice over an
  equivalence is contractible. In the nerve of `[1]`, `0 ⟶ 1` is not left orthogonal to itself: for the
  identity square the space of lifts `1 ⟶ 0` is empty. A definition asking only for uniqueness of lifts,
  where they exist, would accept this pair.
- In the nerve of the category of finite sets, the inclusion `∅ ⟶ ∗` is not left orthogonal to the
  surjection `{a, b} ⟶ ∗`: the square has two lifts `∗ ⟶ {a, b}`, so the mapping space is two points.
  A surjection is left orthogonal to an injection, with a unique lift. A definition asking only for the
  existence of lifts would accept the first pair.
- In `S`, the fold map `f : ∗ ⊔ ∗ ⟶ ∗` is not left orthogonal to a point `g : ∗ ⟶ S¹`: the square of
  mapping spaces has pullback corner `Map(∗, S¹) ×_{Map(∗ ⊔ ∗, S¹)} Map(∗ ⊔ ∗, ∗) ≃ ΩS¹ ≃ ℤ`, not
  `Map(∗, ∗) = ∗`. In `hS` every such square has exactly one lift, so a definition in the homotopy category
  would accept the pair.

*Needs:*
- Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2) and §5.2.1 (HTT, §1.2.2, morphism spaces).

**2.5.2.** Define factorization systems (HTT, Def. 5.2.8.8, p. 390). A factorization system on an ∞-category `C`
is a pair `(S_L, S_R)` of collections of morphisms that are closed under retracts. Every morphism of `S_L`
is left orthogonal to every morphism of `S_R`, and every morphism of `C` factors as a morphism of `S_L`
followed by one of `S_R`, through a 2-simplex of `C`.

- `S_L` is exactly the class of morphisms left orthogonal to all of `S_R`, and dually.
- Both classes contain the equivalences and are closed under composition.
- The factorization is unique up to equivalence in `Fun(Δ[1], C)`, as a `D`-localization in the sense of §2.2 (Lemma 5.2.8.19, §2.5.3).

**Checks.**

- On the nerve of `[1]`, (all morphisms, all morphisms) is not a factorization system: `0 ⟶ 1` is not left
  orthogonal to itself. (All morphisms, equivalences) and (equivalences, all morphisms) are. A definition
  without the orthogonality axiom would accept the first pair.
- On the nerve of a category, the factorization systems are the orthogonal factorization systems of the
  category, for example (surjections, injections) on finite sets. A weak factorization system such as
  (injections, surjections) on sets is not one, since lifts are not unique.
- On the nerve of `[1]`, (equivalences, equivalences) is not a factorization system, since `0 ⟶ 1` does not
  factor. A definition without the factorization axiom would accept it.

*Needs:*
- §2.5.1 (HTT, Def. 5.2.8.1);
- §2.1.2 (HTT, §4.4.5, retracts).

**2.5.3.** Prove that the right class of a factorization system is a reflective subcategory of the arrow ∞-category
(HTT, Lemma 5.2.8.19, p. 392). For a factorization system `(S_L, S_R)` on `C`, let `D ⊆ Fun(Δ[1], C)` be the
full subcategory on `S_R`. Then `D` is reflective. A morphism from `h` to `g` in `Fun(Δ[1], C)`, given by a
square with top edge `f` and bottom edge `e`, exhibits `g` as a `D`-localization of `h` exactly when
`g ∈ S_R`, `f ∈ S_L` and `e` is an equivalence.

*Proof route.* Lurie's. Mapping spaces in `Fun(Δ[1], C)` are fiber products of those of `C`. Orthogonality
makes the comparison of mapping spaces an equivalence for the factorization square, so it is a
`D`-localization, and §2.2 gives reflectivity. The converse is the uniqueness of `D`-localizations.

*Needs:*
- §2.5.1 (HTT, Def. 5.2.8.1), §2.5.2 (HTT, Def. 5.2.8.8);
- §2.2.1 (HTT, Def. 5.2.7.6, Remarks 5.2.7.7, 5.2.7.9); §2.3.1 (HTT, Prop. 5.2.7.8);
- §1.1.1 (HTT, §1.2.7) and §2.1.1 (HTT, Def. 5.2.7.2); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11);
- Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2) and §5.2.1 (HTT, §1.2.2, mapping spaces
  in `Fun(Δ[1], C)`).

### 2.6 The underlying ∞-category of a model category

**2.6.1.** Define, for a model category `A` (Mathlib's `HomotopicalAlgebra.ModelCategory`) with full subcategory of
cofibrant objects `A^c` (Mathlib's `HomotopicalAlgebra.CofibrantObject`) and `W` the weak equivalences
between cofibrant objects, the statement that a functor `f : N(A^c) ⟶ C` into an ∞-category exhibits `C` as
the underlying ∞-category `N(A^c)[W⁻¹]` of `A` (HA, Def. 1.3.4.15, p. 116). It means that `f` exhibits `C`
as the localization `N(A^c)[W⁻¹]` of §2.4: for every ∞-category `E`, precomposition with `f` is a fully
faithful functor `Fun(C, E) ⟶ Fun(N(A^c), E)` whose essential image consists of the functors carrying every
morphism of `W` to an equivalence.

- `A^c` is always regarded as an ordinary category, so `N(A^c)` is its nerve, even when `A` is a simplicial
  model category with simplicial mapping spaces (HA, Notation 1.3.4.17, p. 116).
- The underlying ∞-category is unique up to equivalence and exists for every model category, by the
  existence of localizations (§2.4, HA, Remark 1.3.4.2).
- On homotopy categories `f` induces a localization of `A^c` at `W` in Mathlib's sense
  (`CategoryTheory.Functor.IsLocalization`), hence the homotopy category of `A`, since the inclusion of the
  cofibrant objects is a localized equivalence (Mathlib `HomotopicalAlgebra.CofibrantObject.localizerMorphism`).

**Checks.**

- For a model category whose weak equivalences are the isomorphisms, such as any category with the trivial
  model structure, the underlying ∞-category is `N(A)`. A definition also inverting all morphisms would give
  a groupoid.
- For the Kan–Quillen model structure every simplicial set is cofibrant, so `N(A^c)` is `N(SSet)` and `W`
  is the weak homotopy equivalences. The functor `π₀ : N(SSet) ⟶ N(Set)` inverts `W` and not
  `∂Δ[1] ⟶ Δ[0]`, so by the universal property `f` does not carry `∂Δ[1] ⟶ Δ[0]` to an equivalence. A
  definition asking only that `f` invert `W` would accept the constant functor to `Δ[0]`, which inverts
  every morphism.
- For a simplicial model category, using the simplicial mapping spaces of `A^c` in place of its nerve would
  give the coherent nerve of the cofibrant objects, which is not an ∞-category when those mapping spaces are
  not Kan complexes; this is why `A^c` is taken as an ordinary category.

*Needs:*
- §2.4.1 (HA, Def. 1.3.4.1), §2.4.2 (HA, Remark 1.3.4.2), §2.4.4 (HTT, Prop. 5.2.7.12);
- §1.1.1 (HTT, §1.2.7); Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2), §1.2.1 (HTT, §1.2.11) and §2.1.8 (HTT, §1.2.10, fully faithful maps); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1);
- Part CartesianFibrations §5.7.1 (HTT, Prop. 3.1.3.7, the Cartesian model structure over a point);
- Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1), `HomotopicalAlgebra.CofibrantObject`,
  `HomotopicalAlgebra.CofibrantObject.localizerMorphism`, `CategoryTheory.Functor.IsLocalization`,
  `CategoryTheory.nerve`; Tau Ceti `SSet.IsFullyFaithful`.

**2.6.2.** Prove that the choice of objects does not matter when the factorizations are functorial (no source;
asserted in HA, Remark 1.3.4.16, p. 116). Let `A` be a model category whose morphisms admit functorial factorizations into a cofibration
followed by a trivial fibration and into a trivial cofibration followed by a fibration, as every
combinatorial model category does. Then the inclusions of the cofibrant, the fibrant and the bifibrant
objects into `A`, with the weak equivalences between such objects, induce equivalences of the localizations
`N(A°)[W⁻¹]`, `N(A^c)[W⁻¹]`, `N(A^f)[W⁻¹]` and `N(A)[W⁻¹]` at the weak equivalences. So the underlying
∞-category may be computed from any of the four.

*Proof route.* The functorial factorizations give a cofibrant replacement functor `Q` with a natural weak
equivalence `Q ⟶ id` and a fibrant replacement functor `R` with a natural weak equivalence `id ⟶ R`; `Q`
preserves fibrant objects, since `QX ⟶ X` is a trivial fibration, and `R` preserves cofibrant objects, since
`X ⟶ RX` is a trivial cofibration. They carry weak
equivalences to weak equivalences by two out of three, so the invariance of localization under homotopy
equivalences of pairs (§2.4) applies to each inclusion.

*Needs:*
- §2.4.1 (HA, Def. 1.3.4.1), §2.4.6 (the invariance under homotopy equivalences of pairs);
- §2.6.1 (HA, Def. 1.3.4.15);
- Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1), `HomotopicalAlgebra.CofibrantObject`,
  `HomotopicalAlgebra.FibrantObject`, `HomotopicalAlgebra.BifibrantObject`,
  `CategoryTheory.MorphismProperty.HasFunctorialFactorization`;
- ModelCategoryTheory, Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1, combinatorial model categories).

### 2.7 Absolute Kan extensions and derived functors

**2.7.1.** Define, for functors `i : X ⟶ X'` and `f : X ⟶ Y` of ∞-categories, that a functor `g : X' ⟶ Y` with a
natural transformation `ε : g ∘ i ⟶ f` exhibits `g` as a right Kan extension of `f` along `i` when, for
every functor `h : X' ⟶ Y`, composition with `ε` induces an isomorphism
`Map_{Fun(X', Y)}(h, g) ⟶ Map_{Fun(X, Y)}(h ∘ i, f)` in `H`; equivalently, `(g, ε)` is a final object of the
∞-category of such pairs. It is an absolute right Kan extension when, for every functor `p : Y ⟶ Y'` of
∞-categories, `(p ∘ g, p ε)` exhibits `p ∘ g` as a right Kan extension of `p ∘ f` along `i`
(Nikolaus–Scholze, App. A, paragraph before Def. A.8, p. 135; Lurie defines no absolute Kan extensions).
Left and absolute left Kan extensions are defined dually.

- This is the global form of a right Kan extension, through the whole functor ∞-category. If every functor
  `X ⟶ Y` has a right Kan extension along `i` in this sense, they assemble into a right adjoint of `i^*`, by
  the dual of §1.6; if every functor `X ⟶ Y` has a pointwise right Kan extension along `i` (the dual of Part LimitsAndKanExtensions §7.1), the dual of §1.8 makes them right Kan extensions in this sense.
- Right Kan extensions are unique up to equivalence, as final objects (Part InfinityCategoryFoundations §5.5 (HTT,
  Prop. 1.2.12.9)), and an equivalence `p` preserves them, so absoluteness is invariant under equivalence of
  the target.

**Checks.**

- For `i` the identity, `(f, id)` is an absolute right Kan extension of `f`. For `X = X' = Δ[0]`,
  `Y = Δ[1]`, `f = 1`, `g = 0` and `ε` the edge `0 ⟶ 1`, `(g, ε)` is not a right Kan extension: for `h = 1`,
  `Map(1, 0)` is empty while `Map(1, 1)` is a point. A definition accepting every transformation would accept
  it.
- For `X = ∅` and `X' = Δ[0]`, a right Kan extension of the empty functor to `Δ[1]` is a final object, `1`.
  It is not absolute: the functor `p : Δ[1] ⟶ Δ[2]` onto the edge `0 ⟶ 1` carries `1` to a non-final
  object. A definition omitting absoluteness would accept it.
- For `i : Δ[1] ⟶ Δ[0]` (the localization inverting the edge) and `f` the identity of `Δ[1]`, the limit `0`
  with `ε : const_0 ⟶ id` is an absolute right Kan extension, since a limit over an ∞-category with an
  initial object is evaluation there and every functor preserves it; but `ε` is not invertible, as `f` does
  not invert the edge. So absolute right Kan extensions along a localization need not be factorizations,
  and a definition identifying the two would reject it.

*Needs:*
- §1.6.1 (HTT, Prop. 5.2.4.2, in its dual form); §1.8.2 (HTT, Prop. 4.3.3.7, in its dual form);
- Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2), §7.1.4 (HTT, Def. 4.3.3.2); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12, final objects; HTT,
  Notation 1.2.7.2);
- Part InfinityCategoryFoundations §5.2.1 (HTT, §1.2.2) and §5.5.3 (HTT, Prop. 1.2.12.9);
- Tau Ceti `SSet.rightMappingSpace`, `SSet.IsTerminalVertex`.

**2.7.2.** Prove that along a localization, the factorization of an inverting functor is an absolute right Kan
extension (Nikolaus–Scholze, Ex. A.9, p. 136). Let `i : X ⟶ X[W⁻¹]` exhibit a localization (§2.4) and let
`f : X ⟶ Y` carry `W` to equivalences, so that `f ≃ g ∘ i` for a functor `g` out of `X[W⁻¹]`. Then `g`, with
the invertible transformation `ε : g ∘ i ⟶ f`, is an absolute right Kan extension of `f` along `i`.

*Proof route.* Nikolaus–Scholze's. For `h : X[W⁻¹] ⟶ Y`, full faithfulness of `i^*` gives
`Map(h, g) ≃ Map(h ∘ i, g ∘ i) ≃ Map(h ∘ i, f)`. For `p : Y ⟶ Y'`, `p ∘ f` also inverts `W`, and the same
argument applies to `p ∘ g`.

*Needs:* §2.4.1 (HA, Def. 1.3.4.1); §2.7.1 (Nikolaus–Scholze, App. A, absolute Kan extensions).

**2.7.3.** Prove that a Quillen left derived functor is an absolute right Kan extension (Nikolaus–Scholze, Ex. A.10,
pp. 136–137). Let `F : M ⟶ N` be a left Quillen functor of model categories, and suppose that `M` has a
functorial cofibrant replacement: a functor `Q` with a natural weak equivalence `q : Q ⟶ id` and `QX`
cofibrant for every `X`. Localize `N(M)` and `N(N)` at all their weak equivalences (§2.4, HA,
Remark 1.3.4.2; under functorial factorizations these are the underlying ∞-categories, §2.6). The functor `X ↦ F(QX)` carries weak equivalences to weak equivalences, by Ken Brown's
lemma, so it induces `LF : N(M)[W⁻¹] ⟶ N(N)[W⁻¹]`, and `F(q)` gives a transformation from `LF` composed
with the localization of `N(M)` to the composite `N(M) ⟶ N(N) ⟶ N(N)[W⁻¹]`. This exhibits `LF` as an
absolute right Kan extension of that composite along `N(M) ⟶ N(M)[W⁻¹]`.

*Proof route.* Nikolaus–Scholze's. For an ∞-category `D`, let `R : Fun(N(M), D) ⟶ Fun(N(M), D)` be
precomposition with `Q`, with the transformation `β : R ⟶ id` from `q`. Let `E` be the full subcategory of
functors `G` that invert the weak equivalences between cofibrant objects. It contains `N(M) ⟶ N(N) ⟶ N(N)[W⁻¹]`,
by Ken Brown's lemma (Mathlib `HomotopicalAlgebra.CofibrantBrownFactorization`), and `R` preserves it. On `E` both
whiskerings of `β` are invertible: `β_{R G}` has components `G(Q(q_X))` and `R(β_G)` has components
`G(q_{QX})`, images of weak equivalences between cofibrant objects. The essential image of `R` on `E` is the
weak-equivalence-inverting functors. So `R` is a colocalization functor on `E` with these local objects, by the
dual of the characterization of localization functors (§2.3, HTT, Prop. 5.2.7.4 (3)), and since `E` is full in
`Fun(N(M), D)`, `R(G) ⟶ G` is the right Kan extension of `G` along the localization (§2.4). The
argument holds for every `D` and commutes with postcomposition, which gives absoluteness; apply it to
`G : N(M) ⟶ N(N) ⟶ N(N)[W⁻¹]`, for which `R(G)` is `X ↦ F(QX)`.

*Needs:*
- §2.3.1 (HTT, Prop. 5.2.7.4, in its dual form); §2.4.1 (HA, Def. 1.3.4.1), §2.4.2 (HA, Remark 1.3.4.2); §2.7.1;
- ModelCategoryTheory, Part ModelCategories §4.1.1 (HTT, §A.2.5, Quillen adjunctions and derived functors);
- Mathlib `HomotopicalAlgebra.ModelCategory`, `HomotopicalAlgebra.CofibrantBrownFactorization` (Ken Brown's
  lemma), `CategoryTheory.MorphismProperty.HasFunctorialFactorization`.

### Examples

- The full subcategory of `S` on the contractible spaces is reflective, with reflection the map to a
  point (§2.2).
- For a factorization system on `C`, the right class gives a localization functor on `Fun(Δ[1], C)`
  (§2.5, §2.3).
- For a reflective subcategory `C⁰` of the nerve of a category, §2.4 recovers the 1-categorical fact that
  the reflector is a localization at the morphisms it inverts.
- Localizing the nerve of `[1]` at its non-identity edge gives `Δ[0]` (§2.4); by Prop. 5.2.7.12 this is also the
  reflection onto the full subcategory on `1`, whose reflector inverts exactly that edge and the identities.
- For a left Quillen functor `F` with a functorial cofibrant replacement in its source, the derived functor `LF`
  between the localizations at the weak equivalences, which are the underlying ∞-categories (§2.6), is an
  absolute right Kan extension along the localization (§2.7); for `F` the identity of a model category it is the
  identity of the underlying ∞-category.

### Dependencies

Layer 2 uses Layer 1 (§1.1, §1.2, §1.3, §1.5, §1.6, §1.8); Part InfinityCategoryFoundations (full subcategories,
fully faithful maps, slices, mapping spaces, essential surjectivity, initial objects, the Joyal model structure and
its comparison with simplicial categories); Part CartesianFibrations (marked simplicial sets, functor ∞-categories,
the pointwise criterion, marked fibrant objects, marked mapping objects, Cartesian equivalences and the Cartesian
model structure over a point); Part LimitsAndKanExtensions (Kan extensions, and Kan extension as a trivial
fibration, for HTT, Prop. 5.2.7.12); ModelCategoryTheory (the localization of simplicial categories and the Bergner
model structure for §2.4 of this Part, combinatorial model categories and Quillen adjunctions for §2.6 and §2.7 of
this Part); Mathlib's model categories, functorial factorizations and Ken Brown's lemma; Tau Ceti's full
subcategories, fully faithful maps and equivalences.

## Downstream consumers

This roadmap is used by every later member of the InfinityCategoryTheory family, each of which lists what it uses from it in its own supplier contracts.

## References

- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Cited here: §5.2.1–§5.2.4 and §5.2.7–§5.2.8 (adjunctions, localizations, factorization systems),
  pp. 353–392; Props. 4.3.2.17 and 4.3.3.7, pp. 302–306; Notation A.3.5.1, Lemma A.3.5.4 and Prop. A.3.5.5,
  pp. 909–911 (compared in §2.4).
- **HA.** Jacob Lurie, *Higher Algebra*, author's PDF, version of 18 September 2017,
  [math.ias.edu/~lurie/papers/HA.pdf](https://www.math.ias.edu/~lurie/papers/HA.pdf). Statement numbers and pages
  are those of this PDF, whose PDF and printed page numbers agree.
  Cited here:
  Def. 1.3.4.1, Remark 1.3.4.2 and Example 1.3.4.3, p. 108 (the localization `C[W⁻¹]`); Def. 1.3.4.15,
  Remark 1.3.4.16 and Notation 1.3.4.17, p. 116 (the underlying ∞-category of a model category).
- **Nikolaus–Scholze.** Thomas Nikolaus and Peter Scholze, *On topological cyclic homology*, Acta
  Mathematica 221 (2018), 203–409, [arXiv:1707.01799](https://arxiv.org/abs/1707.01799). Cited here: App. A,
  the paragraph before Def. A.8 (absolute Kan extensions), Exs. A.9 and A.10, pp. 135–137, with page numbers of
  arXiv version 2.
- **Kerodon.** Jacob Lurie, *Kerodon*, an online resource for homotopy-coherent mathematics,
  [kerodon.net](https://kerodon.net). Cited for the characterization of units of adjunctions through
  morphism spaces, Cor. 6.2.6.5 (tag [02FX](https://kerodon.net/tag/02FX)), with the definition of
  adjunction of §6.2.1.
