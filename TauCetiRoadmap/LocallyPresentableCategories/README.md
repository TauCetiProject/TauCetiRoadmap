# Roadmap: locally presentable categories and algebraic theories

**Summary.** Build the theory of locally presentable categories and their theories on Mathlib's
carriers (`IsCardinalPresentable`, `IsCardinalLocallyPresentable`, `IsLocallyPresentable`,
`IsCardinalAccessibleCategory`, `MorphismProperty.isLocal`, `CategoryTheory.Ind`): ordinary
categories `C : Type u` with `Category.{v} C`, a regular cardinal `κ : Cardinal.{w}`, small
categories in `Type w`. The end theorems are: a locally `κ`-presentable category is complete
(1.1); it is locally `κ`-presentable exactly when it is a full reflective subcategory of a presheaf
category on a small category whose inclusion preserves `κ`-filtered colimits (1.2), and exactly
when it is a small-orthogonality class of presheaves for maps between `κ`-presentable presheaves
(2.1); a category is locally presentable exactly when it is accessible and complete (1.3); between
locally presentable categories a functor is a right adjoint exactly when it preserves limits and is
accessible, and a left adjoint exactly when it preserves colimits (1.4); a category is finitely
accessible exactly when it is `Ind A` for a small `A` (1.5). Gabriel–Ulmer duality (Layer 3): for
a small category `T` the functors `T ⥤ Type w` preserving `κ`-small limits form a
small-orthogonality class and a locally `κ`-presentable category `Mod_κ T` (3.1); every locally
`κ`-presentable category is `Mod_κ T` for a small `T` with `κ`-small limits (3.2); such a `T` is
recovered as the opposite of the `κ`-presentable models (3.3); restriction along a morphism of
theories is a `κ`-accessible right adjoint, and every `κ`-accessible right adjoint between
categories of models is such a restriction, when both theories have `κ`-small limits (3.4).
For finite-product theories (Layer 4): algebras form a locally finitely presentable category whose
sifted colimits are computed pointwise, and the categories of algebras of small categories with
finite products are the cocomplete categories generated under sifted colimits by a small set of
strongly finitely presentable objects (Lack–Rosický, Theorem 3.1). For a small family `D` of limit
shapes (Layer 5): the models of a small category in `Type w` that preserve `D`-limits form a
reflective locally presentable subcategory (5.1); the free completion `Ĩ` of a small `I` under
`D`-limits is essentially small and has the universal property of the `D`-envelope (5.2); and a
small set `S` of arrows of a small category can be inverted inside the 2-category of categories with
`D`-limits (5.3).

Suggested home: `TauCeti/CategoryTheory/Presentable/`, beside Mathlib's
`Mathlib/CategoryTheory/Presentable/`.

## Scope and ownership

**Owned here.** Statements about ordinary (1-)categories, quantified over an arbitrary category or
an arbitrary small theory, that concern locally presentable and accessible categories as a class:

- completeness, the representation theorems by reflective subcategories and by
  small-orthogonality classes in presheaf categories, accessible-and-complete, the adjoint functor
  theorem between locally presentable categories, and finitely accessible categories as `Ind A`
  (Layers 1 and 2);
- the categories `Mod_κ T` of models of small theories with `κ`-small limits, Gabriel–Ulmer
  duality on objects and on 1-cells, and essentially algebraic theories (Layer 3);
- the categories of algebras of finite-product (Lawvere-type, many-sorted) theories and their
  recognition theorem (Layer 4);
- categories with `D`-limits for a small family `D` of shapes, their models, `D`-envelopes,
  localisation in the 2-category they form, and sound doctrines (Layer 5).

**Supplied by Mathlib and consumed by name.** `κ`-presentable objects, `κ`-filtered categories,
locally `κ`-presentable and `κ`-accessible categories and their unbounded versions, strong
generators and the theorem that a cocomplete category is locally `κ`-presentable exactly when it
has a small strong generator of `κ`-presentable objects (Adámek–Rosický, Theorem 1.20), the
transfer of local presentability along a reflective inclusion preserving `κ`-filtered colimits,
presheaf categories, the orthogonal-reflection construction (Adámek–Rosický, Theorem 1.39 and
Corollary 1.40, one direction), the solution-set condition for accessible functors
(Adámek–Rosický, Corollary 2.45), uniformization, accessible comma categories, and `Ind A` with its
filtered colimits. No second carrier is built.

**Left to other roadmaps.**

- *Orthogonality of classes of morphisms*: unique lifting, the operators `leftOrthogonal` and
  `rightOrthogonal`, orthogonal factorization systems and local objects for an arbitrary class are
  not built here; this roadmap uses only Mathlib's `MorphismProperty.isLocal`, objects orthogonal
  to a class.
- *Lurie's form of presentability, the small object argument in a presentable category, weakly
  saturated classes, accessible subcategories and combinatorial model categories* are
  HigherToposTheory's Layer F1 (§§F1.1, F1.3, F1.6).
- *Presentable and accessible ∞-categories* are EnhancedDerivedSheaves §E0.8 and Layer
  E5:presentability, and HigherToposTheory Layer L7; the ∞-categorical `Ind_κ` is
  BordismFormalGroups §F6.5. Nothing here is about ∞-categories.
- *Grothendieck topoi, Giraud's theorem and geometric morphisms* are GrothendieckTopoi's (Layers 1
  and 2; §1.4 for Giraud's theorem). That a Grothendieck topos is locally presentable is an
  instance of target 1.2 recorded in the Examples of Layer 1. Classifying topoi of geometric
  theories are outside GrothendieckTopoi's scope (its Scope and ownership) and outside this one:
  every theory here is a limit theory, and none involves colimits or exactness conditions.
- *Particular categories* (modules, rings, schemes, sheaves on a particular site) and the
  presentability of each belong to the roadmap owning the category, which cites this one.

The boundary in one sentence: if a statement is about locally presentable or accessible
1-categories in general, or about small categories with limits of a given class as theories, it is
here; if it is about one particular category, about ∞-categories, or about topoi, it is elsewhere.

## Conventions

- **Universes.** `C : Type u` with `Category.{v} C`; cardinals `κ : Cardinal.{w}` with
  `[Fact κ.IsRegular]`; small categories are `J : Type w` with `SmallCategory J`; models and
  presheaves take values in `Type w`. Mathlib's regular cardinals are infinite, so `κ = ℵ₀`
  (`Cardinal.isRegular_aleph0`) is allowed and is the finitary case.
- **Presentable objects.** `IsCardinalPresentable X κ`: `Hom(X, −)` preserves colimits of every
  small `κ`-filtered category. Adámek–Rosický index by `λ`-directed posets (Definition 1.13); the
  two agree because every small `κ`-filtered category receives a final functor from a `κ`-directed
  poset (Mathlib `IsCardinalFiltered.exists_cardinal_directed`). Witness: in `Type w`, `Fin 3` is
  `ℵ₀`-presentable and `ℕ` is not (Mathlib `Types.isCardinalPresentable_iff`: `κ`-presentable
  means fewer than `κ` elements).
- **`κ`-small shapes.** A small category `J` is `κ`-small when `HasCardinalLT (Arrow J) κ`, fewer
  than `κ` morphisms, as in Adámek–Rosický. `PreservesCardinalSmallLimits F κ` and
  `HasCardinalSmallLimits X κ` (0.1) quantify over all such `J : Type w`. Witness:
  `WalkingParallelPair` has four morphisms (two identities, two arrows) and is `ℵ₀`-small;
  `Discrete ℕ` has `ℵ₀` morphisms and is not; the empty category is `κ`-small, so `κ`-small limits
  include terminal objects.
- **Models are covariant.** A model of a small `T` is a functor `T ⥤ Type w`; the corepresentable
  models `T(t, −)` depend contravariantly on `t`, so the theory is recovered as `Tᵒᵖ` (3.3).
  Witness: for `T = FinSetᵒᵖ` (a small skeleton of finite sets, opposite), the corepresentable at
  the set `n` evaluated at `1` is `FinSet(1, n)`, with `n` elements.
- **Shape families.** In Layer 5, `D : α → Type w` with `α : Type w` and
  `[∀ a, SmallCategory (D a)]`. `HasDLimits D X` and `PreservesDLimits D F` ask for limits of every
  shape `D a`, and their preservation. Witness: for `α = ℕ` and `D n = Discrete (Fin n)`,
  `PreservesDLimits D F` is Mathlib's `PreservesFiniteProducts F`, whose only field is
  `∀ n, PreservesLimitsOfShape (Discrete (Fin n)) F`; for `α` empty both predicates are `True`.
- **Restriction.** For `G : T ⥤ T'`, `restrict G hG` sends a model `M` of `T'` to `G ⋙ M`
  (Lack–Rosický, §5.2, write `G^*`).

## Exact supplier contracts

**From Mathlib** (at the pinned revision).

- `Mathlib/CategoryTheory/Presentable/Basic.lean`: `Functor.IsCardinalAccessible`,
  `Functor.IsAccessible`, `IsCardinalPresentable`, `isCardinalPresentable`, `IsPresentable`,
  `HasCardinalFilteredColimits`.
- `…/Presentable/LocallyPresentable.lean`: `IsCardinalLocallyPresentable`,
  `IsCardinalAccessibleCategory`, `IsLocallyFinitelyPresentable`, `IsFinitelyAccessibleCategory`,
  `IsLocallyPresentable`, `IsAccessibleCategory`, and the instances
  `IsAccessibleCategory → LocallySmall` and `IsAccessibleCategory → IsPresentable X`.
- `…/Presentable/StrongGenerator.lean`: `IsCardinalLocallyPresentable.iff_exists_isStrongGenerator`,
  `IsCardinalLocallyPresentable.of_le`, `ObjectProperty.IsStrongGenerator`.
- `…/Presentable/Adjunction.lean`: `Adjunction.isCardinalLocallyPresentable`,
  `Adjunction.isCardinalAccessibleCategory`, `Adjunction.isCardinalPresentable_leftAdjoint_obj`,
  `Equivalence.isCardinalLocallyPresentable`, `Equivalence.isLocallyPresentable`.
- `…/Presentable/OrthogonalReflection.lean`: `MorphismProperty.isRightAdjoint_ι_isLocal`,
  `MorphismProperty.isLocallyPresentable_isLocal`;
  `Mathlib/CategoryTheory/ObjectProperty/Local.lean`:
  `MorphismProperty.isLocal`.
- `…/Presentable/Presheaf.lean`: the instances making `Cᵒᵖ ⥤ A` locally `κ`-presentable for small
  `C` and locally `κ`-presentable `A` with pullbacks; `…/Presentable/Type.lean`: `Type w` is
  locally presentable, `Types.isCardinalPresentable_iff`.
- `…/Presentable/Dense.lean`: density of the `κ`-presentable objects
  (`(isCardinalPresentable C κ).ι` is dense);
  `…/Presentable/Directed.lean`: `IsCardinalFiltered.exists_cardinal_directed`;
  `…/Presentable/SolutionSetCondition.lean`: `SolutionSetCondition.of_isCardinalAccessible`.
- `Mathlib/CategoryTheory/Limits/Indization/Category.lean`: `CategoryTheory.Ind`,
  `Ind.yoneda`, `HasFilteredColimits (Ind C)`.
- `Mathlib/CategoryTheory/Limits/Sifted.lean`: `IsSifted`,
  `IsSifted.colim_preservesFiniteProducts_of_isSifted`.
- `Mathlib/CategoryTheory/Adjunction/AdjointFunctorTheorems.lean`:
  `isRightAdjoint_of_preservesLimits_of_solutionSetCondition`,
  `isLeftAdjoint_of_preservesColimits_of_isSeparating`; `Mathlib/CategoryTheory/Monad/Limits.lean`:
  `hasLimits_of_reflective`, `hasColimits_of_reflective`; `…/Presentable/Uniformization.lean`:
  `IsCardinalAccessibleCategory.uniformization`; `…/Presentable/Limits.lean`:
  `isClosedUnderColimitsOfShape_isCardinalPresentable`; `…/Presentable/StrongGenerator.lean`:
  `IsStrongGenerator.colimitsCardinalClosure_eq_isCardinalPresentable`.
- `Mathlib/CategoryTheory/ObjectProperty/LimitsClosure.lean`: `ObjectProperty.limitsClosure`,
  `ObjectProperty.le_limitsClosure`, `ObjectProperty.isEssentiallySmall_limitsClosure`;
  `ObjectProperty.ofObj`, `ObjectProperty.lift`, `ObjectProperty.ι`,
  `ObjectProperty.FullSubcategory`, `ObjectProperty.colimitsOfShape`, `ObjectProperty.Small`;
  `MorphismProperty.IsSmall`, `MorphismProperty.IsInvertedBy`.
- Limits: `HasLimitsOfSize`, `HasLimitsOfShape`, `PreservesLimitsOfShape`,
  `PreservesLimitsOfSize`, `PreservesColimitsOfSize`, `PreservesFiniteProducts`,
  `HasFiniteProducts`, `comp_preservesLimitsOfShape`; `HasCardinalLT`; `Functor.IsRightAdjoint`,
  `Functor.IsLeftAdjoint`, `Functor.IsEquivalence`, `Functor.whiskeringLeft`, `coyoneda`,
  `EssentiallySmall`.

**From Tau Ceti.** Nothing.

Nothing is consumed from another roadmap.

## How to read the build

Layer 0 fixes the `κ`-small shapes and the two predicates on them that Layer 3 uses. Layer 1 proves
the structure theorems on Mathlib's locally presentable and accessible categories: completeness, the
representation as reflective subcategories of presheaf categories, the characterisation as
accessible and complete, the adjoint functor theorem, and `Ind`. Layer 2 gives the representation by
small-orthogonality classes, from Mathlib's reflection theorem and 3.1–3.2. Layer 3 defines the
categories of models `Mod_κ T` and proves Gabriel–Ulmer duality on objects
(3.1–3.3) and on morphisms (3.4); 3.5 compares with the syntactic essentially algebraic theories.
Layer 4 specialises to finite products: algebras, sifted colimits, and the recognition theorem.
Layer 5 replaces `κ`-small limits by an arbitrary small family `D` of shapes: models, the
`D`-envelope of a small category, localisation, and sound doctrines. Within Layer 1, 1.2 comes first
and 1.1 uses its forward half; Layer 2 uses 3.1 and 3.2; Layer 3 uses 0.1, and 1.4 in 3.4; Layer 4
uses 3.1; Layer 5 uses 3.1. The hardest targets are 1.4 (via the solution-set condition), 3.4 and
5.3.

## Layer 0: `κ`-small shapes

### 0.1 `κ`-small limits

Define `PreservesCardinalSmallLimits F κ`, for a functor `F : X ⥤ Y` between arbitrary categories:
`F` preserves limits of every shape `J : Type w` with `HasCardinalLT (Arrow J) κ`; and
`HasCardinalSmallLimits X κ`: `X` has limits of every such shape. The size of a diagram is
measured by its morphisms, as in Adámek–Rosický. They are the hypotheses on theories and morphisms
of theories in Layer 3. *Needs:* Mathlib `HasCardinalLT`, `Arrow`,
`PreservesLimitsOfShape`, `HasLimitsOfShape`.

**Checks.**

- `WalkingParallelPair` has four morphisms and is `ℵ₀`-small; `Discrete ℕ` has `ℵ₀` morphisms and
  is not, so `HasCardinalSmallLimits X ℵ₀` asks for equalizers and not for countable products.
- The empty category is `κ`-small for every `κ`: `HasCardinalSmallLimits X κ` includes a terminal
  object, and `PreservesCardinalSmallLimits F κ` its preservation.
- At `κ = ℵ₀`, `HasCardinalSmallLimits X ℵ₀` is equivalent to Mathlib's `HasFiniteLimits X`: a
  `FinCategory` has finitely many morphisms, and a small category with finitely many morphisms is
  a `FinCategory` after choosing decidable equality; a definition counting objects instead of
  morphisms would admit the infinite monoid `ℕ` (one object) as a finite shape.

### Examples

- `PUnit` has every limit, so `HasCardinalSmallLimits PUnit κ` for every `κ`; `FinSetᵒᵖ` has
  `HasCardinalSmallLimits (FinSetᵒᵖ) ℵ₀`, its finite limits being the finite colimits of finite
  sets.

### Dependencies

Mathlib: `HasCardinalLT`, `CategoryTheory.Limits`.

## Layer 1: locally presentable and accessible categories

### 1.1 Completeness

Prove that a locally `κ`-presentable `C` has all `w`-small limits
(`hasLimitsOfSize_of_isCardinalLocallyPresentable`; a consequence of Adámek–Rosický, Theorem 1.46,
as `C` is reflective in a presheaf category). Route: the
forward half of 1.2 makes `C` a reflective subcategory of a presheaf category, and a reflective
subcategory of a complete category is complete (Mathlib `hasLimits_of_reflective`). *Needs:* 1.2
(forward half); Mathlib `hasLimits_of_reflective`,
`IsCardinalLocallyPresentable`, `IsCardinalLocallyPresentable.iff_exists_isStrongGenerator`,
`HasLimitsOfSize`.

**Checks.**

- `Type w` is locally `ℵ₀`-presentable (Mathlib) and complete: its limits are sets of compatible
  families.
- `Type wᵒᵖ` is complete and cocomplete but not locally presentable, so completeness is not
  sufficient: for each regular `κ`, the subsets `[α, κ)` of `κ` (`α < κ`) form a `κ`-filtered
  diagram in `Type wᵒᵖ` whose colimit is their intersection `∅`; `Hom(2, ∅) = Set(∅, 2)` has one
  element, while in the colimit of the `Set([α, κ), 2)` the constant maps `0` and `1` have distinct
  germs, so `2` is not `κ`-presentable for any `κ`.
- The discrete category on two objects is finitely accessible (a filtered diagram in it is constant
  up to isomorphism, and both objects are finitely presentable) but has no terminal object: it is
  not locally presentable, consistent with 1.1.

### 1.2 Reflective subcategories of presheaf categories

Prove `isCardinalLocallyPresentable_iff_exists_reflective`: `C` is locally `κ`-presentable iff
there are a small category `A` and a functor `G : C ⥤ (Aᵒᵖ ⥤ Type w)` that is full, faithful, a
right adjoint and `κ`-accessible (Adámek–Rosický, Theorem 1.46). Route, forward: take `A` a small
model of the `κ`-presentable objects (Mathlib: they are essentially small) and `G` the restricted
Yoneda functor; it is fully faithful by Mathlib's density of the `κ`-presentable objects, preserves
`κ`-filtered colimits because the objects of `A` are `κ`-presentable, and has the left Kan
extension of the inclusion as left adjoint since `C` is cocomplete. Backward: Mathlib's
`Adjunction.isCardinalLocallyPresentable` with the presheaf instance. *Needs:* Mathlib
`isCardinalPresentable`, the density of `(isCardinalPresentable C κ).ι`,
`Adjunction.isCardinalLocallyPresentable`, `Functor.IsCardinalAccessible`, the presheaf instance;
1.1 is not needed, and 1.1 uses this forward half.

**Checks.**

- `C = Type w`: `A = PUnit` and `G` the equivalence `Type w ≌ (PUnitᵒᵖ ⥤ Type w)`.
- The subsingletons of `Type w` (sets with at most one element): full, reflective (send `∅` to `∅`
  and a nonempty set to `PUnit`) and closed under filtered colimits; the category is locally
  finitely presentable, equivalent to the poset `0 < 1`.
- The right-adjoint condition is needed: the nonempty sets form a full subcategory of `Type w`
  closed under filtered colimits, but it has no initial object (a nonempty `R` has `2^|R| ≥ 2` maps
  to the two-point set), so `∅` has no reflection into it and it is not locally presentable.

### 1.3 Accessible and complete

Prove `isLocallyPresentable_iff_isAccessibleCategory_and_hasLimits`: `C` is locally presentable iff
it is accessible and has all `w`-small limits (Adámek–Rosický, Corollary 2.47). Forward: 1.1 and
Mathlib's instance. Backward: let `C` be `κ`-accessible with all `w`-small limits, `A` a small
model of its `κ`-presentable objects (Mathlib: they are essentially small) and
`G : C ⥤ (Aᵒᵖ ⥤ Type w)` the restricted Yoneda functor `X ↦ C(−, X)`, with values in `Type w`
since `C` is locally `w`-small. `G` is fully faithful by Mathlib's density of the `κ`-presentable
objects of a `κ`-accessible category, preserves limits (each `C(a, −)` does), and is
`κ`-accessible (each `a` is `κ`-presentable and colimits of presheaves are computed pointwise);
the presheaf category is locally presentable (the presheaf instance), hence accessible. So `G`
satisfies the solution-set condition (Mathlib `SolutionSetCondition.of_isCardinalAccessible`,
Adámek–Rosický, Corollary 2.45), and the general adjoint functor theorem
(`isRightAdjoint_of_preservesLimits_of_solutionSetCondition`, `C` being complete and locally
small) makes it a right adjoint. Thus `C` is reflective in a cocomplete category, hence cocomplete
(Mathlib `hasColimits_of_reflective`), and a cocomplete `κ`-accessible category is locally
`κ`-presentable by definition. *Needs:* 1.1; Mathlib `IsAccessibleCategory`,
`isCardinalPresentable`, the density of `(isCardinalPresentable C κ).ι`, the presheaf instance,
`Functor.IsCardinalAccessible`, `SolutionSetCondition.of_isCardinalAccessible`,
`isRightAdjoint_of_preservesLimits_of_solutionSetCondition`, `hasColimits_of_reflective`,
`IsLocallyPresentable`.

**Checks.**

- The discrete category on two objects: accessible, not complete (1.1, third Check).
- `Type wᵒᵖ`: complete, not accessible (1.1, second Check).
- A cocomplete accessible category is locally presentable directly from Mathlib's definition
  (`IsCardinalLocallyPresentable` extends `HasCardinalFilteredGenerator` and `HasColimitsOfSize`);
  the content of the target is the complete case.

### 1.4 The adjoint functor theorem

For `C` and `D` locally presentable, prove `isRightAdjoint_iff`: `G : C ⥤ D` is a right adjoint
iff it preserves `w`-small limits and is accessible (Adámek–Rosický, Theorem 1.66); and
`isLeftAdjoint_iff`: `F : C ⥤ D` is a left adjoint iff it preserves `w`-small colimits (the special
adjoint functor theorem, `C` being co-wellpowered). Route for
`isRightAdjoint_iff`: a limit-preserving accessible functor between accessible categories
satisfies the solution-set condition (Mathlib `SolutionSetCondition.of_isCardinalAccessible`), so
the general adjoint functor theorem applies (Mathlib
`isRightAdjoint_of_preservesLimits_of_solutionSetCondition`); conversely a right adjoint preserves
limits, and preserves `κ`-filtered colimits for `κ` large enough that its left adjoint preserves
`κ`-presentable objects (Mathlib `IsCardinalAccessibleCategory.uniformization`). Route for
`isLeftAdjoint_iff`: Mathlib `isLeftAdjoint_of_preservesColimits_of_isSeparating`, `C` having a
small separating family of presentable objects, `C` and `D` having small hom-sets, and `C` being
co-wellpowered (`WellPowered Cᵒᵖ`, proved in this target). *Needs:* 1.1, 1.3; Mathlib
`SolutionSetCondition.of_isCardinalAccessible`,
`isRightAdjoint_of_preservesLimits_of_solutionSetCondition`,
`isLeftAdjoint_of_preservesColimits_of_isSeparating`,
`IsCardinalAccessibleCategory.uniformization`, `Functor.IsAccessible`, `PreservesLimitsOfSize`,
`PreservesColimitsOfSize`, `WellPowered`.

**Checks.**

- `X ↦ X × X` on `Type w` preserves limits and filtered colimits, so it is a right adjoint (of
  `X ↦ X ⊔ X`); it is not a left adjoint, since it sends `1 ⊔ 1` (two points) to four points while
  `1 × 1 ⊔ 1 × 1` has two.
- `X ↦ Xᴺ = (ℕ → X)` on `Type w` is a right adjoint (of `X ↦ ℕ × X`) that is `ℵ₁`-accessible and
  not `ℵ₀`-accessible (`ℕ` is not finitely presentable): the accessibility index is not fixed.
- The constant functor at `∅` on `Type w` is accessible and preserves connected limits but not the
  empty limit (`∅` is not terminal): it is not a right adjoint, so preservation of all limits is
  needed.

### 1.5 Finitely accessible categories and `Ind`

Prove `isFinitelyAccessibleCategory_iff_exists_ind`: `C` is finitely accessible iff `C ≌ Ind A`
for a small category `A` (Adámek–Rosický, Theorem 2.26, at `λ = ℵ₀`). Forward: `A` a small model of
the finitely presentable objects, and Mathlib's density. Backward: in `Ind A` the objects
`Ind.yoneda a` are finitely presentable and every object is a filtered colimit of them (Mathlib
`Ind.presentation`). *Needs:* Mathlib `IsFinitelyAccessibleCategory`, `Ind`, `Ind.yoneda`,
`Ind.presentation`, `HasFilteredColimits (Ind C)`.

**Checks.**

- `A = PUnit`: a filtered colimit of copies of the one-point presheaf is a point, so `Ind PUnit`
  is equivalent to `PUnit`.
- `A = FinSet`: `Ind FinSet ≌ Type w`, every set the filtered colimit of its finite subsets.
- `A` the discrete category on two objects: `Ind A ≌ A`, finitely accessible and not cocomplete,
  so finitely accessible does not imply locally finitely presentable.

### Examples

- For a small site `(C, J)`, `Sheaf J (Type w)` is a reflective subcategory of presheaves whose
  inclusion preserves `κ`-filtered colimits once `κ` exceeds the cardinalities of all covering
  sieves, so it is locally presentable by 1.2; this is the form in which GrothendieckTopoi's topoi
  (§1.4) are locally presentable.
- Modules over a ring, groups and commutative rings are categories of algebras of Layer 4, hence
  locally finitely presentable by 4.1.

### Dependencies

Mathlib: `CategoryTheory.Presentable` (`Basic`, `LocallyPresentable`, `StrongGenerator`,
`Adjunction`, `Dense`, `SolutionSetCondition`, `Uniformization`, `Presheaf`, `Type`),
`CategoryTheory.Limits.Indization`, the adjoint functor theorems.

## Layer 2: orthogonality classes

### 2.1 Small-orthogonality classes in presheaf categories

Prove `isCardinalLocallyPresentable_iff_exists_isLocal`: `C` is locally `κ`-presentable iff there
are a small category `A`, a small class `W` of maps of `Aᵒᵖ ⥤ Type w` whose sources and targets are
`κ`-presentable, and an equivalence `C ≌ W.isLocal.FullSubcategory` (Adámek–Rosický, Theorem 1.46;
Kelly, §6.2, Theorem 6.5, p. 117, and §6.3, Theorem 6.11, p. 119). Backward: Mathlib's
`MorphismProperty.isLocallyPresentable_isLocal` (the reflection theorem: a small-orthogonality class
for maps between `κ`-presentable objects in a locally `κ`-presentable category is reflective and
locally `κ`-presentable) and `Equivalence.isCardinalLocallyPresentable`. Forward: 3.2 writes `C` as
`Mod_κ T`, and 3.1 writes `Mod_κ T` as such a class in `T ⥤ Type w = (Tᵒᵖ)ᵒᵖ ⥤ Type w`, with
`A = Tᵒᵖ`. *Needs:* 3.1, 3.2; Mathlib `MorphismProperty.isLocal`,
`MorphismProperty.isLocallyPresentable_isLocal`, `MorphismProperty.IsSmall`,
`Equivalence.isCardinalLocallyPresentable`.

**Checks.**

- `W` empty: every presheaf is local, and the class is the whole presheaf category.
- `A = PUnit` and `W = {∅ ⟶ 1}` in `Type w`: a set `Z` is local iff `Z^1 → Z^∅`, i.e. `Z → 1`, is
  bijective, so the class is the one-point sets, equivalent to `PUnit`.
- `A = PUnit` and `W = {1 ⊔ 1 ⟶ 1}` (the codiagonal): `Z` is local iff the diagonal `Z → Z × Z`
  is bijective, i.e. `Z` is a subsingleton: the locally finitely presentable category of 1.2,
  second Check.

### Examples

- For the codiagonal of 2.1, third Check, the reflection onto the local sets sends `∅` to `∅` and
  a nonempty set to a point.

### Dependencies

Mathlib: `CategoryTheory.Presentable.OrthogonalReflection`, `CategoryTheory.ObjectProperty.Local`.
This roadmap: 3.1, 3.2.

## Layer 3: Gabriel–Ulmer duality

### 3.1 Theories with `κ`-small limits and their models

Define the property `cardinalContinuous T κ` of functors `T ⥤ Type w` satisfying
`PreservesCardinalSmallLimits` (0.1), and `Models T κ`, the full subcategory, written `Mod_κ T`.
Prove `exists_isLocal_eq_cardinalContinuous`: for small `T` there is a small class `W` of maps of
`T ⥤ Type w` between `κ`-presentable functors with `W.isLocal = cardinalContinuous T κ`; and
`isCardinalLocallyPresentable_models`: `Mod_κ T` is locally `κ`-presentable (for any small `T`:
Kelly, §6.3, Theorem 6.11, p. 119, the models of a sketch form a reflective orthogonality class, and
the closing paragraph of §6.4 at `κ = ℵ₀`; for `T` with `κ`-small limits: Lack–Rosický, Theorem 5.4,
for `V = Set` and `Φ` the `κ`-small limits). Route: for each `κ`-small `J` (up to equivalence, a
small set of skeleta), each diagram `d : J ⥤ T` and a chosen limit cone with apex `t`, the map
`colim_j T(d j, −) ⟶ T(t, −)` has `κ`-presentable source (a `κ`-small colimit of corepresentables)
and target; by Yoneda a functor is local for it exactly when it preserves that limit. Then Mathlib's
`isLocallyPresentable_isLocal` applies. `T` need not have any limits. *Needs:* 0.1; Mathlib
`HasCardinalLT`, `MorphismProperty.isLocal`, `MorphismProperty.isLocallyPresentable_isLocal`,
`coyoneda`, the presheaf instance.

**Checks.**

- `T = PUnit` (which has every limit; its object is terminal): a model sends the empty limit to a
  terminal set, so `Mod_κ PUnit` has one object up to isomorphism, the one-point functor. A
  definition by all functors `PUnit ⥤ Type w` would give `Type w`.
- `T = FinSetᵒᵖ` and `κ = ℵ₀`: a model sends finite coproducts of `FinSet` to products, so
  `M(n) ≅ M(1)ⁿ`, and `M ↦ M(1)` is an equivalence `Mod_ℵ₀ (FinSetᵒᵖ) ≌ Type w`.
- `T = Discrete (Fin 2)` (two objects `a`, `b`, no other arrows) and `κ = ℵ₀`: the only `κ`-small
  limits that exist are those of diagrams in one object, among them the product `a × a = a` with
  both projections the identity; a model sends `a` to a set whose diagonal is bijective, so
  `Mod_ℵ₀ T` is pairs of subsingletons: preservation is required of the limits that exist, not
  only of those over nonempty connected diagrams.

### 3.2 Every locally presentable category is a category of models

Prove `isCardinalLocallyPresentable_iff_exists_models`: `C` is locally `κ`-presentable iff
`C ≌ Mod_κ T` for a small `T` with `κ`-small limits (Gabriel–Ulmer 1971; Adámek–Rosický,
Theorem 1.46; Lack–Rosický, Theorem 5.4 and Proposition 5.3). Forward: `T` is the opposite of a
small model of the `κ`-presentable objects, which are closed under `κ`-small colimits (Mathlib
`isClosedUnderColimitsOfShape_isCardinalPresentable`), and `C ⟶ Mod_κ T`, `X ↦ C(−, X)`, is
fully faithful by density and essentially surjective because every model is a `κ`-filtered colimit
of corepresentables. Backward: 3.1 and `Equivalence.isCardinalLocallyPresentable`. *Needs:* 3.1;
Mathlib density of `(isCardinalPresentable C κ).ι`,
`isClosedUnderColimitsOfShape_isCardinalPresentable`, `Equivalence.isCardinalLocallyPresentable`.

**Checks.**

- `C = Type w`, `κ = ℵ₀`: `T = FinSetᵒᵖ` (3.1, second Check).
- `C = PUnit`: `T = PUnit` (3.1, first Check).
- `C = Type wᵒᵖ`: no `T` exists, since `Type wᵒᵖ` is not locally presentable (1.1, second Check).

### 3.3 Recovering the theory

For `T` with `κ`-small limits, prove `nonempty_isCardinalPresentable_models_equivalence`: the
`κ`-presentable objects of `Mod_κ T` form a category equivalent to `Tᵒᵖ`, through `t ↦ T(t, −)`.
Route: the corepresentables preserve every limit and are `κ`-presentable (evaluation at `t`
preserves colimits, and `Mod_κ T` is closed in `T ⥤ Type w` under `κ`-filtered colimits since they
commute with `κ`-small limits in `Type w`); they form a strong generator; a `κ`-small colimit of
corepresentables in `Mod_κ T` is the corepresentable of the limit in `T`; so by Mathlib's
`IsStrongGenerator.colimitsCardinalClosure_eq_isCardinalPresentable` the `κ`-presentable models are
retracts of corepresentables, and these are corepresentable because idempotents split in `T`
(equalizers are `κ`-small limits). This is the representability of the presentable objects in the
proof of Lack–Rosický, Lemma 4.19, for `D` the `κ`-small categories. *Needs:* 3.1; Mathlib
`isCardinalPresentable`, `IsStrongGenerator.colimitsCardinalClosure_eq_isCardinalPresentable`,
`coyoneda`.

**Checks.**

- `T = PUnit`: one `κ`-presentable model, and `PUnitᵒᵖ` has one object.
- `T = FinSetᵒᵖ`, `κ = ℵ₀`: the finitely presentable sets are the finite ones, forming a category
  equivalent to `FinSet = (FinSetᵒᵖ)ᵒᵖ`.
- The hypothesis on `T` is needed: for `T` the walking idempotent (one object `∗`, an arrow `e`
  with `e ∘ e = e`), which has no equalizer of `𝟙` and `e`, the one-point functor is a model (it
  preserves every limit that exists, all of them over nonempty diagrams) and a retract of the
  two-element corepresentable `T(∗, −)`, hence `κ`-presentable; it is not corepresentable, so the
  presentable models have two isomorphism classes while `Tᵒᵖ` has one object.

### 3.4 Morphisms of theories

Define `restrict G hG : Mod_κ T' ⥤ Mod_κ T` for `G : T ⥤ T'` preserving `κ`-small limits, by
`M ↦ G ⋙ M`, with the proof that `G ⋙ M` preserves `κ`-small limits. Prove
`restrict_isRightAdjoint`: `restrict G hG` is a right adjoint and `κ`-accessible (the left adjoint
is left Kan extension along `G` followed by the reflection of 3.1, Kelly, §6.3, Theorem 6.11; for
`T` and `T'` with `κ`-small limits, Lack–Rosický, §5.2, where the Kan extension is already a
model; preservation of `κ`-filtered colimits is pointwise); and `exists_iso_restrict`: when
`T` and `T'` have `κ`-small limits, every `κ`-accessible right adjoint
`U : Mod_κ T' ⥤ Mod_κ T` is isomorphic to `restrict G hG` for some `G` preserving `κ`-small limits
(Gabriel–Ulmer 1971). Route: the left adjoint `L` of `U` preserves `κ`-presentable objects (Mathlib
`Adjunction.isCardinalPresentable_leftAdjoint_obj`), hence by 3.3 restricts to a functor
`Tᵒᵖ ⥤ T'ᵒᵖ` preserving `κ`-small colimits, the opposite of `G`; then
`U(M)(t) ≅ Hom(T(t, −), U M) ≅ Hom(L T(t, −), M) ≅ M(G t)`. Natural transformations
`G ⟶ G'` give transformations `restrict G' ⟶ restrict G`, bijectively, by Yoneda. *Needs:* 1.4,
3.1, 3.3; Mathlib `Adjunction.isCardinalPresentable_leftAdjoint_obj`, `Functor.whiskeringLeft`,
`ObjectProperty.lift`, `comp_preservesLimitsOfShape`.

**Checks.**

- `G = 𝟭 T`: `restrict` is the identity of `Mod_κ T`.
- `G : T ⥤ PUnit` (which preserves every limit): `restrict` sends the unique model of `PUnit` to
  the terminal model of `T`, and its left adjoint sends every model to it.
- `T = FinSetᵒᵖ`, `κ = ℵ₀`, and `G : FinSetᵒᵖ ⥤ T'` sending `n` to the `n`-th power of an object
  `x` of `T'`: under `Mod_ℵ₀ (FinSetᵒᵖ) ≌ Type w`, `restrict G` is evaluation at `x`; for `T'` the
  opposite of the finitely presentable groups and `x = ℤ`, it is the forgetful functor from groups.

### 3.5 Essentially algebraic theories

Following Adámek–Rosický, Definition 3.34, an essentially algebraic theory is a many-sorted
signature with a set of total operation symbols and a set of partial ones, equations, and for each
partial operation a set of equations in total operations defining its domain; its models are the
many-sorted algebras whose partial operations are defined exactly on those domains. Prove that the
categories of models of `κ`-ary essentially algebraic theories are the categories `Mod_κ T` of
3.1, so that by 3.2 they are exactly the locally `κ`-presentable categories (Adámek–Rosický,
Theorem 3.36). Kelly calls a small category with finite limits a finitary essentially-algebraic
theory (Kelly, §6.3, p. 120); this target identifies the two notions. *Needs:* 3.1, 3.2.

**Checks.**

- Categories (small): sorts `O`, `M`; total `dom`, `cod : M → O`, `id : O → M`; partial
  composition defined on `{(f, g) | dom f = cod g}`; its models are the small categories.
- An essentially algebraic theory with no partial operation is an equational (many-sorted) theory:
  its models are the algebras of a finite-product theory of Layer 4.
- One sort, one partial binary operation `m` with domain `{(x, y) | x = y}`, no other equation: a
  model is a set with the unary operation `x ↦ m(x, x)`, and the category of models is that of
  sets with an endomap, the presheaves on the monoid `ℕ`; the domain equations change the category
  (with `m` total it would be the sets with a binary operation).

### Examples

- `Mod_ℵ₀ T` for `T` the opposite of finitely presented commutative rings is the category of
  commutative rings.
- `Mod_ℵ₀ (FinSetᵒᵖ) ≌ Type w` (3.1, second Check).

### Dependencies

Mathlib: `CategoryTheory.Presentable`, `CategoryTheory.ObjectProperty`, `HasCardinalLT`,
`CategoryTheory.Limits.Preserves`. This roadmap: 1.4 (for 3.4).

## Layer 4: algebraic theories

### 4.1 Algebras of finite-product theories

Define `productPreserving T`, the property of functors `T ⥤ Type w` preserving finite products
(Mathlib `PreservesFiniteProducts`), and `Algebras T`, its full subcategory. Prove
`isLocallyFinitelyPresentable_algebras`: for small `T`, `Algebras T` is locally finitely
presentable. Route: as in 3.1, with the finite discrete cones only. *Needs:* 3.1; Mathlib
`PreservesFiniteProducts`, `IsLocallyFinitelyPresentable`,
`MorphismProperty.isLocallyPresentable_isLocal`.

**Checks.**

- `T = PUnit`: `Algebras PUnit` has one object up to isomorphism (the empty product is preserved).
- `T = FinSetᵒᵖ`: `Algebras T ≌ Type w`, `M ↦ M(1)`; here algebras and the models of 3.1 agree.
- `T = Discrete (Fin 2)`: the only finite products are the powers `a × ⋯ × a = a` and
  `b × ⋯ × b = b` (nonempty), and the empty product does not exist; an algebra is a pair of
  subsingletons, as in 3.1, third Check.

### 4.2 Sifted colimits of algebras

Prove `preservesColimitsOfShape_algebras_ι`: for small sifted `J`, the inclusion
`Algebras T ⥤ (T ⥤ Type w)` preserves colimits of shape `J`. Route: sifted colimits commute with
finite products in `Type w` (Mathlib `IsSifted.colim_preservesFiniteProducts_of_isSifted`;
Lack–Rosický, §3, where this is the definition of sifted), so the pointwise colimit of algebras is
an algebra. *Needs:* 4.1; Mathlib `IsSifted`, `IsSifted.colim_preservesFiniteProducts_of_isSifted`.

**Checks.**

- Filtered categories are sifted: filtered colimits of algebras are pointwise.
- Reflexive coequalizers are sifted: the quotient of a group by a congruence is computed on
  underlying sets.
- Binary coproducts are not computed pointwise: for `T = FinSetᵒᵖ`, the pointwise coproduct
  `X⁽⁻⁾ ⊔ Y⁽⁻⁾` has `X² ⊔ Y²` at `2`, not `(X ⊔ Y)²`; the shape `Discrete (Fin 2)` is not sifted
  (not connected).

### 4.3 The recognition theorem

Define `IsStronglyFinitelyPresentable X` (its corepresentable preserves sifted colimits of small
shape). Prove `exists_equivalence_algebras_iff`: for `K` with `w`-small hom-sets, `K ≌ Algebras T`
for a small `T` with finite products iff `K` is cocomplete and has a small family `P` of strongly
finitely presentable objects such that every object is a sifted colimit of objects of `P`
(Lack–Rosický, Theorem 3.1, (ii) ⇔ (iii); Adámek–Rosický 2001, Theorem 3.10). The categories of
algebras of small categories with finite products are the many-sorted varieties. *Needs:* 4.1,
4.2; Mathlib `IsSifted`, `ObjectProperty.colimitsOfShape`, `ObjectProperty.Small`.

**Checks.**

- `K = Type w`: the finite sets are strongly finitely presentable and every set is a filtered,
  hence sifted, colimit of finite sets; `T = FinSetᵒᵖ`.
- `K` empty: `Algebras T` always contains the terminal functor, and an empty `K` has no initial
  object: both sides are false.
- `K = Type w × Type w` (two-sorted sets): `T = FinSetᵒᵖ × FinSetᵒᵖ`, since `(s, t)` is the product
  of `(s, 1)` and `(1, t)` and an algebra is determined by its two restrictions.

### Examples

- Groups, abelian groups, rings and `R`-modules: `Algebras T` for `T` the opposite of the finitely
  generated free objects, a category with finite products.

### Dependencies

Mathlib: `CategoryTheory.Limits.Sifted`, `CategoryTheory.Limits.Preserves.Finite`. This roadmap:
3.1.

## Layer 5: categories with `D`-limits

### 5.1 Models of a theory with `D`-limits

Define `HasDLimits D X`, `PreservesDLimits D F` and `dContinuous D X Y`, the property of
`D`-functors `X ⥤ Y`, for a small family `D` (Conventions). The categories with `D`-limits, the
`D`-functors and all natural transformations form a 2-category; the theory of `R` in a category `C`
with `D`-limits is the category of `D`-functors `R ⥤ C`. Prove `isRightAdjoint_ι_dModels`: for small
`R`, the inclusion of the `D`-functors `R ⥤ Type w` into `R ⥤ Type w` is a right adjoint, and their
category is locally presentable (Kelly, §6.3, Theorem 6.11, p. 119; for `R` with `D`-limits,
Lack–Rosický, Theorem 5.2). Route: as in 3.1, with the cones of shapes `D a`; the class `W` is small
because `α` is. *Needs:* 3.1; Mathlib `MorphismProperty.isRightAdjoint_ι_isLocal`,
`MorphismProperty.isLocallyPresentable_isLocal`.

**Checks.**

- `α` empty: every functor is a `D`-functor, and the statement is the local presentability of
  `R ⥤ Type w`.
- `α = Unit`, `D () = Discrete PEmpty`: the `D`-functors preserve terminal objects; for `R = PUnit`
  the category has one object.
- `α = ℕ`, `D n = Discrete (Fin n)`: `dContinuous D R (Type w) = productPreserving R` of 4.1
  (Conventions, witness), so 5.1 contains 4.1 up to the finitary index.

### 5.2 The `D`-envelope

Define `envelopeProp D I`, the closure under `D`-limits (`ObjectProperty.limitsClosure`) of the
corepresentables `I(i, −)` in `(I ⥤ Type w)ᵒᵖ`; `Envelope D I`, written `Ĩ`; `Envelope.of D I :
I ⥤ Ĩ`; and `Envelope.restriction D I C`, restriction along it from the `D`-functors `Ĩ ⥤ C` to
`I ⥤ C`. Prove `envelope_universal`: `Ĩ` is essentially small, has `D`-limits, and for every `C`
with `D`-limits and `w`-small hom-sets the restriction is an equivalence. Essential smallness is
Mathlib's `ObjectProperty.isEssentiallySmall_limitsClosure` applied once: the corepresentables of
the small `I` are essentially small in the locally `w`-small `(I ⥤ Type w)ᵒᵖ`, `α` and the `D a`
are small, and a regular `κ` exceeds the sizes of all `D a`. The universal property is Kelly, §5.7,
Theorem 5.35, p. 99, applied to `Iᵒᵖ` and dualised: the free completion of `A` under a small set of
colimits is the closure of `A` in `[Aᵒᵖ, V]`, and left Kan extension gives `[A, B] ≃ F-Cocts[Ā, B]`
for `F`-cocomplete `B`. *Needs:* 5.1 (the predicates); Mathlib `ObjectProperty.limitsClosure`,
`ObjectProperty.le_limitsClosure`, `ObjectProperty.isEssentiallySmall_limitsClosure`,
`ObjectProperty.ofObj`, `coyoneda`, `Functor.IsEquivalence`, `EssentiallySmall`.

**Checks.**

- `α` empty: the closure is the isomorphism closure of the corepresentables, and Yoneda gives
  `Ĩ ≌ I`.
- `I` empty and `D` the empty shape alone: `Ĩ` is the terminal object of `(I ⥤ Type w)ᵒᵖ`, so
  `Ĩ ≌ PUnit`, and the terminal-preserving functors `PUnit ⥤ C` are the terminal objects of `C`,
  equivalent to `I ⥤ C ≌ PUnit`.
- `I = PUnit` and `D n = Discrete (Fin n)`: the corepresentable is the point of `Type w`, its
  closure under finite coproducts in `Type w` is the finite sets, and `Ĩ ≌ FinSetᵒᵖ`, the free
  category with finite products on one object, whose finite-product functors to `C` are the objects
  of `C`.

### 5.3 Localisation

Define `dContinuousInverting D S C`, the `D`-functors `R ⥤ C` inverting every arrow of `S`, and
`restrictInverting D q hq hS C`, restriction along a `D`-functor `q : R ⥤ R'` that inverts `S`.
Prove `exists_localization`: for small `R` and any `S`, there are a small `R[S⁻¹]` with `D`-limits
and such a `q` that restriction along `q` is an equivalence, for every `C` with `D`-limits and
`w`-small hom-sets, from the `D`-functors `R[S⁻¹] ⥤ C` to the `D`-functors `R ⥤ C` inverting `S`
(Kelly, §6.4, Proposition 6.21, Corollary 6.22 and Theorem 6.23, pp. 122–123, dualised, for the
sketch made of the `D`-limit cones of `R` and, for each `f : a ⟶ b` in `S`, the cone with vertex `a`
and leg `f` over the one-object diagram `b`, which is a limit cone exactly where `f` is inverted).
`R` need not have `D`-limits; when it has them and `S` is empty, `q` can be taken to be an
equivalence (Kelly, Proposition 6.13). Equalizing a pair of arrows and adjoining an arrow are
localisations of the same kind: invert the equalizer inclusion, and localise a free extension.
*Needs:* 5.1, 5.2; Mathlib `MorphismProperty.IsInvertedBy`, `Functor.IsEquivalence`,
`comp_preservesLimitsOfShape`.

**Checks.**

- `R = WalkingArrow` (`0 ⟶ 1`), `α` empty, `S` the arrow: `R[S⁻¹]` is the walking isomorphism,
  equivalent to `PUnit`, and the functors from `R` inverting the arrow are the isomorphisms of `C`,
  equivalent to `C`.
- `S` empty and `R` with `D`-limits: `R[S⁻¹] ≌ R`, and the restriction is the identity.
- Equalizing: if `WalkingParallelPair` is among the `D a` and `e : E ⟶ a` is an equalizer of
  `f, g : a ⟶ b` in `R`, a `D`-functor `F` inverts `e` iff `F f = F g` (if `F e` is invertible,
  `F f ∘ F e = F g ∘ F e` gives `F f = F g`; conversely `F e` is an equalizer of the equal pair
  `F f = F g`, hence invertible).

### 5.4 Sound doctrines

For a small family `D`, a small category `C` is `D`-filtered when colimits of shape `C` commute in
`Type w` with limits of every shape `D a`; then for each `a` and each `S : (D a)ᵒᵖ ⥤ C` the
category of cocones of `S` is connected, and `D` is sound when, conversely, this connectedness for
every `a` and every `S : (D a)ᵒᵖ ⥤ C` implies that `C` is `D`-filtered (Adámek–Borceux–Lack–Rosický
2002, as recalled in Lack–Rosický, §4.4). A category is locally `D`-presentable when it is
equivalent to the `D`-functors `A ⥤ Type w` for a small `A` with `D`-limits. Prove, for sound `D`:
for small `A` and `F : A ⥤ Type w`, the left Kan extension of `F` along Yoneda preserves
`D`-limits iff `F` is a `D`-filtered colimit of corepresentables, and, when `A` has `D`-limits,
iff `F` is a `D`-functor (Lack–Rosický, Theorem 4.18, quoting Adámek–Borceux–Lack–Rosický 2002,
Theorem 2.4); and a locally `D`-presentable category is locally `κ`-presentable for every regular
`κ` exceeding the numbers of morphisms of the `D a` (ibid., Theorem 5.5, as used in the proof of
Lack–Rosický, Proposition 4.20). *Needs:* 3.1, 5.1; Mathlib `IsSifted`, `IsFiltered`.

**Checks.**

- `D` the finite categories: `D`-filtered means filtered, and locally `D`-presentable means locally
  finitely presentable (3.2 at `ℵ₀`).
- `D` the finite discrete categories: `D`-filtered means sifted (Lack–Rosický, §3, definition of
  sifted), and the locally `D`-presentable categories are those of 4.3.
- `D` empty: every small category is `D`-filtered and `D` is sound; the locally `D`-presentable
  categories are the presheaf categories `A ⥤ Type w`.
- The variance is forced: for `S : E ⥤ C` put `F(e, c) = C(S e, c)`, a functor `Eᵒᵖ × C ⥤ Type w`.
  The colimit over `C` of each `F(e, −)` is a point, so the limit over `Eᵒᵖ` of these colimits is a
  point, while the colimit over `C` of the limits over `Eᵒᵖ` is the set of connected components of
  the category of cocones of `S`. Commutation with limits of shape `D a` therefore gives connected
  cocone categories for diagrams of shape `(D a)ᵒᵖ`. For `D` the single shape `WalkingCospan`
  (pullbacks), the condition is on spans `(WalkingCospan)ᵒᵖ ≌ WalkingSpan`, not on cospans; the
  three families above are closed under opposites and do not separate the two readings.

### Examples

- `Mod_κ T` of Layer 3 is the case of 5.1 where `D` is a set of representatives of the `κ`-small
  shapes; 5.1 gives local presentability at some cardinal, 3.1 at `κ` itself.

### Dependencies

Mathlib: `CategoryTheory.ObjectProperty.LimitsClosure`, `CategoryTheory.MorphismProperty`,
`CategoryTheory.Limits.Sifted`. This roadmap: 3.1.

## Downstream consumers

No roadmap cites this one. HigherToposTheory (Layer F1) consumes Mathlib's
`CategoryTheory.Presentable` directly; its statements about locally presentable categories use the
carriers named here.

## Research context

Gabriel–Ulmer duality is a biequivalence between the 2-category of small categories with
`κ`-small limits, `κ`-continuous functors and natural transformations, and the opposite of the
2-category of locally `κ`-presentable categories, right adjoints preserving `κ`-filtered colimits
and natural transformations; 3.2–3.4 are its statements on objects, on recovery and on 1- and
2-cells. It has enriched forms over a locally finitely presentable symmetric monoidal closed base
(Kelly 1982) and over more general bases with more general classes of limits (Lack–Power 2009;
Lack–Rosický 2011, Theorem 5.4), and its doctrinal form is the theory of sound doctrines of 5.4.
Grothendieck's lectures at Buffalo in 1973 worked in the 2-category of categories with `D`-limits
of Layer 5, where the envelope and localisation of 5.2 and 5.3 are constructions on theories.

## References

- J. Adámek, J. Rosický, *Locally presentable and accessible categories*, London Math. Soc.
  Lecture Note Ser. 189, Cambridge University Press, 1994. doi:10.1017/CBO9780511600579.
- P. Gabriel, F. Ulmer, *Lokal präsentierbare Kategorien*, Lecture Notes in Math. 221, Springer,
  1971. doi:10.1007/BFb0059396.
- G. M. Kelly, *Basic concepts of enriched category theory*, London Math. Soc. Lecture Note Ser. 64,
  Cambridge University Press, 1982; reprinted in Repr. Theory Appl. Categ. 10 (2005), vi+137 pp.,
  http://www.tac.mta.ca/tac/reprints/articles/10/tr10abs.html (page numbers of the reprint).
- S. Lack, J. Rosický, « Notions of Lawvere theory », *Appl. Categ. Structures* 19 (2011), no. 1,
  363–391. doi:10.1007/s10485-009-9215-2; arXiv:0810.2578 (numbering of arXiv version 2).
- J. Adámek, J. Rosický, « On sifted colimits and generalized varieties », *Theory Appl. Categ.* 8
  (2001), no. 3, 33–53. http://www.tac.mta.ca/tac/volumes/8/n3/8-03abs.html.
- J. Adámek, F. Borceux, S. Lack, J. Rosický, « A classification of accessible categories »,
  *J. Pure Appl. Algebra* 175 (2002), no. 1–3, 7–30. doi:10.1016/S0022-4049(02)00126-3.
- G. M. Kelly, « Structures defined by finite limits in the enriched context. I »,
  *Cahiers Topologie Géom. Différentielle* 23 (1982), no. 1, 3–42. Numdam: CTGDC_1982__23_1_3_0.
- S. Lack, J. Power, « Gabriel–Ulmer duality and Lawvere theories enriched over a general base »,
  *J. Funct. Programming* 19 (2009), no. 3–4, 265–286. doi:10.1017/S0956796809007254.
