# Roadmap: topos-theoretic bridges

**Summary.** Build the method of topos-theoretic bridges: a property of topoi that is invariant
under equivalence, read on two presentations of the same topos, gives a correspondence between
two properties of the presentations. The carriers are small categories `C D : Type u` with
`[SmallCategory C]`, their presheaf topoi `Cᵒᵖ ⥤ Type u` and Karoubi envelopes `Karoubi C`;
small sites `(C, J)` with `Sheaf J (Type u)` and the complete lattice `GrothendieckTopology C`;
and geometric theories with their classifying sites and Morita equivalence (ClassifyingTopoi 2.1,
2.6). The end theorems are: two small categories have equivalent presheaf topoi exactly when their
Karoubi envelopes are equivalent, `MoritaEquivalentCat C D ↔ Nonempty (Karoubi C ≌ Karoubi D)`;
being a groupoid and satisfying the right Ore condition are invariant under this equivalence; for
small sites `(C, J)` and `(D, K)`, an equivalence `Sheaf J (Type u) ≌ Sheaf K (Type u)` gives an
order isomorphism `Set.Ici J ≃o Set.Ici K` between the topologies finer than `J` and those finer
than `K`; and two Morita-equivalent geometric theories have isomorphic lattices of quotient
theories.

Suggested home: `TauCeti/CategoryTheory/Topos/Bridges/`.

## Scope and ownership

**Owned here.** Morita equivalence of small categories, defined by the equivalence of their presheaf
topoi, and its characterization by Karoubi envelopes (Layer 1); the right Ore condition on a
category, and the invariance of the right Ore condition and of being a groupoid under Morita
equivalence (Layer 2); the transfer of the lattice of finer topologies along an equivalence of
sheaf topoi (Layer 3); and the transfer of the lattice of quotient theories along a Morita
equivalence of geometric theories (Layer 4). A search of the roadmaps on main, of the open pull
requests and of the maintainers' packages for Morita equivalence of small categories, Cauchy
completion of categories, the right Ore condition and the amalgamation property finds no other
owner: the Morita equivalences of DGAInfinity, HilbertModules and GrothendieckEulerForms are for dg
categories, C*-algebras and rings; ClusterAlgebras proves the Ore conditions for one family of
rings; LocallyPresentableCategories 1.7 characterizes the small accessible categories by
`IsIdempotentComplete`, which this roadmap uses and does not restate.

**Left to GrothendieckTopoi.** Grothendieck topoi, subtopoi and the correspondence between subtopoi
of `Sheaf J (Type u)` and topologies `J' ≥ J` (GrothendieckTopoi 4.1, 4.2), on which 3.1 rests;
presheaf topoi among Grothendieck topoi and rigid topologies (GrothendieckTopoi 6.5, 6.6).

**Left to ClassifyingTopoi.** Geometric theories, classifying sites, the duality between quotient
theories and topologies finer than a classifying topology, and Morita equivalence of theories
(ClassifyingTopoi 2.1, 2.5, 2.6), on which Layer 4 rests.

**Supplied by Mathlib.** Karoubi envelopes, their universal property and idempotent completeness
(`CategoryTheory.Idempotents.Karoubi`, `toKaroubi`, `IsIdempotentComplete`, `karoubiUniversal`),
groupoids (`IsGroupoid`), sites, sheaves and the complete lattice of Grothendieck topologies.

## Conventions

1. **Size.** Small categories live in `Type u` with `[SmallCategory C]`, and their presheaves take
   values in `Type u`; topoi of sheaves are `Sheaf J (Type u)` for `C : Type u`. Morita
   equivalence compares categories of the same universe. Witness: the presheaf topoi of
   `Discrete PUnit` and `Discrete (Fin 2)` are `Type u` and `Type u × Type u` up to equivalence;
   the terminal object `(PUnit, PUnit)` of the second is the coproduct of the two nonzero objects
   `(PUnit, PEmpty)` and `(PEmpty, PUnit)`, while `PUnit` is not a coproduct of two nonempty
   types, so the two categories are not Morita equivalent.
2. **Right Ore condition.** `IsRightOre C` says that every cospan `f : a ⟶ c`, `g : b ⟶ c` is
   completed by some `h : d ⟶ a`, `k : d ⟶ b` with `h ≫ f = k ≫ g`; a category has the
   amalgamation property, every span completed to a commuting square, exactly when its opposite
   satisfies the right Ore condition. Witness: `WalkingCospan` fails it, since no object has
   arrows to both `left` and `right`; any category with pullbacks satisfies it.
3. **Composition.** Mathlib's diagrammatic order `f ≫ g`; the square of Convention 2 reads
   `h ≫ f = k ≫ g`. Witness: in a poset with meets, `h` and `k` are the two projections of
   `a ⊓ b`, and the equation is an equality of arrows `a ⊓ b ⟶ c`.

## Exact supplier contracts

**From Mathlib**

- `CategoryTheory.Idempotents.Karoubi C`, `CategoryTheory.Idempotents.toKaroubi C`,
  `CategoryTheory.Idempotents.IsIdempotentComplete C`, and
  `CategoryTheory.Idempotents.karoubiUniversal`: for idempotent complete `D`, precomposition with
  `toKaroubi C` is an equivalence `(Karoubi C ⥤ D) ≌ (C ⥤ D)`.
- `CategoryTheory.IsGroupoid C`; `CategoryTheory.Equivalence`;
  `CategoryTheory.Functor.FullyFaithful`.
- `CategoryTheory.GrothendieckTopology C` with its `CompleteLattice` instance,
  `CategoryTheory.Sheaf J (Type u)`, `sheafToPresheaf`, `presheafToSheaf`; `Set.Ici`, `OrderIso`.

**From Tau Ceti**

Nothing is consumed from the Tau Ceti library.

**From GrothendieckTopoi**

- 4.1: subtopoi of a Grothendieck topos, as full reflective subcategories with left exact
  reflector.
- 4.2: the order-reversing bijection between subtopoi of `Sheaf J (Type u)` and topologies
  `J' ≥ J`, through `Sheaf J' (Type u)` and `sheafToPresheaf J ⋙ presheafToSheaf J'`.

**From ClassifyingTopoi**

- 2.1: classifying sites `(C, J, U)` of a geometric theory `T`.
- 2.5: `IsClassifyingSite.exists_quotient_topology` and `IsClassifyingSite.exists_quotient_theory`,
  the duality between quotients of `T` and topologies `J' ≥ J`.
- 2.6: `MoritaEquivalent T T'`.

## How to read the build

Layer 1 works on presheaf topoi of small categories only and proves the Karoubi criterion for their
equivalence. Layer 2 uses Layer 1 to read two invariants, being a groupoid and the right Ore
condition, on any two Morita-equivalent small categories. Layer 3 passes from presheaf topoi to
sheaf topoi of small sites and transfers the lattice of finer topologies, through GrothendieckTopoi
4.2. Layer 4 passes from sites to geometric theories and transfers the lattice of quotient
theories, through ClassifyingTopoi 2.5 and 2.6 and Layer 3. Each layer is a bridge in Caramello's
sense: an invariant of topoi, its reading on each presentation, and the correspondence that results.

## Layer 1: Morita equivalence of small categories

### 1.1 The definition

Define `MoritaEquivalentCat C D` for `C D : Type u` with `[SmallCategory C]` and
`[SmallCategory D]`: there is an equivalence `(Cᵒᵖ ⥤ Type u) ≌ (Dᵒᵖ ⥤ Type u)`. Prove that it is
reflexive, symmetric and transitive, and that equivalent small categories are Morita
equivalent.
*Needs:* Mathlib `Functor`, `Equivalence`, `Equivalence.congrLeft`.

**Checks.**

- A category `C` and the category obtained by adding to `C` an object isomorphic to one of its
  objects are equivalent, hence Morita equivalent; a definition by isomorphism of categories, or by
  the number of objects, would separate them.
- `Discrete PUnit` and `Discrete (Fin 2)` are not Morita equivalent (Convention 1); a definition
  by the existence of an essentially surjective functor `C ⥤ D` would accept them, through
  `Discrete (Fin 2) ⥤ Discrete PUnit`.
- The one-object category with monoid `{1, e}`, `e` idempotent, and the category with two objects
  `A`, `B` and arrows `r : A ⟶ B`, `s : B ⟶ A` with `s ≫ r = 𝟙 B` are Morita equivalent but not
  equivalent: the first has one isomorphism class of objects and the second two. A definition by
  equivalence of the categories themselves would separate them.

### 1.2 The Karoubi criterion

Prove `moritaEquivalentCat_iff_karoubi`:
`MoritaEquivalentCat C D ↔ Nonempty (Karoubi C ≌ Karoubi D)`. The presheaf topos of `C` is
equivalent to that of its Cauchy completion, the full subcategory of retracts of representable
presheaves, and that completion consists exactly of the absolutely presentable presheaves, whose
representable functor preserves all small colimits (Borceux–Dejean 1986, Theorem 1 (4), pp. 133–134,
and Proposition 2, pp. 134–135). Route, backward: `Karoubi C ≌ Karoubi D` gives
`(Karoubi C)ᵒᵖ ⥤ Type u ≌ (Karoubi D)ᵒᵖ ⥤ Type u`, and `karoubiUniversal` at `D = Type u`, which is
idempotent complete, with `(Karoubi C)ᵒᵖ ≌ Karoubi Cᵒᵖ`, identifies the first with `Cᵒᵖ ⥤ Type u`.
Forward: an equivalence of presheaf topoi preserves the absolutely presentable objects, an intrinsic
class; these are the retracts of representables, which form a category equivalent to `Karoubi C`
through the Yoneda embedding extended to `Karoubi C`.
*Needs:* 1.1; Mathlib `Karoubi`, `toKaroubi`, `karoubiUniversal`, `IsIdempotentComplete`,
`yoneda`, `PreservesColimitsOfSize`.

**Checks.**

- For idempotent complete `C`, `toKaroubi C` is an equivalence, and the criterion reduces to: two
  idempotent complete small categories are Morita equivalent exactly when they are equivalent.
  Applied to `Discrete PUnit` and `Discrete (Fin 2)`, idempotent complete, it confirms the second
  Check of 1.1.
- For the monoid `{1, e}` of the third Check of 1.1, `Karoubi` has the two objects `(⋆, 𝟙)` and
  `(⋆, e)`, with `e` the only arrow `(⋆, 𝟙) ⟶ (⋆, e)` and the only arrow back, and `e` the identity
  of `(⋆, e)`: it is the two-object category there, with `r = s = e`, and the criterion gives the
  Morita equivalence of that Check.
- The criterion does not say `C ≌ D`: `C` and `Karoubi C` are Morita equivalent and are not
  equivalent when `C` has an idempotent that does not split. A forward direction stated with
  `C ≌ D` would be false on the monoid `{1, e}`.

### Examples

- Every small category is Morita equivalent to its Karoubi envelope.
- Two groups are Morita equivalent as one-object categories exactly when they are isomorphic: a
  group is idempotent complete, and an equivalence of one-object categories is an isomorphism of
  automorphism groups.

### Dependencies

Mathlib only. Within the layer, 1.2 uses 1.1.

## Layer 2: invariants of presheaf topoi

### 2.1 Groupoids

Prove `isGroupoid_iff_of_moritaEquivalentCat`: if `MoritaEquivalentCat C D`, then
`IsGroupoid C ↔ IsGroupoid D`. Route: in a groupoid every idempotent is an identity, so a groupoid
is idempotent complete and `C ≌ Karoubi C`; by 1.2, `D` embeds fully faithfully in
`Karoubi D ≌ Karoubi C ≌ C`, and a full subcategory of a groupoid is a groupoid.
*Needs:* 1.2; Mathlib `IsGroupoid`, `Functor.FullyFaithful`, `IsIdempotentComplete`.

**Checks.**

- A group as a one-object category and the trivial groupoid on two isomorphic objects with that
  automorphism group are Morita equivalent, and both are groupoids.
- `WalkingArrow` is not a groupoid, and neither is the Karoubi envelope of the monoid `{1, e}`,
  which has the non-invertible arrow `e`; the statement keeps them together.
- A version for `Cᵒᵖ` follows by duality, since `IsGroupoid C ↔ IsGroupoid Cᵒᵖ`; a statement that
  confused `C` with `Cᵒᵖ` would still hold here, and 2.2 is where the two differ.

### 2.2 The right Ore condition

Define `IsRightOre C` (Convention 2) and prove `isRightOre_iff_of_moritaEquivalentCat`: if
`MoritaEquivalentCat C D`, then `IsRightOre C ↔ IsRightOre D`. The topos `Cᵒᵖ ⥤ Type u` satisfies
De Morgan's law exactly when `C` satisfies the right Ore condition (Caramello 2009, the remark after
Theorem 1.7, p. 6), so the statement is the bridge of the invariant « De Morgan topos » across two
presentations by presheaves. Route through Layer 1: `IsRightOre` is invariant under equivalence; it
passes from `C` to `Karoubi C`, completing a cospan `f : (X, p) ⟶ (Z, r)`, `g : (Y, q) ⟶ (Z, r)` by
the completion `h, k` of its underlying cospan in `C` and the arrows `h ≫ p`, `k ≫ q` out of
`(d, 𝟙 d)`, since `p ≫ f = f` and `q ≫ g = g`; and back from `Karoubi C` to `C`, since
`toKaroubi C` is fully faithful and the apex `(d, e)` of a completion in `Karoubi C` can be replaced
by `d` with the same arrows.
*Needs:* 1.2; Mathlib `Karoubi`, `toKaroubi`.

**Checks.**

- `WalkingCospan` fails the condition (Convention 2), and so does its Karoubi envelope, which is
  equivalent to it; a statement with the arrows of the square in the other direction, completing
  spans, would make `WalkingCospan` satisfy it and `WalkingSpan` fail it.
- A poset satisfies it exactly when two elements below a common element have a common lower
  bound: the poset `{a, b < c}` with `a`, `b` incomparable fails it, and adding a least element
  makes it satisfy it. A terminal object does not help: `{a, b < c}` has one.
- A group satisfies it: for `f, g` in `G` take `h = 𝟙`, `k = f ≫ g⁻¹`. The monoid `ℕ` under addition
  satisfies it (`h = g`, `k = f` as numbers), while
  the free monoid on two letters `x`, `y` does not, since `w ≫ x = w' ≫ y` has no solution.

### Examples

- The free monoid on two letters fails the right Ore condition, and so does every category Morita
  equivalent to it; its presheaf topos is therefore not De Morgan.
- A group and every groupoid Morita equivalent to it satisfy it.

### Dependencies

Layer 1. Within the layer, 2.1 and 2.2 are independent.

## Layer 3: bridges between sites

### 3.1 The lattice of finer topologies

Prove `nonempty_orderIso_ici_of_sheafEquiv`: for small sites `(C, J)` and `(D, K)` with
`C D : Type u` and an equivalence `Sheaf J (Type u) ≌ Sheaf K (Type u)`, there is an order
isomorphism `Set.Ici J ≃o Set.Ici K`. The invariant is the lattice of subtopoi of a topos,
invariant under equivalence; its reading on each site is GrothendieckTopoi 4.2, by which the
subtopoi of `Sheaf J (Type u)` correspond, reversing order, to the topologies `J' ≥ J`
Route: compose the two order-reversing bijections of GrothendieckTopoi 4.2 with
the bijection of subtopoi induced by the equivalence, which preserves inclusion of subtopoi.
*Needs:* GrothendieckTopoi 4.1, 4.2; Mathlib `GrothendieckTopology`, `Sheaf`, `Set.Ici`,
`OrderIso`.

**Checks.**

- `J = K` and the identity equivalence give the identity of `Set.Ici J`.
- On `Discrete PUnit` the sieves on the one object are `∅` and the maximal sieve, so there are two
  topologies, `⊥` and `⊤`, matching the two subtopoi of `Type u`, itself and the degenerate one.
  `Discrete PUnit` and the one-object category of a nontrivial group have the topoi `Type u` and
  `G`-sets, which are not equivalent, and the statement does not apply to them.
- The isomorphism exchanges `⊤` with `⊤`, the topology of the degenerate subtopos, and `J` with
  `K`; a map that reversed order would send `J` to `⊤`.

### Examples

- For a small category `C`, the lattice of Grothendieck topologies on `C` is isomorphic to that on
  `Karoubi C`.
- For a space `X` and a basis `B` of its topology, the topologies on `Opens X` finer than the open
  cover topology and those on `B` finer than the induced topology form isomorphic lattices.

### Dependencies

GrothendieckTopoi 4.1, 4.2, and Layer 1 for the Examples.

## Layer 4: bridges between theories

### 4.1 Quotients of Morita-equivalent theories

Prove `MoritaEquivalent.quotientLattice`: if `MoritaEquivalent T T'` (ClassifyingTopoi 2.6), the
quotients of `T` and those of `T'`, ordered by inclusion of their consequences in every topos, form
isomorphic posets. The invariant is again the lattice of subtopoi; its readings are ClassifyingTopoi
2.5 on each classifying site (Caramello 2017, « Lattices of theories », Theorem 3.6, and the
definition of Morita equivalence there, Definition 3.5, p. 14, in the numbering of
arXiv:0905.0299v1). Route: 3.1 on classifying sites of `T` and `T'`, composed with the
bijections of ClassifyingTopoi 2.5.
*Needs:* 3.1; ClassifyingTopoi 2.1, 2.5, 2.6.

**Checks.**

- A theory and itself: the isomorphism is the identity.
- The theory of objects and its quotient `⊤ ⊢ x = y` (subsingletons) are not Morita
  equivalent: the first is classified by the presheaves on finite sets (ClassifyingTopoi 3.2),
  with a point for every set, the second by the Sierpiński topos (ClassifyingTopoi 2.5, Checks),
  with two points; the statement does not apply to them.
- Two presentations of the theory of objects, over the empty language and over a language with a
  `0`-ary relation symbol axiomatized to be true, are Morita equivalent, and their quotients
  correspond: the quotient `⊤ ⊢ x = y` (subsingletons) of the first is sent to the corresponding
  quotient of the second.

### Examples

- The quotients of the theory of commutative rings and the topologies on the opposite of the
  category of finitely presented rings finer than the trivial one (ClassifyingTopoi 4.1, 4.2).

### Dependencies

Layer 3; ClassifyingTopoi 2.1, 2.5, 2.6.

## Downstream consumers

None known: no roadmap on main or in an open pull request cites ToposTheoreticBridges.

## Research context

Caramello's method of topos-theoretic bridges proposes to transfer information between two theories
classified by the same topos through invariants of that topos, and to compute, for each invariant,
its reading on each presentation (Caramello 2017, « Lattices of theories », and Caramello 2009,
§1, for the invariant « De Morgan topos »). The present roadmap provides the
smallest cases in which the readings are classical: presheaf topoi, where the invariants « De Morgan
topos » and « Boolean topos » are read on the indexing category as the right Ore condition and as
being a groupoid, and the lattice of subtopoi, read on any site as the lattice of finer topologies
and on any classifying site as the lattice of quotient theories. Caramello proposes to implement
the method in a proof assistant, with databases of equivalences of topoi and of site-level
characterizations of invariants; the readings of other invariants, atomic, two-valued or locally
connected topoi, are the next cases of that programme.

## References

- F. Borceux, D. Dejean, « Cauchy completion in category theory », *Cahiers Topologie Géom.
  Différentielle Catég.* 27 (1986), no. 2, 133–146. Numdam CTGDC_1986__27_2_133_0. Zbl 0587.18001.
- O. Caramello, « De Morgan classifying toposes », *Adv. Math.* 222 (2009), no. 6, 2117–2144.
  doi:10.1016/j.aim.2009.07.008. arXiv:0808.1519 (cited in the numbering and pages of arXiv
  version 1).
- O. Caramello, « Lattices of theories », Chapter 4 of *Theories, Sites, Toposes*, Oxford
  University Press, 2017; arXiv:0905.0299 (cited in the numbering and pages of version 1).
