# Roadmap: classifying spaces of discrete groups

A group has a topological shadow. For a discrete group `G`, a `K(G, 1)` is a path-connected space
with fundamental group `G` and no higher homotopy, and among spaces of CW type it is determined by
`G` up to homotopy equivalence. Its singular homology is the group homology of `G`, so the algebraic
invariants Mathlib already defines are invariants of a space, and the covering-space theory of the
[universal-covers roadmap](../../Completed/UniversalCovers/README.md) becomes a tool for computing
them.

That roadmap ends with *recognition*: a space whose universal cover is weakly contractible is a
`K(G, 1)`, with circles and tori as examples. It leaves *construction* open, and says so. This
roadmap constructs one for an arbitrary group, twice.

**Both models are wanted.** The simplicial one, Milnor's countable join, is uniform in `G` and
needs no presentation; it is the shorter path to an unconditional existence theorem. The cellular
one, the presentation complex with higher cells attached, is the model every later homological
argument is written against, and it is what connects to cellular chains. Building both and
proving they agree is not duplication: the comparison is the theorem that makes "the" classifying
space well defined, and each model proves things about the other that are awkward in its own
terms. A third model, the realization of the nerve of `G` as a one-object category, is built by
the algebraic-topology roadmap; its comparison with the two models here, normalised to be the
identity on `G`, is also a theorem of this roadmap.

Suggested home: `TauCeti/AlgebraicTopology/ClassifyingSpace/`.

## Scope and completion criterion

The roadmap is complete when Tau Ceti supplies all of the following, for an arbitrary group `G`
with no finiteness, countability, presentation or torsion hypothesis, and with the naturality
stated in each clause.

1. Two constructions of a pointed space with fundamental group `G` and vanishing higher homotopy:
   the realization of the countable join of copies of `G` modulo the free `G`-action, and a
   cellular model built from a presentation. Each is proved path-connected, locally
   path-connected and semilocally simply connected, so that the classification theorems of the
   universal-covers roadmap apply to it, and each carries a CW structure.
2. Uniqueness: any two `K(G, 1)` spaces of the same group, *both* of CW type, are homotopy
   equivalent, by a homotopy equivalence realizing any prescribed isomorphism of fundamental
   groups; in particular the two models above agree, and both agree with the nerve model of the
   algebraic-topology roadmap. The hypothesis on both spaces cannot be weakened: a point and the
   Warsaw circle are both `K(1, 1)` spaces and are not homotopy equivalent.
3. Functoriality: a group homomorphism induces a map of classifying spaces, well defined up to
   homotopy, inducing the given homomorphism on fundamental groups, and respecting identities and
   composition in the homotopy category.
4. The comparison with algebra: the singular homology of the classifying space is Mathlib's
   `groupHomology`, and its cohomology with coefficients in a `G`-module is Mathlib's
   `groupCohomology`, naturally in the group and in the coefficients.

Groups are discrete throughout. `K(G, n)` for `n ≥ 2`, deloopings and spectra are not in scope.

The acceptance test `Suggested.lean` states the headline theorems that are statable at the pins:
the existence of a Hausdorff CW `K(G, 1)` for every group
(`exists_cwComplex_isEilenbergMacLaneSpaceOne`), the two-dimensional complex with fundamental
group `G` (`exists_cwComplex_dim_le_two_fundamentalGroup_mulEquiv`), the realization of
homomorphisms by pointed maps (`exists_continuousMap_mapOfEq_eq_of_isAspherical`), uniqueness
(`exists_homotopyEquiv_of_isAspherical`), and the homology and cohomology comparisons
(`nonempty_singularHomology_iso_groupHomology`, `nonempty_singularCohomology_iso_groupCohomology`).
The models themselves, their comparison and the resolution comparison are constructions and are
targets of this document only.

## Ownership and dependencies

This roadmap constructs classifying spaces and compares them with group cohomology. It builds no
covering-space theory, no realization theory of simplicial complexes and no general CW machinery:
the attachment of cells, the CW structure on the union of an expanding tower of CW complexes and
the killing of a homotopy group by attaching cells are consumed from the algebraic-topology
roadmap. It owns the two models (Stages 1 and 2), one piece of CW machinery that no other roadmap
owns, the transfer of CW structures along the quotient covering map of a free action (Stage 3,
item 13), the pointed comparison of the nerve model with the two models built here (Stage 3,
item 14), the chain-level comparison of the cellular chains of a universal cover with the bar
resolution (Stage 4, items 16 and 18), and the resulting identification of the (co)homology
comparisons of the three models (Stage 4, item 17). Everything else is owned elsewhere and cited
here.

- The [universal-covers roadmap](../../Completed/UniversalCovers/README.md), complete, owns
  the universal cover, deck transformations, quotient covers by a group action
  (Mathlib's `IsQuotientCoveringMap`), the Galois correspondence, the `π_n` API, and the
  recognition of `K(G, 1)` spaces from a weakly contractible universal cover (its item 14).
  Stage 1 below consumes its recognition criterion and its standing-hypothesis API rather than
  reproving them. Its convention is inherited: the deck group of the universal cover is the
  *opposite* of the fundamental group (its Stage 1 item 5), so the identification `π₁(BG) ≅ G`
  fixes a direction; Stage 1 item 5 fixes it, with a Check on `S₃` that detects the other choice.
- The [geometric-topology roadmap](../GeometricTopology/README.md), Layer 11, owns the polyhedron
  `|K|` of an abstract simplicial complex, its weak topology, and its realization API: maps
  induced by simplicial maps, restriction to a subset of the vertices, the factorization of a map
  out of a compact space through a finite vertex restriction, the contraction of a realized
  cone onto its apex, and the CW structure on `|K|` whose cells are the simplices, with its
  cellular chains the ordered simplicial chains. Stages 1, 3 and 4 consume those and add
  nothing general about realizations.
- The [algebraic-topology roadmap](../AlgebraicTopology/README.md) owns van Kampen through the
  fundamental groupoid with its group-presentation corollaries (its Stage 1 item 4), local
  coefficient systems (its Stage 2 item 6), CW pairs, cellular approximation, cofibrations,
  skeletal induction, the attachment of cells to a Hausdorff space, the CW structure on the union
  of an expanding tower of CW subcomplexes with its Hausdorffness and compact factorization, and
  the comparison between Mathlib's categorical and classical CW structures (its Stage 4 item 5),
  the CW structure of a realized simplicial set (its Stage 4 item 7), cellular chains and their
  comparison with singular homology, with constant and with local coefficients (its Stage 4
  items 1 to 3), CW approximation and spaces of CW type (its Stage 4 item 8), singular homology
  (its Stage 2), the Hurewicz and Whitehead theorems for spaces of CW type (its Stage 8 items 3
  and 5), the nerve model of the classifying space with its `K(G, 1)` property and its
  identification of `π₁` (its Stage 8 item 8a), and the construction that kills a homotopy group
  of a CW complex by attaching cells, with its connectivity and preserved-lower-group claims (its
  Stage 8 item 8c). Stage 2 below consumes van Kampen, the Stage 4 CW machinery and the killing
  construction; Stage 3 consumes Whitehead, CW type and the nerve model; Stage 4 consumes
  Hurewicz, the cellular comparison and the local coefficient systems. The algebraic-topology
  roadmap is a supplier of this roadmap; no target here is an input to any of its layers, and the
  comparison of its nerve model with the models here is owned here, not there.
- The [profinite-cohomology roadmap](../ProfiniteCohomology/README.md) owns continuous cohomology
  of profinite groups. The group cohomology compared here is Mathlib's discrete one; neither
  development introduces a second version of the other's objects.

## Inventory: what Mathlib and Tau Ceti already give

- **Group (co)homology.** `Mathlib/RepresentationTheory/Homological/GroupCohomology/` and
  `.../GroupHomology/` define the functors, their long exact sequences, low-degree descriptions,
  functoriality and Shapiro's lemma, over `Rep k G`. This roadmap compares against them and does
  not define a third theory.
- **The bar resolution.** `Mathlib/RepresentationTheory/Homological/Resolution.lean` defines
  `classifyingSpaceUniversalCover`, the simplicial `G`-set `[n] ↦ Gⁿ⁺¹` with the diagonal action,
  and the projective resolution it gives. That is the simplicial-set model of `EG`; it is a
  different object from the spaces built here, and the name is Mathlib's, so the spaces below
  take names in the `TauCeti` namespace. Stage 4 relates the two.
- **Singular homology and cohomology.** Mathlib supplies the singular homology functor on
  topological spaces, with values in modules over a commutative ring, together with its homotopy
  invariance; this roadmap consumes it from Mathlib as it stands. Tau Ceti's
  `TauCeti/AlgebraicTopology/Cohomology/` supplies singular cohomology `TopCat.singularCohomology`
  as the cohomology of the dual of the singular chains.
- **Simplicial complexes.** Mathlib's `AbstractSimplicialComplex`
  (`Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean`) is the abstract complex: a family of
  nonempty finite faces, closed under nonempty subsets and containing every singleton.
  `TauCeti/AlgebraicTopology/SimplicialComplex/` adds its realization with the weak topology, the
  combinatorial join and cone, subdivision and collapse. The realization theory this roadmap
  needs on top of that belongs to Layer 11 of the geometric-topology roadmap.
- **Covering spaces.** Mathlib's `IsQuotientCoveringMap` (`Mathlib/Topology/Covering/Quotient.lean`)
  is the predicate on the orbit map of a group action: a quotient map, a continuous action, and
  local disjointness of the translates of a neighbourhood. `TauCeti/AlgebraicTopology/UniversalCover/`
  and `TauCeti/AlgebraicTopology/EilenbergMacLane/` supply the universal cover, its deck group,
  `IsAspherical`, `IsEilenbergMacLaneSpaceOne` and the recognition theorems.
- **Presented groups.** `Mathlib/GroupTheory/PresentedGroup.lean` and
  `Mathlib/GroupTheory/FreeGroup/` supply presentations, free groups and their universal property.
  Every group has the tautological presentation on its own elements, so Stage 2 needs no
  finiteness hypothesis.

## Stage 1: the simplicial model

Milnor's construction: the countable join of copies of `G`, realized with the weak topology, is
weakly contractible and carries a free `G`-action whose orbit map is a covering. The realization
is written `EG`, the orbit space `BG`, the orbit map `p_G : EG → BG`.

1. **The countable join complex.** For a family `A : ℕ → Type u`, the abstract simplicial complex
   on `Σ i, A i` whose faces are the nonempty finite sets meeting each index at most once
   (Milnor 1956, the join `G * G * ⋯`; Segal 1968, §2, the remark comparing `BG` with Milnor's
   join). Give its face and barycentric-coordinate descriptions, the simplicial maps induced by
   maps of the families, and the inclusions of the subjoins on a finite set of indices. For the
   constant family `A i = G` write `EG` for the realization, based at the vertex `(0, 1)`.
   *Needs:* Mathlib `AbstractSimplicialComplex`; GeometricTopology Layer 11 (the realization
   `|K|`, the maps induced by simplicial maps, the restriction to a set of vertices).

   **Checks.**
   - For the trivial group the faces are all nonempty finite subsets of the vertex set
     `{(i, 1) : i ∈ ℕ}`: the infinite simplex. A definition asking each face to meet *every*
     index would have no finite faces at all.
   - For `G = ℤ/2`, written additively with elements `0` and `1`, the set `{(0, 0), (0, 1)}` is
     not a face (two vertices at index `0`) and
     `{(0, 0), (1, 1)}` is a face. A definition that forgot the one-vertex-per-index condition
     would admit the first, and the translates of an open star in item 3 would then meet.
   - For a family with `A i` empty for every `i` the vertex set is empty and the complex has no
     faces; the realization is empty and item 2 does not apply to it.
2. **Weak contractibility.** When `A i` is nonempty for infinitely many `i`, the realization is
   path-connected and all its homotopy groups vanish. The argument: a generalized loop has
   compact image, so by Layer 11 it factors through the restriction to finitely many vertices
   (the weak-topology form of Hatcher, Proposition A.1, p. 520); choose an index no face of that
   restriction touches, and cone the loop off there. Package the dimension-one case as
   `SimplyConnectedSpace`. *Needs:* GeometricTopology Layer 11 (the factorization of a map out of
   a compact space through a finite vertex restriction, the contraction of a realized cone onto
   its apex); Mathlib `HomotopyGroup`, `SimplyConnectedSpace`.
3. **The action and the orbit cover.** The left action `h • (i, g) = (i, h * g)`, its action laws,
   the continuity of each translation, and freeness. The sets where the coordinate at `(i, g)` is
   positive are open, and their translates by distinct group elements are disjoint, because a face
   meets each index at most once; that is the local disjointness `IsQuotientCoveringMap` asks for.
   A group freely permuting the simplices of a complex acts as a covering space action: Hatcher,
   Example 1B.7, p. 89, makes this argument for the nerve model and it is the same for the join.
   `BG` is the orbit space with the quotient topology, `p_G` the orbit map, `b₀` the class of
   `(0, 1)`. Give the quotient the API a user needs without unfolding it: two points have the same
   image exactly when a unique group element carries one to the other, the fibre over a point is
   an orbit, a continuous `G`-invariant map descends, and `G ≃* Deck(p_G)` compatibly with the
   action. *Needs:* Mathlib `MulAction`, `MulAction.orbitRel`, `IsQuotientCoveringMap`;
   GeometricTopology Layer 11 (barycentric coordinates are continuous on `|K|`); Tau Ceti
   `TauCeti.Deck.IsQuotientCoveringMap.deckMulEquiv` (the acting group of a quotient covering map
   with preconnected nonempty total space is its deck group, by translation).
4. **The standing hypotheses.** Total space and orbit space are path-connected and locally
   path-connected: a closed simplex is convex, hence locally path-connected, the realization is a
   quotient of the disjoint union of its closed simplices, and the orbit space is a quotient of
   the realization, so `Topology.IsQuotientMap.locallyPathConnectedSpace` applies at each step.
   The orbit space is semilocally simply connected because it is covered by a simply connected
   space. *Needs:* (2), (3); Mathlib `Topology.IsQuotientMap.locallyPathConnectedSpace`;
   GeometricTopology Layer 11 (`|K|` is the quotient of the disjoint union of its closed
   simplices); Tau Ceti `TauCeti.SemilocallySimplyConnectedSpace.of_isCoveringMap` (the base of a
   surjective covering map with simply connected total space is semilocally simply connected).
5. **It is a `K(G, 1)`.** With (2), (3), (4) and the recognition criterion of the universal-covers
   roadmap (its item 14): `π₁(BG, b₀) ≃* G` and the higher homotopy groups vanish, so
   `IsEilenbergMacLaneSpaceOne G BG b₀`. The direction of the isomorphism is fixed as follows.
   For a loop `γ` at `b₀` write `m(γ)` for the label of the end point `(0, m(γ))` of its lift
   starting at `(0, 1)`. Under Mathlib's `FundamentalGroup.mul_def`, `p * q = q.trans p` runs `q`
   first; its lift runs the lift of `q` to `(0, m(q))` and then `m(q)` times the lift of `p`, ending
   at `(0, m(q) * m(p))`, so `m(p * q) = m(q) * m(p)` and the label is an anti-homomorphism. The
   isomorphism `π₁(BG, b₀) ≃* G` is `γ ↦ m(γ)⁻¹`. It is the composite of the inversion
   `π₁ ≃* π₁ᵐᵒᵖ`, the inverse of Tau Ceti's `TauCeti.UniversalCover.deckFundamentalGroupEquiv`
   (`Deck ≃* π₁ᵐᵒᵖ`, whose inverse sends the class of `γ` to the deck transformation carrying the
   base lift to the end point of the lift of `γ`), and the inverse of `G ≃* Deck(p_G)` of (3):
   `γ ↦ γ⁻¹ ↦ (translation by m(γ⁻¹) = m(γ)⁻¹) ↦ m(γ)⁻¹`. Items 11, 16 and 17 inherit this choice.
   State the unconditional existence theorem for an arbitrary group, and identify `p_G`, with
   its chosen base point, with the based-path universal cover by a pointed homeomorphism over the
   base. *Needs:* (2), (3), (4); UniversalCovers item 14; Tau Ceti
   `TauCeti.UniversalCover.deckFundamentalGroupEquiv` (the deck group of the universal cover is
   the opposite of `π₁`), `IsEilenbergMacLaneSpaceOne`, `IsAspherical`.

   **Checks.**
   - `G = S₃`, `s = (1 2)`, `t = (2 3)`, and loops `ℓ_s`, `ℓ_t` with `m(ℓ_s) = s`, `m(ℓ_t) = t`:
     `m(ℓ_s * ℓ_t) = t * s`, while `s * t ≠ t * s`. The map `γ ↦ m(γ)⁻¹` sends `ℓ_s * ℓ_t` to
     `(t * s)⁻¹ = s⁻¹ * t⁻¹ = s * t`, the product of the images; the map `γ ↦ m(γ)` would send it
     to `t * s ≠ s * t` and is not a homomorphism. An abelian group cannot detect this.
   - `G = ℤ`, written additively, so the base vertex is `(0, 0)`: the loop whose lift ends at
     `(0, 1)` goes to `−1`. The sign is invisible to the `S₃`
     test, and the `S₃` test is invisible to this one; both are needed.
   - `G = 1`: `BG = EG` is the infinite simplex, contractible; the isomorphism is the unique map.
6. **Functoriality.** For `φ : G →* H` the induced maps on `EG` and `BG`: continuity, preservation
   of base points, compatibility with the orbit maps, and the identity and composition laws. Under
   the isomorphisms of (5) the induced map on fundamental groups is `φ`: the lift of the image
   loop ends at `(0, φ(m(γ)))`, and inversion commutes with `φ`. This functoriality is strict, not
   just up to homotopy; Stage 3's is the homotopy-invariant statement that applies to any model.
   *Needs:* (1), (3), (5); GeometricTopology Layer 11 (the map `|f|` induced by a simplicial map,
   with its identity and composition laws).

## Stage 2: the cellular model

The presentation complex, with higher cells attached to kill the homotopy the presentation does
not control.

7. **The presentation complex.** For a group presentation, generators `S` and relators
   `R ⊆ FreeGroup S`, the complex with one vertex, a one-cell for each generator and a two-cell
   attached along each relator. Prove that its fundamental group is `PresentedGroup R`, by the
   group-presentation corollary of van Kampen (Hatcher, Corollary 1.28, p. 52); the
   wedge-of-circles case is the free group. Applied to the tautological presentation of `G`, with
   a generator `x_g` for every `g ∈ G` and the relator `x_g * x_h * x_{g h}⁻¹` for every pair
   `(g, h)`, this is the headline `exists_cwComplex_dim_le_two_fundamentalGroup_mulEquiv`: every
   group is the fundamental group of a path-connected Hausdorff CW complex with no cells above
   dimension two.
   *Needs:* AlgebraicTopology Stage 1 item 4 (the group-presentation corollary of van Kampen) and
   Stage 4 item 5 (attaching cells to a Hausdorff CW complex gives a Hausdorff CW complex);
   Mathlib `PresentedGroup`, `FreeGroup`, `Topology.CWComplex`.

   **Checks.**
   - `R = ∅`: the wedge of circles indexed by `S`, with fundamental group `FreeGroup S`. A
     definition attaching the two-cells along the generators instead of the relators would give
     a wedge of disks, which is simply connected.
   - `S = ∅`: a point, with trivial fundamental group.
   - `S = {a}`, `R = {aⁿ}` with `n ≥ 1`: the disk with its boundary wrapped `n` times around a
     circle, with fundamental group `ℤ/n`; for `n = 1` the complex is contractible.
   - The tautological presentation of the trivial group has one generator `x` and, for the pair
     `(1, 1)`, the relator `x * x * x⁻¹`, which reduces to `x`; so the complex is a disk. A
     definition that omitted that relator would give a circle, whose fundamental group is not
     trivial.
8. **Killing a homotopy group.** For a Hausdorff CW complex `Y` and `n ≥ 2`, the complex obtained
   by attaching `(n + 1)`-cells along a generating family of `π_n(Y)`: the inclusion is an
   isomorphism on `π_k` for `k < n` and kills `π_n`. Cellular approximation and the compactness of
   a sphere's image supply both halves (Hatcher, Example 4.16, p. 354, the first step of a
   Postnikov tower; Proposition A.1, p. 520, for compactness). This construction, with its
   connectivity and preserved-lower-group claims, is owned by AlgebraicTopology Stage 8 item 8c
   and is consumed here, not reproved: this roadmap only applies it to the presentation complex.
   *Needs:* AlgebraicTopology Stage 8 item 8c (the higher-cell killing construction) and Stage 4
   item 5 (cellular approximation, attaching cells to a Hausdorff CW complex); UniversalCovers
   (the `π_n` API); Mathlib `HomotopyGroup`.
9. **The tower and its union.** Iterating (8) from the presentation complex gives an expanding
   sequence of Hausdorff CW complexes, each a subcomplex of the next. Its union with the final
   topology carries the classical `CWComplex (Set.univ : Set _)` structure of AlgebraicTopology
   Stage 4 item 5, whose cells are the disjoint union of the cells added at each stage, and is
   Hausdorff; the same item supplies that a map from a compact space into the union factors
   through a finite stage. Prove that the union has the fundamental group of the presentation
   complex and no higher homotopy: a map from a sphere or a cube factors through a finite stage,
   where (8) applies (Hatcher, Example 4.16, p. 354; Proposition A.1, p. 520). *Needs:* (7),
   (8); AlgebraicTopology Stage 4 item 5 (the CW structure on the union of a tower of
   subcomplexes, its Hausdorffness, and compact factorization through a finite stage); Mathlib
   `Topology.CWComplex`.
10. **A cellular `K(G, 1)` for any group.** Feed the tautological presentation of `G` into (7) and
    the tower into (9). State the existence theorem and its standing hypotheses in the same form
    as Stage 1's, so that the two are comparable statements and not merely two constructions.
    Either model proves the headline `exists_cwComplex_isEilenbergMacLaneSpaceOne`: a Hausdorff CW
    `K(G, 1)` exists for every group `G`, with no hypothesis beyond `Group G`; for the simplicial
    model the CW structure is Stage 3 item 13. *Needs:* (7), (9); Tau Ceti
    `IsEilenbergMacLaneSpaceOne`.

## Stage 3: uniqueness and the comparison of the models

11. **Maps out of a CW complex into an aspherical space.** For a path-connected Hausdorff CW
    complex `X` with base point `x` and any space `Y` with base point `y` that is aspherical
    (`IsAspherical Y y`), every homomorphism `π₁(X, x) →* π₁(Y, y)` is induced by a pointed map,
    unique up to homotopy relative to the base point (Hatcher, Proposition 1B.9, p. 90; the
    headline `exists_continuousMap_mapOfEq_eq_of_isAspherical`). The source is any connected CW
    complex, not only a cellular `K(G, 1)`; the target needs no CW structure. This is the
    obstruction-theoretic step, proved by extending over skeleta: a one-cell goes to a loop
    representing the image of its class, a two-cell's boundary is a relation in `π₁(X)` and so
    maps to a null-homotopic loop, and over a cell of dimension `n ≥ 3` the extension problem is
    solvable because `π_{n−1}(Y) = 0`; uniqueness is the same argument for `X × [0, 1]` relative
    to `X × {0, 1} ∪ {x} × [0, 1]`. With the identifications of (5) and (10), every `φ : G →* H`
    is induced by a pointed map between any two CW models, unique up to pointed homotopy.
    *Needs:* AlgebraicTopology Stage 4 item 5 (skeletal induction, the homotopy extension
    property of a CW pair); UniversalCovers (the `π_n` API); Mathlib `FundamentalGroup.mapOfEq`,
    `ContinuousMap.HomotopicRel`; Tau Ceti `IsAspherical`.
12. **Uniqueness.** Two `K(G, 1)` spaces of the same group, both of CW type (homotopy
    equivalent to a CW complex, in the algebraic-topology roadmap's sense), are homotopy
    equivalent, by an equivalence inducing any prescribed isomorphism on fundamental groups
    (Hatcher, Theorem 1B.8, p. 90; for Hausdorff CW complexes the headline
    `exists_homotopyEquiv_of_isAspherical`). First replace the source by a homotopy equivalent CW
    complex, transporting the prescribed isomorphism along the equivalence together with the
    change of base point it forces (the equivalence is not pointed). By (11) a pointed map
    realizing the isomorphism exists and is a weak homotopy equivalence; Whitehead's theorem makes
    it a homotopy equivalence, and this is where CW type is needed on *both* sides. Without it the
    statement is false: a point and the Warsaw circle are both path-connected with trivial
    homotopy groups, but the Warsaw circle is not contractible (Schwamberger–Vogt 2009, §2).
    Deduce that the classifying space is well defined in the homotopy category of spaces of CW
    type. *Needs:* (11); AlgebraicTopology Stage 8 item 5 (Whitehead's theorem for Hausdorff CW
    complexes and spaces of CW type) and Stage 4 item 8 (spaces of CW type); Mathlib
    `ContinuousMap.HomotopyEquiv`.

    **Checks.**
    - `G = 1`: an aspherical Hausdorff CW complex with trivial fundamental group is contractible.
    - The Warsaw circle: path-connected, every homotopy group trivial, not contractible, so a
      statement without the CW-type hypothesis on the second space is false. It is the negative
      control, and it is not a CW complex, so the theorem does not apply to it.
13. **CW structures and coverings.** Let `p : E → B` be the quotient covering map of a free
    action of `G` on `E` (`IsQuotientCoveringMap p G`). (Brown, *Cohomology of Groups*, §I.4,
    free `G`-CW complexes; tom Dieck, *Transformation Groups*, §II.1, `G`-CW complexes and their
    orbit spaces.)
    - If `B` is a Hausdorff CW complex, `E` carries the lifted CW structure: its `n`-cells are
      the lifts of the characteristic maps of the `n`-cells of `B`, which exist and are
      determined by the lift of one point because a disk is simply connected and locally
      path-connected. `G` permutes these cells freely, with exactly one orbit over each cell of
      `B`, and `p` is cellular.
    - If `E` is a Hausdorff CW complex, each element of `G` carries every open cell onto an
      open cell, and `G` acts freely on the set of cells (`g • e = e` only for `g = 1`), then
      `B` is a Hausdorff CW complex whose `n`-cells are the `G`-orbits of `n`-cells of `E`, with
      characteristic maps `p ∘ φ` for a chosen representative `φ` of each orbit, and `p` is
      cellular.

    In both cases the cellular chain complex of `E` is a complex of free `ℤ[G]`-modules, with
    basis one chosen lift of each cell of `B`. Applied to Stage 1, with the CW structure on
    `|K|` from Layer 11 (which `G` permutes because it acts by simplicial automorphisms, freely
    on simplices because `g ≠ 1` changes every vertex label), the second case makes
    `BG` a CW complex whose `n`-cells are the `G`-orbits of `n`-simplices of the
    countable join. Applied to the universal cover of the cellular model
    of Stage 2, the first case gives its lifted CW structure. *Needs:* Mathlib
    `IsQuotientCoveringMap`, `Topology.CWComplex`, `IsCoveringMap.liftPath` (path lifting);
    UniversalCovers Stage 2 item 6 (the general lifting criterion, for lifting a characteristic
    map); GeometricTopology Layer 11 (the CW structure on `|K|`
    and the action of a simplicial automorphism on its cells); AlgebraicTopology Stage 4 item 1
    (cellular chains).

    **Checks.**
    - `G = ℤ` acting on `E = ℝ` by translation over `B = S¹` with one `0`-cell and one `1`-cell:
      the lifted structure has the integers as `0`-cells and the unit intervals as `1`-cells, one
      `ℤ`-orbit of each; the cellular complex is `ℤ[ℤ] → ℤ[ℤ]`, `1 ↦ t − 1`. A definition taking
      all lifts of a point as one cell would not be a CW structure at all.
    - `G = 1`: both constructions return the given structure.
    - Negative control for the second case: `ℤ` acting on `ℝ² ∖ {0}` by `(x, y) ↦ (2x, y/2)` is
      free with a quotient covering map, but the orbit space is not Hausdorff, so no CW structure
      on `ℝ² ∖ {0}` is permuted by this action with a free action on cells; the cellular
      hypothesis cannot be dropped in favour of freeness alone.
    - The free `ℤ[G]`-module of `n`-chains of `E` has rank the number of `n`-cells of `B`: for
      the join of the trivial group, every rank is one.
14. **The models agree.** By (13) the simplicial model of Stage 1 is a CW complex, and
    therefore by (12) it is homotopy equivalent to the cellular model of Stage 2, compatibly
    with the identifications of the fundamental group. Give the homotopy equivalence and its
    inverse up to homotopy, not only an existence statement.

    The nerve model of AlgebraicTopology Stage 8 item 8a, the realization of the nerve of `G` as
    a one-object category with its CW structure and its identification of `π₁` with `G` (the edge
    labelled `g` goes to `g`), is a Hausdorff CW `K(G, 1)`, so (12) also gives pointed homotopy
    equivalences `c_G` from it to each of the two models here. Normalise them by requiring that
    the identification of (5), respectively (10), composed with `π₁(c_G)`, is the nerve model's
    identification, so that the induced map on `G` is the identity; by (11) each `c_G` is then
    unique up to pointed homotopy. Prove that `c_G` is natural in `G` up to pointed homotopy for
    the strict functoriality of (6) and the nerve model's, and state the conversion between the
    left deck action of (3) and the universal-covers roadmap's `Deck ≃* π₁ᵐᵒᵖ`, including the
    inversion of (5), so that the two identifications of `π₁` with `G` are compared on the nose
    and not up to an unmarked automorphism. *Needs:* (5), (6), (10), (11), (12), (13);
    AlgebraicTopology Stage 8 item 8a (the nerve model, its CW structure through Stage 4 item 7,
    its `K(G, 1)` property and its identification of `π₁`).

    **Checks.**
    - `G = 1`: all three models are contractible CW complexes and every comparison is a homotopy
      equivalence to a point.
    - `G = ℤ/2`: the inversion in the normalisation is invisible; `G = S₃` with the loops of
      item 5's Check detects a comparison normalised to inversion instead of the identity.
15. **Homotopy functoriality.** The classifying space is a functor from groups to the pointed
    homotopy category, and the strict functoriality of Stage 1.6 refines it. *Needs:* (6),
    (11), (14).

## Stage 4: group homology and cohomology

16. **The chain-level comparison.** For a `K(G, 1)` CW complex `B` with universal cover `E`,
    and any CW structure on `E` for which each element of `G` carries open cells onto open cells
    and `G` acts freely on the set of cells (the lifted one of (13) always qualifies), the
    augmented cellular chain complex of `E` is a free resolution of the trivial module `ℤ` over
    `ℤ[G]`, packaged as a `ProjectiveResolution (Rep.trivial ℤ G ℤ)` (Brown, *Cohomology of
    Groups*, §I.4). The `G`-action is the deck action, transported along the isomorphism
    `G ≃* Deck(E)` defined from the chosen `Ψ : π₁(B, b) ≃* G` ((5) for the simplicial model,
    (10) for the cellular one): `g` acts by the deck transformation carrying the base point of
    `E` to the end point of the lift of a loop `γ` with `Ψ(γ) = g⁻¹`, that is, by the inverse of
    Tau Ceti's `TauCeti.UniversalCover.deckFundamentalGroupEquiv` applied to the class of
    `Ψ⁻¹(g⁻¹)`. This is a homomorphism because the deck group is the opposite of `π₁` and
    inversion is an anti-homomorphism; for the simplicial model, where `Ψ(γ) = m(γ)⁻¹`, the loop
    with `Ψ(γ) = g⁻¹` has `m(γ) = g`, so `g` acts by the left translation of (3). Freeness is
    (13). Exactness: `E` is simply connected with vanishing
    higher homotopy groups, so the absolute Hurewicz theorem of the algebraic-topology roadmap
    (its Stage 8 item 3) makes its reduced singular homology vanish, and the comparison of
    cellular with singular homology (its Stage 4 item 3) transfers this to the augmented cellular
    complex. Construct it for both models: the cellular model of Stage 2, and the simplicial
    model, where `E` is `EG` with the CW structure of Layer 11 (ordered by index), so that the
    cells are the simplices of the countable join. *Needs:* (5), (13); AlgebraicTopology Stage 8
    item 3 (the absolute Hurewicz theorem) and Stage 4 item 3 (cellular versus singular
    homology); Tau Ceti `TauCeti.UniversalCover.deckFundamentalGroupEquiv`; Mathlib
    `CategoryTheory.ProjectiveResolution`, `Rep.trivial`.

    **Checks.**
    - `G = 1`: the augmented complex of a contractible CW complex is exact.
    - `G = ℤ`, the circle: `ℤ[ℤ] → ℤ[ℤ] → ℤ`, with first map multiplication by `t − 1` and the
      augmentation `t ↦ 1`, is exact; a definition acting by the deck transformation of the other
      convention would give `t⁻¹ − 1`, which is also exact but is a different map and is detected
      by `S₃` in (14).
17. **Homology and cohomology.** `H_*(BG; k)` is Mathlib's `groupHomology` of the trivial module
    `k`, and `H^*(BG; k)` is `groupCohomology` of the trivial module, for every commutative ring
    `k` and naturally in `G`; for any Hausdorff CW `K(G, 1)`, not only the models, by (12). These
    are the headlines `nonempty_singularHomology_iso_groupHomology` and
    `nonempty_singularCohomology_iso_groupCohomology`. With a `G`-module `M`, the homology of `BG`
    with local coefficients in the local system that `M` defines through the identification of
    (5) is `groupHomology` of `M`, and cohomology likewise is `groupCohomology`. The isomorphisms
    come from (16) and the comparison maps of (18): the cellular chains of `BG` with coefficients
    in `M` are the coinvariants of the resolution of (16) tensored with `M`, and the cellular
    cochains are the equivariant homomorphisms into `M`. State naturality in both variables and
    compatibility with the long exact sequences.

    For the nerve model of AlgebraicTopology Stage 8 item 8a, prove that pullback along the
    normalised comparison `c_G` of (14), followed by the identification of the local systems
    through the nerve model's `π₁ ≅ G`, carries the cohomology comparison of the nerve model to
    the one of the model here, and that the composite is the identity on `groupCohomology` for
    every `A : Rep R G`; likewise for homology. This is what makes the three models' comparisons
    one comparison. *Needs:* (5), (14), (16), (18); AlgebraicTopology Stage 2 item 6 (local
    coefficient systems) and Stage 4 item 3 (cellular chains with local coefficients and their
    comparison with singular homology), Stage 8 item 8a; Mathlib `groupHomology`,
    `groupCohomology`, `AlgebraicTopology.singularHomologyFunctor`; Tau Ceti
    `TopCat.singularCohomology`.
18. **Comparison with the bar resolution.** The resolution of (16) for the simplicial model is
    *not* isomorphic to Mathlib's standard resolution `Rep.standardResolution ℤ G`, built on
    `Rep.standardComplex` from the simplicial `G`-set `classifyingSpaceUniversalCover`: already for
    the trivial group the countable join has countably many vertices, while the standard complex has
    one generator in degree zero. The comparison is a chain homotopy equivalence. Give the explicit
    augmentation-preserving `G`-equivariant chain map from the join to the standard complex sending
    the `n`-simplex `{(i₀, g₀), …, (iₙ, gₙ)}`, with `i₀ < ⋯ < iₙ` and oriented by increasing index,
    to `(g₀, …, gₙ)`; it is a chain map because Layer 11 identifies the cellular boundary with the
    alternating sum of faces; prove that it is natural in `G` for the maps of Stage 1.6, and that it
    is a homotopy equivalence of projective resolutions lifting the identity of `ℤ`, so that it
    agrees up to chain homotopy with Mathlib's `ProjectiveResolution.homotopyEquiv`. The topological
    and algebraic computations of the same group are then the same computation.

    For the nerve model, whose universal cover is the realization of `classifyingSpaceUniversalCover`
    and whose cellular chains are the normalised standard complex (the quotient of
    `Rep.standardComplex` by the degenerate simplices), prove that the chain map induced on the
    resolutions of (16) by a cellular approximation of the lift of `c_G` agrees up to chain
    homotopy with the explicit map above followed by the normalisation. *Needs:* (14), (16);
    GeometricTopology Layer 11 (the cellular boundary of a simplex is the alternating sum of its
    faces); AlgebraicTopology Stage 8 item 8a; Mathlib `Rep.standardResolution`,
    `Rep.standardComplex`, `classifyingSpaceUniversalCover`,
    `CategoryTheory.ProjectiveResolution.homotopyEquiv`.

    **Checks.**
    - `G = 1`, degree zero: the join has `ℤ^(ℕ)` and the standard complex `ℤ`, so the map is not
      an isomorphism; a definition claiming an isomorphism is refuted here.
    - The face `j` of `{(i₀, g₀), …, (iₙ, gₙ)}` goes to the `j`-th face `(g₀, …, ĝⱼ, …, gₙ)`, so
      the alternating sums match the differential of `Rep.standardComplex`.
19. **Checks.** `H_1(BG; ℤ) ≅ G` abelianized, for every `G`. The circle is a `K(ℤ, 1)`, a wedge of
    circles is a `K(F, 1)` for the free group on the same index set, and the `n`-torus is a
    `K(ℤⁿ, 1)`; in each case the homology computed topologically agrees with the algebraic answer.
    The first two are proved here; the circle and torus cases must be *compared* with the
    universal-covers roadmap's examples rather than restated. `H_2(ℤ/n; ℤ) = 0` on both sides.
    *Needs:* (17); AlgebraicTopology Stage 8 item 3 (the degree-one Hurewicz theorem);
    UniversalCovers items 11 to 13.

## Ordering

Stage 1 is independent of Stages 2 to 4 once Layer 11 of the geometric-topology roadmap has the
realization API it owns, and it is the shortest route to the existence theorem. Stage 2 waits on
van Kampen, cellular approximation, the cell-attachment and tower-union constructions and the
killing construction from the algebraic-topology roadmap. Stage 3 needs both models, the CW
structure on `|K|` from Layer 11, Whitehead's theorem from the algebraic-topology roadmap, and,
for the comparison with the nerve model, that roadmap's Stage 8 item 8a. Stage 4 needs Stage 3's
CW structures along
coverings, the Hurewicz theorem and the cellular-singular comparison from the algebraic-topology
roadmap, and Stage 3's comparisons to transport its conclusions between the models.

## Acceptance checks

- The existence theorem applies to an uncountable group with no finite presentation, with no
  hypothesis to discharge beyond `Group G`.
- The simplicial model for `ℤ` is homotopy equivalent to the circle, and the equivalence induces
  the identity on `ℤ` under the two identifications of the fundamental group, with the direction
  of Stage 1 item 5.
- For a free group, the cellular model is a wedge of circles and the simplicial model is homotopy
  equivalent to it.
- The uniqueness theorem assumes CW type on both spaces; it is not stated for an arbitrary pair of
  `K(G, 1)` spaces, which the Warsaw circle refutes.
- The comparison with the bar resolution is a chain homotopy equivalence of augmented
  `ℤ[G]`-complexes, not a chain isomorphism, and it is the explicit map of (18).
- `H_2(BG; ℤ)` for a finite cyclic group agrees with the algebraic answer, which is a case where
  the topological computation is not the shorter one and the comparison earns its keep.
- The comparison with the nerve model is normalised to the identity on `G`, and the `S₃` Check of
  Stage 1 item 5 distinguishes it from the comparison normalised to inversion.

## References

- J. Milnor, "Construction of universal bundles, II", *Ann. of Math.* **63** (1956), 430–436,
  [DOI](https://doi.org/10.2307/1970012). The countable join and its free action.
- A. Hatcher, *Algebraic Topology*, Cambridge, 2002. Section 1.2, Corollary 1.28, p. 52, for the
  presentation complex; Section 1.B, Example 1B.7, p. 89, Theorem 1B.8 and Proposition 1B.9,
  p. 90, for `K(G, 1)` spaces, maps into them and their uniqueness; Section 4.1, Example 4.16,
  p. 354, for killing homotopy groups; Appendix A, Proposition A.1, p. 520, for the compactness of
  a map's image in a CW or weak-topology complex.
- K. S. Brown, *Cohomology of Groups*, GTM 87, Springer, 1982, Chapters I to III. The comparison
  of the cellular chains of a `K(G, 1)` with the bar resolution, and free `G`-CW complexes
  (Section I.4).
- T. tom Dieck, *Transformation Groups*, de Gruyter, 1987, Section II.1. `G`-CW complexes and
  their orbit spaces.
- R. Schwamberger and R. M. Vogt, "Dold spaces in homotopy theory", *Algebr. Geom. Topol.* **9**
  (2009), [DOI](https://doi.org/10.2140/agt.2009.9.1585), Section 2. The Warsaw circle as a space
  with trivial homotopy groups that is not contractible.
- G. Segal, "Classifying spaces and spectral sequences", *Publ. IHES* **34** (1968),
  [DOI](https://doi.org/10.1007/BF02684591), Section 2. The simplicial viewpoint on the same
  construction.
