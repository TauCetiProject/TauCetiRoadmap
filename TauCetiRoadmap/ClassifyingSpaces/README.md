# Roadmap: classifying spaces of discrete groups

**Summary.** For a discrete group `G`, a `K(G, 1)` is a path-connected space with fundamental
group `G` and no higher homotopy; among spaces of CW type it is determined by `G` up to homotopy
equivalence, and its singular homology is the group homology of `G`. The pinned Tau Ceti builds
two models of it for an arbitrary group: Milnor's orbit space of the countable join of copies of
`G` (`TauCeti.classifyingSpace`) and the cellular model obtained from a presentation complex by
killing its higher homotopy (`TauCeti.cellularClassifyingSpace`). It proves that both are Hausdorff
CW complexes and `K(G, 1)` spaces, that they are homotopy equivalent compatibly with the
identifications of `π₁`, that `K(G, 1)` spaces of CW type are unique up to a change of base point,
that the classifying space is a functor to the pointed homotopy category, that the cellular chains
of the universal covers are projective resolutions comparable with Mathlib's standard resolution,
and that the singular (co)homology of Milnor's model, with constant and with local coefficients, is
Mathlib's group (co)homology. This roadmap consumes all of that by name and builds the rest. Its
end theorems are the pointed uniqueness of aspherical Hausdorff CW complexes, with arbitrary base
points (`exists_homotopyEquiv_of_isAspherical`); the identification of the singular homology and
cohomology of *every* Hausdorff CW `K(G, 1)` with group (co)homology, with constant coefficients
(`nonempty_singularHomology_iso_groupHomology`, `nonempty_singularCohomology_iso_groupCohomology`)
and with local coefficients given by a `G`-representation
(`nonempty_twistedHomology_iso_groupHomology`, `nonempty_twistedCohomology_iso_groupCohomology`);
and the normalised comparison of the two pinned models with the nerve model of the
algebraic-topology roadmap, under which the three (co)homology comparisons and the three
resolution comparisons are one.

## Scope and ownership

This roadmap owns two layers.

- **Layer 1.** The pointed uniqueness of aspherical Hausdorff CW complexes realizing a prescribed
  isomorphism of fundamental groups exactly, with arbitrary base points (1.1); the transport of the
  pinned (co)homology comparisons from Milnor's model to every Hausdorff CW `K(G, 1)` (1.2); and
  their local-coefficient form for an aspherical Hausdorff CW complex with a chosen
  `π₁(X, x) ≃* G`, through Tau Ceti's local system of a representation (1.3).
- **Layer 2.** The specialization of the algebraic-topology roadmap's normalised comparison map
  `c_G` to Milnor's model and to the cellular model, its naturality for the strict functoriality
  of Milnor's model and the equivariance of its lift (2.1); the agreement of the three
  (co)homology comparisons under it (2.2); and the agreement of the three resolution comparisons
  (2.3).

Everything else is consumed.

- **Already in the pinned Tau Ceti** (`TauCeti/AlgebraicTopology/ClassifyingSpace/` and the files
  named under `## Exact supplier contracts`): the countable join and its free action, Milnor's
  classifying space with its standing hypotheses, its `K(G, 1)` property and the direction of
  `π₁(BG) ≃* G`, strict functoriality, the presentation complex and its fundamental group, the
  killing tower, the cellular model and its CW structure, CW structures lifted along a covering
  and descended to an orbit space, the comparison of the two models, uniqueness up to a change of
  base point, the pointed homotopy functor, the join, cellular and lifted-cell resolutions, the
  explicit comparison with `Rep.standardResolution`, and the (co)homology of Milnor's model with
  constant and local coefficients, natural in the group and the coefficients and compatible with
  the long exact sequences. The circle, wedges of circles, finite tori, finite cyclic groups,
  finite groups and `ℤ[1/m]` are computed there as well. None of this is restated here.
- **The algebraic-topology roadmap**, Stage 8 item 8 (8.8a and 8.8b), owns the nerve model
  (`groupClassifyingSpace`), its identification of `π₁` with `G`, the classification of pointed
  maps from a connected Hausdorff CW complex into an aspherical space (Hatcher, Proposition 1B.9,
  with arbitrary base points), the normalised pointed comparison `c_G` from any Hausdorff CW
  `K(G, 1)` with a chosen identification of `π₁` to the nerve model with its naturality, and the
  identification of the nerve model's cohomology with local coefficients over `ℤ`. Layers 1 and 2
  consume these and prove none of them again. The killing construction that Stage 8 item 8c of the
  same roadmap uses is the pinned `TauCeti.killHomotopyGroups`.
- **The profinite-cohomology roadmap** owns continuous cohomology of profinite groups; the group
  cohomology here is Mathlib's discrete one.

Stage and item numbers cited from this roadmap resolve as follows, one line per id.

- **Stage 1 items 1 to 4** (countable join, weak contractibility, action and orbit cover, standing
  hypotheses) → pinned `ClassifyingSpace/CountableJoin.lean`, `WeakContractibility.lean`,
  `Action.lean`, `Basic.lean`.
- **Stage 1 item 5** (Milnor's model is a `K(G, 1)`; direction of `π₁ ≃* G`) → pinned
  `ClassifyingSpace/EilenbergMacLane.lean`; the direction is recorded under `## Conventions`.
- **Stage 1 item 6** (strict functoriality) → pinned `ClassifyingSpace/Functoriality.lean`.
- **Stage 2 item 7** (presentation complex) → pinned `TauCeti.PresentationComplex`,
  `ClassifyingSpace/PresentationComplex.lean`.
- **Stage 2 items 8 and 9** (killing a homotopy group; the tower) → pinned
  `TauCeti.killHomotopyGroups`, `Homotopy/KillHomotopyGroups.lean`.
- **Stage 2 item 10** (cellular `K(G, 1)`) → pinned `ClassifyingSpace/Cellular.lean`,
  `Comparison.lean`.
- **Stage 3 item 11** (Hatcher, Proposition 1B.9) → the algebraic-topology roadmap, Stage 8 item
  8b.
- **Stage 3 item 12** (uniqueness) → pinned `ClassifyingSpace/Uniqueness.lean`; the pointed form is
  Layer 1, 1.1.
- **Stage 3 item 13** (CW structures and coverings) → pinned `TauCeti.cwComplexPreimage`
  (`Topology/CWComplex/Classical/Covering.lean`), `IsQuotientCoveringMap.cwComplexQuotient`
  (`Topology/CWComplex/Classical/OrbitSpace.lean`), `TauCeti.cellularChainRepIsoFree`
  (`AlgebraicTopology/Cellular/Covering.lean`).
- **Stage 3 item 14** (the models agree) → pinned `ClassifyingSpace/Comparison.lean` for the two
  pinned models; Layer 2, 2.1, for the nerve model.
- **Stage 3 item 15** (homotopy functoriality) → pinned `ClassifyingSpace/HomotopyFunctor.lean`.
- **Stage 4 item 16** (chain-level comparison) → pinned `ClassifyingSpace/Resolution.lean`,
  `PresentedGroupResolution.lean`, `EilenbergMacLane/Resolution.lean`.
- **Stage 4 item 17** (homology and cohomology) → pinned `ClassifyingSpace/Homology.lean`,
  `Cohomology.lean`, `LocalCoefficients.lean` for Milnor's model; Layer 1, 1.2 and 1.3, for every
  `K(G, 1)`; Layer 2, 2.2, for the nerve model.
- **Stage 4 item 18** (comparison with the bar resolution) → pinned
  `ClassifyingSpace/StandardComplex.lean`, `StandardResolution.lean`, `Naturality.lean`; Layer 2,
  2.3, for the nerve model.
- **Stage 4 item 19** (computations) → pinned `ClassifyingSpace/FirstHomology.lean`, `Circle.lean`,
  `WedgeCircles.lean`, `Torus.lean`, `FiniteCyclic.lean`.

## Conventions`.
- Stage 1 item 6 (strict functoriality): pinned `ClassifyingSpace/Functoriality.lean`.
- Stage 2 item 7 (presentation complex): pinned `TauCeti.PresentationComplex`,
  `ClassifyingSpace/PresentationComplex.lean`.
- Stage 2 items 8 and 9 (killing a homotopy group, the tower): pinned `TauCeti.killHomotopyGroups`,
  `Homotopy/KillHomotopyGroups.lean`.
- Stage 2 item 10 (cellular `K(G, 1)`): pinned `ClassifyingSpace/Cellular.lean`, `Comparison.lean`.
- Stage 3 item 11 (Hatcher, Proposition 1B.9): the algebraic-topology roadmap, Stage 8 item 8b.
- Stage 3 item 12 (uniqueness): pinned `ClassifyingSpace/Uniqueness.lean`; the pointed form is
  Layer 1, 1.1.
- Stage 3 item 13 (CW structures and coverings): pinned `TauCeti.cwComplexPreimage`
  (`Topology/CWComplex/Classical/Covering.lean`), `IsQuotientCoveringMap.cwComplexQuotient`
  (`Topology/CWComplex/Classical/OrbitSpace.lean`), `TauCeti.cellularChainRepIsoFree`
  (`AlgebraicTopology/Cellular/Covering.lean`).
- Stage 3 item 14 (the models agree): pinned `ClassifyingSpace/Comparison.lean` for the two models
  here; Layer 2, 2.1, for the nerve model.
- Stage 3 item 15 (homotopy functoriality): pinned `ClassifyingSpace/HomotopyFunctor.lean`.
- Stage 4 item 16 (chain-level comparison): pinned `ClassifyingSpace/Resolution.lean`,
  `PresentedGroupResolution.lean`, `EilenbergMacLane/Resolution.lean`.
- Stage 4 item 17 (homology and cohomology): pinned `ClassifyingSpace/Homology.lean`,
  `Cohomology.lean`, `LocalCoefficients.lean` for Milnor's model; Layer 1, 1.2 and 1.3, for every
  `K(G, 1)`; Layer 2, 2.2, for the nerve model.
- Stage 4 item 18 (comparison with the bar resolution): pinned
  `ClassifyingSpace/StandardComplex.lean`, `StandardResolution.lean`, `Naturality.lean`; Layer 2,
  2.3, for the nerve model.
- Stage 4 item 19 (computations): pinned `ClassifyingSpace/FirstHomology.lean`, `Circle.lean`,
  `WedgeCircles.lean`, `Torus.lean`, `FiniteCyclic.lean`.

## Conventions

- Groups are discrete: a type with `Group G` and no topology.
- Fundamental groups compose as in Mathlib's `FundamentalGroup.mul_def`: `p * q` runs `q` first.
- Milnor's model is based at `TauCeti.classifyingSpaceBasepoint G`, the image of the vertex
  `⟨0, 1⟩`, and `G` acts on the countable join by `g • ⟨i, h⟩ = ⟨i, g * h⟩`. For a loop `γ` at the
  base point write `m(γ)` for the label of the end point `⟨0, m(γ)⟩` of its lift starting at
  `⟨0, 1⟩`. Since `p * q` runs `q` first, the lift of `p * q` ends at `⟨0, m(q) * m(p)⟩`, so `m` is
  an anti-homomorphism. The pinned identification `TauCeti.classifyingSpaceFundamentalGroupMulEquiv G`
  is `γ ↦ m(γ)⁻¹` (`TauCeti.classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`: `γ` goes to
  `g` exactly when the lift ends at `⟨0, g⁻¹⟩`). Equivalently, the deck transformation of `γ` is
  left translation by the inverse of its image in `G`.
- The cellular model of a presentation `⟨S | R⟩` is based at its unique `0`-cell and identified
  with `PresentedGroup R` by `TauCeti.cellularClassifyingSpaceFundamentalGroupMulEquiv R`, under
  which the loop around the `s`-th circle goes to the generator `s`.
- Base points of arbitrary CW complexes are arbitrary points, not necessarily `0`-cells.
- Coefficient rings are commutative and lie in the universe of `G`, because Mathlib's `Rep k G`
  keeps `k` and `G` in one universe; the integral statements are the case `k = ℤ`, `G : Type`. The
  local-coefficient cohomology comparison with the nerve model (2.2) is over `ℤ`, the ring over
  which the algebraic-topology roadmap identifies the nerve model's local-coefficient cohomology.

**Checks.**
- `G = S₃`, `s = (1 2)`, `t = (2 3)`, loops `ℓ_s`, `ℓ_t` with `m(ℓ_s) = s` and `m(ℓ_t) = t`:
  `m(ℓ_s * ℓ_t) = t * s = (1 3 2)`, while `s * t = (1 2 3)`. The identification `γ ↦ m(γ)⁻¹` sends
  `ℓ_s * ℓ_t` to `(t * s)⁻¹ = s * t`, the product of the images `s⁻¹ = s` and `t⁻¹ = t`, as a
  homomorphism must; `γ ↦ m(γ)` would send it to `t * s ≠ s * t`. No abelian group detects this.
- `G = ℤ`, written additively, base vertex `⟨0, 0⟩`: the loop whose lift ends at `⟨0, 1⟩` goes to
  `−1`. The sign is invisible to the `S₃` test, and the `S₃` test is invisible to this one.
- `G = 1`: Milnor's model is the realization of the infinite simplex on the vertices `⟨i, 1⟩`,
  which is contractible, and the identification is the unique map.

## Exact supplier contracts

- **From Mathlib:** `groupHomology`, `groupCohomology`, `Rep.trivial`, `Rep.ihom` (the internal hom
  `Homₖ(A, B)` with `g` acting by conjugation), `Rep.standardResolution`, `Rep.standardComplex`,
  `CategoryTheory.ProjectiveResolution` with its comparison maps and their uniqueness up to
  homotopy, `AlgebraicTopology.singularHomologyFunctor` with the homotopy invariance of
  `Mathlib/AlgebraicTopology/SingularHomology/HomotopyInvariance.lean`, `FundamentalGroup`,
  `FundamentalGroup.mapOfEq`, `ContinuousMap.HomotopyEquiv`, `ContinuousMap.HomotopicRel`,
  `IsQuotientCoveringMap`, `Topology.CWComplex`, `PresentedGroup`.
- **From Tau Ceti**, by file under `TauCeti/AlgebraicTopology/` unless another directory is named:
  - `EilenbergMacLane/Basic.lean`: `TauCeti.IsAspherical` (path connected with vanishing `π_n` for
    `n ≥ 2` at the base point) and `TauCeti.IsEilenbergMacLaneSpaceOne` (aspherical with
    fundamental group isomorphic to `G`, with no chosen isomorphism).
  - `EilenbergMacLane/WeakHomotopyEquivalence.lean`: `TauCeti.IsAspherical.isWeakHomotopyEquivalence_iff`
    (a map of aspherical spaces is a weak homotopy equivalence when it is bijective on `π₁`).
  - `Homotopy/Whitehead.lean`: `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`
    (Whitehead's theorem for spaces of CW type, with forward map the given map); and
    `Topology/CWComplex/Classical/CWType.lean`: `TauCeti.CWType.of_cwComplex_univ`.
  - `ClassifyingSpace/Basic.lean`, `EilenbergMacLane.lean`, `CWComplex.lean`,
    `Functoriality.lean`: `TauCeti.classifyingSpace`, `TauCeti.classifyingSpaceBasepoint`,
    `TauCeti.isQuotientCoveringMap_classifyingSpaceProj`,
    `TauCeti.classifyingSpaceFundamentalGroupMulEquiv`,
    `TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace`,
    `TauCeti.instCWComplexClassifyingSpace`, `MonoidHom.classifyingSpaceMap` and
    `MonoidHom.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq` (the induced map on `π₁` is the
    given homomorphism).
  - `ClassifyingSpace/PresentationComplex.lean`, `Cellular.lean`, `Comparison.lean`,
    `Uniqueness.lean`: `TauCeti.PresentationComplex`,
    `TauCeti.PresentationComplex.fundamentalGroupMulEquiv`,
    `TauCeti.PresentationComplex.isEmpty_cell`, `TauCeti.cellularClassifyingSpace`,
    `TauCeti.cellularClassifyingSpaceFundamentalGroupMulEquiv`,
    `TauCeti.cellularHomotopyEquivClassifyingSpace` with
    `TauCeti.cellularHomotopyEquivClassifyingSpace_toFun_basepoint` and
    `TauCeti.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq_cellularHomotopyEquivClassifyingSpace`
    (pointed forward map inducing the given isomorphism), `TauCeti.IsAspherical.exists_homotopyEquiv`
    and `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` (uniqueness for spaces of CW
    type, after a change of base point along a path).
  - `Homotopy/KillHomotopyGroups.lean`: `TauCeti.killHomotopyGroups`,
    `TauCeti.bijective_homotopyGroupMap_killHomotopyGroupsIncl`,
    `TauCeti.subsingleton_homotopyGroup_killHomotopyGroups`,
    `TauCeti.isEilenbergMacLaneSpaceOne_killHomotopyGroups`, `TauCeti.killHomotopyGroupsCWComplex`
    (for a Hausdorff CW source with no cells above the starting dimension, discharged for the
    presentation complex by `TauCeti.PresentationComplex.isEmpty_cell`) and
    `TauCeti.cwType_killHomotopyGroups`.
  - `ClassifyingSpace/Resolution.lean`, `StandardComplex.lean`, `StandardResolution.lean`,
    `Naturality.lean`: `TauCeti.universalGSpaceResolution`,
    `TauCeti.universalGSpaceToStandardComplex`, `TauCeti.universalGSpaceStandardHomotopyEquiv`,
    `TauCeti.universalGSpaceChainComplexToStandardComplexHomotopy`,
    `MonoidHom.universalGSpaceChainComplexToStandardComplex_naturality`.
  - `ClassifyingSpace/Homology.lean`, `Cohomology.lean`, `LocalCoefficients.lean`:
    `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology`,
    `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology`,
    `TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology`,
    `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology`, with their naturality in the
    group and the coefficients.
  - `Singular/ModuleChains/GroupHomology.lean`, `Cohomology/GroupCohomology.lean`,
    `Singular/Twisted/GroupHomology.lean`, `Cohomology/Twisted/GroupCohomology.lean`:
    `IsQuotientCoveringMap.singularHomologyIsoGroupHomology` with
    `IsQuotientCoveringMap.singularHomologyIsoGroupHomology_hom_naturality` (naturality along a map
    of total spaces equivariant along a group homomorphism), and
    `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology`,
    `IsQuotientCoveringMap.twistedHomologyIsoGroupHomology`,
    `IsQuotientCoveringMap.twistedCohomologyIsoGroupCohomology`, each for the quotient covering map
    of a free action on a contractible space.
  - `EilenbergMacLane/Resolution.lean`: `TauCeti.cellularResolutionOfIsAspherical` (the lifted
    cellular chains of a simply connected quotient cover of an aspherical Hausdorff CW complex are
    a projective resolution of the trivial representation).
  - `LocalCoefficient/Representation.lean`: `TauCeti.LocalCoefficientSystem.ofRepresentation`, the
    local system on a path-connected pointed space whose monodromy at the base point is a given
    representation of `π₁` (`TauCeti.LocalCoefficientSystem.monodromyRepresentation_ofRepresentation`),
    and `TauCeti.LocalCoefficientSystem.ofRepresentationMonodromyIso`.
  - `Singular/Twisted/Basic.lean`, `Cohomology/Twisted/Basic.lean`:
    `TauCeti.LocalCoefficientSystem.twistedHomology` and
    `TauCeti.LocalCoefficientSystem.twistedCohomology` (cochains are maps from the twisted chains
    into a fixed module), with their pullback maps and homotopy invariance.
  - `Topology/CWComplex/Classical/CellularApproximation.lean`: `TauCeti.exists_isCellular_homotopicRel`;
    `SimplicialComplex/Realization/CWComplex/OrderedChainComplex.lean`:
    `TauCeti.cellularChainComplexRealizationIso` (the cellular chains of a realization are its
    ordered simplicial chains, after rescaling the cells of each degree by a unit).
- **From TauCetiRoadmap.AlgebraicTopology:** Stage 8 item 8a, the nerve model
  `groupClassifyingSpace G` with its base vertex, its contractible free `G`-cover, its CW structure
  through Stage 4 item 7 (one cell per nondegenerate simplex), its `K(G, 1)` property, its
  identification `κ_bar` of `π₁` with `G` (the edge labelled `g` goes to `g`), the maps induced by
  homomorphisms, and its stated conversion between the left `G`-action on the cover and
  `Deck ≃* π₁ᵐᵒᵖ`; Stage 8 item 8b, `exists_mapOfEq_eq_of_isAspherical_cwComplex` (Hatcher,
  Proposition 1B.9: for a path-connected Hausdorff CW complex with an arbitrary base point and an
  aspherical target, every homomorphism of fundamental groups is induced by a pointed map, unique
  up to homotopy relative to the base point), the normalised pointed comparison `c_Z : Z → Bπ` for
  every Hausdorff CW `K(G, 1)` `Z` with a chosen `κ_Z : π₁(Z, z) ≃* G`, satisfying
  `κ_bar ∘ π₁(c_Z) = κ_Z`, unique up to pointed homotopy and natural in the group up to pointed
  homotopy, and the identification of the cohomology of `Bπ` with coefficients in the local system
  of `A : Rep ℤ G` with `groupCohomology A n`.

## How to read the build

Layer 1 consumes only pinned declarations and the algebraic-topology roadmap's Stage 8 item 8b; it
transports the pinned results about Milnor's model to every aspherical Hausdorff CW complex, and
makes the uniqueness pointed. Layer 2 consumes Stage 8 items 8a and 8b of the same roadmap and
compares the nerve model with the two pinned models: first the spaces (2.1), then the
(co)homology comparisons (2.2), then the resolutions (2.3). The two layers are independent; Layer 2
uses Layer 1 only through the pinned statements Layer 1 also uses.

## Layer 1: pointed uniqueness and the comparison for every K(G, 1)

### 1.1 Pointed uniqueness of aspherical CW complexes

Prove `exists_homotopyEquiv_of_isAspherical`: for Hausdorff CW complexes `X` and `Y`, in any
universes, with points `x` and `y` at which both are aspherical, and an isomorphism
`e : π₁(X, x) ≃* π₁(Y, y)`, there is a homotopy equivalence `F : X ≃ₕ Y` with `F x = y` whose
induced map `π₁(X, x) → π₁(Y, y)` is `e` (Hatcher, Theorem 1B.8, p. 90, with the pointed map of
Proposition 1B.9). The base points are arbitrary points. Route: the algebraic-topology roadmap's
Stage 8 item 8b gives a pointed map `f` inducing `e`; it is bijective on `π₁` and both spaces are
aspherical, so `TauCeti.IsAspherical.isWeakHomotopyEquivalence_iff` makes it a weak homotopy
equivalence, and Whitehead's theorem `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`, for
the CW types given by `TauCeti.CWType.of_cwComplex_univ`, makes it a homotopy equivalence whose
forward map is `f`. The pinned `TauCeti.IsAspherical.exists_homotopyEquiv` is the version for
spaces of CW type in which `e` is realized only after a change of base point along a path; the
pointed form needs the pointed realization, which Stage 8 item 8b supplies for a base point inside
a cell of positive dimension. *Needs:* AlgebraicTopology Stage 8 item 8b (existence half);
Tau Ceti `TauCeti.IsAspherical.isWeakHomotopyEquivalence_iff`,
`ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`, `TauCeti.CWType.of_cwComplex_univ`;
Mathlib `ContinuousMap.HomotopyEquiv`, `FundamentalGroup.mapOfEq`.

- For aspherical Hausdorff CW complexes `X`, `Y` with base points `x`, `y` and an isomorphism `e`
  of fundamental groups, there is a homotopy equivalence sending `x` to `y` and inducing `e`.
- Specialized to two Hausdorff CW `K(G, 1)` spaces with chosen identifications `κ_X`, `κ_Y` of
  their fundamental groups with `G`, it gives a pointed homotopy equivalence inducing the identity
  of `G` through `κ_X` and `κ_Y`.

**Checks.**
- `X = Y` a point: `e` is the identity of the trivial group and `F` is the identity.
- `X` the circle with `0`-cells `1` and `−1` and base point `i`, which is not a `0`-cell, `Y` the
  circle with base point `1`, and `e` the identity of `ℤ` under the degree: rotation by `−i` sends
  `i` to `1` and has degree `1`. A statement asking for a `0`-cell base point would not apply.
- The same circles with `e` the inversion of `ℤ`: every `F` realizing `e` has degree `−1`, for
  instance `z ↦ conj(−i z)`, so `F` is not homotopic to the rotation; the prescription of `e` is
  not vacuous.
- Negative control: a point and the Warsaw circle are both aspherical with trivial fundamental
  group (Schwamberger–Vogt 2009, §2), but the Warsaw circle is not contractible; it is not a CW
  complex, so the theorem does not apply, and a statement without the CW hypothesis on `Y` would
  be false.

### 1.2 Homology and cohomology of every K(G, 1)

Prove `nonempty_singularHomology_iso_groupHomology`: for a commutative ring `k` and a group `G` in
one universe, a Hausdorff CW complex `X` in the same universe and a point `x` at which `X` is a
`K(G, 1)`, the singular homology `Hₙ(X; k)` (Mathlib's `AlgebraicTopology.singularHomologyFunctor`)
is isomorphic to `groupHomology (Rep.trivial k G k) n` for every `n` (Hatcher, Section 2.2,
"Homology of Groups", p. 148; Brown 1982, §II.4). Prove
`nonempty_singularCohomology_iso_groupCohomology`, the same for Tau Ceti's
`TopCat.singularCohomology` and `groupCohomology (Rep.trivial k G k) n`. Route: by
`TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`, with both CW types from
`TauCeti.CWType.of_cwComplex_univ`, `X` is homotopy equivalent to `TauCeti.classifyingSpace G`;
singular homology and cohomology are homotopy invariant (Mathlib's `HomotopyInvariance.lean`, Tau
Ceti's `Cohomology/HomotopyInvariance.lean`); compose with the pinned
`TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology` and
`TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology`. *Needs:* Tau Ceti
`TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`, `TauCeti.CWType.of_cwComplex_univ`,
the two pinned comparisons for Milnor's model, `TopCat.singularCohomology` and its homotopy
invariance; Mathlib `AlgebraicTopology.singularHomologyFunctor` and its homotopy invariance,
`groupHomology`, `groupCohomology`.

- For every Hausdorff CW `K(G, 1)` `X` and every `n`, `Hₙ(X; k)` is isomorphic to `Hₙ(G, k)`.
- For every Hausdorff CW `K(G, 1)` `X` and every `n`, `Hⁿ(X; k)` is isomorphic to `Hⁿ(G, k)`.

**Checks.**
- `G = ℤ`, `X` the circle: `H₁ = k` on both sides (`ℤᵃᵇ ⊗ k = k`), and `H₂ = 0` on both sides.
- `G = ℤ/2`, `k = ℤ`: `H₁ = ℤ/2` and `H₂ = 0` on both sides; with `k = 𝔽₂` every degree is `𝔽₂`;
  in cohomology with `k = ℤ`, `H¹ = 0` and `H² = ℤ/2`. A comparison that confused homology with
  cohomology would be caught in degree one.
- Negative control: the `2`-sphere has trivial fundamental group and `H₂ = k`, while
  `H₂(1, k) = 0`; it is not a `K(1, 1)` because `π₂ ≠ 0`, so the hypothesis excludes it.

### 1.3 Local coefficients on an aspherical CW complex

Prove `nonempty_twistedHomology_iso_groupHomology`: for a commutative ring `k` and a group `G` in
one universe, a path-connected Hausdorff CW complex `X` in the same universe with a point `x` at
which it is aspherical, an isomorphism `Ψ : π₁(X, x) ≃* G` and a representation `A : Rep k G`, the
homology of `X` with coefficients in `TauCeti.LocalCoefficientSystem.ofRepresentation` of `A`
pulled back along `Ψ` is isomorphic to `groupHomology A n` for every `n` (Hatcher, Section 3.H,
Proposition 3H.4, p. 331; Brown 1982, §III.1). Prove
`nonempty_twistedCohomology_iso_groupCohomology`: for a `k`-module `N`, the cohomology of `X` with
coefficients in the same local system and values in `N` is isomorphic to
`groupCohomology ((Rep.ihom A).obj (Rep.trivial k G N)) n`, the group cohomology of `Homₖ(A, N)`.
The path-connectedness of `X` is part of asphericity; it is a separate hypothesis only because the
local system of a representation is defined on a path-connected space. Route: by the pinned
`TauCeti.IsAspherical.exists_homotopyEquiv_classifyingSpace`, with `Ψ`, there is a homotopy
equivalence `h : X ≃ₕ TauCeti.classifyingSpace G` and a path from `h x` to the base point realizing
`Ψ` after the change of base point; the pullback along `h` of the pinned
`TauCeti.classifyingSpaceLocalSystem k A` has monodromy at `x` equal to `A` pulled back along `Ψ`,
so by `TauCeti.LocalCoefficientSystem.ofRepresentationMonodromyIso` it is isomorphic to the local
system of the statement; twisted homology and cohomology are invariant under homotopy
equivalences with pulled-back coefficients, and the pinned
`TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology` and
`TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology` finish. The monodromy computation is
where the direction of `π₁(BG) ≃* G` under `## Conventions` enters. *Needs:* Tau Ceti
`TauCeti.IsAspherical.exists_homotopyEquiv_classifyingSpace`, `TauCeti.classifyingSpaceLocalSystem`
and the two pinned local-coefficient comparisons, `TauCeti.LocalCoefficientSystem.ofRepresentation`
and `TauCeti.LocalCoefficientSystem.ofRepresentationMonodromyIso`, the pullback and homotopy
invariance of `TauCeti.LocalCoefficientSystem.twistedHomology` and
`TauCeti.LocalCoefficientSystem.twistedCohomology`; Mathlib `groupHomology`, `groupCohomology`,
`Rep.ihom`.

- For an aspherical path-connected Hausdorff CW complex `X` with `Ψ : π₁(X, x) ≃* G` and
  `A : Rep k G`, the twisted homology of the local system of `A` through `Ψ` is isomorphic to
  `Hₙ(G, A)` in every degree.
- In the same setting and for a `k`-module `N`, the twisted cohomology with values in `N` is
  isomorphic to `Hⁿ(G, Homₖ(A, N))` in every degree.

**Checks.**
- `X` the circle, `G = ℤ`, `A = ℤ` with the generator acting by `−1`: `H₀ = ℤ/2` (coinvariants)
  and `H₁ = 0` (invariants) on both sides. A definition that used the constant local system `ℤ`
  would give `H₀ = H₁ = ℤ`.
- `A = k[G]`, the regular representation: the twisted homology is the homology of the universal
  cover, which is contractible, so it is `k` in degree `0` and `0` above; the group side is
  `k[G]_G = k` in degree `0` and vanishes above because `k[G]` is free. With `N = k` the cohomology
  side is `Hⁿ(G, Homₖ(k[G], k))`, the coinduced module, again `k` in degree `0` and `0` above.
- Cohomology on the circle with `A` the sign representation of `ℤ` and `N = ℤ`: `Homℤ(A, ℤ)` is
  again the sign representation, and `H⁰ = 0`, `H¹ = ℤ/2` on both sides.
- Negative control: `S² ∨ S¹` with `Ψ` its identification of `π₁` with `ℤ` and `A = ℤ` trivial:
  the twisted `H₂` is `H₂(S² ∨ S¹; ℤ) = ℤ` and `H₂(ℤ, ℤ) = 0`. The space is not aspherical, so the
  hypothesis cannot be dropped.

### Examples

- The circle, a wedge of circles indexed by `S` and a finite torus are Hausdorff CW `K(G, 1)`
  spaces for `ℤ`, `FreeGroup S` and `ℤⁿ`, so 1.2 identifies their homology with the group
  homology of those groups directly, without the pinned homotopy equivalences to Milnor's model.
- The cellular model `TauCeti.cellularClassifyingSpace R` and Milnor's model have one `0`-cell,
  respectively countably many vertices, and 1.1 compares them by a pointed equivalence in either
  direction, not only from the cellular model.

### Dependencies

Layer 1 consumes the algebraic-topology roadmap's Stage 8 item 8b (1.1 only), the pinned Tau Ceti
declarations listed under `## Exact supplier contracts`, and Mathlib. Layer 1 uses no other layer of
this roadmap.

## Layer 2: comparison with the nerve model

Throughout, `Bπ` is the nerve model `groupClassifyingSpace G` of the algebraic-topology roadmap
with its base vertex, `Eπ → Bπ` its contractible free cover, and `κ_bar` its identification of `π₁`
with `G` (Stage 8 item 8a).

### 2.1 The normalised comparisons

Take from Stage 8 item 8b the normalised pointed comparisons for the two pinned models:
`c_G^M : TauCeti.classifyingSpace G → Bπ` for `κ_Z = TauCeti.classifyingSpaceFundamentalGroupMulEquiv G`,
and, for a presentation `⟨S | R⟩` with an isomorphism `e : PresentedGroup R ≃* G`,
`c_e^C : TauCeti.cellularClassifyingSpace R → Bπ` for `κ_Z` the composite of
`TauCeti.cellularClassifyingSpaceFundamentalGroupMulEquiv R` with `e`. Prove three statements
(Hatcher, Proposition 1B.9, p. 90, for the uniqueness used in the first two).

- `c_e^C` is pointed homotopic to `c_G^M` composed with the forward map of
  `TauCeti.cellularHomotopyEquivClassifyingSpace R e`: both maps are pointed, by
  `TauCeti.cellularHomotopyEquivClassifyingSpace_toFun_basepoint`, and induce the same
  homomorphism on `π₁`, by
  `TauCeti.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq_cellularHomotopyEquivClassifyingSpace`,
  so the uniqueness half of Stage 8 item 8b applies.
- For `φ : G →* H`, `c_H^M ∘ MonoidHom.classifyingSpaceMap φ` is pointed homotopic to the nerve
  model's map induced by `φ` composed with `c_G^M`: both are pointed and induce `φ` under the
  identifications, by `MonoidHom.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq` and Stage 8
  item 8a's naturality of `κ_bar`.
- The lift `ĉ : universalGSpace G → Eπ` of `c_G^M` sending the vertex `⟨0, 1⟩` to the base vertex
  of `Eπ` is `G`-equivariant for the two left actions: `ĉ (g • e) = g • ĉ e`. Route: a lift of a
  pointed map between the bases intertwines the deck transformations of `γ` and of its image; by
  `## Conventions` the deck transformation of `γ` in Milnor's model is left translation by
  `κ_M(γ)⁻¹`, by Stage 8 item 8a's stated conversion the same holds in the nerve model with
  `κ_bar`, and the normalisation `κ_bar ∘ π₁(c_G^M) = κ_M` identifies the two translations.

*Needs:* AlgebraicTopology Stage 8 items 8a (nerve model, `κ_bar`, its naturality and its
deck-action conversion) and 8b (classification and `c_Z`); Tau Ceti
`TauCeti.cellularHomotopyEquivClassifyingSpace`, `MonoidHom.classifyingSpaceMap`,
`MonoidHom.classifyingSpaceFundamentalGroupMulEquiv_mapOfEq`,
`TauCeti.classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`; Mathlib `IsCoveringMap` lifting.

**Checks.**
- `G = 1`: all three models are contractible, and every comparison is the unique pointed homotopy
  class to a contractible space.
- `G = ℤ`: the loop of Milnor's model whose lift ends at `⟨0, 1⟩` has image `−1`, so `c_G^M` sends
  it to the class of the nerve edge labelled `−1`; a comparison that dropped the inversion of
  Milnor's convention would send it to the edge labelled `1`, an error the abelian `ℤ` detects.
- `G = S₃` with `s`, `t` as under `## Conventions`: equivariance gives
  `ĉ (s • t • ⟨0, 1⟩) = (s * t) • ĉ ⟨0, 1⟩`, while a lift that turned the left action into a
  right one would give `(t * s) • ĉ ⟨0, 1⟩`, a different vertex because `s * t ≠ t * s`.

### 2.2 One comparison with group (co)homology

Prove that the comparisons of the three models with group (co)homology agree under `c_G^M`.

- Constant coefficients: for a commutative ring `k` in the universe of `G` and every `n`, the
  pinned `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology` is the map induced by `c_G^M`
  on `Hₙ(-; k)` followed by the nerve model's comparison
  `IsQuotientCoveringMap.singularHomologyIsoGroupHomology` for `Eπ → Bπ`; likewise in cohomology
  with `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology`. Route: the equivariant lift
  `ĉ` of 2.1 and `IsQuotientCoveringMap.singularHomologyIsoGroupHomology_hom_naturality` with
  `φ` the identity, and its cohomological counterpart.
- Local-coefficient homology: for `A : Rep k G`, pullback along `c_G^M` identifies the local system
  of `A` attached to `Eπ → Bπ` with `TauCeti.classifyingSpaceLocalSystem k A` (through `ĉ`), and
  under this identification `IsQuotientCoveringMap.twistedHomologyIsoGroupHomology` for the two
  covers gives the same isomorphism with `groupHomology A n`.
- Local-coefficient cohomology over `ℤ`: for `B : Rep ℤ G` and an abelian group `N`, put
  `A = (Rep.ihom B).obj (Rep.trivial ℤ G N)`. Stage 8 item 8b identifies the cohomology of `Bπ` with
  coefficients in the local system of `A` with `groupCohomology A n`; the pinned
  `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology` with `k = ℤ` identifies the twisted
  cohomology of Milnor's model with local system of `B` and values in `N` with the same group.
  Prove that pullback along `c_G^M`, followed by the identification of local systems through `ĉ`
  and of cochains with values in `N` on the twisted chains of `B` with cochains with values in the
  local system `Homℤ(B, N)`, carries the first isomorphism to the second, so that the composite
  automorphism of `groupCohomology A n` is the identity.

(Brown 1982, §III.1, for the independence of group cohomology from the resolution.) *Needs:* 2.1;
AlgebraicTopology Stage 8 items 8a (the contractible free cover) and 8b (the bar-model
local-coefficient identification over `ℤ`); Tau Ceti the pinned comparisons and naturality
statements listed under `## Exact supplier contracts`, `TauCeti.classifyingSpaceLocalSystem`;
Mathlib `groupHomology`, `groupCohomology`, `Rep.ihom`.

**Checks.**
- `G = 1`: both sides are `k` in degree `0` and `0` above, and the composite is the identity of
  `k`.
- `G = ℤ`, `k = ℤ`, degree one: `H₁(ℤ, ℤ) = ℤ`, and the composite automorphism is `+1`. A
  comparison through an identification of `π₁` with `G` composed with inversion, an automorphism
  of the abelian `ℤ`, gives `−1`; the same test in cohomology, `H¹(ℤ, ℤ) = Hom(ℤ, ℤ)`, gives the
  same sign.
- `G = ℤ²`, `k = ℤ`, degree one: `H₁(ℤ², ℤ) = ℤ²`, and the composite automorphism is the identity
  matrix. A comparison through an identification of `π₁` with `G` composed with the swap of the two
  factors, an automorphism that `ℤ` alone cannot exhibit, gives the swap matrix. On Milnor's side
  the class of a loop representing `g` goes to the class of the `1`-chain `g`
  (`TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology`), which fixes the identity.

### 2.3 One comparison of resolutions

The nerve model's universal cover is the realization of Mathlib's
`classifyingSpaceUniversalCover G` (the simplicial `G`-set `[n] ↦ Gⁿ⁺¹`), and by Stage 4 item 7 of
the algebraic-topology roadmap its cells are its nondegenerate simplices, the tuples
`(g₀, …, gₙ)` with `gᵢ ≠ gᵢ₊₁`. Prove that its lifted cellular chain complex, with the deck action
of 2.1, is the normalised standard complex: the quotient of `Rep.standardComplex k G` by the
subcomplex spanned by the tuples with two equal consecutive entries, with the cell of a tuple going
to its class times a unit of `k` that depends only on the degree and is `1` in degree zero (the
orientation of the cells is Stage 4 item 7's). By `TauCeti.exists_isCellular_homotopicRel`,
`c_G^M` is pointed homotopic to a cellular map; prove that the lift of such a cellular map induces
a `G`-equivariant, augmentation-preserving chain map from the cellular chains of the countable
join, identified with the pinned resolution `TauCeti.universalGSpaceResolution` through the pinned
`TauCeti.cellularChainComplexRealizationIso` (which rescales the cell of each degree by a unit, `1`
in degree zero), to the normalised standard complex, and that it is chain homotopic to the pinned
`TauCeti.universalGSpaceToStandardComplex` followed by the quotient map. The homotopy is the
uniqueness up to homotopy of comparison maps between projective resolutions lifting the identity of
the trivial representation (Brown 1982, §I.7), once both maps are shown equivariant and
augmentation-preserving. *Needs:* 2.1; AlgebraicTopology Stage 8 item 8a and Stage 4 item 7;
Tau Ceti `TauCeti.exists_isCellular_homotopicRel`, `TauCeti.universalGSpaceResolution`,
`TauCeti.universalGSpaceToStandardComplex`, `TauCeti.cellularChainComplexRealizationIso`,
`TauCeti.cellularChainComplexRep`; Mathlib
`Rep.standardComplex`, `classifyingSpaceUniversalCover`, `CategoryTheory.ProjectiveResolution`.

**Checks.**
- `G = 1`, degree zero: the join has the free module `ℤ^(ℕ)` on its vertices `⟨i, 1⟩` and the
  normalised standard complex has `ℤ`, so the chain map is not an isomorphism, only a homotopy
  equivalence; a definition claiming an isomorphism is refuted here.
- `G = 1`, degree one: the normalised standard complex is zero, since `(1, 1)` is degenerate,
  while the join has one free generator for every pair of indices `i < j`; the chain map is zero in
  degree one.
- The join simplex `{⟨0, g⟩, ⟨1, g⟩}` goes to the degenerate tuple `(g, g)`, whose class in the
  normalised complex is `0`; a map into the unnormalised complex `Rep.standardComplex` would not
  vanish on it, and the comparison here is the composite with the quotient.

### Examples

- For `G = ℤ`, 2.1 compares the nerve model with Milnor's model and, through the pinned
  `TauCeti.circleHomotopyEquivClassifyingSpace`, with the circle; 2.2 identifies the three
  isomorphisms `H₁ = ℤ` with the same sign.
- For a free group on `S`, the cellular model of the presentation with no relators is a wedge of
  circles up to homotopy (pinned `WedgeCircles.lean`), and 2.1 gives its comparison with the nerve
  model through `c_e^C`.

### Dependencies

Layer 2 consumes the algebraic-topology roadmap's Stage 8 items 8a and 8b and Stage 4 item 7, the
pinned Tau Ceti declarations listed under `## Exact supplier contracts`, and Mathlib; inside this
roadmap, 2.2 and 2.3 use 2.1.

## Downstream consumers

- FreeGroupsAndLimitGroups uses the presentation complex and its fundamental group, which are the
  pinned `TauCeti.PresentationComplex` and `TauCeti.PresentationComplex.fundamentalGroupMulEquiv`.
- CharacteristicClasses compares its strong-topology join with the weak-topology countable join of
  Milnor's model, the pinned `TauCeti.universalGSpace`.
- TangentialBordism uses the homology of classifying spaces of finite cyclic groups: the pinned
  `ClassifyingSpace/FiniteCyclic.lean`, and 1.2 for other models.
- ArithmeticLocallySymmetricSpaces uses the CW structures along coverings with their free cellular
  chains, pinned, and the local-coefficient cohomology comparison, 1.3.
- StableHomotopyKTheory and ArithmeticKTheory use the comparison of the nerve model with Milnor's
  model and the identification of its homology with group homology, 2.1 and 2.2.

## References

- A. Hatcher, *Algebraic Topology*, Cambridge University Press, 2002. Section 1.B, Theorem 1B.8 and
  Proposition 1B.9, p. 90, for `K(G, 1)` spaces and maps into them; Section 2.2, "Homology of
  Groups", p. 148, for the homology of a `K(G, 1)` as group homology; Section 3.H, Proposition 3H.4,
  p. 331, for homology with local coefficients through the universal cover.
- K. S. Brown, *Cohomology of Groups*, GTM 87, Springer, 1982. Section I.7 for the uniqueness of
  comparison maps between projective resolutions, Section II.4 for the topological interpretation
  of group homology, Section III.1 for group cohomology and its independence of the resolution.
- J. Milnor, "Construction of universal bundles, II", *Ann. of Math.* **63** (1956), 430–436,
  [DOI](https://doi.org/10.2307/1970012). The countable join and its free action.
- G. Segal, "Classifying spaces and spectral sequences", *Publ. Math. IHÉS* **34** (1968),
  [DOI](https://doi.org/10.1007/BF02684591), Section 3, p. 107, the comparison of the nerve model
  `BG` with Milnor's `(G * G * ⋯)/G`.
- T. tom Dieck, *Transformation Groups*, de Gruyter, 1987, Section II.1. `G`-CW complexes and
  their orbit spaces.
- R. Schwamberger and R. M. Vogt, "Dold spaces in homotopy theory", *Algebr. Geom. Topol.* **9**
  (2009), 1585–1622, [DOI](https://doi.org/10.2140/agt.2009.9.1585), Section 2. The Warsaw circle
  as a space with trivial homotopy groups that is not contractible.
