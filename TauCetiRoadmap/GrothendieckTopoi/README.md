# Roadmap: Grothendieck topoi

**Summary.** This roadmap builds the theory of Grothendieck topoi as a subject in its own right:
the predicate "is a Grothendieck topos" with Giraud's theorem; geometric morphisms, their 2-cells
and the 2-category they form, morphisms of sites and Diaconescu's theorem; induced topoi and étale
morphisms; subtopoi, universal closure operators, Lawvere–Tierney topologies, open and closed
subtopoi, gluing and the surjection–embedding factorization; connected, locally connected, local,
hyperconnected and localic morphisms; points and fibre functors with Deligne's theorem; locales and
localic topoi with the localic reflection; and fibre products of topoi, ending with
`Sh(S × T) ≃ Sh(S) × Sh(T)` for core-compact `S` and its failure for `ℚ × ℚ`.

Mathlib already has the site-level half of this subject: Grothendieck topologies and sheaves,
continuous and cocontinuous functors with their sheaf pushforwards, `sheafPullback`, dense subsites
and the comparison lemma, the topology `J.over X` on a slice, the closure operator of a topology,
points of a site with `HasEnoughPoints`, the subobject classifier of a sheaf category, frames,
locales, nuclei and sublocales. What it lacks is the topos-level half: statements about a category
that is *equivalent* to a sheaf category without the site being part of the data, and maps between
such categories. Tau Ceti has no topos material. This roadmap supplies that half and makes every
site-level construction it uses into a statement about topoi.

Suggested homes in Tau Ceti are `TauCeti/CategoryTheory/Topos/` for Layers 1–6 and 8 and
`TauCeti/Order/Locale/` together with `TauCeti/CategoryTheory/Topos/Localic/` for Layer 7. The
file split is an implementation choice; the dependency order below is not.

## Scope boundary

In scope: Grothendieck topoi in a fixed universe, geometric morphisms between them, and the
constructions and classes of morphisms listed in Layers 1–8. A statement belongs here exactly when
it is about Grothendieck topoi and geometric morphisms in general, or about the topoi of
topological spaces and locales, and is not already owned by one of the suppliers below. Several of
those suppliers state their material for arbitrary small sites or topoi; that generality does not
move it here. What this roadmap adds to their material is the passage from a sheaf category on a
chosen site to a topos given without a site, and the comparisons with geometric morphisms.

| Interface | Owner | Contribution here |
|---|---|---|
| Sites, sheaves, sheafification, continuous and cocontinuous functors and their sheaf adjunctions | Mathlib | Layer 2 packages them as geometric morphisms; no underlying sheaf functor is rebuilt |
| Points of a site, fibre and skyscraper functors, `HasEnoughPoints` | Mathlib (`Sites/Point/`) | Layer 6 compares them with geometric morphisms from `Type u`, keeping Mathlib's category of points and its variance |
| Subobject classifier of a sheaf category | Mathlib (`Subobject.Classifier`, `Sheaf.classifier`) | Layer 1 transports it to every Grothendieck topos |
| Power objects in a cartesian monoidal category | mathlib4#26757, ported under its names (see *Ported from open Mathlib pull requests*) | Layer 1: every object of a Grothendieck topos has one |
| Locally connected sites and their `π₀` | mathlib4#41216, ported under its names | Layer 5: a locally connected site gives a locally connected topos |
| Quasicompact and quasiseparated objects and morphisms, algebraic topoi | AdicSpacesPartII R0.19.10 | Layer 6: invariance under change of site, coherent topoi, Deligne's theorem |
| Stacks on a site, stackification, 2-fibre products of stacks | SchemeAndStackFoundations §1.18 | none; the fibre products of topoi of Layer 8 are pseudo-pullbacks of topoi, not 2-fibre products of stacks |
| Cohomology on sites and its spectral sequences | Mathlib, Tau Ceti, SchemeAndStackFoundations §§2.1–2.5 | none |
| Topoi of schemes and algebraic spaces, their comparison morphisms, repleteness | SchemeAndStackFoundations §§1.10, 2.9–2.17 | none; their morphisms of topoi are bundled by Layer 2 when needed |
| Ringed and derived topoi, enhanced pullback and pushforward | EnhancedDerivedSheaves, SchemeAndStackFoundations, AdicSpacesPartII, RigidAnalyticGeometry §8.3 | none; bundled, the underlying morphism of topoi is a `GeometricMorphism` of Layer 2 |
| General geometric morphisms, their 2-cells and bicategory, subtopoi, the localic factorization | this roadmap | Layers 2–5 and 7 |

Owned elsewhere and consumed here, never restated:

- *Topoi of schemes and algebraic spaces* (small and big étale, Nisnevich, fppf and pro-étale
  sites, replete topoi, ringed topoi of schemes and algebraic spaces):
  [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §§1.10, 2.9–2.17. Its
  morphisms of topoi (`smallEtale_map`, `epsilonFppfEtale` and the other comparison morphisms of
  §2.10) keep their constructions there; where they come from a continuous, finite-limit-preserving
  or a cocontinuous functor of small sites, their bundled form is `GeometricMorphism.ofContinuous`
  or `GeometricMorphism.ofCocontinuous` applied to that functor, with no further construction.
- *Stacks and stackification on a site*: SchemeAndStackFoundations §1.18, which owns the generic,
  site-level `Stack.stackification` and `Stack.twoFibreProduct` for every small site, not only their
  fppf specialisations.
- *Cohomology on sites* (Mathlib's `Sheaf.H`, pullback and higher direct images, Leray and Čech
  spectral sequences, torsors): Mathlib, Tau Ceti's
  `TauCeti/CategoryTheory/Sites/SheafCohomology/`, and SchemeAndStackFoundations §§2.1–2.5. No
  cohomology appears in this roadmap.
- *Quasicompact and quasiseparated objects and morphisms of a topos, algebraic topoi*:
  [AdicSpacesPartII](../AdicSpacesPartII/README.md) R0.19.10, namespace
  `TauCetiRoadmap.AdicSpacesPartII.Topos`, stated there for an arbitrary small site with its
  permanence lemmas. Layer 6 uses `Topos.IsQuasicompact`, `Topos.IsQuasiseparated`,
  `Topos.Hom.IsQuasicompact`, `Topos.Hom.IsQuasiseparated` and `Topos.IsAlgebraic` as defined there,
  adds their invariance under equivalences of sheaf categories, and defines no second qcqs notion.
- *Enhanced and derived categories of sheaves on ringed sites and topoi*, their pullback and
  pushforward along morphisms of ringed topoi, and the inverse-limit theory of replete topoi:
  [EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md).
- *Ringed topoi of rigid and adic spaces and their comparison*: AdicSpacesPartII and
  [RigidAnalyticGeometry](../RigidAnalyticGeometry/README.md) §8.3.

Neighbouring subjects that share words with this one: the classifying topos `B G` of a group
(Examples and checks) is not the topological classifying space of
[ClassifyingSpaces](../ClassifyingSpaces/README.md), and the 2-category of topoi of Layer 2 is not
the homotopy theory of small categories of
[HomotopyTheoryOfCategories](../HomotopyTheoryOfCategories/README.md), which uses sites only as
bases of coefficient stacks.

Outside every layer: elementary topoi axiomatized without a site (the subobject classifier of a
sheaf category is used, from Mathlib, as a property of that category); ringed and
module-theoretic topoi; fibred and indexed topoi beyond the slice-wise conditions stated in
Layer 5; open, proper, tidy and atomic geometric morphisms; classifying topoi of geometric
theories. Points of a topos enter only through geometric morphisms from `Type u` and Mathlib's
fibre functors, never through models of theories.

## Conventions

1. **Universes.** Fix a universe `u`. A *site* is `C : Type u` with `[SmallCategory C]` and
   `J : GrothendieckTopology C`. A Grothendieck topos lives at `E : Type (u+1)` with
   `[Category.{u} E]`, the size of `Sheaf J (Type u)`. Statements about a site whose category is
   only essentially small go through Mathlib's `Sites/Equivalence` and are never a second
   definition.
2. **The predicate.** `IsGrothendieckTopos E : Prop` holds when there exist a small site `(C, J)`
   in universe `u` and an equivalence `E ≌ Sheaf J (Type u)`. The site is not data: nothing in
   this roadmap depends on a chosen site, and every construction that uses one proves its
   independence of the choice (up to equivalence, naturally in the data involved). Where a
   statement needs limits, colimits or exponentials of `E` as instances, it carries them as
   instance arguments and Layer 1 proves that a Grothendieck topos has them.
3. **Geometric morphisms.** `GeometricMorphism E F` is a structure with
   `direct : E ⥤ F` (the direct image `f_*`), `inverse : F ⥤ E` (the inverse image `f^*`),
   `adj : inverse ⊣ direct`, and `PreservesFiniteLimits inverse`. A geometric morphism goes in the
   direction of its direct image: `f : E → F` has `f_* : E ⥤ F`. Composition `f ≫ g` for
   `f : E → F`, `g : F → G` has direct image `f.direct ⋙ g.direct`, inverse image
   `g.inverse ⋙ f.inverse`, and adjunction `g.adj.comp f.adj` (Mathlib's `Adjunction.comp`).
4. **2-cells.** A 2-cell `f ⟶ g` between geometric morphisms `E → F` is a natural transformation
   `f.direct ⟶ g.direct`, as in SGA 4 IV 3.2. Its conjugate under the two adjunctions
   (Mathlib's `conjugateEquiv`) is `g.inverse ⟶ f.inverse`. This is the direction of Mathlib's
   `GrothendieckTopology.Point.Hom`, whose morphism `Φ₁ ⟶ Φ₂` is a natural transformation
   `Φ₂.fiber ⟶ Φ₁.fiber` between inverse-image-like functors. Johnstone's Elephant (A4.1.1) and
   Mac Lane–Moerdijk call a natural transformation `f^* ⟶ g^*` a geometric transformation
   `f ⇒ g`; translated, their hom-categories are the opposites of the ones here. Every statement
   of this roadmap uses the SGA 4 direction.
5. **Equivalences.** Equivalence of topoi is Mathlib's `E ≌ F`. A geometric morphism is an
   equivalence when its direct image is an equivalence of categories; `GeometricMorphism.ofEquiv`
   turns `e : E ≌ F` into one with direct image `e.functor`.
6. **Subtopoi are subcategories.** A subtopos of `E` is an `ObjectProperty E` closed under
   isomorphisms whose inclusion has a left adjoint preserving finite limits. Subtopoi are therefore
   partially ordered by `≤` of object properties, without passing to equivalence classes of
   embeddings. The order on universal closure operators and Lawvere–Tierney topologies is the one
   making "larger operator" correspond to "smaller subtopos"; every order isomorphism below states
   its variance explicitly.
7. **Points.** A point of a topos `E` is a geometric morphism `Type u → E`. A point of a site is
   Mathlib's `GrothendieckTopology.Point.{u} J`, and `GrothendieckTopology.HasEnoughPoints.{u} J`
   is the site-level predicate; Layer 6 identifies both with their topos-level counterparts.
8. **Locales.** Frames are Mathlib's `Order.Frame` with `FrameHom`; locales are Mathlib's
   `Locale` (`Frmᵒᵖ`); sublocales and nuclei are Mathlib's `Sublocale` and `Nucleus` with the
   order-reversing `nucleusIsoSublocale`. A frame `L : Type u` is a small category through its
   order. Its *canonical site* `Frame.grothendieckTopology L` declares a sieve `S` on `U` covering
   when `U` is the supremum of the elements `V ≤ U` with `S` containing `V ⟶ U`; `Sh(L)` means
   `Sheaf (Frame.grothendieckTopology L) (Type u)`. For a space `X : Type u`,
   `Frame.grothendieckTopology (Opens X)` is Mathlib's `Opens.grothendieckTopology X`, and
   `Sh(X)` means `Sheaf (Opens.grothendieckTopology X) (Type u)`, the category under Mathlib's
   `TopCat.Sheaf`.
9. **Names.** Topos-level declarations live in the namespace `CategoryTheory` with the prefix
   `GeometricMorphism.` or `IsGrothendieckTopos.`; frame and locale declarations live under
   `Order.Frame` and `Locale`. Mathlib's names are used unchanged for everything Mathlib already
   has, and the declarations ported from open Mathlib pull requests keep those pull requests' names,
   namespaces and signatures (see *Ported from open Mathlib pull requests*).

## Existing foundations

### Mathlib material consumed

- **Sites and sheaves.** `GrothendieckTopology`, `Sheaf`, `presheafToSheaf`,
  `sheafificationAdjunction`, `constantSheaf` with `constantSheafΓAdj` and `Sheaf.Γ`
  (`Sites/GlobalSections`), `GrothendieckTopology.yoneda` for subcanonical topologies,
  `Sites/Equivalence` (essentially small sites), `Sites/CartesianClosed`, `Sites/LeftExact`.
- **Functoriality.** `Functor.IsContinuous`, `Functor.sheafPushforwardContinuous`,
  `Functor.sheafPullback` with `Functor.sheafAdjunctionContinuous` and its finite-limit
  preservation under `RepresentablyFlat` (`Sites/Pullback`, `Functor/Flat`);
  `Functor.IsCocontinuous`, `Functor.sheafPushforwardCocontinuous`,
  `Functor.sheafAdjunctionCocontinuous` (`Sites/CoverLifting`); `Functor.IsCoverDense`,
  `Functor.IsDenseSubsite`, `Functor.IsDenseSubsite.sheafEquiv` (`Sites/DenseSubsite`), and Tau
  Ceti's `TauCeti/CategoryTheory/Sites/DenseSubsite.lean`.
- **Slices.** `GrothendieckTopology.over`, `GrothendieckTopology.overPullback`,
  `overMapPullback` (`Sites/Over`); `TopologicalSpace.Opens.sheafEquivOver`
  (`Topology/Sheaves/Over`).
- **Closure and classifier.** `GrothendieckTopology.close`, `closureOperator`,
  `Functor.closedSieves`, `topologyOfClosureOperator` (`Sites/Closed`);
  `Subobject.Classifier`, `HasSubobjectClassifier` (`Subobject/Classifier/Defs`) and
  `Sheaf.classifier`, `Sheaf.Ω` (`Topos/Sheaf`).
- **Points.** `GrothendieckTopology.Point`, `Point.sheafFiber`, `Point.Hom` and the category of
  points, `Point.skyscraperSheafFunctor` with its adjunction, `Point.map`, `Point.comap`,
  `ObjectProperty.IsConservativeFamilyOfPoints`, `HasEnoughPoints` and its instance on `J.over X`
  (`Sites/Point/`); `GrothendieckTopology.IsLocalSite` with `ΓCoconstantSheafAdj`
  (`Sites/LocalSite`); `Precoherent` and `coherentTopology` (`Sites/Coherent/`).
- **Category theory.** `CoproductDisjoint`, `IsUniversalColimit`, `ObjectProperty.IsSeparating`,
  `ObjectProperty.Small`, `Subobject` with `Subobject.pullback`, `Over.star`,
  `Over.forgetAdjStar`, `Over.post`, `Over.pullback`, `Over.iteratedSliceEquiv`,
  `ExponentiableMorphism`, `MonoidalClosed` with `ihom` (`Sites/CartesianClosed` gives
  `MonoidalClosed (Sheaf J A)`), `conjugateEquiv`, `mateEquiv`, `Bicategory`, `Comma`, and
  `Action.functorCategoryEquivalence` (`Action V G ≌ SingleObj G ⥤ V`).
- **Order and topology.** `Order.Frame`, `FrameHom`, `Frm`, `Locale`, `topToLocale`, the points
  functor `Locale.pt` with `adjunctionTopToLocalePT` (`Topology/Order/Category/FrameAdjunction`),
  `Nucleus`, `Sublocale`, `nucleusIsoSublocale`, `TopologicalSpace.Opens` with its frame instance
  and `Opens.comap`, `TopCat.Sheaf.pushforward`, `TopCat.Sheaf.pullback`,
  `TopCat.Sheaf.pullbackPushforwardAdjunction`, `LocallyCompactSpace`, `QuasiSober` with
  `IsIrreducible.genericPoint`, `Prod.instT0Space`, `Pi.instT0Space`, `Preperfect`
  (`Topology/Perfect`), `IsCompactElement` with `isCompactElement_iff_le_of_directed_sSup_le`
  (`Order/CompactlyGenerated/Basic`). Mathlib has no way-below relation, no core-compact spaces,
  no scattered spaces, and no instance making a product of quasi-sober spaces quasi-sober; Layer 8
  builds them.

### Ported from open Mathlib pull requests

Two pieces of infrastructure more general than topoi are open Mathlib pull requests and are absent
from the pinned Mathlib. They are not developed independently here. Their declarations
are ported into Tau Ceti once, with the names, namespaces and signatures of the pull request at the
head named below, in coordination with the authors of those pull requests (both are Apache 2.0, as
is Tau Ceti); this roadmap's own targets are only the Grothendieck-topos instances and comparisons
built on them.

- [mathlib4#26757](https://github.com/leanprover-community/mathlib4/pull/26757), head `865008d`,
  file `Mathlib/CategoryTheory/Closed/PowerObjects.lean`: for `ℰ` with a
  `CartesianMonoidalCategory` structure and pullbacks, `subobjProd` (the bifunctor
  `(B, A) ↦ Subobject (B ⊗ A)`), `IsPowerObjectOf B P` (`P` represents `A ↦ Subobject (B ⊗ A)`),
  `PowerObject.map`, `PowerObject.compose`, `PowerObject.functor`, `PowerObject.singleton` with the
  instance `PowerObject.singleton_is_mono`, the `LeftRepresentable` lemmas they rest on, and the
  supporting lemmas that pull request adds to existing files. Its `Topos/Classifier.lean` is not
  ported: subobject classifiers are Mathlib's `Subobject.Classifier` and `HasSubobjectClassifier`.
  Contribution here: Layer 1, *Power objects*.
- [mathlib4#41216](https://github.com/leanprover-community/mathlib4/pull/41216), head `b2e6c5d`,
  file `Mathlib/CategoryTheory/Sites/LocallyConnectedSite.lean`: the class
  `GrothendieckTopology.IsLocallyConnectedSite` (field `isConnected_of_mem`: every covering sieve is
  connected as a full subcategory of the slice) with its instance on `trivial C`, and in the
  namespace `GrothendieckTopology.IsLocallyConnectedSite` the lemma `isSheaf_const_obj`,
  `constantSheafToPresheafIsoConst`, `π₀ J A := sheafToPresheaf J A ⋙ colim`, the adjunction
  `π₀ConstantSheafAdj : π₀ J A ⊣ constantSheaf J A`, `uniqueπ₀ObjOfIsRepresentable`, and the
  instances for connected and cosifted sites; with the helpers that pull request adds to
  `Limits/Sifted` and `Limits/Types/Colimits` (`colim_preservesFiniteProducts_of_isSifted'`,
  `uniqueColimitOfIsRepresentable`). Contribution here: Layer 5, *Locally connected*.

Migration: when either pull request is merged into the Mathlib that Tau Ceti pins, the ported file
is deleted and Mathlib's is imported. If the merged names or signatures differ from the head named
above, the port is first renamed to the merged form, so that the deletion changes no statement of
this roadmap. A change in either direction is coordinated with the pull request's authors.

### Sibling-roadmap material consumed

- AdicSpacesPartII R0.19.10, namespace `TauCetiRoadmap.AdicSpacesPartII.Topos`, for
  `Sheaf J (Type u)` on a small site `C : Type u`, `[Category.{u} C]`: the predicates
  `Topos.IsQuasicompact`, `Topos.IsQuasiseparated`, `Topos.Hom.IsQuasicompact`,
  `Topos.Hom.IsQuasiseparated`, `Topos.IsAlgebraic`, and the permanence lemmas
  `Topos.Hom.isQuasiseparated_iff_diagonal`, `Topos.Hom.isQuasicompact_comp`,
  `Topos.Hom.isQuasicompact_pullback`, `Topos.Hom.isQuasiseparated_comp`,
  `Topos.Hom.isQuasiseparated_pullback`, `Topos.isQuasiseparated_iff_of_cover`,
  `Topos.isQuasicompact_of_isQuasicompact_terminal`. These are the public predicates every consumer
  uses; Layer 6 proves their invariance under equivalences of sheaf categories and states the
  coherent-topos results with them.

### What exists and what is new

Against the Mathlib and Tau Ceti pinned by this repository (Mathlib `f6090c7`, Tau Ceti
`358314d`):

- *In Mathlib*: every declaration named in *Mathlib material consumed*.
- *In neither, ported*: the declarations of the two pull requests above.
- *Specified in a sibling roadmap, not yet in Tau Ceti*: the AdicSpacesPartII R0.19.10 predicates
  and lemmas above.
- *In neither, new here*: `IsGrothendieckTopos`, `GiraudAxioms` and the structure theorems of
  Layer 1; `GeometricMorphism`, its 2-cells, `GrothendieckToposCat` and its bicategory; étale
  morphisms; `Subtopos`, universal closure operators, Lawvere–Tierney topologies, gluing and the
  factorizations; the classes of morphisms of Layer 5; points of a topos as geometric morphisms;
  `Frame.grothendieckTopology` and localic topoi; fibre products of topoi; the frame coproduct,
  the way-below relation, `CoreCompactSpace`, `ScatteredSpace`, and `QuasiSober` instances for
  products. Tau Ceti has no topos-level declaration.

## The build, in layers

| Layer | Title | Headline |
|---|---|---|
| 1 | Grothendieck topoi | Giraud's theorem |
| 2 | Geometric morphisms | the 2-category of topoi; Diaconescu's theorem |
| 3 | Induced topoi and étale morphisms | `E/X` is a topos; `Sh(X)/U ≃ Sh(U)` |
| 4 | Subtopoi | subtopoi ≃ universal closure operators ≃ Lawvere–Tierney topologies; gluing; factorization |
| 5 | Classes of morphisms | connected, locally connected, local, hyperconnected, localic; hyperconnected–localic factorization |
| 6 | Points | points of a site = points of its topos; Deligne's theorem |
| 7 | Locales and localic topoi | localic topoi ≃ locales; sublocales = subtopoi; localic reflection |
| 8 | Fibre products | existence; `Sh(S × T) ≃ Sh(S) × Sh(T)` for `S` core-compact; `ℚ × ℚ` |

### Layer 1: Grothendieck topoi and Giraud's theorem

- **The predicate.** Define `IsGrothendieckTopos E` (Convention 2). Prove: it is invariant under
  `E ≌ E'`; `Sheaf J (Type u)` satisfies it for every small site; so does `Cᵒᵖ ⥤ Type u` for
  small `C` (trivial topology) and `Type u` (the point site); so does `Sheaf J (Type u)` for
  `C : Type (u+1)` with `[Category.{u} C]` and `EssentiallySmall.{u} C`, through Mathlib's
  `Sites/Equivalence`.
- **Structure of a topos.** For `hE : IsGrothendieckTopos E` prove: `HasLimits E`, `HasColimits E`
  (both of size `u`), `MonoidalClosed E` for the cartesian monoidal structure
  `CartesianMonoidalCategory.ofHasFiniteProducts`, `HasSubobjectClassifier E`, `WellPowered.{u} E`,
  `Balanced E`; every epimorphism is regular (`IsRegularEpiCategory E`); a family of maps into `X`
  is jointly epimorphic if and only if it is an effective epimorphic family; for each `X : E` the
  lattice `Subobject X` is a frame (`Order.Frame (Subobject X)`), and `Subobject.pullback f` is a
  frame homomorphism with left adjoint `Subobject.exists f` and right adjoint the universal
  quantifier along `f`. Each is transported from `Sheaf J (Type u)` along the equivalence and is a
  lemma about `Sheaf J (Type u)` first.
- **Power objects.** In a Grothendieck topos, with the cartesian monoidal structure above, every
  object `X` has a power object: `IsPowerObjectOf X ((ihom X).obj Ω)` for a subobject classifier
  `Ω`, in the sense of the port of mathlib4#26757, so `Y ⟶ (ihom X).obj Ω` corresponds to
  `Subobject (X ⊗ Y)` naturally in `Y`; `PowerObject.functor` then gives the power-object functor
  `Eᵒᵖ ⥤ E`.
- **Giraud's axioms.** Define `GiraudAxioms E : Prop` for `E : Type (u+1)`, `[Category.{u} E]`, as
  the conjunction of: `HasFiniteLimits E`; `HasCoproducts.{u} E`; every `u`-small coproduct is
  disjoint (`CoproductDisjoint`) and universal (`IsUniversalColimit` of its colimit cocone); every
  internal equivalence relation is effective, and its coequalizer exists and is universal; and
  there is a separating `ObjectProperty E` that is `ObjectProperty.Small.{u}`. An internal
  equivalence relation on `X` is a pair `p₁ p₂ : R ⟶ X` that is jointly monomorphic and such that
  for every `T` the relation `{(r ≫ p₁, r ≫ p₂) | r : T ⟶ R}` on `T ⟶ X` is an equivalence
  relation; it is effective when the square `p₁ ≫ q = p₂ ≫ q` with `q` its coequalizer is a
  pullback (`IsPullback p₁ p₂ q q`).
- **Giraud's theorem.** `IsGrothendieckTopos E ↔ GiraudAxioms E`. The forward direction checks the
  axioms in `Sheaf J (Type u)`. The reverse direction takes a small separating family, closes it
  under finite limits inside `E` (an essentially small full subcategory `C`), equips `C` with the
  restriction of the canonical topology of `E`, and proves that the restricted Yoneda functor
  `E ⥤ Sheaf J_can (Type u)` is an equivalence (Mathlib's `Sites/Canonical` and the comparison
  lemma).
- **Sites with finite limits.** Every Grothendieck topos is equivalent to `Sheaf J (Type u)` for a
  small site whose category has finite limits and whose topology is subcanonical; this is the
  site produced by the proof of Giraud's theorem, and it is the form Layers 2 and 8 consume.

### Layer 2: geometric morphisms and the 2-category of topoi

- **Geometric morphisms.** Define `GeometricMorphism E F` (Convention 3), `id`, `comp`, and
  `ofEquiv`. Prove: the inverse image preserves all colimits and finite limits; the direct image
  preserves all limits; the inverse image is determined by the direct image up to unique isomorphism
  compatible with the adjunctions (`Adjunction.leftAdjointUniq`), and conversely.
- **Existence criterion.** Between Grothendieck topoi, a functor `F ⥤ E` is the inverse image of a
  geometric morphism `E → F` if and only if it preserves finite limits and `u`-small colimits, by
  Mathlib's `isLeftAdjoint_of_preservesColimits_of_isSeparating` applied with the small separating
  family of Layer 1.
- **2-cells.** Define the category structure on `GeometricMorphism E F` (Convention 4), the
  equivalence of hom-types `(f.direct ⟶ g.direct) ≃ (g.inverse ⟶ f.inverse)` through
  `conjugateEquiv`, whiskering on both sides, and the interchange law.
- **The 2-category.** Define `GrothendieckToposCat.{u}`, a structure bundling `E : Type (u+1)`,
  `[Category.{u} E]` and `IsGrothendieckTopos E`, and a `Bicategory` instance on it with 1-cells
  geometric morphisms, 2-cells as above, and unitors and associators built from the identity
  natural isomorphisms of functor composition. An isomorphism in this bicategory between two
  1-cells is exactly a natural isomorphism of direct images; an equivalence of objects is exactly
  `E ≌ F`.
- **The global sections morphism.** For every Grothendieck topos `E` construct
  `GeometricMorphism.global : GeometricMorphism E (Type u)` with direct image `X ↦ (⊤_ E ⟶ X)`
  and inverse image the constant-object functor `S ↦ ∐_{s : S} ⊤_ E`; on `Sheaf J (Type u)` it is
  `Sheaf.Γ` and `constantSheaf` with `constantSheafΓAdj`. Prove that `GeometricMorphism E (Type u)`
  is equivalent to the terminal category: any two geometric morphisms `E → Type u` are isomorphic by
  a unique 2-cell.
- **Morphisms of sites.** For small sites and `G : C ⥤ D` with `[G.IsContinuous J K]` and
  `[RepresentablyFlat G]`, construct `GeometricMorphism.ofContinuous G` from `Sheaf K (Type u)` to
  `Sheaf J (Type u)` with direct image `G.sheafPushforwardContinuous` and inverse image
  `G.sheafPullback`; prove that the inverse image preserves finite limits with no hypothesis beyond
  these (SGA 4 IV 4.9; Mac Lane–Moerdijk VII.10). Prove `ofContinuous (𝟭 C) ≅ id` and
  `ofContinuous (G ⋙ H) ≅ ofContinuous H ≫ ofContinuous G`.
- **Cocontinuous functors.** For `G : C ⥤ D` with `[G.IsCocontinuous J K]`, construct
  `GeometricMorphism.ofCocontinuous G` from `Sheaf J (Type u)` to `Sheaf K (Type u)` with direct
  image `G.sheafPushforwardCocontinuous` and inverse image the sheafification of restriction along
  `G.op` (SGA 4 III 2.3); when `G` is also continuous, identify the inverse image with
  `G.sheafPushforwardContinuous` and the adjunction with `Functor.sheafAdjunctionCocontinuous`.
- **Spaces.** A continuous map `f : X → Y` gives `GeometricMorphism Sh(X) Sh(Y)` with direct image
  `TopCat.Sheaf.pushforward` and inverse image `TopCat.Sheaf.pullback`, and it equals
  `ofContinuous (Opens.map f)`; this is functorial in `f`. A frame homomorphism `h : M → L` gives
  `GeometricMorphism Sh(L) Sh(M)` the same way, through `ofContinuous` applied to `h` as a functor;
  on `Opens` it is the previous construction.
- **Diaconescu's theorem.** For a Grothendieck topos `E` and a small site `(C, J)`, a functor
  `A : C ⥤ E` is *J-filtering* when (i) the maps `A c ⟶ ⊤_ E` over all `c` are jointly
  epimorphic; (ii) for all `c, d`, the maps `A e ⟶ A c ⨯ A d` induced by spans `c ← e → d` are
  jointly epimorphic; (iii) for all parallel `a, b : c ⟶ d`, the maps from `A e` into the equalizer
  of `A.map a` and `A.map b` induced by `w : e ⟶ c` with `w ≫ a = w ≫ b` are jointly epimorphic;
  and (iv) for every covering sieve `S ∈ J c` the maps `A.map f` for `f ∈ S` are jointly epimorphic.
  Prove that `f ↦ (c ↦ f.inverse.obj ((presheafToSheaf J (Type u)).obj (yoneda.obj c)))` is an
  equivalence from `GeometricMorphism E (Sheaf J (Type u))` to the opposite of the full subcategory
  of J-filtering functors in `C ⥤ E`. When `C` has finite limits, J-filtering means left exact and
  covering-to-jointly-epimorphic. For `E = Type u` and `J` trivial, J-filtering means
  `RepresentablyFlat`.

### Layer 3: induced topoi and étale morphisms

- **Slices are topoi.** For a Grothendieck topos `E` and `X : E`, `IsGrothendieckTopos (Over X)`.
  For a small site and `c : C`, write `ℓ c := (presheafToSheaf J (Type u)).obj (yoneda.obj c)`
  (no subcanonicity is assumed) and construct `Sheaf (J.over c) (Type u) ≌ Over (ℓ c)`, compatible
  with Mathlib's `J.overPullback (Type u) c` on one side and `Over.star (ℓ c)` on the other (SGA 4
  III §5, IV §5).
- **Slices are locally cartesian closed.** In a Grothendieck topos every morphism `u : Y ⟶ X` is
  exponentiable in Mathlib's sense (`ExponentiableMorphism u` for the chosen pullbacks), so
  `Over.pullback u` has a right adjoint, the dependent product `Π_u`.
- **The étale morphism.** Construct `GeometricMorphism.etale X : GeometricMorphism (Over X) E` with
  inverse image `Over.star X` and direct image `Π` along `X ⟶ ⊤_ E` transported to `E`, and prove
  that `Over.forget X` is a further left adjoint of the inverse image (`Over.forgetAdjStar`). For
  `u : Y ⟶ X`, construct `GeometricMorphism.etaleMap u : GeometricMorphism (Over Y) (Over X)` with
  inverse image `Over.pullback u` and direct image `Π_u`. Prove `etaleMap u ≫ etale X ≅ etale Y`,
  and that `etale (Over.mk u)`, computed in the topos `Over X`, is
  `ofEquiv (Over.iteratedSliceEquiv (Over.mk u)) ≫ etaleMap u`.
- **Étale morphisms.** `f : E → F` is *étale* when there exist `X : F` and an equivalence
  `e : E ≌ Over X` with `f ≅ ofEquiv e ≫ etale X`. Prove that étale morphisms are closed under
  composition and equivalences, and that their inverse images have left adjoints.
- **Sites.** For `c : C`, `etale (ℓ c)` corresponds under the equivalence above to
  `ofCocontinuous (Over.forget c)` (Mathlib's `overPullback` as inverse image).
- **Opens.** A subterminal object `U` (a subobject of `⊤_ E`) gives the étale morphism
  `Over U → E`, whose direct image is fully faithful; it is the *open embedding* of `U`. For a space
  `X` and `U : Opens X`, identify it with Mathlib's `Opens.sheafEquivOver` followed by the
  geometric morphism of the inclusion `U → X`.

### Layer 4: subtopoi

- **Subtopoi and embeddings.** Define `Subtopos E` (Convention 6) with its inclusion
  `Subtopos.inclusion : GeometricMorphism P.FullSubcategory E`, whose inverse image is the
  reflector. Prove `IsGrothendieckTopos P.FullSubcategory`. A geometric morphism is an *embedding*
  when its direct image is fully faithful; prove that the essential image of the direct image of an
  embedding is a subtopos, and that `f` is an embedding if and only if it factors as an equivalence
  followed by the inclusion of that subtopos.
- **Universal closure operators.** For `E` with pullbacks, a `UniversalClosureOperator E` assigns
  to each `X` a closure operator on `Subobject X` commuting with `Subobject.pullback f` for every
  `f`. An object `F` is a *sheaf* for `c` when, for every mono `A ↪ B` that is `c`-dense
  (`c` sends it to `⊤`), restriction `(B ⟶ F) → (A ⟶ F)` is bijective. Prove that sheaves form a
  subtopos and that this gives an order-reversing bijection between universal closure operators
  and subtopoi of a Grothendieck topos (Elephant A4.3–A4.4).
- **Lawvere–Tierney topologies.** With a chosen subobject classifier `Ω` of `E`, a Lawvere–Tierney
  topology is `j : Ω ⟶ Ω` with `truth ≫ j = truth`, `j ≫ j = j`, and `j` commuting with the binary
  meet `Ω ⨯ Ω ⟶ Ω` that classifies `truth ⨯ truth`. Prove the order isomorphism between
  Lawvere–Tierney topologies and universal closure operators (`c(A)` is classified by
  `χ_A ≫ j`), independent of the choice of classifier. For a small site, prove that Grothendieck
  topologies on `C` correspond to Lawvere–Tierney topologies on `Cᵒᵖ ⥤ Type u` and that
  `Sheaf J (Type u)` is the subtopos of `j`, using Mathlib's `Functor.closedSieves` and
  `topologyOfClosureOperator`; and that subtopoi of `Sheaf J (Type u)` correspond to Grothendieck
  topologies `J' ≥ J`.
- **The lattice of subtopoi.** Prove that `Subtopos E` is a complete lattice whose order dual is
  a frame (`Order.Coframe (Subtopos E)`), with meets computed as intersections of object
  properties (Elephant A4.5).
- **Open and closed subtopoi.** For a subterminal `U`, the *open subtopos* `o(U)` consists of the
  `F` for which `F ⟶ F^U` is an isomorphism, and the *closed subtopos* `c(U)` consists of the `F`
  for which the projection `F ⨯ U ⟶ U` is an isomorphism. Prove: `o(U)` is the essential image of
  the open embedding of Layer 3; `o(U)` and `c(U)` are complements in `Subtopos E` (`IsCompl`);
  `U ↦ o(U)` is monotone from `Subobject (⊤_ E)` to `Subtopos E` and preserves finite meets and
  arbitrary joins; for a space `X` and closed `Z` with complement `U`, `c(U)` is equivalent to
  `Sh(Z)` through the geometric morphism of `Z → X`.
- **Gluing.** For Grothendieck topoi `F`, `G` and a finite-limit-preserving `Φ : F ⥤ G`, the comma
  category `Gl(Φ) = Comma (𝟭 G) Φ` is a Grothendieck topos, `F` is an open subtopos and `G` its
  closed complement. Conversely, for a subterminal `U` in `E` with open inclusion
  `j : o(U) → E` and closed inclusion `i : c(U) → E`, `E` is equivalent to `Gl(Φ)` for
  `Φ = j.direct ⋙ i.inverse : o(U) ⥤ c(U)`, by `F ↦ (i.inverse.obj F, j.inverse.obj F)` with the
  structure map induced by the unit of `j`, compatibly with both inclusions (SGA 4 IV 9.5;
  Elephant A4.5.6).
- **Surjections and factorization.** `f` is a *surjection* when `f.inverse` is faithful; prove the
  equivalent forms "`f.inverse` is conservative" and "the unit `𝟭 ⟶ f.inverse ⋙ f.direct` is a
  pointwise monomorphism". Prove that every geometric morphism factors as a surjection followed by
  an embedding, that the factorization is unique up to unique equivalence, and that surjections
  and embeddings are orthogonal in the bicategory (Elephant A4.2.10; Mac Lane–Moerdijk VII.4).
- **Dense subtopoi.** A subtopos is dense when it contains the initial object; prove that the
  subtopos of `¬¬`-sheaves is the smallest dense subtopos and that its subobject lattices are
  Boolean algebras (Elephant A4.5).

### Layer 5: classes of geometric morphisms

For `f : E → F` between Grothendieck topoi and `X : F`, write
`f/X : Over (f.inverse.obj X) → Over X` for the induced geometric morphism: its inverse image is
`Over.post f.inverse`, and its direct image sends `a : A ⟶ f.inverse.obj X` to the pullback of
`f.direct.map a` along the unit `X ⟶ f.direct.obj (f.inverse.obj X)`. For `u : Y ⟶ X` write
`u' := f.inverse.map u`. Since `f.inverse` preserves pullbacks there are canonical isomorphisms
`(f/X).inverse ⋙ Over.pullback u' ≅ Over.pullback u ⋙ (f/Y).inverse` and
`(f/X).direct ⋙ Over.pullback u ≅ Over.pullback u' ⋙ (f/Y).direct`; constructing them is part of
this layer.

- **Connected.** `f` is connected when `f.inverse` is fully faithful. A topos is connected when
  `global` is. Prove: connected morphisms compose; `Sh(X)` is connected if and only if `X` is a
  connected space (Mathlib's `ConnectedSpace`, which includes nonempty); `Cᵒᵖ ⥤ Type u` is
  connected if and only if `C` is connected (`IsConnected C`).
- **Locally connected.** `f` is locally connected when each `(f/X).inverse` has a left adjoint
  `(f/X)_!` and, for every `u : Y ⟶ X` in `F`, the mate (Mathlib's `mateEquiv`) of the first
  isomorphism above, a natural transformation
  `Over.pullback u' ⋙ (f/Y)_! ⟶ (f/X)_! ⋙ Over.pullback u`, is an isomorphism: `f.inverse` has an
  `F`-indexed left adjoint (Elephant B1.4 for indexed adjunctions, C3.3.1). Prove that for
  `F = Type u` this holds if and only if the constant functor has a left adjoint `π₀`; that
  for a small site with `[J.IsLocallyConnectedSite]` (the port of mathlib4#41216), the global
  sections morphism of `Sheaf J (Type u)` is locally connected with left adjoint
  `GrothendieckTopology.IsLocallyConnectedSite.π₀ J (Type u)`, through `π₀ConstantSheafAdj`; that
  étale morphisms are locally connected; that `Sh(X)` is locally connected if and only if `X` is
  locally connected (`LocallyConnectedSpace`); and that a locally connected `f` is connected if and
  only if `f_!` preserves the terminal object.
- **Local.** `f` is local when `f.direct` has a fully faithful right adjoint `f^!`, each
  `(f/X).direct` has a right adjoint `(f/X)^!`, and for every `u : Y ⟶ X` the mate of the second
  isomorphism above, `(f/X)^! ⋙ Over.pullback u' ⟶ Over.pullback u ⋙ (f/Y)^!`, is an isomorphism:
  `f.direct` has an `F`-indexed fully faithful right adjoint (Elephant C3.6.1). Prove that for
  `F = Type u` this is "`Γ` has a fully faithful right adjoint"; that Mathlib's `IsLocalSite` gives
  a local topos through `ΓCoconstantSheafAdj`; that a local morphism is connected; and that `Sh(X)`
  is local when `X` has a point whose only open neighbourhood is `X`.
- **Hyperconnected.** `f` is hyperconnected when it is connected and the essential image of
  `f.inverse` is closed under subobjects. Prove that hyperconnected morphisms are surjections and
  compose (Elephant A4.6.6).
- **Localic.** `f` is localic when every object of `E` is a subquotient of an object
  `f.inverse.obj X`: a quotient of a subobject. Prove that embeddings and étale morphisms are
  localic and that localic morphisms compose (Elephant A4.6.1–A4.6.2).
- **Factorization.** Every geometric morphism factors as a hyperconnected morphism followed by a
  localic one, unique up to unique equivalence (Elephant A4.6.5). The global sections morphism of
  `Sh(X)` and of `Sh(L)` is localic, and a topos with a hyperconnected and localic global sections
  morphism is equivalent to `Type u`.

### Layer 6: points, fibre functors and coherent topoi

- **Points of a topos.** A point of `E` is an object of `GeometricMorphism (Type u) E`
  (Convention 7). For a small site, construct the equivalence of categories
  `GrothendieckTopology.Point.{u} J ≌ GeometricMorphism (Type u) (Sheaf J (Type u))` sending `Φ`
  to the geometric morphism with inverse image `Φ.sheafFiber` and direct image
  `Φ.skyscraperSheafFunctor`. It is covariant on morphisms because `Point.Hom` and Convention 4
  agree (SGA 4 IV 6.3; this is the case `E = Type u` of Diaconescu's theorem).
- **Enough points.** `E` has enough points when the inverse images of the points of `E`, over a
  `u`-small family, jointly reflect isomorphisms. Prove that this is invariant under equivalence
  and that, for `E = Sheaf J (Type u)`, it is equivalent to `HasEnoughPoints.{u} J`. Prove that
  `Sh(X)` has enough points for every space `X` (stalks), that an open or closed subtopos of a
  topos with enough points has enough points, and that `E/X` does (consuming Mathlib's instance on
  `J.over`).
- **A topos without points.** Let `L` be the frame of regular open subsets of `ℝ`, the fixed
  points of the double-negation nucleus `U ↦ ¬¬U` on `Opens ℝ` (constructed here as a Mathlib
  `Nucleus`, with sublocale `Nucleus.toSublocale`). Prove that `Sh(L)` is
  not equivalent to the category with one object and one morphism and has no point (Elephant C1.2;
  Mac Lane–Moerdijk IX.2).
- **Change of site for the qcqs vocabulary.** For small sites `(C, J)`, `(D, K)` in universe
  `u` and an equivalence `Φ : Sheaf J (Type u) ≌ Sheaf K (Type u)`, prove that `Φ.functor` preserves
  and reflects `Topos.IsQuasicompact` and `Topos.IsQuasiseparated` of objects and
  `Topos.Hom.IsQuasicompact` and `Topos.Hom.IsQuasiseparated` of morphisms, and that
  `Topos.IsAlgebraic` holds for one sheaf category exactly when it holds for the other. For
  `hE : IsGrothendieckTopos E`, an object or morphism of `E` is quasicompact or quasiseparated when
  its image under some presentation `e : E ≌ Sheaf J (Type u)` is; by the invariance this does not
  depend on `e`, and these are the only topos-level forms of the AdicSpacesPartII predicates.
- **Coherent topoi.** A Grothendieck topos is *coherent* when, for a site `(C, J)` with an
  equivalence to `Sheaf J (Type u)`, the sheaf topos is `Topos.IsAlgebraic` and its terminal
  object is `Topos.IsQuasicompact` and `Topos.IsQuasiseparated` (AdicSpacesPartII R0.19.10; SGA 4
  VI 2.3), and *locally coherent* when it is algebraic. Prove that both are independent of the
  site (by the previous item), that `Sheaf (coherentTopology C) (Type u)` is locally coherent for
  small `C` with `[Precoherent C]` and `[HasPullbacks C]`, and that it is coherent when `C`
  moreover has a terminal object.
- **Deligne's theorem.** A locally coherent topos has enough points (SGA 4 VI 9.0, proved in VI §9;
  Mac Lane–Moerdijk IX.11). In particular `HasEnoughPoints.{u} (coherentTopology C)` for every
  small `C` with `[Precoherent C]` and `[HasPullbacks C]`.

### Layer 7: locales and localic topoi

- **Sheaves on a frame.** Define `Frame.grothendieckTopology L` (Convention 8), prove it is
  subcanonical, and prove `Subobject (⊤_ Sh(L)) ≃o L` as frames. Prove that it equals
  `Opens.grothendieckTopology X` for `L = Opens X`.
- **Localic topoi.** `E` is localic when its global sections morphism is localic (Layer 5).
  Prove the equivalent forms: the subterminal objects of `E` form a separating family; `E` is
  equivalent to `Sh(L)` for some frame `L : Type u`; `E ≌ Sh(Subobject (⊤_ E))` (Elephant
  A4.6.2, C1.4; Mac Lane–Moerdijk IX.5).
- **Locales embed in topoi.** For frames `L, M`, `Sh` is a pseudofunctor from `Locale` to
  `GrothendieckToposCat.{u}`, and the functor
  `FrameHom M L ⥤ GeometricMorphism Sh(L) Sh(M)` (Layer 2, "Spaces") is an equivalence onto its
  target, where `FrameHom M L` is ordered by `h ≤ h'` when `h' V ≤ h V` for all `V`: a 2-cell
  `f ⟶ g` exists exactly when `g^*(V) ≤ f^*(V)` on subterminals, and there is at most one.
- **Sublocales are subtopoi.** Prove an order isomorphism `Sublocale L ≃o Subtopos Sh(L)` (nuclei,
  through `nucleusIsoSublocale`, correspond to universal closure operators on subterminals and
  thence to Layer 4). Open sublocales correspond to open subtopoi and closed sublocales to closed
  subtopoi. Every subtopos of a localic topos is localic.
- **The localic reflection.** For every Grothendieck topos `E`, the geometric morphism
  `E → Sh(Subobject (⊤_ E))` whose direct image sends `X` to the sheaf `U ↦ (U ⟶ X)` on
  subterminals is the hyperconnected part of the hyperconnected–localic factorization of
  `global`, and composing with it gives
  `GeometricMorphism E Sh(M) ≌ (FrameHom M (Subobject (⊤_ E)))` with the order of the previous item,
  naturally in `M` (Elephant A4.6.5 applied to `global`, and C1.4).
- **Spaces and points.** For a space `X`, `Sh(X) ≌ Sh(Opens X)` is the identity of Convention 8;
  points of `Sh(L)` correspond to Mathlib's `Locale.PT L` (frame homomorphisms `L → Prop`), so
  points of `Sh(X)` correspond to points of the soberification of `X`; for any space `X` and a space
  `Y` with `QuasiSober Y` and `T0Space Y`, the geometric morphisms `Sh(X) → Sh(Y)` correspond to
  continuous maps `X → Y`, with a 2-cell `f ⟶ g` (necessarily unique) exactly when
  `g x ∈ closure {f x}` for every `x`.

### Layer 8: fibre products of topoi, locales and spaces

- **Fibre products.** For geometric morphisms `f : E → S` and `g : F → S` between Grothendieck
  topoi, a *fibre product* is a topos `P` with `p : P → E`, `q : P → F` and an isomorphism
  `p ≫ f ≅ q ≫ g` such that, for every Grothendieck topos `T`, the induced functor from
  `GeometricMorphism T P` to the iso-comma (pseudo-pullback) of `GeometricMorphism T E` and
  `GeometricMorphism T F` over `GeometricMorphism T S` is an equivalence. Prove existence by the
  site construction: for sites with finite limits and morphisms of sites `C_S → C_E`, `C_S → C_F`
  presenting `f` and `g`, the pushout of `C_E ← C_S → C_F` in the 2-category of small categories
  with finite limits and finite-limit-preserving functors, with the topology generated by the images
  of both topologies (Elephant B3.4). The *product* `E × F` is the fibre product over `Type u` via
  `global`; for sites with finite limits it is `Sheaf` on `C × D` with the topology generated by the
  sieves `R × {𝟙 d}` and `{𝟙 c} × S`.
- **Stability.** Pullbacks of étale morphisms are étale: the fibre product of `etale X` along
  `g : F → E` is `etale (g.inverse.obj X)`. Pullbacks of embeddings are embeddings, of open
  embeddings open, of closed embeddings closed. Pullbacks of localic morphisms are localic.
- **Coproducts of frames.** For frames `L, M : Type u`, construct the frame coproduct `L ⊗ M` as
  the frame of C-ideals of `L × M` (down-sets closed under the two one-sided joins
  `(⨆ Uᵢ, V)` and `(U, ⨆ Vⱼ)`), with frame homomorphisms `inl`, `inr` and the universal property
  `IsFrameCoproduct inl inr`. Prove that the product of localic topoi is localic and
  `Sh(L) × Sh(M) ≃ Sh(L ⊗ M)` (Elephant C1.6; Stone Spaces II.2).
- **Way-below and core-compactness.** For a complete lattice `L`, `CompleteLattice.WayBelow a b`
  (`a ≪ b`) holds when every nonempty directed `s` with `b ≤ sSup s` has a member above `a`, the
  quantifier pattern of Mathlib's `isCompactElement_iff_le_of_directed_sSup_le`. Prove
  `a ≪ b → a ≤ b`, `a' ≤ a → a ≪ b → b ≤ b' → a' ≪ b'`, `⊥ ≪ b`, closure under binary `⊔`, and
  `a ≪ a ↔ IsCompactElement a`. A space `X` is *core-compact*,
  `class CoreCompactSpace X : Prop`, when every `x ∈ U` with `U : Opens X` lies in some
  `V : Opens X` with `V ≪ U`; equivalently every open is the supremum of the opens way below it
  (`Opens X` is a continuous lattice, Stone Spaces VII.4). Prove: `V ≪ U` whenever `V ⊆ K ⊆ U`
  for a compact `K` (Mathlib's `IsCompact.elim_directed_cover`), hence the instance
  `LocallyCompactSpace X → CoreCompactSpace X`; core-compactness passes to open and to closed
  subspaces and to binary products. *Check:* `ℚ` is not core-compact.
- **Scattered spaces.** `class ScatteredSpace X : Prop` holds when every nonempty `A : Set X`
  has a point `x ∈ A` and an open `W ∋ x` with `W ∩ A ⊆ {x}`; prove
  `scatteredSpace_iff : ScatteredSpace X ↔ ∀ C : Set X, Preperfect C → C = ∅` against Mathlib's
  `Preperfect`. A scattered space is `T0Space` (`ScatteredSpace.t0Space`, by isolating a point of
  `{x, y}`) and `QuasiSober` (`ScatteredSpace.quasiSober`: a relatively isolated point of an
  irreducible closed set is its generic point), so scattered spaces are sober and their points are
  the points of their topoi (Layer 7). Discrete spaces, finite `T0` spaces and the Sierpiński space
  are scattered, and every subspace of a scattered space is scattered.
- **Products of sober spaces.** An arbitrary product of quasi-sober spaces is quasi-sober (instance
  `quasiSober_pi`: the generic point of an irreducible closed `S ⊆ Π i, X i` is the family of the
  generic points of the closures of the projections of `S`), and so is a binary product
  (`quasiSober_prod`). With Mathlib's `Pi.instT0Space` and `Prod.instT0Space`, products of sober
  spaces are sober. Hence, by Layer 7, for sober `S, T` the points of `Sh(S × T)` are the pairs of
  points of `S` and `T`, which are the points of the product topos `Sh(S) × Sh(T)` (its universal
  property with `Type u`), with no hypothesis of compactness.
- **Spaces.** For spaces `S, T : Type u`, the frame homomorphisms
  `Opens.comap (Prod.fst)` and `Opens.comap (Prod.snd)` induce a surjection of frames
  `Opens S ⊗ Opens T → Opens (S × T)`. If `S` is core-compact (`CoreCompactSpace S`), it is an
  isomorphism, so `Opens (S × T)` is the frame coproduct and `Sh(S × T)` is the product
  `Sh(S) × Sh(T)` of topoi (Isbell 1981, Theorem 4; Stone Spaces II.2 and VII.4); this covers
  every locally compact `S` through the instance above. For `S = T = ℚ` it is not
  injective: `Opens (ℚ × ℚ)` is not the frame coproduct, and `Sh(ℚ × ℚ)` is not the product of
  `Sh(ℚ)` with itself (Isbell 1972; Stone Spaces II.2).

## Examples and checks

- `Type u` is a Grothendieck topos, connected, locally connected, local, with exactly one point up
  to isomorphism; `global` on `Type u` is an equivalence.
- The empty site gives the degenerate topos (`Sheaf J (Type u)` with `C` empty is equivalent to
  the category with one object and one morphism); it has no point and is not connected.
- For `X` the Sierpiński space, `Sh(X)` is equivalent to the arrow category of `Type u`, and its
  open and closed points give the open and closed subtopoi, glued along `𝟭`.
- For the discrete space on a type `I`, `Sh(I) ≌ (I → Type u)`, which is étale over `Type u`.
- The 2-cell direction: for points `x, y` of a space `X` with `y ∈ closure {x}`, the stalk maps
  `F_y ⟶ F_x` form a `Point.Hom` from the point of `x` to the point of `y`, hence a 2-cell from the
  point `x` to the point `y` of `Sh(X)`. A check computes it on the Sierpiński space, from the open
  point to the closed point.
- `Sh(ℝ)` is connected, locally connected, has enough points, is localic and is not local; the
  presheaf topos on a small category with a terminal object is local.
- `Opens (ℝ × ℝ)` is the frame coproduct of two copies of `Opens ℝ`; `Opens (ℚ × ℚ)` is not.
- For a group `G : Type u`, the classifying topos `B G` is `Action (Type u) G`, the category of
  `G`-sets. It is a Grothendieck topos, being equivalent through
  `Action.functorCategoryEquivalence` to `SingleObj G ⥤ Type u`, the presheaves on the opposite of
  the one-object category `SingleObj G` (Layer 1, presheaf topoi; the objects of `SingleObj G` lie
  in `Type`, so the small site is `AsSmall.{u}` of it). It is connected and locally connected. For `G`
  acting on itself by left multiplication, `Over G` is equivalent to `Type u` (the fibre over `1`),
  so the corresponding étale morphism is a point of `B G` whose inverse image is the forgetful
  functor; the points of `B G` form a connected groupoid in which each object has automorphism
  group isomorphic to `G` (the `G`-torsors, by Diaconescu's theorem).

## Dependency order

Layer 1 rests on Mathlib's sites and the classifier. Layer 2 needs Layer 1 for the bicategory and
global sections and is otherwise site-level. Layer 3 needs Layers 1–2. Layer 4 needs Layers 1–3
(open subtopoi use the open embeddings of Layer 3). Layer 5 needs Layers 2–4 (hyperconnected
morphisms use the subobject closure of Layer 4, localic ones the factorization). Layer 6 needs
Layer 2 for points, Layer 4 for subtopoi, and AdicSpacesPartII R0.19.10 for coherence. The power
objects of Layer 1 and the locally connected sites of Layer 5 need the ports of mathlib4#26757 and
mathlib4#41216. Layer 7
needs Layers 4–5. Layer 8 needs Layers 2, 3, 5 and 7. Diaconescu's theorem (Layer 2) is proved
before the identification of points in Layer 6, which is its special case.

## Provenance

The frame coproduct by C-ideals with its universal property, and the identification of
`Opens (X × Y)` with that coproduct under a local-compactness-type hypothesis, have been
formalized in `lean/Grothendieck/Folder161_3.lean` of
[Commutator-IO/grothendieck-project](https://github.com/Commutator-IO/grothendieck-project), from
a reading of folder 161-3 of the Grothendieck fonds (Montpellier), on the topos of a product. The
way-below relation on opens, core-compact spaces, scattered spaces with their `T0Space` and
`QuasiSober` instances, and `quasiSober_pi` are in
`lean/Grothendieck/Upstream/QuasiSoberPiCoreCompact.lean` of the same repository (CC0), where the
way-below relation is stated for opens only (`WayBelowOpen`) and core-compactness and
scatteredness are plain definitions (`CoreCompact`, `Scattered`). Both files are cited prior work
for Layer 8, not its specification.

## References

- [SGA 4] M. Artin, A. Grothendieck, J.-L. Verdier, *Théorie des topos et cohomologie étale des
  schémas*, Lecture Notes in Mathematics 269, 270, Springer (1972). Exposé I (presheaves),
  Exposé II (topologies and sheaves), Exposé III (continuous and cocontinuous functors; 2.3 for
  the pullback along a cocontinuous functor; §5 for induced topologies), Exposé IV (topoi: 1.2
  and the appendix for Giraud's criteria; 3.1–3.2 for morphisms of topoi and morphisms between
  them; 4.9 for morphisms of sites; §5 for induced topoi; §6, especially 6.3, for points and fibre
  functors; §9, especially 9.5, for open and closed subtopoi and gluing), Exposé VI (2.3 for
  coherent topoi; Théorème 9.0 and §9 for Deligne's theorem).
- [Elephant] P. T. Johnstone, *Sketches of an Elephant: A Topos Theory Compendium*, Oxford Logic
  Guides 43–44, Oxford University Press (2002). Part A: A4.1 (geometric morphisms), A4.2
  (surjections and inclusions, A4.2.10), A4.3–A4.4 (cartesian reflectors, local operators,
  universal closure operations), A4.5 (examples of local operators: open, closed, gluing,
  coframe of subtopoi, `¬¬`), A4.6 (localic and hyperconnected morphisms, A4.6.5). Part B: B1.4
  (indexed adjunctions), B3.4 (pullbacks of topoi). Part C: C1.2 (locales, regular opens), C1.4
  (localic topoi), C1.6 (products of locales and topoi), C2.1–C2.3 (sites, Giraud's theorem
  C2.2.8, morphisms of sites, Diaconescu), C3.3 (locally connected morphisms), C3.6 (local
  morphisms).
- [MM] S. Mac Lane, I. Moerdijk, *Sheaves in Geometry and Logic*, Universitext, Springer (1992).
  Chapter III (Grothendieck topoi), V.1–V.3 (Lawvere–Tierney topologies and associated sheaves),
  VII.1–VII.10 (geometric morphisms, embeddings and surjections VII.4, points VII.5, filtering
  functors and Diaconescu VII.7–VII.9, morphisms of sites VII.10), IX.1–IX.5 (locales, points,
  localic topoi), IX.11 (Deligne's theorem), Appendix (Giraud's theorem).
- [SS] P. T. Johnstone, *Stone Spaces*, Cambridge Studies in Advanced Mathematics 3, Cambridge
  University Press (1982). Chapter II, §§1–2 (frames, locales, nuclei and sublocales, coproducts of
  frames by C-ideals and products of locally compact spaces), §3 (spaces and sober spaces); Chapter
  VII, §4 (locally compact spaces and continuous lattices).
- [Isbell 1972] J. R. Isbell, "Atomless parts of spaces", *Mathematica Scandinavica* 31 (1972),
  5–32: locales, localic products and the product `ℚ × ℚ`.
- [Isbell 1981] J. R. Isbell, "Product spaces in locales", *Proceedings of the American
  Mathematical Society* 81 (1981), 116–118: the localic product of a locally compact space with
  any space is spatial; Theorem 4, under a hypothesis that every core-compact space satisfies.
- [GHKLMS] G. Gierz, K. H. Hofmann, K. Keimel, J. D. Lawson, M. Mislove, D. S. Scott, *Continuous
  Lattices and Domains*, Encyclopedia of Mathematics and its Applications 93, Cambridge University
  Press (2003). Chapter I, §1 (the way-below relation).
- [Hofmann–Lawson 1978] K. H. Hofmann, J. D. Lawson, "The spectral theory of distributive
  continuous lattices", *Transactions of the American Mathematical Society* 246 (1978), 285–310:
  core-compact spaces and continuous frames of opens.
