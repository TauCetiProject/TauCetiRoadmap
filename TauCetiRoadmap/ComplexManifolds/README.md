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
   orientation carrier shared with the Heegaard Floer roadmap. This orientation is functorial for
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
  `FiberBundle`, `VectorBundle`, `ContMDiffVectorBundle`, the standard orbit quotients, and the
  quotient-manifold theorem developed in mathlib4#40727. This roadmap extends those APIs and does
  not introduce replacement manifold, gluing, quotient, or bundle carriers.
- The [universal-covers roadmap](../UniversalCovers/README.md) owns universal covers, deck groups,
  quotient-cover classification, and lifting theory. This roadmap consumes
  `IsQuotientCoveringMap` and `IsAddQuotientCoveringMap` and adds the compatible
  local-diffeomorphism and holomorphic descent API.
- The [geometric-topology roadmap](../GeometricTopology/README.md) owns manifolds with boundary,
  collars, handle attachment, connected sum, cobordisms, and boundary gluing. Open gluing of
  boundaryless structure-groupoid atlases is owned here.
- The [Heegaard Floer roadmap](../HeegaardFloer/README.md) owns the orientation API and general
  almost-complex and pseudoholomorphic analysis. This roadmap proves that a complex atlas has its
  canonical real orientation in that exact carrier and supplies integrable atlas constructions.
  The bridge theorem is an equivalence between the chartwise complex orientation defined here and
  the Heegaard Floer orientation represented by the positive component of real frames; this
  roadmap does not introduce a second orientation carrier.
- The [conformal-mapping roadmap](../ConformalMapping/README.md) owns one-variable analytic
  theorems such as Riemann mapping and Schwarz reflection. It consumes the Riemann-sphere manifold
  and transport interfaces from this roadmap.
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

The following interfaces are not at the pin and have a fixed supplier or local-mirror policy.

- The active [mathlib4#40727](https://github.com/leanprover-community/mathlib4/pull/40727) owns the
  `IsManifold` theorem for properly discontinuous quotients. Its `IsManifold` construction, local
  inverses, and transition-map API are the selected upstream shape. At a dependency pin predating
  that API, Tau Ceti mirrors precisely `orbitRel.Quotient.localInverseAt`,
  `localInverseAt_apply_mk`, `localInverseAt_symm_trans_eqOn_smul`,
  `exists_smul_mem_localInverseAt_target`, `transitionMap`, `transitionMap_eqOn_smul`,
  `transitionMap_locally_smul`, and `MulAction.isManifold_quotient_of_contMDiffSMul` under a
  temporary internal namespace, then deletes the mirror and imports the Mathlib module on a
  dependency update. Tau Ceti does not mirror `MulAction.instChartedSpaceQuotient` or the
  covering-map, open-quotient, Hausdorff, second-countability, and connectedness results, which are
  already at the pin. The genuinely new targets here are local biholomorphy and descent of
  invariant holomorphic maps, sections, and bundle morphisms.
- [mathlib4#42847](https://github.com/leanprover-community/mathlib4/pull/42847) develops transport
  of charted spaces and structure groupoids along homeomorphisms. Atlas transport and
  realification follow that design. Before it reaches the dependency pin, Tau Ceti locally mirrors
  the declarations from its `Mathlib.Geometry.Manifold.PullbackGroupoid` module:
  `Homeomorph.pullbackChartedSpace`, `_chartAt`, `_atlas`,
  `transOpenPartialHomeomorph_mem_pullbackChartedSpace_atlas`, `pullback_symm_trans`,
  `pullback_hasGroupoid`, and `pullbackStructomorph`. Realification, canonical complex orientation,
  compatible open gluing, and holomorphic bundle structures remain genuinely new Tau Ceti
  declarations.

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
   homeomorphism of carriers. Prove that the identity map between the original and transported
   structures is a diffeomorphism and prove composition and inverse laws for transport.
4. Prove that realification commutes, up to the canonical identity diffeomorphism, with recharting,
   products, and open restrictions.
5. Construct the standard coordinate equivalence between the realification of
   `EuclideanSpace ℂ (Fin n)` and `EuclideanSpace ℝ (Fin (2 * n))`, and prove its compatibility
   with the preceding transport API.

The source spine is Kobayashi--Nomizu, *Foundations of Differential Geometry*, Volume I,
Chapter I, for atlases and compatible transformations, together with Huybrechts,
*Complex Geometry*, Chapter 1, for complex manifolds and their underlying real manifolds.

## Milestone 2: the canonical real orientation

Use the orientation carrier and positive-frame convention owned by the Heegaard Floer roadmap.
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
   linear equivalences. State the sign incurred by permuting product factors.
4. Prove that every biholomorphism preserves the canonical orientation. Identify this predicate
   literally with the orientation-preserving-map predicate from the Heegaard Floer API, rather
   than through an adapter or a second orientation definition.

Bott--Tu, *Differential Forms in Algebraic Topology*, Section 1, supplies the complex-orientation
convention; the shared Lean carrier and comparison theorem come from the Heegaard Floer roadmap.

## Milestone 3: the Riemann sphere

On Mathlib's existing carrier `OnePoint ℂ`, construct a named two-chart complex atlas.

1. The finite chart has source `OnePoint ℂ \ {∞}` and sends `coe z` to `z`. The chart at infinity
   has source `OnePoint ℂ \ {coe 0}`, sends `∞` to `0`, and sends `coe z` to `z⁻¹`.
2. Prove the exact source, target, inverse, and overlap formulas. The transition on `ℂ \ {0}` is
   inversion; prove it and its inverse holomorphic.
3. Establish `ChartedSpace`, `HasGroupoid`, and `IsManifold` for the named atlas and retain the
   existing compact, Hausdorff, connected, and second-countable topology.
4. Relate the atlas to `OnePoint.equivProjectivization` through Mathlib's existing formulas and
   prove the standard Möbius transformations are biholomorphisms.

Forster, *Lectures on Riemann Surfaces*, Sections 1--2, supplies the two-chart source and the
holomorphic transition calculation.

## Milestone 4: smooth and complex quotients

Fix a group `G` acting freely and properly discontinuously on a manifold `M`.

Use the Mathlib-owned quotient-manifold theorem in the exact shape of mathlib4#40727, including its
local inverses and transition maps. At a dependency pin predating that theorem, mirror the same API
locally and replace the mirror with Mathlib imports on a dependency update. The covering-map,
open-quotient, Hausdorff, second-countability, and connectedness results listed in the inventory are
inputs here, not targets.

1. Prove that `Quotient.mk (MulAction.orbitRel G M)` is a local diffeomorphism, using the local
   inverse and transition-map API selected above. Specialize this to biholomorphic actions to obtain
   a local biholomorphism, and give the additive versions through the existing additive action API.
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
Mathlib pull request above is normative for Lean-level names and carriers.

## Milestone 5: compatible open gluing

Let `D : TopCat.GlueData` and give every piece `D.U i` a charted-space structure for one model
and structure groupoid.

1. State overlap compatibility by requiring the two canonical maps from `D.V (i, j)` to its
   adjacent pieces, namely `D.f i j` and `D.f j i ∘ D.t i j`, to be open local diffeomorphisms.
   Thus the overlap atlas is compatible with both piece atlases, and the second map records the
   transition equation rather than treating `D.t i j` between arbitrary overlap atlases as the
   whole condition. Prove symmetry, restriction, and cocycle lemmas from `GlueData` rather than
   copying the gluing relation into a new record.
2. Construct a `ChartedSpace` on `D.toGlueData.glued`, prove `HasGroupoid` and `IsManifold`, and
   prove every `D.toGlueData.ι i` is an open local diffeomorphism. Smooth and complex gluing are
   corollaries of this one theorem.
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

Fix a finite-dimensional complex normed space `F` once and for all. A holomorphic vector bundle is
an existing `VectorBundle ℂ F E` whose Mathlib bundle trivializations have holomorphic transition
maps into `F →L[ℂ] F`. This is a property/mixin on the existing bundle, analogous to
`ContMDiffVectorBundle ∞ F E 𝓘(ℂ, EB)`; it is not a new total-space or fibre carrier. The bundle
charts induce the named complex atlas on `TotalSpace F E`, and a morphism is an existing bundle
map whose fibre maps are complex-linear and whose total map is holomorphic.

1. Define the holomorphic-transition mixin on `VectorBundleCore ℂ B F ι` and on an existing
   `VectorBundle ℂ F E`. Prove that it implies the existing `ContMDiffVectorBundle` instance,
   constructs the total-space complex atlas, makes the projection holomorphic, and is equivalent
   to holomorphy in all bundle trivializations. Keep `FiniteDimensional ℂ F` visible in every
   finite-rank theorem.
2. Prove cocycle gluing, change of trivialization, holomorphic bundle equivalence, pullback, direct sum, dual,
   tensor product, tensor powers, exterior powers, and determinant. Supply identity, composition,
   and naturality lemmas for each operation. The determinant has fixed fibre
   `⋀^(finrank_ℂ F) F`, or the equivalent standard top-exterior-power carrier selected once for the
   API; its rank hypothesis is explicit.
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

Milestones 1 and 3 start from Mathlib. Milestone 2 uses Milestone 1 and the exact orientation carrier
from the Heegaard Floer roadmap. Milestone 4 uses Milestone 1 and the Mathlib-owned quotient shape.
Milestone 5 uses Milestone 1 and `TopCat.GlueData`. Milestone 6 uses Milestone 5's canonical maps
only for its gluing applications and can develop its general topology in parallel. Milestone 7 uses
Milestones 1 and 5; its hypersurface and canonical-bundle targets also use Milestone 2.

## Acceptance checks

- The quotient of `ℂ` by integer translations is constructed on
  `AddAction.orbitRel.Quotient ℤ ℂ`; it consumes Mathlib's quotient-manifold structure and existing
  covering-map theorem, while Tau Ceti supplies the local-biholomorphism result.
- A free properly discontinuous action by non-holomorphic diffeomorphisms does not satisfy the
  complex quotient theorem merely because its underlying real quotient is smooth.
- The orbit projection `M → M/G` is never called the projection of a manifold bundle over an
  unrelated base.
- The finite and infinity charts make `OnePoint ℂ` a complex manifold and have transition
  `z ↦ z⁻¹` on the exact punctured overlap.
- Two-chart and finite-star examples acquire complex atlases from the same `TopCat.GlueData`
  theorem, every input overlap atlas is compatible with both adjacent piece atlases, and every
  canonical inclusion is an open local biholomorphism.
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
