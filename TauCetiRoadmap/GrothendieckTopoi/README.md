# Roadmap: Grothendieck topoi

**Summary.** Build the theory of Grothendieck topoi as categories given without a chosen site. The
carriers are a category `E : Type (u+1)` with `[Category.{u} E]` and the predicate
`IsGrothendieckTopos E` (an equivalence with `Sheaf J (Type u)` for some small site exists); the
structure `GeometricMorphism E F` (direct image, inverse image, adjunction, left exact inverse
image), whose 2-cells are natural transformations of direct images; the structure `Subtopos E`;
and Mathlib's sites, points of sites, frames and sublocales. The end theorems are: Giraud's
theorem, `IsGrothendieckTopos E ↔ GiraudAxioms E` for every such `E`; Diaconescu's theorem, for a
small site `(C, J)` and a Grothendieck topos `E` with finite limits given as an instance, the
geometric morphisms `E → Sh(C, J)` are the opposite of the category of `J`-filtering functors
`C ⥤ E`; the surjection–embedding and hyperconnected–localic factorizations of every geometric
morphism between Grothendieck topoi; the order-reversing correspondence between universal closure
operators and subtopoi of a Grothendieck topos; the points of a small site as the points of its
topos, and Deligne's theorem for a small precoherent category with pullbacks; localic topoi as the
topoi `Sh(L)` of frames `L : Type u`, with sublocales of `L` as subtopoi of `Sh(L)`; and, for
spaces `S, T : Type u` with `S` core-compact, `Opens (S × T)` as the frame coproduct of `Opens S`
and `Opens T`, which fails for `S = T = ℚ`.

Suggested homes: `TauCeti/CategoryTheory/Topos/` for Layers 1–6 and 8, and
`TauCeti/Order/Locale/` with `TauCeti/CategoryTheory/Topos/Localic/` for Layer 7.

## Scope and ownership

**Owned here.** The topos-level half of the subject: statements about a category that is
equivalent to a sheaf category, without the site being part of the data, and about the maps
between such categories. That is: the predicate, Giraud's theorem and the structure of a topos
(Layer 1); geometric morphisms, their 2-cells, the 2-category of topoi, morphisms of sites and
Diaconescu's theorem (Layer 2); slices and étale morphisms (Layer 3); subtopoi, universal closure
operators, Lawvere–Tierney topologies, open and closed subtopoi, gluing and the surjection–embedding
factorization (Layer 4); connected, locally connected, local, hyperconnected and localic morphisms
(Layer 5); points of a topos and Deligne's theorem (Layer 6); localic topoi (Layer 7); fibre
products of topoi, coproducts of frames, the way-below relation, core-compact and scattered spaces,
and products of sober spaces (Layer 8). A search of the roadmaps on main for Grothendieck topoi,
geometric morphisms, subtopoi, frame coproducts and core-compact spaces finds no other owner.

**Left to other roadmaps.** Topoi of schemes and algebraic spaces (small and big étale, Nisnevich,
fppf and pro-étale sites, replete topoi, their ringed topoi and comparison morphisms) are
SchemeAndStackFoundations §§1.10, 2.9–2.17; where one of its morphisms of topoi comes from a
representably flat continuous functor or a cocontinuous functor of small sites, its bundled form is
the geometric morphism of target 2.4 applied to that functor. Stacks, stackification and the
2-fibre products of stacks on a small site are SchemeAndStackFoundations §1.18; the fibre products
of topoi of Layer 8 are pseudo-pullbacks of topoi, not 2-fibre products of stacks. Cohomology on
sites (Mathlib's `Sheaf.H`, Tau Ceti's `TauCeti/CategoryTheory/Sites/SheafCohomology/`, and
SchemeAndStackFoundations §§2.1–2.5) does not appear here. Quasicompact and quasiseparated objects
and morphisms of a sheaf topos and algebraic topoi are AdicSpacesPartII R0.19.10, consumed by
Layer 6. Enhanced and derived categories of sheaves on ringed topoi are EnhancedDerivedSheaves;
the ringed topoi of rigid and adic spaces are AdicSpacesPartII and RigidAnalyticGeometry §8.3;
the underlying morphism of each of their morphisms of ringed topoi is a `GeometricMorphism`. The
classifying topos `B G` of a group (Layer 1, Examples) is not the topological classifying space of
ClassifyingSpaces.

**Mathlib's open work.** Mathlib has open work on power objects in cartesian monoidal categories,
under the names `PowerObject` and `IsPowerObjectOf`, and on locally connected sites with their
`π₀`, under the name `GrothendieckTopology.IsLocallyConnectedSite`; targets 1.3 and 5.2 use those
names and signatures.

**Out of scope.** Elementary topoi axiomatized without a site (the subobject classifier of a sheaf
category is used, from Mathlib, as a property of that category); ringed and module-theoretic
topoi; fibred and indexed topoi beyond the slice-wise conditions of Layer 5; open, proper, tidy and
atomic geometric morphisms; classifying topoi of geometric theories. Open morphisms, their descent
theory and the representation of every Grothendieck topos by a localic groupoid are Joyal–Tierney
1984; proper and tidy morphisms, with their stability under pullback, are Moerdijk–Vermeulen 2000.

## Conventions

1. **Universes.** A *site* is `C : Type u` with `[SmallCategory C]` and
   `J : GrothendieckTopology C`. A Grothendieck topos lives at `E : Type (u+1)` with
   `[Category.{u} E]`, the size of `Sheaf J (Type u)`; a site whose category is only essentially
   small goes through Mathlib's `Sites/Equivalence`. Witness: `Type u` has this size, while
   `Type (u+1)` with its `Category.{u+1}` instance is outside the predicate at universe `u` (the
   statement does not typecheck), so a size slip is a type error, not a false theorem.
2. **The predicate.** `IsGrothendieckTopos E : Prop` holds when there exist a small site `(C, J)`
   and an equivalence `E ≌ Sheaf J (Type u)`. The site is not data: every construction that uses
   one proves its independence of the choice. A statement that needs limits, colimits or
   exponentials of `E` as instances carries them as instance arguments, and Layer 1 proves that a
   Grothendieck topos has them. Witness: for the empty category `C`, `Cᵒᵖ ⥤ Type u` has exactly
   one object and one morphism and every topology on `C` is trivial, so the category with one
   object and one morphism (the *degenerate topos*) is a Grothendieck topos.
3. **Geometric morphisms.** `GeometricMorphism E F` has `direct : E ⥤ F` (the direct image `f_*`),
   `inverse : F ⥤ E` (the inverse image `f^*`), `adj : inverse ⊣ direct` and
   `PreservesFiniteLimits inverse`. A geometric morphism goes in the direction of its direct image.
   The composite `GeometricMorphism.comp f g` of `f : E → F` and `g : F → G` has direct image
   `f.direct ⋙ g.direct`, inverse image `g.inverse ⋙ f.inverse` and adjunction `g.adj.comp f.adj`.
   Witness: a point `y` of a space `Y`, as the continuous map `PUnit → Y`, gives a geometric
   morphism `Type u → Sh(Y)` whose inverse image is the stalk at `y`; naming the morphism after its
   inverse image would give the opposite direction `Sh(Y) → Type u`.
4. **2-cells.** A 2-cell `f ⟶ g` between `f g : GeometricMorphism E F` is a natural transformation
   `f.direct ⟶ g.direct`, as in SGA 4 IV 3.2; its conjugate under the two adjunctions (Mathlib's
   `conjugateEquiv`) is `g.inverse ⟶ f.inverse`. This is the direction of Mathlib's
   `GrothendieckTopology.Point.Hom`, whose `Φ₁ ⟶ Φ₂` is a natural transformation
   `Φ₂.fiber ⟶ Φ₁.fiber`. Johnstone's Elephant (A4.1) and Mac Lane–Moerdijk call a natural
   transformation `f^* ⟶ g^*` a geometric transformation `f ⇒ g`; their hom-categories are the
   opposites of the ones here. Witness: on the Sierpiński space `{o, c}` with `{o}` open, the
   restriction `F(X) ⟶ F({o})` is a natural map from the stalk at `c` to the stalk at `o`, hence a
   2-cell from the point `o` to the point `c`; there is none from `c` to `o`, since the sheaf with
   `F(X) = ∅` and `F({o}) = PUnit` has stalk `PUnit` at `o` and `∅` at `c`.
5. **Equivalences.** Equivalence of topoi is Mathlib's `E ≌ F`; `GeometricMorphism.ofEquiv e` has
   direct image `e.functor` and inverse image `e.inverse`. Witness: for `Equivalence.refl` both are
   `𝟭 E`, as for `GeometricMorphism.id E`.
6. **Subtopoi are subcategories.** A `Subtopos E` is an `ObjectProperty E` closed under isomorphisms
   whose inclusion has a left adjoint preserving finite limits, ordered by `≤` of object
   properties. On universal closure operators, "larger operator" corresponds to "smaller
   subtopos"; every correspondence below states its variance. Witness: `Type u` has exactly two
   subtopoi, all of `Type u` and its one-element types, for exactly two universal closure
   operators, the identity and the constant `⊤`, which gives the smaller subtopos.
7. **Points.** A point of a topos `E` is a geometric morphism `Type u → E`; a point of a site is
   Mathlib's `GrothendieckTopology.Point.{u} J`. Witness: `Type u` has one point up to
   isomorphism, and the degenerate topos has none (an inverse image would send its one object, both
   initial and terminal, to `∅` as a colimit and to `PUnit` as a limit).
8. **Locales.** Frames are Mathlib's `Order.Frame` with `FrameHom`; sublocales and nuclei are
   Mathlib's `Sublocale` and `Nucleus`, with the order-reversing `nucleusIsoSublocale`. A frame
   `L : Type u` is a small category through its order, and `Sh(L)` means
   `Sheaf (Frame.grothendieckTopology L) (Type u)` (target 7.1). For a space `X : Type u`, `Sh(X)`
   means `Sheaf (Opens.grothendieckTopology X) (Type u)`, the category under Mathlib's
   `TopCat.Sheaf` (sheaves on a space as in Godement, chapitre II, §1). Witness: for the
   two-element frame `{⊥ < ⊤}` the empty sieve covers `⊥`, so a sheaf is its value at `⊤` and
   `Sh(L) ≌ Type u`; for the one-element frame `Sh(L)` is the degenerate topos.

## Exact supplier contracts

**From Mathlib** (at the pins).

- Sites and sheaves: `GrothendieckTopology`, `Sheaf`, `presheafToSheaf`,
  `sheafificationAdjunction`, `constantSheaf`, `Sheaf.Γ`, `constantSheafΓAdj`
  (`Sites/GlobalSections`), `Sites/Equivalence`, `Sites/CartesianClosed` (`MonoidalClosed` on
  `Sheaf J A`), `Sites/LeftExact`, `Sites/Canonical`, `Opens.grothendieckTopology`.
- Functoriality: `Functor.IsContinuous`, `Functor.sheafPushforwardContinuous`,
  `Functor.sheafPullback`, `Functor.sheafAdjunctionContinuous`,
  `Functor.SmallCategories.instPreservesFiniteLimitsSheafSheafPullbackOfRepresentablyFlat`
  (`Sites/Pullback`), `RepresentablyFlat`, `preservesFiniteLimits_of_flat`,
  `CategoryTheory.final_of_representablyFlat` (`Functor/Flat`), `Functor.IsCocontinuous`,
  `Functor.sheafPushforwardCocontinuous`, `Functor.sheafAdjunctionCocontinuous`
  (`Sites/CoverLifting`), `Functor.IsDenseSubsite.sheafEquiv` (`Sites/DenseSubsite`).
- Slices: `GrothendieckTopology.over`, `GrothendieckTopology.overPullback` (`Sites/Over`),
  `TopologicalSpace.Opens.sheafEquivOver` (`Topology/Sheaves/Over`), `Over.star`, `Over.forget`,
  `Over.forgetAdjStar`, `Over.post`, `Over.pullback`, `Over.iteratedSliceEquiv`,
  `ExponentiableMorphism`.
- Closure and classifier: `GrothendieckTopology.close`, `Functor.closedSieves`,
  `topologyOfClosureOperator` (`Sites/Closed`), `HasSubobjectClassifier`, `Sheaf.classifier`.
- Points: `GrothendieckTopology.Point` with `Point.isCofiltered`, `Point.sheafFiber`, `Point.Hom`,
  `Point.skyscraperSheafFunctor`, `GrothendieckTopology.HasEnoughPoints` (`Sites/Point/`);
  `GrothendieckTopology.IsLocalSite` with `ΓCoconstantSheafAdj` (`Sites/LocalSite`);
  `Precoherent`, `coherentTopology` (`Sites/Coherent/`); `Functor.Elements`.
- Category theory: `CoproductDisjoint`, `IsUniversalColimit`, `ObjectProperty.IsSeparating`,
  `ObjectProperty.Small`, `ObjectProperty.IsClosedUnderIsomorphisms`,
  `ObjectProperty.FullSubcategory`, `Subobject`, `Subobject.pullback`, `Subobject.exists`,
  `WellPowered`, `isLeftAdjoint_of_preservesColimits_of_isSeparating`
  (`Adjunction/AdjointFunctorTheorems`), `Adjunction.leftAdjointUniq`, `conjugateEquiv`,
  `mateEquiv`, `Bicategory`, `Comma`, `MonoidalClosed`, `ihom`,
  `CartesianMonoidalCategory.ofHasFiniteProducts`, `Action.functorCategoryEquivalence`.
- Order and topology: `Order.Frame`, `FrameHom`, `Locale`, `Locale.PT`, `Nucleus`, `Sublocale`,
  `Nucleus.toSublocale`, `nucleusIsoSublocale`, `ClosureOperator`, `TopologicalSpace.Opens`,
  `Opens.comap`, `TopCat.Sheaf.pushforward`, `TopCat.Sheaf.pullback`, `LocallyCompactSpace`,
  `IsCompact.elim_directed_cover`, `QuasiSober`, `T0Space`, `Pi.instT0Space`, `Prod.instT0Space`,
  `Preperfect`, `IsCompactElement`, `isCompactElement_iff_le_of_directed_sSup_le`,
  `Algebra.GrothendieckGroup`.

**From Tau Ceti.** Nothing is consumed: Tau Ceti has no topos-level declaration.

**From AdicSpacesPartII.** R0.19.10, namespace `TauCetiRoadmap.AdicSpacesPartII.Topos`, for
`Sheaf J (Type u)` on a small site: the predicates `Topos.IsQuasicompact`,
`Topos.IsQuasiseparated`, `Topos.Hom.IsQuasicompact`, `Topos.Hom.IsQuasiseparated` and
`Topos.IsAlgebraic`, with the permanence lemmas stated there for composition, pullback and the
diagonal (target 6.3).

Neither pin has the predicate of a Grothendieck topos, geometric morphisms, subtopoi, the canonical
topology of a frame, the way-below relation, core-compact or scattered spaces, or an instance
making a product of quasi-sober spaces quasi-sober.

## How to read the build

Layer 1 rests on Mathlib's sites and subobject classifier and delivers the predicate, the structure
of a topos and Giraud's theorem. Layer 2 defines geometric morphisms and their 2-cells, needs
Layer 1 for the existence criterion, the 2-category and the global sections morphism, and is
otherwise site-level; it ends with Diaconescu's theorem. Layer 3 adds slices and étale morphisms.
Layer 4 builds subtopoi on Layers 1–3 (open subtopoi use the open embeddings of Layer 3). Layer 5
defines the classes of morphisms on Layers 2–4 and proves the hyperconnected–localic
factorization. Layer 6 identifies points of a site with points of its topos (the case
`E = Type u` of Diaconescu's theorem) and consumes AdicSpacesPartII R0.19.10 for coherent topoi.
Layer 7 compares locales and localic topoi on Layers 4–5. Layer 8 builds fibre products on
Layers 2, 3, 5 and 7 and ends with products of spaces.

## Layer 1: Grothendieck topoi and Giraud's theorem

### 1.1 The predicate

Define `IsGrothendieckTopos E` (Convention 2). Prove that it is invariant under `E ≌ E'`; that
`Sheaf J (Type u)` satisfies it for every small site; that so do `Cᵒᵖ ⥤ Type u` for small `C`
(trivial topology) and `Type u` (the one-object site); and that so does `Sheaf J (Type u)` for
`C : Type (u+1)` with `[Category.{u} C]` and `EssentiallySmall.{u} C`, through Mathlib's
`Sites/Equivalence` (Mac Lane–Moerdijk, Chapter III).
*Needs:* Mathlib `GrothendieckTopology`, `Sheaf`, `Sites/Equivalence`.

**Checks.**

- The degenerate topos satisfies the predicate through the empty site (Convention 2); a definition
  asking for a nonempty site or a point would exclude it, and Layer 4 needs it as the smallest
  subtopos of every topos.
- `Type u` satisfies it through `Discrete PUnit` with the trivial topology, whose presheaf
  category is equivalent to `Type u` by evaluation; a definition with sites in `Type (u+1)` would
  not typecheck against `Sheaf J (Type u)` (Convention 1).
- `(Type u)ᵒᵖ` does not satisfy it: its initial object is the one-point type, which has the
  non-invertible map `PUnit ⟶ Bool` of `Type u` as a morphism `Bool ⟶ PUnit` into it, while in a
  Grothendieck topos every morphism into an initial object is an isomorphism (1.2). A predicate
  that allowed `E ≌ (Sheaf J (Type u))ᵒᵖ` would accept it.

### 1.2 Structure of a topos

For `hE : IsGrothendieckTopos E` prove `IsGrothendieckTopos.hasLimits` and
`IsGrothendieckTopos.hasColimits` (of size `u`), `MonoidalClosed E` for the cartesian monoidal
structure `CartesianMonoidalCategory.ofHasFiniteProducts`,
`IsGrothendieckTopos.hasSubobjectClassifier`, `IsGrothendieckTopos.wellPowered`
(`WellPowered.{u} E`) and `IsGrothendieckTopos.wellPowered_op` (`WellPowered.{u} Eᵒᵖ`: a quotient
of `X` is determined by its kernel pair, a subobject of `X ⨯ X`, because every epimorphism is
effective); `Balanced E`; every epimorphism is regular (`IsRegularEpiCategory E`); every morphism
into an initial object is an isomorphism; a family of maps into `X` is jointly epimorphic if and
only if it is an effective epimorphic family; for each `X : E` the lattice `Subobject X` is a
frame, and `Subobject.pullback f` is a frame homomorphism with left adjoint `Subobject.exists f`
and right adjoint the universal quantifier along `f`. Each is a lemma about `Sheaf J (Type u)`
first and is transported along the equivalence.
*Needs:* 1.1; Mathlib `HasSubobjectClassifier`, `Sheaf.classifier`, `Sites/CartesianClosed`,
`WellPowered`, `Subobject.pullback`, `Subobject.exists`.

**Checks.**

- In `Type u`, `Subobject X` is order-isomorphic to `Set X` and a quotient of `X` is an
  equivalence relation on `X`, a subset of `X × X`: both are `u`-small, so `Type u` is
  well-powered and well-copowered, the two hypotheses of size that 2.1 needs.
- In the category of abelian groups the subgroups of `ℤ/2 × ℤ/2` form the lattice `M₃`: for three
  distinct subgroups `A, B, C` of order `2`, `A ⊓ (B ⊔ C) = A` while `(A ⊓ B) ⊔ (A ⊓ C) = 0`. So
  the frame statement uses the topos hypothesis and is false for categories with all limits and
  colimits.
- In the category of commutative rings `ℤ → ℚ` is a monomorphism and an epimorphism but not an
  isomorphism; balancedness is a property of topoi, not of complete and cocomplete categories.

### 1.3 Power objects

In a Grothendieck topos, with the cartesian monoidal structure of 1.2 and a subobject classifier
`Ω`, prove that every object `X` has a power object, `IsPowerObjectOf X ((ihom X).obj Ω)` in the
sense of Mathlib's open work (Scope): `P` is a power object of `B` when it represents
`A ↦ Subobject (B ⊗ A)`, so that `Y ⟶ (ihom X).obj Ω` corresponds to `Subobject (X ⊗ Y)`
naturally in `Y`; then `PowerObject.functor` gives the power-object functor `Eᵒᵖ ⥤ E`.
*Needs:* 1.2; Mathlib `MonoidalClosed`, `ihom`, `HasSubobjectClassifier`,
`CartesianMonoidalCategory.ofHasFiniteProducts`; the power-object predicate of Mathlib's open work.

**Checks.**

- In `Type u`, `Ω` is a two-element type, `(ihom X).obj Ω` is `X → Ω`, and maps `Y → (X → Ω)` are
  the subsets of `X × Y`: the power object is the power set.
- The functor is contravariant: `∅ ⟶ PUnit` goes to `P PUnit ⟶ P ∅`, from the two subsets of
  `PUnit` to the one subset of `∅`, sending both to `∅` (inverse image of subsets).
- The power object of `⊤_ E` is `Ω`, since `Subobject (⊤_ E ⊗ Y) ≃ Subobject Y`: the power objects
  are normalised by the subobject classifier.

### 1.4 Giraud's axioms and Giraud's theorem

Define `IsInternalEquivalenceRel p₁ p₂` (jointly monic, and an equivalence relation on `T ⟶ X` for
every `T`) and `GiraudAxioms E` for `E : Type (u+1)` with `[Category.{u} E]`: finite limits;
`u`-small coproducts, disjoint (`CoproductDisjoint`) and universal (`IsUniversalColimit`);
internal equivalence relations with universal coequalizers that are effective (the square
`p₁ ≫ q = p₂ ≫ q` is a pullback); and a separating `ObjectProperty E` that is
`ObjectProperty.Small.{u}`. Prove `isGrothendieckTopos_iff_giraudAxioms` (SGA 4 IV 1.2; Elephant
C2.2.8; Mac Lane–Moerdijk, Appendix). The forward direction checks the axioms in
`Sheaf J (Type u)`. The reverse direction closes a small separating family under finite limits
inside `E`, equips it with the restriction of the canonical topology of `E`, and proves that the
restricted Yoneda functor is an equivalence (Mathlib's `Sites/Canonical` and
`Functor.IsDenseSubsite.sheafEquiv`). Consequently every Grothendieck topos is equivalent to
`Sheaf J (Type u)` for a small site with finite limits and a subcanonical topology, the form
Layers 2 and 8 consume.
*Needs:* 1.1, 1.2; Mathlib `CoproductDisjoint`, `IsUniversalColimit`, `ObjectProperty.IsSeparating`,
`ObjectProperty.Small`, `IsPullback`, `Sites/Canonical`, `Functor.IsDenseSubsite.sheafEquiv`.

**Checks.**

- In `Type u` the internal equivalence relations on `X` are the equivalence relations, the
  coequalizer is the quotient, and its kernel pair is the relation: effective. On `Fin 3`, the
  reflexive symmetric relation `{(i, i)} ∪ {(0, 1), (1, 0), (1, 2), (2, 1)}` (7 pairs) is not
  transitive; its coequalizer is `Fin 3 → PUnit`, whose kernel pair has 9 pairs, so the square is
  not a pullback: transitivity in `IsInternalEquivalenceRel` is needed for effectiveness.
- Universality of the empty coproduct says that a pullback of an initial object is initial. In the
  category of abelian groups the pullback of `0 ⟶ 0` along `ℤ ⟶ 0` is `ℤ`, not initial: the axiom
  is not vacuous for `ι` empty, and it fails there.
- The degenerate topos satisfies every axiom (its object is initial and terminal, with the family
  of that object separating), as it must by 1.1.

### Examples

- Presheaf topoi `Cᵒᵖ ⥤ Type u`, `Sh(X)` for a space `X : Type u`, `Sh(L)` for a frame `L`, and
  the degenerate topos.
- For a group `G : Type u`, the classifying topos `B G` is `Action (Type u) G`, the category of
  `G`-sets. It is a Grothendieck topos through `Action.functorCategoryEquivalence` with
  `SingleObj G ⥤ Type u`, the presheaves on the opposite of `SingleObj G`; the objects of
  `SingleObj G` lie in `Type`, so the small site is `AsSmall.{u}` of it.

### Dependencies

Mathlib only, and for 1.3 the power-object predicate of Mathlib's open work. Within the layer,
1.2 uses 1.1, 1.3 uses 1.2, and 1.4 uses 1.1 and 1.2.

## Layer 2: geometric morphisms and the 2-category of topoi

### 2.1 Geometric morphisms and the existence criterion

Define `GeometricMorphism E F` (Convention 3) with `GeometricMorphism.id`,
`GeometricMorphism.comp` and `GeometricMorphism.ofEquiv`. Prove that the inverse image preserves
all colimits and finite limits, that the direct image preserves all limits, and that the inverse
image is determined by the direct image up to unique isomorphism compatible with the adjunctions
(`Adjunction.leftAdjointUniq`), and conversely. Prove the existence criterion
`GeometricMorphism.exists_iff_preservesFiniteLimits_preservesColimits`: between Grothendieck topoi
`E` and `F`, a functor `Φ : F ⥤ E` is the inverse image of a geometric morphism `E → F` if and
only if it preserves finite limits and `u`-small colimits. The reverse direction is Mathlib's
`isLeftAdjoint_of_preservesColimits_of_isSeparating` applied to `Φ`, whose inputs on `F` are
`HasColimits F` (1.2), `WellPowered.{u} Fᵒᵖ` (1.2, `IsGrothendieckTopos.wellPowered_op`) and a
`u`-small separating family (1.4).
*Needs:* 1.2, 1.4; Mathlib `Adjunction.leftAdjointUniq`, `PreservesFiniteLimits`,
`isLeftAdjoint_of_preservesColimits_of_isSeparating`.

**Checks.**

- `Over.forgetAdjStar` read as inverse image `Over.forget X` and direct image `Over.star X`
  satisfies every field of `GeometricMorphism E (Over X)` except left exactness: for `X = Bool` in
  `Type u`, `Over.forget X` sends the terminal object `𝟙 X` to `Bool`. The finite-limit field
  excludes it.
- `S ↦ S × S` on `Type u` preserves all limits but not binary coproducts
  (`(A ⊕ B)² ≠ A² ⊕ B²` in cardinality for `A = B = PUnit`: 4 against 2), and `S ↦ Bool × S`
  preserves colimits but not the terminal object: neither is an inverse image, one failure for
  each side of the criterion.
- Direction (Convention 3): for a continuous map of spaces the construction of 2.4 gives a
  morphism `Sh(X) → Sh(Y)` whose direct image is the pushforward; `GeometricMorphism.comp` of
  `f` and `GeometricMorphism.id` has direct image `f.direct ⋙ 𝟭 F`, isomorphic to `f.direct`.

### 2.2 2-cells and the 2-category

Define the category structure on `GeometricMorphism E F` with morphisms `GeometricMorphism.Hom`
(Convention 4), the equivalence `GeometricMorphism.homEquivInverse` between
`f.direct ⟶ g.direct` and `g.inverse ⟶ f.inverse` through `conjugateEquiv`, whiskering on both
sides, and the interchange law. Define the 2-category of Grothendieck topoi: a structure bundling
`E : Type (u+1)`, `[Category.{u} E]` and `IsGrothendieckTopos E`, with a `Bicategory` instance
whose 1-cells are geometric morphisms, whose 2-cells are as above, and whose unitors and
associators come from the identity natural isomorphisms of functor composition. Prove that an
isomorphism between two 1-cells is exactly a natural isomorphism of direct images, and that an
equivalence between two objects is exactly `E ≌ F` (SGA 4 IV 3.1–3.2).
*Needs:* 2.1; Mathlib `conjugateEquiv`, `Bicategory`.

**Checks.**

- Sierpiński space (Convention 4): there is a 2-cell from the point `o` to the point `c` and none
  from `c` to `o`; with Elephant's direction the two would be exchanged.
- For a group `G`, the 2-cells from the canonical point of `B G` (inverse image the forgetful
  functor) to itself form, under composition, a group isomorphic to `G`: by Yoneda the natural
  endomorphisms of the forgetful functor, represented by `G`, are the right multiplications. A
  2-cell defined as an unrelated pair of natural transformations of inverse and direct images
  would give `|G|²` elements.
- `GeometricMorphism.homEquivInverse f f` sends `𝟙 f.direct` to `𝟙 f.inverse` (Mathlib's
  `conjugateEquiv_id`): the conjugate is normalised.

### 2.3 The global sections morphism

For every Grothendieck topos `E`, construct the global sections morphism with direct image
`X ↦ (⊤_ E ⟶ X)` and inverse image `S ↦ ∐_{s : S} ⊤_ E`; on `Sheaf J (Type u)` it is `Sheaf.Γ`
and `constantSheaf` with `constantSheafΓAdj`. Prove
`IsGrothendieckTopos.nonempty_geometricMorphism_type` and
`GeometricMorphism.nonempty_unique_hom_to_type`: `GeometricMorphism E (Type u)` is equivalent to
the category with one object and one morphism.
*Needs:* 1.2, 2.2; Mathlib `Sheaf.Γ`, `constantSheaf`, `constantSheafΓAdj`.

**Checks.**

- For `E = Type u`, the direct image `X ↦ (PUnit ⟶ X)` and the inverse image
  `S ↦ ∐_{s : S} PUnit` are isomorphic to `𝟭`: the global sections morphism is
  `GeometricMorphism.id`.
- The degenerate topos has a global sections morphism (inverse image constant at its one object),
  although it has no point: existence of a morphism to `Type u` does not need a point.
- The dual statement is false: the two points of the Sierpiński space are not isomorphic
  (Convention 4), so uniqueness is a property of the codomain `Type u`.

### 2.4 Morphisms of sites, cocontinuous functors and spaces

For small sites and `G : C ⥤ D` with `[G.IsContinuous J K]` and `[RepresentablyFlat G]`, construct
`GeometricMorphism.ofContinuous G` from `Sheaf K (Type u)` to `Sheaf J (Type u)` with direct image
`G.sheafPushforwardContinuous` and inverse image `G.sheafPullback`, whose left exactness is
Mathlib's instance
`Functor.SmallCategories.instPreservesFiniteLimitsSheafSheafPullbackOfRepresentablyFlat` (SGA 4 IV
4.9; Mac Lane–Moerdijk VII.10). Prove that `ofContinuous (𝟭 C)` is isomorphic to
`GeometricMorphism.id` and `ofContinuous (G ⋙ H)` to the composite of `ofContinuous H` and
`ofContinuous G`. For `G` with `[G.IsCocontinuous J K]`, prove
`GeometricMorphism.exists_of_isCocontinuous`: a geometric morphism from `Sheaf J (Type u)` to
`Sheaf K (Type u)` with direct image `G.sheafPushforwardCocontinuous` and inverse image the
sheafification of restriction along `G.op` (SGA 4 III 2.3); when `G` is also continuous, its
inverse image is `G.sheafPushforwardContinuous` with Mathlib's
`Functor.sheafAdjunctionCocontinuous`. A continuous map `f : X → Y` gives a geometric morphism
`Sh(X) → Sh(Y)` with direct image `TopCat.Sheaf.pushforward` and inverse image
`TopCat.Sheaf.pullback`, isomorphic to `ofContinuous (Opens.map f)`, functorially in `f`; a frame
homomorphism `h : FrameHom M L` gives `Sh(L) → Sh(M)` through `ofContinuous` applied to `h` as a
functor.
*Needs:* 2.1; Mathlib `Functor.sheafPushforwardContinuous`, `Functor.sheafPullback`,
`Functor.sheafAdjunctionContinuous`,
`Functor.SmallCategories.instPreservesFiniteLimitsSheafSheafPullbackOfRepresentablyFlat`,
`Functor.sheafPushforwardCocontinuous`, `Functor.sheafAdjunctionCocontinuous`,
`TopCat.Sheaf.pushforward`, `TopCat.Sheaf.pullback`.

**Checks.**

- Flatness is necessary: for `G : Discrete (Fin 2) ⥤ Discrete PUnit` with trivial topologies, the
  pullback is left Kan extension, `(A, B) ↦ A ⊕ B`, which sends the terminal object to a
  two-element type; `G` is continuous, not representably flat, and gives no geometric morphism in
  this direction.
- For `y : PUnit → Y`, the inverse image `TopCat.Sheaf.pullback` along `y` is the stalk at `y`,
  the point of Convention 3.
- For `G = Over.forget c`, cocontinuity gives `Sh(J.over c) → Sh(J)` with inverse image the
  restriction `J.overPullback`; `ofContinuous G` would go the other way and needs
  `RepresentablyFlat G`, which fails when `C` has finite limits and `c` is not terminal, since a
  flat functor preserves finite limits (`preservesFiniteLimits_of_flat`) and `G` sends `𝟙 c` to `c`.

### 2.5 Diaconescu's theorem

For a small site `(C, J)` and `E` with `[HasFiniteLimits E]`, define `IsFiltering J A` for
`A : C ⥤ E`: four families of maps are jointly epimorphic, each written as "two maps out of the
target that agree after every member are equal": (i) the maps `A c ⟶ ⊤_ E`; (ii) for all `c, d`,
the maps `A e ⟶ A c ⨯ A d` induced by spans `c ← e → d`; (iii) for parallel `s, t : c ⟶ d`, the
maps `A e ⟶ equalizer (A.map s) (A.map t)` induced by the `w : e ⟶ c` with `w ≫ s = w ≫ t`; and
(iv) for every covering sieve `S ∈ J c`, the maps `A.map f`, `f ∈ S`. Prove
`nonempty_geometricMorphism_equiv_isFiltering`: for a Grothendieck topos `E`,
`f ↦ (c ↦ f.inverse.obj ((presheafToSheaf J (Type u)).obj (yoneda.obj c)))` is an equivalence from
`GeometricMorphism E (Sheaf J (Type u))` to the opposite of the full subcategory of `J`-filtering
functors in `C ⥤ E`, contravariant because a 2-cell `f ⟶ g` is a transformation
`g.inverse ⟶ f.inverse` (Mac Lane–Moerdijk VII.7–VII.9; Elephant C2.3). When `C` has finite
limits, `J`-filtering means left exact and sending covering sieves to jointly epimorphic
families. For `E = Type u` and `J` trivial, `J`-filtering means that the category of elements
`A.Elements` is cofiltered (Mac Lane–Moerdijk VII.6, Theorem 3), the condition Mathlib's
`GrothendieckTopology.Point` imposes on its fibre functor (`Point.isCofiltered`).
`RepresentablyFlat A` is sufficient, which is what `GeometricMorphism.ofContinuous` uses, but not
necessary.
*Needs:* 1.2, 2.2; Mathlib `presheafToSheaf`, `Functor.Elements`, `Point.isCofiltered`,
`ObjectProperty.FullSubcategory`.

**Checks.**

- Filtering is weaker than flat: on `Discrete {c, d}` with the trivial topology, `A c = PUnit`,
  `A d = ∅` is `J`-filtering (`A.Elements` has one object and its identity, so it is cofiltered,
  and conditions (i)–(iv) hold, (ii) and (iii) trivially wherever `∅` occurs), but not
  representably flat: the category of structured arrows from `∅` has the two objects `(c, !)` and
  `(d, !)` and no morphism between them, so it is not cofiltered.
- For `C = Discrete PUnit` and `E = Type u`, conditions (i) and (ii) force `A *` to be nonempty and
  `A * → A * × A *` to be surjective, so `A *` is a one-element type, matching the single point of
  `Type u` (Convention 7); without (ii), `A * = Bool` would give a second point.
- Condition (iv) is not decorative: on `C = Opens X` with Mathlib's topology, the constant functor
  `PUnit` satisfies (i)–(iii) (`Opens X` has binary meets and a top element), but the empty sieve
  covers `⊥` and `A ⊥ = PUnit` is not covered by an empty family; the functor of a point `x`,
  `U ↦ PLift (x ∈ U)`, satisfies all four.

### Examples

- The points of a space: for `x : X`, the functor `U ↦ PLift (x ∈ U)` on `Opens X` is
  `J`-filtering and corresponds to the point `x` of `Sh(X)`.
- For a commutative monoid `M`, the functor `SingleObj M ⥤ SingleObj (Algebra.GrothendieckGroup M)`
  induced by `Algebra.GrothendieckGroup.of` is `RepresentablyFlat`: its comma category at the
  object is the set of elements of the group with arrows `g ⟶ g'` the `m : M` with `m g = g'`, and
  it is cofiltered because two elements are translates of a common one (write both over a common
  denominator) and two arrows `g ⟶ g'` are equalised by one more translation (`m₁ = m₂` in the
  group gives `m m₁ = m m₂` in `M`). Hence the induced adjunction of presheaf topoi is a geometric
  morphism (2.4) and the functor is final (`CategoryTheory.final_of_representablyFlat`). For
  `M = ℕ` the comma category is `ℤ` with arrows `n ⟶ n + k`, `k ≥ 0`.

### Dependencies

Layer 1 and Mathlib. Within the layer, 2.2–2.5 use 2.1, and 2.3 and 2.5 use 2.2.

## Layer 3: induced topoi and étale morphisms

### 3.1 Slices

Prove `IsGrothendieckTopos.over`: for a Grothendieck topos `E` and `X : E`, `Over X` is one. For a
small site and `c : C`, write `ℓ c := (presheafToSheaf J (Type u)).obj (yoneda.obj c)` (no
subcanonicity is assumed) and prove `nonempty_sheafOverEquiv`, an equivalence
`Sheaf (J.over c) (Type u) ≌ Over (ℓ c)` compatible with Mathlib's `J.overPullback (Type u) c` on
one side and `Over.star (ℓ c)` on the other (SGA 4 III §5, IV §5). Prove that every `u : Y ⟶ X`
of a Grothendieck topos is exponentiable (`ExponentiableMorphism u` for the chosen pullbacks), so
that `Over.pullback u` has a right adjoint `Π_u`.
*Needs:* 1.1, 1.2; Mathlib `GrothendieckTopology.over`, `GrothendieckTopology.overPullback`,
`ExponentiableMorphism`, `Over.pullback`.

**Checks.**

- In `Type u`, `Over Bool` is equivalent to `Type u × Type u` by the two fibres.
- For `c` terminal in `C`, `ℓ c` is the terminal sheaf, and the equivalence reads
  `Sheaf (J.over c) (Type u) ≌ Over (⊤_ _) ≌ Sheaf J (Type u)`.
- Without subcanonicity: on `Discrete {c, d}` with the topology in which the empty sieve covers
  `d`, a sheaf is its value at `c`, `ℓ d` is initial (`ℓ d` is `∅` at `c`), and both sides of the
  equivalence at `d` are degenerate topoi; `yoneda.obj c` is not a sheaf there (its value at `d`
  is `∅`), so the topology is not subcanonical, while `ℓ d = yoneda.obj d`.

### 3.2 Étale morphisms

Prove `IsGrothendieckTopos.exists_etale`: for `X : E` there is a geometric morphism, the *étale
morphism* of `X`, from `Over X` to `E` with inverse image `Over.star X`; its direct image is `Π`
along `X ⟶ ⊤_ E`, and `Over.forget X` is a further left adjoint of the inverse image
(`Over.forgetAdjStar`). For `u : Y ⟶ X` construct the morphism `Over Y → Over X` with inverse
image `Over.pullback u` and direct image `Π_u`; its composite with the étale morphism of `X` is
isomorphic to that of `Y`, and the étale morphism of `Over.mk u` in the topos `Over X` is
`GeometricMorphism.ofEquiv (Over.iteratedSliceEquiv (Over.mk u))` followed by it. A morphism
`f : E → F` is *étale* when there are `X : F` and `e : E ≌ Over X` with `f` isomorphic to
`GeometricMorphism.ofEquiv e` followed by the étale morphism of `X`; prove that étale morphisms
are closed under composition and equivalences and that their inverse images have left adjoints.
*Needs:* 2.1, 3.1; Mathlib `Over.star`, `Over.forgetAdjStar`, `Over.iteratedSliceEquiv`.

**Checks.**

- For `X = Bool` in `Type u`, the inverse image sends `S` to `(S, S)` and the direct image sends
  `(A, B)` to `A × B`; the further left adjoint sends `(A, B)` to `A ⊕ B`.
- For `X = ⊤_ E` the étale morphism is isomorphic to `GeometricMorphism.id E`, through
  `Over (⊤_ E) ≌ E`.
- The inverse image is `Over.star X`, not `Over.forget X`: the latter is not left exact (2.1).

### 3.3 Sites and open subterminals

For `c : C`, the étale morphism of `ℓ c` corresponds under `nonempty_sheafOverEquiv` to the
geometric morphism of the cocontinuous functor `Over.forget c` (2.4), with Mathlib's
`overPullback` as inverse image. A subterminal object `U` (a subobject of `⊤_ E`) gives the étale
morphism `Over U → E`, whose direct image is fully faithful: the *open embedding* of `U`. For a
space `X` and `U : Opens X`, identify it with Mathlib's `Opens.sheafEquivOver` followed by the
geometric morphism of the inclusion `U → X`.
*Needs:* 2.4, 3.1, 3.2; Mathlib `TopologicalSpace.Opens.sheafEquivOver`.

**Checks.**

- For `U = ⊤_ E` the open embedding is the identity; for `U` initial, `Over U` is degenerate and
  the direct image sends its object to `⊤_ E`.
- Full faithfulness needs `U` subterminal: for `X = Bool` in `Type u` the direct image
  `(A, B) ↦ A × B` is not full, since `(Bool, PUnit)` and `(Bool, Bool)` have 8 maps between them
  and their images `Bool` and `Bool × Bool` have 16.
- On the Sierpiński space, the open embedding of `{o}` has `Over (ℓ {o}) ≌ Type u` and is the
  point `o`.

### Examples

- `Over (ℓ c)` for a representable presheaf: the presheaves on the slice `C/c`.
- `Sh(X)/ℓ U ≌ Sh(U)` for `U : Opens X`.

### Dependencies

Layers 1–2 and Mathlib. Within the layer, 3.2 uses 3.1 and 3.3 uses 3.1–3.2.

## Layer 4: subtopoi

### 4.1 Subtopoi and embeddings

Define `Subtopos E` (Convention 6) with its inclusion, the geometric morphism from
`P.FullSubcategory` to `E` whose inverse image is the reflector, and prove that
`P.FullSubcategory` is a Grothendieck topos. Define `GeometricMorphism.IsEmbedding` (direct image
fully faithful); prove that the essential image of the direct image of an embedding is a
subtopos, and that `f` is an embedding if and only if it factors as an equivalence followed by
the inclusion of that subtopos (Elephant A4.2).
*Needs:* 1.1, 2.1; Mathlib `ObjectProperty.IsClosedUnderIsomorphisms`,
`ObjectProperty.FullSubcategory`.

**Checks.**

- `Type u` has exactly two subtopoi (Convention 6): all of `Type u`, and the one-element types,
  whose reflector is the constant functor at `PUnit`.
- Left exactness of the reflector is needed: the types with at most one element form a replete
  reflective subcategory of `Type u` whose reflector `X ↦ PLift (Nonempty X)` does not
  preserve the equalizer of the two maps `PUnit ⟶ Bool` (`∅`, sent to `∅`, while the two images
  `PUnit ⟶ PUnit` agree with equalizer `PUnit`); `Type u` would otherwise have three subtopoi.
- Repleteness is needed: without it `P = (· = PUnit)` and the property "is a one-element type"
  would be two subtopoi with equivalent full subcategories, breaking the bijections of 4.2 and 7.4.

### 4.2 Universal closure operators and Lawvere–Tierney topologies

For `E` with pullbacks, define `UniversalClosureOperator E` (a `ClosureOperator` on each
`Subobject X` commuting with `Subobject.pullback f`) and `UniversalClosureOperator.IsSheaf`: `F` is
a sheaf for `c` when, for every mono `A ↪ B` that is `c`-dense (`c` sends it to `⊤`), restriction
`(B ⟶ F) → (A ⟶ F)` is bijective. Prove `exists_universalClosureOperator_equiv_subtopos`: for a
Grothendieck topos there is a bijection between universal closure operators and subtopoi sending
`c` to its sheaves, and `c ≤ c'` pointwise if and only if the subtopos of `c'` is contained in that
of `c` (Elephant A4.3–A4.4). With a subobject classifier `Ω`, a Lawvere–Tierney topology is
`j : Ω ⟶ Ω` with `truth ≫ j = truth`, `j ≫ j = j`, and `j` commuting with the meet
`Ω ⨯ Ω ⟶ Ω`; prove the order isomorphism with universal closure operators (`c(A)` is classified
by `χ_A ≫ j`), independent of the classifier (Mac Lane–Moerdijk V.1–V.3). For a small site, prove
that Grothendieck topologies on `C` correspond to Lawvere–Tierney topologies on `Cᵒᵖ ⥤ Type u`,
that `Sheaf J (Type u)` is the subtopos of `j` (Mathlib's `Functor.closedSieves`,
`topologyOfClosureOperator`), and that subtopoi of `Sheaf J (Type u)` correspond to topologies
`J' ≥ J`.
*Needs:* 1.2, 4.1; Mathlib `ClosureOperator`, `Subobject.pullback`, `HasSubobjectClassifier`,
`Functor.closedSieves`, `topologyOfClosureOperator`.

**Checks.**

- In `Type u` the two universal closure operators are the identity and the constant `⊤`, with
  sheaves all types and the one-element types: the larger operator has the smaller subtopos.
- For the constant `⊤`, the mono `∅ ↪ PUnit` is dense, and a sheaf `F` has
  `(PUnit ⟶ F) ≃ (∅ ⟶ F)`, one element: `F` is a one-element type.
- Density is `c A = ⊤`, not `c A = A`: with "closed" in place of "dense", for the identity
  operator every mono would count and the sheaves of `Type u` would be the types with unique
  extensions along `∅ ↪ PUnit`, the one-element types, instead of all types.

### 4.3 The lattice of subtopoi; open, closed and dense subtopoi

Prove that `Subtopos E` is a complete lattice whose order dual is a frame, with meets computed as
intersections of object properties (Elephant A4.5). For a subterminal `U`, the *open subtopos*
`o(U)` consists of the `F` for which `F ⟶ F^U` is an isomorphism, and the *closed subtopos*
`c(U)` of the `F` for which the projection `F ⨯ U ⟶ U` is an isomorphism. Prove that `o(U)` is the
essential image of the open embedding of 3.3; that `o(U)` and `c(U)` are complements
(`IsCompl`); that `U ↦ o(U)` is monotone from `Subobject (⊤_ E)` and preserves finite meets and
arbitrary joins; and that for a space `X` and a closed `Z` with complement `U`, `c(U)` is
equivalent to `Sh(Z)` through the geometric morphism of `Z → X`. A subtopos is *dense* when it
contains an initial object; prove that the subtopos of `¬¬`-sheaves is the smallest dense one and
that its subobject lattices are Boolean algebras (Elephant A4.5).
*Needs:* 3.3, 4.2.

**Checks.**

- In `Type u`, `o(PUnit)` and `c(∅)` are all of `Type u`, and `o(∅)` and `c(PUnit)` are the
  one-element types: complements in a two-element lattice.
- Joins are not unions: on the Sierpiński space with `U = ℓ {o}`, a sheaf is a map
  `F(X) → F({o})`; `o(U)` is the sheaves with that map bijective and `c(U)` those with
  `F({o})` a one-element type. Their join is everything, yet the sheaf with
  `F(X) = F({o}) = Bool` and the constant restriction `false` lies in neither.
- On the Sierpiński space the regular opens are `∅` and `X` (`¬¬{o} = X`), so the `¬¬`-subtopos is
  `Sh` of a two-element frame, `Type u`, which is `o(ℓ {o})`, the dense open point.

### 4.4 Gluing

For Grothendieck topoi `F`, `G` and a finite-limit-preserving `Φ : F ⥤ G`, prove that the comma
category `Gl(Φ) = Comma (𝟭 G) Φ` (objects `A : G`, `B : F`, `A ⟶ Φ B`) is a Grothendieck topos in
which `F` is an open subtopos and `G` its closed complement. Conversely, for a subterminal `U` of
`E` with open inclusion `j : o(U) → E` and closed inclusion `i : c(U) → E`, prove that `E` is
equivalent to `Gl(Φ)` for `Φ = j.direct ⋙ i.inverse`, by `F ↦ (i.inverse.obj F, j.inverse.obj F)`
with the structure map induced by the unit of `j`, compatibly with both inclusions (SGA 4 IV 9.5;
Elephant A4.5.6).
*Needs:* 4.3; Mathlib `Comma`.

**Checks.**

- `Φ = 𝟭 (Type u)`: `Gl(Φ)` is the arrow category of `Type u`, which is `Sh` of the Sierpiński
  space with `A = F(X)` (the stalk at `c`), `B = F({o})` and the restriction as `A ⟶ Φ B`.
- `Φ` constant at the terminal object (left exact): `Gl(Φ)` is `G × F`, the topos of a disjoint
  union.
- Orientation: `Comma Φ (𝟭 G)` with `Φ` constant at the terminal object is the category of pointed
  objects of `G`, which has a zero object and so is not a Grothendieck topos unless degenerate
  (1.2: maps into an initial object are isomorphisms).

### 4.5 Surjections and the surjection–embedding factorization

Define `GeometricMorphism.IsSurjection` (`f.inverse` faithful) and prove the equivalent forms
"`f.inverse` is conservative" and "the unit `𝟭 ⟶ f.inverse ⋙ f.direct` is a pointwise
monomorphism". Prove `GeometricMorphism.exists_surjection_embedding`: every geometric morphism
between Grothendieck topoi factors through a Grothendieck topos as a surjection followed by an
embedding; the factorization is unique up to unique equivalence, and surjections and embeddings
are orthogonal in the 2-category (Elephant A4.2.10; Mac Lane–Moerdijk VII.4).
*Needs:* 2.2, 4.1, 4.2.

**Checks.**

- The étale morphism of `Bool` in `Type u` is a surjection (`S ↦ (S, S)` is faithful); that of
  `∅` is not (its inverse image goes to the degenerate topos).
- The point `o` of the Sierpiński space is an embedding (its direct image, `S` to the sheaf with
  `F(X) = F({o}) = S` and identity restriction, is fully faithful), so its factorization is
  trivial; the point `c` (direct image with `F(X) = S`, `F({o}) = PUnit`) is the closed embedding
  of `c(ℓ {o})`.
- The definition is on the inverse image: for the étale morphism of `Bool`, a surjection, the
  direct image `(A, B) ↦ A × B` is not faithful (all maps out of `(∅, B)` go to `𝟙 ∅`).

### Examples

- The subtopoi of `Sh(Sierpiński)`: degenerate, `o(ℓ {o})`, `c(ℓ {o})` and the whole, with the two
  middle ones incomparable (7.4).
- For a small site, the subtopos `Sheaf J (Type u)` of `Cᵒᵖ ⥤ Type u`.

### Dependencies

Layers 1–3 and Mathlib. Within the layer, 4.2 uses 4.1, 4.3 uses 4.2 and 3.3, 4.4 uses 4.3, and
4.5 uses 4.1–4.2.

## Layer 5: classes of geometric morphisms

For `f : E → F` between Grothendieck topoi and `X : F`, write `f/X` for the induced geometric
morphism from `Over (f.inverse.obj X)` to `Over X`: its inverse image is `Over.post f.inverse`,
and its direct image sends `a : A ⟶ f.inverse.obj X` to the pullback of `f.direct.map a` along the
unit `X ⟶ f.direct.obj (f.inverse.obj X)`. For `u : Y ⟶ X` write `u' := f.inverse.map u`. Since
`f.inverse` preserves pullbacks there are canonical isomorphisms
`(f/X).inverse ⋙ Over.pullback u' ≅ Over.pullback u ⋙ (f/Y).inverse` and
`(f/X).direct ⋙ Over.pullback u ≅ Over.pullback u' ⋙ (f/Y).direct`; constructing them is part of
this layer.

### 5.1 Connected morphisms

Define `GeometricMorphism.IsConnected` (`f.inverse` fully faithful); a topos is connected when its
global sections morphism is. Prove that connected morphisms compose; that `Sh(X)` is connected if
and only if `X` is a connected space (Mathlib's `ConnectedSpace`, which includes nonempty); and
that `Cᵒᵖ ⥤ Type u` is connected if and only if `CategoryTheory.IsConnected C`.
*Needs:* 2.3; Mathlib `ConnectedSpace`, `CategoryTheory.IsConnected`.

**Checks.**

- `Type u` is connected; the degenerate topos is not (its inverse image `Type u ⥤ PUnit` is not
  faithful), matching `ConnectedSpace` excluding the empty space, whose `Sh` is degenerate.
- For `X = Bool` discrete, `Sh(X) ≌ Type u × Type u` and `S ↦ (S, S)` is not full: not connected.
- `Cᵒᵖ ⥤ Type u` for `C` with a terminal object is connected; for `C = Discrete (Fin 2)` it is
  `Type u × Type u`, not connected.

### 5.2 Locally connected morphisms

`f` is locally connected when each `(f/X).inverse` has a left adjoint `(f/X)_!` and, for every
`u : Y ⟶ X` in `F`, the mate (Mathlib's `mateEquiv`) of the first isomorphism above,
`Over.pullback u' ⋙ (f/Y)_! ⟶ (f/X)_! ⋙ Over.pullback u`, is an isomorphism: `f.inverse` has an
`F`-indexed left adjoint (Elephant B1.4, C3.3.1). Prove that for `F = Type u` this holds if and
only if the constant functor has a left adjoint `π₀`; that for a small site with
`[J.IsLocallyConnectedSite]` (Mathlib's open work: every covering sieve is connected as a full
subcategory of the slice), the global sections morphism of `Sheaf J (Type u)` is locally connected
with left adjoint `GrothendieckTopology.IsLocallyConnectedSite.π₀ J (Type u)`, through
`π₀ConstantSheafAdj`; that étale morphisms are locally connected; that `Sh(X)` is locally connected
if and only if `X` is locally connected (`LocallyConnectedSpace`); and that a locally connected
`f` is connected if and only if `f_!` preserves the terminal object.
*Needs:* 2.3, 3.2; Mathlib `mateEquiv`, `LocallyConnectedSpace`; the locally connected sites of
Mathlib's open work.

**Checks.**

- For `Type u`, `π₀` is the identity.
- For `Cᵒᵖ ⥤ Type u`, `π₀` is the colimit, the set of connected components of the category of
  elements; for `C = Discrete (Fin 2)` it sends `(A, B)` to `A ⊕ B`.
- `Sh(ℚ)` is not locally connected, as `ℚ` is not a locally connected space (its connected
  components are points, which are not open).

### 5.3 Local morphisms

`f` is local when `f.direct` has a fully faithful right adjoint `f^!`, each `(f/X).direct` has a
right adjoint `(f/X)^!`, and for every `u : Y ⟶ X` the mate of the second isomorphism above,
`(f/X)^! ⋙ Over.pullback u' ⟶ Over.pullback u ⋙ (f/Y)^!`, is an isomorphism (Elephant C3.6.1).
Prove that for `F = Type u` this is "the global sections functor has a fully faithful right
adjoint"; that Mathlib's `GrothendieckTopology.IsLocalSite` gives a local topos through
`ΓCoconstantSheafAdj`; that a local morphism is connected; and that `Sh(X)` is local when `X` has
a point whose only open neighbourhood is `X`.
*Needs:* 2.3, 5.1; Mathlib `GrothendieckTopology.IsLocalSite`, `ΓCoconstantSheafAdj`.

**Checks.**

- `Type u` is local.
- `Cᵒᵖ ⥤ Type u` for `C` with a terminal object `⊤` is local: global sections are evaluation at
  `⊤`, with fully faithful right adjoint `S ↦ (c ↦ ((⊤ ⟶ c) → S))`.
- `Sh(ℝ)` is not local: `∐ₙ ℓ((n − 1, n + 1)) ⟶ ⊤` is an epimorphism with no global section (a
  section `ℝ → Σ n, (n − 1, n + 1)` of the étale space would land in one interval by connectedness),
  so the global sections functor does not preserve epimorphisms and has no right adjoint. The
  Sierpiński space is local at its closed point.

### 5.4 Hyperconnected and localic morphisms

Define `GeometricMorphism.IsHyperconnected` (connected, with the essential image of `f.inverse`
closed under subobjects) and `GeometricMorphism.IsLocalic` (every object of `E` is a quotient of a
subobject of some `f.inverse.obj X`). Prove that hyperconnected morphisms are surjections and
compose (Elephant A4.6.6), and that embeddings and étale morphisms are localic and localic
morphisms compose (Elephant A4.6.1–A4.6.2).
*Needs:* 4.1, 4.5, 5.1.

**Checks.**

- For a group `G`, the global sections morphism of `B G` is hyperconnected: maps between
  trivial `G`-sets are all `G`-maps, and a sub-`G`-set of a trivial one is trivial. It is not
  localic for `G` nontrivial: subquotients of trivial `G`-sets are trivial, and `G` acting on itself
  is not.
- The global sections morphism of `Sh(Sierpiński)` is connected but not hyperconnected: `ℓ {o}` is
  a subobject of `⊤`, a constant sheaf, but is not constant (`ℓ {o}` has value `∅` on `X` and
  `PUnit` on `{o}`).
- The global sections morphism of `Sh(X)` is localic: every sheaf is a quotient of a coproduct
  `∐ ℓ Uᵢ`, a subobject of `∐ ⊤`, the constant sheaf on the index set.

### 5.5 The hyperconnected–localic factorization

Prove `GeometricMorphism.exists_hyperconnected_localic`: every geometric morphism between
Grothendieck topoi factors through a Grothendieck topos as a hyperconnected morphism followed by a
localic one, unique up to unique equivalence (Elephant A4.6.5). Prove that the global sections
morphisms of `Sh(X)` and `Sh(L)` are localic, and that a topos whose global sections morphism is
hyperconnected and localic is equivalent to `Type u`.
*Needs:* 4.5, 5.4.

**Checks.**

- For `B G`, the factorization of the global sections morphism is itself followed by the identity
  of `Type u` (5.4).
- For `Sh(X)` it is the identity of `Sh(X)` followed by the global sections morphism.
- A morphism both hyperconnected and localic is an equivalence, by uniqueness. The global
  sections morphism of the degenerate topos is localic and not connected; its factorization is the
  identity of the degenerate topos followed by itself.

### Examples

- Connected, locally connected and local: `Type u`, presheaves on a category with a terminal
  object, `Sh(Sierpiński)`.
- `B G` is connected and locally connected, with hyperconnected global sections morphism.

### Dependencies

Layers 2–4 and Mathlib, and for 5.2 the locally connected sites of Mathlib's open work. Within the
layer, 5.3 uses 5.1, 5.4 uses 5.1, and 5.5 uses 5.4.

## Layer 6: points, fibre functors and coherent topoi

### 6.1 Points of a topos

A point of `E` is an object of `GeometricMorphism (Type u) E` (Convention 7). Prove
`nonempty_point_equivalence`: for a small site, an equivalence
`GrothendieckTopology.Point.{u} J ≌ GeometricMorphism (Type u) (Sheaf J (Type u))` sending `Φ` to
the geometric morphism with inverse image `Φ.sheafFiber` and direct image
`Φ.skyscraperSheafFunctor`. It is covariant because `Point.Hom` and Convention 4 agree (SGA 4 IV
6.3; the case `E = Type u` of 2.5).
*Needs:* 2.2, 2.5; Mathlib `GrothendieckTopology.Point`, `Point.sheafFiber`,
`Point.skyscraperSheafFunctor`.

**Checks.**

- `Type u`, from `Discrete PUnit`: one point up to isomorphism on both sides.
- Sierpiński space: on both sides, two points `o`, `c` and a single non-identity morphism `o ⟶ c`
  (Convention 4), so the equivalence is covariant; with Elephant's direction it would need `ᵒᵖ`.
- The empty site: no point on either side (the category of elements of a fibre functor on an empty
  category is empty, hence not cofiltered).

### 6.2 Enough points; a topos without points

Define `HasEnoughPoints E`: the inverse images of a `u`-small family of points jointly reflect
isomorphisms. Prove that it is invariant under equivalence and `hasEnoughPoints_sheaf_iff`: for
`E = Sheaf J (Type u)` it is `GrothendieckTopology.HasEnoughPoints.{u} J`. Prove that `Sh(X)` has
enough points (the stalks), that an open or a closed subtopos of a topos with enough points has
enough points, and that `E/X` does (consuming Mathlib's instance on `J.over`). Let `L` be the frame
of regular open subsets of `ℝ`, the fixed points of the double-negation nucleus on `Opens ℝ`
(constructed as a Mathlib `Nucleus`, with sublocale `Nucleus.toSublocale`); prove that `Sh(L)` is
not degenerate and has no point (Elephant C1.2; Mac Lane–Moerdijk IX.2).
*Needs:* 4.3, 6.1; Mathlib `GrothendieckTopology.HasEnoughPoints`, `Nucleus`,
`Nucleus.toSublocale`.

**Checks.**

- The degenerate topos has enough points with the empty family (all its morphisms are
  isomorphisms), although it has no point: the definition reflects isomorphisms and does not ask
  for a point.
- `Sh(L)` for the regular opens of `ℝ` has no point (a point is a frame homomorphism `L → Prop`,
  and `L` is a complete atomless Boolean algebra) and is not degenerate (`L` has `⊥ ≠ ⊤`), so the
  empty family does not reflect isomorphisms (`0 ⟶ ⊤` is not one): enough points fails.
- `Sh(X)` uses the family indexed by `X : Type u`, which is `u`-small.

### 6.3 Change of site and coherent topoi

For small sites `(C, J)`, `(D, K)` and `Φ : Sheaf J (Type u) ≌ Sheaf K (Type u)`, prove that
`Φ.functor` preserves and reflects AdicSpacesPartII's `Topos.IsQuasicompact` and
`Topos.IsQuasiseparated` of objects and `Topos.Hom.IsQuasicompact` and
`Topos.Hom.IsQuasiseparated` of morphisms, and that `Topos.IsAlgebraic` holds for one sheaf
category exactly when it holds for the other. For `hE : IsGrothendieckTopos E`, an object or
morphism of `E` is quasicompact or quasiseparated when its image under some `E ≌ Sheaf J (Type u)`
is; by the invariance this does not depend on the presentation. A Grothendieck topos is *coherent*
when some presentation is `Topos.IsAlgebraic` with a quasicompact and quasiseparated terminal
object (AdicSpacesPartII R0.19.10; SGA 4 VI 2.3), and *locally coherent* when it is algebraic.
Prove that both are independent of the site, that `Sheaf (coherentTopology C) (Type u)` is locally
coherent for small `C` with `[Precoherent C]`, `[HasPullbacks C]` and `[HasEqualizers C]`, and
coherent when `C` moreover has a terminal object. Route: a quasicompact object over `ℓ c` is a
quotient of a finite coproduct of representables, so `Y ×_{ℓ c} Z` is a quotient of a finite
coproduct of `ℓ (d_i ×_c e_j)` and the `ℓ c` are quasicompact and quasiseparated; they are closed
under fibre products because `ℓ` preserves pullbacks; and `ℓ c → *` is quasiseparated because `ℓ`
preserves equalizers, so the fibre of the diagonal of `ℓ c` over `ℓ t → ℓ c × ℓ c`, given by a
parallel pair `f, g : t ⇉ c`, is `ℓ (eq(f, g))`, which is quasicompact. With pullbacks alone this
last step has no argument, and 6.4 does not use it.
*Needs:* 1.1; AdicSpacesPartII R0.19.10 `Topos.IsQuasicompact`, `Topos.IsQuasiseparated`,
`Topos.Hom.IsQuasicompact`, `Topos.Hom.IsQuasiseparated`, `Topos.IsAlgebraic`; Mathlib
`Precoherent`, `coherentTopology`.

**Checks.**

- In `Type u`, from the one-object site, an object is quasicompact exactly when it is finite (it is
  covered by its points), and `Type u` is coherent.
- The diagonal condition is the one that needs equalizers: for a parallel pair `f, g : t ⇉ c`,
  the fibre of `ℓ c → ℓ c × ℓ c` over `ℓ t` is the subsheaf `{h : s → t | f h = g h}` of `ℓ t`.
- `Sh(ℕ)` for discrete `ℕ` is locally coherent but not coherent: the subterminals `ℓ {n}` are
  quasicompact and generate, while `⊤` is covered by them with no finite subcover.
- The presentations of `Type u` by `Discrete PUnit` and by `Opens PUnit` (whose sheaves are
  determined by their value at `⊤`) give the same quasicompact objects, as the invariance requires.

### 6.4 Deligne's theorem

Prove that a locally coherent topos has enough points (SGA 4 VI 9.0, proved in VI §9;
Mac Lane–Moerdijk IX.11), and `hasEnoughPoints_coherentTopology`:
`GrothendieckTopology.HasEnoughPoints.{u} (coherentTopology C)` for every small `C` with
`[Precoherent C]` and `[HasPullbacks C]`. Route for the latter, which does not go through 6.3: for
`c : C`, `Over c` has finite limits (products over `c` are pullbacks in `C`; the equalizer of
`f, g : (d → c) ⇉ (e → c)` is the pullback of `(f, g) : d → e ×_c e` along the diagonal of `e`),
and the induced topology `(coherentTopology C).over c` is generated by finite families, so
`Sheaf (coherentTopology C) (Type u) / ℓ c ≌ Sheaf ((coherentTopology C).over c) (Type u)` (3.1)
is a coherent topos and has enough points (Mac Lane–Moerdijk IX.11). Since the `ℓ c` generate, a
morphism of sheaves is an isomorphism when its pullback to every slice over an `ℓ c` is, so the
points of the slices form a `u`-small conservative family (6.2).
*Needs:* 3.1, 6.2, 6.3; Mathlib `coherentTopology`, `GrothendieckTopology.HasEnoughPoints`,
`GrothendieckTopology.over`.

**Checks.**

- `Sh(L)` for the regular opens of `ℝ` has no point (6.2), so by the theorem it is not equivalent
  to `Sheaf (coherentTopology C) (Type u)` for any small precoherent `C` with pullbacks.
- For `C` empty, the hypotheses hold vacuously, the sheaf topos is degenerate, and the empty
  family of points works (6.2).
- `Sh(ℕ)` for discrete `ℕ`, locally coherent and not coherent (6.3), has enough points, the
  points `n : ℕ`, consistently with the theorem.

### Examples

- The points of `B G` form a connected groupoid in which each object has automorphism group
  isomorphic to `G` (the `G`-torsors, by 2.5); the étale morphism of `G` acting on itself by left
  multiplication is the canonical point, since `Over G ≌ Type u` by the fibre over `1`.
- `Sh(ℝ)` has enough points and no point is isolated.

### Dependencies

Layers 1, 2 and 4, AdicSpacesPartII R0.19.10, and Mathlib. Within the layer, 6.2 uses 6.1 and 6.4
uses 6.2–6.3.

## Layer 7: locales and localic topoi

### 7.1 Sheaves on a frame

Define `Frame.grothendieckTopology L` (Convention 8): a sieve `S` on `U` covers when `U` is the
supremum of the `V ≤ U` with `S` containing `V ⟶ U`; its three axioms are frame distributivity
(pullback stability, `V = V ⊓ ⨆ W = ⨆ (V ⊓ W)`) and a double supremum (transitivity). Prove that it
is subcanonical, that `Subobject (⊤_ Sh(L)) ≃o L` as frames, and that it equals
`Opens.grothendieckTopology X` for `L = Opens X`.
*Needs:* Mathlib `Order.Frame`, `GrothendieckTopology`, `Opens.grothendieckTopology`.

**Checks.**

- The two-element frame gives `Sh(L) ≌ Type u` and the one-element frame the degenerate topos
  (Convention 8).
- The empty sieve covers `⊥` in every frame (`sSup ∅ = ⊥`), so every sheaf has a one-element value
  at `⊥`; a definition asking the covering sieve to be nonempty would make `Sh` of the empty space
  equivalent to `Type u` instead of degenerate.
- For `L = Opens ℝ`, the sieve generated by the intervals `(n − 1, n + 1)`, `n : ℤ`, covers `ℝ`,
  and the sieve generated by `(−∞, 0)` and `(0, ∞)` does not (their supremum misses `0`), in both
  `Frame.grothendieckTopology` and `Opens.grothendieckTopology ℝ`.

### 7.2 Localic topoi and the localic reflection

`E` is localic when its global sections morphism is localic (Layer 5). Prove
`GeometricMorphism.isLocalic_iff_nonempty_equiv_sheaf`: this holds if and only if `E ≌ Sh(L)` for
a frame `L : Type u`; and the equivalent forms "the subterminal objects form a separating family"
and `E ≌ Sh(Subobject (⊤_ E))` (Elephant A4.6.2, C1.4; Mac Lane–Moerdijk IX.5). For every
Grothendieck topos `E`, the geometric morphism `E → Sh(Subobject (⊤_ E))` whose direct image sends
`X` to the sheaf `U ↦ (U ⟶ X)` on subterminals is the hyperconnected part of the
hyperconnected–localic factorization of the global sections morphism, and composing with it gives
`GeometricMorphism E Sh(M) ≌ FrameHom M (Subobject (⊤_ E))`, with the order of 7.3 on frame
homomorphisms, naturally in `M` (Elephant A4.6.5, C1.4).
*Needs:* 5.4, 5.5, 7.1.

**Checks.**

- `Type u` is localic with `L` the two-element frame; `Sh(X)` with `L = Opens X`; the degenerate
  topos with the one-element frame.
- `B G` for nontrivial `G` is not localic (5.4); its subterminals are `∅` and `⊤`, so its localic
  reflection is its global sections morphism to `Type u`.
- The statement quantifies over every `f : GeometricMorphism E (Type u)`; since all of them are
  isomorphic (2.3), it does not depend on the choice.

### 7.3 Locales in topoi; spaces and points

Prove that `Sh` is a pseudofunctor from Mathlib's `Locale` to the 2-category of Grothendieck topoi
(2.2), and that the functor from `FrameHom M L`, ordered by `h ≤ h'` when `h' V ≤ h V` for all
`V`, to `GeometricMorphism Sh(L) Sh(M)` (2.4) is an equivalence: a 2-cell `f ⟶ g` exists exactly
when `g^*(V) ≤ f^*(V)` on subterminals, and there is at most one. Prove that the points of `Sh(L)`
correspond to Mathlib's `Locale.PT L` (frame homomorphisms `L → Prop`), so that the points of
`Sh(X)` are the points of the soberification of `X`; and that for any space `X` and a space `Y`
with `QuasiSober Y` and `T0Space Y`, the geometric morphisms `Sh(X) → Sh(Y)` correspond to the
continuous maps `X → Y`, with a 2-cell `f ⟶ g`, necessarily unique, exactly when
`g x ∈ closure {f x}` for every `x`.
*Needs:* 2.2, 2.4, 7.1; Mathlib `Locale`, `Locale.PT`, `QuasiSober`, `T0Space`.

**Checks.**

- For `X = PUnit` and `Y` the Sierpiński space, the two continuous maps are the points `o` and
  `c`, with a 2-cell `o ⟶ c` because `c ∈ closure {o}` (Convention 4), and none back.
- Sobriety is needed: on `ℕ` with the cofinite topology (T1, not sober), the nonempty opens form a
  completely prime filter that is the neighbourhood filter of no point, a point of `Sh(ℕ)` not
  coming from a continuous map `PUnit → ℕ`.
- Order on frame homomorphisms: the points `o, c` as frame homomorphisms `Opens Y → Prop` take
  `{o}` to `True` and `False`; the 2-cell `o ⟶ c` exists because `c^*(V) ≤ o^*(V)` for every open
  `V`.

### 7.4 Sublocales are subtopoi

Prove `exists_sublocale_orderIso_subtopos`: a bijection `Sublocale L ≃ Subtopos Sh(L)` with
`S ≤ T` exactly when the subtopos of `S` is contained in that of `T` (nuclei, through
`nucleusIsoSublocale`, correspond to universal closure operators on subterminals and thence to
4.2). Open sublocales correspond to open subtopoi and closed sublocales to closed subtopoi; every
subtopos of a localic topos is localic (Picado–Pultr 2012, Chapters III and VI).
*Needs:* 4.2, 4.3, 7.1; Mathlib `Sublocale`, `Nucleus`, `nucleusIsoSublocale`.

**Checks.**

- The two-element frame has two sublocales, `{⊤}` and the whole, matching the two subtopoi of
  `Type u`, with `{⊤}` the degenerate one.
- The frame `0 < a < 1` of the Sierpiński space has four sublocales (in a chain every subset
  containing `1` is closed under meets and under `x ⇨ s`): `{1}`, the open sublocale `{0, 1}`, the
  closed sublocale `{a, 1}` and the whole, with the two middle ones incomparable, matching the
  subtopoi of Layer 4, Examples.
- The direction is order-preserving: the whole frame goes to the whole topos and `{1}` to the
  degenerate one; through nuclei, which `nucleusIsoSublocale` orders the other way, the
  correspondence would reverse.

### Examples

- `Type u`, `Sh(X)` and `Sh(L)` are localic; `B G` for `G ≠ 1` is not.
- The topos `Sh(L)` of regular opens of `ℝ` is localic and has no point (6.2).

### Dependencies

Layers 2, 4 and 5 and Mathlib. Within the layer, 7.2–7.4 use 7.1, and 7.2 uses Layer 5.

## Layer 8: fibre products of topoi, locales and spaces

### 8.1 Fibre products and stability

For geometric morphisms `f : E → S` and `g : F → S` between Grothendieck topoi, a *fibre product* is
a Grothendieck topos `P` with `p : P → E`, `q : P → F` and an isomorphism between the composites of
`p` with `f` and of `q` with `g`, such that for every Grothendieck topos `T` the induced functor
from `GeometricMorphism T P` to the iso-comma (pseudo-pullback) of `GeometricMorphism T E` and
`GeometricMorphism T F` over `GeometricMorphism T S` is an equivalence. Prove existence by the site
construction. A geometric morphism `E → Sh(C_S)` is a `J`-filtering functor `C_S → E` (2.5), which
lands in `E`; choose a small full subcategory of `E` closed under finite limits, containing a
generating family and the image of that functor: with the canonical topology it presents `E` (1.4),
and the functor is a morphism of sites. Then, for sites with finite limits (1.4) and morphisms of
sites `C_S → C_E`, `C_S → C_F` presenting `f` and `g`, the pushout of `C_E ← C_S → C_F` among small
categories with finite limits and left exact functors, with the topology generated by the images of
both topologies (Elephant B3.4). The *product* `E × F` is the fibre product over `Type u` by the
global sections morphisms; for sites with finite limits it is `Sheaf` on `C × D` with the topology
generated by the sieves `R × {𝟙 d}` and `{𝟙 c} × S`. Pullbacks of étale morphisms are étale (the
fibre product of the étale morphism of `X` along `g : F → E` is that of `g.inverse.obj X`);
pullbacks of embeddings are embeddings, of open embeddings open, of closed embeddings closed;
pullbacks of localic morphisms are localic.
*Needs:* 1.4, 2.2, 2.3, 2.5, 3.2, 4.3, 5.4.

**Checks.**

- `E × Type u ≌ E`: `Type u` is terminal among Grothendieck topoi (2.3).
- For sets `I, K`, `Sh(I) × Sh(K)` for discrete spaces is `Sh(I × K)`, families of types indexed
  by `I × K`.
- The fibre product of the étale morphisms of `X` and `Y` in `Type u` over `Type u` is the étale
  morphism of `X × Y`: `Over X × Over Y` over `Type u` is `Over (X × Y)`, families indexed by
  pairs.

### 8.2 Coproducts of frames

Define `IsFrameCoproduct i j` for frame homomorphisms `i : FrameHom L N`, `j : FrameHom M N`.
For frames `L, M : Type u`, construct the frame coproduct `L ⊗ M` as the frame of C-ideals of
`L × M` (down-sets closed under the two one-sided joins `(⨆ Uᵢ, V)` and `(U, ⨆ Vⱼ)`), with frame
homomorphisms `inl`, `inr` satisfying `IsFrameCoproduct inl inr`. Prove that the product of
localic topoi is localic and `Sh(L) × Sh(M) ≃ Sh(L ⊗ M)` (Elephant C1.6; Stone Spaces II.2).
*Needs:* 7.2, 8.1; Mathlib `Order.Frame`, `FrameHom`.

**Checks.**

- The two-element frame is initial among frames, so `L ⊗ {⊥ < ⊤} ≅ L`.
- For the three-element chain `3` (opens of the Sierpiński space), `3 ⊗ 3` has 6 elements, the
  opens of the product of two Sierpiński spaces (the up-sets of a two-by-two grid), while the
  cartesian product of lattices `3 × 3` has 9: the coproduct is not the product.
- The one-element frame is terminal and absorbing: a frame receiving a homomorphism from it has
  `⊥ = ⊤`, so `L ⊗ 1` is the one-element frame, matching `Opens (S × ∅)`.

### 8.3 Way-below and core-compactness

For a complete lattice, define `CompleteLattice.WayBelow a b` (`a ≪ b`): every nonempty directed
`s` with `b ≤ sSup s` has a member above `a`, the quantifier pattern of Mathlib's
`isCompactElement_iff_le_of_directed_sSup_le` (Gierz et al., Chapter I, §1). Prove `a ≪ b → a ≤ b`,
`a' ≤ a → a ≪ b → b ≤ b' → a' ≪ b'`, `⊥ ≪ b`, closure under binary `⊔`, and
`a ≪ a ↔ IsCompactElement a`. Define `CoreCompactSpace X`: every `x ∈ U` with `U : Opens X` lies
in some `V : Opens X` with `V ≪ U` (Hofmann–Lawson 1978, Definition 4.1); equivalently every open
is the supremum of the opens way below it (Stone Spaces VII.4). Prove that `V ≪ U` whenever
`V ⊆ K ⊆ U` for a compact `K` (Mathlib's `IsCompact.elim_directed_cover`), hence
`LocallyCompactSpace.coreCompactSpace`; and that core-compactness passes to open and closed
subspaces and to binary products.
*Needs:* Mathlib `IsCompactElement`, `isCompactElement_iff_le_of_directed_sSup_le`,
`IsCompact.elim_directed_cover`, `LocallyCompactSpace`, `TopologicalSpace.Opens`.

**Checks.**

- In `Opens ℝ`, `(0, 1) ≪ (−1, 2)` (its closure is compact inside), while `(0, 1) ≪ (0, 1)`
  fails: `(0, 1)` is the directed union of the `(1/n, 1 − 1/n)`, none of which contains it.
- `ℚ` is not core-compact: for a nonempty open `V ⊆ U = ℚ`, pick an irrational `t` in an interval
  whose rationals lie in `V`; `U` is the directed union of `U \ [t − 1/n, t + 1/n]`, and none of
  these contains `V`, so no nonempty open is way below `U`.
- The one-point space is core-compact (`⊤ ≪ ⊤` in the two-element frame) and the empty space
  vacuously. Nonemptiness of `s` makes `⊥ ≪ ⊥` hold (with `s = ∅` allowed it would fail), as
  `a ≪ a ↔ IsCompactElement a` requires, `⊥` being compact.

### 8.4 Scattered spaces and products of sober spaces

A space is *scattered* when every nonempty subset `A` has a point `x ∈ A` and an open `W ∋ x`
with `W ∩ A ⊆ {x}`. Prove that this is equivalent to every preperfect subset (Mathlib's
`Preperfect`) being empty; that a scattered space is `T0Space` (isolate a point of `{x, y}`) and
`QuasiSober` (a relatively isolated point of an irreducible closed set is its generic point), so
scattered spaces are sober and their points are the points of their topoi (7.3); that discrete
spaces, finite `T0` spaces and the Sierpiński space are scattered; and that subspaces of scattered
spaces are scattered. Prove `quasiSober_pi` (the generic point of an irreducible closed
`S ⊆ Π i, X i` is the family of the generic points of the closures of the projections of `S`) and
`quasiSober_prod`. With `Pi.instT0Space` and `Prod.instT0Space`, products of sober spaces are
sober, so for sober `S, T` the points of `Sh(S × T)` are the pairs of points of `S` and `T`, the
points of the product topos `Sh(S) × Sh(T)` (its universal property with `Type u`), with no
compactness hypothesis.
*Needs:* 7.3, 8.1; Mathlib `QuasiSober`, `IsIrreducible.genericPoint`, `T0Space`,
`Pi.instT0Space`, `Prod.instT0Space`, `Preperfect`.

**Checks.**

- The Sierpiński space is scattered: a subset containing `o` isolates `o` with `W = {o}`, and
  `{c}` isolates `c` with `W = X`.
- `ℚ` is not scattered (it has no isolated point), and `ℕ` with the cofinite topology is neither
  scattered (every nonempty open meets `ℕ` in infinitely many points) nor quasi-sober (7.3).
- `quasiSober_prod` needs no separation: the indiscrete two-point space is quasi-sober and not
  `T0`, and so is its square; the product of two Sierpiński spaces has four points, the points of
  its topos.

### 8.5 Products of spaces

For spaces `S, T : Type u`, the frame homomorphisms `Opens.comap` of the two projections induce a
surjection of frames `Opens S ⊗ Opens T → Opens (S × T)`. Prove `isFrameCoproduct_opens_prod`: if
`S` is core-compact it is an isomorphism, so `Opens (S × T)` is the frame coproduct (Isbell 1981,
Theorem 1, for `S` quasi-locally compact, that is core-compact, and `T` any space; Stone Spaces
II.2, VII.4), and then `Sh(S × T)` is the product `Sh(S) × Sh(T)` of topoi; this covers every
locally compact `S`. Prove `not_isFrameCoproduct_opens_rat_prod`: for `S = T = ℚ` the map is not
injective, `Opens (ℚ × ℚ)` is not the frame coproduct, and `Sh(ℚ × ℚ)` is not the product of
`Sh(ℚ)` with itself (Stone Spaces II 2.14; Isbell 1972, 2.3 (3), p. 18; Isbell 1981, Theorem 2,
applied to the dense copies `ℚ` and `ℚ + √2` of `ℝ`).
*Needs:* 8.1, 8.2, 8.3; Mathlib `Opens.comap`, `LocallyCompactSpace`.

**Checks.**

- `ℝ × ℝ`: `ℝ` is locally compact, so `Opens (ℝ × ℝ)` is the frame coproduct.
- Finite spaces are locally compact: for two Sierpiński spaces the coproduct has 6 elements (8.2),
  the opens of the product.
- For `ℚ × ℚ` the comparison map is still surjective (every open of `ℚ × ℚ` is a union of open
  rectangles); the failure is of injectivity, and `T = ∅` gives the one-element frame on both
  sides (8.2).

### Examples

- `Sh(ℝ × ℝ) ≃ Sh(ℝ) × Sh(ℝ)`; `Sh(ℚ × ℚ)` and `Sh(ℚ) × Sh(ℚ)` differ, although they have the same
  points (8.4).
- `Sh(Sierpiński × Sierpiński) ≃ Sh(Sierpiński) × Sh(Sierpiński)`, both with four points.

### Dependencies

Layers 1–5 and 7 and Mathlib. Within the layer, 8.2 uses 8.1, 8.4 uses 8.1, and 8.5 uses 8.1–8.3.

## Downstream consumers

No roadmap on main cites this one. HomotopyTheoryOfCategories names it as the owner of
Grothendieck topoi, their points and morphisms and the classifying topos `B G`, and uses none of
that material: sites appear there only as bases of coefficient stacks.

## References

- [SGA 4] M. Artin, A. Grothendieck, J.-L. Verdier, *Théorie des topos et cohomologie étale des
  schémas*, Lecture Notes in Mathematics 269, 270, Springer (1972). Exposé III (2.3 for the
  pullback along a cocontinuous functor; §5 for induced topologies), Exposé IV (1.2 and the
  appendix for Giraud's criteria; 3.1–3.2 for morphisms of topoi and morphisms between them; 4.9
  for morphisms of sites; §5 for induced topoi; §6, especially 6.3, for points and fibre functors;
  §9, especially 9.5, for open and closed subtopoi and gluing), Exposé VI (2.3 for coherent topoi;
  Théorème 9.0 and §9 for Deligne's theorem).
- [Elephant] P. T. Johnstone, *Sketches of an Elephant: A Topos Theory Compendium*, Oxford Logic
  Guides 43–44, Oxford University Press (2002). Part A: A4.1 (geometric morphisms), A4.2
  (surjections and inclusions, A4.2.10), A4.3–A4.4 (cartesian reflectors, local operators,
  universal closure operations), A4.5 (open, closed, gluing A4.5.6, the coframe of subtopoi,
  `¬¬`), A4.6 (localic and hyperconnected morphisms, A4.6.5). Part B: B1.4 (indexed adjunctions),
  B3.4 (pullbacks of topoi). Part C: C1.2 (locales, regular opens), C1.4 (localic topoi), C1.6
  (products of locales and topoi), C2.1–C2.3 (sites, Giraud's theorem C2.2.8, morphisms of sites,
  Diaconescu), C3.3 (locally connected morphisms), C3.6 (local morphisms).
- [MM] S. Mac Lane, I. Moerdijk, *Sheaves in Geometry and Logic*, Universitext, Springer (1992).
  Chapter III (Grothendieck topoi), V.1–V.3 (Lawvere–Tierney topologies and associated sheaves),
  VII.1–VII.10 (geometric morphisms, embeddings and surjections VII.4, points VII.5, flat functors
  VII.6 with Theorem 3, filtering functors and Diaconescu VII.7–VII.9, morphisms of sites VII.10),
  IX.1–IX.5 (locales, points, localic topoi), IX.11 (Deligne's theorem), Appendix (Giraud's
  theorem).
- [Stone Spaces] P. T. Johnstone, *Stone Spaces*, Cambridge Studies in Advanced Mathematics 3,
  Cambridge University Press (1982). Chapter II, §§1–2 (frames, locales, nuclei and sublocales,
  coproducts of frames by C-ideals, products of locally compact spaces, 2.14 for `ℚ × ℚ`), §3
  (spaces and sober spaces); Chapter VII, §4 (locally compact spaces and continuous lattices).
- [Godement] R. Godement, *Topologie algébrique et théorie des faisceaux*, Actualités
  scientifiques et industrielles 1252, Hermann (1958). Chapitre II, §1 (presheaves and sheaves
  of sets on a topological space).
- [Isbell 1972] J. R. Isbell, « Atomless parts of spaces », *Mathematica Scandinavica* 31 (1972),
  5–32: locales, localic products, and 2.3 (3), p. 18, the product `ℚ × ℚ`.
- [Isbell 1981] J. R. Isbell, « Product spaces in locales », *Proceedings of the American
  Mathematical Society* 81 (1981), 116–118: Theorem 1 (the localic product `X × Y` is a space when
  `X` is quasi-locally compact and `Y` is a space) and Theorem 2 (two subspaces of a Hausdorff
  space with no common point and a nonzero localic meet have a non-spatial product), applied
  here to the dense copies `ℚ` and `ℚ + √2` of `ℝ`.
- [Gierz et al.] G. Gierz, K. H. Hofmann, K. Keimel, J. D. Lawson, M. Mislove, D. S. Scott,
  *Continuous Lattices and Domains*, Encyclopedia of Mathematics and its Applications 93,
  Cambridge University Press (2003). Chapter I, §1 (the way-below relation).
- [Hofmann–Lawson 1978] K. H. Hofmann, J. D. Lawson, « The spectral theory of distributive
  continuous lattices », *Transactions of the American Mathematical Society* 246 (1978), 285–310:
  Definition 4.1 (core-compact spaces), continuous frames of opens.
- [Joyal–Tierney 1984] A. Joyal, M. Tierney, *An extension of the Galois theory of Grothendieck*,
  Memoirs of the American Mathematical Society 51 (1984), no. 309. doi:10.1090/memo/0309;
  Zbl 0541.18002: open geometric morphisms, descent along open surjections, and every Grothendieck
  topos as the topos of equivariant sheaves on a localic groupoid.
- [Moerdijk–Vermeulen 2000] I. Moerdijk, J. J. C. Vermeulen, *Proper maps of toposes*, Memoirs of
  the American Mathematical Society 148 (2000), no. 705. doi:10.1090/memo/0705; Zbl 0961.18003:
  proper and tidy geometric morphisms.
- [Picado–Pultr 2012] J. Picado, A. Pultr, *Frames and Locales: Topology without points*,
  Frontiers in Mathematics, Birkhäuser (2012). doi:10.1007/978-3-0348-0154-6. Chapters III and VI
  (sublocales).
