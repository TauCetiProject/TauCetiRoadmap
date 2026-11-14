# Roadmap: topos-theoretic bridges

**Summary.** Build the method of topos-theoretic bridges: a property of topoi that is invariant
under equivalence, read on two presentations of the same topos, gives a correspondence between
two properties of the presentations. The carriers are small categories `C D : Type u` with
`[SmallCategory C]`, their presheaf topoi `Cᵒᵖ ⥤ Type u` and Karoubi envelopes `Karoubi C`;
small sites `(C, J)` with `Sheaf J (Type u)` and the complete lattice `GrothendieckTopology C`;
and geometric theories with their classifying sites and Morita equivalence (ClassifyingTopoi 2.1,
2.6). The end theorems are: two small categories have equivalent presheaf topoi exactly when their
Karoubi envelopes are equivalent, `MoritaEquivalentCat C D ↔ Nonempty (Karoubi C ≌ Karoubi D)`;
the presheaf topos `Cᵒᵖ ⥤ Type u` is Boolean exactly when `C` is a groupoid and De Morgan exactly
when `C` satisfies the right Ore condition, so that both properties of `C` are invariant under
this equivalence; for small sites `(C, J)` and `(D, K)`, an equivalence
`e : Sheaf J (Type u) ≌ Sheaf K (Type u)` gives an order isomorphism `φ : Set.Ici J ≃o Set.Ici K`
between the topologies finer than `J` and those finer than `K`, under which a sheaf `F` is a
`J'`-sheaf exactly when `e.functor.obj F` is a `φ J'`-sheaf; and, for classifying sites of two
geometric theories and an equivalence of their sheaf topoi, an order isomorphism between the
posets of classes of quotients of the two theories, two quotients being in one class when they
have the same models in every topos, under which the models of corresponding quotients correspond.

Suggested home: `TauCeti/CategoryTheory/Topos/Bridges/`.

## Scope and ownership

**Owned here.** Morita equivalence of small categories, defined by the equivalence of their presheaf
topoi, and its characterization by Karoubi envelopes (Layer 1); the properties « Boolean » and
« De Morgan » of a category with lattices of subobjects, their readings on a presheaf topos as
« groupoid » and as the right Ore condition, and the invariance of these two properties of a small
category under Morita equivalence (Layer 2); the order on the subtopoi of a sheaf topos read on
topologies, the transport of subtopoi along an equivalence, and the transfer of the lattice of
finer topologies along an equivalence of sheaf topoi (Layer 3); the poset of classes of quotients
of a geometric theory, its isomorphism with the topologies finer than a classifying one, and its
transfer along an equivalence of classifying topoi (Layer 4). No other roadmap owns Morita
equivalence of small categories, Cauchy completion of categories, Boolean or De Morgan topoi, or
the reading of the right Ore condition on presheaves: the Morita equivalences of DGAInfinity,
HilbertModules and GrothendieckEulerForms are for dg categories, C*-algebras and rings;
ClusterAlgebras proves the Ore conditions for one family of rings;
LocallyPresentableCategories 1.7 characterizes the small accessible categories by
`IsIdempotentComplete`, which this roadmap uses and does not restate.

**Left to GrothendieckTopoi.** Grothendieck topoi, subtopoi and the correspondence between subtopoi
of `Sheaf J (Type u)` and topologies `J' ≥ J` (GrothendieckTopoi 4.1, 4.2), on which 3.1 rests;
the identification of the connected nonempty projective objects of `Cᵒᵖ ⥤ Type u` with
`Karoubi C` (GrothendieckTopoi 6.5), on which 1.2 rests; presheaf topoi among Grothendieck topoi
and rigid topologies (GrothendieckTopoi 6.5, 6.6).

**Left to ClassifyingTopoi.** Geometric theories and their models in a topos, classifying sites and
their uniqueness, the two existence statements relating the quotients of a theory and the
topologies finer than a classifying one, and Morita equivalence of theories (ClassifyingTopoi
1.1, 1.3, 1.4, 2.1, 2.4, 2.5, 2.6), on which Layer 4 rests.

**Supplied by Mathlib.** Karoubi envelopes, their universal property and idempotent completeness
(`CategoryTheory.Idempotents.Karoubi`, `toKaroubi`, `karoubiUniversal`,
`CategoryTheory.IsIdempotentComplete`), groupoids (`IsGroupoid`), the right Ore condition
(`CategoryTheory.GrothendieckTopology.RightOreCondition`), the lattices of subobjects
(`CategoryTheory.Subobject`), sites, sheaves and the complete lattice of Grothendieck topologies.

## Conventions

1. **Size.** Small categories live in `Type u` with `[SmallCategory C]`, and their presheaves take
   values in `Type u`; topoi of sheaves are `Sheaf J (Type u)` for `C : Type u`. Morita
   equivalence compares categories of the same universe. Witness: the presheaf topoi of
   `Discrete PUnit` and `Discrete (ULift.{u} (Fin 2))` are `Type u` and `Type u × Type u` up to
   equivalence; the terminal object `(PUnit, PUnit)` of the second is the coproduct of the two
   nonzero objects `(PUnit, PEmpty)` and `(PEmpty, PUnit)`, while `PUnit` is not a coproduct of
   two nonempty types, so the two categories are not Morita equivalent.
2. **Right Ore condition.** Mathlib's `GrothendieckTopology.RightOreCondition C` says that every
   cospan `f : a ⟶ c`, `g : b ⟶ c` is completed by some `h : d ⟶ a`, `k : d ⟶ b` with
   `h ≫ f = k ≫ g`; a category has the amalgamation property, every span completed to a commuting
   square, exactly when its opposite satisfies the right Ore condition. Witness: `WalkingCospan`
   fails it, since no object has arrows to both `left` and `right`; any category with pullbacks
   satisfies it (`GrothendieckTopology.right_ore_of_pullbacks`).
3. **Composition.** Mathlib's diagrammatic order `f ≫ g`; the square of Convention 2 reads
   `h ≫ f = k ≫ g`. Witness: in a poset with meets, `h` and `k` are the two projections of
   `a ⊓ b`, and the equation is an equality of arrows `a ⊓ b ⟶ c`.
4. **Order on quotients.** A quotient of a geometric theory `T` is a theory `T₁ ⊇ T` over the same
   language; classes of quotients are ordered by reverse inclusion of models, so that adding
   axioms goes up, as refining a topology does. Witness: on a classifying site `(C, J, U)` of
   `T`, the class of `T` goes to `J` and the class of `T ∪ {⊤ ⊢ bot}`, which has a model only in
   a degenerate topos, goes to `⊤` (ClassifyingTopoi 2.5, Checks).

## Exact supplier contracts

**From Mathlib**

- `CategoryTheory.Idempotents.Karoubi C`, `CategoryTheory.Idempotents.toKaroubi C`,
  `CategoryTheory.IsIdempotentComplete C` (in `Mathlib.CategoryTheory.Idempotents.Basic`), and
  `CategoryTheory.Idempotents.karoubiUniversal`: for idempotent complete `D`, precomposition with
  `toKaroubi C` is an equivalence `(Karoubi C ⥤ D) ≌ (C ⥤ D)`;
  `CategoryTheory.Idempotents.isIdempotentComplete_iff_hasEqualizer_of_id_and_idempotent`.
- `CategoryTheory.IsGroupoid C`; `CategoryTheory.Equivalence`, `Equivalence.op`,
  `Equivalence.congrLeft`; `CategoryTheory.Functor.FullyFaithful`.
- `CategoryTheory.GrothendieckTopology.RightOreCondition C` and
  `CategoryTheory.GrothendieckTopology.right_ore_of_pullbacks`.
- `CategoryTheory.Subobject X` with its `Lattice` and `BoundedOrder` instances, for a category
  with pullbacks, images, binary coproducts and an initial object satisfying `InitialMonoClass`;
  `Disjoint`, `IsCompl`; `Sieve`, `Sieve.functor`, `yoneda`.
- `CategoryTheory.GrothendieckTopology C` with its `CompleteLattice` instance,
  `CategoryTheory.Sheaf J (Type u)`, `Presheaf.IsSheaf`, `sheafBotEquivalence`; `Set.Ici`,
  `OrderIso`; `CategoryTheory.Presieve.isSheaf_of_le`, `CategoryTheory.classifier_isSheaf` and
  `CategoryTheory.le_topology_of_closedSieves_isSheaf`, by which `J₁ ≤ J₂` exactly when every
  `J₂`-sheaf of types is a `J₁`-sheaf.

**From Tau Ceti**

Nothing is consumed from the Tau Ceti library.

**From GrothendieckTopoi**

- 4.1 and Convention 6: `Subtopos E`, an object property closed under isomorphisms whose
  inclusion has a left exact left adjoint, ordered by `≤` of object properties.
- 4.2: `Sheaf J (Type u)` is a subtopos of `Cᵒᵖ ⥤ Type u`, and the subtopoi of `Sheaf J (Type u)`
  correspond to the topologies `J' ≥ J`, the subtopos of `J'` being the objects `F` of
  `Sheaf J (Type u)` with `Presheaf.IsSheaf J' F.obj`.
- 6.5: the essential points of `Cᵒᵖ ⥤ Type u`, equivalently its connected nonempty projective
  objects, form the idempotent completion `Idempotents.Karoubi C`.

**From ClassifyingTopoi**

- 1.1: `GeometricTheory L`, a set of sequents; 1.3: `CatStructure L E` and `CatStructure.IsModel`;
  1.4: `CatStructure.map` and `CatStructure.IsModel.map`, with the invariance of
  `CatStructure.IsModel` under `CatStructure.Isomorphic`.
- 2.1: classifying sites `(C, J, U)` of a geometric theory `T`, `IsClassifyingSite T J U`, with
  its clauses (i) and (ii).
- 2.4: `IsClassifyingSite.exists_equivalence`, the uniqueness of the classifying topos.
- 2.5: `IsClassifyingSite.exists_quotient_topology`, for `T ⊆ T₁` some `J' ≥ J` makes `(C, J')`
  with the model `U.map (sheafToPresheaf J (Type u) ⋙ presheafToSheaf J' (Type u))` classify
  `T₁`, and `IsClassifyingSite.exists_quotient_theory`, for every `J' ≥ J` some `T₁ ⊇ T` is
  classified by `(C, J')` with the same model.
- 2.6: `MoritaEquivalent T T'`.

## How to read the build

Layer 1 works on presheaf topoi of small categories only and proves the Karoubi criterion for their
equivalence. Layer 2 defines two invariants of topoi, Boolean and De Morgan, reads them on a
presheaf topos as two properties of the indexing category, being a groupoid and the right Ore
condition, and deduces that these are shared by Morita-equivalent small categories. Layer 3 passes
from presheaf topoi to sheaf topoi of small sites and transfers the lattice of finer topologies,
through GrothendieckTopoi 4.2. Layer 4 passes from sites to geometric theories and transfers the
poset of classes of quotients, through ClassifyingTopoi 2.5 and 2.6 and Layer 3. Each layer is a
bridge: an invariant of topoi, its reading on each presentation, and the correspondence that
results.

## Layer 1: Morita equivalence of small categories

### 1.1 The definition

Define `MoritaEquivalentCat C D` for `C D : Type u` with `[SmallCategory C]` and
`[SmallCategory D]`: there is an equivalence `(Cᵒᵖ ⥤ Type u) ≌ (Dᵒᵖ ⥤ Type u)` (Lindner 1974,
§0, p. 377, the nonadditive Morita problem as the equivalence of the functor categories
`[A, Ens]` and `[B, Ens]` of small categories, applied to `Cᵒᵖ` and `Dᵒᵖ`). Prove, as API:

- reflexivity: `MoritaEquivalentCat C C`, by the identity equivalence;
- symmetry: `MoritaEquivalentCat C D` implies `MoritaEquivalentCat D C`, by the inverse
  equivalence;
- transitivity: for a third small category `E : Type u`, `MoritaEquivalentCat C D` and
  `MoritaEquivalentCat D E` imply `MoritaEquivalentCat C E`, by the composite equivalence;
- an equivalence `C ≌ D` gives `MoritaEquivalentCat C D`, through `Equivalence.congrLeft` applied
  to the opposite equivalence `Cᵒᵖ ≌ Dᵒᵖ` (`Equivalence.op`).

*Needs:* Mathlib `Functor`, `Equivalence`, `Equivalence.op`, `Equivalence.congrLeft`.

**Checks.**

- A category `C` and the category obtained by adding to `C` an object isomorphic to one of its
  objects are equivalent, hence Morita equivalent; a definition by isomorphism of categories, or by
  the number of objects, would separate them.
- `Discrete PUnit` and `Discrete (ULift.{u} (Fin 2))` are not Morita equivalent (Convention 1); a
  definition by the existence of an essentially surjective functor `C ⥤ D` would accept them,
  through `Discrete (ULift.{u} (Fin 2)) ⥤ Discrete PUnit`.
- The one-object category with monoid `{1, e}`, `e` idempotent, and the category with two objects
  `A`, `B` and arrows `r : A ⟶ B`, `s : B ⟶ A` with `s ≫ r = 𝟙 B` are Morita equivalent but not
  equivalent: the first has one isomorphism class of objects and the second two. A definition by
  equivalence of the categories themselves would separate them.

### 1.2 The Karoubi criterion

Prove `moritaEquivalentCat_iff_karoubi`:
`MoritaEquivalentCat C D ↔ Nonempty (Karoubi C ≌ Karoubi D)`. The presheaf topos of `C` is
equivalent to that of its Cauchy completion, the full subcategory of retracts of representable
presheaves, and that completion consists exactly of the absolutely presentable presheaves, whose
representable functor preserves all small colimits (Borceux–Dejean 1986, Theorem 1 (4), p. 134,
proof p. 135, and Proposition 2, p. 135). Prove also, as API:

- `Type u` is idempotent complete: it has equalizers
  (`isIdempotentComplete_iff_hasEqualizer_of_id_and_idempotent`);
- `(Karoubi C)ᵒᵖ ≌ Karoubi Cᵒᵖ`, sending `(X, p)` to `(op X, p.op)`.

Route, backward: `Karoubi C ≌ Karoubi D` gives
`(Karoubi C)ᵒᵖ ⥤ Type u ≌ (Karoubi D)ᵒᵖ ⥤ Type u`, and `karoubiUniversal` for `Cᵒᵖ` and `Type u`,
with the two facts of the API, identifies the first with `Cᵒᵖ ⥤ Type u`. Forward: an equivalence
of presheaf topoi preserves connected nonempty projective objects, and these form `Karoubi C`
(GrothendieckTopoi 6.5).
*Needs:* 1.1; GrothendieckTopoi 6.5; Mathlib `Karoubi`, `toKaroubi`, `karoubiUniversal`,
`IsIdempotentComplete`, `isIdempotentComplete_iff_hasEqualizer_of_id_and_idempotent`,
`Equivalence.congrLeft`.

**Checks.**

- For idempotent complete `C`, `toKaroubi C` is an equivalence, and the criterion reduces to: two
  idempotent complete small categories are Morita equivalent exactly when they are equivalent.
  Applied to `Discrete PUnit` and `Discrete (ULift.{u} (Fin 2))`, idempotent complete, it confirms
  the second Check of 1.1.
- For the monoid `{1, e}` of the third Check of 1.1, `Karoubi` has the two objects `(⋆, 𝟙)` and
  `(⋆, e)`, with `e` the only arrow `(⋆, 𝟙) ⟶ (⋆, e)` and the only arrow back, and `e` the identity
  of `(⋆, e)`: it is the two-object category there, with `r = s = e`, and the criterion gives the
  Morita equivalence of that Check.
- The criterion does not say `C ≌ D`: `C` and `Karoubi C` are Morita equivalent and are not
  equivalent when `C` has an idempotent that does not split. A forward direction stated with
  `C ≌ D` would be false on the monoid `{1, e}`.
- The opposite in the API is on objects and on idempotents together: `(X, p)` goes to
  `(op X, p.op)`, and `p.op ≫ p.op = (p ≫ p).op = p.op`. For the monoid `{1, e}`, equal to its
  opposite, both sides are the two-object category of the second Check.

### Examples

- Every small category is Morita equivalent to its Karoubi envelope.
- Two groups are Morita equivalent as one-object categories exactly when they are isomorphic: a
  group is idempotent complete, and an equivalence of one-object categories is an isomorphism of
  automorphism groups.

### Dependencies

GrothendieckTopoi 6.5, for the forward direction of 1.2; otherwise Mathlib only. Within the layer,
1.2 uses 1.1.

## Layer 2: invariants of presheaf topoi

Both invariants are stated for a category `E` whose posets `Subobject X` are bounded lattices in
Mathlib: `E` has pullbacks, images, binary coproducts and an initial object with
`InitialMonoClass E`. Presheaf categories `Cᵒᵖ ⥤ Type u` satisfy these hypotheses by instances.

### 2.1 Boolean presheaf topoi and groupoids

Define `IsBooleanTopos E`: every subobject `A` of every object `X` has a complement, some `B` with
`IsCompl A B`. Prove `isBooleanTopos_presheaf_iff_isGroupoid`:
`IsBooleanTopos (Cᵒᵖ ⥤ Type u) ↔ IsGroupoid C` (Caramello 2009, §1, pp. 6–7, the criterion for
`Sh(C, J)` to be Boolean when every covering sieve is nonempty; applied to the trivial topology it
says that every sieve of `C` is empty or maximal). Route: if `C` is a groupoid, the objectwise
complement of a subfunctor `A` of `F` is a subfunctor, since `F.map f x ∈ A` gives
`x = F.map (inv f) (F.map f x) ∈ A`. Conversely, for `f : d ⟶ c` let `A` be the subfunctor of
`yoneda.obj c` of the sieve generated by `f`, and `B` a complement; joins of subfunctors are
objectwise unions, so `𝟙 c` lies in `A` or in `B`, and in the second case `B = ⊤` and `A = ⊥`,
which `f ∈ A` excludes. So `𝟙 c = s ≫ f` for some `s : c ⟶ d`; the same for `s` gives `t` with
`𝟙 d = t ≫ s`, hence `f = (t ≫ s) ≫ f = t` and `f ≫ s = 𝟙 d`: `f` is an isomorphism.

Prove, as API:

- an equivalence `e : E ≌ E'` induces order isomorphisms
  `Subobject X ≃o Subobject (e.functor.obj X)`;
- equivalence transport: if `e : E ≌ E'`, then `IsBooleanTopos E ↔ IsBooleanTopos E'`, since every
  object of `E'` is isomorphic to some `e.functor.obj X` and `IsCompl` is preserved by order
  isomorphisms.

Prove `isGroupoid_iff_of_moritaEquivalentCat`: if `MoritaEquivalentCat C D`, then
`IsGroupoid C ↔ IsGroupoid D`. Route: `IsBooleanTopos` is invariant under equivalence, so the
statement is the bridge of the invariant « Boolean topos » across two presentations by presheaves.
Second route, through Layer 1: in a groupoid every idempotent is an identity, so a groupoid is
idempotent complete and `C ≌ Karoubi C`; by 1.2, `D` embeds fully faithfully in
`Karoubi D ≌ Karoubi C ≌ C`, and a full subcategory of a groupoid is a groupoid.
*Needs:* 1.1, 1.2; Mathlib `Subobject`, `IsCompl`, `IsGroupoid`, `yoneda`, `Sieve`,
`Sieve.functor`, `Functor.FullyFaithful`, `IsIdempotentComplete`.

**Checks.**

- `Type u` is Boolean, every subset having its complement, and it is the presheaf topos of the
  groupoid `Discrete PUnit`. The presheaf topos of the empty category has one object, whose only
  subobject `⊤ = ⊥` is its own complement, and the empty category is a groupoid.
- The monoid `{1, e}`, `e` idempotent, is not a groupoid. A presheaf on it is a set with an
  idempotent map; in `X = {a, b}` with `e` constant at `a`, the subobject `{a}` has no complement,
  since `{b}` is not stable: the topos is not Boolean. A definition asking only that `⊥` and `⊤`
  have complements would accept it.
- A group as a one-object category and the trivial groupoid on two isomorphic objects with that
  automorphism group are Morita equivalent, and both are groupoids. The poset `Fin 2` is not a
  groupoid, and neither is the Karoubi envelope of the monoid `{1, e}`, which has the
  non-invertible arrow `e`; the statement keeps them together.
- A version for `Cᵒᵖ` follows by duality, since `IsGroupoid C ↔ IsGroupoid Cᵒᵖ`; a statement that
  confused `C` with `Cᵒᵖ` would still hold here, and 2.2 is where the two differ.

### 2.2 De Morgan presheaf topoi and the right Ore condition

Define `IsDeMorganTopos E`: every subobject `A` of every object `X` has a pseudocomplement `B`,
with `Disjoint S A ↔ S ≤ B` for every subobject `S` of `X`, which has a pseudocomplement `B'`,
and `B ⊔ B' = ⊤`; that is, `¬A ⊔ ¬¬A = ⊤` in every `Subobject X`. Prove
`isDeMorganTopos_presheaf_iff_rightOreCondition`:
`IsDeMorganTopos (Cᵒᵖ ⥤ Type u) ↔ GrothendieckTopology.RightOreCondition C` (Caramello 2009, the
remark after Theorem 1.7, p. 6). Route: for a subfunctor `A` of `F`, `¬A` consists of the `x`
none of whose restrictions `F.map f x` lies in `A`, and `¬¬A` of the `x` each of whose
restrictions has a further restriction in `A`. Under the right Ore condition, if `x ∉ ¬A` then
`F.map f x ∈ A` for some `f : a ⟶ c`, and for every `g : b ⟶ c` a completion `h ≫ f = k ≫ g`
gives `F.map k (F.map g x) = F.map h (F.map f x) ∈ A`, so `x ∈ ¬¬A`. Conversely, for a cospan
`f : a ⟶ c`, `g : b ⟶ c` let `A` be the subfunctor of `yoneda.obj c` of the sieve generated by
`f`; `𝟙 c ∉ ¬A` since its restriction `f` lies in `A`, so `𝟙 c ∈ ¬¬A`, and its restriction `g`
has a further restriction `k ≫ g` in `A`, that is `k ≫ g = h ≫ f`.

Prove, as API:

- equivalence transport: if `e : E ≌ E'`, then `IsDeMorganTopos E ↔ IsDeMorganTopos E'`, by the
  order isomorphisms of subobjects of 2.1, which preserve `Disjoint`, `⊔` and `⊤`.

Prove `rightOreCondition_iff_of_moritaEquivalentCat`: if `MoritaEquivalentCat C D`, then
`GrothendieckTopology.RightOreCondition C ↔ GrothendieckTopology.RightOreCondition D`. Route:
`IsDeMorganTopos` is invariant under equivalence, so the statement is the bridge of the invariant
« De Morgan topos » across two presentations by presheaves. Second route, through Layer 1: the
right Ore condition is invariant under equivalence; it passes from `C` to `Karoubi C`, completing
a cospan `f : (X, p) ⟶ (Z, r)`, `g : (Y, q) ⟶ (Z, r)` by the completion `h, k` of its underlying
cospan in `C` and the arrows `h ≫ p`, `k ≫ q` out of `(d, 𝟙 d)`, since `p ≫ f = f` and
`q ≫ g = g`; and back from `Karoubi C` to `C`, since `toKaroubi C` is fully faithful and the apex
`(d, e)` of a completion in `Karoubi C` can be replaced by `d` with the same arrows.
*Needs:* 1.1, 1.2; 2.1, subobject order isomorphisms; Mathlib `Subobject`, `Disjoint`,
`GrothendieckTopology.RightOreCondition`, `yoneda`, `Sieve`, `Sieve.functor`, `Karoubi`,
`toKaroubi`.

**Checks.**

- De Morgan is weaker than Boolean. The monoid `{1, e}` is commutative, so it satisfies the right
  Ore condition (`h = g`, `k = f`); for a set `X` with an idempotent map `e` and a stable subset
  `A`, `¬A = {x | e x ∉ A}` and `¬¬A = {x | e x ∈ A}`, whose union is `X`: the topos is De Morgan
  and, by the second Check of 2.1, not Boolean. A definition with `A ⊔ B = ⊤` in place of
  `B ⊔ B' = ⊤` would be `IsBooleanTopos`.
- `WalkingCospan` fails the right Ore condition (Convention 2), and so does its Karoubi envelope,
  which is equivalent to it. Its presheaf topos is not De Morgan: in the representable of the apex
  `one`, with elements `𝟙`, `inl`, `inr`, the subobject `A = {inl}` has `¬A = {inr}` and
  `¬¬A = {inl}`, and `𝟙` lies in neither. A statement with the arrows of the square in the other
  direction, completing spans, would make `WalkingCospan` satisfy it and `WalkingSpan` fail it.
- A poset satisfies the right Ore condition exactly when two elements below a common element have
  a common lower bound: the poset `{a, b < c}` with `a`, `b` incomparable fails it, and adding a
  least element makes it satisfy it. A terminal object does not help: `{a, b < c}` has one.
- A group satisfies it: for `f, g` in `G` take `h = 𝟙`, `k = f ≫ g⁻¹`. The monoid `ℕ` under
  addition satisfies it (`h = g`, `k = f` as numbers), while the free monoid on two letters `x`,
  `y` does not, since `w ≫ x = w' ≫ y` has no solution; in its representable presheaf, for `A`
  the sieve generated by `x`, the identity has the restriction `x` in `A` and the restriction
  `y` in `¬A`, so it lies neither in `¬A` nor in `¬¬A`.

### Examples

- The free monoid on two letters fails the right Ore condition, and so does every category Morita
  equivalent to it; its presheaf topos is not De Morgan.
- A group and every groupoid Morita equivalent to it satisfy it, and their presheaf topoi are
  Boolean.
- The presheaf topos of the poset `Fin 2`, the Sierpiński topos, is De Morgan and not Boolean:
  a total order satisfies the right Ore condition and `Fin 2` is not a groupoid.

### Dependencies

Layer 1. The presheaf criteria are independent; the equivalence-invariance API of 2.2 uses the
subobject order isomorphisms of 2.1.

## Layer 3: bridges between sites

### 3.1 The lattice of finer topologies

The invariant is the poset of subtopoi of a topos. Its reading on a site is the supplied
correspondence of GrothendieckTopoi 4.2 between the subtopoi of `Sheaf J (Type u)` and the
topologies `J' ≥ J`, the subtopos of `J'` being the `J`-sheaves that are `J'`-sheaves. Prove, for
its order and its invariance:

- order characterization: for `J ≤ J₁` and `J ≤ J₂`, `J₁ ≤ J₂` if and only if every `J₂`-sheaf in
  `Sheaf J (Type u)` is a `J₁`-sheaf, so that the supplied correspondence reverses order and the
  `J'`-sheaves among the `J`-sheaves determine `J'`;
- an equivalence `e : E ≌ E'` of Grothendieck topoi induces an order isomorphism
  `Subtopos E ≃o Subtopos E'`, sending a subtopos `P` to the objects isomorphic to some
  `e.functor.obj X` with `P X` (GrothendieckTopoi 4.1 and Convention 6 for `Subtopos` and its
  order).

Prove `exists_orderIso_ici_of_sheafEquiv`: for small sites `(C, J)` and `(D, K)` with
`C D : Type u` and an equivalence `e : Sheaf J (Type u) ≌ Sheaf K (Type u)`, there is an order
isomorphism `φ : Set.Ici J ≃o Set.Ici K` such that, for every `J' ≥ J` and every
`F : Sheaf J (Type u)`, `Presheaf.IsSheaf J' F.obj ↔ Presheaf.IsSheaf (φ J') (e.functor.obj F).obj`.
By the order characterization this property determines `φ`. Route: compose the two
order-reversing bijections given by the supplied correspondence and the order characterization,
for `(C, J)` and for `(D, K)`, with the order isomorphism of subtopoi induced by `e`.
*Needs:* GrothendieckTopoi 4.1, 4.2; Mathlib `GrothendieckTopology`, `Sheaf`, `Presheaf.IsSheaf`,
`Presieve.isSheaf_of_le`, `classifier_isSheaf`, `le_topology_of_closedSieves_isSheaf`, `Set.Ici`,
`OrderIso`.

**Checks.**

- For `J = K` and `e` the identity equivalence, `φ` is the identity of `Set.Ici J`: `J'` and
  `φ J'` have the same sheaves among the `J`-sheaves, and the order characterization gives
  `φ J' = J'`.
- `φ` depends on `e`. On `Discrete (ULift.{u} (Fin 2))` a topology chooses the points on which
  the empty sieve covers, so there are four, and `Set.Ici ⊥` is all of them; a presheaf `(X₀, X₁)`
  is a sheaf for the topology `J₀` in which `∅` covers the point `0` only exactly when `X₀` has
  one element. The exchange of the two points is a self-equivalence `e` of the presheaf topos,
  for which `φ` exchanges `J₀` and `J₁`, while the identity fixes them. A statement asserting only
  that some order isomorphism exists would not see the difference.
- On `Discrete PUnit` the sieves on the one object are `∅` and the maximal sieve, so there are two
  topologies, `⊥` and `⊤`, matching the two subtopoi of `Type u`, itself and the degenerate one.
  `Discrete PUnit` and the one-object category of a nontrivial group have the topoi `Type u` and
  `G`-sets, which are not equivalent, and the statement does not apply to them.
- The isomorphism exchanges `⊤` with `⊤`, the topology of the degenerate subtopos, and `J` with
  `K`; a map that reversed order would send `J` to `⊤`.

### Examples

- For a small category `C`, the lattice of Grothendieck topologies on `C` is isomorphic to that on
  `Karoubi C`: Layer 1 gives the equivalence of the presheaf topoi, which are the sheaf topoi for
  `⊥` (`sheafBotEquivalence`).
- For a space `X` and a basis `B` of its topology, the topologies on `Opens X` finer than the open
  cover topology and those on `B` finer than the induced topology form isomorphic lattices.

### Dependencies

GrothendieckTopoi 4.1, 4.2, and Layer 1 for the Examples.

## Layer 4: bridges between theories

### 4.1 Quotients of Morita-equivalent theories

Let `T` be a geometric theory over a language `L`. A quotient of `T` is a theory `T₁ ⊇ T` over
`L` (ClassifyingTopoi 2.5). Two quotients `T₁`, `T₂` are in the same class when they have the
same models in every topos: for every small site `(D, K)` with `D : Type u` and every
`M : CatStructure L (Sheaf K (Type u))`, `M.IsModel T₁ ↔ M.IsModel T₂` (ClassifyingTopoi 1.3).
The classes are ordered by reverse inclusion of models (Convention 4): `[T₁] ≤ [T₂]` when every
model of `T₂` in every `Sheaf K (Type u)` is a model of `T₁`; this is a partial order on the
classes. Syntactically equivalent quotients (Caramello 2017, « Lattices of theories », Definition
3.4, p. 14) are in the same class, by soundness (the first lines of the proof of Theorem 3.6,
p. 15). Prove:

- (a) for a classifying site `(C, J, U)` of `T` and a quotient `T₁`, the topology `J' ≥ J` of
  `IsClassifyingSite.exists_quotient_topology` is unique and depends only on the class of `T₁`,
  and sending the class of `T₁` to `J'` is an order isomorphism from the poset of classes of
  quotients of `T` onto `Set.Ici J` (Caramello 2017, « Lattices of theories », Theorem 3.6,
  p. 15, a bijection between the classes of quotients for syntactic equivalence and the subtopoi
  of the classifying topos; §5.2, p. 36, for the order). Route: write `a₁` for
  `sheafToPresheaf J (Type u) ⋙ presheafToSheaf J₁ (Type u)`. If `(C, J₁)` with `U.map a₁`
  classifies `T₁`, then for a left exact left adjoint `F : Sheaf J (Type u) ⥤ Sheaf K (Type u)`,
  `U.map F` is a model of `T₁` exactly when `F` is isomorphic to `a₁ ⋙ G` for some left exact
  left adjoint `G`: one way by `CatStructure.IsModel.map`, the other by clause (i) for `(C, J₁)`
  and clause (ii) for `(C, J)`. Such an `F` is one whose right adjoint takes values in
  `J₁`-sheaves. Hence the models of `T₂` are models of `T₁` in every topos exactly when every
  `J₂`-sheaf among the `J`-sheaves is a `J₁`-sheaf, that is `J₁ ≤ J₂` (3.1); this gives at once
  that the topology depends only on the class, that the map is injective, and that it and its
  inverse are monotone. It is surjective by `IsClassifyingSite.exists_quotient_theory`.
- (b) for classifying sites `(C, J, U)` of `T` and `(C', J', U')` of `T'`, over possibly different
  languages, and an equivalence `e : Sheaf J (Type u) ≌ Sheaf J' (Type u)`, there is an order
  isomorphism `ψ` from the poset of classes of quotients of `T` onto that of `T'` such that
  `ψ [T₁] = [T₁']` if and only if, for every small site `(D, K)` and every left exact left adjoint
  `G : Sheaf J' (Type u) ⥤ Sheaf K (Type u)`,
  `(U.map (e.functor ⋙ G)).IsModel T₁ ↔ (U'.map G).IsModel T₁'`. This property determines `ψ`,
  every model of `T'` in `Sheaf K (Type u)` being isomorphic to some `U'.map G`. Route: `ψ` is
  the isomorphism `φ` of 3.1 for `e`, composed with the isomorphisms of (a) for the two sites; `G`
  factors through the subtopos of `φ J₁` exactly when `e.functor ⋙ G` factors through that of
  `J₁`.
- (c) if `MoritaEquivalent T T'` (ClassifyingTopoi 2.6), the posets of classes of quotients of
  `T` and of `T'` are isomorphic: (b) for the sites and an equivalence that the hypothesis
  provides.

*Needs:* 3.1; ClassifyingTopoi 1.1, 1.3, 1.4, 2.1, 2.4, 2.5, 2.6; GrothendieckTopoi 4.2.

**Checks.**

- The classes are needed: `T` and `T ∪ {⊤ ⊢ ⊤}` are two quotients of `T` with the same models,
  so inclusion of models is only a preorder on quotients, and both go to `J` in (a).
- For `T' = T`, the same classifying site and `e` the identity equivalence, `ψ` is the identity:
  `U.map (𝟭 _ ⋙ G)` and `U.map G` are isomorphic structures.
- `ψ` depends on `e`. Let `T` be the empty theory over two `0`-ary relation symbols `P`, `Q`, with
  classifying site `(C, J, U)`, and let `U'` be `U` with `P` and `Q` exchanged, which is again a
  generic model of `T`; ClassifyingTopoi 2.4 gives a self-equivalence `e` with `U.map e.functor`
  isomorphic to `U'`. For this `e`, `ψ` sends the class of `T ∪ {⊤ ⊢ P}` to that of
  `T ∪ {⊤ ⊢ Q}`, a different class: a set with `P` true and `Q` false is a model of the first
  only. So (c), which chooses no equivalence, asserts less than (b).
- The theory of objects and its quotient `⊤ ⊢ x = y` (subsingletons) are not Morita
  equivalent: the first is classified by the functors from finite sets to sets, the presheaves on
  `FintypeCat.Skeleton.{u}ᵒᵖ` (ClassifyingTopoi 3.2), with a point for every set, the second by
  the Sierpiński topos (ClassifyingTopoi 2.5, Checks), with two points; the statement does not
  apply to them.
- Two presentations of the theory of objects, over the empty language and over a language with a
  `0`-ary relation symbol `P` and the axiom `⊤ ⊢ P`, have the same classifying site, the generic
  model of the second being that of the first with `P` interpreted as `⊤`. For `e` the identity,
  `ψ` sends the class of the quotient `⊤ ⊢ x = y` (subsingletons) of the first to the class of
  the quotient `⊤ ⊢ x = y` of the second.

### Examples

- By (a), the classes of quotients of the theory of commutative rings are the topologies on the
  opposite of the category of finitely presented rings, all of them being finer than the trivial
  one (ClassifyingTopoi 4.1, 4.2); the class of the theory of local rings is the Zariski topology
  (ClassifyingTopoi 4.3).

### Dependencies

Layer 3; ClassifyingTopoi 1.1, 1.3, 1.4, 2.1, 2.4, 2.5, 2.6; GrothendieckTopoi 4.2.

## Downstream consumers

None.

## Research context

Caramello's method of topos-theoretic bridges transfers information between two theories
classified by the same topos through invariants of that topos, computed on each presentation
(Caramello 2010, a preprint, §6, pp. 16–17; the transfer of quotients along a Morita equivalence,
4.1 here, is its example in §8, p. 29). The present roadmap provides the smallest cases in which
the readings are classical: presheaf topoi, where the invariants « De Morgan topos » and
« Boolean topos » are read on the indexing category as the right Ore condition and as being a
groupoid (2.1, 2.2), and the poset of subtopoi, read on any site as the lattice of finer
topologies (3.1) and on any classifying site as the poset of classes of quotient theories (4.1).
The readings of other invariants, atomic, two-valued or locally connected topoi, are further
cases of the same method.

## References

- F. Borceux, D. Dejean, « Cauchy completion in category theory », *Cahiers Topologie Géom.
  Différentielle Catég.* 27 (1986), no. 2, 133–146. Numdam CTGDC_1986__27_2_133_0. Zbl 0587.18001.
- O. Caramello, « De Morgan classifying toposes », *Adv. Math.* 222 (2009), no. 6, 2117–2144.
  doi:10.1016/j.aim.2009.07.008. arXiv:0808.1519 (cited in the numbering and pages of arXiv
  version 1).
- O. Caramello, *Theories, Sites, Toposes: Relating and Studying Mathematical Theories through
  Topos-Theoretic 'Bridges'*, Oxford University Press, 2017.
  doi:10.1093/oso/9780198758914.001.0001. Its chapter « Lattices of theories » is arXiv:0905.0299
  (cited as Caramello 2017, « Lattices of theories », in the numbering and pages of arXiv
  version 1).
- O. Caramello, « The unification of Mathematics via Topos Theory », preprint, arXiv:1006.3930
  (cited as Caramello 2010, in the pages of arXiv version 1). Research context only.
- H. Lindner, « Morita equivalences of enriched categories », *Cahiers Topologie Géom.
  Différentielle* 15 (1974), no. 4, 377–397. Numdam CTGDC_1974__15_4_377_0. Zbl 0319.18006.
