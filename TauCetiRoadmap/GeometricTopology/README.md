# Roadmap: geometric topology and the solved Kirby-list problems

Rob Kirby's problem list (`[Kir97]`, *Problems in Low-Dimensional Topology*) and its
successors hold many problems since **solved** (sometimes by proving the negation of
Kirby's question). Walking that list while building the
[`leanprover/lean-eval`](https://github.com/leanprover/lean-eval) topology problems raises a
narrower question than "can we prove this": can we even *state* the resolved theorem in Lean
today? For a good fraction the answer is no, not because the proof is hard but because the
*statement* needs primitives Mathlib lacks: Dehn surgery, knot concordance, hyperbolic
volume, Heegaard genus, foliation Euler classes, locally flat embeddings,
diffeomorphism-group topologies. This roadmap builds, on top of Mathlib, what is needed to
*state* (not prove) these theorems faithfully.

This is about **statements**, not proofs. A faithful statement of "the Weeks manifold has
the smallest volume among closed orientable hyperbolic 3-manifolds" is already a large,
valuable target. Many of the layers (the manifold buildout, gluing, surgery, the
diffeomorphism-group topology) are reusable infrastructure whose value does not depend on
any one Kirby problem.

Suggested homes: `TauCeti/Geometry/Manifold/` (gluing, connected sum, tubular
neighbourhoods, structure groups), `TauCeti/Geometry/Diffeomorphism/` (the C^∞ topology),
`TauCeti/LowDimTopology/` (Dehn surgery, Heegaard splittings, foliations),
`TauCeti/Geometry/Hyperbolic/` (constant-curvature structures and volume),
`TauCeti/Topology/PL/` (triangulations, collapse).

## Relationship to the Heegaard Floer roadmaps

This roadmap **owns knot theory done properly** (layer 4) and the **concordance and
cobordism foundations** (layer 6): the presentations of a knot or link as first-class types
and the maps between them, smoothly and topologically slice, the knot polynomials with their
algorithms, the concordance group, and the cobordism category. These are foundational
geometric topology that Dehn surgery, concordance, and grid homology all build on, so they
live here rather than inside any one homology theory.

The [combinatorial Heegaard Floer roadmap](../CombinatorialHeegaardFloer/README.md)
*consumes* these knot types and *contributes* homological invariants of them: it builds the
concordance invariant `τ` and the slice-genus bound `|τ(K)| ≤ g_s(K)`, and its Lane K
reconciles grid diagrams with the presentations built here (Cromwell's theorem). So the
dependency runs there-to-here for the *definitions* and here-to-there for the *invariants*.
The shared convention is "a knot has no privileged representation".

## Principles

- **Connected all the way down to Mathlib.** Every layer starts where Mathlib leaves off,
  with no floating definitions: where a primitive exists (`ModelWithCorners`, the tangent
  bundle, `IsCoveringMap`, `HomotopyGroup`, singular homology, the nascent Riemannian-metric
  library) we consume it, named in the inventories below; otherwise the roadmap adds it as an
  explicit dependency. The deliverable is a dependency graph rooted in current Mathlib, not a
  wishlist.
- **Maximum generality where it is natural.** Build manifolds-with-boundary, gluing, tubular
  neighbourhoods, and surgery in general dimension, with arbitrary structure groups (Top, PL,
  Diff, `O(n)`, `SO(n)`) rather than the smooth orthogonal case, and diffeomorphism-group
  topologies for general manifolds rather than just `S³`; the low-dimensional statements then
  fall out as instances. It is the difference between a library and a pile of special cases.
- **Treat the foundations as first-class goals.** Much of the gap is just missing
  differential and geometric topology, so "build connected sums" or "build Dehn surgery" are
  library goals that happen to unlock several problems, not one-off scaffolding.
- **Statements stay unbundled.** As in the PDE and Heegaard Floer roadmaps, named hypotheses
  (locally flat vs smooth, Top vs PL vs Diff, orientable vs not) stay separate rather than
  bundled, so a theorem can be restated in a neighbouring category without rebuilding the
  topology.

## Encoding conventions

These are the cross-cutting Lean choices that have to agree across layers, so that two
agents implementing different layers build compatible APIs rather than locally plausible but
mutually unusable ones. The per-layer sections pin the rest; this section fixes the spine.

- **A manifold is a type with instances, not a bundled record.** A manifold is a type `M`
  carrying the standard Mathlib instances (`TopologicalSpace M`, `ChartedSpace H M`,
  `IsManifold I n M`), exactly as Mathlib does it; constructions (gluing, connected sum,
  surgery, fillings) *produce* such a type together with its instances, and are related to
  one another up to `≃ₘ` / `≃ₜ` in theorem statements rather than by a quotient type. Build a
  moduli/quotient object only where a specific target genuinely needs "the set of manifolds
  up to diffeomorphism"; default to "a type plus a diffeomorphism in the statement".
- **Named conditions are predicates or hypotheses, not new structures.** "Closed",
  "orientable", "hyperbolic", "prime" and the like are predicates/typeclasses on a manifold;
  aliases such as `ClosedOrientable3Manifold` are abbreviations for "a manifold with these
  hypotheses", kept unbundled per the principle above. Carry orientation, framing, and other
  *data* (as opposed to mere properties) as explicit arguments with forgetful maps, not baked
  into the carrier.
- **Knots have no privileged type; do not define `Knot`.** There is no canonical
  representation, so the roadmap does not introduce a `Knot` type. The presentations of
  layer 4 are first-class types in their own right, and the geometric presentation is simply
  *a smooth embedding `S¹ ↪ M`* (worked over a general manifold `M` wherever possible, and
  specialised to `M = ℝ³` or `S³`). In the illustrative target signatures, `K` names a chosen
  presentation, by default a smooth embedding `S¹ ↪ S³`; an invariant or relation is stated on
  whichever presentation is most natural and transported across presentations by layer 4's
  correspondences. Where two layers must talk about "the same knot", they share a presentation
  type, not a hub type.
- **Isotopy is defined generally, then specialised.** Define isotopy and ambient isotopy for
  arbitrary (continuous, and smooth) maps between manifolds once, in full generality, and
  obtain knot equivalence as the specialisation to smooth embeddings `S¹ ↪ M`. The same
  general `Isotopic` underlies locally flat isotopy (layer 2), diffeotopies (layer 3), and
  concordance (layer 6); none of those should re-define it.

## Inventory: what Mathlib gives us (consume)

- **Smooth manifolds with boundary and corners.** `ModelWithCorners` and `IsManifold` in
  `Mathlib/Geometry/Manifold/IsManifold/Basic.lean`; boundary and interior
  (`ModelWithCorners.boundary`, `ModelWithCorners.interior`, `IsInteriorPoint`,
  `IsBoundaryPoint`, and `univ_eq_interior_union_boundary`) in
  `Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean`; the half-space and
  quadrant models `modelWithCornersEuclideanHalfSpace` and
  `modelWithCornersEuclideanQuadrant` in `Mathlib/Geometry/Manifold/Instances/Real.lean`;
  `ChartedSpace` in `Mathlib/Geometry/Manifold/ChartedSpace.lean`.
- **Tangent bundles, smooth maps, derivatives.** `TangentBundle` and `TangentSpace` in
  `Mathlib/Geometry/Manifold/VectorBundle/Tangent.lean`; `ContMDiff` in
  `Mathlib/Geometry/Manifold/ContMDiff/Defs.lean`; bundled smooth maps in
  `Mathlib/Geometry/Manifold/ContMDiffMap.lean`; `mfderiv` in
  `Mathlib/Geometry/Manifold/MFDeriv/`.
- **Structure groupoids.** `StructureGroupoid` in
  `Mathlib/Geometry/Manifold/StructureGroupoid.lean`; `contDiffGroupoid` and
  `analyticGroupoid` in `Mathlib/Geometry/Manifold/IsManifold/Basic.lean`;
  `continuousGroupoid` (the topological-manifold structure group) and `HasGroupoid` in
  `Mathlib/Geometry/Manifold/HasGroupoid.lean`.
- **Diffeomorphisms.** The type `Diffeomorph` (notation `M ≃ₘ⟮I, I'⟯ M'`) in
  `Mathlib/Geometry/Manifold/Diffeomorph.lean`; smooth embeddings (`IsSmoothEmbedding`) in
  `Mathlib/Geometry/Manifold/SmoothEmbedding.lean`. No group topology yet (see below).
- **Point-set topology of maps.** `Homeomorph` in `Mathlib/Topology/Homeomorph/Defs.lean`;
  `IsEmbedding`, `IsOpenEmbedding`, `IsClosedEmbedding` in `Mathlib/Topology/Maps/Basic.lean`.
- **Spheres.** The analytic manifold and Lie-group structure on `Metric.sphere` (via
  stereographic projection, and the circle as a Lie group) in
  `Mathlib/Geometry/Manifold/Instances/Sphere.lean`.
- **Algebraic topology.** `FundamentalGroup` and `FundamentalGroupoid` in
  `Mathlib/AlgebraicTopology/FundamentalGroupoid/`; higher homotopy groups
  (`HomotopyGroup`) in `Mathlib/Topology/Homotopy/HomotopyGroup.lean`; covering maps
  (`IsCoveringMap`) in `Mathlib/Topology/Covering/Basic.lean` with homotopy lifting in
  `Mathlib/Topology/Homotopy/Lifting.lean`; singular homology in
  `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean`; CW complexes in
  `Mathlib/Topology/CWComplex/Abstract/Basic.lean` and
  `Mathlib/Topology/CWComplex/Classical/Basic.lean`.
- **Simplicial machinery.** Abstract simplicial complexes in
  `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean`; geometric simplicial
  complexes in a real vector space in `Mathlib/Analysis/Convex/SimplicialComplex/Basic.lean`;
  simplicial sets and the geometric-realization adjunction (`toTopHomeo`,
  `|Δ[n]| ≅ stdSimplex`) in `Mathlib/AlgebraicTopology/SimplicialSet/TopAdj.lean`.
- **Riemannian metrics.** `RiemannianBundle`, `IsRiemannianManifold`, the induced
  `riemannianEDist`, and `EMetricSpace.ofRiemannianMetric` in
  `Mathlib/Geometry/Manifold/Riemannian/Basic.lean`; path length in
  `Mathlib/Geometry/Manifold/Riemannian/PathELength.lean`. This is the engine for layer 7,
  but it stops at the metric-and-distance level: no volume, no curvature (see below).
- **Lie groups and matrix groups.** `LieGroup` in
  `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`; `Matrix.orthogonalGroup` and
  `Matrix.specialOrthogonalGroup` in `Mathlib/LinearAlgebra/UnitaryGroup.lean`.
- **Knot-adjacent algebra.** `Quandle` (the only knot-adjacent file upstream) in
  `Mathlib/Algebra/Quandle.lean`; presented monoids (the seed for braid groups, from
  Hannah Fechtner's program) in `Mathlib/Algebra/PresentedMonoid/Basic.lean`. Both feed
  layer 4's knot theory (colourings and braid groups), built here and consumed in turn by
  the combinatorial Heegaard Floer roadmap's Lane K.

Everything geometric-topological past this smooth-manifold-and-tangent-bundle level is
missing from Mathlib: the PL and Top structure groups, gluing and surgery, knot theory, the
diffeomorphism-group topology, and the geometric-structure layers (Riemannian volume,
hyperbolic and Thurston geometries, Heegaard genus, foliations, triangulations). Each layer
below says exactly what it starts from and what is absent, so the build list is the layers
themselves rather than a separate enumeration here.

## The layers, bottom-up from Mathlib

Ordered roughly from "closest to Mathlib" to "furthest". The early layers are
high-leverage and close to Mathlib; the geometric-structures layers are the hardest. Each
layer below records what it starts from (in Mathlib or an earlier layer), what to build
(with illustrative target shapes), the design pitfalls, and the Kirby
problems it would let us *state*. The ordering and granularity are a first cut, offered to
be argued with: layers 1 and 5 in particular could be split further, and layers 7 and 8
share a Riemannian substrate that could be its own node.

PL topology runs through two of these layers and the two accounts must agree: layer 1
builds it the chart-based way (a `PLGroupoid` of piecewise-linear transition maps, parallel
to `contDiffGroupoid`), and layer 11 builds it the simplicial way (combinatorial manifolds,
the complexes whose vertex links are spheres or balls). The reconciliation theorem
(layer 11) that the polyhedron of a combinatorial manifold is a PL manifold, and
conversely, is what ties them together, and is the reason layer 1's `PLGroupoid` should be
shaped with that proof in mind.

### Layer 1: manifold-library buildout (general dimension, general structure group)

This is the spine. Almost everything below needs to cut a manifold open along a
submanifold and reglue, and none of it exists in Mathlib today. The work splits into a
*gluing* track and a *structure-group* track. The comparison between the smooth, PL, and
topological structures, where the two tracks would meet, is a major sub-project in its own
right and is flagged separately below rather than treated as a quick deliverable.

**From Mathlib.** `ModelWithCorners 𝕜 E H` and `IsManifold I n M`
(`Mathlib/Geometry/Manifold/IsManifold/Basic.lean`); the boundary and interior of a
manifold as sets, `I.boundary M : Set M`, `I.interior M`, with `I.IsBoundaryPoint`,
`I.IsInteriorPoint`, and `univ_eq_interior_union_boundary`
(`Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean`); the half-space and
quadrant models `modelWithCornersEuclideanHalfSpace n` and `modelWithCornersEuclideanQuadrant n`
(`Mathlib/Geometry/Manifold/Instances/Real.lean`); `StructureGroupoid H`, `Pregroupoid H`,
and the constructor `Pregroupoid.groupoid` (`Mathlib/Geometry/Manifold/StructureGroupoid.lean`);
`contDiffGroupoid`, `analyticGroupoid`, and `continuousGroupoid`.

**What to build, gluing track.**
- **Boundary as a manifold** — in Tau Ceti for the half-space model
  (`TauCeti/Geometry/Manifold/Boundary/Charts.lean`: `TauCeti.isManifold_boundary`, with the inclusion a
  closed smooth embedding), consumed here as the prerequisite for every gluing below. ⚠ "One dimension
  lower" hid a model choice: `ModelWithCorners` does not hand you a canonical boundary model, and the
  library pins the finite-dimensional real half-space model `modelWithCornersEuclideanHalfSpace n`, whose
  boundary model is `ℝ^(n-1)` (the coordinate hyperplane). Corners are different: the boundary of a
  manifold with corners is not a manifold at a corner, and the face-indexed abstract boundary — the
  faces along which gluing operates, each a manifold with corners one dimension down — is the
  [differential-geometry roadmap](../DifferentialGeometry/README.md)'s (its 5.5), consumed here.
- **Complements of embedded balls.** For a smooth embedding e of the closed
  unit n-ball in a boundaryless n-manifold, construct `ballComplement e` on
  the subtype `M ∖ e(B°)`, with its subspace topology and smooth
  manifold-with-boundary atlas. Identify its boundary smoothly with
  `e(S^(n−1))` and the abstract boundary model above; prove its interior
  inclusion is smooth and agrees with M's original charts, and export the
  boundary inclusion, orientation and restriction comparisons. For n≥1,
  apply this layer's independent tubular-neighborhood theorem to the embedded
  boundary sphere. The differential of e on the radial vector trivializes
  its normal line and picks the outward side. Use compactness of the sphere
  for a common tube width; prove that its inward half lies in e(B°) and its
  outward half lies in the complement, using the interior inverse-function
  theorem, the embedding and the boundary identification. The outward half
  of this tube gives the complement's half-space charts; prove their
  transition smoothness, independence of auxiliary tube data and agreement
  with the original interior charts. For n=0 the complement is an open
  discrete manifold with empty boundary. The tube theorem uses only the
  boundary sphere in the original boundaryless M, independently of the
  complement and collar theorem. These charts precede
  `BoundaryCollar (ballComplement e)`.
  For a manifold already having boundary require the embedded ball to lie in
  its interior; the old boundary and new sphere give disjoint boundary pieces.
- **Collar neighbourhoods.** A boundary component has a neighbourhood diffeomorphic to
  `∂M × [0, 1)` (the collar theorem; Hirsch, *Differential Topology*, GTM 33, Theorem 6.1,
  [extract](references/hirsch-collar.md); Lee, *Introduction to Smooth Manifolds*, GTM 218,
  2nd ed., Theorem 9.25, [extract](references/lee-smooth-collar.md)). Collars are what make a
  gluing smooth rather than merely topological, and they feed the well-definedness proofs.
  Package a `BoundaryCollar M` by its smooth embedding of `∂M × [0,1)` into M,
  its restriction to the boundary inclusion at parameter0, and its open image
  containing the boundary. Supply the inverse collar coordinates and their
  smoothness, restriction to smaller widths and comparison API.
- **Smooth compact-surface comparison.** For a compact Hausdorff second-countable
  smooth real two-manifold, with or without boundary, construct the comparison
  of its actual smooth atlas with the triangulation-based surface carriers of
  [PlanarTopology Layers 0,3,5,8](https://github.com/mccorvie/TauCetiRoadmap/blob/7f2099ebe4dd3e6388764fc67b57461e890de13f/TauCetiRoadmap/PlanarTopology/README.md)
  and [SurfaceTopology Layers 2–3,6,8](https://github.com/mccorvie/TauCetiRoadmap/blob/7f2099ebe4dd3e6388764fc67b57461e890de13f/TauCetiRoadmap/SurfaceTopology/README.md).
  Consume their topological classification, Radó/PL comparison and smoothing
  of compatible triangulations. Own the converse needed for a given smooth
  atlas: construct a finite triangulation and a realization homeomorphism
  for which, after a specified subdivision, each closed simplex is smoothly
  embedded with injective differential. Carry the boundary as a subcomplex.
  This is compatibility with the given smooth structure, not a claim that
  its chart transitions are PL or that an arbitrary triangulation has that
  compatibility. Construct the finite smooth arc/triangle decomposition in
  coordinate discs and half-discs, the relative edge/vertex smoothing and
  subdivisions, with the overlap, nondegeneracy and realization comparisons.
  For prescribed compatible finite data on a closed boundary collar,
  construct the extension fixing a smaller collar; collar straightening
  precedes gluing, so pointwise boundary agreement alone is not substituted
  for smooth agreement on a collar.

  Apply the cited compatible-PL smoothing/uniqueness and homeomorphism
  approximation theorems to these actual triangulations. Export existence
  and uniqueness up to smooth diffeomorphism of the orientable genus-g and
  nonorientable k-crosscap models with b boundary components, by consuming
  SurfaceTopology's classification rather than reproving its finite or
  topological invariant theory. Construct the smooth model by the cited
  smoothing or this layer's disc/handle gluing, and compare the two. For a
  homeomorphism whose restrictions to neighborhoods of the specified closed
  boundary collars are smooth diffeomorphisms onto their images,
  construct a diffeomorphism agreeing on smaller collars and the relative
  comparison isotopy, with its source/target smooth structures explicit.
  Track its orientation sign when orientations are supplied. Include the
  sphere, disc, annulus, torus and empty/disconnected finite unions separately.
  On closed orientable surfaces compare the resulting triangulation with
  AlgebraicTopology's genus-g CW model having one vertex, 2g edges and a
  two-cell attached by the product of commutators; construct the realization
  and cellular/singular comparison maps, treating genus0 by the sphere model.
  Export restriction, boundary, gluing and smooth-structure transport laws.
  These are the smooth/polygon/CW interfaces used by IndexTheory's curve
  cut-and-paste argument. This two-dimensional adapter uses the cited
  triangulation-based theory, not this roadmap's later general chart-based
  PL/smoothing reconciliation; that reconciliation consumes its surface case.

  Read the consumed classification invariants as χ=2−2g−b in the
  orientable case and χ=2−k−b in the nonorientable case. AlgebraicTopology
  supplies cellular homology/cohomology; ComplexKahlerGeometry K7 owns
  the resulting Riemann-surface Betti/genus comparison. Layer4's Seifert
  surfaces consume these surface normal forms and own their embedded
  band/isotopy data; Layer9 consumes the closed oriented classification
  for Heegaard surfaces. The triangulated polygon models and their finite
  invariant classification remain the cited surface roadmaps' targets.

- **Gluing along a piece of the boundary.** The general operation glues a codimension-0
  submanifold-with-corners `A ⊆ ∂M` to one `B ⊆ ∂N` along a diffeomorphism `f : A ≃ₘ B`,
  producing `M ∪_f N` with corners along `∂A`, using prescribed compatible
  collar data on the faces. Package `FaceCollar A M` with its collar embedding
  and compatibility with the corner product charts from DG5.5. Full-boundary gluing uses `glueAlongCollars` below
  for `A = ∂M`, `B = ∂N`; **handle attachment** is `N` a handle `Dᵏ × Dⁿ⁻ᵏ` glued along
  `Sᵏ⁻¹ × Dⁿ⁻ᵏ ⊆ ∂N`; and partial gluings (a rectangle onto a disc along two of its edges,
  say) are the same def with `A`, `B` proper faces. Set this up for arbitrary manifolds, not
  only handles, because everything downstream (surgery, handlebodies, cobordism
  composition) is a special case of it.
  Handle attachment takes the boundary collar of M, restricts it to the
  attaching face, and uses the handle's standard product collar on the other side.
  Define full-boundary `glueAlongCollars` with two `BoundaryCollar` values as explicit
  data. Construct the smooth structure using their signed collar charts,
  and give the chart and inclusion equations on each side of the seam.
  Prove independence of `glueAlongCollars` from the chosen collars up to a diffeomorphism agreeing
  with the piece inclusions away from a smaller collar; keep this comparison
  separate from the smooth structure for the prescribed collars.
- **Tubular neighbourhoods.** Work on finite-dimensional Hausdorff
  second-countable smooth manifolds with boundaryless models. For a smooth
  embedding i:S→M of dimensions s≤m, construct the quotient normal bundle
  `i*TM/TS`, with model fibre `EuclideanSpace ℝ (Fin (m-s))`, its quotient map
  and pullbacks. Consume `SmoothEmbedding.NormalSpace` and `normalClassL`
  fibrewise, and prove that the bundle topology and fibre operations give
  those existing quotient spaces. Pin the total-space topology as the coinduced
  topology of the fibrewise quotient map from the pulled-back tangent total
  space: use native `(i:S→M) *ᵖ TangentSpace J`,
  `Pullback.TotalSpace.topologicalSpace` and `ContMDiffVectorBundle.pullback`,
  whose map into S×TM supplies that topology. Prove local quotient
  trivializations are continuous/open and their fibre topologies agree with
  the existing quotient topology. Choose an auxiliary smooth metric once
  using DifferentialGeometry 12.1 to construct the bundle atlas and its
  `FiberBundle`, `VectorBundle` and `ContMDiffVectorBundle` instances. Prove
  the identity on quotient fibers is smooth between every pair of
  metric-generated bundle atlases, by their smooth complement projections.
  Use the chosen auxiliary-metric atlas for the public instances and export
  these explicit metric-to-metric identity equivalences.

  Construct the complement bundle, quotient equivalence and natural exponential
  domain with only a chosen `RiemannianBundle` and its smoothness; they require
  no compatible distance. State the global metric-dependent tube theorem with that `RiemannianBundle`,
  `IsContMDiffRiemannianBundle J ∞ F`, `[J.Boundaryless]`, and a compatible
  `[EMetricSpace M] [IsRiemannianManifold J M]` as arguments, where J is the
  ambient model with vector space F. Use the extended distance to include
  disconnected manifolds. Construct the orthogonal-complement subbundle and
  its continuous linear equivalence with the quotient bundle. Build smooth
  local projections by the inverse Gram-matrix formula and prove frame
  independence. Restrict the ambient metric to the complement and prove its
  `RiemannianBundle`/`IsContMDiffRiemannianBundle` laws in these charts;
  in particular the fibre squared norm is smooth. Transport complement
  charts to the quotient bundle. Prove
  the quotient atlases obtained from two smooth metrics are compatible:
  transitions are the quotient of the ambient identity, expressed by smooth
  projections between complements, with inverse in the opposite direction.
  Thus the identity on quotient fibres is a smooth bundle isomorphism and
  the quotient smooth structure is independent of the metric. Add a
  metric-free existence corollary using DifferentialGeometry 12.1 and
  native Mathlib `EMetricSpace.ofRiemannianMetric` (with T3 hypotheses) inside
  its proof; the finite-dimensional Hausdorff second-countable manifold is T3.

  State the universal tubular result as a native `Diffeomorph` between the
  actual open normal-radius tube and its open image, retaining the map formula
  and native inverse identities. It includes empty embedded manifolds, whose tube and
  image are both empty. `exists_normalTubeOpenDiffeomorph` supplies this
  interface; transport it through the normal/quotient bundle equivalence
  for the intrinsic quotient tube. A `PartialDiffeomorph` on the whole
  normal total space is a corollary for nonempty embedded manifolds, with
  `[Nonempty S]` explicit, since its inverse is a total function on the
  ambient manifold. Use the open-subset interface for empty cases.

  On the whole orthogonal-complement normal total space define the natural normal exponential
  domain by v∈expDomain(i x), and prove it is open and the normal exponential
  smooth there. Consume the joint tangent-bundle statements
  `isOpen_setOfPred_mem_expDomain` and
  `contMDiffOn_riemannianExp_tangentBundle` by the smooth normal inclusion.
  These global natural-domain targets precede the small-radius tube theorem
  and supply RiemannianGeometry's focal-point calculus.

  For every positive injective Euclidean tube of a closed-image C² embedding,
  export `exists_c1EuclideanTubeOpenDiffeomorph` between the actual open tube
  and `Metric.thickening ε (range i)`, with its C¹ inverse; include the smooth
  version for smooth embeddings. These open-subset results also cover empty
  source and thickening. The corresponding whole-space `PartialDiffeomorph`
  forms carry explicit nonempty-source hypotheses and are derived corollaries.

  In Euclidean ambient space use the general `orthogonalNormal` bundle
  with Mathlib's flat metric as the canonical smooth carrier. The quotient
  equivalence sends the class of v to its orthogonal projection. Under
  `NormedSpace.fromTangentSpace (i x)`, prove its fibre submodule maps to
  native `normalSubspace I i x`. Construct the corresponding total-space
  homeomorphism to `TotalSpace V (normalSubspace I i ·)`, with its actual
  projection/fibre formulas and continuous inverse; use it to transport the
  existing topological tube results. No second Euclidean smooth atlas is chosen.
  Own `smoothEmbeddingOfLE`: for m≤n lower the native embedding's
  `ContMDiff` regularity, retaining the same function and embedding/immersion
  data; prove its coercion equality and identity/composition laws.
  Define this same `orthogonalNormal` family and its bundle instances for
  positive C^n embeddings, with source/ambient C^n manifolds and a C^(n−1)
  metric; the normal bundle regularity is C^(n−1) (∞−1=∞). Keep the native
  tangent bundle's C¹ ambient prerequisite explicit. Include regularity-lowering
  comparisons, preserving the underlying fibre/topology and identifying the
  smooth atlas restricted to C¹ with the C¹ atlas of the C² embedding `smoothEmbeddingOfLE f (by simp)`.
  For finite C² regularity use native `exists_contMDiffOn_normalFrame` with
  n=1 (C² source and embedding), plus native
  `contMDiff_normalSubspace_starProjection` and
  `contMDiffAt_normalSubspace_starProjection`; for
  smooth regularity consume its n=∞ specialization through the flat instance.
  The codimension model stays `EuclideanSpace ℝ (Fin (m-s))`.

  Define the general orthogonal normal bundle as the orthogonal complement
  of `i.tangentRange x` in `TangentSpace J (i x)` and its radius tube as the
  subset of its total space with `‖v‖ < δ(x)`. The Euclidean constant-radius
  set is `normalTube I i ε ⊆ S × V`. Restrict
  `TauCeti.Manifold.riemannianExp` to the general normal bundle on its natural
  open domain constructed above. Consume `mfderiv_riemannianExp_zero`
  and `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`, with the smooth Riemannian
  instances above. Prove the derivative on the zero section is the direct-sum
  tangent/normal isomorphism, hence the restriction is a local diffeomorphism
  near that section.

  Build the injectivity-radius argument of Lee, Theorem 5.25, equations
  (5.21)–(5.24). For x∈S let V_r(x) consist of normal vectors based at x′
  with d_g(i x,i x′)<r and ‖v′‖<r, and let Δ(x) be the supremum of
  admissible radii r≤1 for which V_r(x) lies in the natural normal-exponential
  domain and the restriction is a diffeomorphism onto an open set.
  Prove Δ>0, injectivity on V_Δ(x)(x), and |Δ(x)−Δ(x′)|≤d_g(i x,i x′)
  whenever this extended distance is finite; this proves continuity on S.
  Consume `TauCeti.Manifold.edist_riemannianExp_le` (and its metric form
  `dist_riemannianExp_le`) to show equal exponential images have base distance
  at most ‖v‖+‖v′‖. With δ=Δ/2, both vectors then lie in one injectivity
  neighbourhood. Prove the radius tube is open and its image U is open,
  package the restriction as a diffeomorphism onto U, and prove compact S
  admits a positive uniform radius by the minimum of δ. Choose a smooth
  positive radius below δ using Mathlib's
  `exists_contMDiffMap_forall_mem_convex_of_local_const` with
  t(x)=`Set.Ioo 0 (δ x)`. Its T2 and sigma-compact hypotheses follow from
  the embedding into Hausdorff M and second-countability plus local
  compactness of S. Prove radial
  fibre rescaling identifies the whole normal bundle with a neighbourhood.
  Own the general-bundle smooth radial rescaling, normalized at the zero
  section: in each fibre put
  r_δ(v)=δ(x)•v/√(δ(x)²+‖v‖²), with inverse
  r_δ⁻¹(w)=δ(x)•w/√(δ(x)²−‖w‖²) on ‖w‖<δ(x).
  Prove the two inverse equations, positivity of their denominators and
  joint smoothness in bundle charts for the smooth positive δ. Its vertical
  derivative at0 is id. The uncompressed normal-exponential restriction
  also has normal-class derivative id; its composite with this normalized
  rescaling therefore has that same derivative on the whole normal bundle.
  In each case state the actual map: inclusion into the total tangent space,
  its derivative at the zero section and `normalClassL` compose to id on
  the quotient normal fibre. Compare with WholeBundle's Euclidean
  topological compression δ(x)•v/√(1+‖v‖²), whose vertical derivative is
  δ(x)•id; that compression supplies neither this normalization nor a
  general-ambient smooth theorem. Prove
  restriction along ambient open inclusions and naturality under ambient
  diffeomorphisms with transported metrics. The normal-exponential route is
  Lee, [*Introduction to Riemannian Manifolds*, 2nd ed.](https://sites.math.washington.edu/~lee/Books/RM/),
  Theorem 5.25, [extract](references/lee-riemannian-tubular.md).
  The Euclidean route is Hirsch GTM 33, Theorem 6.3,
  [extract](references/hirsch-tubular-neighbourhood.md); Lee GTM 218,
  Theorem 6.24, [extract](references/lee-smooth-tubular.md).

  For compact Euclidean S consume the C² uniform-radius open embedding
  `exists_isOpenEmbedding_normalTube` with `[I.Boundaryless]`. Own
  `euclideanChartSquaredDistanceHessian` for finite-dimensional C² chart
  maps g:E→V: at u and n⊥im Dg_u the actual second derivative of
  z↦‖g(z)−(g(u)+n)‖² is
  2⟨Dg_u h,Dg_u k⟩−2⟨n,D²g_u(h,k)⟩. Own
  `euclideanChartNormalDerivativePairing`: for a C¹ normal field η,
  ⟨Dη_u h,Dg_u k⟩=−⟨η(u),D²g_u(h,k)⟩, by differentiating
  its orthogonality equation. Project D²g to the normal fibre to define B;
  with the source metric pulled back by Dg, define the self-adjoint A_n by
  ⟨A_n h,k⟩=⟨B(h,k),n⟩. Prove chart/normal-frame independence and
  the tube derivative's tangent block I−A_n and normal-connection block.
  This is the single C² chart proof; RiemannianGeometry R6 consumes and
  compares these formulas with its intrinsic B/S Hessian geometry.

  Own the generic squared-distance supplier on this same finite-C² normal
  carrier, before its Riemannian/complex consumers. For a Hausdorff
  second-countable boundaryless S with a C² closed embedding i into finite
  Euclidean V, export `euclideanSquaredDistance_isProper`: for every center a,
  x↦‖i(x)−a‖² is a native IsProperMap with compact sublevel sets, is
  nonnegative and is C². Prove properness directly from the closed image,
  a bounded Euclidean ball and finite-dimensional compactness.
  Define the C¹ normal endpoint map Φ(x,v)=i(x)+v on the already constructed
  normal total space. Export `euclideanNormalEndpoint_criticalImage_isNull`,
  for any additive Haar measure on V: its critical image has measure0.
  Use the equal-dimensional chart derivative, native
  `TauCeti.addHaar_image_eq_zero_of_not_surjective_fderivWithin`
  from `TauCeti/Analysis/Calculus/Sard/EqualDimension.lean`, and the countable
  normal chart cover; the base/normal dimensions add to dim V. This requires
  only differentiability of the endpoint chart map and no new general Sard
  theorem. Treat empty source separately and derive the dimension inequality
  from tangent injectivity at a source point in the nonempty case.
  By the direct chart Hessian/normal-derivative block prove the exact equivalence
  between a degenerate critical point of ‖i(x)−a‖² and a critical normal
  endpoint over a. Export `ae_nondegenerateCriticalPoints_euclideanSquaredDistance`
  and density of the good centers, with the actual normal/chart/Haar
  comparisons and dimension0 cases. For smooth i export
  `ae_isMorse_euclideanSquaredDistance` using native TauCeti.IsMorse, whose
  regularity clause is C∞; the C² result states native nondegeneracy at
  every critical point instead. Prove isolated/countable critical points and
  finitely many in each compact band from the C¹ critical equations and
  local inverse theorem. RiemannianGeometry R6 consumes this real
  proper-exhaustion/almost-everywhere supplier and owns its intrinsic
  Jacobi/shape/focal comparison; AffineMorseLefschetz A2 consumes it and
  owns the complex J/Hessian/index identities.

  For every closed-image C² Euclidean embedding i:S→V and every ε>0
  for which (x,v)↦i x+v is injective on `normalTube I i ε`, construct a
  C¹ partial diffeomorphism on the codimension-model normal bundle tube
  onto `Metric.thickening ε (Set.range i)`. For smooth i it is smooth.
  Closedness and finite-dimensional Euclidean properness give distance
  attainment; compact embeddings are a specialization. The image/thickening
  equality holds for every ε>0 before injectivity: a minimizing point has
  normal displacement by first variation. For (x,v) in an injective ε-tube,
  choose t>1 with t‖v‖<ε when v≠0. A closest point to i x+tv also gives
  a tube representation, so injectivity makes x that point. The single
  chart Hessian then gives I−tA_v≥0 and
  I−A_v≥(1−1/t)I>0; v=0 uses the direct-sum derivative. The derivative
  block and inverse function theorem prove local diffeomorphism throughout
  the whole ε-tube, and injectivity gives its C¹ or smooth inverse.
  Export the per-ε chart with actual injectivity as input, not an already
  proved open embedding. Define `nearestPoint` on the open thickening;
  prove its regularity, minimization, uniqueness, zero-section value and
  normal displacement. Pin its inverse as
  y↦(nearestPoint y,y−i(nearestPoint y)), with norm less than ε.
  The general-ambient tube, C² Euclidean Hessian, and compact uniform-radius
  corollary are separate targets; no RiemannianGeometry theorem is an input.
  The straight-line homotopy is a strong deformation retraction onto the
  embedded submanifold. The open normal tube has strict fibre inequality;
  `normalDiscBundle` is the closed inequality, with `DiscSphere` and
  `WholeBundle` supplying the existing topological comparisons and
  `IsTubularNeighborhood` the common predicate. Prove the smooth closed-disc
  and sphere extensions required for surgery. Every noncompact embedded S
  has a positive radius function; no uniform radius is asserted.
- **Formal immersions and the punctured torus.** Own the Smale–Hirsch
  formal-immersion comparison in positive codimension and the Hirsch–Phillips
  equal-dimension version for smooth manifolds with no compact components.
  Formal data are a smooth map and an actual injective tangent-bundle map over
  it. Prove the weak homotopy comparison on the compact-open C∞ carriers,
  including compact parameter families relative to their given parameter boundary.
  For equal dimensions, source-relative extension carries a specified relative
  core/compression or open-handle hypothesis; a formal solution near an arbitrary
  closed subset alone is not sufficient. Build the compression to a positive-
  codimension core, holonomic approximation over its handles and the parametric
  derivative homotopies, following Hirsch, *Differential Topology*, immersion
  chapter, and Phillips' open-manifold submersion theorem.
  Export `puncturedTorusImmersion` on the actual finite product
  T^n=(Fin n→Circle), punctured at the constant1 point, n≥1. Use native Circle's
  Lie manifold and `Circle.exp` derivative, its translation tangent frame and
  the product-model comparison; apply the open formal-immersion theorem to
  obtain an actual smooth immersion into ℝ^n. Include n=1 explicitly.
  Its cover is ℝ^n→T^n by coordinatewise Circle.exp, with period2π in each
  coordinate; pin the bounded-lift/fundamental-domain comparisons used by the
  torus trick. Ordinary PL surgery and Four's embedding deformation consume
  this single immersion; no four-dimensional theorem is an input here.
- **Smooth relative handles, cancellation and surgery.** Own
  `smoothElementaryMorseCobordismHandleComparison`: for a smooth compact band
  with one critical level and regular marked boundaries, construct
  the smooth attaching embedding and a diffeomorphism from the rounded
  index-λ handle cobordism to that band, rel the prescribed regular collars.
  Use M1's actual normalized chart and M2's critical/compact-band data, the
  smooth gradient-like flow on the regular region, and a monotone rounded
  curve in the two normal corner coordinates. Prove compatibility of its
  local smooth charts, smoothing of the corners, and the agreement of both
  maps with the fixed collars. Include simultaneous critical points and
  zero/top index. M2's topological cell comparison is the forgetting map;
  it does not supply this smooth conclusion. Iterate this theorem to obtain
  finite smooth handle decompositions of compact smooth collared cobordisms,
  with actual attaching embeddings, ordered indices, rounded traces and
  diffeomorphisms rel the marked boundary collars, following Milnor's
  *Lectures on the h-cobordism theorem*, the elementary-cobordism construction. Export `smoothHandleCancellation`:
  consecutive index-k and index-(k+1) handles whose attaching/belt spheres meet
  transversely in exactly one point cancel by a diffeomorphism rel the unaffected
  boundary. Retain the embeddings, framings, isotopy and identification of the
  complement. Prove handle slides, creation of a cancelling pair, reordering
  under disjointness and dualization with index k↦d−k in dimension d.
  Own `smoothWhitneyMove` for an actual embedded framed Whitney disk, with
  interior disjoint from the two sheets, removing its specified opposite-sign
  intersection pair by a smooth ambient isotopy supported in that disk's
  neighborhood. Prove existence of such disks for transverse complementary
  sphere sheets of dimensions p,q≥3 in a simply connected (p+q)-manifold,
  using general position and the normal-framing correction. Keep the disk,
  framing and complement hypotheses explicit in lower-dimensional cases.
  Also own the p=2,q≥3 case when the complement of the q-sheet is simply
  connected: choose the Whitney disk in that complement, use general position
  to avoid the two-dimensional sheet, and correct its framing in the spare
  normal direction. The handle-trading argument below owns the slides and
  complement-connectivity verification required to apply this case when d=6.
  No smooth four-dimensional Whitney existence is asserted.

  Export `framedInteriorSphereSurgery`: an actual smooth embedded S^k in the
  interior of an n-manifold with a supplied normal framing determines the
  embedded S^k×D^(n−k), cut-and-paste surgery manifold and smooth trace,
  with actual boundary/complement identifications and inverse surgery data.
  Include finite disjoint families, prescribed collars and stabilization of
  framings. For n≥5 prove representatives of finite sets of π₁ and π₂ classes
  by disjoint embedded circles and 2-spheres via general position; π₂ uses
  a simply connected ambient manifold. Normal trivializations are additional
  input: derive them from specified stable normal trivializations when
  n−k≥3 for k=1,2. Prove the fundamental-group quotient after circle surgery
  and the relative π₂/H₂ effect of 2-sphere surgery, retaining the relevant
  group-ring coefficients and extension of any supplied compatible bundle
  structure. PositiveScalarCurvature P4 owns the choice of normal-1-type
  classes and framings; this item owns their geometric realization.

  Export `smoothHandleIndices_le_dim_sub_three`: for a compact connected
  smooth d-dimensional cobordism W:N→M, d≥6, with nonempty connected marked
  closed boundary faces, M simply connected and inclusion M→W 2-connected,
  construct a finite handle decomposition from N with every index≤d−3,
  and an actual diffeomorphism to W rel the marked boundary collars.
  Express 2-connectivity by the actual π₀/π₁ isomorphisms and π₂ surjection.
  Prove it by turning the cobordism around, eliminating relative indices0,1,2
  using connectivity, handle trading/slides, relative Hurewicz and the smooth
  cancellation geometry, then dualizing. Own the low-index geometric
  realization in this argument with its complement/framing checks; algebraic
  cancellation alone is insufficient. The proof uses no PSC metric.
  [Frenck, §2.2](https://arxiv.org/pdf/1912.08613) supplies the marked
  trace/handle formulation and its 2-connectivity-to-index-range handoff;
  Smale's handle-cancellation proof and Milnor's *Lectures on the h-cobordism
  theorem*, handle trading/cancellation chapters, supply the geometric proof.
- **Connected sum, with the choices explicit.** The definition must *take* the data it
  depends on: an orientation on each summand, an embedding of the closed `n`-ball into
  each inducing opposite boundary orientations, and prescribed complement-side boundary
  collars on the `ballComplement` manifolds just constructed in Layer 1,
  whose new boundaries are the spheres left after deleting the open balls. Construct `M # N` by
  `glueAlongCollars` with these collars. Independence of the balls and collars is a *theorem*, not part of the
  definition, proved from the disc theorem (any two orientation-compatible ball embeddings
  into a connected manifold are ambient isotopic; Palais, *Extending diffeomorphisms*, Proc.
  AMS 11 (1960) 274–277; Hirsch GTM 33, Chapter 4 §6, Theorem 6.6,
  [extract](references/hirsch-disc-theorem.md)). A downstream wrapper then picks the balls on
  a connected oriented manifold, chooses complement-side collars by the collar theorem,
  and inherits well-definedness from the ball and collar comparison theorems.

```lean
-- the boundary is a boundaryless manifold one dimension down: Tau Ceti's
-- `TauCeti.isManifold_boundary` (half-space model); faces of corners come from DifferentialGeometry 5.5
-- gluing along a piece of the boundary (faces A ⊆ ∂M, B ⊆ ∂N); produces corners along ∂A
-- def glue (M N) (A : Face (I.boundary M)) (B : Face (I.boundary N))
--     (f : A ≃ₘ⟮…⟯ B) (cA : FaceCollar A M) (cB : FaceCollar B N) : Manifold …
-- Layer 1 constructs ballComplement e as a manifold with boundary on M \ e(B°),
-- identifies its boundary with e(S^(n-1)), and only then forms its BoundaryCollar.
-- full-boundary specialization with its prescribed smooth collar atlas
-- def glueAlongCollars (M N) (cM : BoundaryCollar M) (cN : BoundaryCollar N)
--     (f : I.boundary M ≃ₘ⟮…⟯ I.boundary N) : Manifold …
-- theorem glueAlongCollars_indep (cM cM' cN cN' …) :
--     glueAlongCollars M N cM cN f ≃ₘ glueAlongCollars M N cM' cN' f
-- handle attachment uses the corresponding face collars in `glue`
-- def attachHandle (M) (cM : BoundaryCollar M) (k)
--     (φ : Embedding (sphere (k-1) ×ₘ ball (n-k)) (I.boundary M)) : Manifold …
--
-- connected sum TAKES the balls and complement-side collars; independence is a theorem
-- def connectedSum (e₁ : Embedding (closedBall n) M) (e₂ : Embedding (closedBall n) N)
--     (c₁ : BoundaryCollar (ballComplement e₁)) (c₂ : BoundaryCollar (ballComplement e₂))
--     (h : OrientationReversing e₁ e₂) : Manifold …
-- theorem connectedSum_indep (e₁ e₁' e₂ e₂' c₁ c₁' c₂ c₂' …) :
--     connectedSum e₁ e₂ c₁ c₂ _ ≃ₘ connectedSum e₁' e₂' c₁' c₂' _
-- the picking wrapper, on connected oriented summands, and its first identity
-- noncomputable def connSum (M N) [Connected M] [Connected N] [Oriented M] [Oriented N] : Manifold …
-- theorem connSum_sphere (M) : connSum M (sphere n) ≃ₘ M
```

**What to build, structure-group track.**
- **The PL pregroupoid, spelled out.** Capitalised `PLPregroupoid`. The underlying predicate
  is *not* "affine on the pieces of a finite triangulation": open subsets of the model are
  non-compact, so the right notion is local and locally finite. A continuous `f : U → model`
  on an open `U` is PL if every point of `U` has a neighbourhood on which `f` is affine on
  each cell of a *locally finite* polyhedral subdivision, equivalently (Rourke–Sanderson,
  *Introduction to PL Topology*, Chapters 1–2) if the graph of `f` near each point is a
  polyhedron. This predicate is what must satisfy Mathlib's `Pregroupoid` laws (locality,
  restriction to opens, closure under composition, identity), and the locally-finite
  formulation is exactly what makes restriction-to-opens and composition hold; a
  finite-pieces formulation fails restriction. Build the predicate for the half-space and
  quadrant models too, so PL manifolds-with-corners are available. Then
  `PLGroupoid := PLPregroupoid.groupoid`, and a PL manifold is `HasGroupoid M PLGroupoid`.
- **The one genuine groupoid inclusion**, `PLGroupoid ≤ continuousGroupoid` (PL maps are
  continuous), giving the forgetful "PL implies Top". ⚠ There is *no* inclusion
  `contDiffGroupoid ≤ PLGroupoid`: a smooth transition map is not literally PL. The relation
  between smooth and PL structures is the Whitehead smoothing comparison in
  comparison item1, built from these chart/corner carriers. It compares actual
  structures and maps, with its induced PL atlas and relative triangulation.
  Comparison item3 constructs the microbundle, CW-type and TOP/PL foundation
  after its stated ordinary PL and geometric prerequisites. FourManifolds
  consumes the specified item-level inputs from that construction.

**Design notes.** Keep orientability a separate predicate, not bundled into the manifold
(the connected-sum API above already depends on this). State gluing in the corners category
from the start, since gluing along a proper face of the boundary *produces* corners along
the seam, so the API must already live there to compose with itself. Define `PLGroupoid` so
that layer 11's link-condition definition of a combinatorial manifold can be *proved
equivalent* to it (the "combinatorial manifold = PL manifold" reconciliation; Rourke–Sanderson,
Chapter 3); this is the concrete sense in which the chart-based and simplicial accounts of
PL topology must agree, and it is why the locally-finite predicate above is the right one, a
triangulation gives exactly locally finite affine pieces.

**Unlocks.** Smoothability of `⋆RP⁴ # ⋆CP²`, `[Kir97, Problem 4.82]` (connected sum plus a
smooth structure on a fake `RP⁴`), and, as infrastructure, every gluing and surgery below.

### Layer 2: locally flat embeddings in general dimension

Topological manifolds have embeddings that are pathological in ways smooth embeddings are
not (wild arcs, the Alexander horned sphere), so the statements in this corner of topology
quantify over *locally flat* embeddings: a topological embedding `f : N → M` is locally
flat if every point of `f(N)` has a chart of `M` in which `f(N)` is a coordinate slice
`ℝⁿ ⊆ ℝᵐ`. lean-eval already carries a usable encoding via partial-homeomorphism model
charts; this layer generalises it to a reusable definition.

**From Mathlib / earlier layers.** `Homeomorph`, `IsEmbedding`, `IsOpenEmbedding`
(`Mathlib/Topology/Maps/Basic.lean`); the chart machinery of `ChartedSpace` and the
topological-manifold structure group `continuousGroupoid` (layer 1).

**What to build.**
- The predicate **`IsLocallyFlat f`** for a topological embedding `f : N → M` of topological
  manifolds (allowing boundary), via "a slice chart `ℝⁿ ⊆ ℝᵐ` exists at every image point".
  The general theory is Daverman–Venema, *Embeddings in Manifolds* (GSM 106).
- **The structural API**, which is most of the work and what every later use depends on.
  Local flatness is a *local* condition (it holds iff it holds near each image point), so the
  load-bearing content is its closure properties:
  - **restriction**: `f` restricted to an open `U ⊆ N`, or corestricted to an open `V ⊆ M`
    containing the image, stays locally flat;
  - **homeomorphism invariance**: `h ∘ f ∘ k` is locally flat for homeomorphisms `h` of the
    codomain and `k` of the domain, and more generally for chart maps and open embeddings on
    either side;
  - **products**: `f × g` is locally flat, since a product of slice charts is a slice chart;
    this is the building block for the product regions below;
  - **composition**: hypotheses under which `N ↪ M` and `M ↪ P` locally flat give `N ↪ P`
    locally flat. ⚠ This is *not* a free consequence of the definition; the two flattening
    charts have to be made compatible, so state it with explicit hypotheses rather than
    assuming it.
  These mirror Mathlib's `IsEmbedding` / `IsOpenEmbedding` closure lemmas, and are the
  reusable surface the rest of the roadmap calls.
- **Codimension-1 collaring** (Brown): a locally flat embedded `(n-1)`-manifold in an
  `n`-manifold is locally bicollared, and a locally flat `(n-1)`-sphere in `Sⁿ` is globally
  bicollared (Brown, *Locally flat imbeddings of topological manifolds*, Ann. of Math. 75
  (1962) 331–341). This is the structural theorem the Annulus Conjecture rests on, and the
  place local flatness does real work: it is false for the wild Alexander horned sphere.
- **Smooth embeddings and locally standard PL embeddings.** Prove local
  flatness of smooth embeddings by the constant-rank slice charts; for neat
  boundary embeddings retain the corresponding half-space pair charts.
  In the PL category construct the forgetful comparison from embeddings
  supplied with PL local standard-pair charts to `IsLocallyFlat`.
  Keep ordinary PL embeddings as their general embedding carrier, with a
  separate local-flatness hypothesis for normal-neighborhood and collar
  theorems. A PL embedding alone supplies no standard-pair chart: the cone
  on a PL trefoil is a PL disc in a PL4-ball whose cone-point complement
  has the trefoil group, unlike the infinite cyclic group of the standard
  locally flat codimension2 pair. Construct this link/complement test and
  the link-pair criterion for the locally standard PL comparison.
- **Generalized Schoenflies.** Own `brownGeneralizedSchoenflies`: for n≥1
  and a specified bicollar of S^(n−1) in S^n, construct homeomorphisms from
  the two closures of the complementary domains to D^n, with their actual
  boundary maps. Prove the separation/components, restriction and marking
  comparisons; any prescribed boundary parametrization extends by the radial
  Alexander map on the ball. Use Brown's cellular collapse argument:
  collapse the two outside pieces to poles, prove those inverse sets cellular,
  and identify each closure as a cell (Brown1960, Theorems0–5,
  [primary paper](https://www.maths.gla.ac.uk/~mpowell/Brown%20Schoenflies.pdf)).
  This proof takes the bicollar as input and uses no annulus theorem. Four's
  early collared-ball recognition consumes the n=4 case.
- **Annulus and stable homeomorphisms.** Prove the annulus theorem from
  the right hypothesis: two *disjoint* locally flat
  `(n-1)`-spheres in `ℝⁿ`, one inside the region bounded by the other, cobound a closed
  region homeomorphic to `Sⁿ⁻¹ × [0,1]`. The input is two spheres; that the region between
  them is a product is the whole content, and is false without local flatness. (The earlier
  draft instead assumed an embedded annulus and concluded an annulus, which is circular.)

```lean
-- def IsLocallyFlat (f : N → M) : Prop := IsEmbedding f ∧ ∀ x, ∃ chart …, IsSlice chart (f x)
-- theorem IsLocallyFlat.restrict … ; theorem IsLocallyFlat.comp_homeomorph … ; theorem IsLocallyFlat.prod …
-- theorem isLocallyFlat_of_smoothEmbedding … : IsLocallyFlat f
-- theorem bicollared_of_locallyFlat_sphere … :  -- Brown: a locally flat Sⁿ⁻¹ ⊆ Sⁿ is bicollared
-- theorem annulus_conjecture (Σ₁ Σ₂ : LocallyFlatSphere (n-1) (ℝ^n)) (h : Σ₂ ⊆ inside Σ₁) :
--     regionBetween Σ₁ Σ₂ ≃ₜ (sphere (n-1) ×ₜ I)
```

**Design notes.** Do not bake a codimension into `IsLocallyFlat`: codimension 0 (open
embeddings, trivially flat), codimension 1 (collaring), and codimension 2 (where knotting
lives) behave differently, and isolating them in one predicate is the point. The annulus target includes its proof. In dimensions1–2 use the ordered-line/Jordan
and compact-surface comparisons; in dimension3 use the relative Moise/smoothing
comparison and the smooth disc/isotopy theorem. For n≥5 own
`stableHomeomorphism_realEuclidean`: every orientation-preserving homeomorphism
of ℝ^n factors into finitely many homeomorphisms that are identity on some
nonempty open set, with an actual open-ball witness for each factor. Prove
the torus-unfurling construction of Kirby1969 using comparison3d.0's ordinary
PL surgery/finite-cover theorem. Own `plEuclideanEndCapping`: a PL n-manifold
end with a given TOP S^(n−1)×ℝ product, n≥5, has a PL product on a smaller
end and can be capped by a marked PL n-ball. For n≥6 use the ordinary PL
end/handle product construction; for n=5 own Wall's Euclidean-fiber bundle/end
argument (Wall, *On bundles over a sphere with fibre Euclidean space*,
Fund.Math.61 (1967),57–72, p.67; Kirby1969, p.575), rather than applying a
compact5-dimensional PL h-cobordism theorem. Apply this to the pulled-back
PL punctured-torus structure, then take the coordinatewise double finite cover
in the homotopy-torus comparison to kill its degree3 mod2 obstruction. Derive
`topologicalAnnulus_highDimension`. Retain the regions and actual product maps,
with one prescribed boundary marking and the induced marking of the other;
compatible two-boundary markings are additional data. The ordinary PL engine
uses none of these TOP annulus results. This order is 3d.0 → this stable/annulus
proof → 3d.1's TOP straightening. Four F3.2 owns the dimension4 Quinn
annulus comparison on its four-dimensional disk/proper-product foundations.
The prescribed ordinary normal microbundle or Marin stable normal-microbundle germ data
are constructed in comparison3b and3e respectively and retained in the transversality inputs.

**Unlocks.** The Annulus Conjecture (Kirby 1969 in dimension `≥ 5`; Quinn 1982 in
dimension 4; no Kirby number): two disjoint nested locally flat spheres cobound a product
region.

### Layer 3: diffeomorphism groups with the C^∞ topology

The Smale conjecture and its 4-dimensional cousin are statements about the *homotopy type*
of the group `Diff(M)` of self-diffeomorphisms. To state them we need `Diff(M)` as a
topological group, with the C^∞ (weak Whitney) topology, for general manifolds. Mathlib has
the `Diffeomorph` type but no group object and no topology on it; lean-eval currently dodges
this with an ad-hoc "relative parameterized" form, which this layer is meant to retire.

**From Mathlib / earlier layers.** `Diffeomorph` (`structure Diffeomorph extends M ≃ M'`,
notation `M ≃ₘ^n⟮I, I'⟯ M'`) in `Mathlib/Geometry/Manifold/Diffeomorph.lean`; bundled
smooth maps `ContMDiffMap` (`Mathlib/Geometry/Manifold/ContMDiffMap.lean`); the
topological-group and uniform-space API from Mathlib's algebra-and-topology libraries;
`HomotopyGroup` (`Mathlib/Topology/Homotopy/HomotopyGroup.lean`) for the conclusions.

**What to build.**
- The **group** `Diff(M) := M ≃ₘ^∞⟮I, I⟯ M` under composition (the `Group` instance is
  routine from the existing `Diffeomorph` composition and inverse).
- The **C^∞ topology**, pinned to one construction to avoid the weak/strong/compact-open
  ambiguity: for `M` compact, give the space of smooth maps `C^∞(M, M)` the *initial topology
  induced by all iterated derivatives read in charts* (the compact case, where weak and strong
  Whitney agree; Hirsch, *Differential Topology* GTM 33, Chapter 2,
  [extract](references/hirsch-smooth-map-topologies.md)), and define `Diff(M)` as a subtype of
  `Diffeomorph`/`ContMDiffMap` with the subspace topology, making it a topological group.
  `Diff(M, ∂M)` is the closed subgroup fixing `∂M` pointwise, for the relative statements.
  (The non-compact case is a separate, later choice; do not bake it in.)
- The **smooth-families map** (note: a map, not an equivalence). A smooth `F : P × M → M`
  that is a diffeomorphism in `M` for each `p` induces a continuous `P → Diff(M)`; this is the
  direction the layer exists to provide (it turns "smooth family", what proofs produce, into
  "map into the group", what homotopy-type statements need). ⚠ The converse is *not* an
  equivalence for arbitrary `P`; state it only as the forward map, with the reverse direction a
  separate target under explicit hypotheses on `P`.
- **Continuous-parameter isotopy extension and disc restriction.** Give
  smooth embeddings of a compact smooth manifold K into int M the subspace
  C∞ topology from smooth maps, with boundary smoothness interpreted by
  local extensions across its boundary charts. For compact boundaryless M
  and an embedding e:K→int M, construct continuous local sections near e
  of res_e:Diff(M)→Emb(K,int M), g↦g∘e, onto its Diff(M)-orbit.
  Require the section at e to be id and the correcting diffeomorphisms to
  be supported in a prescribed neighborhood of e(K). Prove the orbit is
  open and identify res_e as a locally trivial principal bundle with fiber
  {g | g∘e=e}, using the actual composition/inverse operations and topology.
  Construct the sections by extension of small embedding displacements
  through a collar/tubular neighborhood, cutoffs and the inverse function
  theorem; prove their dependence is continuous in every finite derivative
  seminorm. This is a function-space construction, including continuous
  parameter families, rather than only a theorem about individual smooth
  paths. Derive the homotopy lifting property for finite CW parameter pairs:
  an embedding homotopy with an initial lift and compatible prescribed lift
  on the parameter subcomplex admits a continuous relative lift. Construct
  support-relative sections and lifts when the embeddings agree on a
  specified neighborhood of a closed subset of K, retaining that agreement
  on a smaller neighborhood. For boundary ambient manifolds use specified
  collars and the boundary-preserving embedding/diffeomorphism carriers.

  Specialize to a marked smooth e:D³→S³. The restriction bundle is onto
  its actual orbit; the disc theorem and the orientation-component
  comparison identify the required component(s) of Emb(D³,S³).
  Its literal fiber fixes the whole embedded disc, including the smooth
  boundary jets on the complementary closed disc. Construct the parametric
  collar-straightening homotopy comparison with diffeomorphisms of that
  complement fixed on a boundary collar. These are maps of spaces with
  homotopies, not a literal identification of the two fixing conditions.
  Comparison3g consumes these sections, lifts and fiber comparisons in its
  Cerf/Hatcher applications. Use Palais' restriction/isotopy-extension
  construction and Hirsch's compact-source extension proof; prove the
  continuous function-space version on these pinned carriers.
- The reference inclusion `O(n+1) → Diff(Sⁿ)` (consume `Matrix.orthogonalGroup`, layer 7's
  isometry action, and the sphere instance) as a continuous group homomorphism.

```lean
-- instance : Group (Diff I M)
-- instance : TopologicalGroup (Diff I M)   -- the C^∞ topology (initial topology in charts), M compact
-- def ofSmoothFamily (F : P × M → M) (h : ∀ p, IsDiffeo (F p ·)) : C(P, Diff I M) := …  -- forward only
-- theorem smale_conjecture : ∃ h : ContinuousMap.HomotopyEquiv (orthogonalGroup 4 ℝ) (Diff 𝓘 (sphere 3)), h.toFun = orthogonalInclusion
```

**Design notes.** State the Smale conjecture as a homotopy equivalence of the underlying
spaces, not as an isomorphism of homotopy groups, so it is not silently weaker; the
inclusion `O(4) → Diff(S³)` being a homotopy equivalence is the sharp form. For Watanabe's
disproof, the right target is that a specific element of `π_k(Diff(D⁴, ∂))` (a Hatcher–Wagoner
or graph-clasper class) is nonzero, which needs `Diff(M, ∂M)` and its homotopy groups, not
just `π₀`. Keep "compact `M`" and "`M` with boundary, fixing the boundary" as separate
named setups.

**Unlocks.** The Smale conjecture `Diff(S³) ≃ O(4)` (Hatcher), `[Kir97, Problem 4.34]`, and
Watanabe's disproof of the 4-dimensional Smale conjecture, `[Kir97, Problem 4.126]`.

### Layer 4: knot theory, done properly (owned here)

This is a whole subproject. Mathlib supplies `Quandle` as a seed for coloring
arguments; the pinned Tau Ceti dependency already supplies substantial algebraic and
combinatorial knot infrastructure, described below. The remaining work is to connect those finite presentations to embedded links, specify the geometric equivalence relation, and prove the polynomial and minimum-invariant comparison theorems stated here.
The design commitment, shared with the combinatorial Heegaard Floer roadmap, is **no
privileged representation**: a knot is not identified with one presentation. The content is
in the presentation types, maps between them, and the theorems that characterize when two
presentations encode the same geometric knot or link.

**From Mathlib / earlier layers.** `Quandle` (`Mathlib/Algebra/Quandle.lean`) as the seed
for diagram colourings; `PresentedMonoid` (`Mathlib/Algebra/PresentedMonoid/Basic.lean`,
from Hannah Fechtner's braid program) for braid groups; smooth embeddings
(`IsSmoothEmbedding`) and the sphere instance for the geometric presentation; layer 1's
manifolds for complements (handed on to layer 5).

**Existing Tau Ceti knot substrate.** The dependency already has several concrete
presentations and invariant implementations. `PDCode` and `OrientedPDCode` carry crossing
and component data; `PDCode.IsPlanar`, rotation systems and permutation triples support
finite combinatorics; `BasedOrientedGaussCode.toOrientedPDCode` converts code-level Gauss
presentations. `BraidWord.closure` constructs an oriented PD closure, and native braid,
Markov-equivalence and closure results handle specified algebraic moves. `kauffmanBracket`,
`normalizedKauffmanBracket`, and `jonesPolynomial` provide the bracket/Jones state sum and
code-level Reidemeister invariance. Matrix-level Alexander polynomials, PD/Fox modules,
Burau comparisons, algebraic Seifert-matrix S-equivalence, matrix signatures and
Tristram–Levine/Alexander-root criteria are also implemented. `SmoothLinkEmbedding` and
its isotopy relations provide a geometric carrier; `KnotGroup` uses the complement
fundamental group; slice predicates, a Freedman theorem proposition, and grid-homology
structures are present. Use existing declarations only at their stated types and hypotheses; the adapters below specify the geometric comparisons.

These APIs are real existing work, but their scopes stay bounded by their types and
hypotheses. Code Reidemeister equivalence is not the geometric theorem that ambient isotopy
is generated by Reidemeister moves, and the PD relation does not by itself carry the
source's plane outer face or a realized projection. Braid-word/closure theorems do not
supply Alexander's closed-braid theorem, geometric Markov completeness, or minimum braid
index. Matrix Alexander and S-equivalence lemmas do not prove existence or classification
of geometric Seifert surfaces, or compare every source Fox matrix with a Seifert form.
Fixed-colour Jimbo trace specializations do not construct the full two-variable HOMFLY or
Kauffman `F` and absolute `Q` invariants. The complement-group carrier is not a Wirtinger
presentation theorem. Each bridge below is a target, and an existing implementation is reused only where its
statement and hypotheses match.

**Owners and interfaces.** The geometric unframed link carrier has `n` components for `n : ℕ`; a knot is the one-component case, and a framing is additional normal-bundle data. Layer 4 owns knot and link presentations, realization maps,
geometric/combinatorial equivalence theorems, diagram and braid minima, and knot/link
invariants. It consumes Layer 1's compact-surface, embedding, isotopy and smoothing
foundations; AlgebraicTopology's van Kampen theorem and fundamental-group maps; and
TangentialBordism B3.2's finite quadratic-Arf interface. Layer 6 consumes the geometric
Seifert/Alexander and signature interfaces. Layer 7 consumes a realized link complement and
owns finite-volume hyperbolic structures and certified volume calculation. These edges are
one-way; Layer 4 does not depend on later layers.

**What to build.**
- **The presentations and their orientation/framing decorations** (Lickorish,
  *An Introduction to Knot Theory*, GTM 175, is the spine throughout this layer; per-topic
  extracts are in [references/](references/)). Per the encoding conventions there is **no
  umbrella `Knot` type**: the presentations are first-class types. For each `n : ℕ`, the
  geometric link carrier is a finite family of `n` smooth embeddings of the standard circle
  into a general manifold `M`, with pairwise-disjoint ranges; the knot carrier is the `n = 1`
  case. The unframed carrier does not include a normal framing: treat a chosen framing as
  separate normal-bundle data, with forgetful maps. The combinatorial presentations are PL
  polylines, braid closures (over `PresentedMonoid` braid groups with the Artin relations),
  and link diagrams encoded by finite plane maps or by PD/Gauss data equipped with witnesses
  that make them realizable in the plane. Each is a `Type`, with realization and forgetful
  maps between them (a braid word closes to a diagram; a diagram realizes to a PL link).
  A realizable diagram has a finite plane map, cyclic order of half-edges at each crossing,
  over/under data, crossing signs and a distinguished outer face; crossing-free circles and
  disconnected link components are included. Build the plane realization, lift edges to
  polygonal arcs in `ℝ³`, and insert the prescribed local crossing model. Prove projection
  recovers the code up to orientation-preserving plane isotopy and that outer-face data
  transport under mirror and component-orientation reversal. Conversely extract the data
  from a generic projection using a point at infinity away from the projection. An algebraic
  Gauss-to-PD conversion alone does not prove planarity: prove the supplied rotation/outer-face
  realization witnesses satisfy the planarity predicate. Both realization directions preserve
  components and any specified component orientations or framing. Prove that permuting the `Fin n`
  labels commutes with realization and preserves the resulting geometric link; every link invariant
  and minimum below must be invariant under this reindexing.
- **Equivalence in each presentation and the correspondences between them.** Each presentation has its own equivalence: ambient isotopy for the
  geometric presentation (the general `Isotopic` of the encoding conventions, specialised to
  smooth embeddings `S¹ ↪ M`, so isotopy is defined once for arbitrary maps and reused),
  Reidemeister moves (diagrams), Markov moves (braids), stellar moves (polylines), grid moves
  (grids, from the combinatorial Heegaard Floer roadmap). The correspondences split into two
  regimes of very different difficulty:
  - **Combinatorial correspondences.** Prove the diagram/PD/Gauss conversions, braid
    closure and Markov equivalence, and grid-to-diagram correspondence consumed by the
    combinatorial Heegaard Floer roadmap, with explicit orientation and framing maps.
  - **Geometric to combinatorial.** Prove every tame link admits a generic projection and
    every ambient isotopy induces a finite sequence of Reidemeister moves by a relative
    one-parameter general-position argument, including endpoint and component-orientation
    data. Conversely prove each Reidemeister move is realized by an ambient isotopy.
  - **Correspondence graph.** Use diagrams as the hub, with proved edges from geometric
    embeddings, PL embeddings and braid closures, and the grid-to-diagram edge consumed by
    the combinatorial Heegaard Floer roadmap. State and prove the specific maps each invariant
    uses; do not infer an unproved edge from a chain of presentation names.
- **Diagram-independent minima.** For a geometric link `L`, define crossing number as the
  minimum crossing count over all realizable diagrams of all links ambient-isotopic to `L`;
  include all component relabelings. For a knot `K` only, define unknotting number `u(K)` as
  the minimum number of crossing changes over all diagrams of all knots ambient-isotopic to
  `K` needed to obtain a diagram of the unknot. Define bridge number as the minimum number
  of local maxima over all pairs consisting of a representative in the ambient-isotopy class
  of `K` and a generic height direction for that representative. For a nonempty oriented link, define braid index as the
  minimum strand count over all closed braids, with all braid axes allowed, whose oriented
  closures are ambient-isotopic to the given oriented link; the closure joins the `i`th top
  endpoint to the `i`th bottom endpoint. Prove nonemptiness, attainment in `ℕ`, independence
  of `Fin n` labels, and ambient-isotopy invariance. Prove `u(K # J) ≤ u(K)+u(J)`, give an
  infinite family of unknotting-number-one knots distinguished by their Alexander
  polynomials, and prove the source statements that only the unknot has bridge number one,
  `br(K # J)=br(K)+br(J)−1`, braid index is subadditive under connected sum, and every
  2-bridge knot is prime. Give constructions for upper bounds and geometric lower-bound
  arguments; minimizing one chosen code, height direction, or braid axis is insufficient.
- **Seifert surfaces and the integral/Arf dictionary.** For an oriented
  geometric link in oriented S³ construct an actual compact connected
  embedded oriented Seifert surface with its marked boundary and positive
  normal push-off. Export `seifertMatrix` on a chosen integral H₁ basis,
  V_ij=lk(x_i,x_j^+), its coordinate-change and stabilization laws, and
  Vᵀ−V=J, where J_ij=x_i·x_j uses the ordered tangent pair (x_i,x_j)
  and the surface orientation. Choose the positive normal so that this
  oriented tangent pair followed by the normal gives the ambient orientation.
  Prove the signed sweep identity
  α·β=lk(β,α^+)−lk(β,α^-)=lk(β,α^+)−lk(α,β^+).
  Derive it by the oriented annulus swept from α^- to α^+ and the local
  crossing number; pin a positive symplectic pair by a·b=+1 and
  V_ba−V_ab=+1. Compare any alternative push-first convention by transpose
  before using its integral intersection or cup-product formula. Prove the
  geometric and diagram Seifert algorithms agree through the presentation
  correspondences. The mod2 polar form and Arf tests use the reduction of
  this signed dictionary, alongside the integral symplectic-pair check.

  Construct the disc-band surface from each oriented diagram and prove its boundary is the
realized link with prescribed orientation; compare moves by explicit isotopy/stabilization.
Identify the geometric linking-number matrix's presentation-independent S-equivalence class
with the algebraic matrix API. Fix the one-variable coefficient ring `R=ℤ[T,T⁻¹]` and the meridian homomorphism
`π₁(S³ \ L) → ℤ` sending each positively oriented meridian to `1`. For each nonempty
oriented link, define its classical Alexander module as `H₁(X∞;ℤ)` for the associated infinite
cyclic cover. Build the Wirtinger presentation with one meridian generator per diagram arc and
one relation per crossing, apply Fox derivatives, and abelianize by sending each meridian to
`T`. Specify basepoint changes, meridian reversal (`T ↦ T⁻¹`), and Laurent-unit ambiguity.

  For an oriented PD-code with `N` crossings and `c` crossing-free components, form the
  half-edge/crossing-free-component relation module and all its Fitting ideals `E_k`. The
  pinned PD presentation has `4N+c` generators and `E_k` is generated by the minors of size
  `4N+c−k` of its relation vectors. Prove the comparison with the classical Alexander module
  explicitly: the PD arc module is the classical module together with its free
  constant-generator summand, hence `E₀=0` and `E_k = Fitt_{k−1}(H₁(X∞;ℤ))` for `k≥1`.
  For knots `E₁=(Δ_K)`; normalize `Δ_K` by the symmetric Conway convention and `Δ_K(1)=1`.
  For links, retain the full `E_k` family and record zero ideals explicitly (in particular,
  crossing-free `c`-component diagrams have `E_k=0` for `k<c` and `E_k=R` for `k≥c`).
  Define `ord_L` as the gcd of generators of `Fitt₀(H₁(X∞;ℤ))`, up to `±T^j`, with
  `ord_L=0` when this ideal is zero. For the Conway specialization
  `Δ_L(T)=P_L(1,−1,T^(1/2)−T^(−1/2))`, prove
  `ord_L ≍ Δ_L(T)` up to units `±T^(j/2)`, and prove the
  divisibility/conversion. Do not infer a determinant from a nonprincipal or zero ideal. For an
  oriented Seifert surface with `μ≥1` boundary
  components, use a basis of rank `2g+μ−1` and the matrix `TV−Vᵀ` to present the same
  Alexander module; compare its Fitting ideals with the Fox ideals. The square determinant
  formula is the knot case: if `μ=1`, `V` has size `2g` and
  `Δ_K(T)=T^(−g) det(TV−Vᵀ)` with the fixed symmetric Conway normalization.

  For the braid route, use a `MarkovBraid β` on `n=predStrands(β)+1≥1` strands and its standard
  closure joining the `i`th top endpoint to the `i`th bottom endpoint. The closure has as many
  components as the number of orbits of the underlying strand permutation. The native
  unreduced Burau matrix `ρ_n(β)` gives the corner-minor invariant
  `det(((ρ_n(β)−I) restricted by deleting the last row and last column))`; the `1×1` case
  has the empty determinant `1`. For a closure with `μ` components, prove this scalar is
  associated to the gcd of the generators of `Fitt₀(H₁(X∞;ℤ))`, equivalently the gcd of the
  `E₁` generators in the PD presentation above; it is zero when that ideal is zero. Thus it
  agrees with `ord_L` as defined above, and with the Conway-normalized one-variable link
  polynomial through `ord_L ≍ Δ_L(T)`. Do not claim the scalar generates a
  potentially nonprincipal Fitting ideal. Prove the stated unit ambiguity: conjugation leaves
  the corner minor unchanged, positive stabilization multiplies it by `−T`, and negative
  stabilization by `−1`. State a separate comparison if rewriting the formula in reduced-Burau
  conventions; do not silently substitute a different determinant or strand factor. This is
  the closed-braid route for all component counts, not a claim that Markov completeness is
  already proved.
  Define the mod2 quadratic refinement q(x)=lk(x,x^+) mod2 on H₁(surface;F2)
  and prove q(x+y)=q(x)+q(y)+x·y. Consume TangentialBordism B3.2's early
  `finiteQuadraticArf` constructor, basis independence, orthogonal-sum and
  metabolic criterion, independently of its surface-bordism classification.
  For a knot the polar form is nonsingular. For a proper link (each component
  has even total linking with the others), prove q vanishes on the boundary
  radical and use its nonsingular quotient. Export `knotArfInvariant` and
  `properLinkArfInvariant`, independence of surface/basis, isotopy,
  connected/band-sum and mirror/orientation comparisons. Pin the unknot to0
  and a trefoil to1. For knots, prove Alexander agrees with
  `T^(−g) det(TV−Vᵀ)`, up to the unit fixed by the symmetric Conway normalization, and prove
  the determinant-at−1 mod8 Arf
  criterion; export `alexanderOne_arf_eq_zero`. Four F1/F3/F4 consumes this
  geometric dictionary, and Layer6 consumes the Alexander-one corollary.
- **Slice-ness, stated cleanly** on a presentation `K` (by default a smooth embedding
  `S¹ ↪ S³`). `IsSmoothlySlice K` (`K` bounds a smoothly embedded disc in `D⁴`) and
  `IsTopologicallySlice K` (a *locally flat* disc, consuming layer 2 and the topological
  4-manifold input of layer 6); the slice genus `g_s(K)` and the topological slice genus.
  These replace the lean-eval monstrosities with one-line definitions.
- **Knot polynomials and their normalizations.** The geometric link carrier includes the empty
  link, but the polynomial invariants in this subsection are defined on nonempty links and
  diagrams (`n≥1`); an empty-link value is not implicit. Construct the Conway-normalized
  Alexander and Jones invariants, oriented HOMFLY, Kauffman bracket, and Kauffman's two-variable
  `F` and absolute `Q` on that domain. For HOMFLY, grade the Laurent variables by
  `deg(x)=deg(y)=deg(z)=1` and take `P_L` in the degree-zero subring `R₀` of
  `ℤ[x^{±1},y^{±1},z^{±1}]`, with
  `x P(L₊)+y P(L₋)+z P(L₀)=0` and `P(unknot)=1`. For each `n ≥ 1`, set
  `P(unlink_n)=(-(x+y)/z)^(n−1)`. For nonempty links `L,J`, prove the split-union law
  `P(L ⊔ J)=(-(x+y)/z)P(L)P(J)`; state connected-sum multiplicativity for knots. Do not
  extrapolate the unlink exponent to `n=0` or assert normalized split-union laws with an
  empty factor without separately specifying an empty-link convention. Prove uniqueness and
  existence by terminating skein resolution on the nonempty-link domain, plus Reidemeister
  invariance and the mirror/component-orientation laws below. Prove the specializations
  `Δ_L(t)=P_L(1,−1,t^(1/2)−t^(−1/2))` and
  `V_L(t)=P_L(t,−t^(−1),t^(1/2)−t^(−1/2))`. Set `t=s²`. Because `s−s⁻¹` is not a unit
  in `ℤ[s,s⁻¹]`, first define these substitutions from `R₀` into the rational function field
  `ℚ(s)` (native `RatFunc ℚ`), where the required nonzero denominators are invertible. Prove the invariant images
  lie in the embedded Laurent subring `ℤ[s,s⁻¹]` and define their Laurent-valued versions
  there. Evaluations at `s=±1` use those Laurent extensions, not a map sending an invertible
  z to zero. Use this same half-Laurent coefficient extension in the Fox/Seifert comparisons. The source's two-variable convention is `ρ_L(l,m)=P_L(l,l⁻¹,m)`;
  substitution identifies `R₀` with the subring of `ℤ[l^{±1},m^{±1}]` spanned by monomials
  `l^r m^s` with `r ≡ s (mod 2)`, with inverse
  `l^r m^s ↦ x^((r−s)/2)y^((-r−s)/2)z^s`.

  On nonempty unoriented diagrams, define the Kauffman regular-isotopy polynomial `Λ` in
  `ℤ[a^{±1},x^{±1}]` by `Λ(unknot)=1`,
  `Λ(L₊)+Λ(L₋)=x(Λ(L₀)+Λ(L∞))`. Pin the curl factors by the local writhe change:
  a curl of sign +1 multiplies Λ by a, and one of sign −1 multiplies it by a⁻¹.
  Use the convention table’s crossing sign for these local models. Set `F_D(a,x)=a^(−w(D))Λ_|D|(a,x)`
  in `ℤ[a^{±1},x^{±1}]` for an oriented diagram `D`, and `Q_D(x)=F_D(1,x)` in
  `ℤ[x^{±1}]`. Prove the curl correction, skein construction and uniqueness, ambient
  invariance of `F`, and the evaluation map defining `Q`; pin crossing signs and writhe
  changes. Prove uniqueness and construction on nonempty diagrams. Reversing all component
  orientations preserves writhe and `F`. If a subset `S`
  of components is reversed and `Δw=w(D^S)−w(D)`, prove
  `F_{D^S}=a^(−Δw)F_D`; hence `Q` is independent of component-orientation choices. State
  any normalized unlink or split-union formula for `F` or `Q` only for nonempty links and
  nonempty factors, unless an empty-link convention is separately defined.

  For HOMFLY distinguish mirror from changing component orientations: prove
  `P_mirror(L)(x,y,z)=P_L(y,x,z)` (equivalently
  `ρ_mirror(L)(l,m)=ρ_L(l⁻¹,m)`), while simultaneous reversal of all component orientations
  leaves `P` unchanged. Derive chirality tests by comparing values with the mirror transform;
  reversing a knot's orientation is not itself the chirality test. Prove route agreements:
  Alexander via Seifert matrix, Conway skein and Burau; Jones via bracket and
  braid/Temperley–Lieb trace; HOMFLY via braid trace and diagram skein. Construct `F` and
  `Q` by their own skein theory and prove their separation examples.

  Make small-knot tests executable from explicit code, not names alone. Supply oriented PD
  or Gauss/rotation-system codes for `0₁`, `3₁`, `4₁`, and `7₁`, `7₃`, `7₅`, `7₇`, with
  proofs that each realizes its named knot. Compute the HOMFLY formulas on pp. 83–84 and
  their listed Jones and Alexander specializations, using p. 84's typeset values to settle
  overwritten p. 83 entries. Compute the p. 112 separations
  `P(8₈)=P(10₁₂₉)` with `Q(8₈)≠Q(10₁₂₉)`, and
  `F(11₂₅₅)=F(11₂₅₇)` while `P`, `∇`, and `Δ` differ. Include oriented code data,
  coefficient rings, substitutions, and unknot/unlink normalization checks for each example.
  The regression table includes the exact outputs below (with variables in the stated
  convention): `P₇₁=(−4l⁻⁶−3l⁻⁸)+(10l⁻⁶+4l⁻⁸)m²+(−6l⁻⁶−l⁻⁸)m⁴+l⁻⁶m⁶`;
  `P₇₃=(l⁴−2l⁶−2l⁸)+(−3l⁴+3l⁶+l⁸)m²+(l⁴−l⁶)m⁴`;
  `P₇₅=(2l⁻⁴−l⁻⁸)+(−3l⁻⁴+2l⁻⁶+l⁻⁸)m²+(l⁻⁴−l⁻⁶)m⁴`;
  `P₇₇=(2+2l²+l⁴)+(−l⁻²−2−2l²)m²+m⁴`. The Jones outputs are, in order,
  `−t⁻¹⁰+t⁻⁹−t⁻⁸+t⁻⁷−t⁻⁶+t⁻⁵+t⁻³`,
  `t²−t³+2t⁴−2t⁵+3t⁶−2t⁷+t⁸−t⁹`,
  `−t⁻⁹+2t⁻⁸−3t⁻⁷+3t⁻⁶−3t⁻⁵+3t⁻⁴−t⁻³+t⁻²`, and
  `4−t⁻³+3t⁻²−3t⁻¹−4t+3t²−2t³+t⁴`. The Alexander outputs are
  `t⁻³−t⁻²+t⁻¹−1+t−t²+t³`,
  `2t⁻²−3t⁻¹+3−3t+2t²`,
  `2t⁻²−4t⁻¹+5−4t+2t²`, and
  `t⁻²−5t⁻¹+9−5t+t²`. Prove these outputs from the codes and derive the source's
  chirality conclusion from the correct mirror/orientation transformation laws, not from
  the knot labels.
```lean
-- no umbrella `Knot` type (see Encoding conventions); presentations are first-class types
-- def SmoothLink (M) : Type := { f : C^∞(circle, M) // IsEmbedding f }   -- geometric presentation, general M
-- def Diagram : Type := …                                                -- a combinatorial presentation
-- def forgetFraming : FramedDiagram → Diagram                            -- carry framing/orientation as data
-- def closes : BraidWord n → Diagram                                     -- a combinatorial-to-combinatorial edge
-- isotopy is the general `Isotopic` (Encoding conventions); knot equivalence is its specialisation:
-- theorem reidemeister (D D' : Diagram) : D ≈ D' ↔ Isotopic (realize D) (realize D')   -- the hard edge
-- def IsTopologicallySlice (f : SmoothLink (sphere 3)) : Prop := ∃ d : LocallyFlatDisc D⁴, boundary d = f
-- def alexanderOfDiagram (D : Diagram) : LaurentPolynomial ℤ := …        -- Conway-normalised, on this presentation
-- theorem alexander_eq_burau (β : BraidWord n) : alexanderOfDiagram (closes β) = burauAlexander β  -- routes agree
-- theorem freedman_alexanderOne_slice (f) (h : alexanderOfDiagram (diagramOf f) = 1) :
--     IsTopologicallySlice f                                             -- needs layer 6
```

**Convention table (pin before stating anything).** Every theorem below silently depends on
these; fix them once.

| item | convention |
| --- | --- |
| ambient space | standard orientation on `ℝ³` / `S³` |
| component orientation | each oriented component uses its standard circle orientation; forget it for an unoriented link |
| crossing sign | a right-handed crossing counts `+1` |
| mirror, reversal | ambient reflection is the mirror and negates every crossing; reversing component orientations is a separate operation |
| framing | the Seifert (`0`-) framing is the canonical longitude; the blackboard framing equals the writhe |
| Alexander | Conway-normalised: `Δ_K(t) = Δ_K(t⁻¹)`, `Δ_unknot = 1`; right-handed trefoil `Δ = t − 1 + t⁻¹` |
| Jones | via the Kauffman bracket with `t = A⁻⁴` and `V_unknot = 1`; fix the trefoil value from Lickorish, [references/lickorish-jones.md](references/lickorish-jones.md) |

**Design notes.** Keep "smoothly slice" and "topologically slice" rigorously separate; the
gap between them is the entire point of `[Kir97, 1.41]` and `[Kir97, 1.36]`. Coordinate the
braid-group and diagram-calculus work with the combinatorial Heegaard Floer roadmap's Lane K
(which adds the grid-diagram presentation and Cromwell's theorem) rather than duplicating it;
that roadmap's `τ` is a consumer of these presentations.

**Unlocks.** `0`-shake genus vs slice genus, `[Kir97, Problem 1.41]` (Piccirillo, via the
Conway knot, jointly with the combinatorial Heegaard Floer roadmap's `τ`);
Alexander-polynomial-one knots are topologically slice, `[Kir97, Problem 1.36]` (Freedman).

### Layer 5: Dehn surgery

Surgery cuts out a tubular neighbourhood of a knot and reglues a solid torus by a boundary
diffeomorphism; the gluing class is the *slope*. This is the central construction of
3-manifold topology and the source of most of the Property-P-family Kirby problems. It is a
direct application of layer 1's gluing to layer 4's knots, plus the slope bookkeeping.

**From Mathlib / earlier layers.** Layer 1's manifold-with-boundary, tubular
neighbourhoods, and boundary-gluing; layer 4's knots and links; the torus as a manifold and
`H₁` of the boundary torus for slopes; layer 1's connected sum for the surgery-description
calculus.

**What to build.**
- **The complement** of a knot or link as a compact manifold-with-boundary: delete an open
  tubular neighbourhood (layer 1), with the boundary a torus per component. This is the
  layer-4-to-layer-5 handoff that lean-eval lacks. (Rolfsen, *Knots and Links*, Chapter 9,
  is the reference for the surgery picture throughout this layer,
  [extract](references/rolfsen-dehn-surgery.md).)
- **Slopes**, with the primitive pinned to avoid the "all of the above" trap. Take a slope
  on a boundary torus `T` to be a **primitive class in `H₁(T; ℤ)` modulo sign** (an unoriented
  essential simple closed curve); separately give a `FramedBoundaryTorus` an ordered basis
  `(μ, λ)` (meridian, Seifert longitude) and the resulting bijection `Slope T ≃ ℚ ∪ {∞}`.
  State the convention explicitly: `p/q` denotes the class `p·μ + q·λ`, and Dehn filling sends
  the filling solid torus's meridian to that class. Keep `Slope` (basis-free) and the `ℚ∪{∞}`
  parametrisation (basis-dependent) as distinct so theorems can be stated either way.
- **Dehn filling / surgery**: glue a solid torus to the complement sending its meridian to
  a chosen slope (layer 1's gluing); `n`-surgery, rational surgery, and surgery on framed
  links. General-dimension surgery on a framed embedded `Sᵏ` (cut `Sᵏ × Dⁿ⁻ᵏ`, glue
  `Dᵏ⁺¹ × Sⁿ⁻ᵏ⁻¹`) specialises to the 3-dimensional case.
- **The convention-fixing identities**: surgery on the unknot recovers known manifolds (see
  the acceptance criteria), pinning the meridian-longitude and slope conventions.

```lean
-- def complement (L : SmoothLink (sphere 3)) : Manifold …   -- compact, one torus boundary per component
-- def Slope (T : BoundaryTorus) : Type := { c : H1 T ℤ // IsPrimitive c } ⧸ sign  -- basis-free
-- def slopeEquiv (T : FramedBoundaryTorus) : Slope T.toTorus ≃ (ℚ ∪ {∞})  -- p/q ↦ p·μ + q·λ
-- def dehnFilling (M : Manifold …) (s : Slope …) : Manifold …            -- filling meridian ↦ s
-- theorem surgery_unknot_zero : dehnFilling (complement unknot) 0 ≃ₘ (circle ×ₘ sphere 2)
-- theorem surgery_unknot_pq : dehnFilling (complement unknot) (p/q) ≃ₘ lensSpace p q
```

**Design notes.** Fix the framing convention (the `0`-framing from the Seifert surface)
once and prove the unknot identities against it before stating any Kirby target, because
every surgery statement inherits that choice. Property P and Property R are statements about
*all* nontrivial knots, so they quantify over layer 4's knot type; keep "the surgered
manifold is not simply connected / is not `S¹ × S²`" as the conclusion shape. Cosmetic
surgery compares two fillings of the *same* complement, so state it as a property of the
slope pair, not of two abstract manifolds.

**Unlocks.** Property P `[Kir97, Problem 1.15]`, Property R `[Kir97, Problem 1.82]`,
Akbulut–Kirby `0`-surgery concordance `[Kir97, Problem 1.19]`, and chirally cosmetic
surgery `[Kir97, Problem 1.81]`.

### Layer 6: knot concordance and 4D cobordism (owned here)

Two knots are concordant if they cobound a smoothly (or locally flatly) embedded annulus in
`S³ × [0,1]`; concordance classes form a group under connected sum. This layer owns the
concordance group and the cobordism category, building on layer 4's knots and layer 1's
gluing, and *consumes* the homological concordance invariants (`τ`, and ideally `s`) from
the combinatorial Heegaard Floer roadmap.

**From Mathlib / earlier layers.** Layer 4's knots, slice-ness, and Seifert surfaces; layer
1's gluing and connected sum; the combinatorial Heegaard Floer roadmap's `τ` (a homomorphism
on the concordance group). The classical signature invariant is built here from layer 4's
Seifert matrix.

**What to build.**
- The **concordance relation** and the **concordance group** `C` (smooth and topological
  variants), stated on layer 4's geometric presentation (smooth embeddings `S¹ ↪ S³`), not on
  any `Knot` type: concordance is the specialisation of the general `Isotopic`/cobordism
  machinery to a locally flat or smooth annulus in `S³ × [0,1]`. Connected sum is the group
  operation and the reverse mirror the inverse; the slice presentations form the identity
  coset. (Livingston, *A survey of classical knot concordance*, is the orienting reference.)
- The **4D cobordism category** in general dimension: oriented cobordisms between manifolds,
  composition by gluing (layer 1), and knot/link cobordisms as surfaces in `S³ × [0,1]`,
  with genus giving the concordance and slice genera.
- **The 4-manifold input to topological sliceness** that Freedman's theorem needs:
  topologically locally flat surfaces in `D⁴` (consuming layer 2) and the existence of
  locally flat slice discs for Alexander-polynomial-one knots. Consume
  FourManifolds F3.1's cyclic disk theorem and F3.2's TOP surgery exact
  sequence for π₁=ℤ, including its normal invariant, surgery obstruction
  and boundary marking; construct the knot-exterior normal map and the
  resulting slice-disk exterior with meridian π₁ generator. Its target
  pair is (S¹×D³,S¹×S²); the boundary map from zero-surgery M_K is a
  ℤ[ℤ]-chain equivalence when Δ_K=1. Construct this degree-one map
  and its stable normal data through Four F3.2's
  `knotExteriorNormalFillingOfArfZero`; Layer4's Seifert-matrix/Arf dictionary
  proves Δ_K=1 implies Arf(K)=0. Consume Four's marked G/TOP extension
  theorem and its geometric L₄(ℤ[ℤ]) action to kill the obstruction, then
  its relative homology-surgery variant to obtain an exterior homotopy
  equivalent to S¹. Attach the meridian2-handle and compute the contractible
  total manifold and S³ boundary. Use Four F3.1c's early ball recognition
   to identify it with D⁴,
  retaining the embedded cocore disk and its marked boundary K. Layer4's
  `IsTopologicallySlice` and Freedman application consume this construction.
- **Concordance invariants**: the Tristram–Levine signature function from layer 4's Seifert
  matrix (built here), and the import of `τ : C → ℤ` and `s` as consumers of the
  combinatorial Heegaard Floer roadmap.
- **Mutation** as an operation on knots (Conway mutation by a `(±1)`-tangle replacement) and
  the statement that it does *not* preserve the smooth concordance class.

```lean
-- K, K' : SmoothLink (sphere 3)   -- the geometric presentation; no `Knot` type
-- def Concordant (K K' : SmoothLink (sphere 3)) : Prop := ∃ Σ : Annulus (sphere 3 ×ₘ I), boundary Σ = K ⊔ K'.mirror
-- instance : Group (Quotient concordanceSetoid)   -- concordance classes; # as operation
-- def signature (K : SmoothLink (sphere 3)) (ω : Circle) : ℤ   -- Tristram–Levine, from the Seifert form
-- theorem mutation_not_concordance_invariant : ∃ K, ¬ Concordant K (mutate K)
-- theorem levine_homologySphere_not_S3 : -- a knot in a homology sphere not smoothly concordant to any in S³
```

**Design notes.** Keep smooth and topological concordance separate from the start; the
Levine and mutation results are about the smooth category specifically. The signature is
elementary and self-contained (a good first target); `τ` and `s` arrive later as imports,
so state the signature results without waiting on them. Concordance in homology spheres
(`[Kir97, 1.31]`) needs the knot type generalized to ambient homology spheres, which is a
small extension of layer 4's geometric presentation; note it as a dependency.

**Unlocks.** Conway mutation does not preserve concordance, `[Kir97, Problem 1.53]`;
concordance of knots in homology spheres to knots in `S³`, `[Kir97, Problem 1.31]` (Levine,
disproved smoothly).

### Layer 7: Riemannian geometric structures and volume

Mathlib's Riemannian library reaches the metric-and-distance level but stops short of
volume and curvature, which is exactly what the hyperbolic-geometry Kirby problems need. The
[Hopf--Rinow roadmap](../HopfRinow/README.md), Layer 1, owns the intervening Levi-Civita
connection; this layer consumes that shared connection rather than constructing a second one. The
Riemannian volume measure is this layer's and is in Tau Ceti as `TauCeti.riemannianVolume`
(`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/`); the
[differential-geometry roadmap](../DifferentialGeometry/README.md) connects its densities and form
integration to that same measure (its 12.4) rather than defining another. To state "the Weeks
manifold has the smallest volume" we need that measure, a notion of hyperbolic (complete, constant
curvature `−1`) structure, and the resulting volume invariant. This is the hardest layer that is
still close to existing Mathlib.

**From Mathlib / earlier roadmaps and layers.** `RiemannianBundle` and
`IsRiemannianManifold`, the induced `riemannianEDist`, and `EMetricSpace.ofRiemannianMetric`
(`Mathlib/Geometry/Manifold/Riemannian/Basic.lean`); path length in
`Mathlib/Geometry/Manifold/Riemannian/PathELength.lean`; Mathlib's measure theory and the
`volume` measure on `ℝⁿ`; the Hopf--Rinow roadmap's Levi-Civita connection; Tau Ceti's
`TauCeti.riemannianVolume`; layer 1's manifolds; `Matrix.orthogonalGroup` for isometry groups.

**What to build.**
- The **Riemannian volume measure** from the metric, the density `√det g` in charts glued over the
  chart sources, with its invariance under isometries: in Tau Ceti as `TauCeti.riemannianVolume`.
  Then the total **volume** of a closed Riemannian manifold as a real number,
  `(TauCeti.riemannianVolume I M univ).toReal`.
- **Curvature**: using the Levi-Civita connection supplied by the Hopf--Rinow roadmap, build the
  Riemann curvature tensor and sectional and Ricci curvature, enough to *state* "constant
  sectional curvature `κ`" (Lee,
  *Introduction to Riemannian Manifolds*, GTM 176, for the volume form and curvature,
  [extract](references/lee-riemannian-volume-curvature.md); Thurston, *Three-Dimensional
  Geometry and Topology*, [extract](references/thurston-hyperbolic-structures.md), and
  Ratcliffe, *Foundations of Hyperbolic Manifolds*, GTM 149, for the hyperbolic side and
  Mostow rigidity, [extract](references/ratcliffe-mostow-rigidity.md)).
- **Hyperbolic structures**, with the volume problem handled by separating *data* from
  *property*. A bare `IsHyperbolic M := ∃ g, …` carries no metric to integrate, so volume is
  not definable from it. Instead build a bundled `HyperbolicMetric M` (a complete metric of
  constant curvature `−1`, on the model `ℍⁿ`), define `hypVolumeOfMetric : HyperbolicMetric M → ℝ`
  by integrating its Riemannian volume, and make Mostow invariance a *theorem*
  (`hypVolumeOfMetric g = hypVolumeOfMetric g'` in dimension `≥ 3`), which then licenses a
  metric-independent `hypVolume M` from `Nonempty (HyperbolicMetric M)`. `IsHyperbolic M` stays
  as the existence predicate; the Weeks target uses `hypVolume`, not the predicate.
- **Fibering and Haken-ness** for layer 7's second problem: a 3-manifold *fibers over the
  circle* (is a mapping torus), is *Haken* (contains an incompressible surface), and is
  *virtually* so (a finite cover is).

```lean
-- the Riemannian measure is Tau Ceti's `TauCeti.riemannianVolume`; the volume is its total mass
-- noncomputable def volume (M) [Closed M] [IsRiemannianManifold I M] : ℝ := (TauCeti.riemannianVolume I M univ).toReal
-- structure HyperbolicMetric (M) where metric : RiemannianMetric M; complete : …; curv : sectionalCurvature metric = -1
-- noncomputable def hypVolumeOfMetric (g : HyperbolicMetric M) : ℝ := (TauCeti.riemannianVolume I M univ).toReal  -- for the metric g
-- theorem hypVolume_indep (g g' : HyperbolicMetric M) [Closed M] (h : 3 ≤ dim M) : hypVolumeOfMetric g = hypVolumeOfMetric g'  -- Mostow
-- noncomputable def hypVolume (M) [Closed M] (h : Nonempty (HyperbolicMetric M)) : ℝ := …  -- via hypVolume_indep
-- theorem weeks_minimal_volume (M) (h : ClosedOrientableHyperbolic3 M) : hypVolume weeksManifold ≤ hypVolume M
-- theorem agol_virtually_fibered (M) (h : ClosedHyperbolic3 M) : ∃ N, FiniteCover N M ∧ FibersOverCircle N
```

**Design notes.** Volume well-definedness for hyperbolic manifolds rides on Mostow
rigidity, so state hyperbolic volume against an *explicit* complete hyperbolic metric and
make Mostow-invariance a separate theorem rather than baking it into the definition. The
Weeks manifold needs a concrete construction (as a surgery on the Whitehead link, layer 5,
or by face-pairings of a polytope); pick one and make "this is the Weeks manifold" a
definition, not a black box. Keep "fibers over `S¹`", "Haken", and "virtually X" as
separate predicates; Agol's theorem is a chain of them.

**Unlocks.** Virtual fibering and virtually Haken, `[Kir97, Problem 3.51]` (Agol); the
smallest-volume closed orientable hyperbolic 3-manifold is the Weeks manifold,
`[Kir97, Problem 3.60]` (Gabai–Meyerhoff–Milley).

### Layer 8: Thurston geometries and the JSJ / geometric decomposition

Geometrization is much harder to *state* than the Poincaré conjecture, because its
conclusion is structural: not "homeomorphic to a fixed model" but "cut along canonical
tori, every piece carries one of eight geometries". So the work here is mostly in the
definitions, and stating the theorem faithfully is the deliverable.

**From Mathlib / earlier layers.** Layer 7's Riemannian and hyperbolic structures and
isometry groups; layer 5's torus complements and gluing; layer 1's manifolds; Lie groups
(`Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`) for the model-geometry isometry groups.

**What to build.**
- The **eight model geometries** as homogeneous Riemannian 3-manifolds `(X, Isom X)`:
  `S³`, `E³`, `ℍ³`, `S² × ℝ`, `ℍ² × ℝ`, `SL₂~`, `Nil`, `Sol`, each with its maximal
  isometry group (Scott, *The geometries of 3-manifolds*, is the canonical account); a
  **geometric structure** on `M` as a complete locally homogeneous metric modeled on one of
  them (equivalently `M = X / Γ` for a discrete `Γ ≤ Isom X`).
- **Incompressible tori** and the **JSJ decomposition**, modeled as a decomposition *object*,
  not a `Finset` of tori (a finite set of embedded tori would need an artificial `DecidableEq`
  and would drop the cutting data). A `JSJDecomposition M` bundles the family of disjoint
  incompressible embedded tori, the resulting pieces, the boundary identifications recovering
  `M`, and the proof each piece is Seifert-fibered or atoroidal; existence and canonicity (up
  to isotopy) are then *theorems* about this object, not built into a `def JSJ`.
- **Geometrization** as the statement that each piece of the JSJ decomposition of a closed
  orientable prime 3-manifold admits a geometric structure (after also splitting along the
  prime/connected-sum decomposition, which is layer 1).

```lean
-- structure ModelGeometry where X : Manifold …; isom : LieGroup …; homogeneous : …
-- def HasGeometricStructure (M) (G : ModelGeometry) : Prop := ∃ metric, LocallyHomogeneous metric G
-- structure JSJDecomposition (M) where
--   tori : Finset ι; emb : ι → EmbeddedTorus M; disjoint : …; incompressible : …
--   pieces : Finset Piece; cut : M ≃ₜ glueUp pieces; seifertOrAtoroidal : ∀ p ∈ pieces, …
-- theorem jsj_exists_unique (M : ClosedOrientablePrime3) : ∃ J : JSJDecomposition M, …  -- canonical up to isotopy
-- theorem geometrization (M : ClosedOrientablePrime3) (J : JSJDecomposition M) :
--     ∀ p ∈ J.pieces, ∃ G : ModelGeometry, HasGeometricStructure p G
```

**Design notes.** State the prime decomposition (connected-sum, layer 1) and the JSJ
(torus, here) as two separate canonical decompositions, then geometrization as "each atomic
piece is geometric"; bundling them obscures which uniqueness theorem is doing the work. The
eight geometries are a *closed* list, so encode them as an enumeration with proofs that
each is genuinely homogeneous, not as an open-ended class. The Poincaré conjecture is the
special case "`S³` is the only simply-connected closed 3-manifold" and falls out as an
instance.

**Unlocks.** Geometrization, `[Kir97, Problem 3.45]` (Perelman).

### Layer 9: Heegaard splittings and Heegaard genus

Every closed 3-manifold splits into two handlebodies glued along a surface; the minimal
genus of such a surface is the Heegaard genus, a basic 3-manifold invariant. Waldhausen
asked whether it equals the rank of the fundamental group; the answer is no, and stating
the disproof needs the genus and the rank side by side.

**From Mathlib / earlier layers.** Layer 1's handlebodies (a handlebody is a boundary-sum
of solid tori, built from layer 1's gluing) and boundary-gluing; `FundamentalGroup`
(`Mathlib/AlgebraicTopology/FundamentalGroupoid/`) and `Group.rank` for the rank side; the
surface (closed orientable 2-manifold) classification for the splitting surface.

**What to build.**
- **Handlebodies** of each genus and the **Heegaard splitting** of a closed 3-manifold as
  a decomposition `M = H₁ ∪_φ H₂` along a genus-`g` surface, with `φ` a surface
  diffeomorphism (consume layer 3's surface mapping classes; Scharlemann, *Heegaard
  splittings of compact 3-manifolds*, is the survey).
- **Heegaard genus** `g(M)` as the minimum genus over all splittings, with existence (every
  closed 3-manifold has a splitting, from a triangulation or a Morse function) so the
  minimum is over a nonempty set.
- The **rank** of `π₁(M)` (minimal number of generators) and the inequality
  `rank π₁(M) ≤ g(M)`, which is the easy direction; Waldhausen asked about equality.

```lean
-- def Handlebody (g : ℕ) : Manifold …
-- structure HeegaardSplitting (M) where g : ℕ; glue : (Handlebody g).boundary ≃ₘ (Handlebody g).boundary; iso : M ≃ₘ …
-- def genera (M : ClosedOrientable3) : Set ℕ := { g | ∃ s : HeegaardSplitting M, s.g = g }
-- noncomputable def heegaardGenus (M) [Nonempty (HeegaardSplitting M)] : ℕ := Nat.find (existence proof)  -- least genus
-- theorem rank_le_heegaardGenus (M) : groupRank (FundamentalGroup M) ≤ heegaardGenus M  -- check the Mathlib rank API
-- theorem waldhausen_false : ∃ M, groupRank (FundamentalGroup M) < heegaardGenus M
```

**Design notes.** Take the genus as the least element of a *proved-nonempty* set of splitting
genera (`Nat.find`/`sInf` under `[Nonempty (HeegaardSplitting M)]`), with existence proved
first, so `heegaardGenus` is never silently `0`; a raw `⨅` over a possibly-empty type is the
trap to avoid. ⚠ Confirm the rank invariant exists in the intended form: Mathlib may not
provide exactly `Group.rank (FundamentalGroup M)`, so name the minimal-generators invariant
explicitly and check before relying on it. The disproof is an inequality, so the target is a
witness `M` with strict inequality, not a general formula.

**Unlocks.** Waldhausen's rank-versus-genus conjecture (disproved by Li; no Kirby number).

### Layer 10: foliations and their Euler class

A transversely oriented codimension-one foliation on an oriented 3-manifold
has an oriented tangent plane bundle and an integral Euler class. Construct its
evaluation on surfaces and the Thurston norm. Prove Thurston's Euler-class
inequality and state the Euler-class-one counterexamples with the parity
condition, as different mathematical assertions.

**From Mathlib / earlier layers.** Consume DifferentialGeometry Layer4's
involutive distributions, Frobenius flat charts and leaves, Layer5's surface
integration and Layer10.1's regular-value predicates, LieGroupoidsPoisson
G0.1's regular-fiber manifold, AlgebraicTopology Stage6's integral
cohomology, cup/cap pairing and duality, and this roadmap's smooth manifold,
embedded surface and hyperbolic carriers.

**What to build.**

- Build transversely oriented codimension-one foliations, their tangent plane
  bundle, restriction and orientation laws, and tautness (a closed transversal
  through every leaf). Include leafwise-smooth, transversely continuous
  C^(∞,0) foliated charts and plane fields, as required by the counterexample;
  compare smooth Frobenius foliations with this carrier.
- Construct the integral Euler class of an oriented plane bundle independently
  of foliations, with clutching/obstruction definition, normalization, pullback
  and evaluation. Compare it with CharacteristicClasses C2's general Euler
  class. On closed oriented 3-manifolds prove the
  foliation class lies in 2H²(M;ℤ).
- For a compact oriented surface define χ₋ as the sum of max(0,−χ) over
  components. Define the Thurston norm on integral H₂(M;ℤ) as the minimum χ₋
  among embedded oriented representatives. Prove existence of representatives
  and the minimum, homogeneity and triangle inequality by regular-value and
  oriented cut-and-paste constructions. Extend to rational and real homology,
  prove continuity, and define the dual norm on real H² with its evaluation
  pairing. On closed hyperbolic 3-manifolds prove the norm is nondegenerate.
- Prove Thurston's inequality for a taut transversely oriented C^(∞,0) foliation on a
  closed oriented hyperbolic 3-manifold: |⟨e(F),[S]⟩|≤χ₋(S) for embedded
  oriented surfaces, hence x*(e(F)_ℝ)≤1. Use incompressible representatives,
  the saddle-tangency general-position theorem and Poincaré–Hopf index
  comparison, using Gabai–Yazdi §2.7 and its explicit extension
  from transversely C² to C^(∞,0); build those foliation/surface comparison
  lemmas here. Sphere
  components contribute zero; do not bound their evaluation by −χ(S).
- Construct a closed oriented hyperbolic 3-manifold and e∈2H²(M;ℤ) with
  x*(e_ℝ)=1 which is not the Euler class of any taut C^(∞,0) foliation. Follow
  Yazdi's explicit fibered-manifold Dehn-surgery construction and Gabai–Yazdi's
  fully marked surface theorem, building the sutured foliation and
  norm-minimizing surface lemmas those proofs need. The existing surgery and
  hyperbolic layers supply the ambient constructions.

```lean
-- eulerClass is in integral singular cohomology; its real image is used by the norm.
-- Foliation here carries leafwise-smooth, transversely-continuous C^(∞,0) charts.
-- theorem thurston_euler_bound (F : Foliation M) (hF : Taut F) :
--   dualThurstonNorm (realImage (eulerClass F.tangentPlane)) ≤ 1
-- theorem euler_class_one_counterexample : ∃ (M : ClosedOrientedHyperbolic3)
--   (e : SingularCohomology 2 M ℤ), (∃ b, e = 2 • b) ∧
--   dualThurstonNorm (realImage e) = 1 ∧
--   ∀ (F : Foliation M), Taut F → eulerClass F.tangentPlane ≠ e
```

**References.** [Yazdi, On Thurston's Euler class one
conjecture](https://arxiv.org/abs/1603.03822), including the parity condition;
[Gabai–Yazdi, The fully marked surface theorem](https://arxiv.org/abs/2008.07223).
Calegari, *Foliations and the Geometry of 3-Manifolds*, supplies the foliation
foundations and Thurston inequality.

**Unlocks.** The Euler-class-one counterexample (no Kirby number).

### Layer 11: triangulations, PL structures, and collapse

This layer is the simplicial counterpart of layer 1's chart-based PL groupoid, and the two
must be proved to agree. A triangulation presents a space as the polyhedron of a simplicial
complex; a *combinatorial* manifold is a complex whose local structure (the links) forces
the polyhedron to be a manifold. Manolescu's theorem is that some topological manifolds are
not triangulable at all, and Zeeman's conjecture is about simplicial collapse, so both need
this simplicial vocabulary.

**From Mathlib / earlier layers.** Abstract simplicial complexes `AbstractSimplicialComplex`
(`Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean`); geometric simplicial complexes
in a real vector space with their underlying polyhedron `SimplicialComplex.space`
(`Mathlib/Analysis/Convex/SimplicialComplex/Basic.lean`); the simplicial-set realization
adjunction `toTopHomeo`, `|Δ[n]| ≅ stdSimplex`
(`Mathlib/AlgebraicTopology/SimplicialSet/TopAdj.lean`); layer 1's manifolds and PL
groupoid.

**What to build.**
- **Geometric realization of an abstract simplicial complex** as a topological space (the
  polyhedron `|K|`), with the basic API (faces, the star and **link** of a simplex,
  subdivision), reusing the simplicial-set realization where the indexing allows and the
  geometric `SimplicialComplex.space` otherwise.
- **Maps, restrictions and compactness for `|K|`.** The continuous map `|f| : |K| → |L|` induced
  by a simplicial map, with its barycentric-coordinate formula and the identity and composition
  laws; the restriction of a complex to a subset of its vertices, with the realization of a
  restriction an embedding (`AbstractSimplicialComplex ι` contains every singleton of `ι`, so a
  restriction changes the vertex type rather than shrinking the complex over the same one, and
  `PreAbstractSimplicialComplex` is the singleton-free version if that is awkward); `|K|` is
  Hausdorff and is the quotient of the disjoint union of its closed simplices; and **every
  compact subset of `|K|` lies in the realization of a restriction to finitely many vertices**,
  so that a continuous map out of a compact space factors continuously through such a
  restriction. The last of these is what makes the weak topology usable, and it is the form
  every consumer needs: the classifying-space roadmap's contractibility argument, and the
  finiteness arguments of this layer's own collapse results.
- **Realized cones and contiguity.** The affine homotopy attached to a pair of contiguous
  simplicial maps, jointly continuous in the point and the parameter; in particular the
  realization of the combinatorial cone contracts onto its apex, fixing the apex throughout.
- **`|K|` as a CW complex.** Fix o:ι→α into a linear order, injective on each
  simplex. Construct the ordered simplicial set K_o of weakly increasing
  vertex strings whose support is a simplex, its degeneracies and faces,
  and the barycentric homeomorphism |K|≃ₜ SSet.toTop.obj K_o. Prove its
  subcomplex and simplicial-map comparisons. Consume AlgebraicTopology 4.7's
  single `simplicialRealizationCW`, with its normalized ball/simplex
  characteristic maps. Own `cwComplexTransportHomeomorph` and
  `relCWComplexTransportHomeomorph`: transport native CW/relative CW
  structures along any homeomorphism, with the relative base’s actual image,
  pushed-forward characteristic maps, closed/open cells, subcomplexes and weak
  topology. Transport the realization structure through this homeomorphism;
  the nondegenerate n-simplices are precisely the n-simplices of K. Export
  this transported native `CWComplex (univ:Set |K|)`, rather than a second
  direct construction. Simplicial maps are cellular; maps injective and
  order-preserving on each simplex carry its characteristic map to the
  corresponding characteristic map, and simplicial automorphisms permute cells.
  Prove the cellular/ordered-simplicial chain identification, with boundary
  ∑_j (−1)^j[v₀,…,v̂_j,…,vₙ] for n≥1 and zero ordinary degree-zero boundary.
  The classifying-space and smooth-triangulation constructions consume this
  one transported structure and its subcomplex/order-change comparisons.
  For two orders o,o′, compare the ordered realizations through the identity
  of |K|: closed cells agree and characteristic maps differ by the induced
  vertex permutation; the chain comparison records its orientation sign.
- **Triangulation of a space** in the general sense: `IsTriangulable M := ∃ K, Nonempty (|K| ≃ₜ M)`.
  This is the notion in Manolescu's theorem, and it is *weaker* than asking for a
  combinatorial or PL structure. (Moise, *Geometric Topology in Dimensions 2 and 3*, treats
  the dimension-3 existence, [extract](references/moise-triangulation-dim3.md).)
- **Combinatorial manifolds via the link condition** (Kim's point, the simplicial side of
  PL topology). Define, recursively in dimension, a **combinatorial `n`-sphere** and
  **combinatorial `n`-ball** (a complex PL-homeomorphic, after subdivision, to the boundary
  of the standard `(n+1)`-simplex, respectively the standard `n`-simplex), bottoming out at
  the combinatorial `0`-sphere (two points) and `0`-ball (one point). Then `K` is a
  **combinatorial `n`-manifold** if the link of every vertex is a combinatorial
  `(n-1)`-sphere (interior point) or `(n-1)`-ball (boundary point). This is the definition
  that "has the correct links to be a manifold".
- **The reconciliation with layer 1.** Prove that the polyhedron of a combinatorial
  `n`-manifold is a PL `n`-manifold in the sense of layer 1's `PLGroupoid`, and conversely
  that every PL manifold admits a combinatorial triangulation (Whitehead). This is the
  theorem that makes "PL manifold via charts" and "simplicial complex with correct links"
  the same notion, and it is the concrete reason layer 1's `PLGroupoid` should be defined to
  make this proof natural. ⚠ This is genuinely subtle and not merely bookkeeping: recognizing
  a combinatorial sphere is undecidable in high dimensions (Novikov), the Hauptvermutung
  (any two triangulations have a common subdivision) is *false* for topological manifolds in
  general (so a triangulation need not give a PL structure), and a non-combinatorial
  triangulation of a manifold can exist where no combinatorial one does. Keep "triangulable",
  "combinatorially triangulable / PL", and "smoothable" as three separate predicates with
  the implications, not equalities, between them.
- **Simplicial collapse** (an elementary collapse removes a free face; `K` is collapsible if
  it collapses to a point), and **Zeeman's conjecture**: for a contractible `2`-complex `K`,
  the product `K × I` is collapsible.

```lean
-- def realize (K : AbstractSimplicialComplex ι) : TopCat := …      -- the polyhedron |K|
-- def link (K) (σ : K.faces) : AbstractSimplicialComplex ι := …
-- def IsCombinatorialManifold (K) (n : ℕ) : Prop := ∀ v, IsCombinatorialSphereOrBall (link K {v}) (n-1)
-- theorem realize_combinatorialManifold_isPL (K) (h : IsCombinatorialManifold K n) : HasGroupoid (realize K) PLGroupoid
-- def IsTriangulable (M : TopCat) : Prop := ∃ K, Nonempty (realize K ≃ₜ M)
-- theorem manolescu_not_triangulable : ∃ M : ClosedTopological5Manifold, ¬ IsTriangulable M
-- def Collapsible (K) : Prop := …
-- theorem zeeman_conjecture (K) (h : Contractible2Complex K) : Collapsible (K ×ₛ I)   -- [Kir97, 5.2]
```

**Design notes.** The combinatorial-sphere recursion is the crux; get the base cases and
the subdivision relation right before anything depends on it, since the whole link
definition rests on it. State Manolescu's theorem against the *general* triangulability
predicate (homeomorphism to any simplicial complex), not the combinatorial one, since that
is what is false. Zeeman's conjecture remains open, so it is stated, not attached to a
solver; it belongs here because it is the cleanest target exercising the collapse API.

**Unlocks.** Manolescu's disproof of the triangulation conjecture (no Kirby number); the
Zeeman collapsibility conjecture, `[Kir97, Problem 5.2]`.

## The smoothing-and-triangulation comparison

Relating the smooth, PL, and topological structures is a major undertaking, arguably its own
roadmap. This comparison joins layer 1's chart-based `PLGroupoid` to layer 11's
combinatorial manifolds. Its constructions consume those carriers, with the
following sequence of targets:

1. **Smooth implies PL.** For finite-dimensional Hausdorff second-countable
   smooth manifolds with the Euclidean or half-space model, construct a
   countable locally finite smooth triangulation and its realization
   homeomorphism. Pin `SmoothTriangulation` to Munkres Definition 8.3: it
   has data K (a native abstract simplicial complex) and a realization
   homeomorphism h:|K|≃ₜM. At every point of each closed simplex, require
   a local smooth extension of its chart-coordinate map to an open neighborhood
   in that simplex's affine span; use the target's ambient coordinate space,
   without requiring a global extension into the manifold. Prove that
   tangential derivatives agree on common faces by continuity from their
   relative interiors; they are not additional structure data. Require the
   differential map on the closed star at every point b to be injective on
   that star; immersion of each simplex alone is insufficient. Develop restriction,
   smooth-chart comparison, subdivision, relative and PL-structure APIs,
   and prove the recognition/uniqueness theorems (Munkres 8.4 and 10.5).

   The relative boundary theorem takes a specified smooth triangulation
   of ∂M, with its given smooth structure, and a product triangulation on
   a chosen collar compatible with that boundary map; extend it unchanged
   by the owned `collarFixedSmoothTriangulationExtension`: trim the half-open
   collar, apply Munkres 10.6 to that manifold's boundary, and glue the prescribed
   prism triangulation of ∂M×[0,½] along its full end subcomplex. Prove
   closed-star injectivity across the seam from the opposite interior half-spaces.
   For dimension m≥1, take a countable locally finite disjoint family of proper smooth
   boundaryless hypersurfaces, closed as subsets of M and disjoint from ∂M.
   Pin the family as data (S_j,i_j,K_j,h_j,N_j): each S_j is a
   boundaryless (m−1)-manifold, i_j its proper smooth embedding into the
   interior, K_j/h_j its specified smooth triangulation, and N_j its actual
   rank-one normal interval-bundle collar. Require closed/disjoint ranges and
   locally finite images; the ∂M collar is disjoint from every N_j image.
   Use AlgebraicTopology Stage 6.3’s foundational `boundarylessInteriorAtlas` and
   `boundarylessInterior_isManifold` on that interior, before its orientation or
   duality targets; this uses the earlier interior half-space chart constructions,
   not smooth triangulation.
   Own cutting/regluing along them. For two-sided hypersurfaces the cut has
   two collar boundary copies. For one-sided hypersurfaces its boundary is
   the normal sphere double cover. Construct its smooth covering charts and
   lift each prescribed closed simplex by covering lifting, uniquely after
   selecting a vertex sheet; prove local smoothness through those charts,
   face compatibility and simplicial deck action. This preserves the prescribed
   triangulation without forcing a subdivision. Apply the owned collar-fixed
   extension to the cut manifold's resulting boundary triangulations;
   glue the copies/deck pairs with their fixed product collars, and prove
   the resulting realization homeomorphism is a smooth triangulation in the
   closed-star sense. This constructs the hypersurfaces as subcomplexes,
   with exact prescribed restrictions and locally finite simultaneous gluing.

   Include finitely many prescribed interior points outside the relative
   subcomplex as vertices by geometric stellar refinements of their supporting
   simplices. Prove homeomorphism, finite support/local finiteness, the
   closed-star differential criterion and preservation of the relative locus.
   Choose an injection of the countable vertex set into ℕ and pull back its
   order; instantiate Layer 11's ordered-realization adapter at that order.
   Consume its transport of
   AlgebraicTopology 4.7's single `simplicialRealizationCW` definition.
   Apply Layer 11's homeomorphism transport to the triangulation map.
   Export `CWComplex (univ:Set M)` and the
   finite 0-cell subcomplex P consisting of the prescribed points, then
   `RelCWComplex (univ:Set M) P`; boundary or hypersurface unions use their
   actual subcomplex structures. AlgebraicTopology's mapping-space
   constructions consume these marked CW pairs. The absolute and marked
   relative exports are `@[instance_reducible] def` structures selected with
   `letI` in their respective uses: the native relative base is an out-parameter,
   so they are not simultaneously registered instances on the same ambient set.

   Own adaptive subdivision for a countable compact exhaustion
   K_r⊂int K_(r+1): refine locally finitely so every simplex meeting K_r
   lies in K_(r+1), with compatible simplex/realization maps and unchanged
   smooth/PL structure. These supply locally finite fundamental cycles and
   cap-product exhaustions. Whitehead, *On C¹-complexes*, Ann. Math. 41 (1940),
   and Munkres, *Elementary Differential Topology*, §§8–10, give the proof
   spine; the closed-star definition and relative boundary theorem are in
   the [extract](references/munkres-smoothing-triangulations.md).
2. **PL implies Top.** The forgetful direction, immediate from layer 1's inclusion
   `PLGroupoid ≤ continuousGroupoid`.
3. **Topological microbundles, CW type and the TOP/PL obstruction.**
   Own the following named foundation interfaces on Layer1's continuous/PL
   chart carriers. They precede FourManifolds' dimension-four classification.
   The smooth-triangulation construction in item1 remains independent.

   **3a. Topological manifold CW type.** Consume AlgebraicTopology 8.11a's
   metric ANR/ANE, locally finite nerve domination and homotopy-idempotent
   telescope criterion. Own the local-to-global ANR theorem for a Hausdorff
   second-countable locally Euclidean or half-space charted manifold:
   metrize the existing topology, use the Euclidean neighborhood-retraction
   charts and numerable refinements, and prove the relative collar version.
   Export `topologicalManifoldCWType` as an actual homotopy equivalence
   with a native countable locally finite CW complex, not a triangulation
   of M. Give maps of pairs, homeomorphism invariance and prescribed
   finite-point relative forms. For a compact M prove finite domination
   directly by a finite nerve of a numerable ANR cover, and deduce homology
   finite generation from the domination maps. The compact finite-CW corollary follows
   item3e's handle/simple-homotopy machinery. No PL structure on M is
   required, including in dimension4. AT8.7 consumes item1 for smooth CW structures; this
   paragraph consumes AT8.11a's independent ANR foundation.

   **3b. Microbundles and their Euclidean representatives.** Define
   `Microbundle n B` by an actual neighborhood of a section in E,
   maps i:B→E and p:E→B with p∘i=id, and local product homeomorphisms
   near i(b) to U×ℝⁿ that carry i to (b,0) and p to projection.
   Isomorphisms are germs of homeomorphisms near the zero sections with
   these commuting equations. Build restriction, pullback, composition,
   product/direct sum, stabilization, relative trivialization and gluing
   along locally finite atlases, including rank0. Own `brownTopologicalBoundaryCollar` for paracompact Hausdorff TOP
   manifolds modeled on the half-space: construct an actual collar embedding
   ∂M×[0,1)→M with open neighborhood image and its boundary value equal
   to inclusion. Prove prescribed-relative collar extension, uniqueness by
   ambient isotopy near the boundary, and the double/restriction comparisons.
   This general boundary theorem also supplies codimension1 normal collars;
   local bicollars alone do not give it. The diagonal defines
   `topologicalTangentMicrobundle`: for a boundaryless M use i=diagonal
   and p=first projection on a neighborhood in M×M, with the second
   coordinate centered in each chart. For boundary manifolds use the double
   and its collar restriction; prove independence of the double/collar.
   Compare this germ with the smooth tangent vector bundle only after a
   smooth reduction is specified, and with the PL tangent microbundle
   for a PL atlas. Prove Kister–Mazur for paracompact Hausdorff bases:
   every rank-n microbundle has a numerable locally trivial ℝⁿ-bundle
   representative near its zero section, unique up to the germ/isomorphism
   comparison. Own the controlled radial shrinking and successive locally
   finite extension argument, including parameterized and relative forms.
   Use [Holm, *The microbundle representation theorem*](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/6026-11511_2006_Article_BF02395045.pdf), Acta Math.117 (1967),
   whose numerable-base theorem supplies this paracompact generality beyond
   the original finite-dimensional simplicial-base Kister statement;
   no positive-codimension normal microbundle is inferred merely from local
   flatness without its separate existence hypothesis.
   Define an ordinary normal microbundle of a locally flat M⊂W as an
   actual neighborhood retraction ν:U→M with zero section the inclusion,
   and rank-codimension local microbundle charts identifying that section
   with M×{0}. Retain its neighborhood germ, shrinking and relative
   equivalences; it is neither an arbitrary regular neighborhood nor an
   unspecified vector reduction.
   Own `topologicalManifoldProperLocallyFlatEmbedding`: every Hausdorff
   second-countable finite-dimensional TOP manifold admits an actual proper
   locally flat embedding in a finite-dimensional real Euclidean space.
   Construct it directly from chart partitions of unity. For compact M use a
   finite chart cover; for noncompact M own a finite-colored locally finite
   chart refinement, using the finite covering dimension of Euclidean charts
   and the local-to-global refinement theorem. In each color use the weighted
   chart coordinates, weight and discrete chart label; at a positive weight
   recover that chart by division. Add a proper exhaustion coordinate.
   Prove injectivity/properness and local flatness by this recovered chart:
   the image is a continuous graph, flattened by subtracting its graph function.
   Include the boundary form through the double/collar and the empty/discrete
   cases. Construct the corresponding locally flat graph of f:M→X in
   X×ℝ^D and its stabilization maps. This embedding proof uses no TOP
   handle theorem or dimension4 classification. Preserve the specified target
   normal microbundle in this graph construction; no unstable source normal
   microbundle is inferred merely from local flatness.
   Own `locallyFlatNormalBundle_lowCodim`: codimension1 uses the Brown
   collar/normal interval-bundle construction; codimension2 in ambient
   dimension>4 uses
   [Kirby–Siebenmann, *Normal bundles for codimension2 locally flat imbeddings*, TheoremA](https://math.berkeley.edu/~kirby/papers/Kirby%20and%20Siebenmann%20-%20Normal%20bundles%20for%20codimension%202%20locally%20flat%20imbeddings%20-%20MR0400237.pdf).
   For codimension2 in ambient dimension≤3 build the point/curve normal
   disk neighborhoods directly from locally flat charts: patch along intervals,
   retain endpoint clutching on circle components, and prove relative germ
   uniqueness by collar straightening. Ambient dimension4 remains Four's
   `locallyFlatNormalBundle_topFour` supplier.
   Construct the actual neighborhood normal microbundle and its ambient
   isotopy uniqueness, with prescribed germs on a smaller neighborhood of
   a closed subset. For manifolds with boundary take a given compatible
   normal germ on the boundary collar, then apply the relative interior
   theorem; do not require constructing an exceptional dimension4 boundary
   normal bundle as a prerequisite. Own the deformation retractions
   TOP(1)→O(1) and TOP(2)→O(2), with stabilization/relative classifying
   comparisons (Kneser–Dibbern for rank2), to obtain actual linear normal
   bundles from these microbundles. Low ambient smooth/PL comparisons are
   deferred to item3g; the point/curve normal microbundles here use direct charts;
   Four F3.1c owns ambient4 normal existence. Include normal Euler/orientation
   comparison through CC after this reduction and the actual neighborhood
   embedding/zero-section equations.

   **3c. Structure groups and stable classifying maps.** Define TOP(n)
   as the subgroup of the native homeomorphism group `ℝⁿ ≃ₜ ℝⁿ` fixing0, with
   the induced topology of h↦(h,h⁻¹) in the product of native compact-open
   continuous-map spaces. Prove continuous evaluation, composition,
   inversion and product stabilization, and its orientation homomorphism
   to {±1} by the action on the one-point-compactified fiber's reduced
   homology; TOP(0) is trivial. Pin the PL comparison to the simplicial
   group of germs of jointly PL, fiber-preserving homeomorphisms of
   Δ^q×ℝⁿ near Δ^q×{0}, with inverse jointly PL and base fixed.
   Affine face/degeneracy pullbacks give its native simplicial operators.
   Merely requiring each fiber map to be PL is insufficient for this
   parameterized carrier. Build its forgetful map to parameterized TOP
   germs and the latter's weak comparison with Sing TOP(n), with actual
   basepoint and stabilization maps. Consume GeneralizedCohomology G2.9's
   single extension of CC C1.1's numerable join construction to general
   topological groups, and AT4.7's realization CW structure for simplicial
   classifiers; do not treat TOP(n) as a compact Lie group. Construct
   BPL(n)→BTOP(n), the universal bundles/microbundles, and the comparison
   of these models with numerable microbundle classification on CW-type
   bases. Stabilize by adding the trivial line, using the single generic
   mapping-cylinder telescope carrier of GeneralizedCohomology G3.4, to obtain BPL→BTOP. Define `topPLFiber` as the
   actual homotopy fiber of that map; its quotient notation TOP/PL is
   supplied by a proved comparison, not by an assumed quotient fibration.
   Construct BO→BPL at the bundle/classifier level using the parametric
   smooth-to-PL bundle comparison of
   [Lashof–Rothenberg, *Microbundles and smoothing*, §§1–3](https://www.maths.gla.ac.uk/~mpowell/Lashof-Rothenberg-smoothing-microbundles.pdf).
   Use the commuting-action construction of Lashof–Rothenberg §3,
   Theorem3.2 and Lemma3.3. Construct their semisimplicial
   piecewise-differentiable germ complex PD_n from actual parametrizations
   near the zero section of Δ^q×ℝ^n, with its subdivision, differentiability
   and nondegeneracy data and restriction face maps. Construct its commuting
   left linear-orthogonal O_n and right jointly PL germ PL_n actions.
   Specify the source's linear parameter carrier O_n and prove its realization
   comparison with the ordinary topological O(n); continuous linear families
   are compared through this carrier, not declared jointly PL.
   PD_n is an action complex, with no asserted multiplication or group
   delooping. For a universal free PL_n-space U_n construct the diagonal
   right-action quotient E_n=(PD_n×U_n)/PL_n, its residual O_n action and
   the invariant projection E_n→U_n/PL_n. Prove freeness and construct
   the local trivializations and a numerable principal O_n-bundle structure
   on E_n→O_n\E_n, with its action/quotient realization comparisons.
   Prove E_n weakly contractible by the relative piecewise-differentiable
   triangulation and linear comparison lemmas of that construction; prove
   its CW type and construct a contraction by CW Whitehead. Thus E_n
   is a universal free O_n-space with actual numerable pullback classification.
   Freeness alone is not classification.
   The projection induces O_n\E_n→U_n/PL_n, a genuine BO(n)→BPL(n)
   model map. Compare O_n\E_n and its associated universal real n-bundle
   with TopK T1.6's fixed-rank Grassmannian classifier and tautological bundle,
   and compare U_n/PL_n with the chosen PL germ classifier above. Construct
   the based comparison maps and homotopies on CW models, using AT Whitehead
   only after proving the required weak equivalences and CW type. Own the
   pullback identification of the universal PL microbundle with the linear
   bundle's PL reduction; compare its underlying TOP microbundle with that
   linear bundle. Construct compatible trivial-line stabilization on PD_n,
   U_n and E_n, its quotient maps and the bundle comparison homotopies;
   use the same mapping telescope to obtain BO→BPL. These are constructions
   of a classifier map and its universal-bundle diagrams, rather than a
   classifier assigned to a group structure on PD_n.
   Own its relative, pullback and stabilization comparisons, then prove its
   composite to BTOP agrees with forgetting the actual linear bundle.
   A family of linear fiber maps has bilinear dependence on parameter and
   fiber coordinates, so no simplexwise map Sing O(n)→PL(n) is defined by
   declaring that family jointly PL. Export the actual classifier map,
   orientation covers and homotopies comparing tangent classifying maps.
   Prove the Whitney direct-sum and group-completion comparison on these
   same stable TOP bundle classifiers, with actual associativity, block-swap
   and trivial-line maps, consuming GeneralizedCohomology G2.8's single additive group-completion
   machinery. Export stable inverses and `topologicalBundleStableComplement`
   on finite CW bases and compact Hausdorff bases of CW type, with a
   finite-rank representative and a specified stable trivialization. Use
   the bounded telescope height of a map from a compact base, and of its
   homotopies, for the finite-rank factorization. Apply this to item3a's
   earlier CW-type witness, independently of its compact finite-CW
   corollary, to construct on compact M
   `topologicalStableNormalBundle` and the actual trivialization
   τM⊕νM⊕ℝ^k≅ℝ^N. On general noncompact bases retain the stable inverse
   class and its cancellation homotopy on BTOP. A finite-rank complement
   there requires a supplied finite-stage representative and trivialization,
   or a proved finite-dimensional rank-lifting theorem; it is not obtained
   from a compact-source bounded-height argument. Give restriction, relative framing and boundary
   outward-line comparisons, and define its orientation from this framing.
   This supplies the stable normal data of geometric normal maps without
   claiming every locally flat positive-codimension embedding has a normal
   microbundle. Smooth normal bundles compare after their smooth reduction.

   **3d.0. Ordinary PL surgery and its algebraic engine.** Own the generic PL Whitehead-torsion
   and s-cobordism interfaces needed here. Define Wh(π)=K₁(ℤ[π])/⟨±g⟩
   using native group rings, stabilized invertible matrices and their
   elementary relations; construct the based finite-free cellular chain
   torsion, basis-change/simple-collapse invariance, composition and duality.
   Consume GrothendieckEulerForms' single projective-module K₀ construction;
   own its comparison with idempotent matrices over a general unital ring,
   the rank summand and reduced K₀ used here. Build the Bass–Heller–Swan
   Laurent extension in degrees0/1, with augmentation, t-multiplication,
   localization/patching maps and their exactness. Prove the Nil summands
   vanish for the iterated Laurent rings over ℤ by regular-Noetherian
   finite resolutions, proving preservation of those hypotheses at each
   extension. Compute K₀(ℤ[ℤⁿ])=ℤ and
   K₁(ℤ[ℤⁿ])=ℤ/2⊕ℤⁿ with generators−1 and the n Laurent units;
   export `whitehead_freeAbelian_eq_zero` and
   `reducedKZero_freeAbelian_eq_zero`, including n=0.
   Construct the compatible algebraic K-spectrum of a unital ring from
   its finite projective-module category using G2.8's additive completion,
   with the stable-GL plus-construction comparison. Compare π₀/π₁ with
   the existing K₀ and matrix K₁, and build the Bass polynomial/Laurent
   nonconnective extension. Prove ring-map, stabilization, Morita and
   boundary compatibility. Define the Whitehead coefficient spectrum as
   the cofiber of the group assembly from Bπ with the ℤ K-spectrum
   to K(ℤ[π]); identify its π₁,π₀ and negative groups with Wh(π),
   reduced K₀ and negative ring K-groups. Prove negative K_i vanish
   for ℤ and its iterated Laurent rings by their regular finite resolutions
   and the Bass exact sequences. These are the coefficient inputs to
   Four's controlled torsion, before the geometric TOP applications.

   Own PL normal block bundles before this surgery construction. For a
   triangulated PL base, give each simplex its (dimσ+q)-dimensional block
   and PL product chart, with face intersections exactly the specified
   face blocks; use subdivision-compatible germ isomorphisms. Build
   restriction, stabilization, Whitney sum, isomorphism and concordance,
   relative trivialization and gluing, and compare stabilized block bundles
   with item3b's PL microbundle/simplicial-group classifiers. A block bundle
   need not have a pointwise bundle projection. Construct the stable normal
   block bundle of a PL embedding and its tangent-normal sum comparison;
   export the compatible normal block neighborhoods used by surgery.
   Prove relative PL transversality to a PL submanifold with this normal
   block data, constructing the transverse inverse-image PL manifold and
   its normal pullback. Give parameter, isotopy, boundary and
   Pontryagin–Thom inverse-image comparisons with displayed normal data.

   Build the stable spherical-fibration classifier BG from the
   grouplike monoid of based sphere homotopy self-equivalences and its
   suspension maps, consuming GeneralizedCohomology G2.8's topologically
   enriched nerve/realization and G3.4's single telescope, together with
   AT's native pointed mapping-space/sphere interfaces. Construct BPL→BG and
   the actual homotopy fiber G/PL.
   Prove its normal-invariant classification:
   degree-one PL normal maps to a finite-dimensional PL manifold, with a
   stable normal-bundle map to a specified spherical reduction and boundary
   identification, modulo normal bordism rel boundary. Include the surgery
   existence theorem for a degree-one normal map whose boundary map is already
   a simple homotopy equivalence, retaining that boundary map during interior
   surgery; it need not initially be an isomorphism. This supplies the
   relative five-dimensional PL normal-bordism application. Give identity,
   pullback under transverse maps, disjoint sum, stabilization and the
   difference/action API. Construct quadratic forms/formations and based
   quadratic Poincaré chain complexes over ℤ[π], with involution
   g↦w(g)g⁻¹ for the specified orientation character. Define the decorated
   surgery groups and the surgery-kernel obstruction, its normal-bordism
   invariance, additivity and boundary exact sequence. Own the integral
   four-periodicity maps and the simply connected quadratic calculation
   L_(4j)(ℤ)=ℤ by signature/8, L_(4j+2)(ℤ)=ℤ/2 by Arf,
   L_(2j+1)(ℤ)=0, with hyperbolic stabilization and explicit generators;
   this supplies the algebraic L₄/L₅ used by FourManifolds. Prove the PL surgery
   exact sequence in dimension≥5 (relative boundary and L_(m+1) action
   included), using embedded surgery handles and the previously built
   normal data. This is the high-dimensional PL engine; FourManifolds F3
   owns ambient4 submanifold and high-ambient map transversality with
   expected preimage dimension4, and the disk-embedding replacements.
   Item3e owns the complementary KS-range map transversality.
   Compute its homotopy groups through
   degree5: π₁=π₃=π₅=0, π₂=ℤ/2 and π₄=ℤ. Own the comparison
   with the low-degree fiber of BO→BG using item3g's PL4-compatible
   smoothing and relative low-link smoothing obstruction calculation.
   Consume HomotopySpheres PR284 §4B's stable-O groups and §9.1–2's
   Hopf/EHP/Toda low stable stems. On π₄(BO)=ℤ pin the generator by
   p₁=2u; prove its spherical J image generates π₃ˢ=ℤ/24, so the
   fiber generator maps to24 times that BO generator. Compare the surgery
   obstruction with the smooth signature formula and
   [SpinGeometry G6.7](../SpinGeometry/README.md)/
   [IndexTheory I7.5](../IndexTheory/README.md)'s untwisted Rokhlin theorem:
   π₄(G/PL)→L₄(ℤ) is multiplication by2, with positive generator
   normalized to signature16. Prove the π₂ Arf comparison and the
   dimension≥5 coefficient maps through PL surgery, rather than assume
   the factor2 from a table. Export its actual Postnikov4-stage as the
   homotopy fiber of βSq²:K(ℤ/2,2)→K(ℤ,5), consuming AT's
   Bockstein/EM and TB B4.1–2's single Sq. Include its universal integral
   degree4 generator `gPLDegreeFourClass`, evaluating to2 on the positive π₄ generator,
   and its reduction a², lift/action and relative normal-invariant
   comparisons. These inputs precede the TOP/PL π₃-generator argument.
   For π=ℤⁿ construct the Laurent-product splitting
   L_q(ℤ[ℤⁿ])≅⊕_(i=0)^n L_(q−i)(ℤ)^(binomial n i), with the actual
   transfer, product and assembly maps. Compute the PL normal invariants
   and surgery sequence of Tⁿ×Dᵏ rel boundary for n+k≥5, and prove the
   Wall/Hsiang–Shaneson finite-cover splitting/unfurling theorem for PL
   homotopy tori with its marking and boundary data. Include the change of
   surgery decoration justified by the displayed Wh and reduced-K₀
   vanishing. These are owned inputs to torus unfurling and the exotic-torus
   examples below; they use no already-computed TOP/PL obstruction.
   For a compact PL h-cobordism of dimension at least6, build the relative
   handles, its torsion and the product PL isomorphism rel the incoming
   boundary iff that torsion vanishes, with the parameter/relative boundary
   hypotheses displayed. The simply connected smooth h-cobordism theorem
   alone does not supply this general group case. This ordinary PL engine
   and its finite-cover comparisons precede Layer2's high-dimensional stable
   homeomorphism/annulus proof and use no TOP annulus or TOP handle theorem.
   **3d.1. TOP straightening and the TOP/PL fiber.** Consume Layer2's
   proved high-dimensional annulus/stable-homeomorphism targets and Layer1's
   single punctured-torus immersion. Prove the controlled
   handle-straightening and torus-unfurling lemmas, the standard covering
   pullbacks of their obstruction cochains and the realization detecting
   the surviving mod2 class, then the stabilization comparison
   π_k(TOP_m/PL_m)→π_k(topPLFiber) for k<m and m>5. Prove
   `topPLFiber_isEMThree`: the stable fiber is K(ℤ/2,3), with chosen
   nonzero π₃ generator, all other homotopy groups zero and the ordinary
   universal-class comparison through AT8's single EM models. Prove the
   PL product-structure and concordance-implies-isotopy theorems for
   m≥6, or m=5 with ∂M contained in the specified near-C region U,
   from this same engine. Keep the actual extension fixed on a smaller
   neighborhood of C, and distinguish this structure isotopy from a claim
   about arbitrary concordant self-homeomorphisms.

   **3e. Kirby–Siebenmann class and PL structures.** Define the universal
   class ks∈H⁴(BTOP;ℤ/2) as the obstruction to lifting through BPL,
   using AT8's local-coefficient primary obstruction cochain and the chosen
   fiber generator. Its pullback is `kirbySiebenmannClass M`; include
   relative classes when a PL structure is specified near a closed C,
   naturality under homeomorphisms, products with Euclidean spaces,
   boundary restriction, and vanishing under an actual PL reduction.
   For dimension m≥6, or m=5 with ∂M contained in that specified region,
   prove `plStructure_exists_iff_ks_eq_zero` for extension of the prescribed
   PL atlas. When an extension is chosen, prove
   `plStructureConcordanceTorsor` under H³(M,C;ℤ/2), with actual addition,
   difference, realization and zero-class relative-concordance statements.
   State this first on concordance classes; use the proved isotopy theorem
   for its applicable manifold-structure comparison. This class is defined
   in every dimension, but these existence/classification equivalences
   are not asserted for four-manifolds. Construct the exotic high-dimensional
   homotopy tori and the resulting distinct PL structures on the same
   topological manifold that witness failure of the manifold Hauptvermutung.

   Define ordinary normal transversality for N⊂W to (M,ν) by local
   transverse product charts at P=M∩N and N=ν⁻¹(P) as neighborhood germs;
   ν restricted to N is the actual inverse-image normal microbundle. For
   f:N→W require a locally flat P=f⁻¹(M) with an actual normal microbundle
   and a morphism of its neighborhood germ into (M,ν), over f|P,
   identifying the normal fiber germs homeomorphically and with zero section
   f|P. Include restriction and relative collar diagrams.
   The stable notions below stabilize exactly these ordinary data.
   Own `ksSubmanifoldTransversality` for locally flat P^p and Q^(N−q)
   in a TOP N-manifold with the specified actual target normal microbundle,
   N≠4. The exceptional cases are expected intersection dimension4,
   and a four-dimensional submanifold when the other has codimension1 or2.
   Outside those cases construct the transverse ambient isotopy, inverse-image
   normal data and relative boundary comparisons, using the
   Kirby–Siebenmann EssayIII handle proof. Parameter forms concern the total
   map on parameter×domain, with these total-dimension inequalities and
   already-transverse parameter-boundary data. In particular p=4,q≥3 and
   p−q≠4 is in this submanifold range. The graph adapter of3b then supplies
   map comparisons; Four owns the remaining four-dimensional steps.
   Own KS-range TOP map transversality with specified normal microbundle
   data: domain dimension m and expected preimage dimension
   m−q must both differ from4. Construct a transverse locally flat
   inverse-image manifold, its normal pullback and boundary/relative
   parameter comparisons from the product-structure theorem. In the relative
   boundary form take already transverse boundary data as a hypothesis,
   including its actual normal chart and collar; constructing a dimension4
   boundary preimage is not a prerequisite of this theorem. Four F3.1c
   supplies such data in its applications. This supplies the dimension5
   normal-bordism preimage case; Four owns the exceptional preimage4 map
   theorem, with no return dependency in this construction.

   **3e.0. Relative geometric inputs to stable transversality.** Before
   the stable-germ construction, own the following local geometric interfaces.
   Use TOP manifolds with their fixed metric, locally flat submanifolds,
   actual neighborhood germs and normal retractions; retain the PL charts
   where specified. A relative statement fixes a neighborhood of its closed
   relative subset, with smaller neighborhoods used for compatible gluings.

   * `marinRelativeTriangulation` is the codimension≥3 Miller
     triangulation interface used in Marin AppendixB LemmaB.1. On the
     local flat-chart configuration P⊂M,N⊂W with both codimensions≥3,
     and a stabilized transverse germ M in W×ℝ^v already lying in W
     near closed C, construct a PL structure ω on the ambient chart W
     in which N is PL and the prescribed already-PL subpolyhedron is
     unchanged. Construct an ambient isotopy of W×ℝ^v fixing N×ℝ^v,
     relative to C and the complement of the chosen neighborhood V of D,
     making the germ M PL locally transverse to N×ℝ^v near C∪D.
     The input embeddings M∪N→W and M∪(N×ℝ^v)→W×ℝ^v carry
     the actual locally unknotted pair/link charts and the already-PL
     restriction near C; construct these data from the transverse local
     models. Prove the relative compatibility of the two triangulations.
     Use Miller's codimension≥3 triangulation of embeddings, as applied
     in Kirby–Siebenmann EssayIII AppendixB and Marin LemmaB.1. This
     is a local embedding-triangulation theorem, not a PL structure on an
     arbitrary TOP manifold or a general locally flat conclusion for PL maps.

   * `marinRelativeBlockEmbedding` owns the Casson–Sullivan step in
     Marin AppendixB's proof of Theorem2.3. Subdivide the just-triangulated
     local configuration simultaneously in W×ℝ^v, W, N×ℝ^v, N, M
     and P, and construct their actual dual normal blocks over the simplices
     of P, with all face and transverse-sum identifications. In the induction
     over a (k+1)-simplex, construct the relative embedding replacement of
     the displayed homotopy equivalence
     g:Ê_M×I→(Ê_(W×ℝ^v)−Ê_(N×ℝ^v))×I,
     agreeing with the already embedded k-skeleton and the time-zero
     inclusion. Here Ê denotes the fibre-sphere boundary of the corresponding
     normal block over that simplex; its base-face boundaries remain
     separate relative data. Retain the boundary/collar pair,
     normal and Poincaré-embedding data of that configuration, and verify
     the codimension≥3 hypotheses of the Casson–Sullivan embedding
     argument in Wall, Chapter11. Construct those data and their required
     relative comparisons from the dual blocks, as part of this target.
     Cone the replacement successively over the terminal face and the
     block interior as in Marin's induction, and prove agreement on faces
     and on the fixed data. This proves the relative stable-germ
     destabilization/concordance theorem2.3 when w−m≥3 and w−n≥3.
     Own the same relative Poincaré-embedding argument for Marin B.3
     when it is used for transverse-germ spaces. A bare map or an arbitrary
     homotopy equivalence in codimension≥3 is not this input datum.

   * `topologicalNeighborhoodConcordanceExtension` is Marin's TOP
     Lickorish–Siebenmann Theorem2.4. Let Q be a TOP manifold with
     boundary and K a closed locally unknotted topological polyhedron in
     ∂Q. Use the local pair condition of Marin p.276: the pair is locally
     Euclidean/polyhedral and the link complements have free fundamental
     group. This includes a manifold and the union of a manifold with its
     transverse germ after verifying that condition. A concordance
     f:K×I→Q is an embedding locally unknotted along I: every (x,t)
     has a neighborhood U_x×V_t and an extension to an open embedding
     P_x×V_t→Q, for a manifold P_x containing U_x. With the initial-end
     marking f(k,0)=k, retain f⁻¹(∂Q)=K×{0,1}∪L×I for its specified
     closed side subset L⊂K and the corresponding boundary collars.
     An arbitrary levelwise family is not this concordance carrier. For closed
     C⊂K and a neighborhood U of C in ∂Q, take a concordance F:U×I→Q
     extending f near C×I. If dim Q≥7, or dim Q=6 and either
     codim(K,∂Q)≥3 or K is a manifold, construct a neighborhood U₁ of K
     in ∂Q and a concordance F₁:U₁×I→Q extending f and equal to F
     near C×I. Retain the actual end/side restrictions and shrinking maps.
     Prove the local-to-global strongly relative form and the compact-support
     localization used by the transversality proof.

     In the codimension≥3 case construct the proof through local
     triangulation, the earlier product-structure comparison and the
     PL Lickorish–Siebenmann regular-neighborhood concordance extension.
     Construct the PL neighborhood inputs here from Layer11's simplicial,
     locally finite subdivision, link and collapse machinery. For a closed
     subpolyhedron K of a triangulated PL manifold, choose controlled
     subdivisions and the derived closed-star neighborhood, prove it is a
     codimension0 PL manifold neighborhood with its actual frontier and
     frontier collar, and construct its collapse/mapping-cylinder comparison
     to K. For noncompact K use locally finite subdivisions and compatible
     compact exhaustions; do not assert a finite global collapse. Include
     collared boundary pairs, the actual side subpolyhedron, and prescribed
     neighborhood data near closed C, unchanged near C after shrinking.
     Prove relative uniqueness of these neighborhoods by PL ambient
     isotopy, fixed near C and outside a prescribed neighborhood of K,
     with the frontier/collar and restriction comparisons. Construct the
     cylinder comparison for a regular neighborhood of the actual locally
     unknotted PL concordance K×I in Q, product on its prescribed end/side
     and near-C data. Deduce the PL neighborhood-concordance extension
     with its actual neighborhood maps and these same relative controls,
     following the Lickorish–Siebenmann/Rourke–Sanderson neighborhood
     construction. K is a general subpolyhedron, not assumed a locally flat
     manifold or the zero section of a normal bundle; only the concordance
     and pair hypotheses stated for this application are used. This local
     neighborhood construction precedes its TOP application.

     For K a manifold in the remaining cases with dim Q≥6, own the
     TOP neighborhood-concordance construction of Rourke–Sanderson,
     *On topological neighbourhoods*, Compositio Math.22 (1970),387–424,
     as used for the manifold case in Marin's discussion of Theorem2.4.
     On the actual locally unknotted concordance K×I→Q, construct
     the neighborhood germ extension and its cylinder/restriction maps,
     with the prescribed end and side collars, agreement with F near C×I
     after shrinking, and the relative gluing/compact-support localization
     used below. Establish this TOP construction and its relative controls
     before applying the extension theorem in the manifold case. K remains
     a TOP manifold with its given charts: no compatible PL structure on K,
     including a dimension4 K, or ordinary normal bundle is inferred.
     The general polyhedral version in dim Q=6 remains restricted to
     codimension≥3, as in the preceding local-triangulation branch.

     For the general locally unknotted polyhedron case in dim Q≥7, construct
     the required TOP regular neighborhoods with proper cone-like
     retractions, formal boundary and relative mapping-cylinder comparison
     of Edwards, and apply Marin AppendixA. Retain the collared side
     polyhedron when boundary faces are present. Prove the relative tube
     restriction and the cylinder identification fixing the spine and formal
     boundary, then the neighborhood extension. These are the particular
     TOP neighborhood targets consumed here, separate from PL block bundles.

   In Marin's proof of Theorem1.2 identify each use: Theorem2.4 localizes
   the normal-germ concordance to compact support, thickens the concordance
   on I×M to a neighborhood, and extends the concordance on I×(M∪N)
   while fixing I×N. Display Q, K, C and their end/side collars in each
   application, including each added interval and stabilization coordinate.
   Verify dim Q and codim K on those total spaces before invoking the
   extension theorem. In the main m≥5, both-codimension≥3 branch the
   relevant ambient concordance dimensions are at least7; handle m=3,4
   by the local triangulation cases of Marin §3 and AppendixD, retaining
   the preimage-dimension exceptions. Prove the locally finite patching
   with supports in V and displacement bounded by the given positive
   continuous control, fixed near C and outside V. Parameter/relative-face
   versions use compatible total-space charts and their total dimensions.
   These constructions consume the earlier ordinary PL engine, TOP product
   structure and the specified local embedding/neighborhood inputs. They
   use no FourManifolds exceptional transversality or classification output.

   Also own Marin's stable version on the actual stabilized microbundle
   germs, not arbitrary block bundles or open regular neighborhoods. For a
   locally flat M⊂W, a stable normal germ is a normal microbundle retraction
   η in W×ℝ^v near M×0, with further-stabilization and relative-concordance
   identifications. Define stable transverse N by local transverse charts at
   P=M∩N and η⁻¹(P)=N×ℝ^v as germs. For a map f:N→W require a locally flat
   P=f⁻¹(M) and a homotopy F_t of f×id_(ℝ^v) with
   F_t⁻¹(M×0)=P×0 at every time, to an actual morphism of stable normal microbundle germs over f|P. Construct
   stable-germ existence/uniqueness, relative symmetry and the ambient normal
   comparison using3e.0's relative triangulation, block-embedding and TOP
   neighborhood-concordance extension, together with the earlier ordinary
   normal-microbundle homotopy/uniqueness. Then construct
   `marinStableMapTransversality` with support/control
   and already-transverse relative data. For target codimension q≥3 use
   Marin Theorem1.7 with expected preimage dimension n−q≠4; the domain
   dimension n may equal4. For q=1,2 use the preceding ordinary KS range
   (domain n≠4 and n−q≠4), stabilize its normal data and use relative
   stable-germ uniqueness. The q=2 construction excludes ambient target
   dimension4, whose normal supplier is owned by Four. Codimension q=1
   in every ambient dimension, and q=2 in ambient dimension≠4, consume
   3b's low-codimension construction.
   Codimension0 is the open inverse-image/zero-normal case. No codimension1–2
   case is attributed to Marin's codimension≥3 theorems. Follow Marin, *La transversalité topologique*, Ann.Math.106
   (1977),269–293, Definitions1.1/1.6, Theorems1.2–1.7 and the stability
   construction2.3 ([primary text](https://www.numdam.org/item/BJHTUP11_1979__2205__A2_0.pdf)).
   Four's dimension4 modification supplies the exceptional stable version
   after its ordinary microbundle theorem. A block presentation on a
   triangulated base enters only through a separately supplied comparison
   with this actual stable normal germ; an open regular neighborhood alone
   is not transversality input.

   Export `compactTopologicalManifoldFiniteCWType` here, including the
   boundary pair, as an actual finite-CW homotopy equivalence. Prove the
   compact finiteness theorem of Kirby–Siebenmann Annex2 by the stable
   high-dimensional TOP handle theorem owned here. For a compact TOP
   m-manifold of any fundamental group choose k with m+k≥6, construct
   the TOP handlebody of M×D^k (rounding product corners through the
   fixed collar), and prove finite CW type by its handle-core cofibration
   maps and AT4. Prove the relative boundary/marked-point version and
   transfer through M×D^k≃M. Build the dimension≥6 TOP handle theorem
   from controlled chart/annulus/torus straightening and TOP transversality
   in this range, with arbitrary π₁, fixed side collars and normal
   block/microbundle comparisons. This stabilization proof precedes
   dimension4 surgery.
   Give homology finite generation and finite marked-point relative forms;
   finite domination alone is not asserted to imply finite CW type.

   **3f. Topological orientation and characteristic comparison.** Build
   the fiberwise one-point compactification and mod2 Thom class of a
   numerable TOP(n)-bundle using its local compact-support generators;
   TOP(n) need not preserve a chosen round ball. Consume AT's relative
   cochains/products and TangentialBordism B4.1–2's foundational cup-i/Sq
   operations, before its manifold/Wu or coefficient applications,
   to define its Stiefel–Whitney classes by the Thom identity. Prove
   naturality, Whitney sums, stabilization and comparison with CC's linear
   classes through BO→BTOP. Define the stable oriented topological-spin
   classifier as the homotopy fiber of w₂:BTOP⁺→K(ℤ/2,2), and export
   the obstruction, H¹ torsor of chosen lifts and smooth Spin reduction
   comparison. A topological-spin structure on a non-PL four-manifold is
   this stable lift, without an SO frame bundle or a Lie Spin principal lift.

   **3g. Low-dimensional and Euclidean uniqueness.** Own the Moise
   existence/uniqueness comparison, independently of items3d–3f, for
   Hausdorff second-countable TOP
   manifolds of dimensions≤3, including boundary collars: a PL atlas
   exists, PL atlases are equivalent under an ambient isotopy in the
   stated relative setting, and their smoothings yield the same
   diffeomorphism class. Construct the triangulation/straightening and
   smoothing maps; a homeomorphism is compared with a PL/smooth
   representative through approximation and isotopy, not asserted smooth.
   Include the relative forms with the structure specified on an open
   neighborhood of a closed compact subset and the comparisons fixed on
   a smaller neighborhood.
   This strengthens Layer11's unstructured triangulation statement.
   Independently of item3d's surgery, construct compatible smooth atlases
   on PL manifolds of dimensions≤6, including boundary collars and a prescribed
   smoothing on a neighborhood of a closed subset. Own the Whitehead
   smooth-triangulation→compatible PL-atlas comparison from item1, including
   tangent microbundles and prescribed boundary charts. Own the local simplex/
   link smoothing obstruction and its relative extension/uniqueness
   argument of Cairns–Munkres in these dimensions, with actual chart
   transition smoothing and comparison to Layer1's native smooth groupoid.
   Own the stable relative smoothing comparison π_i(PL/O)=0 for 0≤i≤6.
   Before applying its low-link obstruction calculation, own path-connectedness
   of Diff⁺(S¹) and Diff⁺(S²), including the explicit O(2)/O(3) inclusion
   comparisons (rotation isotopy and Smale's sphere theorem). Own the actual
   Cerf component theorem π₀Diff⁺(S³)=0 on Layer3's C∞ carrier, with the
   relative disk/sphere extension argument of Cerf's Théorème1; derive
   Γ₄=0 from this component theorem. Also own the full Hatcher homotopy
   equivalence O(4)→Diff(S³), whose forward map is the canonical orthogonal
   action. Prove contractibility of Diff(D³ rel a boundary collar) by the
   parametric sphere/disc-straightening theorem in Hatcher's proof, including
   finite parameter families and their prescribed parameter-boundary data.
   Use Layer3's isotopy-extension fibration to restrict a sphere diffeomorphism
   to a marked embedded3-disc. Compare its fiber (diffeomorphisms fixing
   that disc, with their smooth boundary jets) with Diff(D³ rel an open
   boundary collar) by parametric collar straightening; these are not
   identified as literal groups. Compare that embedding space with the point/
   tangent-frame space by shrinking the disc, its derivative and polar frame
   normalization; identify the latter with O(4). Prove the weak equivalence,
   the C∞ mapping/diffeomorphism spaces' CW type, and its actual homotopy
   inverse/homotopies by AT Whitehead. Follow Hatcher, *A proof of the Smale
   conjecture, Diff(S³)≃O(4)*, Ann. Math.117 (1983),553–607,
   [primary paper](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConj.pdf).
   The Γ₄ argument consumes Cerf's component theorem; the full parametric
   homotopy equivalence is a separate target on the same carrier.
   Define Γ_i, i≥2, as the Cerf
   cokernel of restriction of orientation-preserving marked disk
   diffeomorphisms to the boundary sphere, on the appropriate components.
   Build the gluing map Γ_i→Θ_i and its isomorphism for i≥5 by the
   [HomotopySpheres PR284](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284)
   Stage1.7's proposed dimension≥6 simply connected smooth
   h-cobordism theorem and marked
   PL sphere comparison. In dimensions3–6 own the comparison with the
   relative simplex/link smoothing obstruction π_i(PL/O); dimensions0–2
   use the direct chart/link smoothing. Consume HomotopySpheres §6C/§9's
   exact sequence and low-stem calculation to prove Θ₅=Θ₆=0. Retain actual
   generators, stabilization and boundary-marking maps before using these
   vanishings in item3d's G/O comparison. No theorem about π₀(Diff S⁴)
   is assumed.
   This supplies the PL4 smoothing used when applying analytic Rokhlin
   and the PL5/6 smoothing comparisons used by Four's controlled argument;
   it supplies no smoothing of a TOP4 manifold without a PL atlas.
   Own Stallings' smooth Euclidean-space theorem for n≥5: a connected
   boundaryless smooth n-manifold that is contractible and simply connected
   at infinity is diffeomorphic to ℝⁿ. Consume AT8.5's single
   `SimplyConnectedAtInfinity` predicate and its compact-exhaustion
   independence and proper-homotopy invariance.
   Prove the PL engulfing/cell exhaustion and the Euclidean PL-to-smooth comparison
   of Munkres' Corollary6.6 used in the theorem. Their relative cell maps
   and smoothing comparisons are owned here; the proof is Stallings'
   Theorems4 and5.1, [primary paper](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/stallings2.pdf).
   Apply it to any smooth manifold homeomorphic to ℝⁿ. Combine it with
   the n≤3 comparison (and the n=0 point case) to export
   `euclideanSmoothStructure_unique_of_dimension_ne_four`. FourManifolds
   owns the dimension4 counterexample; no smooth-four-sphere conclusion
   is used in these other-dimensional comparisons.

   Kirby–Siebenmann, *Foundational Essays*, Essays I and IV–V and Annex2,
   provide the handle/product/classification proof spine; the exact relative
   and dimension hypotheses and the stable fiber computation are in the
   [existing extract](references/ks-triangulation-obstruction.md).

## Acceptance criteria (checks along the way)

Concrete checks that rule out vacuous or mis-stated definitions:

- **Gluing computes.** `S³` presented as two solid tori glued along their boundary, and
  `S^n # S^n ≃ S^n` (connected sum with a sphere is trivial): both should be theorems, not
  just definitions, on the layer-1 API.
- **Knot theory is not vacuous.** The Alexander polynomial of the trefoil and the
  figure-eight match their known values (`t − 1 + t⁻¹` and `−t + 3 − t⁻¹`), computed by the
  layer-4 algorithm from a braid word or Seifert matrix; the unknot is smoothly slice; the
  trefoil is not; and a presentation-changing map (a braid closes to a diagram) is checked
  on a small example. The convention table is pinned by these.
- **Surgery recovers known manifolds.** `0`-surgery and `∞`-surgery on the unknot give
  `S¹ × S²` and `S³` respectively; `(p/q)`-surgery on the unknot gives the lens space
  `L(p, q)`. These pin down the layer-5 slope-and-gluing conventions.
- **The diffeomorphism-group topology is non-trivial.** `π₀ Diff(S³)` and the inclusion
  `O(4) → Diff(S³)` are stateable, and the Smale-conjecture target elaborates (layer 3).
- **Volume is an invariant.** The hyperbolic volume of a closed hyperbolic 3-manifold is
  well-defined and isometry-invariant, and the Weeks-manifold target elaborates (layer 7).
- **Realization round-trips.** The geometric realization of the boundary of the standard
  `n`-simplex is homeomorphic to `S^{n-1}` (layer 11), reusing the simplicial-set
  realization where possible.
- **Statements, not vacuities.** Each Kirby target above elaborates against the layer it
  is attached to, with the hypotheses unbundled, and is not provable by `rfl` or
  vacuously true (spot-check by negating a hypothesis and confirming the statement
  changes).

## References

The problem list, then the standard text and the resolving paper for each layer, with
section or theorem numbers where a contributor would actually look. The recent resolving
papers were checked against the literature when this roadmap was written; the textbook
references are at chapter or section granularity rather than edition-specific page numbers.
Direct links are given wherever a source is freely and legitimately available online (arXiv,
author pages, and open repositories), so an agent can fetch it. For the in-copyright books,
[`references/`](references/) holds a fair-use extract per cited result (a summary plus the
essential statements quoted with attribution and an exact locator); those are linked as
*[extract]* below.

- R. Kirby (ed.), *Problems in Low-Dimensional Topology*, in *Geometric Topology*
  (AMS/IP Stud. Adv. Math. 2.2, 1997): the source problem list `[Kir97]`; verbatim statements
  of every cited problem are in [references/kirby-problems.md](references/kirby-problems.md).
- Freely available 3-manifold background, useful across layers 5, 8, and 9: A. Hatcher,
  *Notes on Basic 3-Manifold Topology* (prime and torus decomposition, surgery basics),
  [pi.math.cornell.edu/~hatcher/3M/3M.pdf](https://pi.math.cornell.edu/~hatcher/3M/3M.pdf).

*Layer 1 (manifold buildout, gluing, structure groups).*
- M. Hirsch, *Differential Topology*, Springer GTM 33 (1976): the smooth-gluing toolkit,
  with precise statements: collars (Theorem 6.1,
  [extract](references/hirsch-collar.md)), tubular neighbourhoods (Theorem 6.3, isotopy
  uniqueness 5.3/6.5, [extract](references/hirsch-tubular-neighbourhood.md)), the disc theorem
  behind well-defined connected sum (Chapter 4 §6, Theorem 6.6,
  [extract](references/hirsch-disc-theorem.md)), and the weak and strong function-space
  topologies used in layer 3 (Chapter 2,
  [extract](references/hirsch-smooth-map-topologies.md)). J. Lee, *Introduction to Smooth
  Manifolds*, Springer GTM 218, 2nd ed. (2013), the same material at a gentler pace (collars,
  Theorem 9.25, [extract](references/lee-smooth-collar.md); tubular neighbourhoods, Theorem
  6.24, [extract](references/lee-smooth-tubular.md)).
- J. Lee, *Introduction to Riemannian Manifolds*, Springer GTM 176, 2nd ed.
  (2018), Theorem 5.25 and equations (5.21)–(5.24), pp. 133–135:
  the normal-exponential and positive-radius proof for arbitrary embedded
  submanifolds, [extract](references/lee-riemannian-tubular.md).
- R. Palais, *Extending diffeomorphisms*, Proc. Amer. Math. Soc. 11 (1960) 274–277: the
  isotopy uniqueness of ball embeddings, used for connected-sum well-definedness.
- C. Rourke, B. Sanderson, *Introduction to Piecewise-Linear Topology*, Springer (1972):
  the PL foundations shared with layer 11 (PL maps and polyhedra, Chapters 1–2,
  [extract](references/rs-pl-maps-and-polyhedra.md); the combinatorial-manifold link
  condition, regular neighbourhoods, and collapse, Chapter 3,
  [extract](references/rs-regular-neighbourhoods-and-collapse.md)); J. Hudson, *Piecewise
  Linear Topology*, Benjamin (1969), [extract](references/hudson-pl-topology.md).
- J. H. C. Whitehead, *On C¹-complexes*, Ann. of Math. 41 (1940) 809–824, and J. Munkres,
  *Elementary Differential Topology* (Annals of Math. Studies 54, 1966): the smooth-implies-PL
  half of the smoothing comparison (existence and uniqueness of smoothings, Munkres Theorems
  10.6 and 10.5, [extract](references/munkres-smoothing-triangulations.md)). R. Kirby, L.
  Siebenmann, *Foundational Essays on Topological Manifolds, Smoothings, and Triangulations*
  (Annals of Math. Studies 88, 1977): the Top-to-PL obstruction in `H⁴(M; ℤ/2)` and the
  failure of the Hauptvermutung ([extract](references/ks-triangulation-obstruction.md)).

*Layer 2 (locally flat embeddings).*
- R. Daverman, G. Venema, *Embeddings in Manifolds*, AMS GSM 106 (2009): the general theory
  of locally flat (and wild) embeddings (a scanned copy is on the Ranicki archive,
  [webhomes.maths.ed.ac.uk/~v1ranick/papers/davenema.pdf](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/davenema.pdf)).
- M. Brown, *Locally flat imbeddings of topological manifolds*, Ann. of Math. 75 (1962)
  331–341: the collaring theorem that the Annulus Conjecture rests on.
- R. Kirby, *Stable homeomorphisms and the annulus conjecture*, Ann. of Math. 89 (1969)
  575–582 (dimension `≥ 5`); F. Quinn, *Ends of maps III: dimensions 4 and 5*, J.
  Differential Geom. 17 (1982) (dimension 4); M. Freedman, F. Quinn, *Topology of
  4-Manifolds*, Princeton (1990), for dimension-4 local flatness.

*Layer 3 (diffeomorphism groups).*
- J. Cerf, *Sur les difféomorphismes de la sphère de dimension trois (Γ₄ = 0)*, Springer
  LNM 53 (1968): `Γ₄ = 0` and `π₀(Diff S³) = 0` (Théorème 1),
  [extract](references/cerf-gamma4.md).
- A. Hatcher, *A proof of the Smale conjecture, `Diff(S³) ≃ O(4)`*, Ann. of Math. 117
  (1983), `[Kir97, 4.34]`; T. Watanabe, *Some exotic nontrivial elements of the rational
  homotopy groups of `Diff(S⁴)`*, [arXiv:1812.02448](https://arxiv.org/abs/1812.02448), the
  4-dimensional disproof, `[Kir97, 4.126]`.

*Layer 4 (knot theory).*
- W. B. R. Lickorish, *An Introduction to Knot Theory*, Springer GTM 175 (1997): the spine.
  Reidemeister's theorem (Chapter 1, [extract](references/lickorish-reidemeister.md)); the
  Kauffman bracket and the Jones polynomial (both Chapter 3,
  [extract](references/lickorish-jones.md)); the Alexander polynomial via the Seifert matrix,
  with the Conway normalisation (Chapters 6 and 8,
  [extract](references/lickorish-alexander.md)); braids (Chapter 1) and the Alexander–Markov
  theorem (Proposition 16.10, [extract](references/lickorish-braids-markov.md)); and knot
  cobordism with the signature (Chapter 8, where Lickorish writes "cobordant" rather than
  "concordant", [extract](references/lickorish-concordance.md)). G. Burde, H. Zieschang,
  *Knots*, 2nd ed., de Gruyter (2003): knot foundations and Seifert matrices,
  [extract](references/bz-knot-foundations.md).
- L. Kauffman, *State models and the Jones polynomial*, Topology 26 (1987) 395–407 (the
  bracket); P. Freyd, D. Yetter, J. Hoste, W. Lickorish, K. Millett, A. Ocneanu, *A new
  polynomial invariant of knots and links*, Bull. AMS 12 (1985) 239–246 (HOMFLY).
- J. Birman, *Braids, Links, and Mapping Class Groups*, Annals of Mathematics Studies 82,
  Princeton (1974): the braid-to-diagram correspondence (Markov's theorem) and the Burau
  representation behind one of the Alexander algorithms.
- L. Piccirillo, *The Conway knot is not slice*, Ann. of Math. 191 (2020),
  [arXiv:1808.02923](https://arxiv.org/abs/1808.02923), `[Kir97, 1.41]`; M. Freedman, *The
  topology of four-dimensional manifolds*, J. Differential Geom. 17 (1982), and
  Freedman–Quinn (above): Alexander-polynomial-one knots are topologically slice (Theorem
  11.11, [extract](references/fq-topological-slice.md)), `[Kir97, 1.36]`.

*Layer 5 (Dehn surgery).*
- D. Rolfsen, *Knots and Links*, Publish or Perish (1976), Chapter 9 (Dehn surgery, slopes,
  lens spaces, and the Lickorish–Wallace theorem,
  [extract](references/rolfsen-dehn-surgery.md)); R. Gompf, A. Stipsicz, *4-Manifolds and
  Kirby Calculus*, AMS GSM 20 (1999), Chapters 4–5 (handles, framings, Dehn surgery,
  [extract](references/gs-kirby-calculus.md)).
- P. Kronheimer, T. Mrowka, *Witten's conjecture and Property P*, Geom. Topol. 8 (2004)
  295–310, [arXiv:math/0311489](https://arxiv.org/abs/math/0311489), `[Kir97, 1.15]`; D.
  Gabai, *Foliations and the topology of 3-manifolds III*, J. Differential Geom. 26 (1987)
  479–536, for Property R, `[Kir97, 1.82]`.

*Layer 6 (concordance and cobordism).*
- C. Livingston, *A survey of classical knot concordance*,
  [arXiv:math/0307077](https://arxiv.org/abs/math/0307077) (Handbook of Knot Theory, 2005):
  the concordance group and the signature invariants (after Tristram 1969, Levine 1969).
- The Conway and Kinoshita–Terasaka pair, mutants with different smooth concordance type via
  Piccirillo (above), `[Kir97, 1.53]`; A. S. Levine, *Nonsurjective satellite operators and
  piecewise-linear concordance*, Forum Math. Sigma 4 (2016) e34, a knot in a homology sphere
  not smoothly concordant to any knot in `S³`, `[Kir97, 1.31]`.

*Layer 7 (Riemannian volume, hyperbolic structures).*
- J. Lee, *Introduction to Riemannian Manifolds*, Springer GTM 176, 2nd ed. (2018):
  curvature and the Riemannian volume form
  ([extract](references/lee-riemannian-volume-curvature.md)); W. Thurston, *Three-Dimensional
  Geometry and Topology, Vol. 1*, Princeton (1997), for (G,X)- and hyperbolic structures
  ([extract](references/thurston-hyperbolic-structures.md)), and J. Ratcliffe, *Foundations of
  Hyperbolic Manifolds*, Springer GTM 149 (3rd ed., 2019), for Mostow rigidity (Theorem
  11.8.5) and hyperbolic volume ([extract](references/ratcliffe-mostow-rigidity.md)).
  Thurston's 1978–80 Princeton notes, *The Geometry and Topology of Three-Manifolds*, cover
  the same hyperbolic material and are freely downloadable from SLMath,
  [library.slmath.org/nonmsri/gt3m](https://library.slmath.org/nonmsri/gt3m/).
- I. Agol, *The virtual Haken conjecture* (appendix with Groves and Manning), Doc. Math. 18
  (2013), [arXiv:1204.2810](https://arxiv.org/abs/1204.2810), `[Kir97, 3.51]`; D. Gabai, R.
  Meyerhoff, P. Milley, *Minimum volume cusped hyperbolic three-manifolds*, J. Amer. Math.
  Soc. 22 (2009), [arXiv:0705.4325](https://arxiv.org/abs/0705.4325), with the closed case
  (the Weeks manifold) in *Mom technology and hyperbolic 3-manifolds*,
  [arXiv:0910.5043](https://arxiv.org/abs/0910.5043), `[Kir97, 3.60]`.

*Layer 8 (geometric decomposition).*
- P. Scott, *The geometries of 3-manifolds*, Bull. London Math. Soc. 15 (1983) 401–487: the
  canonical account of the eight model geometries.
- G. Perelman, [arXiv:math/0211159](https://arxiv.org/abs/math/0211159),
  [arXiv:math/0303109](https://arxiv.org/abs/math/0303109),
  [arXiv:math/0307245](https://arxiv.org/abs/math/0307245); J. Morgan, G. Tian, *Ricci Flow
  and the Poincaré Conjecture*, Clay Math. Monographs 3 (2007), full text at
  [arXiv:math/0607607](https://arxiv.org/abs/math/0607607): Geometrization, `[Kir97, 3.45]`.

*Layer 9 (Heegaard genus).*
- M. Scharlemann, *Heegaard splittings of compact 3-manifolds*,
  [arXiv:math/0007144](https://arxiv.org/abs/math/0007144) (Handbook of Geometric Topology,
  2002).
- T. Li, *Rank and genus of 3-manifolds*, J. Amer. Math. Soc. 26 (2013) 777–829,
  [arXiv:1106.6302](https://arxiv.org/abs/1106.6302): the disproof of Waldhausen's
  rank-versus-genus conjecture.

*Layer 10 (foliations and the Euler class).*
- D. Calegari, *Foliations and the Geometry of 3-Manifolds*, Oxford (2007), freely available
  on the author's page,
  [math.uchicago.edu/~dannyc/books/foliations/oupbook.pdf](https://math.uchicago.edu/~dannyc/books/foliations/oupbook.pdf);
  A. Candel, L. Conlon, *Foliations I–II*, AMS GSM 23 and 60, for foliations, leaves, and
  tautness ([extract](references/candel-conlon-foliations.md)); W. Thurston, *A norm for the
  homology of 3-manifolds*, Mem. Amer. Math. Soc. 59 (1986).
- D. Gabai, M. Yazdi, *On Thurston's Euler class-one conjecture*, Acta Math. 225 (2020),
  [arXiv:1603.03822](https://arxiv.org/abs/1603.03822): the disproof.

*Layer 11 (triangulations, PL structures, collapse).*
- E. Moise, *Geometric Topology in Dimensions 2 and 3*, Springer GTM 47 (1977): triangulation
  and the Hauptvermutung in dimension 3 (Theorems 35.3 and 36.2,
  [extract](references/moise-triangulation-dim3.md)); Rourke–Sanderson Chapter 3 (collapse,
  [extract](references/rs-regular-neighbourhoods-and-collapse.md)) and Kirby–Siebenmann (both
  above).
- C. Manolescu, *Pin(2)-equivariant Seiberg–Witten Floer homology and the triangulation
  conjecture*, J. Amer. Math. Soc. 29 (2016),
  [arXiv:1303.2354](https://arxiv.org/abs/1303.2354), with the survey *Lectures on the
  triangulation conjecture*, [arXiv:1607.08163](https://arxiv.org/abs/1607.08163); E. C.
  Zeeman, *On the dunce hat*, Topology 2 (1964) 341–358, `[Kir97, 5.2]`.

A contributor expanding a layer should still attach the precise theorem reference for each
statement they make (and the relevant Kirby-list successor entry where one exists); the
list above is the entry point, not a substitute.

## How to drive it

Layers 1, 2, and 3 can start immediately and independently against current Mathlib: they
are the high-leverage substrate, and each is reusable library infrastructure on its own.
Layer 1 is the spine almost everything else waits on, so push it first; layers 2 and 3 are
genuinely parallel on-ramps. Layer 4 (knot theory) is a substantial subproject that can
also start immediately and is owned here; layer 5 (Dehn surgery) follows layer 1 and layer
4's knot types, and layer 6 (concordance) follows layer 4. Layers 7 and 8 share a
Riemannian substrate and should be planned together, after the layer-7 volume measure
lands. Layers 9, 10, and 11 are independent of each other and can begin once layer 1's
handlebody and tangent-field API exists. The homological concordance invariants (`τ`, `s`)
are coordinated with the combinatorial Heegaard Floer roadmap, which consumes layer 4's
knot types in return.

## Acknowledgements

This roadmap grew out of walking the Kirby problem list while building the topology
problems in [`leanprover/lean-eval`](https://github.com/leanprover/lean-eval), and out of
the design discussions behind the
[combinatorial Heegaard Floer roadmap](../CombinatorialHeegaardFloer/README.md), whose
knot-theory and concordance lanes it consumes. Thanks to everyone who contributed to those
discussions on the [Lean Zulip](https://leanprover.zulipchat.com/).
