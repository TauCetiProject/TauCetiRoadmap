# Roadmap: classifying spaces of discrete groups

**Summary.** A group has a topological shadow. For a discrete group `G`, a `K(G, 1)` is a
path-connected space with fundamental group `G` and no higher homotopy, and among spaces of CW
type it is determined by `G` up to homotopy equivalence. Its singular homology is the group
homology of `G`, so the algebraic invariants Mathlib defines are invariants of a space, and the
covering-space theory of the [universal-covers roadmap](../../Completed/UniversalCovers/README.md)
becomes a tool for computing them.

The pinned Tau Ceti already builds this theory for its two models. The directory
`TauCeti/AlgebraicTopology/ClassifyingSpace/` constructs Milnor's model `TauCeti.classifyingSpace G`
(the orbit space of the countable join of copies of `G`) and the cellular model
`TauCeti.cellularClassifyingSpace R` (the presentation complex of `⟨S | R⟩` with cells of dimension
at least three attached to kill the higher homotopy groups), proves that both are Hausdorff CW
`K(G, 1)` spaces for every group, compares them, proves the uniqueness of `K(G, 1)` spaces of CW
type up to a change of base point, makes the classifying space a functor to the pointed homotopy
category, builds the cellular resolutions of the trivial module and compares them with Mathlib's
standard resolution, and identifies the singular (co)homology of Milnor's model, with trivial and
with local coefficients, with Mathlib's `groupHomology` and `groupCohomology`. All of that is
consumed here by exact name; none of it is planned again.

What remains, and what this roadmap owns, is the passage from the models to an *arbitrary*
Hausdorff CW `K(G, 1)` and, more generally, to an arbitrary path-connected Hausdorff CW complex
mapping into an aspherical space: Hatcher's Proposition 1B.9 for an arbitrary base point and an
arbitrary aspherical target (every homomorphism of fundamental groups is induced by a pointed
map, unique up to homotopy relative to the base point; Hatcher's proof takes the base point to be
a `0`-cell and the target to have a contractible universal cover), the pointed form of the
uniqueness theorem, and the comparison of the (co)homology of any Hausdorff CW `K(G, 1)` with
group (co)homology, fixed by the chosen identification of the fundamental group, natural in the
space and the group, and with local coefficients. The acceptance test `Suggested.lean` states
these four headlines: `exists_continuousMap_mapOfEq_eq_of_isAspherical`,
`exists_homotopyEquiv_of_isAspherical`, `nonempty_twistedHomology_iso_groupHomology` and
`nonempty_twistedCohomology_iso_groupCohomology`.

Suggested home: `TauCeti/AlgebraicTopology/ClassifyingSpace/`, next to the pinned development.

## Scope and ownership

The roadmap is complete when Tau Ceti supplies all of the following, for an arbitrary group `G`
with no finiteness, countability, presentation or torsion hypothesis.

1. **Maps into aspherical spaces** (Layer 1, items 1.1 and 1.2). For a path-connected Hausdorff
   CW complex `X` with an arbitrary base point `x` and an aspherical space `Y` with base point
   `y`, in independent universes, every homomorphism `π₁(X, x) →* π₁(Y, y)` is induced by a
   pointed map, and two pointed maps inducing the same homomorphism are homotopic relative to the
   base point. The pinned library proves the existence clause when `X` is a cellular model and
   the uniqueness clause when `X` has a single `0`-cell; the general source is owned here,
   together with the homotopy extension property of an arbitrary point of a Hausdorff CW complex
   (item 1.1), through which a base point off the `0`-skeleton is reduced to a vertex.
2. **Pointed uniqueness** (Layer 1, item 1.3). Two aspherical Hausdorff CW complexes, with
   arbitrary base points, are homotopy equivalent by an equivalence whose forward map preserves the
   base points and induces any prescribed isomorphism of fundamental groups. The pinned
   uniqueness theorem realizes the isomorphism only after a change of base point along a path;
   the pointed form is owned here,
   together with its corollary that any Hausdorff CW `K(G, 1)` is pointedly homotopy equivalent to
   both pinned models, compatibly with the identifications of the fundamental groups.
3. **(Co)homology of any Hausdorff CW `K(G, 1)`** (Layer 2). The comparison of its singular
   homology and cohomology with `groupHomology` and `groupCohomology`, with trivial coefficients
   (items 2.1 and 2.2) and with the local system of a representation of `G` (item 2.3), fixed by
   the chosen identification `Ψ : π₁(X, x) ≃* G`, natural in `(X, Ψ)` along pointed maps and in
   the coefficients, and agreeing with the pinned isomorphisms on Milnor's model.

What this roadmap leaves to others, by object:

- **The two models, their comparison, functoriality, resolutions and (co)homology** are theorems
  of the pinned Tau Ceti, listed by name and file under *From Tau Ceti* below. Nothing about the
  countable join, the presentation complex, the killing tower, the transfer of CW structures
  along a free quotient covering, the cellular resolutions or the comparison with
  `Rep.standardResolution` is a target here. In particular the existence of a Hausdorff CW
  `K(G, 1)` for every group and of a two-dimensional Hausdorff CW complex with fundamental group
  `G` are pinned theorems (`TauCeti.exists_isEilenbergMacLaneSpaceOne`,
  `TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`, and
  `TauCeti.PresentationComplex` of the tautological presentation `Group.Presentation.ofFreeGroupHom`
  with `TauCeti.PresentationComplex.isEmpty_cell`), not acceptance tests of this roadmap.
- **The nerve model** of `G`, the realization of the nerve of `G` as a one-object category, and
  its comparison with Milnor's model normalised to the identity on `G`, belong to the
  [algebraic-topology roadmap](../AlgebraicTopology/README.md), Stage 8, items 8.8a and 8.8b. The
  model that comparison is normalised against is the pinned `TauCeti.classifyingSpace G`, with
  the pinned identification `TauCeti.classifyingSpaceFundamentalGroupMulEquiv G` of its
  fundamental group; the pointed map from the nerve model into Milnor's model and its uniqueness
  up to pointed homotopy are Layer 1 of this roadmap (items 1.1 and 1.2 with the nerve model as
  the source and Milnor's model as the aspherical target, item 1.3 for the pointed homotopy
  equivalence), which that item consumes. The classification of pointed maps from a
  path-connected pointed Hausdorff CW complex into a `K(π, 1)` by homomorphisms `π₁ → π`, up to
  pointed homotopy, is the case of items 1.1 and 1.2 with target a `K(π, 1)` and is owned here,
  not in the algebraic-topology roadmap. This roadmap consumes nothing from the
  algebraic-topology roadmap: the CW machinery its routes use (the homotopy extension property
  of skeleta, the killing tower and its homotopy groups, the lifting of maps out of spaces of CW
  type through weak homotopy equivalences, Whitehead's theorem, the homotopy invariance of
  singular and twisted (co)homology) is at the pin. Segal's remark comparing the nerve model
  with Milnor's join (Segal 1968, §3) is the background for the relation between the two; it is
  not a target of either roadmap.
- **Covering-space theory** is the universal-covers roadmap's, complete: the universal cover,
  deck transformations, quotient covers by a group action (Mathlib's `IsQuotientCoveringMap`),
  the `π_n` API and the recognition of `K(G, 1)` spaces from a weakly contractible universal
  cover. Its convention is inherited: the deck group of the universal cover is the *opposite* of
  the fundamental group, and the pinned declarations that fix the directions are named under
  *Conventions*.
- **Continuous cohomology of profinite groups** is the
  [profinite-cohomology roadmap](../ProfiniteCohomology/README.md)'s. The group cohomology
  compared here is Mathlib's discrete one; neither development introduces a second version of the
  other's objects.

Groups are discrete throughout. `K(G, n)` for `n ≥ 2`, deloopings and spectra are not in scope.

**Stage and item numbers.** Other roadmaps cite this roadmap by Stage (1–4) and item (1–19),
and by the heading of Stage 2, the cellular model. Each cited number resolves as follows;
"pinned" names declarations listed under *From Tau Ceti* below, consumed and not planned here.

- Stage 1, Milnor's model, items 1–6: pinned, *From Tau Ceti*, "Milnor's model", "Its fundamental
  group" and "Functoriality".
  - Item 1, the countable join: `TauCeti.indexedJoin` and `TauCeti.universalGSpace G`.
  - Item 2, weak contractibility: `TauCeti.subsingleton_homotopyGroup_universalGSpace` and
    `TauCeti.instSimplyConnectedSpaceUniversalGSpace`.
  - Item 3, the action and the orbit cover: `TauCeti.instMulActionUniversalGSpace`,
    `TauCeti.isQuotientCoveringMap_classifyingSpaceProj` and `TauCeti.classifyingSpaceDeckMulEquiv`.
  - Item 4, the standing hypotheses: `TauCeti.instPathConnectedSpaceClassifyingSpace`,
    `TauCeti.instLocallyPathConnectedSpaceClassifyingSpace` and
    `TauCeti.instSemilocallySimplyConnectedSpaceClassifyingSpace`.
  - Item 5, the `K(G, 1)` property: `TauCeti.classifyingSpaceFundamentalGroupMulEquiv`,
    `TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace`,
    `TauCeti.exists_isEilenbergMacLaneSpaceOne` and
    `TauCeti.universalGSpaceHomeomorphUniversalCover`.
  - Item 6, functoriality: `MonoidHom.universalGSpaceMap`, `MonoidHom.classifyingSpaceMap` and
    `MonoidHom.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq`.
- Stage 2, the cellular model, items 7–10: pinned, *From Tau Ceti*, "The presentation complex and
  the cellular model".
  - Item 7, the presentation complex: `TauCeti.PresentationComplex R` and
    `TauCeti.PresentationComplex.fundamentalGroupMulEquiv`.
  - Item 8, killing one homotopy group: `TauCeti.cellAttachment` and
    `TauCeti.subsingleton_homotopyGroup_cellAttachment`, one stage of the killing tower.
  - Item 9, the tower and its colimit: `TauCeti.killHomotopyGroups`,
    `TauCeti.bijective_homotopyGroupMap_killHomotopyGroupsIncl` and
    `TauCeti.subsingleton_homotopyGroup_killHomotopyGroups`; the CW structure of the cellular model
    is `TauCeti.instCWComplexCellularClassifyingSpace`.
  - Item 10, a cellular `K(G, 1)` for every group: `TauCeti.cellularClassifyingSpace` and
    `TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`.
- Stage 3, uniqueness and the comparison of the models, items 11–15.
  - Item 11, maps out of a cellular `K(G, 1)`: for the cellular model, the pinned
    `TauCeti.exists_mapOfEq_cellularClassifyingSpace` and
    `TauCeti.homotopicRel_of_mapOfEq_eq_cellularClassifyingSpace`; for an arbitrary path-connected
    Hausdorff CW source, Layer 1, items 1.1 and 1.2.
  - Item 12, uniqueness: up to a change of base point, the pinned
    `TauCeti.IsAspherical.exists_homotopyEquiv` and
    `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`; the pointed form is Layer 1,
    item 1.3.
  - Item 13, CW structures and coverings: pinned. The CW structure lifted along a covering map is
    `TauCeti.cwComplexPreimage`, and its cellular chains are free over the group ring with one
    generator for each cell of the base (`TauCeti.cellularChainRepIsoFree`). The CW structure on
    the orbit space of a free cellular action is `IsQuotientCoveringMap.cwComplexQuotient`, which
    gives `TauCeti.instCWComplexClassifyingSpace` with cells `TauCeti.classifyingSpaceCellEquiv`.
  - Item 14, the two models agree: `TauCeti.cellularHomotopyEquivClassifyingSpace`, pinned.
  - Item 15, homotopy functoriality: `TauCeti.classifyingSpaceHomotopyFunctor`, pinned.
- Stage 4, group homology and cohomology, items 16–19.
  - Item 16, the chain-level comparison: `TauCeti.cellularResolutionOfIsAspherical`,
    `TauCeti.cellularClassifyingSpaceResolution` and `TauCeti.universalGSpaceResolution`, pinned.
  - Item 17, (co)homology: for Milnor's model, pinned, *From Tau Ceti*, "(Co)homology of Milnor's
    model" (`TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology`,
    `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology`,
    `TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology` and
    `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology`); for an arbitrary Hausdorff CW
    `K(G, 1)`, Layer 2, items 2.1 and 2.2 (trivial coefficients) and 2.3 (local coefficients).
  - Item 18, comparison with the bar resolution: `TauCeti.universalGSpaceStandardHomotopyEquiv`
    with forward map `TauCeti.universalGSpaceChainComplexToStandardComplex`, pinned.
  - Item 19, the checks: pinned, *From Tau Ceti*, "Examples", and
    `TauCeti.classifyingSpaceFirstHomologyAddEquiv`; their transport to the geometric models is
    the *Examples* section of Layer 2.

## Conventions

- **CW `K(G, 1)`.** A Hausdorff space `X` with `Topology.CWComplex (Set.univ : Set X)`, a point
  `x` and `TauCeti.IsEilenbergMacLaneSpaceOne G X x`: `X` is path-connected, its homotopy groups
  at `x` vanish from degree two on, and `π₁(X, x) ≃* G`. "Aspherical" is `TauCeti.IsAspherical X x`,
  the same without the identification. A Hausdorff CW complex has CW type
  (`TauCeti.CWType.of_cwComplex_univ`), which is what the pinned uniqueness theorems and
  Whitehead's theorem (`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`) assume.
- **Base points.** The base point of a CW complex `X` is an arbitrary point. It need not be a
  vertex, a point of the `0`-skeleton `Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1`,
  which is discrete (`TauCeti.zeroSkeletonDiscreteTopology`). Hatcher's proof of Proposition 1B.9
  takes the base point to be a `0`-cell (p. 90 for a single `0`-cell, p. 91 for a `0`-cell of a
  maximal tree), and the pinned uniqueness criterion
  `TauCeti.homotopicRel_skeletonLT_one_of_forall_homotopicRel` gives homotopies relative to the
  `0`-skeleton. The routes of items 1.1 and 1.2 therefore treat a vertex first and reduce an
  arbitrary base point to a vertex through the homotopy extension property of a point, proved in
  item 1.1. The base point of an aspherical target is arbitrary. The base point of the cellular
  model is its single `0`-cell (`TauCeti.skeletonLT_one_cellularClassifyingSpace`), and the base
  point of Milnor's model, the orbit of the vertex `(0, 1)` of the join
  (`TauCeti.classifyingSpaceBasepoint`), is a `0`-cell of `TauCeti.instCWComplexClassifyingSpace`
  (`TauCeti.classifyingSpaceCellEquiv` in dimension `0`).
- **Universes.** The two headlines of Layer 1 place the source `X : Type u` and the target
  `Y : Type v` in independent universes. The pinned
  `TauCeti.exists_mapOfEq_cellularClassifyingSpace` keeps a presentation and the target of its
  map in one universe; the route of item 1.1 meets this by taking the presentation in the
  universe `max u v` and the targets through `ULift`.
  Layer 2 keeps `X`, `G` and `k` in one universe `u`. Mathlib's `groupHomology` and
  `groupCohomology` take `k` and `G` in one universe and a representation `A : Rep.{u, u, u} k G`,
  with values in `ModuleCat.{u} k` (`Rep k G` itself allows three independent universes), while
  the twisted (co)homology of a space in a universe `v` with coefficients in a universe `w` lies in
  `ModuleCat.{max v w} k`; the two sides of a Layer 2 isomorphism are objects of one category when
  `X` lies in the universe of `k` and `G`.
- **The identification `Ψ`.** A CW `K(G, 1)` comes with a chosen `Ψ : π₁(X, x) ≃* G`; every
  comparison of Layer 2 is defined from `(X, x, Ψ)` and changes by the automorphism of `G` when
  `Ψ` changes. For Milnor's model `BG := TauCeti.classifyingSpace G`, based at
  `b₀ := TauCeti.classifyingSpaceBasepoint G`, the identification is the pinned
  `TauCeti.classifyingSpaceFundamentalGroupMulEquiv G`; for the cellular model it is
  `TauCeti.cellularClassifyingSpaceFundamentalGroupMulEquiv R`, under which the generator `s`
  corresponds to the loop around the `s`-th circle of the presentation complex
  (`TauCeti.cellularClassifyingSpaceFundamentalGroupMulEquiv_symm_apply`).
- **The direction of `π₁(BG) ≃* G`.** Write `EG := TauCeti.universalGSpace G` for the countable
  join, `p_G := TauCeti.classifyingSpaceProj G` for the orbit map, and for a loop `γ` at `b₀`
  write `m(γ)` for the label of the end point `(0, m(γ))` of the lift of `γ` starting at the
  vertex `(0, 1)`. The pinned identification sends `γ` to `g` exactly when that end point is the
  vertex `(0, g⁻¹)` (`TauCeti.classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`): it is
  `γ ↦ m(γ)⁻¹`. The inverse is forced by the conventions on both sides. Under Mathlib's
  `FundamentalGroup.mul_def`, `p * q = q.trans p` runs `q` first; its lift runs the lift of `q`
  to `(0, m(q))` and then `m(q)` times the lift of `p`, ending at `(0, m(q) * m(p))`, so
  `m(p * q) = m(q) * m(p)` and the label is an anti-homomorphism; the left action
  `h • (i, g) = (i, h * g)` (`TauCeti.instMulActionUniversalGSpace`) identifies `G` with the deck
  group by translation (`TauCeti.classifyingSpaceDeckMulEquiv`), and Tau Ceti's deck group is the
  opposite of the fundamental group (`TauCeti.UniversalCover.deckFundamentalGroupEquiv`, whose
  inverse sends the class of `γ` to the deck transformation carrying the base lift to the end
  point of the lift of `γ⁻¹`, `TauCeti.UniversalCover.deckFundamentalGroupEquiv_symm_op`).

  **Checks.**
  - `G = S₃`, `s = (1 2)`, `t = (2 3)`, and loops `ℓ_s`, `ℓ_t` with `m(ℓ_s) = s`, `m(ℓ_t) = t`:
    `m(ℓ_s * ℓ_t) = t * s`, while `s * t ≠ t * s`. The map `γ ↦ m(γ)⁻¹` sends `ℓ_s * ℓ_t` to
    `(t * s)⁻¹ = s⁻¹ * t⁻¹ = s * t`, the product of the images; the map `γ ↦ m(γ)` would send it
    to `t * s ≠ s * t` and is not a homomorphism. An abelian group cannot detect this.
  - `G = ℤ`, written additively, so the base vertex is `(0, 0)`: the loop whose lift ends at
    `(0, 1)` goes to `−1`. The sign is invisible to the `S₃` test, and the `S₃` test is invisible
    to this one; both are needed. The pinned comparison of the circle with `B(ℤ)`
    (`TauCeti.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq_circleToClassifyingSpace`)
    sends the counterclockwise loop to `1`, so it carries that loop to a loop `γ` with
    `m(γ) = −1`, wrapping the circle once around `γ`.
  - `G = 1`: `BG = EG` is the infinite simplex, contractible; the identification is the unique
    map.
- **The deck action on a universal cover.** Tau Ceti's based-path universal cover carries a left
  action of the fundamental group itself, `g • mk x q = mk x (g⁻¹.toPath.trans q)`
  (`TauCeti.UniversalCover.smul_mk`): `g` acts by prepending the inverse loop class. For the
  cellular model the presented group acts through the inverse of its identification
  (`TauCeti.cellularClassifyingSpace_universalCover_smul_def`), and for this action the end-point
  projection is a quotient covering map
  (`TauCeti.isQuotientCoveringMap_cellularClassifyingSpace_universalCover`). For Milnor's model
  the countable join is the universal cover (`TauCeti.universalGSpaceHomeomorphUniversalCover`,
  a pointed homeomorphism over `BG`), and under it `g` acts by the left translation of the
  previous bullet.

  **Checks.**
  - `G = ℤ` with the presentation `⟨t | ⟩`: the generator `t` acts as the loop class `ℓ_t`
    around the circle of `t` (`TauCeti.cellularClassifyingSpace_universalCover_smul_def`), and a
    loop class acts by prepending its inverse (`TauCeti.UniversalCover.smul_mk`), so `t⁻¹` carries
    the base lift to the class of `ℓ_t`, the end point of the lift of `ℓ_t` that starts at the base
    lift. In degrees `1 → 0` of the pinned `TauCeti.cellularClassifyingSpaceResolution` the boundary
    of that lifted `1`-cell, oriented along `ℓ_t`, is therefore `t⁻¹ − 1` times the base lift; an
    action without the inverse would give `t − 1`. Both generate the augmentation ideal of
    `ℤ[ℤ]`, so exactness cannot tell them apart; the end point of the lift, computed here, does.
    The pinned model of `⟨t | ⟩` is not the circle's two-term resolution `ℤ[ℤ] → ℤ[ℤ] → ℤ`: the
    killing tower attaches a `3`-cell along every based map of a `2`-sphere into the presentation
    complex, constant maps included (`TauCeti.killingAttachingMaps`), so the degree-`3` term is a
    nonzero free module.
  - `G = 1`: the action is trivial and the universal cover is the space itself.
- **Orientation of the join.** The cells of `EG` are the simplices of the countable join,
  enumerated by increasing index (`TauCeti.universalGSpaceVertexOrder`); the explicit
  comparison with `Rep.standardComplex` sends `{(i₀, g₀), …, (iₙ, gₙ)}` with `i₀ < ⋯ < iₙ` to
  `(g₀, …, gₙ)`.
- **Coefficients.** `k` is a commutative ring in the universe of `G`, because Mathlib's
  `groupHomology` and `groupCohomology` take `k` and `G` in one universe (*Universes* above); the
  integral statements are the case `k = ℤ`, `G : Type`.
  Singular homology is Mathlib's `AlgebraicTopology.singularHomologyFunctor`, whose value on
  `ModuleCat.of k k` is by definition the homology of Tau Ceti's `TauCeti.singularChains k`;
  singular cohomology is `TopCat.singularCohomology`; homology and cohomology with local
  coefficients are `TauCeti.LocalCoefficientSystem.twistedHomology` and
  `TauCeti.LocalCoefficientSystem.twistedCohomology`.

## Exact supplier contracts

### From Mathlib

- `groupHomology`, `groupCohomology`, `groupHomology.map`, `groupCohomology.map`,
  `groupHomology.δ`, `groupCohomology.δ`, `groupHomologyIso`, `groupHomology.H1AddEquivOfIsTrivial`,
  `Rep.standardComplex`, `Rep.standardResolution`, `Rep.barComplex` and
  `classifyingSpaceUniversalCover` (`Mathlib/RepresentationTheory/Homological/`), with
  `Rep.trivial` and `Rep.ihom` (`Mathlib/RepresentationTheory/Rep/Basic.lean`) and
  `Rep.coinvariantsTensorFreeLEquiv` (`Mathlib/RepresentationTheory/Coinvariants.lean`): the
  algebraic side of every comparison. Nothing is assumed beyond their definitions and the
  functoriality Mathlib proves. Two conventions fix the signs of Layer 2: the bar differential in
  degree one is `d[g] = g·[] − []`, and `Rep.coinvariantsTensorFreeLEquiv` sends the class of
  `a ⊗ g·[x]` to `g⁻¹ • a` at `x`, which is `a` at `x` for trivial coefficients.
- `PresentedGroup`, `FreeGroup`, `Group.Presentation`, `Group.Presentation.ofFreeGroupHom` and
  `Group.Presentation.presentedGroupEquiv` (`Mathlib/GroupTheory/`): presentations, and the
  tautological presentation of a group by its own elements, which is why no finiteness
  hypothesis appears anywhere.
- `IsQuotientCoveringMap` (`Mathlib/Topology/Covering/Quotient.lean`), `FundamentalGroup`,
  `FundamentalGroup.mapOfEq`, `FundamentalGroup.mul_def`,
  `FundamentalGroup.fundamentalGroupMulEquivOfPath` (the change of base point along a path,
  `Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean`),
  `ContinuousMap.HomotopyEquiv`,
  `ContinuousMap.HomotopicRel`, `Topology.CWComplex`, `Topology.RelCWComplex.skeletonLT`,
  `Topology.CWComplex.cell` and `AlgebraicTopology.singularHomologyFunctor`.
- `Path.Homotopic.map_trans_evalAt`
  (`Mathlib/AlgebraicTopology/FundamentalGroupoid/InducedMaps.lean`): for a homotopy `K` from
  `g` to `g'` and a path `σ` from `a` to `b`, the paths `(g ∘ σ) · K_b` and `K_a · (g' ∘ σ)` are
  homotopic relative to their end points, where `K_a` is the trace of `a`;
  `ContinuousMap.Homotopy.eq_diag_path` in the same file is the same square in the fundamental
  groupoid. Used in the route of item 1.2.

### From Tau Ceti

The pinned directory `TauCeti/AlgebraicTopology/ClassifyingSpace/` is consumed as it stands. By
file:

- **Milnor's model** (`CountableJoin.lean`, `Action.lean`, `WeakContractibility.lean`,
  `Contractible.lean`, `Basic.lean`): `TauCeti.universalGSpace G`, its base point
  `TauCeti.universalGSpaceBasepoint G`, the map `MonoidHom.universalGSpaceMap` of a homomorphism
  with its base-point, identity and composition laws; the free action
  `TauCeti.instMulActionUniversalGSpace` with `TauCeti.instIsCancelSMulUniversalGSpace` and the
  disjointness of translates of an open star
  (`TauCeti.eq_one_of_image_smul_openStarRealization_inter_nonempty`); simple connectivity
  `TauCeti.instSimplyConnectedSpaceUniversalGSpace`, the vanishing of all homotopy groups
  `TauCeti.subsingleton_homotopyGroup_universalGSpace` and contractibility
  `TauCeti.instContractibleSpaceUniversalGSpace`; the orbit space `TauCeti.classifyingSpace G`,
  the orbit map `TauCeti.classifyingSpaceProj G` with
  `TauCeti.isQuotientCoveringMap_classifyingSpaceProj`, the base point
  `TauCeti.classifyingSpaceBasepoint G`, the quotient API
  (`TauCeti.classifyingSpaceProj_eq_iff_existsUnique`,
  `TauCeti.preimage_classifyingSpaceProj_singleton`, `TauCeti.classifyingSpaceLift`),
  `TauCeti.classifyingSpaceDeckMulEquiv : G ≃* deck p_G`, and the standing hypotheses
  `TauCeti.instPathConnectedSpaceClassifyingSpace`,
  `TauCeti.instLocallyPathConnectedSpaceClassifyingSpace` and
  `TauCeti.instSemilocallySimplyConnectedSpaceClassifyingSpace`.
- **Its fundamental group** (`EilenbergMacLane.lean`):
  `TauCeti.classifyingSpaceFundamentalGroupMulEquiv G : π₁(BG, b₀) ≃* G` with
  `TauCeti.classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`,
  `TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace G`,
  `TauCeti.subsingleton_homotopyGroup_classifyingSpace`, the existence theorem
  `TauCeti.exists_isEilenbergMacLaneSpaceOne` (a locally path-connected, semilocally simply
  connected `K(G, 1)` in the universe of `G`), and
  `TauCeti.universalGSpaceHomeomorphUniversalCover`.
- **Functoriality** (`Functoriality.lean`, `HomotopyFunctor.lean`): `MonoidHom.classifyingSpaceMap`
  with `MonoidHom.classifyingSpaceMap_proj`, `MonoidHom.classifyingSpaceMap_basepoint`,
  `MonoidHom.classifyingSpaceMap_id`, `MonoidHom.classifyingSpaceMap_comp` and
  `MonoidHom.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq` (the induced map on `π₁` is `φ`
  under the identifications); the functors `TauCeti.classifyingSpaceFunctor` to based spaces and
  `TauCeti.classifyingSpaceHomotopyFunctor` to the pointed homotopy category, the natural
  isomorphism `TauCeti.classifyingSpaceHomotopyFunctorCompFundamentalGroupFunctorIso` from
  `B ⋙ π₁` to the identity, faithfulness, and for the cellular model
  `TauCeti.fundamentalGroupFunctor_map_bijective_cellularClassifyingSpace` (pointed homotopy
  classes of maps into a space without higher homotopy are the homomorphisms of fundamental
  groups) and `TauCeti.quotient_map_eq_quotient_map_comp_cellularClassifyingSpace`.
- **CW structures** (`CWComplex.lean`): `TauCeti.instCWComplexUniversalGSpace` (cells the
  simplices, enumerated by `TauCeti.universalGSpaceVertexOrder`), the free cellular action
  `TauCeti.instMulActionCellUniversalGSpace` with `TauCeti.instIsCancelSMulCellUniversalGSpace`
  and `TauCeti.smul_openCell_universalGSpace`, and on the orbit space
  `TauCeti.instCWComplexClassifyingSpace`, `TauCeti.instT2SpaceClassifyingSpace` and
  `TauCeti.classifyingSpaceCellEquiv` (the `n`-cells of `BG` are the orbits of `n`-simplices,
  with characteristic maps `TauCeti.map_classifyingSpaceCellEquiv_symm_mk`). The general transfer
  of a CW structure along the quotient covering map of a free cellular action is
  `IsQuotientCoveringMap.cwComplexQuotient` (`TauCeti/Topology/CWComplex/Classical/OrbitSpace.lean`).
- **The presentation complex and the cellular model** (`PresentationComplex.lean`,
  `Cellular.lean`, and `TauCeti/AlgebraicTopology/Homotopy/KillHomotopyGroups.lean`):
  `TauCeti.PresentationComplex R` with `TauCeti.PresentationComplex.fundamentalGroupMulEquiv`
  (van Kampen's group-presentation corollary), `TauCeti.PresentationComplex.instCWComplex`,
  `TauCeti.PresentationComplex.cellOneEquiv`, `TauCeti.PresentationComplex.cellTwoEquiv` and
  `TauCeti.PresentationComplex.isEmpty_cell` (no cells above dimension two); the killing tower
  `TauCeti.killHomotopyGroups n X x` of any Hausdorff pointed space and `n ≥ 1`, with
  `TauCeti.bijective_homotopyGroupMap_killHomotopyGroupsIncl` (unchanged `π_k` for `k < n`),
  `TauCeti.subsingleton_homotopyGroup_killHomotopyGroups` (vanishing from `n` on),
  `TauCeti.isEilenbergMacLaneSpaceOne_killHomotopyGroups`, for a source that is a Hausdorff CW
  complex with no cells above dimension `n` the CW structure `TauCeti.killHomotopyGroupsCWComplex`
  and `TauCeti.cwType_killHomotopyGroups` (both take that dimension hypothesis, so neither applies
  to the killing tower of a source with higher cells, and no route below uses them), the
  extension theorems
  `TopCat.Hom.exists_killHomotopyGroupsIncl_comp_eq` and
  `TauCeti.exists_mapOfEq_comp_killHomotopyGroupsFundamentalGroupMulEquiv`; the cellular model
  `TauCeti.cellularClassifyingSpace R := killHomotopyGroups 2 (PresentationComplex R) _` with
  `TauCeti.cellularClassifyingSpaceFundamentalGroupMulEquiv`,
  `TauCeti.isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`,
  `TauCeti.instCWComplexCellularClassifyingSpace`, its single `0`-cell
  `TauCeti.skeletonLT_one_cellularClassifyingSpace`, the pointed maps out of it
  `TauCeti.exists_mapOfEq_cellularClassifyingSpace` and their uniqueness
  `TauCeti.homotopicRel_of_mapOfEq_eq_cellularClassifyingSpace`, and
  `TauCeti.PresentationComplex.homotopyEquivCellularClassifyingSpace` (an aspherical presentation
  complex is already the model).
- **Comparison and uniqueness** (`Comparison.lean`, `Uniqueness.lean`):
  `TauCeti.cellularClassifyingSpaceHomotopyEquiv R hY φ`, the homotopy equivalence from the
  cellular model to any aspherical space of CW type realizing `φ` by a pointed forward map
  (`TauCeti.cellularClassifyingSpaceHomotopyEquiv_toFun_basepoint`,
  `TauCeti.mapOfEq_cellularClassifyingSpaceHomotopyEquiv_toFun_apply`), unique up to pointed
  homotopy (`TauCeti.homotopicRel_cellularClassifyingSpaceHomotopyEquiv_toFun`), whose inverse
  induces `φ⁻¹` after a change of base point
  (`TauCeti.exists_path_map_cellularClassifyingSpaceHomotopyEquiv_invFun`); the comparison of the
  two models `TauCeti.cellularHomotopyEquivClassifyingSpace R e` for `e : PresentedGroup R ≃* G`,
  inducing `e` under the two identifications
  (`TauCeti.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq_cellularHomotopyEquivClassifyingSpace`)
  and determined by `e` up to pointed homotopy
  (`TauCeti.homotopicRel_cellularHomotopyEquivClassifyingSpace_toFun`); the standing hypotheses of
  the cellular model, `TauCeti.instSemilocallySimplyConnectedSpaceCellularClassifyingSpace` and,
  through `TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv`
  (`TauCeti/Topology/CWComplex/Classical/DeltaGenerated.lean`), local path-connectedness, packaged
  with existence in `TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`; and the
  uniqueness theorems `TauCeti.IsAspherical.exists_homotopyEquiv` (aspherical spaces of CW type
  are homotopy equivalent by an equivalence realizing a prescribed isomorphism of fundamental
  groups up to a change of base point along a path),
  `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` and
  `TauCeti.IsAspherical.exists_homotopyEquiv_classifyingSpace`.
- **Resolutions** (`Resolution.lean`, `Acyclic.lean`, `StandardComplex.lean`,
  `StandardResolution.lean`, `Naturality.lean`, `PresentedGroupResolution.lean`):
  `TauCeti.universalGSpaceResolution k G`, the ordered chains of the countable join as a
  projective resolution of `Rep.trivial k G k`, exact by
  `TauCeti.quasiIso_orderedSimplicialChainComplexAugmentation_indexedJoin`; the explicit chain
  map `TauCeti.universalGSpaceChainComplexToStandardComplex` to `Rep.standardComplex k G`
  (module level `TauCeti.universalGSpaceToStandardComplex`), the homotopy equivalence of
  resolutions `TauCeti.universalGSpaceStandardHomotopyEquiv` whose forward map it is, its
  homotopy `TauCeti.universalGSpaceChainComplexToStandardComplexHomotopy` to Mathlib's abstract
  comparison, and its naturality `MonoidHom.universalGSpaceChainComplexToStandardComplex_naturality`;
  for the cellular model `TauCeti.cellularClassifyingSpaceResolution R k`, an instance of the
  general `TauCeti.cellularResolutionOfIsAspherical`
  (`TauCeti/AlgebraicTopology/EilenbergMacLane/Resolution.lean`: the lifted cellular chains of
  the universal cover of an aspherical Hausdorff CW complex are a projective resolution).
- **(Co)homology of Milnor's model** (`Homology.lean`, `Cohomology.lean`,
  `LocalCoefficients.lean`, `FirstHomology.lean`):
  `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology k G n : Hₙ(BG; k) ≅ Hₙ(G, k)`,
  natural in the group (`MonoidHom.classifyingSpaceSingularHomologyIsoGroupHomology_hom_naturality`:
  the map of `MonoidHom.classifyingSpaceMap φ` goes to `groupHomology.map φ`);
  `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology k G M n : Hⁿ(BG; M) ≅ Hⁿ(G, M)`
  for a `k`-module `M`, natural in the coefficients
  (`TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology_hom_naturality`), in the group
  (`MonoidHom.classifyingSpaceSingularCohomologyIsoGroupCohomology_hom_naturality`) and carrying
  the Bockstein of a short exact sequence of modules to `groupCohomology.δ`
  (`TauCeti.singularCohomologyBockstein_comp_classifyingSpaceSingularCohomologyIsoGroupCohomology_hom`);
  with local coefficients, the local system `TauCeti.classifyingSpaceLocalSystem k A` of a
  representation `A : Rep k G` through the orbit map, with
  `TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology : Hₙ(BG; A) ≅ Hₙ(G, A)` and
  `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology : Hⁿ(BG; A, N) ≅ Hⁿ(G, Homₖ(A, N))`,
  natural in `A` and compatible with the connecting maps of short exact sequences
  (`TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology_hom_naturality`,
  `TauCeti.twistedHomologyδ_comp_classifyingSpaceTwistedHomologyIsoGroupHomology_hom`); and in
  degree one `TauCeti.classifyingSpaceFirstHomologyAddEquiv : H₁(BG; ℤ) ≃+ Gᵃᵇ` through Hurewicz,
  with `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology` to Mathlib's `H₁(G, ℤ)`,
  which sends the Hurewicz class of a loop `γ` to the `1`-cycle
  `classifyingSpaceFundamentalGroupMulEquiv G γ`
  (`TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology_hurewiczHomologyAddEquiv`). It is
  not the degree-one case of `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology ℤ G 1`,
  which sends that class to the `1`-cycle of the inverse element (2.1); the two differ by
  negation.
- **Examples** (`Circle.lean`, `WedgeCircles.lean`, `Torus.lean`, `FiniteCyclic.lean`,
  `Torsion.lean`): `TauCeti.circleHomotopyEquivClassifyingSpace` with a pointed forward map
  inducing the identity of `ℤ`
  (`TauCeti.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq_circleToClassifyingSpace`);
  `TauCeti.wedgeCirclesHomotopyEquivClassifyingSpace` and
  `TauCeti.wedgeCirclesHomotopyEquivCellularClassifyingSpace` for a free group, with
  `TauCeti.isZero_groupHomology_freeGroup` in degrees at least two;
  `TauCeti.torusHomotopyEquivClassifyingSpace` with
  `TauCeti.finrank_groupHomology_pi_multiplicative_int` (rank `card ι choose n`);
  for a finite cyclic group `TauCeti.classifyingSpaceSingularHomologyIntLinearEquivOdd`
  (`ℤ/n` in odd degrees) and `TauCeti.subsingleton_classifyingSpace_singularHomology_int_of_even`
  (zero in positive even degrees, in particular `H₂ = 0`); and for a finite group
  `TauCeti.natCard_nsmul_classifyingSpace_singularHomology_eq_zero`.

Other pinned Tau Ceti declarations the routes below use, each named at the target that uses it:
`TauCeti.IsAspherical`, `TauCeti.IsAspherical.of_basepoint`, `TauCeti.IsEilenbergMacLaneSpaceOne`
(`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean`);
`TauCeti.homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex` and
`TauCeti.homotopicRel_skeletonLT_one_of_forall_homotopicRel`
(`TauCeti/AlgebraicTopology/EilenbergMacLane/Homotopic.lean`);
`TauCeti.IsAspherical.isWeakHomotopyEquivalence_iff`
(`TauCeti/AlgebraicTopology/EilenbergMacLane/WeakHomotopyEquivalence.lean`);
`ContinuousMap.IsWeakHomotopyEquivalence.exists_comp_homotopic` (a map out of a space of CW type
lifts through a weak homotopy equivalence up to homotopy, Hatcher, Proposition 4.22, p. 357),
`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv` and
`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv_toFun`
(`TauCeti/AlgebraicTopology/Homotopy/Whitehead.lean`); `TauCeti.CWType` and
`TauCeti.CWType.of_cwComplex_univ` (`TauCeti/Topology/CWComplex/Classical/CWType.lean`);
`TauCeti.zeroSkeletonDiscreteTopology` (`TauCeti/Topology/CWComplex/Classical/Zero.lean`);
`TauCeti.openCellChart` (the inverse of the characteristic map of an `n`-cell, a chart of the
`n`-skeleton with source the open cell and target the open unit ball) and
`TauCeti.isOpen_preimage_val_openCell` (an open `n`-cell is open in the `n`-skeleton)
(`TauCeti/Topology/CWComplex/Classical/OpenCells.lean`);
`TauCeti.hasHomotopyExtensionProperty_skeletonLT`
(`TauCeti/Topology/Homotopy/Extension/CWComplex.lean`);
`TauCeti.HasHomotopyExtensionProperty.exists_extension_of_isClosed` (for a closed subset the
target may lie in any universe) (`TauCeti/Topology/Homotopy/Extension/Basic.lean`);
`TauCeti.NDRPair.ofHomotopyRel` (NDR data from a deformation of a neighbourhood `U` onto `A`
relative to `A` and a function vanishing exactly on `A` and less than `1` only on `U`) and
`TauCeti.NDRPair.hasHomotopyExtensionProperty`
(`TauCeti/Topology/Homotopy/Extension/NDRPair.lean`);
`TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod` (for a closed `A ⊆ X`
with the homotopy extension property, so has `{0, 1} × X ∪ I × A ⊆ I × X`)
(`TauCeti/Topology/Homotopy/Extension/Prod.lean`);
`ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence`
(`TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean`) and
`TauCeti.isAspherical_iff` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean`), with
Mathlib's `Homeomorph.ulift`, for moving a target to another universe;
`FundamentalGroup.map_fundamentalGroupMulEquivOfPath` (induced maps commute with Mathlib's
change of base point along a path), `ContinuousMap.Homotopy.fundamentalGroupMulEquivOfPath_evalAt_map` and
`ContinuousMap.Homotopy.exists_path_fundamentalGroupMulEquivOfPath_map_comp`
(`TauCeti/AlgebraicTopology/FundamentalGroup/BasepointChange.lean`);
`ContinuousMap.HomotopyEquiv.singularHomologyIso` and
`ContinuousMap.singularHomologyMap_eq_of_homotopic` (homotopic maps induce the same map on
singular homology) (`TauCeti/AlgebraicTopology/Singular/Homotopy/Invariance.lean`);
`TauCeti.singularChains_d_pathChain` (the chain of a path has boundary its end point minus its
start point) and `TauCeti.singularChains_map_f_pathChain` (pushing the chain of a path forward
gives the chain of the composite) (`TauCeti/AlgebraicTopology/Singular/ModuleChains/Basic.lean`);
`IsQuotientCoveringMap.singularHomologyIsoGroupHomology` (the comparison for the base of a
contractible free quotient cover, of which the pinned comparison for Milnor's model is the
instance) and
`IsQuotientCoveringMap.singularChainsRepCoinvariantsTensorIso_hom_f_coinvariantsTensorMk` (the
class of `a ⊗ c` in `(k ⊗ C(E))_G` goes to `a • p_* c`)
(`TauCeti/AlgebraicTopology/Singular/ModuleChains/GroupHomology.lean`);
`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`,
`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv_ofMul_of_mk` (the Hurewicz image of the class of a
loop `γ` is the image of the class of `γ` in Tau Ceti's auxiliary `H₁` under
`TauCeti.HurewiczOne.H₁AddEquivHomology`) and `TauCeti.HurewiczOne.H₁AddEquivHomology_loopClass`
(that image is the homology class of any `1`-cycle whose chain is the chain of `γ`); together,
the Hurewicz class of a loop is the homology class of its chain
(`TauCeti/AlgebraicTopology/Homotopy/Hurewicz/One/Basic.lean`);
`TopCat.isIso_singularCohomologyMap` (for a map with a homotopy inverse, both homotopies given)
and `TopCat.Homotopy.congr_singularCohomologyMap` (homotopic maps induce the same map on singular
cohomology) (`TauCeti/AlgebraicTopology/Cohomology/HomotopyInvariance.lean`);
`TopCat.singularCohomologyBockstein_naturality` (the Bockstein of a short exact sequence of
coefficients commutes with the map induced by a continuous map)
(`TauCeti/AlgebraicTopology/Cohomology/Bockstein.lean`);
`TauCeti.LocalCoefficientSystem.ofRepresentation`,
`TauCeti.LocalCoefficientSystem.monodromyRepresentation_ofRepresentation` and
`TauCeti.LocalCoefficientSystem.ofRepresentationMonodromyIso`
(`TauCeti/AlgebraicTopology/LocalCoefficient/Representation.lean`);
`TauCeti.Groupoid.natIsoOfEnd` and `TauCeti.Groupoid.eq_natIsoOfEnd` (on a connected groupoid,
an isomorphism of the values of two functors at one object, equivariant for its endomorphisms,
extends to a unique natural isomorphism with that component)
(`TauCeti/CategoryTheory/Groupoid/ConnectedFunctor.lean`);
`TauCeti.LocalCoefficientSystem.pullbackHomotopyIso`,
`TauCeti.LocalCoefficientSystem.pullback_monodromyRepresentation` (the monodromy of a pulled-back
system at `x` is the monodromy at the image point composed with the induced map of fundamental
groups) and `TauCeti.LocalCoefficientSystem.constant_monodromyRepresentation` (a constant system
has trivial monodromy) (`TauCeti/AlgebraicTopology/LocalCoefficient.lean`);
`IsQuotientCoveringMap.associatedLocalSystem_map_coinvariantsTensorMk` (transport along a path
class sends the class of `a ⊗ e` to the class of `a ⊗ e'`, `e'` the end point of the lift
starting at `e`) (`TauCeti/AlgebraicTopology/LocalCoefficient/QuotientCovering/Basic.lean`);
`IsQuotientCoveringMap.associatedLocalSystemFiberIso` with
`IsQuotientCoveringMap.associatedLocalSystemFiberIso_hom_coinvariantsTensorMk` (a point `e` over
`b` identifies the fibre `(A ⊗ k[p⁻¹ b])_G` with `A`, sending the class of `a ⊗ (g • e)` to
`g⁻¹ • a`) (`TauCeti/AlgebraicTopology/LocalCoefficient/QuotientCovering/Exact.lean`);
`ContinuousMap.HomotopyEquiv.isIso_twistedHomologyMap`
(`TauCeti/AlgebraicTopology/Singular/Twisted/HomotopyInvariance/Basic.lean`),
`TopCat.Homotopy.twistedCohomologyMap_eq_comp`
(`TauCeti/AlgebraicTopology/Cohomology/Twisted/HomotopyInvariance.lean`),
`TauCeti.LocalCoefficientSystem.twistedHomologyConstantIso` and
`TauCeti.LocalCoefficientSystem.twistedCohomologyConstantIso`
(`TauCeti/AlgebraicTopology/Singular/Twisted/Basic.lean`,
`TauCeti/AlgebraicTopology/Cohomology/Twisted/Basic.lean`),
`TauCeti.LocalCoefficientSystem.twistedHomology₀IsoCoinvariants`
(`TauCeti/AlgebraicTopology/Singular/Twisted/Coinvariants.lean`, for a path-connected space and a
commutative ring);
`TauCeti.UniversalCover.smul_mk`, `TauCeti.UniversalCover.deckFundamentalGroupEquiv` and
`TauCeti.UniversalCover.deckFundamentalGroupEquiv_symm_op`
(`TauCeti/AlgebraicTopology/UniversalCover/`).

## How to read the build

Layer 1 proves Hatcher's Proposition 1B.9 for an arbitrary path-connected Hausdorff CW source
and an arbitrary base point, by reducing to the pinned theorems. For a vertex: the killing tower
turns the source into an aspherical space containing it, the pinned cellular model of its
fundamental group maps into that space by a weak homotopy equivalence, the source lifts through
it up to homotopy because it has CW type, the pinned pointed maps out of the cellular model into
the target give the map, and the homotopy extension property of the `0`-skeleton moves the base
point and, in the uniqueness clause, makes two maps agree on the `0`-skeleton so that the pinned
one-skeleton criterion applies. An arbitrary base point is then reduced to a vertex along a path,
through the homotopy extension property of a point, which item 1.1 proves from pinned NDR data
in the skeleton of the cell containing the point. The last item of Layer 1 upgrades the pinned
uniqueness up to base-point change to pointed uniqueness, by Whitehead's theorem. Layer 2
defines the comparison of the (co)homology of an arbitrary Hausdorff CW `K(G, 1)` with group
(co)homology by pulling the pinned comparison for Milnor's model back along the pointed
comparison map of Layer 1, proves that the result depends only on the chosen identification of
the fundamental group, that it is natural, and that it extends to local coefficients. Layer 2
depends on Layer 1; Layer 1 depends only on the pins.

## Layer 1: maps into aspherical spaces and pointed uniqueness

Throughout, `X : Type u` is a path-connected Hausdorff CW complex with an arbitrary base point
`x`, and `(Y, y)`, `Y : Type v`, is an aspherical pointed space, `TauCeti.IsAspherical Y y`:
path-connected with vanishing homotopy groups from degree two on, so that its homotopy groups
vanish from degree two on at every point (`TauCeti.IsAspherical.of_basepoint`). The target needs
no CW structure, and its base point is arbitrary. The universes `u` and `v` are independent.

### 1.1 Existence of a pointed map realizing a homomorphism

Prove first that every point `x` of a Hausdorff CW complex `X` has the homotopy extension
property, `TauCeti.HasHomotopyExtensionProperty ({x} : Set X)`: for a map `f₀ : X → Y`, every
path starting at `f₀ x` is the trace at `x` of a homotopy of `f₀`, with `Y` in any universe
because `{x}` is closed (`TauCeti.HasHomotopyExtensionProperty.exists_extension_of_isClosed`).
Hatcher proves the homotopy extension property for CW pairs (Proposition 0.16, p. 15) and the
local contractibility of CW complexes behind it (Proposition A.4, p. 522); a point of a cell of
positive dimension is a subcomplex only after a subdivision, which the route avoids. Route. A
vertex `x` is handled by the `0`-skeleton: extend the prescribed homotopy by constant homotopies
at the other vertices, which is continuous because the `0`-skeleton is discrete
(`TauCeti.zeroSkeletonDiscreteTopology`), and then over `X` by
`TauCeti.hasHomotopyExtensionProperty_skeletonLT` with `k = 1`. Otherwise `x` lies in an open
`n`-cell `e` with `n ≥ 1`. In the `n`-skeleton `Xⁿ` the cell `e` is open
(`TauCeti.isOpen_preimage_val_openCell`), and the chart `TauCeti.openCellChart` identifies it with
the open unit ball, sending `x` to a point `z₀`. Put `r := (1 − ‖z₀‖) / 2`, let `U ⊆ Xⁿ` be the
image of the closed ball of radius `r` about `z₀`, `D` the straight-line contraction of `U` onto
`x` (it fixes `x`), and `c : Xⁿ → I` the function equal to `min 1 (‖chart p − z₀‖ / r)` on `e` and
to `1` off `e`. It is continuous, because `U` is compact, hence closed in the Hausdorff space
`Xⁿ`, and `c = 1` off `U`; it vanishes exactly at `x`, and `c < 1` only on `U`.
`TauCeti.NDRPair.ofHomotopyRel` turns `(U, D, c)` into NDR data for `{x}` in `Xⁿ`, so `{x}` has
the homotopy extension property in `Xⁿ` (`TauCeti.NDRPair.hasHomotopyExtensionProperty`). A
homotopy prescribed at `x` extends first over `Xⁿ` and then over `X`, since `Xⁿ` is closed and
has the homotopy extension property in `X` (`TauCeti.hasHomotopyExtensionProperty_skeletonLT`
with `k = n + 1`). The detour through `Xⁿ` is needed: when cells of higher dimension are attached
along `e`, the image of a ball in `e` is not a neighbourhood of `x` in `X`.

Then prove that every homomorphism `φ : π₁(X, x) →* π₁(Y, y)` is induced by a pointed map
`f : X → Y`, `f x = y`, `FundamentalGroup.mapOfEq f hf = φ` (Hatcher, Proposition 1B.9, p. 90,
existence clause, proof pp. 90–91; the headline `exists_continuousMap_mapOfEq_eq_of_isAspherical`,
whose existence clause this is). Hatcher states the proposition for a target with a contractible
universal cover (p. 87); the extension over a cell of dimension `n ≥ 3` in his proof (p. 91) uses
only `π_{n−1}(Y) = 0`, which is the hypothesis here and that of the pinned
`TauCeti.exists_mapOfEq_cellularClassifyingSpace`. Route, through the pinned theorems rather than
through a maximal tree, first for a vertex `x` and for `Y` in the universe of `X`.
`X' := TauCeti.killHomotopyGroups 2 X x` is a Hausdorff space containing `X` by the inclusion
`ι`, aspherical at `ι x`, and `ι` induces an isomorphism `ι_* : π₁(X, x) ≃* π₁(X', ι x)`
(`TauCeti.isEilenbergMacLaneSpaceOne_killHomotopyGroups`,
`TauCeti.killHomotopyGroupsFundamentalGroupMulEquiv`,
`TauCeti.subsingleton_homotopyGroup_killHomotopyGroups`).
No CW structure on `X'` is asserted or needed: the pinned CW structure of the killing tower
requires a source without cells above dimension two. Take a presentation `R` of `π₁(X, x)`
(`TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`) with
`C := TauCeti.cellularClassifyingSpace R`, base point
`c₀ := TauCeti.cellularClassifyingSpaceBasepoint R` and `ψ : π₁(C, c₀) ≃* π₁(X, x)`. The pinned
`TauCeti.exists_mapOfEq_cellularClassifyingSpace`,
applied to the target `(X', ι x)`, gives a pointed map `e : C → X'` inducing `ι_* ∘ ψ`; `e` is a
weak homotopy equivalence, because `C` and `X'` are aspherical and `ι_* ∘ ψ` is bijective
(`TauCeti.IsAspherical.isWeakHomotopyEquivalence_iff`). `X` has CW type
(`TauCeti.CWType.of_cwComplex_univ`), so `ι` lifts through `e` up to homotopy
(`ContinuousMap.IsWeakHomotopyEquivalence.exists_comp_homotopic`): there are `ℓ : X → C` and a
homotopy `H` from `e ∘ ℓ` to `ι`, with trace `τ := H.evalAt x`, a path in `X'` from `e (ℓ x)` to
`ι x`. Since `C` is path-connected and `e` induces a bijection `π₁(C, c₀) → π₁(X', ι x)`, there
is a path `δ` in `C` from `ℓ x` to `c₀` with `e ∘ δ` homotopic to `τ` relative to the end points
(start from any path `δ₀` from `ℓ x` to `c₀`, and correct it by the loop at `c₀` whose image under
`e` is the class of `τ⁻¹ · (e ∘ δ₀)`). The pinned `TauCeti.exists_mapOfEq_cellularClassifyingSpace`,
applied to `(Y, y)`, gives a pointed map `g : C → Y` inducing `φ ∘ ψ`. Then `f₀ := g ∘ ℓ : X → Y`
sends `x` to `g (ℓ x)`, and the change of base point along `g ∘ δ` carries the map it induces to
`φ`: the change along `g ∘ δ` of `g_* ∘ ℓ_*` is `g_* ∘ ℓ^δ` with `ℓ^δ` the change of `ℓ_*` along
`δ` (`FundamentalGroup.map_fundamentalGroupMulEquivOfPath`); `e_* ∘ ℓ^δ` is the change of
`(e ∘ ℓ)_*` along `e ∘ δ`, that is along `τ`, which is `ι_*`
(`ContinuousMap.Homotopy.fundamentalGroupMulEquivOfPath_evalAt_map` for `H`); as `e_* = ι_* ∘ ψ`
this says `ψ ∘ ℓ^δ = id`, so `g_* ∘ ℓ^δ = φ ∘ ψ ∘ ψ⁻¹ = φ`. Finally move the base point: the
`0`-skeleton of `X` is discrete (`TauCeti.zeroSkeletonDiscreteTopology`), so the family of paths
that follows `g ∘ δ` at the vertex `x` and is constant at every other vertex is a homotopy on
the `0`-skeleton, which the homotopy extension property of the `0`-skeleton
(`TauCeti.hasHomotopyExtensionProperty_skeletonLT` with `k = 1`) extends to a homotopy `K` of
`f₀` whose trace at `x` is `g ∘ δ`; its end map `f` satisfies `f x = y`, and it induces `φ`
because a homotopy changes the induced map on `π₁` exactly by the change of base point along the
trace of the base point (`ContinuousMap.Homotopy.fundamentalGroupMulEquivOfPath_evalAt_map` for
`K`).

*Another universe.* For `Y : Type v` with `v` other than `u`, run the same route with a
presentation of `ULift.{v} π₁(X, x)`, a group in the universe `max u v`, so that `C` lies in that
universe, and with the targets `X'` and `Y` replaced by their `ULift` copies, which are aspherical
at the lifted base points because `Homeomorph.ulift` is a homotopy equivalence, hence a weak
homotopy equivalence (`ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence`,
`TauCeti.isAspherical_iff`). Only the source `X` needs a CW structure, and it is not lifted; the
map into `Y` is the composite with `Homeomorph.ulift`.

*Another base point.* For an arbitrary `x`, choose a vertex `v` (a cell of least dimension is a
`0`-cell, since the boundary of a cell of positive dimension is a nonempty subset of cells of
lower dimension) and a path `α` from `x` to `v`, and write `β_α : π₁(X, x) ≃* π₁(X, v)` for the
change of base point along `α` (`FundamentalGroup.fundamentalGroupMulEquivOfPath`). The vertex
case applied to `φ ∘ β_α⁻¹` gives a map `f₀` with `f₀ v = y` inducing `φ ∘ β_α⁻¹` at `v`. The
path `f₀ ∘ α` runs from `f₀ x` to `y`; by the homotopy extension property of `{x}` it is the trace
at `x` of a homotopy `K` from `f₀` to a map `f`, so that `f x = y`. At `x`, `f` induces the change
along `f₀ ∘ α` of the map `f₀` induces at `x`
(`ContinuousMap.Homotopy.fundamentalGroupMulEquivOfPath_evalAt_map` for `K`), which is the map
`f₀` induces at `v` composed with `β_α` (`FundamentalGroup.map_fundamentalGroupMulEquivOfPath`
for `α`), that is `φ ∘ β_α⁻¹ ∘ β_α = φ`.

*Needs:* Tau Ceti `TauCeti.killHomotopyGroups`, `TauCeti.killHomotopyGroupsIncl`,
`TauCeti.isEilenbergMacLaneSpaceOne_killHomotopyGroups`,
`TauCeti.killHomotopyGroupsFundamentalGroupMulEquiv`,
`TauCeti.subsingleton_homotopyGroup_killHomotopyGroups`,
`TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace` (a presentation of
`π₁(X, x)`), `TauCeti.exists_mapOfEq_cellularClassifyingSpace` (twice, with targets `X'` and `Y`),
`TauCeti.IsAspherical.isWeakHomotopyEquivalence_iff`, `TauCeti.IsAspherical.of_basepoint`,
`TauCeti.CWType.of_cwComplex_univ`, `ContinuousMap.IsWeakHomotopyEquivalence.exists_comp_homotopic`,
`FundamentalGroup.map_fundamentalGroupMulEquivOfPath`, `TauCeti.zeroSkeletonDiscreteTopology`,
`TauCeti.hasHomotopyExtensionProperty_skeletonLT`,
`ContinuousMap.Homotopy.fundamentalGroupMulEquivOfPath_evalAt_map`,
`TauCeti.isOpen_preimage_val_openCell`, `TauCeti.openCellChart`, `TauCeti.NDRPair.ofHomotopyRel`,
`TauCeti.NDRPair.hasHomotopyExtensionProperty`,
`TauCeti.HasHomotopyExtensionProperty.exists_extension_of_isClosed`,
`ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence`, `TauCeti.isAspherical_iff`; Mathlib
`FundamentalGroup.mapOfEq`, `FundamentalGroup.fundamentalGroupMulEquivOfPath`, `Homeomorph.ulift`.

**Checks.**
- Negative control on the homotopy extension property of a point: in
  `X = {0} ∪ {1/m : m ≥ 1} ⊆ ℝ`, which is not a CW complex (it is totally disconnected, so a CW
  structure would have only `0`-cells and be discrete, and it is not discrete), the point `0` does
  not have it. A retraction of `I × X` onto `{0} × X ∪ I × {0}` would map each segment
  `I × {1/m}` into the component of `(0, 1/m)`, which is isolated in that subset, so it would send
  every `(t, 1/m)` to `(0, 1/m)` and, by continuity, `(1, 0)` to `(0, 0)`, while it must fix
  `(1, 0)`.
- The detour through the skeleton: `X = D²` with one `0`-cell, the boundary circle as its `1`-cell
  and one `2`-cell, and `x` a point of the open `1`-cell. An arc of the circle around `x` is not a
  neighbourhood of `x` in `D²`, so no control function on `D²` is less than `1` only on such an
  arc; the route builds the NDR data in the `1`-skeleton, the circle, and extends from the circle
  to `D²`.
- A base point off the `0`-skeleton: `X` the circle `S¹ ⊆ ℂ` with the single `0`-cell `v = 1`,
  `x = −1`, `Y = S¹` based at `−1`, and `φ` the identity. The rotation by `π` realizes the vertex
  case (it sends `v` to `−1` and has degree one) but sends `x` to `1`; with `α` the upper half
  circle, the homotopy through the rotations by `π − π t` has trace `f₀ ∘ α` at `x` and ends at
  the identity, which realizes `φ`. A statement restricted to vertices does not apply to `x`.
- `X = TauCeti.cellularClassifyingSpace R`: the construction returns a map pointed homotopic to
  the pinned one of `TauCeti.exists_mapOfEq_cellularClassifyingSpace`, by item 1.2.
- `X` the circle, `Y = B(ℤ)`, `φ` the identity of `ℤ` under the pinned identifications: the map
  is pointed homotopic to `TauCeti.circleToClassifyingSpace`, which wraps the circle once around a
  loop representing the generator; a construction that forgot to move the base point would end at
  `g (ℓ x) ≠ b₀` in general and would not be a pointed map at all.
- The correction of `δ` matters: with an uncorrected `δ₀`, `e ∘ δ₀` and `τ` differ by a loop
  `λ` at `ι x`, and `g ∘ ℓ` induces `φ` conjugated by `φ(ι_*⁻¹ λ)` after the change of base
  point along `g ∘ δ₀`; for `X` the wedge of two circles, `Y = B(F₂)` and `φ` the identity this
  is not `φ` as soon as `λ` is not central, which in `F₂` is every nontrivial loop.
- `φ` trivial: the constant map at `y` realizes it; for `X` the circle and `Y` the circle this
  says the constant map, and by item 1.2 every pointed map of degree zero, is null-homotopic
  relative to the base point.
- Negative control on the target: `Y = S²` is path-connected with trivial `π₁` but `π₂ ≠ 0`, and
  for `X = S²` the identity and the constant map both induce the trivial homomorphism on `π₁`
  yet are not homotopic (they have different degrees), so the uniqueness clause of 1.2 fails
  without asphericity; the existence clause for `Y = S²` holds for trivial reasons only.

### 1.2 Uniqueness relative to the base point

Prove that two pointed maps `f, g : X → Y` with `FundamentalGroup.mapOfEq f hf =
FundamentalGroup.mapOfEq g hg` are homotopic relative to `{x}` (Hatcher, Proposition 1B.9, p. 90,
uniqueness clause; the uniqueness clause of `exists_continuousMap_mapOfEq_eq_of_isAspherical`).
The pinned `TauCeti.homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex` proves this when the
`0`-skeleton of `X` is `{x}`, and `TauCeti.homotopicRel_skeletonLT_one_of_forall_homotopicRel`
proves, for any CW complex, that `f` and `g` are homotopic relative to the whole `0`-skeleton as
soon as for every path `γ` in `X` between points of the `0`-skeleton the paths `f ∘ γ` and
`g ∘ γ` are homotopic relative to their end points, for a target whose homotopy groups vanish
from degree two on at every point (`TauCeti.IsAspherical.of_basepoint`). Route, first for a
vertex `x`: `X` is path-connected, so choose for every vertex `v` a path `σ_v` from `x` to `v`,
with `σ_x` constant. The paths
`(g ∘ σ_v)⁻¹ · (f ∘ σ_v)` from `g v` to `f v`, constant at `v = x`, form a homotopy on the
discrete `0`-skeleton; extend it by the homotopy extension property of the `0`-skeleton to a
homotopy `K` from `g` to a map `g'` that agrees with `f` on the `0`-skeleton, whose trace `K_v`
at each vertex `v` is the prescribed path and whose trace at `x` is constant, so that `g'` is
homotopic to `g` relative to `x` and induces the same map on `π₁(X, x)` as `g`. Unwind the
definition of `g'` on the paths `σ_v` by the square of the homotopy `K` over `σ_v`
(Mathlib's `Path.Homotopic.map_trans_evalAt`): `(g ∘ σ_v) · K_v` and `K_x · (g' ∘ σ_v)` are
homotopic relative to their end points, and with `K_x` constant and
`K_v = (g ∘ σ_v)⁻¹ · (f ∘ σ_v)` this says that `g' ∘ σ_v` and `f ∘ σ_v` are homotopic relative to
their end points. For a path `γ` from a vertex `a` to a vertex `b`, the loop
`σ_a · γ · σ_b⁻¹` at `x` has the same image under `f` and `g'`; replacing `g' ∘ σ_a` by `f ∘ σ_a`
and `g' ∘ σ_b` by `f ∘ σ_b` and cancelling them shows that `f ∘ γ` and `g' ∘ γ` are homotopic
relative to the end points. The pinned criterion gives `f ≃ g'` relative to the `0`-skeleton,
which contains `x`, and concatenating with `g' ≃ g` relative to `x` gives the claim.

*Another base point.* For an arbitrary `x`, let `φ` be the map that `f` and `g` induce at `x`,
and choose a vertex `v` and a path `α` from `x` to `v` as in 1.1. The homotopy extension property
of the `0`-skeleton, with the path `(f ∘ α)⁻¹` prescribed at `v` and constant paths at the other
vertices, gives a homotopy `F` from `f` to a map `f'` with `f' v = y`, whose trace `τ_f := F_x` at
`x` runs from `y` to `f' x`; likewise `G` from `g` to `g'` with `g' v = y` and trace `τ_g` at `x`.
The square of `F` over `α` (`Path.Homotopic.map_trans_evalAt`) says that `(f ∘ α) · (f ∘ α)⁻¹`
and `τ_f · (f' ∘ α)` are homotopic relative to their end points, so `f' ∘ α ≃ τ_f⁻¹`; with
`ContinuousMap.Homotopy.fundamentalGroupMulEquivOfPath_evalAt_map` for `F` and
`FundamentalGroup.map_fundamentalGroupMulEquivOfPath` for `α`, the map `f'` induces at `v` is
`φ ∘ β_α⁻¹`, and so is the map `g'` induces. The vertex case gives a homotopy `H` from `f'` to
`g'` relative to `{v}`, and the square of `H` over `α` gives `H_x ≃ τ_f⁻¹ · τ_g`. The
concatenation of `F`, `H` and the reverse of `G` is therefore a homotopy from `f` to `g` whose
trace at `x`, `τ_f · H_x · τ_g⁻¹`, is a null-homotopic loop at `y`. Such a homotopy is replaced by
one relative to `{x}`: on `{0, 1} × X ∪ I × {x}`, a null-homotopy of the trace relative to its end
points, together with the constant homotopies at the two ends, is a homotopy starting at the
restriction of the concatenation; it extends over `I × X`, because that closed subset has the
homotopy extension property
(`TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod` applied to the
homotopy extension property of `{x}` from 1.1, and
`TauCeti.HasHomotopyExtensionProperty.exists_extension_of_isClosed` for `Y` in another universe),
and the end of the extension is a homotopy from `f` to `g` relative to `{x}`.

*Needs:* (1.1) for the homotopy extension property of a point and the choice of `v` and `α`; Tau
Ceti `TauCeti.homotopicRel_skeletonLT_one_of_forall_homotopicRel`,
`TauCeti.IsAspherical.of_basepoint`,
`TauCeti.zeroSkeletonDiscreteTopology`, `TauCeti.hasHomotopyExtensionProperty_skeletonLT`,
`ContinuousMap.Homotopy.fundamentalGroupMulEquivOfPath_evalAt_map`,
`FundamentalGroup.map_fundamentalGroupMulEquivOfPath`,
`TauCeti.HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod`,
`TauCeti.HasHomotopyExtensionProperty.exists_extension_of_isClosed`; Mathlib
`Path.Homotopic.map_trans_evalAt`, `ContinuousMap.HomotopicRel`, `FundamentalGroup.mapOfEq`,
`FundamentalGroup.fundamentalGroupMulEquivOfPath`.

**Checks.**
- `X` with a single `0`-cell: `g' = g`, and the statement is the pinned
  `TauCeti.homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex`.
- A base point off the `0`-skeleton: `X = [0, 1]` with the vertices `0` and `1`, `x = 1/2`, `Y`
  the circle `S¹ ⊆ ℂ`, `f(t) = exp(2πi(t − 1/2)) · y` and `g` constant at `y`. Both are pointed and
  induce the trivial homomorphism of the trivial group, and `(s, t) ↦ f((1 − s) t + s/2)` is a
  homotopy from `f` to `g` relative to `{1/2}`, as the theorem says, although `f` and `g` differ
  at both vertices.
- The last step of the reduction needs a null-homotopic trace: for `X = Y = S¹`, `x` off the
  single `0`-cell and `f = g` the identity, the rotations by `2π t` form a homotopy from `f` to `g`
  whose trace at `x` has degree one, and the extension step cannot turn it into a homotopy
  relative to `{x}`, since it needs a null-homotopy of that trace. The route's trace
  `τ_f · H_x · τ_g⁻¹` is null-homotopic by the two squares, which is what the step uses.
- `X` a wedge of two circles with two `0`-cells joined by an edge, `Y` the circle, `f` and `g`
  maps of degrees `(1, 0)` on the two circles that differ by a rotation of the image on the
  edge: `g'` straightens the edge, and the criterion sees only the loop classes. A proof that
  skipped the agreement on the `0`-skeleton could not apply the pinned criterion, whose
  hypothesis requires `f ∘ γ` and `g ∘ γ` to have the same end points.
- `X = [0, 1]` with the vertices `x = 0` and `v = 1` and `σ_v` the identity path, `Y` the circle,
  `f` the loop of degree one read as a path and `g` constant at `y`: `f ∘ σ_v` and `g ∘ σ_v` have
  the same end points but degrees `1` and `0`, so the pinned criterion does not apply to `f` and
  `g` directly. The prescribed trace `K_v` is the loop of degree one, and the square gives
  `g' ∘ σ_v ≃ (g ∘ σ_v) · K_v`, of degree `1`, as `f ∘ σ_v`; a square read without `K_v` would
  leave `g' ∘ σ_v` of degree `0`. The conclusion `f ≃ g` relative to `{0}` holds, since `[0, 1]`
  contracts to `0` relative to `0`.
- Together with item 1.1, pointed maps `X → Y` up to pointed homotopy are exactly the
  homomorphisms `π₁(X, x) →* π₁(Y, y)`; for `X = C` the cellular model this is the pinned
  `TauCeti.fundamentalGroupFunctor_map_bijective_cellularClassifyingSpace`.

### 1.3 Pointed uniqueness and the pointed comparison with the models

Prove that two aspherical Hausdorff CW complexes `(X, x)` and `(Y, y)`, `X : Type u` and
`Y : Type v`, with arbitrary base points and an isomorphism `e : π₁(X, x) ≃* π₁(Y, y)`, are
homotopy equivalent by an equivalence `F` with `F x = y` and
`FundamentalGroup.mapOfEq F hF = e` (Hatcher, Theorem 1B.8, p. 90; the headline
`exists_homotopyEquiv_of_isAspherical`). By 1.1 there is a pointed map `F` inducing `e`; it is a
weak homotopy equivalence because both spaces are aspherical and `e` is bijective
(`TauCeti.IsAspherical.isWeakHomotopyEquivalence_iff`), and Whitehead's theorem for spaces of CW
type makes it the forward map of a homotopy equivalence
(`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`,
`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv_toFun`; a Hausdorff CW complex has CW
type by `TauCeti.CWType.of_cwComplex_univ`). The homotopy inverse is not asserted to be pointed.
Both CW hypotheses are needed: a point and the Warsaw circle are both path-connected with
trivial homotopy groups, and the Warsaw circle is not contractible (Schwamberger–Vogt 2009, §2).

Deduce the **pointed comparison with the models**: for a CW `K(G, 1)` `(X, x)` with
identification `Ψ`, a pointed homotopy equivalence `c_X : X → BG` with
`classifyingSpaceFundamentalGroupMulEquiv G ∘ π₁(c_X) = Ψ`, unique up to pointed homotopy by
1.2, and likewise `c'_X : X → TauCeti.cellularClassifyingSpace R` for a presentation
`e : PresentedGroup R ≃* G`, with `e ∘ cellularClassifyingSpaceFundamentalGroupMulEquiv R ∘ π₁(c'_X) = Ψ`.
The two are related by the pinned comparison of the models: `c_X` is pointed homotopic to
`TauCeti.cellularHomotopyEquivClassifyingSpace R e ∘ c'_X`, by 1.2 and
`TauCeti.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq_cellularHomotopyEquivClassifyingSpace`.
*Needs:* (1.1), (1.2); Tau Ceti `TauCeti.IsAspherical.isWeakHomotopyEquivalence_iff`,
`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`, `TauCeti.CWType.of_cwComplex_univ`,
`TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace`,
`TauCeti.isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`,
`TauCeti.cellularHomotopyEquivClassifyingSpace`; Mathlib `ContinuousMap.HomotopyEquiv`.

**Checks.**
- `G = 1`: an aspherical Hausdorff CW complex with trivial fundamental group is contractible,
  by a pointed homotopy equivalence with a point.
- The Warsaw circle: path-connected, every homotopy group trivial, not contractible, so a
  statement without the CW hypothesis on the second space is false. It is the negative control,
  and it is not a CW complex, so the theorem does not apply to it.
- `X` the circle, `Ψ` the degree: `c_X` is pointed homotopic to
  `TauCeti.circleToClassifyingSpace`, the forward map of the pinned
  `TauCeti.circleHomotopyEquivClassifyingSpace`, which induces the identity of `ℤ`; the
  comparison normalised to `Ψ⁻¹` would be the map of degree `−1`, detected by the `ℤ` Check of
  the Conventions.
- `X = BG` with `Ψ` the pinned identification: `c_X` is pointed homotopic to the identity; a
  definition that chose the base-point-changed equivalence of
  `TauCeti.IsAspherical.exists_homotopyEquiv_classifyingSpace` without the correction of 1.1
  would not be pointed.

### Examples

The circle, a wedge of circles and a finite torus are CW `K(G, 1)` spaces for `ℤ`, a free
group and `ℤⁿ`, and the pinned equivalences `TauCeti.circleHomotopyEquivClassifyingSpace`,
`TauCeti.wedgeCirclesHomotopyEquivClassifyingSpace` and `TauCeti.torusHomotopyEquivClassifyingSpace`
are instances of 1.3 up to pointed homotopy: the first is pointed already, the other two
realize their identifications after a change of base point along a pinned path, and 1.3 says
the base point can be corrected without changing the induced map.

### Dependencies

Only the pins: the pinned classifying-space directory, the killing tower, the homotopy
extension property of skeleta, the basepoint-change lemmas and Whitehead's theorem, all named
above. No other roadmap.

## Layer 2: group homology and cohomology of a CW `K(G, 1)`

Throughout, `(X, x)` is a Hausdorff CW `K(G, 1)` with an arbitrary base point and chosen
identification `Ψ : π₁(X, x) ≃* G`, `c_X : X → BG` is its pointed comparison map of 1.3, and `k`
is a commutative ring in the universe of `G` and `X`.

### 2.1 Homology with trivial coefficients

Define the comparison `Hₙ(X; k) ≅ Hₙ(G, k)` as the composite of the isomorphism on singular
homology induced by the homotopy equivalence `c_X`
(`ContinuousMap.HomotopyEquiv.singularHomologyIso`) with the pinned
`TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology k G n`. The classical statement: the
homology of a `K(G, 1)` depends only on `G` and is written `Hₙ(G)` (Hatcher, Section 2.2, p. 148);
for a module `M` over `ℤ[G]`, the homology of `X` with local coefficients in `M` is that of
`Cₙ(X̃) ⊗_{ℤ[G]} M` (Hatcher, Section 3.H, p. 328), which for the trivial module is ordinary
homology with coefficients in `M` (Hatcher, Example 3H.1, p. 329); for a `K(G, 1)` the chains of
the contractible universal cover `X̃` resolve `ℤ` over `ℤ[G]`, so this is the homology of `G` with
coefficients in `M` as Brown defines it (Brown, Chapter III, Section 1). Its API:

- It depends only on `(X, x, Ψ)`: two choices of `c_X` are pointed homotopic (1.2), and
  homotopic maps induce the same map on singular homology
  (`ContinuousMap.singularHomologyMap_eq_of_homotopic`).
- For `X = BG` and `Ψ` the pinned identification it is the pinned isomorphism, because `c_X` is
  then homotopic to the identity.
- Naturality in `(X, Ψ)`: for a pointed map `f : X → X'` between CW `K(G, 1)` and `K(H, 1)`
  spaces and `φ : G →* H` with `Ψ' ∘ π₁(f) = φ ∘ Ψ`, the square formed by `f_*`, the two
  comparisons and `groupHomology.map φ` commutes. Route: `c_{X'} ∘ f` and
  `MonoidHom.classifyingSpaceMap φ ∘ c_X` are pointed maps `X → BH`
  (`MonoidHom.classifyingSpaceMap_basepoint`) inducing `φ ∘ Ψ` under the identifications (for
  the second, `MonoidHom.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq`), hence pointed
  homotopic by 1.2 and equal on singular homology, and the pinned naturality
  `MonoidHom.classifyingSpaceSingularHomologyIsoGroupHomology_hom_naturality` finishes.
- Changing `Ψ` by an automorphism `α` of `G` changes the comparison by
  `groupHomology.map α` on the trivial module, which is the identity of `Hₙ(G, k)` only when `α`
  acts trivially on homology; the comparison is a function of `Ψ`, not of `X` alone.
- In degree one the comparison sends the homology class of the chain of a loop `γ` at `x` to the
  class of the `1`-cycle `(Ψ γ)⁻¹` with coefficient `1`, which is minus the class of the
  `1`-cycle `Ψ γ`. For `k = ℤ` and `G : Type`, the Hurewicz isomorphism
  `π₁(X, x)ᵃᵇ ≅ H₁(X; ℤ)` (`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`) sends the class of `γ`
  to the homology class of its chain (`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv_ofMul_of_mk`,
  which lands in Tau Ceti's auxiliary `H₁`, followed by
  `TauCeti.HurewiczOne.H₁AddEquivHomology_loopClass`, which identifies that class with the class
  of a `1`-cycle over the chain of `γ`), so its composite with the comparison is the
  abelianization of `Ψ`, followed by negation and Mathlib's `H₁(G, ℤ) ≅ Gᵃᵇ ⊗ ℤ`
  (`groupHomology.H1AddEquivOfIsTrivial`). For `X = BG` and `Ψ` the pinned identification the
  comparison is the negative of the pinned
  `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology`, which sends the Hurewicz class of
  `γ` to the `1`-cycle `classifyingSpaceFundamentalGroupMulEquiv G γ`
  (`TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology_hurewiczHomologyAddEquiv`); the two
  pinned isomorphisms differ by this sign, and the pin has no lemma relating them. Route. The
  chain of `γ` goes under `c_X` to the chain of the loop `c_X ∘ γ`
  (`TauCeti.singularChains_map_f_pathChain`), which `classifyingSpaceFundamentalGroupMulEquiv G`
  sends to `Ψ γ` by the normalisation of `c_X`, so it suffices to treat `X = BG`, a loop `γ` at
  `b₀` and `g := classifyingSpaceFundamentalGroupMulEquiv G γ`. The lift `Γ` of `γ` starting at
  `e₀ := TauCeti.universalGSpaceBasepoint G` ends at `g⁻¹ • e₀`
  (`TauCeti.classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`), so the chain of `Γ` has
  boundary `g⁻¹ • e₀ − e₀` (`TauCeti.singularChains_d_pathChain`) and maps to the chain of `γ`.
  The pinned comparison is `IsQuotientCoveringMap.singularHomologyIsoGroupHomology` for the orbit
  map: it identifies the chains of `BG` with `(k ⊗ C(EG))_G`, the class of `a ⊗ c` going to
  `a • (p_G)_* c` with no inversion
  (`IsQuotientCoveringMap.singularChainsRepCoinvariantsTensorIso_hom_f_coinvariantsTensorMk`),
  and then applies Mathlib's `groupHomologyIso`, which is induced by any map of resolutions over
  the identity of `k` from the singular chains of `EG` to Mathlib's `Rep.barComplex`. Mathlib's bar
  differential is `d[h] = h·[] − []`, so such a map can be chosen to send each point `h • e₀` to
  `h·[]` and the chain of `Γ` to `[g⁻¹]`, and `Rep.coinvariantsTensorFreeLEquiv` sends the class
  of `1 ⊗ [g⁻¹]` to the `1`-cycle `g⁻¹`. With trivial coefficients the inhomogeneous boundary of
  `(h, h')` is `[h'] − [h h'] + [h]`; for `(g, g⁻¹)` and `(1, 1)` this gives `[g⁻¹] = −[g]` in
  homology.

The existence statement, for any Hausdorff CW `K(G, 1)` and every `n`, is a theorem of the pin by
transport: `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` gives some homotopy
equivalence with `BG`, and the pinned isomorphism transports along it. It is therefore not an
acceptance test; the content of this item is the canonical choice and its naturality. *Needs:*
(1.3); Tau Ceti `ContinuousMap.HomotopyEquiv.singularHomologyIso`,
`ContinuousMap.singularHomologyMap_eq_of_homotopic`,
`TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology`,
`MonoidHom.classifyingSpaceMap_basepoint`,
`MonoidHom.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq`,
`MonoidHom.classifyingSpaceSingularHomologyIsoGroupHomology_hom_naturality`,
`TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology`,
`TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology_hurewiczHomologyAddEquiv`,
`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`,
`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv_ofMul_of_mk`,
`TauCeti.HurewiczOne.H₁AddEquivHomology_loopClass`, `TauCeti.singularChains_d_pathChain`,
`TauCeti.singularChains_map_f_pathChain`, `TauCeti.universalGSpaceBasepoint`,
`TauCeti.classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`,
`IsQuotientCoveringMap.singularHomologyIsoGroupHomology`,
`IsQuotientCoveringMap.singularChainsRepCoinvariantsTensorIso_hom_f_coinvariantsTensorMk`; Mathlib
`AlgebraicTopology.singularHomologyFunctor`, `groupHomology.map`, `groupHomologyIso`,
`Rep.barComplex`, `Rep.coinvariantsTensorFreeLEquiv`, `groupHomology.H1AddEquivOfIsTrivial`.

**Checks.**
- `X` the circle, `Ψ` the degree, `k = ℤ`, `n = 1`, `ℤ` written additively: `c_X` carries the
  counterclockwise loop to a loop `γ` with `classifyingSpaceFundamentalGroupMulEquiv ℤ γ = 1`,
  whose lift from the base vertex `(0, 0)` ends at `(0, −1)` (the `ℤ` Check of the Conventions).
  So the class of the counterclockwise loop goes to the class of the `1`-cycle `−1 ∈ ℤ` in
  `H₁(ℤ, ℤ)`, that is, to `−1` under `H₁(ℤ, ℤ) ≅ ℤ`. The Hurewicz-normalised pinned
  `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology`, applied after `c_X`, gives `+1`,
  and so does a comparison whose `c_X` is normalised through `Ψ⁻¹` and has degree `−1`; a
  degree-one clause without the negation fails here.
- `G = ℤ/m` with `m ≥ 2`, `k = ℤ`: in degree two both sides are zero (pinned
  `TauCeti.subsingleton_classifyingSpace_singularHomology_int_of_even` on the left; on the right
  the two-periodic resolution, whose maps `ℤ[G] → ℤ[G]` are alternately multiplication by `t − 1`
  and by the norm element, gives after taking coinvariants the complex
  `ℤ --0--> ℤ --m--> ℤ --0--> ℤ` in degrees `3, 2, 1, 0`, so `H₂ = ker(m)/im(0) = 0`), and in
  degree one both sides are `ℤ/m` (`ker(0)/im(m)` on the right,
  `TauCeti.classifyingSpaceSingularHomologyIntLinearEquivOdd` on the left); a comparison that
  silently used the trivial group would give `0` in degree one.
- `G` free on `S`, `X` the wedge of circles, `n ≥ 2`: both sides vanish
  (`TauCeti.isZero_groupHomology_freeGroup`); the `r`-torus, `r ≥ 1`: both sides are free of
  rank `r choose n` in degree `n` (`TauCeti.finrank_groupHomology_pi_multiplicative_int`).
- `X = BG`, `Ψ` pinned: the comparison is the pinned isomorphism on the nose, not merely
  isomorphic to it.

### 2.2 Cohomology with trivial coefficients

Define `Hⁿ(X; M) ≅ Hⁿ(G, M)` for a `k`-module `M` as the composite of the isomorphism on singular
cohomology induced by `c_X` (homotopy invariance, `TopCat.isIso_singularCohomologyMap`, applied to
`c_X`, a homotopy inverse and the two homotopies) with the pinned
`TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology k G M n`. The classical statement is
the cohomological half of the sources of 2.1: the cohomology of `X` with local coefficients in a
`ℤ[G]`-module `M` is that of `Hom_{ℤ[G]}(Cₙ(X̃), M)` (Hatcher, Section 3.H, p. 328), ordinary
cohomology with coefficients in `M` for the trivial module (Hatcher, Example 3H.1, p. 329), and
the cohomology of `G` with coefficients in `M` for a `K(G, 1)` (Brown, Chapter III, Section 1).
Its API:

- It depends only on `(X, x, Ψ)`: two choices of `c_X` are pointed homotopic (1.2), and homotopic
  maps induce the same map on singular cohomology (`TopCat.Homotopy.congr_singularCohomologyMap`).
- For `X = BG` and `Ψ` the pinned identification it is the pinned isomorphism, because `c_X` is
  then homotopic to the identity.
- Naturality in `(X, Ψ)`: for a pointed map `f : X → X'` between CW `K(G, 1)` and `K(H, 1)` spaces
  and `φ : G →* H` with `Ψ' ∘ π₁(f) = φ ∘ Ψ`, the square formed by `f^*`, the two comparisons and
  `groupCohomology.map φ` commutes, by the route of 2.1 and the pinned
  `MonoidHom.classifyingSpaceSingularCohomologyIsoGroupCohomology_hom_naturality`.
- Naturality in `M`: a `k`-linear map `M → M'` commutes with the comparisons, through the pinned
  `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology_hom_naturality`.
- Compatibility with the Bockstein: for a short exact sequence `0 → M₁ → M₂ → M₃ → 0` of
  `k`-modules, the comparisons carry the Bockstein `Hⁿ(X; M₃) → Hⁿ⁺¹(X; M₁)` to
  `groupCohomology.δ`, through the pinned
  `TauCeti.singularCohomologyBockstein_comp_classifyingSpaceSingularCohomologyIsoGroupCohomology_hom`
  and the naturality of the Bockstein under `c_X` (`TopCat.singularCohomologyBockstein_naturality`).

As in 2.1, the bare existence statement is a theorem of the pin by transport and is not an
acceptance test. *Needs:* (1.3); Tau Ceti `TopCat.isIso_singularCohomologyMap`,
`TopCat.Homotopy.congr_singularCohomologyMap`, `TopCat.singularCohomologyBockstein_naturality`,
`MonoidHom.classifyingSpaceMap_basepoint`,
`MonoidHom.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq`,
`TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology` and its three naturality theorems;
Mathlib `groupCohomology.map`, `groupCohomology.δ`.

**Checks.**
- `X` the circle, `Ψ` the degree, `M = k`, `ℤ` written additively:
  `H¹(X; k) ≅ H¹(ℤ, k) = Hom(ℤ, k) = k`, and the class taking the value `1` on the
  counterclockwise loop goes to the homomorphism `1 ↦ −1`. Mathlib's inhomogeneous cochains read
  a cochain on the bar generator `[1]`, and a map of resolutions over the identity of `k` from
  the bar resolution to the singular chains of `EG` sends `[1]` to a path from the base vertex
  `(0, 0)` to `(0, 1)`. That path lifts a loop `γ` with
  `classifyingSpaceFundamentalGroupMulEquiv ℤ γ = −1` (the `ℤ` Check of the Conventions), on which
  the class takes the value `−1`. The Hurewicz normalisation, which sends the class of a loop to
  `Ψ` of it, would give `1 ↦ 1`; the two differ as soon as `2 ≠ 0` in `k`, so this Check is run
  with `k = ℤ`.
- `G = ℤ/2`, `k = ℤ`, `M = ℤ/2`: `Hⁿ(G, ℤ/2) = ℤ/2` in every degree, so the comparison is
  nonzero in every degree, and the Bockstein of the short exact sequence of `ℤ`-modules
  `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` is an isomorphism `H¹(G, ℤ/2) → H²(G, ℤ/2)`: in the long exact
  sequence `H¹(G, ℤ/2) → H¹(G, ℤ/4) → H¹(G, ℤ/2) → H²(G, ℤ/2)` the first map is
  `Hom(ℤ/2, ℤ/2) → Hom(ℤ/2, ℤ/4)`, injective between groups of order two, hence surjective, so
  the second map is zero and the Bockstein is injective between groups of order two. The
  sequence cannot be taken over `k = 𝔽₂`, since `ℤ/4` is not an `𝔽₂`-module. A comparison that
  dropped the Bockstein compatibility would still be an isomorphism in each degree, so this
  Check is the one that tests the last clause.
- `G = 1`: both sides are `M` in degree zero and zero above.

### 2.3 Local coefficients

For a representation `A : Rep k G`, define the local coefficient system `L_A` on `X` as
`TauCeti.LocalCoefficientSystem.ofRepresentation x (A.ρ.comp Ψ.toMonoidHom)`: every fibre is the
module of `A`, and a path class acts through `Ψ` and the action of `G` on `A`, so that its
monodromy representation at `x` is `A ∘ Ψ` on the nose
(`TauCeti.LocalCoefficientSystem.monodromyRepresentation_ofRepresentation`). The classical
statement: homology and cohomology with local coefficients in a `ℤ[π]`-module `M` are those of
`Cₙ(X̃) ⊗_{ℤ[π]} M` and `Hom_{ℤ[π]}(Cₙ(X̃), M)` (Hatcher, Section 3.H, p. 328); when `X̃` is
contractible these complexes compute `Tor` and `Ext` over `ℤ[π]` from the free resolution
`C_*(X̃)` of `ℤ`, that is, the homology and cohomology of `π` with coefficients in `M` (Brown,
Chapter III, Section 1). The pinned `TauCeti.cellularResolutionOfIsAspherical` is the cellular
form of that resolution. Prove:

- **Transport along an isomorphism of representations.** For representations `ρ` on `V` and
  `ρ'` on `V'` of `π₁(X, x)` over `k` and a `k`-linear isomorphism `u : V ≃ V'` with
  `u ∘ ρ(γ) = ρ'(γ) ∘ u` for every `γ`, there is an isomorphism of local systems
  `ofRepresentation x ρ ≅ ofRepresentation x ρ'` whose component at `x` is `u`, and it is the
  only one; its component at every point is `u`. Route: the fibres of the two systems are `V`
  and `V'` and their monodromies at `x` are `ρ` and `ρ'`
  (`TauCeti.LocalCoefficientSystem.monodromyRepresentation_ofRepresentation`), so `u` is
  equivariant for the loops at `x`; `TauCeti.Groupoid.natIsoOfEnd` extends it to a natural
  isomorphism with component `u` at `x`, unique by `TauCeti.Groupoid.eq_natIsoOfEnd`; the chosen
  path classes out of `x` act on both systems by the identity, so naturality along them makes
  every component `u`. The pin has no such transport.
- `Hₙ(X; L_A) ≅ Hₙ(G, A)` for every `n` (the headline
  `nonempty_twistedHomology_iso_groupHomology`), and for a `k`-module `N`,
  `Hⁿ(X; L_A, N) ≅ Hⁿ(G, Homₖ(A, N))`, `N` with the trivial action (the headline
  `nonempty_twistedCohomology_iso_groupCohomology`). Route. Write
  `L := TauCeti.classifyingSpaceLocalSystem k A`, the local system on `BG` associated to `A` by
  the orbit map, whose fibre over `b` is `(A ⊗ k[p_G⁻¹ b])_G`, and
  `e₀ := TauCeti.universalGSpaceBasepoint G`, the vertex `(0, 1)` over `b₀`.
  1. The pullback of `L` along the pointed map `c_X` has fibre `L_{b₀}` at `x`, and its monodromy
     at `x` is the monodromy of `L` at `b₀` composed with `π₁(c_X)`
     (`TauCeti.LocalCoefficientSystem.pullback_monodromyRepresentation`).
  2. The point `e₀` identifies `L_{b₀}` with `A`, sending the class of `a ⊗ (g • e₀)` to
     `g⁻¹ • a` (`IsQuotientCoveringMap.associatedLocalSystemFiberIso` for the point `e₀`, with
     `IsQuotientCoveringMap.associatedLocalSystemFiberIso_hom_coinvariantsTensorMk`). Transport
     along a loop `γ` at `b₀` sends the class of `a ⊗ e₀` to the class of
     `a ⊗ (0, m(γ)) = a ⊗ (m(γ) • e₀)`
     (`IsQuotientCoveringMap.associatedLocalSystem_map_coinvariantsTensorMk`), which the
     identification sends to `m(γ)⁻¹ • a`, and `m(γ)⁻¹` is the image of `γ` under
     `classifyingSpaceFundamentalGroupMulEquiv G`
     (`TauCeti.classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`). With step 1 and the
     normalisation of `c_X` in 1.3, the fibre identification is an isomorphism of
     representations of `π₁(X, x)` from the monodromy of the pullback at `x` to `A ∘ Ψ`: the
     monodromy of the pullback is `A ∘ Ψ` up to this isomorphism, not on the nose.
  3. The transport of the first bullet along this isomorphism, followed by
     `TauCeti.LocalCoefficientSystem.ofRepresentationMonodromyIso` for the pullback, identifies
     `L_A` with the pullback of `L` along `c_X`.
  4. `c_X` induces an isomorphism on twisted homology
     (`ContinuousMap.HomotopyEquiv.isIso_twistedHomologyMap`), and the pinned
     `TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology` finishes; for cohomology, the same
     with `TopCat.Homotopy.twistedCohomologyMap_eq_comp` and
     `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology`.
- The isomorphisms are natural in `A` and carry the connecting maps of a short exact sequence of
  representations to `groupHomology.δ` and `groupCohomology.δ`, through the pinned
  `TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology_hom_naturality` and
  `TauCeti.twistedHomologyδ_comp_classifyingSpaceTwistedHomologyIsoGroupHomology_hom`.
- For the trivial representation `A = Rep.trivial k G k`, `L_A` is the constant system (the
  constant system has trivial monodromy,
  `TauCeti.LocalCoefficientSystem.constant_monodromyRepresentation`, so
  `TauCeti.LocalCoefficientSystem.ofRepresentationMonodromyIso` identifies the two) and the
  isomorphism is that of 2.1 through `TauCeti.LocalCoefficientSystem.twistedHomologyConstantIso`;
  likewise for cohomology through `TauCeti.LocalCoefficientSystem.twistedCohomologyConstantIso`.

*Needs:* (1.3), (2.1); Tau Ceti `TauCeti.LocalCoefficientSystem.ofRepresentation`,
`TauCeti.LocalCoefficientSystem.monodromyRepresentation_ofRepresentation`,
`TauCeti.LocalCoefficientSystem.ofRepresentationMonodromyIso`, `TauCeti.Groupoid.natIsoOfEnd`,
`TauCeti.Groupoid.eq_natIsoOfEnd`, `TauCeti.LocalCoefficientSystem.pullbackHomotopyIso`,
`TauCeti.LocalCoefficientSystem.pullback_monodromyRepresentation`,
`TauCeti.LocalCoefficientSystem.constant_monodromyRepresentation`,
`IsQuotientCoveringMap.associatedLocalSystem_map_coinvariantsTensorMk`,
`IsQuotientCoveringMap.associatedLocalSystemFiberIso`,
`IsQuotientCoveringMap.associatedLocalSystemFiberIso_hom_coinvariantsTensorMk`,
`TauCeti.universalGSpaceBasepoint`, `TauCeti.classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`,
`TauCeti.classifyingSpaceLocalSystem`, `TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology`,
`TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology`,
`ContinuousMap.HomotopyEquiv.isIso_twistedHomologyMap`,
`TopCat.Homotopy.twistedCohomologyMap_eq_comp`,
`TauCeti.LocalCoefficientSystem.twistedHomologyConstantIso`,
`TauCeti.LocalCoefficientSystem.twistedCohomologyConstantIso`; Mathlib `Rep.ihom`, `Rep.trivial`.

**Checks.**
- Transport: `ρ = ρ'` and `u` the identity give the identity of `ofRepresentation x ρ`; for
  `V = V' = k`, `ρ = ρ'` a character and `u = −1`, the transport is multiplication by `−1` at
  every point, different from the identity when `2 ≠ 0` in `k`, so the transport depends on `u`
  and not only on `ρ` and `ρ'`. Negative control on the intertwining hypothesis: `X` the circle,
  `V = V' = k²` with the generator acting by exchanging the coordinates and `u = diag(1, −1)`;
  then `u` sends `(a, b)` to `(a, −b)`, and `u` followed by the exchange sends `(a, b)` to
  `(−b, a)`, while the exchange followed by `u` sends it to `(b, −a)`, so for `2 ≠ 0` in `k` no
  natural isomorphism has component `u` at `x`.
- The identification of step 3 for `G = ℤ`, written additively, `X` the circle with `Ψ` the
  degree, and `A = k` with the generator acting by a unit `u`: `e₀ = (0, 0)`, and at `x` the
  identification sends `1 ∈ k` to the class of `1 ⊗ (0, 0)`. Along the loop `γ` with `Ψ(γ) = 1`,
  the lift of `c_X ∘ γ` from `(0, 0)` ends at `(0, −1)` (the `ℤ` Check of the Conventions), so
  transport sends the class of `1 ⊗ (0, 0)` to that of `1 ⊗ (0, −1)`, which the fibre
  identification sends to the action of `−(−1) = 1 ∈ ℤ` on `1 ∈ k`, that is to `u`, the
  monodromy of `L_A` along `γ`. Reading the end point without the inversion of the Conventions
  would give `u⁻¹`, which differs from `u` as soon as `u² ≠ 1`.
- `A` trivial: recovers 2.1 and 2.2.
- `G = ℤ`, `X` the circle, `A = k` with the generator acting by a unit `u`: `H₀(X; L_A)` is the
  coinvariants `k/(u − 1)k` (`TauCeti.LocalCoefficientSystem.twistedHomology₀IsoCoinvariants`)
  and `H₁` is the kernel of `u − 1`, which agree with `H₀(ℤ, A)` and `H₁(ℤ, A)` computed from
  the resolution
  `k[ℤ] → k[ℤ]`, `1 ↦ t − 1`; a definition of `L_A` that ignored the action (the constant
  system) would give `k` in degree zero, wrong as soon as `u ≠ 1`.
- `G = ℤ/2`, `k = ℤ`, `A = ℤ` with the sign action: `H₀(ℤ/2, A) = ℤ/2`, `H₁(ℤ/2, A) = 0`,
  `H₂(ℤ/2, A) = ℤ/2`, the opposite parity pattern from the trivial coefficients
  (`H₁ = ℤ/2`, `H₂ = 0`); a definition confusing `A` with the trivial representation is detected
  in degree one.
- Negative control on asphericity: `X = S² ∨ S¹`, a Hausdorff CW complex with one `0`-cell, one
  `1`-cell and one `2`-cell, has `π₁ = ℤ` but `π₂ ≠ 0`. With `G = ℤ`, `k = ℤ` and `A = ℤ`
  trivial, `H₂(X; ℤ) = ℤ` while `H₂(ℤ, ℤ) = 0`, so the homology isomorphism fails without
  asphericity. Over the zero ring every module vanishes and both sides agree, so the control
  needs `1 ≠ 0` in `k`.
- `G = S₃`, `A = k` with the sign character: the monodromy of `L_A` along a loop representing a
  transposition is `−1`; a definition through `Ψ⁻¹` gives the same monodromy, since
  characters factor through the abelianization, so the direction is tested by the `S₃` Check of
  the Conventions on `c_X`, not here.

### Examples

For the circle, the wedge of circles, the torus and a finite cyclic group, the pinned
computations of the (co)homology of Milnor's model (`Circle.lean`, `WedgeCircles.lean`,
`Torus.lean`, `FiniteCyclic.lean`) transport along 2.1 to the geometric models, and for the torus
and the wedge the pinned `TauCeti.torusSingularHomologyIsoGroupHomology` and
`TauCeti.wedgeCirclesSingularHomologyIsoGroupHomology` are the comparisons of 2.1 on the nose,
by its independence of the choice of `c_X`. `H₁(X; ℤ) ≅ Gᵃᵇ` for every Hausdorff CW `K(G, 1)` is
the degree-one clause of 2.1.

### Dependencies

Layer 1; the pinned (co)homology comparisons for Milnor's model and the pinned homotopy
invariance of singular and twisted (co)homology, all named above. No other roadmap.

## Downstream consumers

- The [algebraic-topology roadmap](../AlgebraicTopology/README.md), Stage 8, item 8.8b, compares
  its nerve model with Milnor's model `TauCeti.classifyingSpace G`, normalised to the identity on
  `G`. Its inputs from this roadmap are Layer 1: item 1.1 for the pointed map from the nerve
  model, based at its vertex, into Milnor's model inducing the normalised isomorphism, item 1.2
  for its uniqueness up to pointed homotopy and item 1.3 for the pointed homotopy equivalence;
  the pinned identification `TauCeti.classifyingSpaceFundamentalGroupMulEquiv G` of the
  fundamental group of Milnor's model and the pinned local-coefficient comparisons are its other
  inputs. The classification `[X, Bπ]_* ≃ Hom(π₁(X), π)` of pointed maps from a path-connected
  pointed Hausdorff CW complex into a `K(π, 1)` is the case of items 1.1 and 1.2 with target
  `Bπ`, owned here. The [characteristic-classes roadmap](../CharacteristicClasses/README.md)
  consumes the classifying space of `ℤ/2` through that item.
- Any roadmap computing the (co)homology of a group from a geometric `K(G, 1)` that is not one
  of the pinned models (a surface group from a closed surface, a right-angled Artin group from a
  cube complex) consumes Layer 2 with that model and its own identification `Ψ`.

## References

- J. Milnor, "Construction of universal bundles, II", *Ann. of Math.* **63** (1956), 430–436,
  [DOI](https://doi.org/10.2307/1970012). The countable join and its free action, the pinned
  model.
- A. Hatcher, *Algebraic Topology*, Cambridge, 2002. Section 1.B, Theorem 1B.8 and Proposition
  1B.9, p. 90, proof pp. 90–91, for maps into `K(G, 1)` spaces and their uniqueness (Layer 1);
  there a `K(G, 1)` has a contractible universal cover (p. 87), and the proof takes the base point
  to be a `0`-cell (a single `0`-cell on p. 90, a maximal tree on p. 91). Chapter 0, Proposition
  0.16, p. 15, for the homotopy extension property of CW pairs, which the pinned
  `TauCeti.hasHomotopyExtensionProperty_skeletonLT` supplies for skeleta; Appendix, Proposition
  A.4, p. 522, for the local contractibility of CW complexes behind the homotopy extension
  property of a point (item 1.1). Section 4.1, Proposition 4.22, p. 357, for the lifting of maps
  out of CW complexes through weak homotopy equivalences, which the pinned
  `ContinuousMap.IsWeakHomotopyEquivalence.exists_comp_homotopic` supplies for spaces of CW type.
  Section 2.2, p. 148, for the homology of a group as the homology of a `K(G, 1)`, and Section 3.H,
  p. 328, with Example 3H.1, p. 329, for homology and cohomology with local coefficients through
  the chains of the universal cover (Layer 2).
- K. S. Brown, *Cohomology of Groups*, GTM 87, Springer, 1982, Chapter III, Section 1, for
  homology and cohomology with coefficients in a module as the (co)invariants of a projective
  resolution, the algebraic side of Layer 2.
- R. Schwamberger and R. M. Vogt, "Dold spaces in homotopy theory", *Algebr. Geom. Topol.* **9**
  (2009), [DOI](https://doi.org/10.2140/agt.2009.9.1585), Section 2. The Warsaw circle as a space
  with trivial homotopy groups that is not contractible.
- G. Segal, "Classifying spaces and spectral sequences", *Publ. IHES* **34** (1968),
  [DOI](https://doi.org/10.1007/BF02684591), Section 3. The remark comparing the classifying
  space of `G` as a one-object category with Milnor's join.
