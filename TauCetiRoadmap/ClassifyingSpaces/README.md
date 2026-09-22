# Roadmap: classifying spaces of discrete groups

A group has a topological shadow. For a discrete group `G`, a `K(G, 1)` is a path-connected
space with fundamental group `G` and no higher homotopy, and it is determined by `G` up to
homotopy equivalence. Its singular homology is the group homology of `G`, so the algebraic
invariants Mathlib already defines are invariants of a space, and the covering-space theory of
the [universal-covers roadmap](../../Completed/UniversalCovers/README.md) becomes a tool for
computing them.

That roadmap ends with *recognition*: a space whose universal cover is weakly contractible is a
`K(G, 1)`, with circles and tori as examples. It leaves *construction* open, and says so. This
roadmap constructs one for an arbitrary group, twice.

**Both models are wanted.** The simplicial one, Milnor's countable join, is uniform in `G` and
needs no presentation; it is the shorter path to an unconditional existence theorem. The cellular
one, the presentation complex with higher cells attached, is the model every later homological
argument is written against, and it is what connects to cellular chains. Building both and
proving they agree is not duplication: the comparison is the theorem that makes "the" classifying
space well defined, and each model proves things about the other that are awkward in its own
terms.

Suggested home: `TauCeti/AlgebraicTopology/ClassifyingSpace/`.

## Scope and completion criterion

The roadmap is complete when Tau Ceti supplies all of the following, for an arbitrary group `G`
with no finiteness, countability, presentation or torsion hypothesis, and with the naturality
stated in each clause.

1. Two constructions of a pointed space with fundamental group `G` and vanishing higher homotopy:
   the realization of the countable join of copies of `G` modulo the free `G`-action, and a
   cellular model built from a presentation. Each is proved path-connected, locally
   path-connected and semilocally simply connected, so that the classification theorems of the
   universal-covers roadmap apply to it.
2. Uniqueness: any two `K(G, 1)` spaces of the same group are homotopy equivalent, by a homotopy
   equivalence realizing any prescribed isomorphism of fundamental groups; in particular the two
   models above agree.
3. Functoriality: a group homomorphism induces a map of classifying spaces, well defined up to
   homotopy, inducing the given homomorphism on fundamental groups, and respecting identities and
   composition in the homotopy category.
4. The comparison with algebra: the singular homology of the classifying space is Mathlib's
   `groupHomology`, and its cohomology with coefficients in a `G`-module is Mathlib's
   `groupCohomology`, naturally in the group and in the coefficients.

Groups are discrete throughout. `K(G, n)` for `n ≥ 2`, deloopings and spectra are not in scope.

## Ownership and dependencies

This roadmap constructs classifying spaces and compares them with group cohomology. It builds no
covering-space theory, no realization theory of simplicial complexes, and no CW machinery; each
of those is owned elsewhere and cited here.

- The [universal-covers roadmap](../../Completed/UniversalCovers/README.md), now complete, owns
  the universal cover, deck transformations, quotient covers by a group action
  (`IsQuotientCoveringMap`), the Galois correspondence, the `π_n` API, and the recognition of
  `K(G, 1)` spaces from a weakly contractible universal cover. Stage 1 below consumes its
  recognition criterion and its standing-hypothesis API rather than reproving them. Its
  convention is inherited: the deck group of the universal cover is the *opposite* of the
  fundamental group, so the identification `π₁(BG) ≅ G` fixes a direction and must say which.
- The [geometric-topology roadmap](../GeometricTopology/README.md), Layer 11, owns the polyhedron
  `|K|` of an abstract simplicial complex, its weak topology, and its realization API: maps
  induced by simplicial maps, restriction to a subset of the vertices, the factorization of a map
  out of a compact space through a finite vertex restriction, and the contraction of a realized
  cone onto its apex. Stage 1 consumes those and adds nothing general about realizations.
- The [algebraic-topology roadmap](../AlgebraicTopology/README.md) owns van Kampen through the
  fundamental groupoid with its group-presentation corollaries (its Stage 1), CW pairs, cellular
  approximation, cofibrations and skeletal induction (its Stage 4), the comparison between
  Mathlib's categorical and classical CW structures (its Stage 4), and singular homology (its
  Stage 2). Stage 2 below consumes all of these; it attaches cells to build one specific complex
  and proves nothing general about CW complexes.
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
- **Singular homology.** `Mathlib/AlgebraicTopology/SingularHomology/` supplies
  `singularHomologyFunctor` and its homotopy invariance.
- **Simplicial complexes.** `TauCeti/AlgebraicTopology/SimplicialComplex/` has abstract complexes,
  their realization with the weak topology, the combinatorial join and cone, subdivision and
  collapse. The realization theory this roadmap needs on top of that belongs to Layer 11 of the
  geometric-topology roadmap.
- **Covering spaces.** `TauCeti/AlgebraicTopology/UniversalCover/` and
  `TauCeti/AlgebraicTopology/EilenbergMacLane/` have the universal cover, `IsQuotientCoveringMap`,
  `IsAspherical`, `IsEilenbergMacLaneSpaceOne` and the recognition theorems.
- **Presented groups.** `Mathlib/GroupTheory/PresentedGroup.lean` and
  `Mathlib/GroupTheory/FreeGroup/` supply presentations, free groups and their universal property.
  Every group has the tautological presentation on its own elements, so Stage 2 needs no
  finiteness hypothesis.

## Stage 1: the simplicial model

Milnor's construction: the countable join of copies of `G`, realized with the weak topology, is
weakly contractible and carries a free `G`-action whose orbit map is a covering.

1. **The countable join complex.** For a family `A : ℕ → Type u`, the abstract simplicial complex
   on `Σ i, A i` whose faces are the nonempty finite sets meeting each index at most once. Give
   its face and barycentric-coordinate descriptions, the simplicial maps induced by maps of the
   families, and the inclusions of the subjoins on a finite set of indices. For the constant
   family `A i = G` write `universalGSpace G` for the realization, based at the vertex `(0, 1)`.
2. **Weak contractibility.** When `A i` is nonempty for infinitely many `i`, the realization is
   path-connected and all its homotopy groups vanish. The argument: a generalized loop has
   compact image, so by Layer 11 it factors through the restriction to finitely many vertices;
   choose an index no face of that restriction touches, and cone the loop off there. Package the
   dimension-one case as `SimplyConnectedSpace`.
3. **The action and the orbit cover.** The left action `h • (i, g) = (i, h * g)`, its action laws,
   the continuity of each translation, and freeness. The sets where the coordinate at `(i, g)` is
   positive are open, and their translates by distinct group elements are disjoint, because a face
   meets each index at most once; that is the local disjointness `IsQuotientCoveringMap` asks for.
   `classifyingSpace G` is the orbit space with the quotient topology,
   `classifyingSpaceProj G` the orbit map, `classifyingSpaceBasepoint G` the class of `(0, 1)`.
   Give the quotient the API a user needs without unfolding it: two points have the same image
   exactly when a unique group element carries one to the other, the fibre over a point is an
   orbit, a continuous `G`-invariant map descends, and `G ≃* Deck (classifyingSpaceProj G)`
   compatibly with the action.
4. **The standing hypotheses.** Total space and orbit space are path-connected and locally
   path-connected: a closed simplex is convex, hence locally path-connected, the realization is a
   quotient of the disjoint union of its closed simplices, and the orbit space is a quotient of
   the realization, so `Topology.IsQuotientMap.locallyPathConnectedSpace` applies at each step.
   The orbit space is semilocally simply connected because it is covered by a simply connected
   space.
5. **It is a `K(G, 1)`.** With (2), (3), (4) and the recognition criterion of the universal-covers
   roadmap: `π₁(classifyingSpace G) ≅ G` at the base point, in the direction fixed against the
   opposite-group convention, and the higher homotopy groups vanish. State the unconditional
   existence theorem for an arbitrary group, and identify `classifyingSpaceProj G`, with its
   chosen base point, with the based-path universal cover by a pointed homeomorphism over the
   base.
6. **Functoriality.** For `φ : G →* H` the induced maps on `universalGSpace` and
   `classifyingSpace`: continuity, preservation of base points, compatibility with the orbit maps,
   and the identity and composition laws. Under the isomorphisms of (5) the induced map on
   fundamental groups is `φ`. This functoriality is strict, not just up to homotopy; Stage 3's is
   the homotopy-invariant statement that applies to any model.

## Stage 2: the cellular model

The presentation complex, with higher cells attached to kill the homotopy the presentation does
not control.

7. **The presentation complex.** For a group presentation, generators `S` and relators
   `R ⊆ FreeGroup S`, the complex with one vertex, a one-cell for each generator and a two-cell
   attached along each relator. Prove that its fundamental group is `PresentedGroup R`, by the
   group-presentation corollary of van Kampen; the wedge-of-circles case is the free group.
8. **Killing a homotopy group.** For a CW complex `Y` and `n ≥ 2`, the complex obtained by
   attaching `(n + 1)`-cells along a generating family of `π_n(Y)`: the inclusion is an
   isomorphism on `π_k` for `k < n` and kills `π_n`. Cellular approximation and the compactness of
   a sphere's image supply both halves.
9. **The tower and its colimit.** Iterating (8) from the presentation complex gives an expanding
   sequence of CW complexes; its colimit has the fundamental group of the presentation complex and
   no higher homotopy, because a map from a sphere or a cube has compact image and so factors
   through a finite stage. Prove the colimit is again a CW complex in the sense the rest of the
   library uses, which is where the comparison between Mathlib's two CW structures is consumed.
10. **A cellular `K(G, 1)` for any group.** Feed the tautological presentation of `G` into (7) and
    the tower into (9). State the existence theorem and its standing hypotheses in the same form
    as Stage 1's, so that the two are comparable statements and not merely two constructions.

## Stage 3: uniqueness and the comparison of the models

11. **Maps out of a cellular `K(G, 1)`.** For a cellular `K(G, 1)` with base point and any pointed
    space `Z` that is a `K(H, 1)`, every homomorphism `π₁ → π₁` is induced by a pointed map, unique
    up to pointed homotopy. This is the obstruction-theoretic step, proved by extending over
    skeleta: the higher homotopy of the target vanishes, so every extension problem over a cell of
    dimension at least two is solvable, and the solution is unique up to homotopy.
12. **Uniqueness.** Two `K(G, 1)` spaces of the same group, at least one of them of CW type, are
    homotopy equivalent, by an equivalence inducing any prescribed isomorphism on fundamental
    groups. Deduce that the classifying space is well defined in the homotopy category.
13. **The two models agree.** The simplicial model of Stage 1 has CW type, and therefore is
    homotopy equivalent to the cellular model of Stage 2, compatibly with the identifications of
    the fundamental group. Give the homotopy equivalence and its inverse up to homotopy, not only
    an existence statement.
14. **Homotopy functoriality.** The classifying space is a functor from groups to the pointed
    homotopy category, and the strict functoriality of Stage 1.6 refines it.

## Stage 4: group homology and cohomology

15. **The chain-level comparison.** The cellular chain complex of the universal cover of a
    cellular `K(G, 1)`, with its deck action, is a free resolution of the trivial module `ℤ` over
    the group ring. This is the bridge: the deck action of the universal-covers roadmap makes the
    cellular chains of Stage 2 a complex of free `ℤ[G]`-modules, and asphericity makes it acyclic.
16. **Homology.** `H_*(BG; ℤ)` is Mathlib's `groupHomology` of the trivial module, naturally in
    `G`; with a `G`-module `M`, the homology of `BG` with local coefficients in `M` is
    `groupHomology` of `M`, and cohomology likewise is `groupCohomology`. State naturality in both
    variables and compatibility with the long exact sequences.
17. **Comparison with the bar resolution.** Identify the resolution of (15), for the simplicial
    model, with the bar resolution underlying Mathlib's `classifyingSpaceUniversalCover`, so that
    the topological and algebraic computations of the same group are the same computation.
18. **Checks.** `H_1(BG; ℤ) ≅ G` abelianized, for every `G`. The circle is a `K(ℤ, 1)`, a wedge of
    circles is a `K(F, 1)` for the free group on the same index set, and the `n`-torus is a
    `K(ℤⁿ, 1)`; in each case the homology computed topologically agrees with the algebraic answer.
    The first two are new; the circle and torus cases must be *compared* with the universal-covers
    roadmap's examples rather than restated.

## Ordering

Stage 1 is independent of Stages 2 to 4 once Layer 11 of the geometric-topology roadmap has the
realization API it owns, and it is the shortest route to the existence theorem. Stage 2 waits on
van Kampen and cellular approximation from the algebraic-topology roadmap, and on the comparison
of Mathlib's two CW structures. Stage 3 needs both models. Stage 4 needs Stage 2, since the
chain-level argument is cellular, and Stage 3 to transport its conclusions to the simplicial
model.

## Acceptance checks

- The existence theorem applies to an uncountable group with no finite presentation, with no
  hypothesis to discharge beyond `Group G`.
- `classifyingSpace ℤ` is homotopy equivalent to the circle, and the equivalence induces the
  identity on `ℤ` under the two identifications of the fundamental group.
- For a free group, the cellular model is a wedge of circles and the simplicial model is homotopy
  equivalent to it.
- `H_2(BG; ℤ)` for a finite cyclic group agrees with the algebraic answer, which is a case where
  the topological computation is not the shorter one and the comparison earns its keep.

## References

- J. Milnor, "Construction of universal bundles, II", *Ann. of Math.* **63** (1956),
  [DOI](https://doi.org/10.2307/1969609). The countable join and its free action.
- A. Hatcher, *Algebraic Topology*, Cambridge, 2002. Section 1.B for `K(G, 1)` spaces, their
  uniqueness and the presentation complex; Section 4.1 for killing homotopy groups; Appendix A for
  the compactness of a map's image in a CW or weak-topology complex.
- K. S. Brown, *Cohomology of Groups*, GTM 87, Springer, 1982, Chapters I to III. The comparison
  of the cellular chains of a `K(G, 1)` with the bar resolution.
- G. Segal, "Classifying spaces and spectral sequences", *Publ. IHES* **34** (1968),
  [DOI](https://doi.org/10.1007/BF02684591). The simplicial viewpoint on the same construction.
