# Complex manifolds: transport, quotients, bundles, and gluing

This roadmap builds the reusable infrastructure for constructing complex manifolds from charts,
free group actions, and compatible open pieces. Its summit is a single structure-groupoid API
which supports restriction of scalars, transport of atlases, smooth and complex quotients,
holomorphic vector bundles, and open gluing without replacing Mathlib's carriers or manifold
classes.

Suggested homes are `TauCeti/Geometry/Manifold/Complex/`,
`TauCeti/Geometry/Manifold/Quotient/`, and
`TauCeti/Geometry/Manifold/VectorBundle/Holomorphic/`.

## Scope and completion criterion

The roadmap is complete when Tau Ceti has the following library, with the standard basic API for
every object it introduces.

1. A boundaryless finite-dimensional complex manifold can be realified functorially and recharted
   along a real continuous linear equivalence. Holomorphic maps and biholomorphisms become smooth
   maps and diffeomorphisms, and the construction commutes with products, open subspaces, and
   restrictions.
2. Its complex atlas induces the canonical orientation of the underlying real manifold in the
   orientation carrier supplied by the differential-geometry roadmap. This orientation is functorial for
   biholomorphisms and compatible with products, open submanifolds, realification, and recharting.
3. Mathlib's carrier `OnePoint ℂ` has a named two-chart complex atlas for the Riemann sphere, with
   compactness and separation inherited from its existing topology.
4. Using Mathlib's quotient-manifold structure for free properly discontinuous actions, the orbit
   projection for a biholomorphic action is a local biholomorphism, and invariant holomorphic maps
   and sections descend with the expected universal property.
5. Compatible manifold atlases on the pieces of `TopCat.GlueData` give its existing glued carrier
   a smooth or complex atlas. The canonical inclusions are open local diffeomorphisms, and the
   construction is unique and functorial.
6. Holomorphic vector bundles with a fixed finite-dimensional complex fibre, especially line
   bundles, can be built from holomorphic transition
   cocycles and manipulated through pullback, dual, tensor product, determinant, normal, and
   canonical-bundle constructions.
7. Finite open gluings have reusable Hausdorff, second-countability, connectedness, and proper-map
   criteria strong enough to establish global instances from local data.

The roadmap owns boundaryless atlas mechanics, the local-diffeomorphism and descent API extending
Mathlib's free properly discontinuous quotients, open gluing, and holomorphic bundle gluing. It does
not own manifolds with boundary,
collars, handles, or boundary gluing; arbitrary covering-space classification; almost-complex or
pseudoholomorphic-curve theory; analytic toric geometry; complex-torus families; coherent sheaf
cohomology; or Riemann--Roch.

## Ownership and dependencies

- Mathlib owns `ChartedSpace`, `ModelWithCorners`, `StructureGroupoid`, `HasGroupoid`,
  `Structomorph`, `IsManifold`, `Diffeomorph`, `IsLocalDiffeomorph`, `TopCat.GlueData`,
  `FiberBundle`, `VectorBundle`, `ContMDiffVectorBundle`, and the standard orbit quotients; the
  installed quotient atlas is retained by Tau Ceti's quotient implementation (see below).
  This roadmap extends those APIs and does not introduce replacement manifold, gluing, quotient, or bundle carriers.
- The [completed universal-covers roadmap](../../Completed/UniversalCovers/README.md) owns universal covers, deck groups,
  quotient-cover classification, and lifting theory. This roadmap consumes
  `IsQuotientCoveringMap` and `IsAddQuotientCoveringMap` and adds the compatible
  local-diffeomorphism and holomorphic descent API.
- The [geometric-topology roadmap](../GeometricTopology/README.md) owns manifolds with boundary,
  collars, handle attachment, connected sum, cobordisms, and boundary gluing. Open gluing of
  boundaryless structure-groupoid atlases is owned here.
- The [differential-geometry roadmap](../DifferentialGeometry/README.md), Layers 2 and 10, owns
  chosen manifold orientations and degree. This roadmap proves that a complex atlas has its
  canonical real orientation in that carrier and supplies integrable atlas constructions.
  The bridge theorem is an equivalence between the chartwise complex orientation defined here and
  the DifferentialGeometry chosen orientation represented by source-indexed chart signs; this
  roadmap does not introduce a second orientation carrier.
- The [conformal-mapping roadmap](../ConformalMapping/README.md) owns one-variable analytic
  theorems such as Riemann mapping and Schwarz reflection. It consumes the Riemann-sphere manifold
  and transport interfaces from this roadmap.
- [SmoothBundlesConnections B2, #887](https://github.com/TauCetiProject/TauCetiRoadmap/pull/887)
  owns missing generic associated, direct-sum, dual, tensor, exterior-power and Hom bundle
  carriers. This roadmap proves their holomorphic refinements on those same carriers, with
  explicit realification/forgetful comparison maps. Only B2's foundational operation layer is
  an input, not its connections or projective examples.
- The complex-tori and analytic-toric-geometry roadmaps consume the quotient, bundle, and open
  gluing interfaces here. They own their geometric constructions and do not add competing general
  quotient theorems.

Coordination with the authors and reviewers of the cited Mathlib work and sibling roadmaps comes
before integrating overlapping implementations. Tau Ceti implements every target here at its
current dependency pin; an open Mathlib change determines API shape, never whether work proceeds.

## Mathlib inventory and target shape

At the repository pin, consume the following existing interfaces directly.

- `ChartedSpace`, `ModelWithCorners`, `StructureGroupoid`, `HasGroupoid`, `contDiffGroupoid`,
  `Structomorph`, `ContMDiff`, `Diffeomorph`, and `IsLocalDiffeomorph` from
  `Mathlib/Geometry/Manifold/`.
- `TopCat.GlueData`, its carrier `D.toGlueData.glued`, its canonical maps
  `D.toGlueData.ι i`, the theorem `D.ι_isOpenEmbedding i`, its open-set criterion, and its
  colimit universal property from `Mathlib/Topology/Gluing.lean`.
- `ProperlyDiscontinuousSMul`, `ProperlyDiscontinuousVAdd`, `IsQuotientCoveringMap`,
  `IsAddQuotientCoveringMap`, `MulAction.orbitRel.Quotient`, and
  `AddAction.orbitRel.Quotient`. In particular, consume
  `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul.isCoveringMap`,
  `MulAction.isOpenQuotientMap_quotientMk`,
  `t2Space_of_properlyDiscontinuousSMul_of_t2Space`,
  `ContinuousConstSMul.secondCountableTopology`, and `Quotient.instConnectedSpace` directly. The
  quotient carrier is never replaced by a tagged copy or a chosen quotient section.
- `FiberBundle`, `VectorBundle`, `VectorBundleCore`, `ContMDiffVectorBundle`, bundle
  trivializations, and the existing pullback and bundle-hom APIs.
- `OnePoint ℂ` and `OnePoint.equivProjectivization`, including the existing homogeneous-coordinate
  formulas. No topology or charted space is placed on a second projective-line carrier.

The pinned Tau Ceti modules already implement the following foundations; import them directly.

- `TauCeti.Geometry.Manifold.Instances.OnePoint`: `OnePoint.affineChart`, `invChart`,
  `instChartedSpace`, their source/target and evaluation formulas, and `instIsManifold`
  at analytic regularity `ω`. The complex `∞` specialization uses this installed atlas.
- `TauCeti.Geometry.Manifold.Instances.Quotient`: `TauCeti.instIsManifoldQuotient` and
  `TauCeti.isLocalDiffeomorph_quotientMk`, under `ContMDiffConstSMul I n G M`, on
  Mathlib's installed quotient atlas. Local biholomorphy is their complex specialization.
- `TauCeti.Geometry.Manifold.Gluing`: `TauCeti.chartedSpaceOfIsOpenEmbedding`,
  `isManifold_chartedSpaceOfIsOpenEmbedding`, smooth inclusions/local inverses, and
  `partialDiffeomorphOfIsOpenEmbedding`. Milestone 5 supplies the `TopCat.GlueData`
  compatibility adapter and the remaining functoriality and comparison laws.
- `ContMDiffVectorBundle`, `VectorBundleCore.IsContMDiff`, the smooth-core/prebundle
  constructors, and their total-space manifold/projection infrastructure are Mathlib inputs;
  specialize to the complex field and `∞`, without introducing another transition mixin.

The following Mathlib interfaces determine migration and missing-comparison targets.

- [mathlib4#40727](https://github.com/leanprover-community/mathlib4/pull/40727), at
  [revision 9da60c2](https://github.com/pepamontero/mathlib4/blob/9da60c2df334c05bcf3b745a17854c9404bb0518/Mathlib/Geometry/Manifold/Instances/Quotient.lean),
  uses `orbitRel.Quotient.localInverseAt`, `localInverseAt_apply_mk_eq_smul`,
  `localInverseAt_symm_trans_eqOn_smul`, `exists_smul_mem_localInverseAt_target`,
  `transitionMap`, `transitionMap_eqOn_smul`, `mk_chartAt_symm_mem_localInverseAt_source`,
  and `MulAction.isManifold_quotient_of_contMDiffConstSMul`.
  Consume the installed Tau Ceti implementation now. On a dependency migration, adapt local
  sections to the installed right inverse or prove the identity diffeomorphism between its atlas
  and the atlas based on `chartedSpaceOfRightInverse Quotient.out_eq`. They are compatible
  atlases, not definitionally identical instances. Never install a competing global quotient
  atlas or require an obsolete transition lemma. The covering, separation and countability
  results above remain direct inputs.
- [mathlib4#42847](https://github.com/leanprover-community/mathlib4/pull/42847) develops transport
  of charted spaces and structure groupoids along homeomorphisms. Atlas transport and
  realification follow that design. Whenever the dependency pin lacks it, Tau Ceti locally mirrors
  the declarations from its `Mathlib.Geometry.Manifold.PullbackGroupoid` module:
  `Homeomorph.pullbackChartedSpace`, `_chartAt`, `_atlas`,
  `transOpenPartialHomeomorph_mem_pullbackChartedSpace_atlas`, `pullback_symm_trans`,
  `pullback_hasGroupoid`, and `pullbackStructomorph`. Realification, canonical complex orientation,
  compatible-gluing adapters, and the missing holomorphic bundle comparisons remain targets
  here on the installed carriers.

## Encoding conventions

- A complex manifold is a type with the ordinary `TopologicalSpace`, `ChartedSpace`,
  `HasGroupoid`, and `IsManifold` instances. Do not collect its carrier, topology, atlas, and
  properties in a new record.
- Use `contDiffGroupoid ∞ 𝓘(ℂ, E)` for a complex atlas. `PartialDiffeomorph` is an implementation
  tool, not a public compatibility condition.
- A group action used in a complex quotient must preserve the complex structure groupoid. In
  direct function language, require
  `∀ g, ContMDiff 𝓘(ℂ, E) 𝓘(ℂ, E) ∞ (g • ·)`. Applying the same hypothesis to `g⁻¹` proves that
  every action map is a biholomorphism. Continuity alone, or smoothness only after realification,
  is insufficient.
- Keep the orbit projection and any separate bundle projection distinct. For an action on `M`,
  `M → MulAction.orbitRel.Quotient G M` is the covering map and local biholomorphism. A map from
  that quotient to another base can be a submersion, but is not thereby a covering map.
- Transported atlases are named definitions. Supply local or scoped instances at their use sites;
  do not install unrestricted global instances when several transported atlases can inhabit the
  same carrier.
- An atlas on `D.V (i, j)` is compatible with the piece atlases only when both canonical maps
  `D.f i j : D.V (i, j) → D.U i` and
  `x ↦ D.f j i (D.t i j x) : D.V (i, j) → D.U j` are open local diffeomorphisms for the chosen
  model. This pair of hypotheses is the public gluing input; smoothness of `D.t i j` between
  independently chosen overlap atlases is not sufficient.
- Bundle transition data use functions into continuous linear equivalences and Mathlib's cocycle
  equations. A line bundle is the rank-one case of this API, not a separate bespoke carrier.

## Milestone 1: restriction of scalars and atlas transport

Fix a finite-dimensional complex normed vector space `E` and the boundaryless model
`𝓘(ℂ, E)`.

1. Construct the underlying real model on the same carrier from restriction of scalars. Prove
   that membership in the complex `contDiffGroupoid` implies membership in the real smooth
   groupoid. Derive a named real `ChartedSpace` and `IsManifold` structure from a complex one.
2. Prove functoriality for holomorphic maps, biholomorphisms, products, open subspaces,
   restrictions, tangent maps, and bundle charts. Show that the real derivative agrees with the
   restricted complex derivative.
3. Transport models, atlases, and structure groupoids along a `ContinuousLinearEquiv` and along a
   homeomorphism `e : M ≃ₜ N` of carriers. Prove that the comparison diffeomorphism has
   underlying map `e`; for model changes on the same carrier its underlying map is the identity.
   Prove composition and inverse laws for transport.
4. Prove that realification commutes, up to the canonical identity diffeomorphism, with recharting,
   products, and open restrictions.
5. Construct the standard coordinate equivalence between the realification of
   `EuclideanSpace ℂ (Fin n)` and `EuclideanSpace ℝ (Fin (2 * n))`, and prove its compatibility
   with the preceding transport API.

The source spine is Kobayashi--Nomizu, *Foundations of Differential Geometry*, Volume I,
Chapter I, for atlases and compatible transformations, together with Huybrechts,
*Complex Geometry*, Chapter 1, for complex manifolds and their underlying real manifolds.

## Milestone 2: the canonical real orientation

Use the source-indexed chart-sign orientation carrier owned by DifferentialGeometry Layer 2.
For a finite-dimensional complex model `E`, regard an ordered complex basis as the ordered real
basis `(e₁, i e₁, ..., eₙ, i eₙ)`.

1. Prove that two complex bases determine the same component of the real frame space because the
   real determinant of a complex-linear equivalence is positive. This constructs the canonical
   real orientation of `E` without choosing a basis.
2. Transport the model orientation through every complex chart. Prove on overlaps that complex
   derivatives preserve it, and hence construct the orientation of the realified manifold in the
   shared orientation carrier. Prove independence from the atlas representative.
3. Prove compatibility with restriction to open submanifolds, products using the stated ordered
   product convention, restriction of scalars, and recharting along complex and real continuous
   linear equivalences. Real recharting preserves the transported orientation; comparison with a
   separately fixed model orientation has the sign of the real determinant. State the sign
   incurred by permuting product factors.
4. Prove that every biholomorphism preserves the canonical orientation. Identify this predicate
   literally with the orientation-preserving-map predicate from the DifferentialGeometry API, rather
   than through an adapter or a second orientation definition.

Bott--Tu, *Differential Forms in Algebraic Topology*, Section 1, supplies the complex-orientation
convention; the shared Lean carrier and comparison theorem come from the differential-geometry roadmap.

## Milestone 3: the Riemann sphere

Use Tau Ceti's installed `OnePoint.instChartedSpace` on `OnePoint ℂ`; a named atlas here
is an alias of that instance. Consume its two charts and their formulas directly.

1. The finite chart has source `OnePoint ℂ \ {∞}` and sends `coe z` to `z`. The chart at infinity
   has source `OnePoint ℂ \ {coe 0}`, sends `∞` to `0`, and sends `coe z` to `z⁻¹`.
2. Use the implemented exact source, target, inverse and overlap formulas. The transition on
   `ℂ \ {0}` is inversion; its analyticity is part of the installed manifold proof.
3. Specialize the installed `IsManifold` at `ω` to `∞`, retaining its `ChartedSpace`,
   `HasGroupoid`, compact, Hausdorff, connected and second-countable topology.
4. Relate the atlas to `OnePoint.equivProjectivization` through Mathlib's existing formulas and
   prove the standard Möbius transformations are biholomorphisms.

Forster, *Lectures on Riemann Surfaces*, Sections 1--2, supplies the two-chart source and the
holomorphic transition calculation.

## Milestone 4: smooth and complex quotients

Fix a group `G` acting freely and properly discontinuously on a manifold `M`, with
`ContinuousConstSMul G M`, `T2Space M`, `LocallyCompactSpace M`, and
`ContMDiffConstSMul I n G M`. Use the installed Mathlib quotient atlas and the pinned Tau Ceti
manifold theorem. The topological quotient and covering results in the inventory are inputs.

1. Specialize `TauCeti.isLocalDiffeomorph_quotientMk` to the chosen field and regularity.
   For the complex theorem construct `ContMDiffConstSMul 𝓘(ℂ, E) ∞ G M` from the
   displayed holomorphy of every action map. Obtain local biholomorphy without rebuilding
   the quotient manifold. Supply additive versions on the existing additive orbit carrier.
2. For an invariant map `f : M → N`, construct its quotient descent on the standard quotient.
   Prove continuity, smoothness, or holomorphy exactly when the pullback along the quotient
   projection has that property. Prove uniqueness, composition, products, and naturality under
   equivariant maps.
3. Develop the corresponding descent of maps into fibers and of invariant sections of pulled-back
   bundles. Prove that equivariant bundle maps descend and that descent commutes with pullback,
   dual, tensor product, and determinant.
4. Package a compact-fundamental-domain convenience theorem: if a compact set `K ⊆ M` meets every
   orbit, the quotient is compact because it is the image of `K` under the existing continuous
   orbit projection.
5. Prove that quotient atlases commute, up to the canonical identity diffeomorphism, with
   realification and recharting.

Lee, *Introduction to Smooth Manifolds*, supplies the free proper-action quotient argument;
Forster, Sections 4--5, supplies the analytic-covering and holomorphic descent pattern. The
installed quotient atlas and the versioned Mathlib migration comparison above fix the Lean
carriers and local-section conventions.

## Milestone 5: compatible open gluing

Let `D : TopCat.GlueData` and give every piece `D.U i` a charted-space structure for one model
and structure groupoid.

1. State overlap compatibility by requiring the two canonical maps from `D.V (i, j)` to its
   adjacent pieces, namely `D.f i j` and `D.f j i ∘ D.t i j`, to be open local diffeomorphisms.
   Thus the overlap atlas is compatible with both piece atlases, and the second map records the
   transition equation rather than treating `D.t i j` between arbitrary overlap atlases as the
   whole condition. Prove symmetry, restriction, and cocycle lemmas from `GlueData` rather than
   copying the gluing relation into a new record.
2. Define the named atlas on `D.toGlueData.glued` by
   `TauCeti.chartedSpaceOfIsOpenEmbedding`, using `D.ι_isOpenEmbedding` and
   `D.ι_jointly_surjective`. Construct its local smooth-transition witnesses from
   `D.ι_eq_iff_rel` and the two compatible overlap maps in item 1, then apply
   `TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding` and its inclusion/local-inverse
   results. This `GlueData` adapter supplies smooth and complex gluing without rebuilding
   the open-cover atlas. Empty pieces impose no extra nonemptiness hypothesis.
3. Prove uniqueness up to the identity diffeomorphism, compatibility with restriction to a
   subfamily of pieces, functoriality under maps of gluing data, and compatibility with products
   and atlas transport.
4. Verify the API on two-chart and finite-star gluings. These are tests of the general theorem,
   not separate gluing constructions.
5. Prove that compatible open gluing commutes, up to the canonical identity diffeomorphism, with
   realification and recharting.

The topology is already encoded by `TopCat.GlueData`; Lee's atlas-gluing arguments and
Kobayashi--Nomizu's pseudogroup formulation supply the manifold proof spine.

## Milestone 6: finite-gluing topology and proper maps

1. For a finite index type, prove second countability of the glued carrier from second-countable
   pieces.
2. Let `X = Σ i, D.U i`, and let `R ⊆ X × X` be the equivalence relation generated by every
   overlap identification, including composites through other pieces. Prove that the quotient is
   Hausdorff when `X` is Hausdorff, the quotient map is open, and `R` is closed in `X × X`.
   Separately give checkable finite-overlap hypotheses which prove closedness of this *generated*
   relation; closedness of the individual overlap graphs is not used as a substitute.
3. Prove connectedness from connected pieces whose nonempty-overlap graph is connected.
4. Prove that properness is local on the target for continuous maps to a Hausdorff space, using
   finite closed refinements over compact subsets. Deduce that a proper map to a compact target has
   compact domain.
5. Prove that all four results are preserved by isomorphisms of gluing data and agree with the
   corresponding Mathlib typeclasses.

Bourbaki, *General Topology*, Chapter I, supplies the quotient-separation and proper-map
criteria; the formal statements remain in Mathlib's topology vocabulary.

6. As a regression test, glue two copies of `ℂ` along `ℂˣ` by the identity. Compute the generated
   relation, prove that it is not closed at the two origins, and show that the resulting doubled
   origin fails the Hausdorff criterion.

## Milestone 7: holomorphic vector and line bundles

Fix a finite-dimensional complex normed space `F` once and for all. A holomorphic vector
bundle is literally `ContMDiffVectorBundle ∞ F E 𝓘(ℂ, EB)` on the existing complex
`VectorBundle`; `HolomorphicVectorBundle` is only an abbreviation for that mixin. On cores use
`VectorBundleCore.IsContMDiff`. Its transition condition quantifies over `e,e'` with
`MemTrivializationAtlas e` and `MemTrivializationAtlas e'`, on `e.baseSet ∩ e'.baseSet`.
The existing total-space manifold and holomorphic projection results are inputs or complex
specializations. A morphism uses the existing fibrewise complex-linear bundle map and a
holomorphic total map.

1. Supply the missing local characterizations for the designated atlas trivializations, and
   equivalently for the maximal compatible holomorphic trivialization atlas. Changes of frame
   must be holomorphic gauges. An arbitrary continuous or real-smooth complex-linear
   trivialization is not admissible: on the trivial line over `ℂ`, the gauge `exp(Re z)`
   sends the holomorphic constant section to a nonholomorphic coordinate function.
   Keep `FiniteDimensional ℂ F` explicit in every finite-rank theorem.
2. Use the existing core/prebundle constructors for holomorphic cocycle gluing. On B2's shared
   direct-sum, dual, tensor, tensor-power, exterior-power and Hom carriers, prove the induced
   transition maps holomorphic. Construct pullback using Mathlib's installed pullback carrier.
   Supply bundle equivalences, identity, composition and naturality, including equality or
   canonical isomorphism with the generic B2 operations after realification. Define determinant
   on B2's chosen top-exterior-power carrier with fibre `⋀^(finrank_ℂ F) F`, and prove its
   holomorphic structure and comparisons there. Do not construct another operation carrier.
3. Develop the rank-one specialization without a second line-bundle carrier. Prove the
   trivial-bundle criterion by a nowhere-zero holomorphic section and identify cocycle
   isomorphisms with holomorphic bundle equivalences.
4. For a closed embedded complex submanifold `i : Z → M` of complex codimension one, prove that
   `tangentMap i` is complex-linear and injective, that its image is a complex vector subbundle,
   and that the quotient `i* TM / TZ` is a rank-one complex bundle. Construct its holomorphic
   structure from transverse complex charts and prove that this quotient-bundle model agrees with
   the transition-cocycle model. A merely real-smooth hypersurface does not satisfy this theorem.
5. Construct the holomorphic cotangent bundle, its finite-rank determinant, and the canonical line
   bundle from the same general API, with the chosen dual and top-exterior-power conventions stated
   in the declarations.
6. For a character of a finite deck group, prove that its order bounds the tensor order of the
   associated line bundle. Prove exact order only when the character-to-Picard homomorphism is
   injective. Supply the standard sufficient theorem for a connected compact covering complex
   manifold: every invertible holomorphic function upstairs is constant, so triviality of an
   associated bundle forces the character to be trivial. Keep these as bundle isomorphism
   statements, not numerical fields of a divisor record.

Huybrechts, *Complex Geometry*, Chapters 1--2, supplies the analytic vector-bundle and canonical-
bundle development; Steenrod, *The Topology of Fibre Bundles*, supplies the transition-function
and change-of-trivialization spine.

## Dependency order

Milestone 1 starts from Mathlib and Milestone 3 from the installed Tau Ceti sphere API.
Milestone 2 uses Milestone 1 and DifferentialGeometry's chosen orientation. The quotient and
covering foundation 4.1–4.2 and the gluing adapter 5 use Milestone 1 and their installed
implementations. Develop 7.1–7.3 next, using that gluing adapter and only
SmoothBundlesConnections B2's foundational operation carriers. Bundle descent 4.3 then uses
7.1–7.3; the character application 7.6 uses 4.1–4.3. Thus quotient foundation does not depend
on its later bundle-descent application. Items 7.4–7.5 use the preceding bundle layer and the
orientation convention of Milestone 2. Milestone 6 uses Milestone 5's canonical maps for its
gluing applications and can develop the general topology independently.

## Acceptance checks

- The quotient of `ℂ` by integer translations is constructed on
  `AddAction.orbitRel.Quotient ℤ ℂ`; it consumes Mathlib's quotient-manifold structure and existing
  covering-map theorem and specializes the installed Tau Ceti local-diffeomorphism result.
- A free properly discontinuous action by non-holomorphic diffeomorphisms does not satisfy the
  complex quotient theorem merely because its underlying real quotient is smooth.
- The orbit projection `M → M/G` is never called the projection of a manifold bundle over an
  unrelated base.
- The named sphere atlas is definitionally the installed `OnePoint.instChartedSpace`, and
  the existing analytic instance supplies its complex smoothness. No second atlas is installed.
- The finite and infinity charts make `OnePoint ℂ` a complex manifold and have transition
  `z ↦ z⁻¹` on the exact punctured overlap.
- Two-chart and finite-star examples acquire complex atlases from the same `TopCat.GlueData`
  theorem, every input overlap atlas is compatible with both adjacent piece atlases, and every
  canonical inclusion is an open local biholomorphism.
- Local bundle characterizations quantify over compatible holomorphic atlas trivializations;
  the real-smooth gauge `exp(Re z)` is excluded. Tensor/dual/determinant refinements use the
  shared B2 carriers and commute with forgetting the holomorphic structure.
- A cocycle for a trivial line bundle and a nontrivial finite-order character both pass through
  the same holomorphic-line-bundle constructor.
- Gluing two copies of `ℂ` along `ℂˣ` produces the doubled origin; its generated equivalence
  relation is not closed and the Hausdorff theorem rejects it.
- The complex orientation constructed from charts is definitionally in the shared orientation
  carrier, and every biholomorphism satisfies its orientation-preserving predicate.
- Two atlases transported to the same carrier remain available as named values without creating
  competing unrestricted global instances.

## References

- Shoshichi Kobayashi and Katsumi Nomizu, *Foundations of Differential Geometry*, Volume I,
  Chapter I.
- John M. Lee, *Introduction to Smooth Manifolds*, second edition, for atlases, smooth maps,
  quotients by free proper actions, and smooth bundles.
- Otto Forster, *Lectures on Riemann Surfaces*, for the Riemann sphere, analytic coverings, and
  holomorphic descent.
- Daniel Huybrechts, *Complex Geometry: An Introduction*, Chapters 1--2, for complex manifolds,
  their underlying real manifolds, and holomorphic vector bundles.
- Norman Steenrod, *The Topology of Fibre Bundles*, for transition functions and bundle gluing.
- Nicolas Bourbaki, *General Topology*, Chapter I, for quotient separation and proper maps.
