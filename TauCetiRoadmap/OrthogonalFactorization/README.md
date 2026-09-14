# Roadmap: unique lifting, orthogonal factorization systems, and their cellular presentations

## Overview

Mathlib has the *weak* half of lifting theory in full: `HasLiftingProperty` for a single pair of
morphisms, the classes `MorphismProperty.llp` and `MorphismProperty.rlp`, weak factorization
systems (`MorphismProperty.IsWeakFactorizationSystem`), and the small object argument
(`HasSmallObjectArgument`, `llp_rlp_of_hasSmallObjectArgument`) with the presentability API
(`IsCardinalPresentable`) that feeds it. This is the machinery of model categories, where a lift
exists but is not unique.

It has **nothing** for the *unique* half. There is no predicate saying that a commutative square
has exactly one filler, no orthogonal complement of a morphism property, and no orthogonal
factorization system — the (epi, mono), (surjective, injective), (localization, local object) style
of factorization, where the intermediate object is determined up to a *unique* isomorphism and the
factorization is therefore a reflection rather than a choice. Mathlib's
`CategoryTheory.ObjectProperty.Orthogonal` is a different notion (orthogonality of two classes of
*objects* under `Hom`) and does not meet this area.

This roadmap builds that unique half, from the single-square predicate up to the two theorems that
make it pay:

- **The orthogonal Galois connection.** `leftOrthogonal` and `rightOrthogonal` are antitone adjoint
  operators on morphism properties, an orthogonal pair meets in the isomorphisms, and every
  factorization for such a pair is unique up to a unique isomorphism. That last statement upgrades a
  factorization system to a **reflection**: for an orthogonal pair admitting factorizations, the
  `R`-arrows are a reflective subcategory of `Arrow C` and the `L`-arrows a coreflective one, so the
  right class is closed under limits of arrows for formal reasons.
- **The cellular description with no retracts.** Mathlib's small object argument describes the left
  class of the generated *weak* system as `J.rlp.llp = (cellular J).retracts`, and the outer
  `retracts` is not removable — cofibrations are retracts of relative cell complexes, not relative
  cell complexes. In the orthogonal setting it **is** removable: the left class of the generated
  orthogonal system is the cellular class on the nose. The single input that makes the difference is
  left cancellation for the left class, which holds for unique lifting and fails for weak lifting.
  When the generators are epimorphisms the codiagonal augmentation disappears as well, and the left
  class is exactly the transfinite compositions of pushouts of coproducts of the generators
  themselves.

The bridge between the two halves is the **codiagonal criterion**: for `i : A ⟶ B` and `p : X ⟶ Y`,
lifts of squares from `i` to `p` are unique exactly when `pushout.codiagonal i` has the ordinary
left lifting property against `p`, and dually via `pullback.diagonal p`. So unique lifting against a
class `I` is ordinary lifting against the augmented class `I ⊔ codiagonalGenerators I`, and the
whole of Mathlib's small object machinery becomes available to the orthogonal theory without being
re-proved.

The area is stated for an arbitrary category throughout. Nothing in it is about rings, spaces or
sheaves; the applications that motivate it consume this roadmap from a separate area and are named
nowhere in its statements.

## What Mathlib already has (consume)

- **Single-square lifting.** `CommSq`, `CommSq.LiftStruct`, `CommSq.HasLift`, `HasLiftingProperty`
  with its composition, cancellation, arrow-isomorphism and retract API
  (`Mathlib.CategoryTheory.LiftingProperties.Basic`), and its behaviour under pushout/pullback
  squares and (co)products (`Mathlib.CategoryTheory.LiftingProperties.Limits`).
- **Classes of morphisms.** `MorphismProperty`, `llp`, `rlp`, `ofHoms`, `toSet`, `homFamily`,
  `IsSmall`; the closure operators `pushouts`, `coproducts`, `transfiniteCompositions`, `retracts`
  with their `_le_iff` peeling lemmas; the stability type classes `IsMultiplicative`, `RespectsIso`,
  `IsStableUnderRetracts`, `IsStableUnderCobaseChange`, `IsStableUnderBaseChange`,
  `IsStableUnderColimitsOfShape`, `IsStableUnderLimitsOfShape`, `IsStableUnderCoproducts`,
  `IsStableUnderTransfiniteComposition`; and the cancellation predicates `HasOfPostcompProperty`,
  `HasOfPrecompProperty`.
- **Weak factorization systems.** `MapFactorizationData`, `HasFactorization`,
  `HasFunctorialFactorization`, `IsWeakFactorizationSystem`.
- **The small object argument.** `HasSmallObjectArgument`, `IsCardinalForSmallObjectArgument`,
  `llp_rlp_of_hasSmallObjectArgument`, `HasIterationOfShape`, and the transfinite-composition
  lifting lemma `HasLiftingProperty.transfiniteComposition.hasLiftingProperty_ι_app_bot`.
- **Presentability.** `IsCardinalPresentable`, `isCardinalPresentable_of_isColimit`,
  `IsCardinalPresentable.exists_hom_of_isColimit`, `IsCardinalPresentable.exists_eq_of_isColimit'`,
  `IsCardinalFiltered`, `LocallySmall`, `preservesColimitsOfShape_of_isCardinalPresentable`.
- **Shapes and subcategories.** `pushout.codiagonal` (with its `IsSplitEpi` instance and the
  `[Epi f] → IsIso (pushout.codiagonal f)` instance), `pullback.diagonal`, `Arrow`,
  `Arrow.leftFunc`, `Arrow.rightFunc`, `ObjectProperty` with `FullSubcategory`, `ι`, `ιOfLE`,
  `IsClosedUnderIsomorphisms`, `Reflective`, `Coreflective`, `Adjunction.mkOfHomEquiv`,
  `Limits.isColimitConstCocone`, `IsPushout.of_coprod_inl_with_id`, and
  `CoproductsFromFiniteFiltered.isColimitFiniteSubproductsCocone`.

## What is missing (build here)

Everything about *uniqueness* of lifts: the two single-square predicates and their whole API; the
codiagonal and diagonal criteria; the (co)limit and transfinite-composition stability of unique
lifting; the orthogonal complement operators and their Galois theory; orthogonal pairs and
orthogonal factorization systems; uniqueness of factorizations and the resulting arrow
(co)reflection; codiagonal generators and the small object argument for them; the cellular class and
its identification with the generated left class; stability of the right class under filtered
colimits of presentable generators; and the object-level shadow of a factorization system, the local
objects. Two closure lemmas about *arbitrary* morphism properties that the cellular arguments need
and Mathlib lacks are also built here (Milestone A).

## Scope boundary

**In scope.** Unique lifting and orthogonality as they concern an abstract category `C`: predicates
on a pair of morphisms, operators on `MorphismProperty C`, the factorization systems they form, the
subcategories of `Arrow C` and of `C` they cut out, and the description of a generated left class by
generators.

**Out of scope, and grounded elsewhere.** Every *instance* of the theory in a concrete category
belongs to the roadmap that owns that category and cites this one for its formal input. Weak
factorization systems, model structures and homotopy-theoretic consequences are Mathlib's and stay
there; the only statements this roadmap makes about them are the two comparison theorems of E1
(forgetting uniqueness, and adding it back). Localization of categories in the sense of
`CategoryTheory.Localization` is a different subject and is not touched: the reflection produced
here is the reflection onto the local objects of a class, built from a factorization, and no
calculus of fractions is involved.

The line is: a statement quantified over an arbitrary `C` and an arbitrary `MorphismProperty C` is
this area's; a statement that names a particular category, a particular class of ring or scheme
maps, or a particular generator family is not.

## Conventions, pinned up front

These are decisions, not recommendations. Material that diverges from them will not compose with the
rest of the area.

**Naming.** The unique-lifting analogues of `llp` and `rlp` are `leftOrthogonal` and
`rightOrthogonal`, spelled out, never abbreviated. The point of the classes is the Galois
connection, so `T.rightOrthogonal.leftOrthogonal` has to be readable. The single-square predicates
are `HasAtMostOneLiftingProperty` and `HasUniqueLiftingProperty`, matching Mathlib's
`HasLiftingProperty`.

**Uniqueness is separated from existence.** `HasAtMostOneLiftingProperty i p` is a class in its own
right, stated as `Subsingleton sq.LiftStruct` for every square `sq`, and `HasUniqueLiftingProperty
i p` extends `HasLiftingProperty i p` together with it. Every result about unique lifting that is
really about uniqueness is proved for the at-most-one class and only then packaged, so that the
existence half is *taken from Mathlib and never re-proved*. This is what keeps the area small:
Milestone C states two-thirds of its content for `HasAtMostOneLiftingProperty` and obtains the
`HasUniqueLiftingProperty` forms from `HasUniqueLiftingProperty.mk'`.

**Cancellation orientation.** With Mathlib's convention that `f ≫ g` is `g` after `f`:

| cancellation | rule | Mathlib predicate |
|---|---|---|
| right cancellation | `f ≫ g ∈ P`, `g ∈ P` ⟹ `f ∈ P` | `P.HasOfPostcompProperty P` |
| left cancellation | `f ≫ g ∈ P`, `f ∈ P` ⟹ `g ∈ P` | `P.HasOfPrecompProperty P` |

The two orthogonal classes satisfy **one each, and not both**: `rightOrthogonal` has the of-postcomp
property, `leftOrthogonal` has the of-precomp property. Neither has `HasTwoOutOfThreeProperty`, and
no target below is to be stated with it. Relative forms `B.HasOfPostcompProperty W'` for `W' ≤ B`
come from `HasOfPostcompProperty.of_le`, not from bespoke instances. [anel2009] uses the opposite
vocabulary — it calls the right class's of-postcomp rule *left* cancellation — and this area follows
Mathlib's composition API, not that paper's.

**Every closure property is stated twice, deliberately.** Once in bare form for `T.leftOrthogonal`
or `T.rightOrthogonal`, where the class is syntactically an orthogonal so instance search can fire,
and once as an instance for the two classes of an `IsOrthogonalPair A B`, where it cannot because
`A` and `B` are opaque. The duplication is the price of the type-class mechanism; neither form is
dropped.

**Forgetful passages are named theorems, never global instances.**
`IsOrthogonalFactorizationSystem → IsWeakFactorizationSystem`,
`IsOrthogonalFactorizationSystem → IsOrthogonalPair`, and `Reflective (R.arrows.ι)` are all
`lemma`/`def`, instantiated by the caller at the pair at hand. As instances they loop instance
search through the Galois identities.

**`cellular` takes a bare class.** `cellular J = transfiniteCompositions (coproducts J).pushouts`,
with `J` an arbitrary morphism property and the augmentation supplied by the caller as
`cellular (orthogonalGenerators I)`. Baking `orthogonalGenerators` into the definition is excluded,
because the central comparison of H4 — that for a family of epimorphisms the augmentation adds only
isomorphisms, so `cellular (orthogonalGenerators I) = cellular I` — could then not even be stated.
This also matches Mathlib, where `pushouts`, `coproducts`, `transfiniteCompositions` and `retracts`
are plain closure operators with nothing built in.

**Universes.** `cellular.{w}` carries the universe of the coproduct indices and of the
transfinite-composition shapes, exactly as Mathlib's `transfiniteCompositions.{w}` does, and is
tagged `@[pp_with_univ]`. Presentability statements carry the regular cardinal `κ : Cardinal.{w}`
explicitly, rather than existentially, wherever a later statement has to fix it.

**Duality.** Opposite-category statements are named `op`, `unop`, `iff_op`, `iff_unop` and are
proved once. Dualizing exchanges the roles of `i` and `p` and reverses the two objects at each end,
so the reordering is recorded in the statement rather than left to the reader.

## Milestone A — Two closure lemmas for arbitrary morphism properties

Ambient infrastructure, independent of lifting, consumed by the peeling arguments of Milestones D
and H. Mathlib has both halves of each input but neither conclusion.

### A1 — Coproduct stability from cobase change

A class of maps closed under pushout is automatically closed under finite disjoint unions of maps,
because a coproduct of maps is assembled from pushouts along the coprojections. If the class is
closed under filtered colimits as well, arbitrary disjoint unions follow, since an infinite
coproduct is the filtered union of its finite subcoproducts. The point is that one verifies a
closure property on pushouts and gets to use it against coproducts.

- `MorphismProperty.sigmaMap_mem`: the `Sigma.map` form of `IsStableUnderCoproductsOfShape`, so the
  type class applies to a coproduct of a family of maps without unfolding a colimit.
- `isStableUnderCoproductsOfShape_of_finite`: a class that is `IsMultiplicative`, `RespectsIso` and
  `IsStableUnderCobaseChange` is stable under coproducts indexed by a finite type. By
  `Finite.induction_empty_option`: the empty case is a map between initial objects, hence an
  isomorphism, and the `Option` step factors `Sigma.map f` as
  `coprod.map (f none) (𝟙 _) ≫ coprod.map (𝟙 _) (Sigma.map (f ∘ some))`, two cobase changes via
  `IsPushout.of_coprod_inl_with_id` and its `inr` companion.
- `isStableUnderCoproductsOfShape_of_colimitsOfShape_finset`: adding stability under colimits of
  shape `Finset (Discrete α)` upgrades the previous item to coproducts indexed by an arbitrary `α`,
  through `CoproductsFromFiniteFiltered.liftToFinset`, which presents a coproduct of maps as a
  natural transformation of the finite-subcoproduct diagrams.
- *Acceptance:* `isomorphisms C` instantiates the finite form; a class stable under cobase change
  and under filtered colimits instantiates the infinite form with no further input.

### A2 — Left orthogonals of colimits under a fixed source

If an object `X` maps compatibly into every object of a connected diagram and each of those maps is
left orthogonal to `T`, then so is the map from `X` into the colimit. Connectedness is what stops
the empty diagram from turning the claim into the false assertion that `X` maps left-orthogonally to
the initial object. This is the form in which the left class's colimit stability gets used in
practice: a colimit of objects *under* a fixed base.

Stated here because it is the shape in which D2's closure is consumed, and because it is the one
colimit statement whose hypothesis is *connectedness* rather than filteredness.

- `leftOrthogonal_of_isColimit_forget_under`, `leftOrthogonal_of_isColimit_under`,
  `leftOrthogonal_colimit_under`: for `F : J ⥤ Under X` with `J` connected, if every structure map
  `X ⟶ (F.obj j).right` lies in `T.leftOrthogonal`, so does the structure map of a colimit of `F`.
  The proof is that a cocone under `X` is a morphism from the constant diagram at `X`, that
  `Limits.isColimitConstCocone` makes the constant cocone on it a colimit for connected `J`, and
  that D2's `leftOrthogonal_isStableUnderColimitsOfShape` then applies.
- Connectedness is a genuine hypothesis and the statement carries it: for `J` empty the claim would
  say that `X ⟶ ⊥` is left orthogonal to every `T`.
- *Acceptance:* the filtered case and the sequential case follow by supplying the `IsConnected`
  instance and nothing else.

*Depends on:* Mathlib, and D2 for A2.

## Milestone B — Unique lifting for a single pair of morphisms

### B1 — The two predicates and their API

The basic vocabulary. A commuting square may admit at most one diagonal filler, or exactly one.
Keeping "at most one" apart from "at least one" is what keeps the area small: existence is Mathlib's
and is never re-proved, and only uniqueness is developed here. The elementary facts then follow —
uniqueness is automatic when the left-hand map is an epimorphism, it is inherited by composites,
retracts and isomorphic squares, and it dualizes.

- `HasAtMostOneLiftingProperty i p`: a class whose single field says that for every
  `sq : CommSq f i p g` the type `sq.LiftStruct` is a `Subsingleton`; exported as an instance on
  `sq.LiftStruct` so `Subsingleton.elim` applies without unfolding the class.
- `HasUniqueLiftingProperty i p`: a class extending `HasLiftingProperty i p` and
  `HasAtMostOneLiftingProperty i p`, with `HasUniqueLiftingProperty.mk'` assembling it from the two
  halves.
- `CommSq.lift_eq_of_hasAtMostOneLiftingProperty`: two morphisms that both fill the same square are
  equal. This, and not the `Subsingleton` field, is the form every downstream proof uses; it takes
  the four factorization equations as explicit arguments.
- `CommSq.uniqueLiftStruct`: the lift structure as a term, under the unique lifting property.
- `hasUniqueLiftingProperty_iff`: the class unfolded as `∀ sq, ∃! l, …`, the form a mathematician
  recognizes.
- Instances and basic closure: `HasAtMostOneLiftingProperty.of_epi` — uniqueness against an
  epimorphism source is automatic, is used constantly downstream, and is an instance;
  `HasUniqueLiftingProperty.of_epi`; `HasUniqueLiftingProperty.of_left_iso`; stability under
  composition on the left (`of_comp_left`) and cancellation on the right (`of_comp_right_cancel`)
  for both classes; transport along an isomorphism of arrows (`of_arrow_iso_left` and its `iff`
  form); and stability under `RetractArrow`.
- Duality: `op`, `unop`, `iff_op`, `iff_unop` for both classes.
- *Acceptance:* `HasUniqueLiftingProperty i p` holds whenever `IsIso i`; a morphism with the
  ordinary lifting property against **itself** is an isomorphism
  (`isIso_of_hasLiftingProperty_self`, the identity square giving a two-sided inverse);
  `HasAtMostOneLiftingProperty i p` holds for `i` epi with no hypothesis on `p`.

### B2 — The codiagonal and diagonal criteria

Uniqueness of fillers is not a new kind of condition. Two fillers of a square from `i : A ⟶ B` to
`p` are the same data as one filler of a square from the codiagonal `B ⊔_A B ⟶ B` to `p`. So "`i` is
orthogonal to `p`" says exactly that `i` lifts against `p` *and* that the codiagonal of `i` lifts
against `p` — two ordinary lifting conditions — and dually through the diagonal `X ⟶ X ×_Y X`. This
translation is what puts the whole of the small object argument at the disposal of the orthogonal
theory.

The technical heart of the area, and the reason unique lifting is not a separate theory.

- `hasAtMostOneLiftingProperty_iff_codiagonal`: for `i : A ⟶ B` with `HasPushout i i`,
  `HasAtMostOneLiftingProperty i p ↔ HasLiftingProperty (pushout.codiagonal i) p`. Forward, two
  lifts of a square under the codiagonal are the two legs glued along the pushout; backward, the
  common lift of the glued square identifies them.
- `hasAtMostOneLiftingProperty_iff_diagonal`: dually, with `pullback.diagonal p` and
  `HasPullback p p`.
- `hasUniqueLiftingProperty_iff_lifting_and_codiagonal` and
  `hasUniqueLiftingProperty_iff_lifting_and_diagonal`: the unique lifting property is the
  conjunction of two *ordinary* lifting properties.
- *Acceptance:* for `i` an epimorphism `pushout.codiagonal i` is an isomorphism, so the criterion
  reproduces `HasAtMostOneLiftingProperty.of_epi`; for `p` a monomorphism `pullback.diagonal p` is
  an isomorphism, giving the dual statement.

*Depends on:* Mathlib only.

## Milestone C — Unique lifting and (co)limits

Throughout, existence of lifts is taken from Mathlib and only uniqueness is proved; the
`HasUniqueLiftingProperty` forms follow by `mk'`. The exception is C2, where the ordinary statement
is false and uniqueness is what repairs it.

### C1 — Base change and (co)products

Uniqueness of fillers survives the elementary constructions: a cobase change of the left-hand map, a
base change of the right-hand map, products of the right-hand maps, and coproducts of the left-hand
maps. In each case existence is already known, so only the uniqueness half is argued.

- `IsPushout.hasAtMostOneLiftingProperty`, `IsPullback.hasAtMostOneLiftingProperty` and their
  `hasUniqueLiftingProperty` companions: the at-most-one property is inherited by a cobase change of
  `i` and by a base change of `p`.
- The four instances for `pushout.inl`, `pushout.inr`, `pullback.fst`, `pullback.snd`, in both the
  at-most-one and the unique form.
- `Pi.map` and `Sigma.map` instances: a product of maps `p` inherits the at-most-one property
  against a fixed `i`, and a coproduct of maps `i` inherits it against a fixed `p`; both again in
  the unique form.

### C2 — General `J`-shaped (co)limits

For a diagram of maps each orthogonal to `i`, the induced map on limits is orthogonal to `i` as
well. This is genuinely a theorem about *unique* lifting: the corresponding statement for mere
existence is false, because lifts chosen independently in each component need not be compatible
along the diagram. Uniqueness forces that compatibility, so the component lifts assemble into a cone
and induce a lift into the limit.

- `HasAtMostOneLiftingProperty.of_isLimit` and `HasUniqueLiftingProperty.of_isLimit`: for a diagram
  of morphisms each having the unique lifting property against `i`, the induced map on limits has it
  too. `HasUniqueLiftingProperty.of_isLimit` **constructs** the lift rather than importing it: lift
  each component square, use uniqueness to see that the component lifts commute with the transition
  maps of the diagram, and assemble them into a cone.
- `HasAtMostOneLiftingProperty.of_isColimit` and `HasUniqueLiftingProperty.of_isColimit`: the dual.
- The module documentation states that the ordinary-lifting analogue of these four results is
  **false**, so that no contributor tries to route them through Mathlib.

### C3 — Transfinite composition

A transfinite composite of maps each orthogonal to `p` is again orthogonal to `p`. Uniqueness is
proved by transfinite induction along the composite: two lifts out of the colimit agree at the
bottom stage by hypothesis, agree at each successor stage because they are two fillers of a single
square, and agree at limit stages by the universal property of the colimit.

- `HasAtMostOneLiftingProperty.transfiniteComposition.comp_ext`: for a transfinite composition with
  colimit cocone `c`, two morphisms `m₁ m₂ : c.pt ⟶ X` agreeing after `c.ι.app ⊥` agree after
  `c.ι.app j` for every `j`, by transfinite induction — the successor step compares two lifts of one
  square along `F.obj j ⟶ F.obj (Order.succ j)`, and the limit step is `hom_ext` at the colimit.
- `HasAtMostOneLiftingProperty.transfiniteComposition.hasAtMostOneLiftingProperty_ι_app_bot` and its
  `HasUniqueLiftingProperty` companion: if every successor map has the (at-most-one, resp. unique)
  lifting property against `p`, so does the transfinite composite. The existence half is Mathlib's
  `HasLiftingProperty.transfiniteComposition.hasLiftingProperty_ι_app_bot`.
- *Acceptance:* a sequential composite of maps with the unique left lifting property against `p`
  again has it.

*Depends on:* B1, B2.

## Milestone D — The orthogonal classes of a morphism property

### D1 — The two operators and their Galois theory

Passing from a class `T` of maps to the maps orthogonal to it — on the left, or on the right — gives
two order-reversing operations adjoint to each other. Since this is a Galois connection, the formal
consequences come for free: `T` sits inside its double orthogonal, and applying the operations three
times is the same as applying them once. Both orthogonal classes sit inside their weak-lifting
counterparts.

- `MorphismProperty.leftOrthogonal T` and `MorphismProperty.rightOrthogonal T`: the maps with the
  unique left, respectively right, lifting property against every map of `T`.
- `le_leftOrthogonal_iff_le_rightOrthogonal` and `gc_leftOrthogonal_rightOrthogonal`: the two
  operators form an antitone Galois connection, stated through Mathlib's `GaloisConnection` on the
  order dual so that its API is available.
- The consequences: `le_leftOrthogonal_rightOrthogonal`, `antitone_leftOrthogonal`,
  `antitone_rightOrthogonal`, and the triple identities
  `rightOrthogonal_leftOrthogonal_rightOrthogonal` and
  `leftOrthogonal_rightOrthogonal_leftOrthogonal`.
- The two recognition lemmas `rightOrthogonal_eq_of_le_of_le_leftOrthogonal_rightOrthogonal` and
  `leftOrthogonal_eq_of_le_of_le_rightOrthogonal_leftOrthogonal`: a class squeezed between `T` and
  `T.rightOrthogonal.leftOrthogonal` has the same orthogonal as `T`. These make H5's idempotence
  statements one line each.
- Comparison with the weak theory: `leftOrthogonal_le_llp`, `rightOrthogonal_le_rlp`.
- Generated families: `leftOrthogonal_ofHoms_iff` and `rightOrthogonal_ofHoms_iff` reduce membership
  for `ofHoms f` to the unique lifting property against each `f i`.
- Opposites: `op_leftOrthogonal`, `op_rightOrthogonal`, `unop_leftOrthogonal`,
  `unop_rightOrthogonal`.
- *Acceptance:* `(isomorphisms C).rightOrthogonal = ⊤`; `T.leftOrthogonal` contains the isomorphisms
  for every `T`; the Galois connection reproduces both triple identities by `rw` alone.

### D2 — Closure properties

The catalogue of operations the two classes are closed under. The right class is closed under all
limits, under base change, and under right cancellation; the left class under all colimits, under
cobase change, under transfinite composition, and under left cancellation. The asymmetry in
cancellation is real and it matters later: each class satisfies exactly one of the two rules, and
neither satisfies two-out-of-three.

Each item is stated in bare form and again as an instance for an `IsOrthogonalPair`, per the
convention above.

- `IsMultiplicative` and `RespectsIso` for both classes.
- `IsStableUnderRetracts` for both classes.
- `IsStableUnderCobaseChange` for `leftOrthogonal`, `IsStableUnderBaseChange` for `rightOrthogonal`.
- `HasOfPostcompProperty` for `rightOrthogonal`, `HasOfPrecompProperty` for `leftOrthogonal`, and
  **no other cancellation statement**. The usable corollaries are `rightOrthogonal_of_postcomp` and
  `leftOrthogonal_of_precomp`, with the special cases `rightOrthogonal_of_postcomp_mono` and
  `leftOrthogonal_of_precomp_epi`, and the section/retraction forms `rightOrthogonal_of_section`
  and `leftOrthogonal_of_retraction`.
- `IsStableUnderLimitsOfShape J` for `rightOrthogonal` and `IsStableUnderColimitsOfShape J` for
  `leftOrthogonal`, for **every** shape `J` with no filteredness or connectedness hypothesis — this
  is C2 applied pointwise — together with `IsStableUnderCoproducts` for `leftOrthogonal`.
- `IsStableUnderTransfiniteCompositionOfShape J` and `IsStableUnderTransfiniteComposition` for
  `leftOrthogonal`, from C3.
- *Acceptance:* the peel `transfiniteCompositions_le_iff`, `pushouts_le_iff`, `coproducts_le_iff`
  applies to `T.leftOrthogonal` with every instance found by type-class search.

### D3 — Orthogonal pairs

A pair of classes each of which is exactly the orthogonal of the other. The fundamental fact is that
such a pair meets exactly in the isomorphisms: a map lying in both classes lifts against itself, and
the filler of the square with identity edges is a two-sided inverse. This is what makes
factorizations essentially unique, and it is the step behind every later argument that upgrades a
comparison map to an isomorphism.

- `MorphismProperty.IsOrthogonalPair A B`: the class with fields `B.leftOrthogonal = A` and
  `A.rightOrthogonal = B`. This is the *unique lifting system* of [anel2009, Definition 1]; it
  carries no factorization axiom. The documentation records that the two fields are **not** `simp`
  lemmas — in `B.leftOrthogonal = A` the argument `A` does not occur on the left — and that they are
  used through an explicit `rw [← IsOrthogonalPair.left_eq]`.
- The two generated instances: `IsOrthogonalPair T.rightOrthogonal.leftOrthogonal T.rightOrthogonal`
  and `IsOrthogonalPair T.leftOrthogonal T.leftOrthogonal.rightOrthogonal` ([anel2009, Lemma 2]).
- `leftOrthogonal_inf_le_isomorphisms`, `inf_rightOrthogonal_le_isomorphisms` and
  `IsOrthogonalPair.inf_eq_isomorphisms`: **the two classes of an orthogonal pair meet exactly in
  the isomorphisms.** A map in both classes lifts against itself, and B1's
  `isIso_of_hasLiftingProperty_self` finishes. Every later argument that turns a factorization into
  an isomorphism goes through this lemma.
- *Acceptance:* `(isomorphisms C, ⊤)` and `(⊤, isomorphisms C)` are orthogonal pairs; for an
  orthogonal pair, a map lying in both classes is an isomorphism.

*Depends on:* B, C.

## Milestone E — Orthogonal factorization systems

### E1 — The class, and both comparisons with the weak notion

An orthogonal pair in which every map really does factor as a left map followed by a right map — the
(epi, mono) situation and its relatives. Two comparisons with the homotopy-theoretic notion are
recorded: forgetting uniqueness of fillers gives a weak factorization system, and a weak
factorization system whose fillers happen to be unique is an orthogonal one.

- `MorphismProperty.IsOrthogonalFactorizationSystem L R`: `L.rightOrthogonal = R`,
  `R.leftOrthogonal = L`, and `HasFactorization L R`.
- `IsOrthogonalFactorizationSystem.isOrthogonalPair`: forgetting the factorization axiom.
- `IsOrthogonalFactorizationSystem.isWeakFactorizationSystem`: forgetting uniqueness of lifts.
- `IsOrthogonalFactorizationSystem.of_isWeakFactorizationSystem`: a weak factorization system whose
  left maps lift *uniquely* against its right maps is an orthogonal factorization system. Both
  directions are wanted and neither is an instance.
- `rightOrthogonal_eq_of_ofs`, `leftOrthogonal_eq_of_ofs`, `hasUniqueLiftingProperty_of_ofs`: the
  three facts a consumer of an established system applies.
- *Acceptance:* `(isomorphisms C, ⊤)` and `(⊤, isomorphisms C)` are orthogonal factorization
  systems; a weak factorization system with unique diagonal fillers produces the orthogonal system
  through `of_isWeakFactorizationSystem`.

### E2 — Uniqueness of factorizations

Given two factorizations of the same map, there is exactly one comparison morphism between the
intermediate objects compatible with both factors, and it is an isomorphism. A factorization is
therefore unique up to a *unique* isomorphism, not merely up to some isomorphism. This uses only the
orthogonality of the two classes and not the existence of factorizations, so it is available before
any factorization system has been constructed — which is what the next milestone needs.

Proved from the orthogonality inequality `L ≤ R.leftOrthogonal` alone: **no factorization existence
and no `IsOrthogonalFactorizationSystem` instance is a hypothesis of any statement in E2.** This is
what lets Milestone F apply it to a pair before the system has been assembled.

- `MapFactorizationData.commSq`: the comparison square between two factorizations of one morphism,
  the left factor of one against the right factor of the other.
- `MapFactorizationData.hom_ext`: a comparison morphism between two factorizations is unique.
- `MapFactorizationData.exists_comparison`: it exists, as the filler of the comparison square.
- `MapFactorizationData.exists_iso`: **two factorizations of the same morphism differ by a unique
  isomorphism of the intermediate object, compatible with both factors.**
- *Acceptance:* two `MapFactorizationData` for the same `f` yield an isomorphism `fac.Z ≅ fac'.Z`
  commuting with `i` and `p` on both sides, and any two such isomorphisms are equal.

*Depends on:* D3.

## Milestone F — The arrow reflection

The subject of this milestone is that an orthogonal factorization system is a **reflection**, not
merely a choice of factorization. Everything here is a formal consequence of E2.

### F1 — Morphism properties as object properties of `Arrow C`

A class of maps in `C` is a class of *objects* of the arrow category. Making that change of
viewpoint explicit lets the language of subcategories be used: closure of a class of maps under
limits becomes closure of a full subcategory of arrows under limits, which is the form in which the
reflection argument consumes it.

- `MorphismProperty.arrows : ObjectProperty (Arrow C)`, with `arrows_iff`, `arrows_mk_iff`,
  `arrows_monotone`, `arrows_inf`, `arrows_le_arrows_iff`, and the bridge `mem_toSet_iff_arrows` to
  Mathlib's `MorphismProperty.toSet`. The two spellings are kept apart on purpose: `toSet` is what
  the smallness API consumes, `arrows` is what the `FullSubcategory` API consumes.
- `arrows_isClosedUnderIsomorphisms` for a class respecting isomorphisms.
- `arrows_of_isColimit` and `arrows_isClosedUnderColimitsOfShape`: the translation between Mathlib's
  `IsStableUnderColimitsOfShape` — a statement about a natural transformation of two diagrams in `C`
  — and closure of `W.arrows` under colimits taken in `Arrow C`. The two agree because colimits in
  `Arrow C` are computed componentwise, and the arrow-category form is the one F3 consumes.

### F2 — The reflection and the coreflection

The substance of the milestone. For an orthogonal factorization system, sending a map to the right
factor of its factorization is a reflector onto the right class inside the arrow category, and
sending it to the left factor is a coreflector onto the left class. A factorization system is
therefore a reflection rather than a choice, and the right class is closed under limits of arrows
for purely formal reasons.

For `[IsOrthogonalPair L R] [HasFactorization L R]`:

- `arrowReflection : Arrow C ⥤ R.arrows.FullSubcategory`, sending an arrow to the `R`-factor of a
  chosen factorization, with unit the square `(i, 𝟙)`; `arrowReflectionAdjunction` exhibiting it as
  left adjoint to `R.arrows.ι`; and `reflective_arrows_ι : Reflective (R.arrows.ι)`.
- `arrowCoreflection`, `arrowCoreflectionAdjunction`, `coreflective_arrows_ι` — the dual, sending an
  arrow to its `L`-factor, with counit the square `(𝟙, p)`.
- The hom-equivalences are built from E2 (`arrowReflectionHomEquiv` and its naturality) and fed to
  `Adjunction.mkOfHomEquiv`; the adjunction is not obtained from a limit-preservation criterion.
- *Acceptance:* `R.arrows` is closed under all limits of arrows, by `Reflective` alone; the unit at
  an arrow already in `R` is an isomorphism.

### F3 — Restriction to a subclass, and limits of arrows

In practice one wants limits not among all arrows but among arrows of a restricted kind —
surjections, say. A reflective subcategory restricts to a reflective subcategory of any class the
reflector preserves, and quotient-like classes such as the epimorphisms satisfy the cancellation
condition that requires, with no hypothesis at all. The conclusion is that arrows which are
simultaneously in the right class and quotient-like are closed under limits of quotient-like arrows.

- `ObjectProperty.restrictedReflector`, `ObjectProperty.restrictedReflectorAdjunction`,
  `ObjectProperty.reflective_ιOfLE_inf`: a reflective subcategory `D.ι` restricts to a reflective
  inclusion of the `(D ⊓ E)`-objects into the `E`-objects, for any property `E` carried into itself
  by the reflector. Mathlib has no such restriction lemma; this is general `ObjectProperty` API and
  is stated as such, with no reference to arrows or lifting.
- `epimorphisms_hasOfPrecompProperty` and `surjective_hasOfPrecompProperty`: the epimorphisms of any
  category, and the surjections of any concrete category, have the of-precomp property relative to
  *every* class. Both hold with no hypothesis, and they discharge the hypothesis of the previous
  item.
- `arrows_arrowReflectionObj`, `reflective_arrows_inf_ιOfLE`, `hasLimitsOfShape_arrows_inf`: for a
  class `Q` with `Q.HasOfPrecompProperty L`, the arrows lying in both `R` and `Q` are reflective in,
  and therefore closed under the limits of, the `Q`-arrows.
- *Acceptance:* taking `Q = ⊤` recovers F2; taking `Q = epimorphisms C` needs no hypothesis beyond
  the previous item.

*Depends on:* A1, D2, E2.

## Milestone G — Generation: codiagonals, presentability, and the small object argument

### G1 — Codiagonal generators

How to present an orthogonal factorization system by generators. Adjoining to a family `I` of maps
the codiagonals of its members turns unique lifting against `I` into *ordinary* lifting against the
enlarged family, by the criterion of B2. The right class of the system generated by `I` is therefore
a right lifting class in Mathlib's sense, and the enlarged family is still small enough for the
small object argument to run on it.

- `codiagonalHomFamily I`, indexed by `I.toSet`, sending a generator to its `pushout.codiagonal`;
  `codiagonalGenerators I = ofHoms (codiagonalHomFamily I)`; and the augmented class
  `orthogonalGenerators I = I ⊔ codiagonalGenerators I`.
- `le_orthogonalGenerators`, `codiagonal_mem_orthogonalGenerators`, and the smallness instances
  `codiagonalGenerators_isSmall`, `orthogonalGenerators_isSmall` — the augmentation is indexed by
  the same set, so smallness is inherited and the small object argument stays applicable.
- **`rightOrthogonal_eq_rlp_orthogonalGenerators : I.rightOrthogonal = (orthogonalGenerators I).rlp`.**
  The headline of the milestone: unique right lifting against `I` is *ordinary* right lifting
  against the augmented class. Immediate from B2 at each generator.
- *Acceptance:* for `I` a family of epimorphisms the augmentation consists of isomorphisms, so the
  identification degenerates to `I.rightOrthogonal = I.rlp`; the codiagonal of any map is a split
  epimorphism.

### G2 — Presentability criteria

The hypothesis under which that argument runs. The sources of the generators must be presentable —
small relative to a fixed regular cardinal. For the enlarged family one needs both endpoints of
every generator to be presentable, because the new sources are the pushouts `B ⊔_A B`, which are
finite colimits of the old endpoints.

- `isFinitelyPresentable_pushout`: a pushout of a span of finitely presentable objects is finitely
  presentable, being an `ℵ₀`-small colimit.
- `isCardinalForSmallObjectArgument_of_presentable_sources` and
  `hasSmallObjectArgument_of_presentable_sources`: a small class whose generator **sources** are
  `κ`-presentable satisfies Mathlib's cardinal condition, given the structural colimit and iteration
  hypotheses.
- `isCardinalForSmallObjectArgument_orthogonalGenerators` and
  `hasSmallObjectArgument_orthogonalGenerators`: for the augmented class, presentability of **both**
  endpoints of every generator is required and is sufficient. The only new source is `B ⊔_A B`, the
  colimit of a finite span on `A`, `B`, `B`, so `isCardinalPresentable_of_isColimit` applies. Both
  endpoint hypotheses are stated in the `∀ {A B} (i : A ⟶ B), I i → …` form, so that a concrete
  generator family discharges them by `rintro` and nothing else.

### G3 — The generated orthogonal factorization system

Assembly. Running the small object argument on the enlarged family produces factorizations; the left
class it produces is identified with the double orthogonal of `I`; and the two classes together form
an orthogonal factorization system. The identification is made as an inclusion of classes, proved
against the closure properties of D2, rather than by inspecting the particular maps the argument
happens to output.

- `orthogonalGenerators_le_leftOrthogonal_rightOrthogonal`: the augmented generators lie in
  `K = I.rightOrthogonal.leftOrthogonal`. For the generators in `I` this is reflexivity of the
  Galois connection; for the codiagonals it is that each is a split epimorphism, so ordinary lifting
  against it — which G1 supplies — is automatically unique.
- `rlp_llp_orthogonalGenerators_le_leftOrthogonal_rightOrthogonal` and
  `rlp_llp_orthogonalGenerators_eq_leftOrthogonal_rightOrthogonal`: with
  `[HasSmallObjectArgument (orthogonalGenerators I)]`, the ordinary left class of the augmented
  generators **is** `K`. The inclusion is proved as an inequality of classes, by rewriting with
  Mathlib's cellular description and peeling the four layers against D2's closure instances — never
  by a map-by-map argument on the chosen output of the small object argument.
- `generatedHasFunctorialFactorization` and `generatedOrthogonalFactorizationSystem`: transporting
  Mathlib's functorial factorization for the augmented generators along the two class
  identifications gives `IsOrthogonalFactorizationSystem K I.rightOrthogonal`.
- *Acceptance:* the generated system's right class is `I.rightOrthogonal`; running the construction
  on `I = isomorphisms C` gives `(isomorphisms C, ⊤)`.

*Depends on:* B2, D, E1, G1, G2.

## Milestone H — The cellular description of the generated left class

### H1 — The cellular class

Cell complexes: transfinite composites of pushouts of coproducts of the generators — objects built
by attaching cells one after another, possibly transfinitely often. This is the class the small
object argument produces.

- `cellular.{w} J = transfiniteCompositions.{w} (coproducts.{w} J).pushouts`, `@[pp_with_univ]`,
  with `cellular_eq` for use in `rw` chains against `llp_rlp_of_hasSmallObjectArgument`,
  `le_cellular`, `cellular_monotone`, and the instances `transfiniteCompositions_respectsIso` and
  `cellular_respectsIso`.
- `exists_factorization_cellular_rlp`: the small object argument's output read as an existence
  statement — every morphism factors as a cellular map followed by a map in `J.rlp`.

### H2 — The collapse criterion

A criterion for recognizing that a candidate class exhausts the left class: if it is contained in
the left class and already suffices to factor every map, it is the whole left class. The argument
writes a map of the left class as a candidate map followed by a right-class map, cancels to put the
second factor into both classes, and concludes by D3 that it is an isomorphism.

- `eq_of_hasFactorization_of_le`: for an orthogonal pair `(L, R)` and a class `K ≤ L` respecting
  isomorphisms, if every morphism admits a factorization with left factor in `K` and right factor in
  `R`, then `K = L`. Three steps: write `f = i ≫ p` with `i ∈ K ≤ L`, so `p ∈ L` by **left
  cancellation**; hence `p ∈ L ⊓ R = isomorphisms` by D3; hence `f ∈ K`.
- The documentation states that the factorization hypothesis need not come from the small object
  argument, so that the criterion also shows a class strictly smaller than `cellular` — a single
  pushout of a single coproduct, say — already exhausts `L`.

### H3 — Retracts are not needed

The main structural theorem of the area. In homotopy theory one can only say that the left class
consists of *retracts* of cell complexes. In the orthogonal setting the retracts can be dropped: the
left class is exactly the cell complexes on the enlarged generating family. The single ingredient
unavailable in the weak setting is left cancellation for the left class, which is precisely what
uniqueness of fillers buys.

- `leftOrthogonal_rightOrthogonal_eq_retracts_cellular`: what Mathlib's description gives directly,
  `K = (cellular (orthogonalGenerators I)).retracts`.
- `cellular_orthogonalGenerators_le_leftOrthogonal_rightOrthogonal`, and the substance,
  `leftOrthogonal_rightOrthogonal_le_cellular`.
- **`leftOrthogonal_rightOrthogonal_eq_cellular`:**
  `I.rightOrthogonal.leftOrthogonal = cellular.{w} (orthogonalGenerators I)`, with **no outer
  `retracts`**. The module documentation says why this has no `llp` analogue: the proof consumes
  `leftOrthogonal.HasOfPrecompProperty`, which is false for `llp`, and that failure is exactly why a
  cofibrantly generated model category has cofibrations that are retracts of relative cell complexes
  rather than relative cell complexes.
- `cellular_le_leftOrthogonal_rightOrthogonal`: the unaugmented cellular class lies in `K`, needing
  no small object argument and no hypothesis on `I` — the bare four-layer peel.

### H4 — Codiagonals are not needed for a family of epimorphisms

If every generator is an epimorphism, its codiagonal is an isomorphism and the enlargement is
invisible. The left class is then the cell complexes on the *original* generators, and unique
lifting against them coincides with ordinary lifting — the theory collapses onto the weak one,
described by the generators exactly as given, and neither pushouts in `C` nor a small object
argument on the enlarged family is needed.

- `rightOrthogonal_eq_rlp_of_epi`: for `I ≤ epimorphisms C`, `I.rightOrthogonal = I.rlp`, by
  `HasAtMostOneLiftingProperty.of_epi`. The structural explanation of the same fact is
  `orthogonalGenerators_rlp_eq_rlp`, and both are stated.
- `codiagonalGenerators_le_isomorphisms` for `I ≤ epimorphisms C`, from
  `pushout.isIso_codiagonal_iff`.
- **`leftOrthogonal_rightOrthogonal_eq_cellular_of_epi`:** for `I ≤ epimorphisms C` and
  `[HasSmallObjectArgument I]`, `K = cellular.{w} I` — the cellular class of the **unaugmented**
  generators. This needs neither `HasPushouts C` nor a small object argument on the augmented class,
  since the augmentation is never formed.
- `hasFunctorialFactorization_of_epi` and `orthogonalFactorizationSystem_of_epi`: the same weakening
  of hypotheses for G3's conclusions.
- `cellular_orthogonalGenerators_eq_cellular_of_epi`: the two cellular classes agree, obtained by
  identifying both with `K` rather than by a layer-by-layer comparison, which would have to absorb a
  coproduct mixing generators with isomorphisms.
- `rlp_llp_le_leftOrthogonal_rightOrthogonal` and
  `rlp_llp_eq_leftOrthogonal_rightOrthogonal_of_epi`: the comparison with the weak system generated
  by the same `I` — an inclusion in general, an equality in the epimorphism case.

### H5 — Idempotence of the augmentation, and epimorphism consequences

The enlargement is idempotent — performing it twice changes neither orthogonal class — and it never
leaves the world of epimorphisms. Consequently, when the generators are epimorphisms so is every map
of the left class, which converts a single check on the generators into a property of every map of
the class, and in particular of the unit of the reflection of Milestone F.

- `codiagonalGenerators_le_epimorphisms`, with no hypothesis at all, since a codiagonal is split
  epi; and `codiagonalGenerators_codiagonalGenerators_le_isomorphisms`, the *second* augmentation
  adding only isomorphisms.
- `orthogonalGenerators_rightOrthogonal`, `orthogonalGenerators_orthogonalGenerators_rlp_eq_rlp`,
  `orthogonalGenerators_leftOrthogonal_rightOrthogonal`: the augmentation changes neither orthogonal
  class, and running it twice changes nothing — through D1's recognition lemmas.
- `IsStableUnderColimitsOfShape.epimorphisms`, `IsStableUnderCoproducts.epimorphisms`,
  `IsStableUnderFilteredColimits.epimorphisms`: a colimit of epimorphisms is an epimorphism.
- `cellular_le_epimorphisms` and `leftOrthogonal_rightOrthogonal_le_epimorphisms`: **the left class
  generated by a family of epimorphisms consists of epimorphisms.** This turns one computation at
  the generators into a property of every map of the left class, and in particular of the unit of
  the reflection of Milestone F.
- *Acceptance:* for `I` a single epimorphism, `K` is the cellular class of that one map and consists
  of epimorphisms; the augmentation of `I` is `I` together with a family of isomorphisms.

*Depends on:* D2, D3, E, G.

## Milestone I — Filtered colimits in the right class

The organising statement: **the right class is closed under exactly those (co)limits that the
representables of the generators commute with** — all limits unconditionally (D2), and
`κ`-filtered colimits when the generators are `κ`-presentable.

### I1 — The two halves for a single lifting problem

When is the right class closed under filtered colimits? A lifting problem against a filtered colimit
is solved by pushing it back into a single stage of the diagram, which is possible when the
generators are small relative to that colimit. Both endpoints of the generator are needed, for three
separate purposes: one moves the top of the square into a stage, one moves the bottom, and one again
makes the transported square actually commute.

- `HasLiftingProperty.of_isColimit_of_isCardinalPresentable`: existence of a lift of `i : A ⟶ B`
  against a morphism of `κ`-filtered colimit cocones. Both endpoints are hypotheses, and the
  documentation says where each is used: `A` presentable factors the top of the square through a
  stage, `B` presentable factors the bottom through a stage, and `A` presentable again makes the
  pulled-back square commute at a later stage.
- `HasAtMostOneLiftingProperty.of_isColimit_of_isCardinalPresentable`: uniqueness, again with both
  endpoints — `B` factors each competing lift through a stage, `A` makes them agree after
  precomposition with `i`, and `B` makes them agree after composition at a further stage.
- Neither half is a source-only or target-only statement; both carry both hypotheses.

### I2 — The class statement

The class-level conclusion: for generators with presentable endpoints, the right class is stable
under sufficiently filtered colimits. Combined with D2 this is the complete picture — the right
class is closed under all limits without hypothesis, and under exactly those colimits that the
representable functors of the generators commute with.

- `rightOrthogonal_hasLiftingProperty_of_isColimit_of_presentable` and
  `rightOrthogonal_hasAtMostOneLiftingProperty_of_isColimit_of_presentable`: the packagings for
  `I.rightOrthogonal` with `κ`-presentable generator endpoints.
- **`rightOrthogonal_isStableUnderColimitsOfShape_of_presentable`:** `I.rightOrthogonal` is stable
  under colimits of any `κ`-filtered, essentially `w`-small shape. The two endpoint hypotheses are
  in exactly the form G2 already asks a concrete generator family to discharge, so a consumer
  supplies them once and gets both the small object argument and this stability.
- *Acceptance:* for `I` a family of maps between finitely presentable objects, `I.rightOrthogonal`
  is stable under filtered colimits; the shape hypotheses are `[EssentiallySmall.{w} J]` and
  `[IsCardinalFiltered J κ]` and nothing more.

*Depends on:* B1, D, G2.

## Milestone J — Local objects

The object-level shadow of a factorization system: when `R` is the right class, the objects `A` with
`terminal.from A ∈ R` are exactly the objects the reflection lands in.

### J1 — The property and its closure

The objects whose map to the terminal object lies in the right class: the objects at which the
factorization system has nothing left to do. Every closure property of the right class descends to
them in one step, because a diagram of terminal maps sits over the constant diagram at the terminal
object, whose limit — and, over a connected shape, whose colimit — is the terminal object again. So
limits and products of local objects are local, and so are colimits over connected shapes.

- `MorphismProperty.localObjects R : ObjectProperty C`, defined as `R (terminal.from A)`, with
  `localObjects_iff`.
- `localObjects_isStableUnderRetracts`.
- `isLimitConstConeTerminal`, `localObjects_of_isLimit`, `localObjects_pi`: limits, in particular
  arbitrary products, of local objects are local.
- `localObjects_of_isColimit`: colimits over a **connected** shape, in particular filtered colimits,
  of local objects are local.
- The unifying observation belongs in the module documentation: every closure property of `R` as a
  class of morphisms descends to one of `localObjects R` in one line, because the diagram of
  terminal maps lies over the constant diagram at `⊤_ C`, whose limit — and, over a connected shape,
  whose colimit — is again `⊤_ C`. Nothing here is special to a right orthogonal class, and the
  statements do not assume one.

### J2 — The projective-source mechanism

A criterion for a quotient of a local object to be local: if the sources of the generators lift
along the quotient map, then every lifting problem posed over the quotient can be solved upstairs
and pushed back down, and all quotients are handled at once. The hypothesis has to be relative
projectivity along the given map rather than projectivity in the absolute sense, which is too strong
in categories where the epimorphisms strictly exceed the surjections.

The one family of statements in this milestone that is not a closure property descending from `R`;
it needs `R` to be generated.

- `localObjects_rlp_of_epi_of_liftsAlong`: a quotient of a local object is local, given that each
  generator source factors along the epimorphism at hand. **Projectivity is taken relative to that
  epimorphism, not absolutely.** `CategoryTheory.Projective` is projectivity against all
  epimorphisms and is too strong in the categories this is applied in, where the epimorphisms
  strictly exceed the surjections.
- `localObjects_rlp_of_epi_of_projectiveSource` and `localObjects_of_epi_of_projectiveSource`: the
  absolute-projectivity form, and the passage from `I.rlp` to `I.rightOrthogonal`, which costs the
  hypothesis `I ≤ epimorphisms C` through H4. That hypothesis is unavoidable and the documentation
  says so: uniqueness of a lift over the quotient cannot be pulled back, since that would need the
  generator *target*, not its source, to be projective.
- *Acceptance:* the statement covers all quotients at once, with no reduction to a distinguished
  family of quotients and no filtered colimit.

### J3 — The summand-selection mechanism

A second criterion, in the opposite direction. A map out of a local object lying in the left class
is a split monomorphism; if it is also an epimorphism it is an isomorphism, so its target, and every
retract of its target, is local as well.

- `isSplitMono_of_hasLiftingProperty_terminal`: a map out of a local object with the left lifting
  property against `R` is a split monomorphism.
- `isIso_of_epi_of_hasLiftingProperty_terminal`: if it is moreover an epimorphism, it is an
  isomorphism.
- `localObjects_of_llp_of_epi` and `localObjects_of_retract_of_llp_of_epi`: hence its target, and
  every retract of its target, is local.
- *Acceptance:* three short lemmas, using no structure on `C` beyond a terminal object.

*Depends on:* D, G1, H4.

## Provenance

An implementation of much of the material above exists outside Tau Ceti, in the author's `P`
repository, and the roadmap was written from it. That formalization is **not** prescriptive: the
specification is this document, each milestone is judged on its own terms, and where the two differ
this document wins. The map is recorded only so that a contributor can consult prior art.

| milestone | files in `P` |
|---|---|
| A1 | `CategoryTheory/MorphismProperty/Coproducts.lean` |
| A2 | `CategoryTheory/MorphismProperty/LeftOrthogonalColimit.lean` |
| B1 | `CategoryTheory/LiftingProperties/Basic.lean`, `CategoryTheory/LiftingProperties/Unique.lean` |
| B2 | `CategoryTheory/LiftingProperties/Codiagonal.lean` |
| C | `CategoryTheory/LiftingProperties/UniqueLimits.lean`, `CategoryTheory/LiftingProperties/UniqueTransfinite.lean` |
| D | `CategoryTheory/MorphismProperty/Orthogonal.lean` |
| E | `CategoryTheory/MorphismProperty/OrthogonalFactorizationSystem.lean` |
| F | `CategoryTheory/MorphismProperty/Orthogonal/ArrowReflection.lean` |
| G | `CategoryTheory/MorphismProperty/Orthogonal/Codiagonal.lean`, `CategoryTheory/MorphismProperty/Orthogonal/Presentable.lean`, `CategoryTheory/MorphismProperty/Orthogonal/Generated.lean`, `CategoryTheory/Presentable/Pushout.lean` |
| H | `CategoryTheory/MorphismProperty/Orthogonal/Cellular.lean` |
| I | `CategoryTheory/MorphismProperty/Orthogonal/FilteredColimit.lean` |
| J | `CategoryTheory/MorphismProperty/Orthogonal/LocalObjects.lean` |

Three differences this roadmap imposes on that material: the ambient closure lemmas of Milestone A
are stated for an arbitrary morphism property, with no reference to the concrete classes that
motivated them; `ObjectProperty.restrictedReflector` (F3) is general `ObjectProperty` API and is
stated without mention of arrows or lifting; and every statement of Milestone J is required to be
free of the concrete category it was first proved for.

## References

* [anel2009] M. Anel, *Grothendieck topologies from unique factorisation systems*,
  [arXiv:0902.1130](https://arxiv.org/abs/0902.1130). Definition 1 (unique lifting system) and
  Lemma 2 (the generated pair) are D3; Proposition 3 is D2's cancellation, in the opposite
  vocabulary.
* P. Freyd and G. M. Kelly, *Categories of continuous functors I*, J. Pure Appl. Algebra 2 (1972),
  169–191 — orthogonal factorization systems and the reflection of Milestone F.
* [nLab, *orthogonal factorization system*](https://ncatlab.org/nlab/show/orthogonal+factorization+system).
* [nLab, *small object argument*](https://ncatlab.org/nlab/show/small+object+argument).
