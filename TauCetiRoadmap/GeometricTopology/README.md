# Roadmap: geometric topology and the solved Kirby-list problems

Rob Kirby's problem list (`[Kir97]`, *Problems in Low-Dimensional Topology*) and its
successors hold many problems since **solved** (sometimes by proving the negation of
Kirby's question). Walking that list while building the
[`leanprover/lean-eval`](https://github.com/leanprover/lean-eval) topology problems raises a
narrower question than "can we prove this": can we even *state* the resolved theorem in Lean
today? For a good fraction the answer is no, not because the proof is hard but because the
*statement* needs primitives Mathlib lacks: Dehn surgery, knot concordance, hyperbolic
volume, Heegaard genus, foliation Euler classes, locally flat embeddings,
diffeomorphism-group topologies. This roadmap builds those primitives and their usable
basic theory on top of Mathlib and Tau Ceti. Each milestone specifies its deliverable:
the selected Kirby-list statement targets and the general geometrization statement
require faithful formulations; the owned infrastructure and constructive packages
require the stated constructions and proofs. In particular GT6's invariants, GT8.H's
closed-Haken metric constructor and GT10's marked Euler-class counterexamples include
their full proof suppliers and comparison APIs.

A faithful statement of "the Weeks manifold has the smallest volume among closed
orientable hyperbolic 3-manifolds" is already a large, valuable target. The manifold
buildout, gluing, surgery and diffeomorphism-group topology also supply reusable
infrastructure whose value does not depend on any one Kirby problem.

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

## Cross-roadmap interfaces

The following roadmaps specify the shared interfaces consumed below. The named
sections determine each dependency; the constructions assigned to this roadmap
remain its targets.

| Supplier | Consumed interfaces |
| --- | --- |
| [AlgebraicTopology](../AlgebraicTopology/README.md) | Van Kampen and cellular/singular comparisons; 4.7 realization CW; Stage6 relative classes and interior atlas; 8.5 infinity; 8.11a ANR/CW foundations and the EM/Bockstein interfaces. |
| [DifferentialGeometry](../DifferentialGeometry/README.md) | Corners, metrics, density/form integration, distributions and Frobenius charts; the regular-value predicates consumed in GT10. |
| [HopfRinow](../HopfRinow/README.md) | Levi-Civita connection, exponential map and comparison with general smooth connections. |
| [RiemannianGeometry](../RiemannianGeometry/README.md) | R4.3 complete-local-isometry covering; R4.4 Cartan–Hadamard; R4.7 direct models, isometry germs and quotient atlases. |
| [SurfaceTopology](../SurfaceTopology/README.md) | Compact surface classification/genus and Layer9 mapping-class/cut-system comparisons. |
| [TeichmullerGeometry](../TeichmullerGeometry/README.md) | T0/T4a/T5 closed marked surfaces, uniformization, normalized Beltrami solution and Teichmüller metric/completeness; GT8.H owns the required finite-type/pared and three-dimensional extensions. |
| [PlanarTopology](../PlanarTopology/README.md) | Compatible finite triangulations, Euler/orientation invariants and the TOP/PL/smooth isotopy comparisons. |
| [TangentialBordism](../TangentialBordism/README.md) | B3.2 finite quadratic Arf algebra and B4.1–2 cochain Steenrod operations, before the geometric cycle applications. |
| [TemperleyLieb](../TemperleyLieb/README.md) | Diagram/presentation equivalence, flat basis/base change, normalized traces and Jones–Wenzl/root-level algebra. |
| [TemperleyLiebOperatorAlgebras](../TemperleyLiebOperatorAlgebras/README.md) | A1–A5 adjoints, positive trace quotients, finite blocks, faithful pre-singular levels, sign transport and towers. |
| [TypeAHeckeAlgebras](../TypeAHeckeAlgebras/README.md) | Full H1–H4a Hecke/Ocneanu/HOMFLY and signed countable factor/mixed estimates. |
| [FourManifolds](../FourManifolds/README.md) | F3 marked cyclic disk, TOP surgery, knot-exterior normal filling and ball recognition; the dimension-four normal/transversality comparisons specified below. |
| [AlgebraicKTheory](../AlgebraicKTheory/README.md) | A0–A3 arbitrary-ring projective K₀, stable-matrix K₁ and relative K₁; A5 stable Steinberg K₂; A6 normalized Milnor patching. For ordered first-to-second clutching u, use the ordinary parameter α=u⁻¹ and δ([u])=∂([u⁻¹])=−∂([u]). |
| [StableHomotopyKTheory](../StableHomotopyKTheory/README.md) | Layers1–2 realized nerves, homotopy fibres and Quillen A/B; §§3.3,3.8,3.10–3.13,3.25–3.27 acyclic/local-coefficient plus and functorial comparison; §§4.3–4.21 monoidal group completion, stable-GL and projective-complement/cofinality adapters; §§6.1–6.2 Waldhausen/S foundations, additivity and relative-S delooping. These generic constructions precede the ring-specific comparisons. |
| [GeneralAlgebraicKTheory](../GeneralAlgebraicKTheory/README.md) | §§3.1–3.5,3.12 ordinary exact-category Q/S and ring plus/Q comparisons; §§10.10–10.11,12.10 Bass/Schlichting nonconnective spectrum comparison, with its §1.7 supplied-spectrum adapters. This is the single owner of the ordinary models consumed in3d.0. |
| [GeometryOfNumbersAndQuadraticArithmetic](../GeometryOfNumbersAndQuadraticArithmetic/README.md) | §6.1.7 right-projective/common-spectrum convention adapters to those ordinary models; §6.10 `plusConstructionComparison` and normalized low-K comparison. Retain all K₀ components, ∂[t]=[R] and the inverse-parameter Milnor adapter. GT retains BHS, Nil/regularity, Whitehead, assembly and surgery. |
| [GeneralizedCohomology](../GeneralizedCohomology/README.md) | G2.8 group completion, G2.9 topological-group classifiers and G3.4 mapping telescopes. |
| [CharacteristicClasses](../CharacteristicClasses/README.md) | C1.1 numerable join classification and C2 Euler-class obstruction/evaluation comparison. |
| [SpinGeometry](../SpinGeometry/README.md) | G6.7 untwisted spin-four quaternionic parity. |
| [IndexTheory](../IndexTheory/README.md) | I7.5 untwisted Rokhlin and the numerical signature comparison. |
| [HomotopySpheres](../HomotopySpheres/README.md) | Stage1.7 simply connected h-cobordism; 4B stable O; 6C/9 low stems, Θ₅/Θ₆ and their comparison maps. |
| [LieGroupoidsPoisson](../LieGroupoidsPoisson/README.md) | G0.1 regular-fiber manifold with inherited topology, smooth inclusion and tangent kernel. |
| [RealAlgebraicGeometry](../RealAlgebraicGeometry/README.md) | Layer1 polynomial IVT/Rolle, Sturm–Tarski, Thom encodings and one-sided/half-open endpoint semantics. |
| [KhovanovHomology](../KhovanovHomology/README.md) | G/K1–K7 ordinary integral Kh, actual finite diagram/resolution tensors, grading/signs, coefficient comparisons, Reidemeister maps and the shared marked affine movie presentation. GT6 owns the Lee deformation, its comparison with that ordinary theory, spherical sweep-around descent and Rasmussen s. |
| [CombinatorialHeegaardFloer](../CombinatorialHeegaardFloer/README.md) | Grid complexes, τ and its slice-genus bound; LaneK grid/presentation comparison. GT6 supplies the concordance/additivity adapters and its Lee/Rasmussen s extension. |

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
- **General relative section and manifold-map transversality.** Before the
  compact sphere/manifold specializations, construct the ordinary smooth
  relative theorem on finite-dimensional Hausdorff second-countable sources.
  For a smooth finite-rank vector bundle E over M and smooth section s,
  let A be closed with s already transverse on a neighbourhood, and O
  an open allowed region with M minus O inside that transverse neighbourhood.
  Construct s' transverse everywhere, equal to s near A and outside O.
  Give the supported-D version when every nontransverse point lies in
  int D away from the protected neighbourhood; D need not be compact.
  Retain the zero bundle/empty source cases and actual boundary collars.
  Relative boundary/corner data are already transverse on each fixed
  stratum; choose perturbations meeting every actual stratum, rather than
  applying only interior Sard. The redundant literal D subset U case
  admits s'=s and is separate from this general theorem.

  Define approximation input by a locally finite relatively compact
  trivializing/chart cover, positive error tolerances and specified finite
  derivative orders on its compact pieces. Construct compactly supported
  spanning perturbation sections by smooth bump functions. The universal
  local parameter section is transverse by its vertical derivative;
  parametric Sard and C1-openness on controlled compact sets choose the
  parameters. Prove a countable exhaustion/locally finite iteration with
  derivative estimates and transverse-tail control gives a smooth global
  limit preserving the fixed data and requested tolerances. Prove its
  compatibility with chart/refinement and bundle transitions; a point-target
  Sard theorem alone is not the global bundle result. Compare the induced
  finite-order and C-infinity approximation notions explicitly with the
  relevant GT smooth-map topologies; weak and strong topologies on a
  noncompact source are not silently identified.

  Construct the corresponding finite-dimensional smooth manifold-map
  theorem for an embedded target submanifold in its actual normal charts,
  and the relative compact-parameter/end-collar version. Use the smooth
  implicit-function theorem to construct the inverse-image manifold and
  identify its QUOTIENT normal bundle with the pulled-back target normal
  bundle via the derivative. Include empty inverse images and negative
  expected dimension. Ordered target normals give actual framings with
  the pinned boundary/tangent-order signs. This supplies the earlier
  inverse-image/framed-trace contracts consumed by finite HS5. It has no
  input from PT, stable J, surgery classification or a conjectural
  immersion comparison.

- **Finite-manifold-target relative approximation and transversality.**
  For a compact finite-dimensional Hausdorff second-countable smooth source,
  including supplied boundary/corner strata, and a boundaryless finite-dimensional
  smooth target, construct relative manifold-target Whitney approximation by a
  finite chart/buffer/cutoff induction using native vector-target approximation.
  Keep exact agreement on a neighborhood of the protected closed set and the
  actual chartwise straight-line homotopy. This precedes the sphere special case.
  For a smooth map and a closed embedded target submanifold build finite chart
  translation parameter families with source cutoffs. Prove normal-parameter
  surjectivity off the protected set; fixed collars must already be transverse
  on each stratum. Sard on every stratum's inverse-image parameter projection
  gives one arbitrarily small common regular parameter. Construct the inverse
  image, face/collar identities and df-induced quotient-normal isomorphism,
  retaining empty and dim(source)<codimension cases. Relative homotopies keep
  already transverse endpoint collars and give actual collared bordisms.
  The projective applications use AT4.6/CKG K7's actual finite ratio charts and
  real/complex hyperplanes, with the finite-dimensional hypotheses retained.
  For arbitrary sigma-compact finite-dimensional Hausdorff second-countable
  smooth sources retain a separate circle/finite-projective-target theorem.
  Embed the compact target as unit-circle or rank-one projection matrices,
  smooth ambient maps by native relative vector approximation, and retract
  through its uniform normal tube; no source compactness is needed.
  For projective hyperplanes perturb by (Id+beta(x)A)·f(x), ||A||<1/2,
  with beta nonnegative, zero near the fixed set and with its zero set inside
  the already stratumwise transverse neighborhood. Parameter derivatives span
  the projective tangent wherever beta>0; at its zeros source derivatives
  supply transversality. Circle targets use rotation by beta(x)a.
  Sard on every actual boundaryless stratum gives a common arbitrarily small
  regular parameter. Keep fixed transverse collars, proper closed inverse
  images, locally finite bordisms, and all empty/dimension cases.
- **Sphere-target approximation and relative framed inverse images.**
  For a compact Hausdorff finite-dimensional smooth source M, including
  the supplied boundary/corner models, and the actual unit sphere S^r
  in EuclideanSpace ℝ (Fin (r+1)), construct relative smooth
  approximation of a continuous map f:M→S^r. Take a closed protected
  set C on a neighbourhood of which f is smooth, a specified smaller
  closed buffer inside that neighbourhood, and a positive continuous
  error function. Use native Continuous.exists_contMDiff_approx_and_eqOn
  into the ambient real vector space with error less than
  min(1/4,ε/4), then normalize the nonzero approximation by its norm.
  Prove its error bound and the normalized straight-line homotopy,
  fixed near C; its denominator is bounded below by3/4. State actual
  ContMDiff, subspace-map and model comparisons, not an empty condition.
  For a smooth sphere map fix a closed protected set D containing all
  collar neighbourhoods that must stay fixed. Require an open neighbourhood
  U of D on which f restricted to every boundary/corner stratum is transverse
  to the supplied y, with product-compatible data on the specified collars.
  Unprotected boundary faces may be perturbed. Construct arbitrarily small
  perturbations fixed near D and transverse on every stratum. Choose a
  smooth nonnegative cutoff beta identically zero near D, whose full zero
  set is contained in U, product-compatible on fixed collars. For small real
  vector a use F(x,a)=(f(x)+beta(x)a)/norm(f(x)+beta(x)a).
  On each boundaryless depth stratum S, prove F restricted to S times the
  parameter ball is transverse: parameter derivatives surject where beta>0;
  at beta=0 the stratum derivative of beta vanishes and f supplies the
  required stratumwise surjectivity. Apply DG10's Sard theorem separately
  to every boundaryless inverse-image parameter projection. Prove the strata
  are at most countable from second countability, and choose a parameter
  outside the union of their null critical-value sets, in any prescribed
  small parameter ball. Full-corner projection regularity alone does not
  supply face regularity. Include relative homotopies on M times I when
  all fixed endpoint/product collars already satisfy these hypotheses.
  Construct the regular inverse-image manifold, its actual embedding,
  dimension and boundary/collar identities, empty case and compactness.
  Identify its quotient normal bundle TM|_(f⁻¹ y)/T(f⁻¹ y) with
  the constant target tangent bundle on the preimage:
  prove d f gives ν_(f⁻¹ y)≃T_yS^r, smoothly in the preimage point,
  via the actual kernel, quotient map and chart inverse. An ordered
  target tangent frame therefore gives a particular normal framing.
  Keep the derivative/quotient-normal comparison and transported round
  orthogonal-complement frame distinct. If dim M<r, transversality
  forces an empty inverse image; never type a negative dimension by
  silently truncating it. These raw sphere-target results precede B5's
  finite framed PT theorem; they do not consume stable PT, EHP, general
  manifold-target Whitney approximation or any framed classification.
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
  image are both empty. This is the open-tube tubular neighbourhood theorem; transport it through the normal/quotient bundle equivalence
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
  export a C¹ diffeomorphism between the actual open tube
  and `Metric.thickening ε (range i)`, with its C¹ inverse; include the smooth
  version for smooth embeddings. These open-subset results also cover empty
  source and thickening. The corresponding whole-space `PartialDiffeomorph`
  forms carry explicit nonempty-source hypotheses and are derived corollaries.

  In Euclidean ambient space use the general `orthogonalNormal` bundle
  with Mathlib's flat metric as the canonical smooth carrier. The quotient
  equivalence sends the class of v to its orthogonal projection
  (`exists_normalSpaceOrthogonalEquiv`). Under
  `NormedSpace.fromTangentSpace (i x)`, prove its fibre submodule maps to
  native `normalSubspace I i x`. Construct the corresponding total-space
  homeomorphism to `TotalSpace V (normalSubspace I i ·)`, with its actual
  projection/fibre formulas and continuous inverse; use it to transport the
  existing topological tube results. No second Euclidean smooth atlas is chosen.
  Own the regularity-lowering map on smooth embeddings: for m≤n lower the native embedding's
  `ContMDiff` regularity, retaining the same function and embedding/immersion
  data; prove its coercion equality and identity/composition laws.
  Define this same `orthogonalNormal` family and its bundle instances for
  positive C^n embeddings, with source/ambient C^n manifolds and a C^(n−1)
  metric; the normal bundle regularity is C^(n−1) (∞−1=∞). Keep the native
  tangent bundle's C¹ ambient prerequisite explicit. Include regularity-lowering
  comparisons, preserving the underlying fibre/topology and identifying the
  smooth atlas restricted to C¹ with the C¹ atlas of f regarded as a C² embedding.
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
  proved open embedding. Define the nearest-point map r on the open thickening (`exists_nearestPoint`);
  prove its regularity, minimization, uniqueness, zero-section value and
  normal displacement. Pin the inverse of the tube map as
  y↦(r y,y−i(r y)), with norm less than ε; `exists_euclideanTubeEquiv` is the
  resulting homeomorphism of the normal tube onto the thickening.
  The general-ambient tube, C² Euclidean Hessian, and compact uniform-radius
  corollary are separate targets; no RiemannianGeometry theorem is an input.
  The straight-line homotopy is a strong deformation retraction onto the
  embedded submanifold. The open normal tube has strict fibre inequality;
  `normalDiscBundle` is the closed inequality, with `DiscSphere` and
  `WholeBundle` supplying the existing topological comparisons and
  `IsTubularNeighborhood` the common predicate. Prove the smooth closed-disc
  and sphere extensions required for surgery. Every noncompact embedded S
  has a positive radius function; no uniform radius is asserted.
- **Weak C∞ mapping spaces and formal tangent data.** Before the immersion
  comparison, construct the weak (compact-open C∞) topology on native
  `ContMDiffMap` carriers for Hausdorff second-countable finite-dimensional
  smooth M and N, including noncompact M. At f use finite intersections of
  chart neighborhoods: for a compact K in a source chart with f(K) in a
  target chart, require g(K) in that target chart and uniformly bound the
  differences of all chart derivatives of orders0 through a specified finite r
  on K by a positive tolerance. Prove these sets generate a topology independent
  of atlases, chart refinements and finite-dimensional norms; give evaluation,
  restriction, composition and change-of-charts continuity. For boundary charts
  use local smooth extensions and prove independence of the extension, as for
  the embedding spaces in Layer3. The compact-source topology agrees with
  the compact-source Whitney construction in Layer3; on noncompact sources
  it remains the weak topology, with only finitely many compact controls in
  each basic neighborhood.

  Topologize actual smooth fibrewise-linear maps F:TM→TN over f by the
  subspace topology of the pair (f,F) in the two weak smooth-map spaces.
  Prove its equivalent chartwise compact-derivative description on the Hom
  bundle, its pullback/local-trivialization comparisons and continuity of
  f↦(f,Tf). Formal immersions are the subspace where each fibre map is
  injective; immersions have the corresponding subspace topology in smooth
  maps. Export restrictions, derivative maps, fibrewise homotopies and their
  compatibility with those topologies. For a compact parameter polyhedron P
  and subpolyhedron A, identify continuous P-families with families whose
  source derivatives of every order are jointly continuous, and compare
  restriction to A on maps, formal data and derivative families. A continuous
  parameter family is not thereby jointly smooth in the parameter. These
  constructions supply the compact-parameter relative homotopy spaces used
  below; they do not assume an immersion theorem or a noncompact Diff-group
  theorem.
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
  trace/handle formulation and its passage from 2-connectivity to the admissible index range;
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

### Layer1 finite disk-bundle, plumbing and handle construction supplement

Use real smooth finite-dimensional Hausdorff second-countable manifolds, prescribed compatible collars on every gluing face, actual oriented bundles with chosen positive metric, and the existing smooth corner models. This is an early finite construction, independent of high-dimensional surgery, Bott periodicity, stable PT or the h-cobordism theorem.

Consume TopK T1.1–4 for the actual finite-rank bundle category, metric, compact-disk homotopy invariance and closed-disc/cone clutching construction. GT owns the smooth/orientation adapter to that same construction. For an oriented rankr bundle overS^r,r>=2, construct northern/southern disk trivializations and transition S^(r−1)→GL^+(r,R), then polar deformation to the same SO(r) for the chosen metric. Homotopic transitions give actual bundle isomorphisms by cylinder gluing; every bundle map gives the change-of-trivialization homotopies. Prove the based/free comparison for connected SO(r), preserving hemisphere orientation, equator order, marked point and inverse convention. Rank0/rank1/S0 are separate elementary outputs, not π_(−1). This EARLY finite clutching output does not construct or export a fibration LES and consumes neither that LES nor stableBSO/Bott tables.

**Finite-column LES stage, after the early bundle and clutching stages.** Construct SO(r−1)→SO(r)→S^(r−1) using the actual FIRST column map, comparing the shared HS4A last-column model by a specified orientation-preserving column permutation with its parity correction. Use actual local orthonormal-completion sections and identify the block stabilizer with SO(r−1). On that actual sphere bundle, consume the actual DGF1.2 fibration LES producer with its marked basepoint, representative lifts, group/pointed low degrees, connecting map and naturality. Export the finite-column LES only at this later stage; an earlier clutching caller receives no LES from sharing this paragraph's owner. Preserve the source conclusion of no numerical computation. Installed native Serre modules and public720bf fibration sources have different epochs; this is a written bundle/LES construction and makes no unavailable installed-import or native-proof claim.

Define the compact unit disk bundle D(E), its sphere boundary S(E) and its zero section. With prescribed hemisphere trivializations, D(E) is a rounded 0-handle plus one r-handle: glue D^r×D^r along S^(r-1)×D^r by the actual transition function and base equator inclusion, preserving collars and the fibre framing. Give the diffeomorphism in product charts on each hemisphere and prove its overlap equation; round the product corners by the fixed collar model. The unrestricted total vector bundle is noncompact and is not that compact two-handle manifold. For compact collared cobordisms with finitely many nondegenerate critical points consume Morse M1/M2 and the earlier smooth elementary-cobordism comparison, yielding finite handles with their actual attaching embeddings; a homotopy cell decomposition alone does not prove a smooth handle decomposition.

For a finite specified loopless graph (multiple marked edges allowed) and oriented rank-r disk bundles over oriented S^r, r>=2 even, choose disjoint product charts D^r_base×D^r_fibre at the marked plumbing sites and glue by interchanging base/fibre coordinates with the declared orientation sign. Construct the manifold with corners, compatible collars, rounded smooth structure and its compactness. Zero sections give the free middle-homology basis: contract each handle fibre and use the actual relative-handle/cellular chain complex; no extra cycles are inferred merely from the graph. Their self-pairings are the oriented Euler numbers of the normal bundles, and each plumbing edge contributes the explicitly signed transverse intersection. Prove this matrix equals the integral intersection form using Thom/normal orientation and cellular/singular comparisons. For the specified standard E8 tree, get diagonal-2 and adjacent+1 after declaring the orientation choices; the manuscript's drawing-to-standard-tree identification remains a Luna-glyph hold if the Markdown does not establish its vertices. Graph labels and intersection signs are data, not obtained by counting eight vertices. Self-plumbing, with its immersed zero section and double-point correction, remains the separate existing GT target; it is not inferred from this embedded-section loopless-graph theorem.

Compute the tangent/cotangent conventions separately. For S^(2k), Euler(TS)=2 in the usual orientation: take the tangential gradient of a coordinate height function. Its only zeros are the two poles, both nondegenerate; their Jacobian determinants have positive sign in even dimension, so the transverse-zero index formula gives 1+1. This computation precedes and does not require the Poincaré-duality/Künneth Euler-trace theorem. A positive metric gives an orientation-preserving real-dual identification when T* is given the dual-basis orientation, so its Euler number is ALSO2. The canonical symplectic orientation of T*S^(2k), compared with base followed by dual fibre, contributes (-1)^(r(r-1)/2)=(-1)^k. Therefore its zero-section self-intersection is (-1)^k 2. To get the source's uniform-2 convention one must explicitly reverse the ambient/plumbing orientation for even k. In r=2 the holomorphic cotangent O(-2) convention gives-2; it is not silently the canonical oriented real dual. For the complex Hopf line use the actual equatorial transition z↦z or its inverse as dictated by the chosen hemisphere order, identify SO(2) with U(1), and evaluate its Euler obstruction as that transition winding number. Choose the degree+1 transition to normalize the Hopf generator. The tangent transition has degree2 and its complex-dual transition degree−2; tensor duality reverses the winding. These are Euler/clutching calculations and do not require the later C3 Chern theory; comparison to c1 remains that owner’s subsequent target. Compare these conventions to the real normal orientation. CC C2's Euler/self-intersection laws supply evaluation, not a choice of these missing signs.

Reversing the ambient orientation negates the entire intersection form; reversing an individual zero-section basis vector changes its row and column. On a tree choose bipartition signs ε_v so ε_vε_w=-1 along every edge. Conjugating the negated matrix by diag(ε_v) returns the off-diagonal+1 pattern and gives diagonal+2. This explains the source's two matrix sign patterns; it does not assert that positive E8 and negative E8 are isometric. Include the zero-vertex graph, disconnected graph, rank2 bundle example and all orientation transport equations. The specific E8 plumbing boundary's simple connectivity, almost parallelizability and later surgery uses remain separate HS/GT targets, not premises of this finite matrix calculation.

#### GT1: finite-dimensional immersion

**Finite-dimensional immersion and embedding criterion.** For smooth real manifolds
without boundary and finite-dimensional model spaces, construct the implication
from `ContMDiff I J ∞ f` and injectivity of `mfderiv I J f x` at x to
`Manifold.IsImmersionAt I J ∞ f x`. In source/target charts choose a complement
to the derivative image, augment the map by the complement variable, and apply
the inverse function theorem to obtain the immersion normal form. For the global
conclusion consume native `TauCeti.isImmersion_iff_forall_isImmersionAt`
(`Geometry/Manifold/Immersion.lean`): its finite-dimensional-target argument already
replaces the pointwise complements by one common model and handles an empty source.
Supply compatibility with restriction and changes of charts. For an injective map
from a compact domain into a Hausdorff target, combine this with the compact-to-Hausdorff
topological-embedding theorem to obtain `Manifold.IsSmoothEmbedding`, then bundle
`TauCeti.SmoothEmbedding`. This criterion supplies the smooth local-normal-form step
in GT4's torus-knot construction; an injective derivative alone is not that bundled
structure. Half-space/neat boundary statements retain their separate pair-chart hypotheses.

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
topological group, with the C^∞ (weak Whitney) topology, for compact manifolds.
Layer1 owns the weak smooth-map and formal-immersion topologies for general sources.
Mathlib has
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
- The **C^∞ topology** on `Diff(M)` for compact M is the subspace topology
  induced by sending a native diffeomorphism to its underlying `ContMDiffMap`,
  with Layer1's weak compact-derivative topology. Prove the chart/iterated-
  derivative and compact-source Whitney descriptions agree (Hirsch,
  *Differential Topology* GTM33, Chapter2,
  [extract](references/hirsch-smooth-map-topologies.md)). Prove composition and
  inversion continuous, making this a topological group. `Diff(M, ∂M)` is the
  closed subgroup fixing the boundary pointwise. The immersion comparison
  already uses Layer1's general-source mapping spaces; this compact Diff
  specialization does not restrict that comparison's noncompact scope.
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

#### GT3: smooth-family isotopy extension

**Smooth-family isotopy extension.** In addition to the continuous function-space
extension above, own this smooth version. Let N be a compact smooth manifold
without boundary and M a Hausdorff paracompact finite-dimensional smooth manifold
without boundary. For a jointly smooth family `F_t:N→M` of smooth embeddings,
defined on an open time interval containing I, construct a native
`TauCeti.Diffeotopy` Φ of M satisfying `Φ(t,F₀(x))=F_t(x)`.
Extend the velocity along the moving embedded image to a smooth time-dependent
ambient vector field using GT1's tubular neighborhoods and smooth partitions of
unity. Choose a common compact spatial support around the compact trace over I.
Consume [DifferentialGeometry 3.5's finite-dimensional two-time flow](../DifferentialGeometry/README.md#layer-3-flows),
including joint smoothness, inverse laws and compact-time escape. Prove that each
trajectory stays in the compact support together with its initial point, giving
existence throughout I. Flow uniqueness gives `Φ(t,F₀(x))=F_t(x)`.
The smooth flow and inverse give the total diffeomorphism of `I×M` required by
`Diffeotopy`, with identity at zero. A continuous path in the Whitney
diffeomorphism group alone does not supply this conclusion. For a relative version,
let V,U be open ambient sets with closure V⊂U. Assume `F_t(x)=F₀(x)` whenever
`F₀(x)∈U`, and `F_t(x)∉U` otherwise. Arrange that the extended velocity vanishes
on V and that Φ fixes V pointwise. GT4's explicit torus-knot-to-unknot families consume this
version of the theorem.

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
  `V_L(t)=P_L(t^(−1),−t,t^(−1/2)−t^(1/2))`. This V uses the native
  bracket convention `t=A⁻⁴`, with right-handed trefoil `t+t³−t⁴`, and satisfies
  `t⁻¹V(L₊)−tV(L₋)+(t⁻¹ᐟ²−t¹ᐟ²)V(L₀)=0` for the same crossing labels.
  The specialization `P_L(t,−t⁻¹,t¹ᐟ²−t⁻¹ᐟ²)` equals `V_L(t⁻¹)`;
  compare source formulas through this explicit variable inversion. Set `t=s²`.
  Because `s−s⁻¹` is not a unit
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
  `P₇₇=(2+2l²+l⁴)+(−l⁻²−2−2l²)m²+m⁴`. The outputs of the
  specialization `P(t,−t⁻¹,t¹ᐟ²−t⁻¹ᐟ²)`, hence the mirror-variable values
  `V_K(t⁻¹)`, are, in order,
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

#### GT4: oriented codimension-two spanning hypersurfaces and relative angular data

For an oriented smooth Hausdorff second-countable boundaryless (k+2)-manifold M and a compact closed oriented smoothly embedded k-manifold K, own the equivalence: its integral fundamental cycle is zero in H_k(M;Z) iff K is the oriented boundary of a compact smoothly embedded oriented hypersurface W in M. The given orientation of M and K orients the normal two-plane bundle; do not assume that bundle is already framed. Include disconnected K, k=0, empty K and noncompact M. For K connected retain a connected spanning component after discarding closed components. For ambient boundary require K in its interior, or a specified neat boundary/corner model and the corresponding relative cycle condition; an arbitrary boundary contact is not an instance. Ordinary H_k does not supply a fundamental cycle for an arbitrary noncompact K: preserve that missing source hypothesis, and state any locally finite extension with its own locally finite groups and properness data.

First construct a compact smooth codimension-zero neighborhood N of a given compact set in M, contained in a specified open neighborhood, with collared boundary. Use finitely many smooth chart bumps to obtain a compactly supported function equal to1 near the compact set; a regular value in (0,1) gives N. No complete ambient metric, global Morse exhaustion or compactness of M is inferred. Put the finite bounding chain and K in int N. The exact sequence H^1(N\int Dnu,partial N;Z) -> H^2(N,N\int Dnu;Z) -> H^2(N,partial N;Z), excision, the positive normal Thom class and Poincare–Lefschetz duality identify the image of the componentwise1 class with PD[K]. Use actual ordinary relative singular groups on the two compact pairs and the same boundary-relative orientation. When [K]=0 obtain an angular cohomology class whose restriction to each positive normal meridian has degree1. Restricting PD[K] to K gives the normal Euler class0. Consume CC's oriented rank-two/complex-line classification and Euler=c1 comparison to trivialize the normal circle bundle; no prior framing is smuggled into the obstruction calculation.

Own the finite-relative-CW Circle comparison here as a consumer of AT8's degree-one representability contract, not as a second generic cohomology owner. For a CW pair (X,A), a map f_A:A->S1 and alpha in H^1(X;Z) restricting to f_A^*[dtheta], build an extension up to homotopy from a cellular integral1-cocycle: map edges with their assigned windings, extend over2-cells by the cocycle equation, then over higher cells using pi_j(S1)=0 for j>=2. The native Circle fundamental group/winding and covering homotopy interfaces fix the generator and signs. The HEP of the actual closed CW inclusion rectifies the boundary homotopy to strict f_A, with product-collar germs retained on a smaller neighborhood. For the sphere bundle Snu, its Gysin exact sequence says two degree1 angular classes differ by a pullback from H^1(K;Z). Change the chosen normal trivialization by the corresponding K->S1 map, so the prescribed tube angular coordinate has exactly the restriction class of alpha. The collar HEP now rectifies both tube and outer-boundary prescriptions. Relative smoothing uses the GT/DG smooth approximation theorem with these germs fixed. This is a construction of the required map, not an appeal to the bare fact that Circle is a K(Z,1).

Choose a regular value different from the constant near partial N. Only perturb outside the fixed tube and collar, whose maps are already transverse. The inverse image in the tube exterior is compact, and adjoining the radial half-ray sheet yields W; the angular product chart proves smoothness at K. Give W the preimage orientation with the positive angular coorientation first. In the normal chart this induces the original K orientation on its outward-first boundary. Necessity follows from W's oriented relative fundamental chain. Pin restriction, oriented ambient diffeomorphism, disjoint union, and specified relative-collar naturality; neither a unique W nor a canonical trivialization is asserted.

For two spanning hypersurfaces retain the source's unanswered relative-bordism question. A homotopy of their angular maps with the SAME meridian and outer-boundary germs, stratumwise transverse relative to its already-transverse endpoint collars, produces an embedded compact oriented bordism in M times I, product on K times I. In an arbitrary M there is no blanket existence: a small unknot in S1 times S2 spans a disk D and D tubed to an essential {point} times S2, whose difference is the nonzero H2 class; projecting a hypothetical relative bordism's fundamental chain would make it zero. The ambient homology obstruction and the exact notion of product-relative bordism are part of this contract.

#### GT4: linking, push-ins and calibrated surface framing

For disjoint oriented S3 link components, prove equality of the linking definitions: oriented degree, Seifert-surface intersection, HALF the signed mixed-crossing sum, and the signed intersection of smooth spanning surfaces pushed into B4. Build common product boundary collars, make all interior sheets mutually transverse by the stratumwise relative theorem with fixed collars already transverse, and prove independence by the actual relative chain-intersection/dual pairing. Orient B4 by its standard orientation and S3 as its outward boundary; calibrate the positive Hopf link to+1. A self-entry uses an explicitly marked normal framing and its positive push-off; it is not determined by the unframed knot. Include the empty link and all-component sign/reordering laws. Derive the sum of every matrix entry as the sum of framings plus twice the sum over unordered distinct pairs; the separate Hopf-invariant interpretation consumes the finite unstable framed inverse and the actual cup/attaching-map comparison.

For a given oriented framed/Spin surface, keep TB B3.2 as the owner of the representative-independent geometric quadratic refinement. Supply GT's embedded representative, crossing smoothing, two-sided curve/collar and band comparisons. Normalize bounding circle framing to q=0 and the nonbounding class to1; a raw tangent-loop turn count may differ by the reference disk offset. An unknotted circle in S4 has two stable normal framing classes, not a canonical frame selected by unknotting. Construct the unknotted reference using a one-parameter generic homotopy and the deleted-pair collision locus (dimension3 below ambient4), then isotopy extension; an arbitrary spanning disk in S4 is not declared embedded by a dimension shortcut.

For an oriented closed surface and a two-sided nonseparating embedded circle, cut along that circle, choose an embedded arc connecting its two boundary copies in the connected cut surface, and reglue/collar-smooth to obtain a dual circle meeting it once with positive sign. A regular neighborhood of the pair is a punctured torus and its integral/mod2 intersection plane splits by perfectness. Preserve the literal Klein-bottle alternative as a source-qualified nonorientable discussion: for one-sided curves the ribbon attachment and boundary data are indispensable, and the general regular neighborhood need not be a punctured torus or a punctured Klein bottle. No exhaustive two-case assertion is exported without those hypotheses.

#### GT4: oriented pairwise linking


Define oriented linking of two disjoint components in oriented R3/S3 by the geometric degree/intersection carrier and compare with HALF the signed mixed crossing sum. Prove the signed sum even, symmetry, Reidemeister/isotopy invariance, reversal of one component negating and of both preserving it. Prove equality to the sum of only those signed crossings where the first component is over the second, with the chosen crossing convention. These feed the exact positive-normal Seifert pairing already owned by GT4; keep its current Vᵀ−V=J convention and compare alternate push-first conventions by transpose. Split implies0;0does not imply split. All pictured Hopf/Solomon/Whitehead/Borromean pairwise matrices need actual orientations and checked crossing codes.

#### GT4: Colourings and finite integral presentations

Consume the native Quandle, Quandle.Conj, Quandle.Dihedral, realized plane-map/PD presentations and GT4 geometric Reidemeister comparison. For each realized finite oriented link diagram D and quandle Q, define the coloring set by functions on its oriented arcs satisfying the appropriate signed quandle crossing relations; include crossing-free components explicitly. For the conjugation quandle, pin native group multiplication and each crossing as z=y*x*y⁻¹ or its inverse-crossing rule. Construct restriction and unique local extension maps for every orientation/sign of RI, RII and RIII. Prove these maps mutually inverse, natural under quandle homomorphisms/relabeling and identity outside the move disk; prove composition and inverse move laws. The generated subgroup of all labels is unchanged under group-coloring transport. This gives a presentation-independent coloring equivalence for ambient-isotopic tame links, and separately a predicate that labels generate a specified G. Knot labels lie in one conjugacy class; for links assert this only separately on each component. Distinguish arbitrary, nonconstant, conjugacy-class restricted, and surjectively generated labelings; none is inferred from another. Orientation reversal acts by inversion in the group model with the crossing maps explicitly checked.

For a finite field F=ZMod p with p prime, specialize dihedral colors to 2*over=under₁+under₂, including coincident arc indices by summing their coefficients. Build a linear coloring space, its constant subspace and reduced quotient; for every nonempty link the GLOBAL constant subspace has dimension1. For each based arc prove normalization to color0 gives a linear equivalence from the reduced quotient to normalized colorings. Export full color count p^(r+1), reduced count p^r and nonconstant count p^(r+1)−p for reduced dimension r. For the empty link the global constant map is zero and its space has dimension0. For multiple components keep the genuine one-dimensional GLOBAL constant subspace. A componentwise constant assignment is a coloring only if it satisfies EVERY intercomponent crossing equation: in the Fox model, overcomponent value a and undercomponent value b require2a=2b. At p=2 these conditions are automatic and componentwise constants give the complete coloring space of dimension equal to the number of components; at odd p equality is forced across each crossing edge of the component incidence graph. For odd p, a chosen partition into separated subdiagrams with NO mixed crossings permits arbitrary independent constants on those subdiagrams; for a general chosen partition the crossing equations remain necessary. This sufficient geometric branch is not an iff characterization of splitting, and the p=2 freedom just stated is separate. Prove these assertions from the actual local equations; do not assert arbitrary per-component constants on general links.

Construct the full integer crossing/arc Fox-coloring matrix A, its signed left-kernel vector with every entry±1, and its all-ones right-kernel. Derive explicit integral row/column equivalences between normalized reduced presentations, allowing insertion/deletion of signed unit blocks when a move changes matrix size. Prove the presented abelian group and reduced nullity mod every prime are preserved. On the square cofactor branches prove absolute determinant preservation; for rectangular presentations use the full presentation/Smith invariants rather than an undefined determinant. Prove compatibility with each move using its local extension maps. The crossing-free unknot has reduced zero-dimensional space and determinant1, not an undefined minor. Prove absolute reduced determinant nonzero and odd for knots by comparing with the unimodular Seifert skew intersection form modulo2. Export nonconstant p-colorable iff p divides determinant, reduced mod2 dimension0, and finiteness of contributing primes. For general links keep possible determinant0 and the exact global-constant, component-incidence and characteristic2 branches stated above; no arbitrary componentwise-constant subspace is presumed. The source calls this arc matrix Goeritz; retain a separate signed region checkerboard Goeritz carrier and prove its determinant comparison, never identify the matrices by name.

For any rectangular integer matrix construct a finite integer presentation and its Smith invariant factors, allowing singular square matrices and zero rows/columns. Consume actual PID/submodule/SNF APIs wherever their complete hypotheses apply, and use elementary Euclidean row/column operations for the remaining finite-presentation adapter. Export P*A*Q=diag(d₁,…,d_r,0,…) with P,Q unimodular, each d_i>0, d_i∣d_(i+1), rank/free/torsion decomposition and reduced modp dimension formula. This is broader than native nonsingular-square positive-SNF. Certify each printed matrix using explicit P,Q witnesses; source numerical output alone does not establish geometric identification.

Prove colorings of disjoint diagrams are products. A split link moved into two disjoint open half-spaces has componentwise constant nonconstant colorings; consume GT Layer2's bicollar/Brown Schoenflies contract, comparison3g's dimension≤3 relative Moise/smoothing and Layer3's supported isotopy-extension contract to compare a locally flat separating-sphere definition when it is the source convention. State this comparison with its actual collar/category hypotheses. Derive Whitehead nonsplitting from its exact finite coloring count, not from a guessed diagram or linking0 alone.

For knots prove bridge-label restriction injective, hence reduced dimension≤bridge−1. At a crossing change prove reduced dimension changes by at most1 using the two local linear systems and their common codimension-one restriction; iterate to r≤u. For surjective transposition labels in S_n, the graph of labeled transpositions is connected iff those labels generate S_n, and at least n−1 bridge labels are necessary. Export bridge≥n−1, and keep the printed≥n as a false source assertion (S3-labeled trefoil is a corrected counterexample once its diagram is realized). Build the full integer signed-twist recurrence on involution labels, output ((xy)^p*x,(xy)^(p−1)*x), including inverse twists. Prove the three pretzel consistency equations and their dependency, classify constant, S3-image and S4-generating transposition solutions separately; for the generating case classify all ordered generating transposition triples into star/path. In the pinned twist convention the first two consistency equations imply the third; the star branch holds iff p,q,r are each divisible by3, and the path branch iff p,q are divisible by3 and r is even. After allowing every parameter permutation, a generating S4 labeling exists iff at least two of p,q,r are divisible by3 and every one is either divisible by3 or even. Prove this from the finite ordered triples and modulo6 recurrences. The additional parity restriction for the diagram to be a KNOT is a separate realized-component calculation; do not make it a premise of the general pretzel-link coloring criterion. Preserve source r≡2mod3 separately from corrected r-even.

Give all finite source examples explicit realized code, arc correspondence, every crossing equation and generated-subgroup certificate: trefoil,5₂,7₃, P(3,3,3), all under8 prime-table Smith/color data,6₁ versus9₄₆, S5 mixed-cycle examples and all problem30 diagrams. Unreadable extra diagrams remain data holds. For finite sets of odd primes construct knot families with independently prescribed reduced dimensions by explicit factors and connected sums; p=2 is forced0. Prove connected-sum reduced-space direct sum and the source's square-knot obstruction. Give the 3-cycle-to-two-transposition doubling construction with explicit multiplication order and finite twist correction; transitivity of the original 3-cycle hypergraph gives connectedness of the resulting transposition graph. The k-fold example and unbounded-bridge conclusion must be checked on actual source pattern data, not presumed from generic colorability.

The source index for these mandatory coloring and doubling examples is as follows. The main source is *Knot Theory.pdf*, source identity `ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`; `KM-P106-B004–B007` identifies the physical-page106 doubling/3-cycle/transitivity and indexed connected-sum assertions, and `KM-P177-B009/B010/B012` identifies the physical-page177 mixed-cycle `S₅` example and its obscured diagram/labels. The defining specifications and current source-input boundaries are given in [the owned source-input note](source-inputs.md#source-identities-and-paragraph-index). For the arbitrary-genus family specified below, the exact main-source paragraph index is `KM-P073-B004–B007/B009`, `KM-P074-B004–B016`, `KM-P075-B004–B008/B010`, and `KM-P076-B004–B006/B009`, with the explicit matrices, general template and corrected page74-array entries specified in [that note](source-inputs.md#two-distinct-seifert-matrices-and-the-general-template). These identifiers locate the literal examples and retain their geometry/basis uncertainties; an algebraic model is not their geometric identification.

The problems source is *Knot Theory - problems.pdf*, source identity `06c19def0f01d6e74a1ee99bd448bd3731e101377deddb5aa573943898afb3b1`. `KP-E020` is physical-page4 problem20, the four illustrated Hopf, King Solomon, Whitehead and Borromean links; `KP-E030` is physical-page5 problem30 with its physical-page6 continuation. Their defining questions, occurrence ambiguity and unresolved inputs are specified in [the owned problem20/30 section](source-inputs.md#problem20-and-every-problem30-pictured-occurrence). For every pictured occurrence, construct its own signed crossing/component and arc correspondence, solve all coloring equations, and certify the link to the named diagram; do not replace these required inputs by a generic existence or colorability theorem. Keep all six pictured occurrences in problem30 and the reference to all four problem20 links. Whether those six include the earlier four or are six additional examples remains an explicit source-identity/count hold, not a choice of six or ten distinct diagrams. Preserve the missing visible footnote after the page6 Whitehead claim and the unresolved course split-convention comparison (half-space versus locally flat separating sphere), with its precise collar/category hypotheses; the GT4 coloring split-comparison above remains required, using Layer2 bicollar/Brown Schoenflies, comparison3g's dimension≤3 relative Moise/smoothing and Layer3 supported isotopy extension at their actual category/collar hypotheses.

For the page177 `S₅` example, pin right-to-left permutation composition and
set a=(45)(123), b=(35)(124). Prove a³=(45), b³=(35) and ab=(13425).
The full five-cycle ab and transposition a³ generate S₅ by Mathlib's
`Equiv.Perm.closure_prime_cycle_swap`, hence so do a,b. The cubes alone
fix letters1,2 and do not generate S₅. This settles generation from the
legible labels, independently of the missing interior labels. Recover the
actual oriented crossing/arc data and check every conjugation equation to
certify the pictured knot coloring; group generation alone does not certify
that coloring. The mandatory mixed-cycle example remains. For page106, construct the actual indexed doubled-diagram family, pin permutation multiplication order, each finite twist correction and the transitive generating certificate, and compare the source's connected sum of `k` `(2,5)`-torus knots with its printed `S_(3+2k)` index. The index and all stated families/bridge conclusions are retained as source obligations until checked against that exact pattern; neither a generic 3-cycle factorization nor an invented diagram settles them. The exact outstanding data and semantic conditions for resolving all these holds are specified in [the owned source-input note](source-inputs.md#remaining-input-holds-and-resolution-criteria). This input specification does not claim that the missing data have been recovered.

#### GT4: Embedded surfaces, ordinary genus and satellite families

Consume GT1's actual smooth compact-surface comparison and its existing PlanarTopology/SurfaceTopology classification/triangulation suppliers. Do not duplicate generic surface classification. Own the embedded finite disc-band presentation: discs and bands with signed boundary attaching intervals, finite cyclic attachment order, twists, height/crossing data and chosen boundary/orientation marking. Construct its embedding, boundary-cycle permutation and deformation retraction to the incidence graph; prove χ=d−b including isolated discs. Connected orientable case gives2g=2−d+b−r; connected nonorientable case gives crosscap number k=2−d+b−r. No orientable genus formula is asserted without orientability. Compare the graph/triangulation Euler characteristics and classification invariants. A disc-and-bands model of an arbitrary compact connected surface requires nonempty boundary; empty, disconnected and closed branches are separate.

For a connected embedded finite band system, merge discs along a spanning tree, with explicit relative ambient isotopies and updated crossing/twist/attachment data; do not equate an abstract graph collapse with an ambient isotopy. Pin collar and boundary behavior. Give the standard punctured torus model/isotopy, all illustrated band-surface certificates and Seifert smoothing/band counts. Prove orientation compatibility by signed attachment equations rather than raw twist parity independent of disc orientations. Surface compression along an embedded interior disc requires a collar and disjoint interior. Establish connected handle-removal and separating genus-sum formulas by the exact boundary/χ changes.

Define ordinary genus g(K) as the minimum genus over ALL compact connected embedded oriented spanning surfaces of K. Prove existence/attainment from GT4 Seifert existence and natural-number well-ordering; ambient-isotopy and reparametrization invariance; g=0 iff unknot using embedded-disc standardization. Separately define canonical genus g_can(K) as the minimum over diagram Seifert-algorithm surfaces, prove g≤g_can, and do not claim equality. The literal source173 minimizes diagram surfaces; retain that as its canonical-genus definition.

<a id="gt4-bridge-genus-comparisons"></a>
For a realized regular oriented knot diagram D with n crossings and d Seifert
circles, construct its canonical Seifert surface S_D with exactly d discs,
n bands and one boundary component. Prove connectedness and
`2g(S_D)=n−d+1`, including integrality and nonnegativity. Define the Seifert
graph with its actual circles as vertices and each crossing band as an edge;
prove from the oriented plane smoothing and Jordan separation that no edge is
a loop. Thus n>0 implies d≥2. Apply `g(K)≤g(S_D)` to a diagram attaining
crossing number to prove `2g(K)≤c(K)−1` for every nontrivial tame knot.
For every genus-h embedded oriented spanning surface, use its actual rank-2h
Seifert matrix and the fixed formula `Δ_K(T)=T^(−h)det(TV−Vᵀ)` to prove
that the symmetric Laurent support lies in `[-h,h]`. Since `Δ_K(1)=1`,
its support is nonempty; define its span as maximum minus minimum exponent.
Minimizing over spanning surfaces gives `span(Δ_K)≤2g(K)`, hence
`span(Δ_K)<c(K)` for nontrivial knots. The crossing-free unknot has d=1,
surface a disc, g=0, c=0 and Δ=1 of span0; the strict crossing inequality
is not asserted for this branch. These comparisons use ordinary genus,
while the displayed diagram count computes that diagram's canonical surface.

Compare the height-maxima definition of bridge number with the source's
maximal-overpass definition. For a regular knot diagram with at least one crossing,
record the cyclic over/under encounter word along its single component;
each crossing contributes one encounter of each kind. An overpass is a
maximal nonempty cyclic run of overcrossing encounters, represented by an
arc with endpoints in the adjacent crossing-free intervals; it is not an
arbitrary subdivision of such an arc. Define the diagram's overpass count
by these runs, independently of traversal basepoint and direction. Assign
count1 to the crossing-free diagram. Minimize over all realized regular
diagrams of the ambient-isotopy class, and prove attainment and isotopy
invariance of this minimum.

Prove equality of the two minima by both geometric constructions. From a
diagram with b overpasses, construct an ambient-isotopic bridge presentation
with b upper arcs and b lower arcs, carrying explicit disjoint bridge discs
on each side of a separating plane, and a generic height function with
exactly b maxima and b minima. Conversely, from an embedded representative
and generic height direction with m maxima, first prove the same number of
minima, then construct a bridge presentation and a regular diagram with at
most m maximal overpasses. Supply the critical-level rearrangements,
bridge discs, relative ambient isotopies and regular-projection perturbations
that preserve the stated bounds; an arbitrary projection of the Morse
representative does not supply them. Handle the crossing-free unknot by
its one-maximum/one-minimum circle. Transport both constructions through the
smooth/PL and diagram realization comparisons. Individual Reidemeister moves
may change a diagram's run count; equality concerns the two minima over all
representatives, rather than a run count on one chosen drawing.

Construct orientation-compatible connected sum using marked small arcs/discs, prove independence, associativity, commutativity and unknot identity. Decomposing spheres carry the actual PL/smooth/tame comparison. Prove ordinary-genus additivity: upper bound by boundary-connected surfaces; lower bound by putting a minimum spanning surface transverse to the decomposing sphere, removing inessential intersection circles using innermost-disc surgery and the necessary irreducibility/collar facts, leaving one essential joining arc and splitting into spanning surfaces whose genera sum to the original. Export all precise irreducibility and surgery lemmas used, not a bare citation to genus. Prove existence of a finite prime decomposition by strict genus drop for nontrivial factors; prove uniqueness separately via the sphere-system cut-and-paste/innermost-circle argument and oriented isotopy of the resulting factors. Prime uniqueness gives cancellation in the oriented-knot connected-sum monoid. Its only invertible element is the unknot: no nontrivial knot has a connected-sum inverse.

Give explicit torus, pretzel, rational twist and Whitehead/twisted-double patterns with orientations and all signed/degenerate parameter branches. For torus links compare coordinate interchange by an orientation-preserving ambient isotopy in S3, single sign reversal with mirror, simultaneous sign reversal with orientation transport, and component gcd. An abstract symmetry of the square torus need not extend to the required ambient isotopy.

##### GT4: torus models

For the coprime-integer knot case, fix the actual Clifford-torus model
`κ_(p,q)(u)=2^(−1/2)(u^p,u^q)` for `u∈Circle⊂ℂ`, in the unit sphere of
`EuclideanSpace ℂ (Fin 2)`. Integer powers include negative parameters.
Prove its norm is one, its smoothness and its injective differential, whose
angular-parameter speed squared is `(p²+q²)/2`. Bezout's identity gives
injectivity when `IsCoprime p q`; compactness then gives a smooth embedding.
Use the real linear isometry `(z₀,z₁)↦(Re z₀,Im z₀,Re z₁,Im z₁)` into
`EuclideanSpace ℝ (Fin 4)`, with this coordinate order and the standard boundary
orientation of its unit sphere. Prove the isometry and its orientation comparison;
on `(z,0)` it agrees with native `TauCeti.complexToEuclideanFour`. Consume
[GT1's finite-dimensional immersion criterion](#gt1-finite-dimensional-immersion)
to obtain the actual native `SmoothCircleEmbedding (𝓡 3) (sphere 0 1)`, with the
pointwise formula above. Prove smooth corestriction to the sphere and use the
chain rule for its ambient inclusion to transfer the nonzero differential to the
sphere tangent map. Compactness supplies the topological-embedding part;
the immersion criterion supplies the required smooth local normal form.

For `p=1`, construct the isotopy of embeddings
`u↦(sqrt(1−s²)u,su^q)`, decreasing s from `1/sqrt(2)` to zero.
The first coefficient stays positive, so injectivity and immersion persist.
Use [Layer3's smooth-family extension](#gt3-smooth-family-isotopy-extension)
to reach the native `TauCeti.unknot`.
Simultaneous conjugation handles p=−1; coordinate interchange handles q=±1.
Thus every coprime pair with `|p|≤1` or `|q|≤1`, including a zero entry, gives an
unknot. The converse and chirality are supplied by the
[GT6 torus-signature calculation](#gt6-torus-signatures). `(0,0)` is a constant map
and is excluded from the knot carrier. Retain the general multiple-component
and gcd torus-link targets as well.

Identify the model with the course's flat-torus winding pair: for
`u=exp(2πit)`, its coordinates `(x,y)=(qt,pt) mod ℤ²` have slope p/q.
Here x is the second complex phase and y the first, both modulo one. Include
the vertical/horizontal cases without division. For the three-dimensional
picture use stereographic projection from `(0,0,0,1)`, which misses the Clifford
torus. Its image is the torus of revolution
`(sqrt(y₀²+y₁²)−sqrt(2))²+y₂²=1`. The first complex-coordinate circle is the
longitude, and the second is the meridian with its transported orientation.
Prove this smooth presentation comparison and the realized braid-closure comparison
`(σ₁⋯σ_(p−1))^q` for coprime p>0 and integer q, with the existing positive-crossing convention.
For negative p use |p| strands and the mirror/reversal identifications. In particular,
identify the positive `(2,3)` model with the named right-handed trefoil.
The symmetric flat-torus square alone is not an ambient-isotopy proof.

Construct the ambient coordinate interchange explicitly. For `z=(z₀,z₁)∈ℂ²`, put
`P₊z=((z₀+z₁)/2,(z₀+z₁)/2)` and
`P₋z=((z₀−z₁)/2,−(z₀−z₁)/2)`, and define
`U_t=P₊+exp(πit)P₋`. Prove joint smoothness, norm preservation, inverse `U_(−t)`,
`U₀=id`, and `U₁(z₀,z₁)=(z₁,z₀)`. On `I×S³` construct the level-preserving
smooth diffeomorphism `(t,x)↦(t,U_t x)`, with inverse `(t,x)↦(t,U_(−t) x)`.
Its identity at time zero supplies exactly the native `TauCeti.Diffeotopy` fields.
It gives an orientation-preserving ambient isotopy carrying the parametrized
`κ_(p,q)` to `κ_(q,p)`.

Fix the smooth mirror operation on native S³ presentations as
`transDiffeomorph` by the sphere diffeomorphism induced by
`(x₀,x₁,x₂,x₃)↦(x₀,x₁,x₂,−x₃)`. This is an actual fixed reflection,
not a choice among all orientation-reversing diffeomorphisms. Under the specified
realification it is `(z,w)↦(z,conj w)`, with determinant −1, and sends
`κ_(p,q)` exactly to `κ_(p,−q)`. Prove the corresponding equality of parametrized
embeddings. To compare with the diagram mirror, rotate the `(x₂,x₃)` plane
through π, fixing x₀,x₁. Its endpoint is `diag(1,1,−1,−1)`, whose composition
with the fixed x₃ reflection is x₂ reflection. This SO(4) path compares the two
mirror presentations by ambient isotopy. The x₂ reflection fixes the stereographic
pole and becomes `y₂↦−y₂` in ℝ³, negating every crossing for projection to the
`(y₀,y₁)` plane. The fixed x₃ reflection itself exchanges the two poles.
Simultaneous conjugation has real determinant +1.
Realize it by rotating the plane of the two imaginary coordinates through π while
fixing the two real coordinates. This is an ambient isotopy from the identity,
ending at `κ_(−p,−q)(u)=κ_(p,q)(u⁻¹)`, and therefore proves invertibility with
its actual orientation transport. Also prove
`κ_(−p,q)(u)=κ_(p,−q)(u⁻¹)`; applying this inversion isotopy to the mirror gives
the source's single-p-sign mirror comparison as an oriented knot comparison.
[The source-input note](source-inputs.md#torus-symmetry-source) preserves the
literal negative-p braid notation and its positive strand-count interpretation.
These are ambient-sphere constructions, rather
than an assumed extension of a torus mapping class. The companion
[TorusKnotTargets.lean](TorusKnotTargets.lean) supplies the coordinate formulas and
representative signatures; the smooth-embedding and native-isotopy comparisons
remain targets of these paragraphs.

For each clasp sign ε=±1 and meridional twist m∈ℤ, define the standard Whitehead pattern W_(ε,m) in a marked solid torus. Its algebraic winding is0 and geometric wrapping is2: give an explicit meridional disc meeting it twice, and exclude a disjoint meridional disc using the independently certified nonsplitting of the Whitehead link; prove mirror and meridional twists preserve this index. For every companion J, construct a once-punctured-torus spanning surface and one-clasp-change unknotting witness for W_(ε,m)(J), giving genus≤1 and u≤1, with nontriviality required for equality. For NONTRIVIAL tame J, prove the companion torus essential and the Schubert satellite bridge inequality b(P(J))≥w_geom(P)b(J), with w_geom the minimum geometric meridional-disc intersection number. Construct a doubled b(J)-bridge position with the clasp and all twists on monotone strands and exactly2b(J) maxima; conclude b(W_(ε,m)(J))=2b(J). For J the unknot, give the actual rational twist-knot/unknot diagram branches separately: bridge1 when the result is the unknot and bridge2 otherwise. The essential-satellite lower bound is not applied to that branch.

Certify the infinite genus-one twist family (fixed rational convention [2,2n],n≥1, determinant4n+1 and one-clasp-change certificate), proving pairwise distinction/nontriviality then primality by genus additivity. For the separate arbitrary-genus/unknotting-number-one source family, use physical pages73–76 of the course *Knot Theory.pdf* (source identity `ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`), with exact paragraph identities `KM-P073-B004–B007/B009`, `KM-P074-B004–B016`, `KM-P075-B004–B008/B010` and `KM-P076-B004–B006/B009` in the source index. The source convention is `V_ij=lk(x_i,x_j^+)`. On 1-based indices and for `k≥1`, the page75 algebraic template has size `2k`: `V_11=V_(2k,2k)=1`, `V_(i,i−1)=−1` for `2≤i≤2k`, `V_(i,i+1)=−1` for even `i` with `2≤i<2k`, and every other entry is zero. Prove the tridiagonal-continuant identity `det(V−tVᵀ)=(-1)^(k−1)(1−t)^(2k)+t^k`; its nonzero extreme coefficients give span `2k`, including `k=1`. The distinct page74 six-circle example has matrix `V_3−E_44`: its determinant is `1−5t+11t²−13t³+11t⁴−5t⁵+t⁶`, whereas the page75 `k=3` matrix has determinant `1−6t+15t²−19t³+15t⁴−6t⁵+t⁶`. Retain both matrices; their page74/page75 fourth diagonal entries are respectively `−1` and `0`. The self-contained [source-input note](source-inputs.md#two-distinct-seifert-matrices-and-the-general-template) supplies both six-by-six matrices, the general template and the corrected three page74-array entries; these are transcript corrections, not source errors. The exact page76 oriented band/closure data, marked crossing and `2k` basis-to-band correspondence remain a source-input hold: recover these data and prove their match to this algebraic template, an actual genus-`k` spanning surface, and the one-crossing-change unknotting certificate. Explain the printed “`k` bands” and its relation to `2k` basis generators instead of assuming a handle count. A generic realization of the same Seifert matrix does not certify the literal source family; this qualification retains the full geometric target. Give actual genus-k spanning surfaces and nontriviality before asserting g=k/u=1. Include all source independent-invariant connected-sum/doubling families, exact lower/upper bounds and indices.

**Algebraic API for the page75 family.** Use the native finite matrix carrier:
`V_k : Matrix (Fin (2*k)) (Fin (2*k)) ℤ`. Translating the displayed 1-based indices
to `Fin`, the extra superdiagonal entries occur at odd zero-based row indices;
the endpoints are 0 and `2*k-1`. Export the entry formulas and the identification
with `IntegralSquareMatrix`, retaining `k≥1` in the family theorems.
For `A_k(t)=V_k−t V_kᵀ`, define its leading principal minors `D_j`, including
`D_0=1`. Before the final endpoint, prove
`D_(2m)=t^m` and `D_(2m+1)=(-1)^m(1-t)^(2m+1)` whenever the indicated size is
less than `2*k`. Prove these by the tridiagonal determinant recurrence: the
products of opposite offdiagonal entries alternate between `−t` and `(1-t)^2`,
and every internal diagonal entry is zero. The last recurrence is
`det A_k=(1-t)D_(2k-1)+t D_(2k-2)`; it includes `k=1` without an internal-block
exception.

Export the polynomial's constant and degree-`2*k` coefficients, both
`(-1)^(k-1)`, its degree `2*k`, and its value 1 at `t=1`. Compare this polynomial
with native `KnotTheory.alexanderMatrix`, whose convention is `T·V_k−V_kᵀ`,
by transposing and negating the source matrix in even dimension. Under the
polynomial-to-Laurent map, native `KnotTheory.alexander V_k` is `T(-k)` times
this determinant. Prove inversion symmetry, support in `[-k,k]`, and nonzero
coefficients at both endpoints, yielding span `2*k` with normalization at 1.
The suggested [SeifertFamilyTargets.lean](SeifertFamilyTargets.lean) fixes the
matrix and native comparison. These algebraic statements use the specified
matrix; the page76 geometric identification remains the separate target above.

The late surgery/tangle-replacement targets in GT7 supply u=1⇒prime and the cyclic-surgery obstruction for u(8₃)=2. Early genus, connected-sum and diagram constructions do not consume those late theorems. Specify Bleiler's example by two explicit diagrams of the same realized knot, a two-change unknotting witness, signature4 lower bound, and exhaustive failure of all crossing-change pairs in the displayed minimal diagram. An assertion about ALL minimal diagrams additionally requires their actual classification.

Add the explicit ambient-model comparison used by source169: every compact smooth surface admits a smooth embedding in R⁴; a closed connected surface embeds in R³ iff orientable. Construct the orientable models as boundaries of standard embedded handlebodies. For a closed nonorientable surface, prove the nonembedding obstruction by the compact hypersurface separation/two-sided-normal theorem and the induced orientation from oriented R³, stating and proving the needed separation adapter rather than assuming orientability in that adapter. Construct RP² in R⁴ by choosing a UNIT representative v∈S² of [v] and using the Veronese map [v]↦sqrt(3/2)(vvᵀ−I/3) into the unit sphere of the five-dimensional trace-free symmetric matrices with the Frobenius inner product. Equivalently normalize vvᵀ/(vᵀv)−I/3 for any nonzero representative: its only ambiguity is v↦−v, its derivative is injective on tangent vectors, and compactness makes it an embedding. The image misses the unit trace-free pole diag(1,0,−1)/sqrt(2), which has three distinct eigenvalues, whereas each normalized Veronese image has a repeated eigenvalue. Stereographic projection of S⁴ from that explicit pole, restricted to the Veronese image, gives a genuine smooth embedding in R⁴; no arbitrary linear projection R⁵→R⁴ is used. For a compact connected nonorientable surface with nonempty boundary, realize its standard once-punctured crosscap model as boundary connected sums of standard embedded Möbius bands in disjoint3-balls, joining their boundary intervals by disjoint collars/tubes; remove further disjoint interior discs for extra boundary components. This gives the R³ embedding, with its actual boundary marking and smooth collar comparison. Closed nonorientable R³ nonembedding is stated only in the tame/locally-flat category. Form higher closed crosscap R⁴ models by embedded connected sums in disjoint4-balls using disjoint joining tubes, and puncture for boundary models. Supply the actual smooth/triangulated classification comparison and all component cases. Prove these embedded-model comparisons in addition to the abstract Euler/classification theorem.

#### GT4: splitting and prime decomposition of links

For tame links in oriented S³, define splitting by a locally flat sphere disjoint
from the link with nonempty sublinks on both sides. Construct a finite family of
disjoint balls whose intersections with the link are nonsplit sublinks, with
component labels and orientations retained. Prove exhaustion and independence
of the nonsplit component partition. At each split the number of components in
each nonempty branch strictly decreases. Use Layer2's locally flat Schoenflies
and low-dimensional annulus comparisons and item3g's independent relative
PL/smooth comparison; do not consume a hyperbolic or later exterior theorem.

Construct connected sum along ONE selected oriented component in each of two
links, with marked small trivial arcs and the orientation-compatible gluing.
Its component count is μ₁+μ₂−1. Prove independence of the auxiliary arcs/balls,
associativity with the selected component data, commutation with exchanged inputs,
and the unknot identity. Simultaneously joining all pairs of components requires
specified bands or string-link data and is a different construction.

Extend ordinary Seifert genus to every nonempty oriented link by minimizing over
connected compact oriented spanning surfaces. Build these surfaces from the
existing Seifert algorithm, joining components by interior tubes, and prove
attainment and isotopy invariance. Prove genus additivity for the selected-component
sum: boundary-connected surfaces give the upper bound; for the lower bound put a
minimum surface transverse to its decomposing sphere, remove intersection circles
by innermost-disc surgery with the actual collar and capping data, and recover
connected spanning surfaces on the two sides without increasing total genus.
Track all boundary components, including those outside the selected component.
Consequently β(L)=2g(L)+μ(L)−1 is additive under this sum; it is zero exactly for
the unknot and is positive for every other nonempty link. Each nontrivial sum
therefore has two factors of strictly smaller β.

Carry recursive cuts in a punctured S³, with each boundary sphere meeting the
proper embedded one-manifold in two oppositely oriented endpoints. Define its
closure by capping each boundary with a trivial arc and prove capping independence.
If a closure is composite, move a decomposing sphere off the previously capped
balls by relative collar/radial isotopies; prove that the resulting cut inside
the punctured S³ has the same closed factors. Thus recursion produces a finite
system of disjoint two-point spheres whose closed pieces are prime nonsplit
links. Prove the equivalence between this primeness and the two-point-sphere
criterion: one ball contains just a single unknotted arc and no other components.
The unknot and split links are separate branches.

Prove uniqueness of the unordered prime-factor types by comparing two sphere
systems: remove innermost intersection circles while preserving the closed
factors, treating separately discs meeting the link zero or one times, then
compare the disjoint common refinement. Retain the actual component/gluing-tree
data for reconstruction; an unordered list of factors alone need not encode all
attachment data. Export naturality under relabeling, mirror and component reversal.
This is an early GT4 supplier for late finite classifications. No crossing-number
additivity or crossing-bound truncation is inferred from it.

Reference: Hashizume's link factorization theorem and the punctured-sphere
construction in [Melikhov, Local knots and the prime factorization of links,
§§2–3](https://arxiv.org/html/2511.19579v1).

#### GT4: Rational tangles and finite diagram enumeration

Define relative four-ended oriented/unoriented realized tangles in a ball with marked NW/NE/SW/SE boundary points and collars; define endpoint-fixing ambient isotopy and its exact relative plane Reidemeister counterpart. General tangle strands may contain local knots, so do not promise every tangle can be unknotted strandwise. Define integer twists, rotation/reflection, horizontal/vertical composition and numerator/denominator closures; prove representative independence and the actual source convention. Use projective rational slopes Q∪{∞} with total inversion (0↔∞) and total INTEGER translations x↦x+n fixing∞, the operations needed by continued fractions; no global field addition at∞ is asserted. Thus intermediate0/infinity is retained. Define the source's reversed continued-fraction recursion cf(a₁,…,a_n)=a_n+1/(…+1/a₁). Its positive canonical domain consists of all a_i>0 and, for n>1, a₁≥2; single-entry positive integer expansions include1. Obtain the negative canonical domain by sign reversal (a₁≤−2 for n>1, single-entry−1 allowed). Prove uniqueness on those exact domains. Treat0 by its separate single-entry representative and∞ by a distinct projective representative; unrestricted signed words need not be unique. Preserve the source's negative restriction on a_n and its omitted±1 boundary branches as literal source corrections. Prove the rational-tangle classification through boundary double covers or a complete endpoint-fixed twist reduction, not merely equal rational arithmetic. Export slope bijection, constructors, inverse/rewrite identities, closure component parity and the fact at least one of numerator/denominator is a knot.

Prove that a rational knot has bridge number at most2, and that a nontrivial knot is rational iff its bridge number is2, via both geometric bridge constructions. Keep the rational unknot (including p=1) in its separate bridge1 branch. State the Schubert classification with explicit reduced fraction p>0,p odd,gcd(p,q)=1 and the chosen orientation/mirror equivalence: unoriented orientation-preserving ambient equivalence has q′≡q^(±1)modp; allowing ambient reflection adds the negative classes. If oriented/marked equivalence needs a different quotient, state and prove it separately before using that branch. Preserve the printed q′≡q-only criterion as a narrowed/false literal, not the full classification. Derive mirror/amphicheiral conditions under this dictionary, and certify all7₃/8₂/list examples with actual codes.

Define positive algebraic-tangle syntax from the pinned integer constructors and operations; prove its realized numerator alternating with hypotheses that prevent degenerate/ambiguous notation. Define exact orientation-compatible Conway mutations (the three half-turns and identity, plus separately any reflected diagrams allowed by source wording); do not identify an unexplained eight-picture family with four oriented mutants. Prove HOMFLY mutation invariance through the two-string skein module and its cleared denominator closure identity, with μ=−(l+l⁻¹)/m. Do not divide by1−μ² in the Laurent ring without localization. Certify all named mutant/signature/genus/Alexander-one and11_388 examples using their actual codes and invariants.

Construct signed Dowker encodings together with realizability/rotation/outerface and crossing-free data, source order/sign convention, decoder soundness and completeness. A plain integer word without these certificates is not an arbitrary realized knot. Consume native Gauss/PD/permutation triples and connected-triple rigidity; certify plane/sphere shadow equivalence, face-orbit actions and reflected triples by propagated images of one half-edge rather than factorial search. For the seven-crossing outerface example enumerate all28 candidate sheet images in each permitted orientation branch, prove no allowed map interchanges the selected outerfaces, and separately certify sphere equivalence.

For every fixed component count μ and crossing bound N, give a finite enumerating carrier of ALL realizable plane link diagrams with μ components and at mostN crossings. Include disconnected positive-crossing shadow components, crossing-free circles, the plane nesting/outerface forest, crossing signs, component ordering and orientations. Bound the finite permutation/rotation/attachment data by (μ,N), enumerate it and check realizability; an arbitrary integer word is not a plane embedding. Extract such data from every regular projection with that bound and prove realization recovers its geometric link. Thus every μ-component link with crossing number≤N has a representative in the finite carrier, independently of the late equivalence/classification/minimality algorithm. The μ=0 empty link, N=0 unlinks, and connected knot-shadow subcarriers are explicit branches. State the exact numerical upper bounds proved by this encoding. Distinguish the source's two DT reconstruction exponents and their proof obligations; an independent upper bound does not authenticate an invalid source derivation.

For alternating/adequate diagrams, define state graphs, nugatory crossings and reduction by actual planar separation. Prove arbitrary connected n-crossing diagram bracket span≤4n and reduced alternating equality by adequate all-A/all-B extreme states and no cancellation. Export alternating crossing minimality, equal crossing counts and precise bracket-to-Jones t-span scaling. For adequate diagrams supply the full appropriate Kauffman extremal-degree/cabling argument; do not incorrectly replace it by alternating4n equality. Define actual flypes, preservation of realized knot/crossing data, prove full prime reduced alternating flyping and the composite extension used by the source. Menasco decomposition gives alternating connected-sum crossing additivity; no general crossing additivity theorem is asserted. All illustrated flype/state/reduction exercises require explicit finite codes/move sequences.

#### GT4: Knot groups, Fox calculus and braid algorithms

Keep the native PD Alexander carrier precise. Its AlexanderModule is the UNREDUCED quotient of the free Laurent module on halfedges plus crossing-free components by arc/crossing relations. Sending every generator to1 gives an augmentation ε:M→Λ, Λ=Z[t,t⁻¹]; for a nonempty based diagram the chosen meridian generator defines a Λ-linear section, so M≃kerε⊕Λ. The unknot therefore has M≃Λ but kerε=0. Consume actual GT4's geometric Fox/infinite-cyclic-cover comparison to prove that the reduced kernel (with basepoint/meridian transport) identifies with H₁ of the infinite cyclic cover; the whole native M is not literally that H₁. Compare presentations/Fitting indexing explicitly: for a knot, nativeE₀=0 and nativeE₁=(Δ), while the reduced torsion module has its0th order ideal(Δ). The native file's informal classical-module wording is not a proof of this geometric comparison. Preserve crossing-free/multicomponent branches rather than infer a knot torsion decomposition for arbitrary link modules.


Consume GT4 Wirtinger/Fox/Alexander target and native fundamental-group maps/van Kampen at their actual types. Add the source-specific finite-cover proof, explicit meridian paths, all crossing orientation cases and the redundancy of one Wirtinger relator for a connected knot diagram with n≥1 crossings. The zero-crossing unknot has a generator and no relator, not a redundant nonexistent relation. Every presentation conversion carries forward/inverse generator maps proving the relations and mutual inverse homomorphisms. Arc elimination requires exact propagation and remaining consistency equations; source180's literal inconsistent relator is not accepted by generic invariance.

Pin Fox derivative D_i on the free GROUP RING, augmentation ε and D_i(uv)=D_i(u)ε(v)+uD_i(v), D_i(x_j)=δij and D_i(x_j⁻¹)=−x_j⁻¹δij. The printed ordinary Leibniz with that inverse rule is inconsistent. Prove the fundamental formula, presentation naturality, meridional specialization and GT4 infinite-cyclic/Fitting dictionary. Give all source finite two-generator PRIME-under8 presentations and polynomial certificates; include composites with correct larger presentations and retain the source's false universal two-generator wording separately.

Own group-Z⇒unknot with its actual loop theorem/Dehn lemma and compressible-boundary argument, not just the native complement-group carrier. State the exact knot-complement theorem for tame knots in oriented S3, including what homeomorphisms/peripheral orientation/meridian data give ambient isotopy, mirror or orientation reversal. Do not assert that abstract groups distinguish a chiral knot from its mirror. Any prime-knot-group reconstruction result must include the precise needed peripheral, orientation and exceptional torus/composite data; the source's unmarked implication remains qualified until that exact result is specified/proved. It is acceptable to prove an appropriately marked group recognition theorem and explicitly leave the broader source assertion as a corrected-source hold; do not claim a narrower theorem closes it.

For each finite strand number n, consume native Artin braid groups/words and construct the positive braid monoid, its embedding into B_n and its group-of-fractions comparison. Construct the Garside half twist Δ, its finite simple divisors identified with permutations, left/right gcd/lcm and the greedy normal form Δ^k s₁⋯s_r with each adjacent pair left-weighted. Prove existence, uniqueness and executable multiplication/inversion/reduction; thus decide equality of finite braid words. For the conjugacy theorem cited on source090, construct super-summit representatives with maximal infimum and minimal supremum in the conjugacy class, an effective terminating procedure finding one, and the finite graph of simple-element conjugations staying in that set. Prove its nonemptiness, finiteness and connectedness within one conjugacy class, including central/periodic and n=0/1/2 cases. The algorithm decides conjugacy iff the two complete finite reachable sets intersect, returning an actual conjugator on success and an exhaustive certificate on failure. A normal form alone does not decide conjugacy, and cycling alone is not asserted complete. This mathematical target is not a Markov-equivalence algorithm; the source's historical absence-of-known-Markov-algorithm sentence stays dated provenance.

##### Five-one group, Fox

For the positive two-strand braid closure `σ₁⁵`, identified geometrically with
the torus knot `T(2,5)`, carry out the Wirtinger eliminations giving
`⟨x,y | R=1⟩`, where
`R=xyxyx y⁻¹x⁻¹y⁻¹x⁻¹y⁻¹`, equivalently `xyxyx=yxyxy`.
Both x and y are positive meridians. Use native `PresentedGroup` and give the
explicit isomorphism to `⟨a,b | a²=b⁵⟩`: set `a=xyxyx`, `b=xy`, with inverse
`x=b⁻²a`, `y=a⁻¹b³`. Check both relations and all four generator identities.
The meridional homomorphism sends x,y to1, hence a to5 and b to2.
Compare this actual presentation with the native complement fundamental group
by the geometric Wirtinger theorem and the chosen basepoint paths.

Over the existing Laurent ring `Λ=ℤ[T;T⁻¹]`, write `t^k` for the native monomial
`T k` for integer k, and specialize both meridians to `t=T 1`. Then
compute the Fox row exactly as `(A,−A)`, where
`A=t⁴−t³+t²−t+1`. For the signed word, each positive occurrence contributes
`t^s` and each negative occurrence contributes `−t^(s−1)`, with s the exponent
sum of its preceding letters. Prove that this word computation agrees with
the generic group-ring Fox derivative and is unchanged by free reduction.
Its reduced Alexander module is `Λ/(A)`; its unreduced module is
`Λ ⊕ Λ/(A)`, with the augmentation and chosen-meridian splitting above.
For the quotient of `Λ²` by the row `(A,−A)`, the splitting maps are
`[u,v]↦(u+v,[−v])` and `(c,[d])↦[c+d,−d]`; prove their independence
of representatives and their mutual inverse laws.
Give the presentation maps and compare their Fitting ideals to the native
PD module, retaining `E₀=0` and `E₁=(A)` for that unreduced module.

The symmetric normalization is `Δ=t⁻²A=t²−t+1−t⁻¹+t⁻²`, so `Δ(1)=1`,
`Δ(−1)=5`, and the knot determinant is5. The five-crossing two-Seifert-circle
surface has genus2; the Alexander degree bound proves minimality. The reduced
Fox-coloring space over `ZMod p`, for prime p, has dimension1 for p=5 and0
otherwise: specialization at t=−1 gives the relation `5(x−y)=0`.
In particular there are25 full5-colorings and20 nonconstant ones.
These computations are attached to the realized positive braid; its mirror
has the same Alexander polynomial and determinant.
The literal signed word, native presentation types and representative targets
are in [`FiveOneTargets.lean`](FiveOneTargets.lean).

#### GT4: Jones trace, special values and braid obstructions

Consume actual TL operator A1–A5's positive quotients and trace/finite-block interfaces, GT4's geometric Jones/bracket/Markov comparison, and the full [TypeAHeckeAlgebras H1–H4a](../TypeAHeckeAlgebras/README.md) supplier only for the full Hecke statements. Construct no second generic TL presentation, normalized trace or two-variable HOMFLY owner. Pin the level: source n projections generate the(n+1)-strand algebra, whereas a closure of a braid on n strands uses the appropriate n-strand level. For t≠0,−1 and a chosen u≠0,u²=t, normalized projections satisfy p_i p_(i±1) p_i=τp_i with τ=t/(1+t)² and braid units g_i=u*((1+t)*p_i−1). Prove inverse, far commutation, braid relation, trace(g_i)=trace(g_i⁻¹)=−u/(1+t), inclusions, and agreement with the current native signed-loop crossing representation. Check these identities against the native signed-loop crossing convention.

For t>0 or t=exp(±2πi/k),k≥3, consume the ACTUAL positive trace quotient at δ=u+u⁻¹ (including sign transport if needed), and compare the faithful quotient trace rather than declare the unquotiented root algebra faithful. Give its finite matrix/path decomposition, positive weights, normalized Jones projection laws, inductive trace representation and precise Powers-state tensor realization. Resolve the printed C^(2n+2) dimension separately from the actual tensor dimension; do not authenticate the exponent from the expected model. The statistical-mechanics assertion additionally requires defined Potts/ice partition functions, lattice/boundary/temperature parameters and a local transfer-matrix correspondence whose global partition functions agree; a shared TL relation alone is insufficient. Retain this as a required explicit comparison target or an unresolved mathematical branch, not biography.

Prove the closure trace formula V_cl(b)(t)=(−(1+t)/u)^(n−1)*tr(r_t(b)) by both signs of stabilization and conjugation and the existing geometric Markov theorem. Compare to the universal Laurent Jones invariant before specializing and prove the component-parity support: μ odd gives Z[t±1],μ even gives u*Z[t±1]. Mirror t↦t⁻¹ and all-component reversal reuse existing invariance; individual reversal multiplies by t^(−3lk(component,rest)) with exact writhe/linking signs. Component-chosen connected sum gives multiplication; split unions have the declared loop factor. Preserve the missing source Theorem6 wording as a source truncation even though its separately specified multiplicativity consequence is written here.

At unit-root t with every k≥3, δ=2cos(π/k)≥1 and r_t(b) is unitary in the faithful positive quotient. Prove |tr U|≤1 and tr U=1 iff U=1 from tr((U−1)* (U−1))=2−2Re tr U. Thus V_cl(b)=(−δ)^(n−1) iff r_t(b)=1 in the pinned square-root/phase convention. For k>3, where δ>1, if b lies in that kernel, its closure cannot have a smaller braid-strand representative, because the latter has Jones magnitude≤δ^(m−1). Export exact braid-index minimality including all component cases where closure exists. At k=3,δ=1 the strict comparison fails and no such inference is made. For the flat diagram-basis algebra TL_n over ℚ(u), t=u², define the generic braid map and its regular finite-algebra representation. For each transcendental u₀∈ℂ prove coefficient evaluation injective on the specified rational-function domain, hence ker(r_generic)=ker(r_(u₀²)). Also prove the actual trace criterion V_cl(b)(u₀²)=(-(u₀+u₀⁻¹))^(n−1) iff r_(u₀²)(b)=1. For its forward implication first obtain generic trace1 by coefficient injection. Specialize at infinitely many u_k=exp(πi/k) with k>n+1 and every denominator nonzero; prove the positive trace is faithful on the WHOLE finite TL_n at these levels. Unitarity then gives r_k(b)=1. Every diagram-basis coefficient of r_generic(b)−1 vanishes at infinitely many distinct u_k, hence is the zero rational function. Transport the resulting equality back to u₀. The converse is immediate. Supply all flat-basis, specialization and finite-level faithfulness adapters from the TL owner; a negligible root quotient alone does not give this argument. Generic faithfulness of the full representation remains a precisely stated historical problem; no unproved faithfulness theorem is required or asserted. Source's gcd-of-exponents corollary stays conditional until the actual exponent convention is recovered; it cannot mean gcd of arbitrary braid-word letters.

Prove the positive/negative word-count degree obstruction b_+−3b_-−n+1>0 with its correct nontriviality scope and convention; identify the positive-braid signature input rather than assume a degree conclusion from word counts. For every n≥1, put m=n+1 and c_m=σ₁⋯σ_(m−1) in B_m. Construct the explicit family β_(n,p)=c_m^(mp), p≥1. Read the word in the declared stacking convention: one c_m block moves the incoming first label across every other label and cyclically rotates the label list. In m blocks every label moves first exactly once, so the endpoint permutation is the identity and each unordered pair crosses exactly twice positively. The realized closure therefore has m components, with every pairwise linking number p. Prove this using the geometric closure/component-cycle and half-signed-mixed-crossing comparisons. The multisets of absolute pairwise linking numbers distinguish all p, even after component reorientation or ambient reflection.

For any U,V∈B_n under the inclusion fixing strand m, prove that an m-component closure of γ=Uσ_n⁻¹Vσ_n has a pair of components with linking number0. Its endpoint permutation is the identity. Tracking strand m through the two displayed swaps forces the permutation of V to fix n; then tracking strand n forces that of U to fix n. The components starting at n and m consequently cross each other only at the displayed negative and positive crossings: during U the latter is stationary at m, and during V the former is stationary at m. Their signed mixed-crossing sum is0. Ordinary closure arcs add no mutual crossings. Thus no β_(n,p) closure is isotopic to ANY closure Uσ_n⁻¹Vσ_n. This constructs pairwise nonisotopic oriented closed links and proves the universal nonexchange obstruction using only early braid, realized-closure and linking interfaces. For n=1 the exchange form is the two-component unlink and β_(1,p)=σ₁^(2p); keep this boundary branch explicit. The source's literal infinitely-many-WORDS claim follows; pairwise inequivalence of the family closures is also proved.

Suggested native braid-family, ordered word-evaluation and endpoint-permutation forms are in [`ExchangeFamily.lean`](ExchangeFamily.lean).

For n=3 separately prove that all but finitely many powers of σ₁⁻¹σ₂σ₃ give the stated nonexchange examples, with an explicit excluded finite set. That particular B₄ family is an additional target; the c_m^(mp) construction does not identify its powers or supply their obstruction. No Jones-kernel or full TypeA estimate is needed for the c_m^(mp) proof. For the actual native reduced Burau representation of B₅ at t=exp(πi/3), construct its comparison with the faithful four-dimensional Coxeter representation of the cubic quotient B₅/⟨⟨σ_i³⟩⟩. Prove this quotient has order155520, identify its scalar centre of order6, and identify the projective image with PSp₄(𝔽₃), proving simplicity and order25920. Give exact matrix/generator, kernel and finite enumeration certificates. Distinguish the full linear image from its simple projective quotient. Track the scalar phase in the Burau/Jones block comparison: a projective-kernel witness supplies a Jones-kernel witness only after its actual scalar is proved to be1 in the pinned normalization. Proving this precise representation theorem does not identify a clipped historical representation citation without the separate source crosswalk.

Prove V_K(exp(2πi/3))=1, V_L(1)=(−2)^(μ−1), V'_K(1)=0, and the chosen-square-root V_L(−1)=Conway-normalized Δ_L(−1) comparison on the actual coefficient rings. Formal Laurent derivative/evaluation and analytic derivative near1 agree. Deduce DIVISIBILITY of1−V_K by(1−t³)(1−t) in Z[t±1], with the double root at1, and define W_K as the unique Laurent quotient. Prove mirror and connected-sum identities and all source normalized examples, including unknot0/trefoil1. Use the signed symmetric knot normalization Δ(1)=1 for the modulo8 theorem (values1 or5), not the absolute determinant. Consume GT4's existing quadratic-Arf interface and Clifford representations to prove V_K(i)=(−1)^Arf(K), hence W_K(i) is exactly0 or1 and agrees with the mod2 Arf class. Link root values require the actual properness/component/square-root phases; do not transplant the knot statement unchanged. The sixth-root arithmetic statement requires its exact knot/link hypotheses and algebraic-integer ring.

For actual reduced Burau B3 and native positive-generator Jones convention, prove tr/determinant comparison and, for a knot closure with even exponent sum e,

V_cl(b)(t)=t^(e/2)*(t+t⁻¹+1+t^e−t^(e/2−1)*(1+t+t²)*Δ_cl(b)(t)).

This has the missing+t term relative to the literal source21 formula, and gives1 for b=σ1σ2. Derive it from det(I−Burau)=1−tr(Burau)+t^e and the symmetric Alexander normalization; check the native stabilized positive trefoil value t+t³−t⁴ and mirror transport. For knot closures in B4 (e odd), prove the precise source22 reciprocal relation

t^(−e)V(t)+t^e V(t⁻¹)=(t^(−3/2)+t^(−1/2)+t^(1/2)+t^(3/2))*(t^(e/2)+t^(−e/2))−(t⁻²+t⁻¹+2+t+t²)*Δ(t).

Prove its actual reduced-Burau/Hecke-block and trace-weight decomposition; test identity closure calibrations before applying it. Derive every claimed3-/4-braid obstruction at i and fifth roots with the correct real-valued symmetric Alexander evaluation, absolute-value hypotheses and rigorous constants. A historical43-of59 enumeration is not proved by a generic obstruction; bind all finite table cases separately.

All Table1/Table2 occurrences, including braid words, compact signed coefficient strings, W, root values and seven explanatory notes, are exact finite targets with native polynomial certificates AND geometric named-link/diagram identification. Preserve orphan−5/2, clipped8_15 braid exponents, trefoil root connector and A/B narrow strokes as source holds. Construct explicit Jones mirror-detection counterexamples with realized chiral knots and matching polynomials; do not assert the historical chirality conjecture. Prove the source's same-invariant/different genus or signature examples with independent geometric invariants rather than polynomial inequality alone.

#### GT4: Controlled moves and polynomial proof routes

<a id="gt4-two-marked-crossing-changes"></a>
**Marked crossing changes in problem4.** Construct the realized oriented
PD/plane diagram of the eleven-crossing knot in physical-page1 problem4 of
*Knot Theory - problems.pdf*, and identify the crossings marked in physical
pages20–22 and201–202 of *Knot Theory.pdf* (source identity
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`).
For the page20 change, give a finite realized Reidemeister movie to the unknot,
expanding the indicated strand slides and repeated moves into individual local
moves. For the different page21 change, construct its Alexander presentation
from the actual arc/crossing data, compute its polynomial unit class, and prove
nontriviality. Compare this computation with the literal page22 polynomial
`Q(t)=t²−5t³+10t⁴−13t⁵+10t⁶−5t⁷+t⁸`, identifying any source arithmetic error
rather than imposing this polynomial on the diagram. For this literal polynomial,
prove that `Δ_Q(t)=−t⁻⁵Q(t)` is symmetric, has `Δ_Q(1)=1` and
`|Q(−1)|=|Δ_Q(−1)|=45`. These algebraic identities alone do not identify the
changed knot. Recover the presentation from the marked diagram rather than
completing overwritten page22 matrix cells by guessing.

Realize the later A/B/C-labelled diagram and give the crossing correspondence
with the earlier drawings wherever it can be established. Construct the unknot
movie for A and the nontriviality certificates for B and C, including the
page202 nonconstant 3-colouring. Determine the B-changed diagram's connected-sum
decomposition by explicit diagram moves and compare it with the displayed
`3₁ # 6₃` claim. If that identification holds, Alexander multiplicativity gives
determinant `3·13=39`; it cannot also have the unit class of Q. The
[source-input note](source-inputs.md#marked-crossing-changes) records the missing
crossing correspondence and the two incompatible polynomial assignments.
Keep these geometric comparisons as explicit targets; neither source's asserted
outcome authenticates the other drawing.

<a id="gt4-alexander-disc-arc-route"></a>
**Alexander's disc-arc construction.** Develop the distinct constructive route
on physical pages36–37 of the same course source. Start with a finite realized
regular oriented diagram contained in the interior of a closed disc, with
transverse double crossings and its crossing/outerface data. Construct a smooth
proper simple arc joining two prescribed antipodal boundary points, equal to
radial segments near its endpoints, avoiding the crossings, meeting diagram edges transversely
in finitely many points, and meeting every complementary region. Include the
crossing-free circle and disconnected nonempty-link branches. Prove evenness
and positivity of the number of arc intersections with each component. Construct
a disc isotopy fixed near the boundary, extended by the identity outside, which
takes this arc to the straight diameter; transport the diagram, its orientations
and all crossing data. This planar preparation uses no Reidemeister moves.

On each oriented component choose an initial intersection and alternately mark
its successive intersections with the diameter as over and under relative to
that auxiliary line. These marks do not change any original diagram crossing.
Define a string from one marked over intersection to the next, and prove that
it has no self-crossing: a self-crossing would enclose a complementary region
missed by the diameter, since the intervening string has only one interior line
intersection. Supply the planar separation argument also when other diagram
components lie inside that region. Construct the subsequent spatial arrangement
around an unknotted axis and the cut to a braid, with simultaneous disjoint strand
isotopies, transported component orientations, endpoint order and the standard
closure identification. Prove its closure ambient-isotopic to the original
link; absence of individual string self-crossings alone does not prove the
required simultaneous braid monotonicity. The source's final passage is an
unjustified sketch, so this construction and its relative boundary/closure
comparisons are proof targets. Preserve the illustrated arc and string pictures'
unencoded crossing data separately from the general construction.

Prove checkerboard colouring for every realized finite plane link projection, including crossing-free circles and disconnected projections: choose the unbounded face, propagate parity across edges, and prove path independence by even mod2 intersection of a closed transverse curve with the immersed link. Export uniqueness up to the permitted connected-face adjacency choices and compatibility with plane/sphere outerface changes. A regular one-component knot shadow with n≥1 crossings has exactly two alternating crossing assignments; for n=0 there is one empty assignment. For the positive-crossing branch, prove the even-interlacement parity from planarity, propagate over/under alternation around the whole component, and show one of the two assignments differs at at most floor(n/2) crossings from a given n-crossing diagram. For a multi-component shadow state and prove its own compatibility conditions rather than silently transplant this knot bound. A descending based oriented knot diagram is an unknot by an explicit height straightening/isotopy; choose crossing changes to obtain it. Repeated RI creates a diagram with more than any prescribed finite number of crossings without changing knot type. These are geometric targets on realized diagrams, not claims that the initial source drawings have already been encoded.

For a convex planar polygonal knot, prove reduction to a triangle by reversible triangle moves with collision-free convex interior, including redundant collinear vertices via the chosen allowed-subdivision convention. Pin regular-projection density/openness for a fixed finite ordered vertex configuration and permissible perturbation radius: exclude double vertices, edge/vertex projection collisions, nontransverse projected crossings and simultaneous heights by finitely many proper algebraic conditions, then use a positive compact separation bound to construct the ambient isotopy. General C0 proximity of arbitrary embeddings does not suffice. Two spatial polygonal knots with identical regular diagram and crossing heights are ambient isotopic by a diagram-preserving height interpolation with local tubular support; export the tame smooth/PL comparison through the named owner.

Add finite local realized move certificates with plane outerface data, bounded Reidemeister move graph and exact hard-unknot predicate. An absence of initially decreasing moves plus no RIII suffices to force an initial increase; to claim every reduction has peak>7 also certify the initial count7 and every allowed same-count local move. The native combinatorial move predicates already include common-face/disconnected-component RII locality and HasReidemeisterThreeTriangle with acyclic-height RIII locality. Consume those conditions; what they do not yet provide is a realized planar diagram, distinguished outerface and its complete geometric local-move graph. That realized graph is the required adapter. All macro strand slides, loop retractions, Perko words, relative punctured-torus moves and source colored-label constructions retain their exact diagram data/uncertainties; generic theorem existence cannot authenticate the pictured source.

Retain the source's distinct full HOMFLY proof ideas alongside GT4's invariant contract: the Freyd–Yetter free Laurent word module and scalar-to-Artin/Markov/skein-quotient isomorphism, the corrected FY quadratic rule [u a a v]_n→−x⁻¹y[u v]_n−x⁻¹z[u a v]_n (source's triple-a glyph remains literal), explicit well-founded complexity, every pairwise/overlap reduction and terminal-normal-form theorem; the Hoste and Lickorish–Millett ordered/basepointed descending resolution and independence of resolution/basepoint/component ordering; the Ocneanu full Hecke permutation-basis/trace route from its [TypeAHeckeAlgebras H1–H4a](../TypeAHeckeAlgebras/README.md) owner. A proof that local move invariance holds in bounded induction does not prove any two isotopic diagrams have a crossing-nonincreasing path. Specify the common invariant comparison maps and normalization, not four competing polynomial carriers. The unresolved source reduction glyphs remain conditional source intent even when a corrected coherent rewriting theorem is supplied.

#### GT4: deletion, Brunnian links and braid-index certificates

Construct strand deletion on the geometric pure braid groups and compare it to
the kernel of the native braid permutation homomorphism. Deletion is a
homomorphism on pure braids; it is not asserted to be a homomorphism on the full
braid group with a fixed strand label. Compare deletion with link closure and
with deleting the corresponding oriented link component. Prove that the closure
of the identity pure braid is the standard unlink, with explicit isotopies and
component markings.

Use one-based indices for the following word formula, and export its exact
zero-based native dictionary. For `1≤i<j≤n`, put
`A_(i,j)=σ_(j−1)…σ_(i+1) σ_i² σ_(i+1)⁻¹…σ_(j−1)⁻¹`.
For each `n≥2`, let `β_n` be the right-nested commutator of
`A_(1,n),…,A_(n−1,n)`, using `[a,b]=aba⁻¹b⁻¹`; a one-term nested
commutator is that term. Construct its closure `L_n` as an actual oriented
`n`-component link. Prove that deleting any strand sends `β_n` to the identity:
deleting strand `i<n` kills the corresponding entry of the commutator, and
deleting strand `n` kills every entry. Supply the reindexing and the resulting
unlink isotopies, hence every proper sublink of `L_n` is an unlink.

Prove nontriviality of the CLOSED links, separately from nontriviality of their
braids. Construct based meridians, preferred longitudes and their nonrepeating
Magnus coefficients from the punctured-disc/free-group and Wirtinger carriers.
Prove the change-of-basing, component-preserving isotopy and closure comparisons.
For a Brunnian link the lower nonrepeating coefficients vanish, so the length-`n`
coefficient used here has zero indeterminacy. Compute a specified length-`n`
coefficient of `L_n` to be `+1` or `−1` in the pinned orientation/commutator
convention, and prove it vanishes on the unlink. Construct the necessary truncated
noncommutative Magnus algebra and the commutator/longitude calculation here;
the ordinary abelian Alexander polynomial is not this invariant. Thus `L_n` is
nontrivial. Different `n` have different component counts, giving an explicit
infinite Brunnian family. Compare `L_2` with the Hopf link and `L_3` with an
explicit Borromean diagram. These comparisons do not authenticate an unspecified
source picture. The free-group word calculation alone is not a proof that its
closure is nontrivial.

For every nonempty oriented link, construct its nonzero two-variable HOMFLY
Laurent polynomial in the existing `ρ(l,m)=P(l,l⁻¹,m)` convention. Define the
minimum and maximum `l` exponents from its actual finite support. Prove the
Morton–Franks–Williams support bounds for the closure of an `n≥1`-strand braid
of exponent sum `e`: every `l` exponent lies between `−e−(n−1)` and
`−e+(n−1)`. Give the full skein/Hecke proof using the earlier algebraic
HOMFLY construction or TypeAHeckeAlgebras H1–H2; trace positivity and the later
operator-algebra closure theorem are not premises. Compare the usual
`v⁻¹P₊−vP₋=zP₀` convention by `l=i/v`, `z=i m` after the faithful
coefficient extension to Gaussian integers, and prove this substitution
preserves exponent breadth. Export
`max_l(ρ)−min_l(ρ)≤2(braidIndex(L)−1)` and the resulting integer lower
bound, with the unknot and multicomponent normalizations checked. The support
bounds do not assert that this lower bound is sharp for arbitrary links.

Give a direct finite planar classification of knot diagrams with at most three
crossings: realized-code enumeration, complete simplifying moves to the unknot
or the two trefoils, and invariant certificates distinguishing the trefoils
from the unknot and from each other. State the result for knot TYPES of minimum
crossing number; unknot diagrams with one or two crossings do exist. This direct
small calculation has no late hyperbolic/exterior-classification premise.

After the existing late GT7 complete classification has supplied the exact
finite list of ALL knot types of crossing number below eight, compute the braid
index of every entry, including the unknot, composite knots and the declared
mirror/orientation quotient. Each result carries an explicit braid word, its
geometric named-link/diagram identification and an exact HOMFLY support
certificate giving a matching lower bound. Prove mirror/orientation transport
of the braid-index result. Enumerating diagrams or computing the polynomial
without these upper/lower certificates does not establish the minimum. This
finite consumer is not a prerequisite of the earlier braid, polynomial or
raw-enumeration constructions.


#### GT4: Universal knot counts and crossing-controlled growth

Define finite exact-crossing and bounded-crossing carriers of tame knot types
using the earlier realized-diagram and ambient-isotopy comparisons. Keep four
choices explicit: prime versus all knots, exact versus cumulative crossing
number, oriented versus unoriented knots, and orientation-preserving ambient
equivalence versus equivalence also allowing ambient reflection. Let `C_n` count
unoriented prime knots of exact crossing number `n` under orientation-preserving
ambient equivalence, and let `N_n` be its quotient also identifying mirrors.
Let `O_n` count all oriented knots of exact crossing number `n` under
orientation-preserving ambient equivalence. Construct the forgetful and mirror
quotients and prove their fibre bounds, including invertible and amphicheiral
fixed points. In particular `N_n≤C_n≤2N_n`; forgetting knot orientation has
fibres of size at most two. Finiteness uses the early finite realized-diagram
enumeration and its sound surjection onto knot types, not the late GT7
classification/minimality decision procedure. The unknot has crossing number0;
the no-knots-at1-or2 and trefoil cases consume the earlier direct≤3 proof.

Construct an explicit family using the earlier rational-tangle slope and
Schubert dictionaries. For a Boolean word `w` of length `m`, begin at
`(p,q)=(2,1)` and read the word from left to right, applying
`T₀(p,q)=(p+q,q)` and `T₁(p,q)=(p+q,p)`. Construct simultaneously a reversed
continued-fraction list beginning with `[2]`: `T₀` increments its LAST entry,
and `T₁` appends1. Prove its slope is `p/q`, all entries are positive, its
first entry is at least2, and its coefficient sum is `m+2`. Thus it belongs
to the earlier exact canonical domain, despite permitting a LAST entry1.
This is not the ordinary continued-fraction order; do not identify the append1
operation with the redundant terminal1 in the opposite convention.

Prove positivity, `p>q>0`, coprimality, and injectivity of this actual pair map
on ALL finite Boolean words. Give its terminating inverse: when `P>2Q` the
last letter is0 with predecessor `(P−Q,Q)`; when `P<2Q` it is1 with
predecessor `(Q,P−Q)`. Each predecessor has smaller coordinate sum. The
coprime boundary `P=2Q` is exactly the initial `(2,1)`. Identify the image
and compare this inverse with the positive canonical continued-fraction
expansion, its reversal and its coefficient sum. A cardinality estimate for
bare words without this slope/realization comparison is insufficient.

Construct the corresponding positive rational diagram with exactly `m+2`
crossings and its numerator closure. Prove the canonical positive rational
diagram is alternating and reduced, including first/last coefficient boundary
cases, and use the earlier bracket-span theorem to prove its crossing number
is EXACTLY `m+2`. Use closure parity to restrict to odd `p`; for `m≥1` these
are nontrivial knots. Construct bridge positions, their bridge-sphere dictionary
and their relative boundary isotopies, and prove the bridge-number connected-sum
formula `b(K#J)=b(K)+b(J)−1`. The upper bound joins explicit bridge positions;
for the lower bound put a decomposing sphere in the required bridge-compatible
position, with complete height/innermost-disc simplifications and the induced
bridge positions on the factors. Combine this with bridge number2, the
bridge-one unknot theorem and the earlier prime decomposition to prove the
family knots prime. Do not assume general
crossing-number additivity or infer primeness solely from the word syntax.
This proof belongs to the early rational/prime interface, independently of
late complete knot classification or hyperbolic geometry.

Compute the number `a_m` of words with odd numerator through the full parity
automaton. Its states are `(p mod2,q mod2)=A=(0,1),B=(1,0),D=(1,1)`, with
initial populations `(1,0,0)`. One step sends populations to
`(2D,A+B,A+B)`. Prove `B=D`, `a_m=B+D`, `a_0=0`, and
`a_m+a_(m+1)=2^(m+1)`. In the INTEGER ring prove
`3a_m=2^(m+1)−2(−1)^m`. The values for `m=0,…,6` are
`0,2,2,6,10,22,42`. Retain this integer equality before deriving rational
inequalities; natural truncated subtraction is not the same formula.

For fixed `n=m+2`, distinct words give distinct normalized pairs with
`0<q<p`. In one orientation-preserving UNORIENTED Schubert knot class,
`p` is fixed and there are at most two such `q`, namely `q` and `q⁻¹ mod p`.
Allowing ambient reflection gives at most four, including their negatives.
Prove these bounds through the earlier full geometric classification; do not
replace it by equality of numerators or by oriented congruences modulo2p.
Export `2C_(m+2)≥a_m` and `4N_(m+2)≥a_m` for `m≥1`. In particular,
for `n≥4` prove the NONSTRICT bounds
`3C_n≥2^(n−2)−1` and `6N_n≥2^(n−2)−1`, with exact ceiling versions.
For `n≥5` export the useful integral exponential bound `N_n≥2^(n−5)`.
Check low crossings and the fixed-point fibres separately. No strict inequality
with the same right side follows merely from a fibre bound.

For an exponential upper bound, construct rooted connected oriented sphere
maps with loops and parallel edges retained, a distinguished spanning tree,
and isomorphisms preserving cyclic orders, root and tree. Use actual dart
rotations and a fixed-point-free edge involution. Compare with the existing
native permutation-triple/bipartite-ribbon carriers by inserting one white
degree-two vertex per edge: the original map darts are the subdivided edges,
black rotation is the vertex rotation, and white rotation is the edge
involution. Prove the degree counts, connectedness, face cycles, Euler
characteristic and relabeling dictionary in both directions. A native
bipartite graph must not be identified with an unsubdivided arbitrary map.
Consume early GT4's geometric sphere realization and uniqueness comparisons.
Prove existence of a spanning tree for a finite connected map, and account for
the one-vertex tree with no edges.

Give the full contour coding and inverse on these actual maps. Cut along the
spanning tree, start at the root corner, and record its directed tree-edge
visits as `a,A` and the first/second encounters of each complementary edge as
`b,B`. For a map with `s` edges this is a word of length `2s`; each of its
two subwords is a Dyck word. Recover the rooted plane tree by stack matching
`a,A`; place the complementary endpoints in the specified corners and recover
the noncrossing complementary-edge pairing by stack matching `b,B` in the
cut disc. Prove that gluing reconstructs the vertex cycles, edge involution,
root and distinguished tree, including bridges, loops and an empty tree.
Prove both inverse laws up to the specified isomorphism. Export the bijection
with shuffles of two Dyck words, the exact count
`Σ_(k=0)^s binom(2s,2k) Catalan(k) Catalan(s−k)
 = Catalan(s) Catalan(s+1)`, and its derivation from the shuffle bijection and
the Vandermonde identity. Reuse Mathlib's actual Dyck words and Catalan
numbers. The simpler injection into four-letter words gives the upper bound
`4^(2s)=16^s` directly; no unproved asymptotic enumeration is needed.

A connected `n≥1`-crossing knot shadow is a four-valent sphere map with `n`
vertices and `s=2n` edges. Construct this dictionary with local opposite-dart
pairing, regular-projection realization, root choice and the crossing-free
exception. Filter the map codes for four-valence and one immersed component,
then add exactly one over/under bit per vertex. Give a deterministic vertex
ordering from the contour code. Construct the link and prove the resulting
finite code carrier surjects onto all knots having an `n`-crossing diagram.
Orienting its single component adds at most a factor two. Thus prove
`O_n≤2·2^n·16^(2n)=2·512^n` for `n≥1`, hence the same upper bound for
`C_n,N_n` and their unoriented/all-knot quotients. Root and tree are part
of the codes and overcount rather than remove knot types. Planar
orientation-preserving reconstruction must give the declared ambient
orientation-preserving equivalence. Prove the corresponding cumulative bounds
by the finite geometric sum, with the separate crossing0 unknot term.

Export liminf of the `n`th roots of these prime counts at least2 and limsup
at most512, and state the resulting genuine exponential-growth estimates.
Do not assert existence of a single growth-rate limit or general crossing
additivity from these two bounds. Late GT7's exact-through15 tables are
separate consumers and never premises of these universal constructions.

For the source's separate signed-Dowker `n!2^n` proposal, define the exact
root/orientation/sign data being counted, prove the decoder and its ambiguity
or fibre theorem on that precise universe, and determine whether the claimed
constant survives. Retain additional required planar/connected-sum data rather
than assuming every signed word has a unique realized diagram. Compare this
claim independently with the exponential theorem. Likewise compare EACH
printed `(2^(n−2)−1)/3`, `(2^(n−2)−3)/3`, `2^(n−2)/3`, strict/nonstrict,
and `e^n` version with its own declared count convention and threshold. The
source's mirror-identified exact-prime table contradicts several printed lower
versions already at4,6 or8. The constructed mirror-sensitive nonstrict bound
does not determine what the source intended. An upper bound with base512 does
not establish the printed base`e` bound. Keep false-literal/citation/setup
branches separate from the corrected general-count theorems.

Suggested actual word-count and matrix calculations, including proved finite
determinant identities and explicit future word/count proof targets, are in
[`KnotGrowthTargets.lean`](KnotGrowthTargets.lean). They do not replace the
geometric realization, classification or contour-reconstruction proofs.

References: [Kauffman–Lambropoulou, On the Classification of Rational Knots,
Schubert classification and positive rational diagrams](https://arxiv.org/html/math/0212011),
and [Bernardi, Bijective counting of tree-rooted maps and shuffles of
parenthesis systems, §2](https://arxiv.org/html/math/0601684).

#### GT4: Concrete pretzel geometry and integer form calculations

Use a fixed standard three-box pretzel model. Each box consists of two vertical
strands and `p,q,r` signed half twists; negative integers reverse every crossing,
and0 is two vertical arcs. Join adjacent top endpoints and adjacent bottom
endpoints, including the outer pair, by the standard noncrossing pretzel arcs.
Construct its actual marked realized diagram and spatial link. Determine its
components by the finite endpoint involutions: even twist parity preserves the
two box endpoints, odd parity interchanges them, independently of the sign.
Prove all odd or exactly one even gives a knot, exactly two even gives two
components, and all even gives three. Include zero parameters and an explicit
endpoint-to-geometric-component comparison.

Construct the spatial cyclic rotation of the three boxes and the rotation
reversing their order, with the actual crossing/endpoint transport. Prove these
generate the full parameter `S₃` symmetry of UNORIENTED three-box pretzel links.
Use the rotations and boundary collars to give ambient-isotopy comparisons and
their composition laws, and transport any assigned component orientations
explicitly. An oriented assertion uses the resulting orientations rather than
silently keeping a different box orientation. This is a worked spatial
application, not an inference from an unrelated label-permutation criterion.

For all odd `p,q,r`, construct the genus-one oriented pretzel spanning surface,
two actual oriented band-core basis cycles `a,b` with `a·b=+1`, their positive
normal push-offs and the local linking computation in the fixed crossing
convention. Retain the earlier native convention
`V_ij=lk(x_i,x_j⁺)` and `Vᵀ−V=J`, where `J_ij=x_i·x_j`.
First compute the push-FIRST matrix `W_ij=lk(x_i⁺,x_j)` to be
`W=[[(p+q)/2,(q+1)/2],[(q−1)/2,(q+r)/2]]`.
Prove linking symmetry gives the actual native matrix `V=Wᵀ`, so
`W−Wᵀ=J` and `Vᵀ−V=J` in this same marked basis. This transpose is
the fixed convention comparison, not an optional change of basis. The entries
are integers because the parameters are odd. Identify the actual push-offs
and local crossing signs before applying either matrix to a geometric link.

Compute in the Laurent coefficient ring
`det(W−tWᵀ)=((pq+pr+qr+1)/4)(1−t)^2+t`, prove the integer divisibility
by4, and compute the actual native presentation determinant
`det(tV−Vᵀ)=det(tWᵀ−W)=det(W−tWᵀ)`, using transpose invariance
and the even matrix size. The fixed genus-one Conway normalization is
`Δ(t)=t⁻¹det(tV−Vᵀ)=A(t+t⁻¹−2)+1`, where
`A=(pq+pr+qr+1)/4`. Prove this exact geometric Alexander/Fox comparison,
with the inherited positive meridian and Δ(1)=1; retain its separate Laurent-unit
presentation statement. The helper's `pretzelSeifert` is this displayed
push-first `W`; its proved rational determinant identities are transported
to the native convention by the displayed transpose equation. Those algebraic
identities do not themselves identify an unspecified pictured surface.

Compute `P(−3,5,7)` to have Alexander polynomial a unit, represented by`t`
before Laurent-unit normalization. For `P(3,5,−7)`, compute
`W=[[4,3],[2,−1]]` and `V=[[4,2],[3,−1]]`. Their common symmetric form
is `W+Wᵀ=V+Vᵀ=[[8,5],[5,−2]]`, with determinant`−41` and signature0;
prove the signature by the actual real quadratic-form/inertia comparison.
Bind these as the finite worked applications, preserving any distinct
historical question number and its corrected cross-reference separately.

For every integer `p,q,r`, including even and zero parameters, construct the
signed checkerboard surface and its chosen region basis directly from the
standard pretzel diagram. Prove its reduced Goeritz matrix is
`[[p+q,−q],[−q,q+r]]` in the stated shading/sign convention, with the required
region/reduction treatment when a zero box degenerates. Compute determinant
`pq+pr+qr`, and prove the Goeritz/Fox determinant comparison for all resulting
component branches, including singular/zero determinant. Track absolute value,
multicomponent normalization and orientation-dependent signature corrections.
The odd genus-one Seifert matrix is not used outside its own domain.

#### GT4: Concrete Whitehead and figure-eight symmetry applications

Construct the standard Whitehead link from the rational numerator diagram
with reversed positive coefficients `[2,1,2]`, slope`8/3`, and five crossings.
Construct its endpoint/component marking and compare with a realized standard
Whitehead clasp model. Prove it is reduced alternating, so the bracket span
gives crossing number5. Produce an actual finite diagram movie or explicit
piecewise spatial isotopy interchanging the two components, with every local
move and induced endpoint/component map checked. Its output must exchange the
two marked components; linking number0 alone supplies no such isotopy.
Transport the orientations under this map and prove each oriented version with
its actual signs. The two unspecified source pictures still require separate
source-to-model identity certificates.

Construct the figure-eight model as the closure in the realized three-strand
braid dictionary of `β=(σ₁σ₂⁻¹)²`. Identify its reduced four-crossing
alternating diagram, its crossing number and component. Compare reflection in
the projection plane with the actual generator inversion mirror automorphism.
Conjugation by the three-strand half twist exchanges `σ₁,σ₂`, and sends the
mirror word `(σ₁⁻¹σ₂)²` to `(σ₂⁻¹σ₁)²`. Give the explicit cyclic
conjugator to `β`, and realize that conjugacy by the geometric closure
isotopy. Compose this isotopy with the actual ambient orientation-reversing
reflection to obtain the amphichirality map. Separately construct a spatial
rotation/finite diagram movie reversing the parametrized knot orientation,
with its induced longitude/meridian signs, to prove invertibility. An
amphichirality comparison alone is not the orientation-reversal construction.
Prove naturality of both maps under the standard marked-model identification.


#### GT4: finite framed-link bordisms and calibrated normal form

On the actual oriented smooth-link/normal-bundle carrier, define the
integer H(L) as linking with the push-off along the first vector of its
ordered normal frame. Compare this with Σ_i f_i+2Σ_(i<j)lk(L_i,L_j),
where each f_i is the Seifert-relative component framing. Construct a
common collared push-off for an arbitrary compact oriented framed
bordism W in S3×I. The relative intersection/linking boundary identity
gives H(out)−H(in)=W·W'=0. This uses the actual relative fundamental
chains, orientations and transverse push-in independence from the
preceding linking theorem, not an unnormalized boundary twist sum.

Construct these four local framed bordisms in a specified ball×I,
fixed on the outside collars, by smooth ribbon/band embeddings and
explicit extension of their two normal vectors. (i) Band the positive
or negative zero-framed Hopf link to an unknot with framing+2 or−2;
calibrate it by the two signed mixed crossings and push-off. (ii) Change
a mixed-component crossing and add the opposite signed zero-framed
Hopf summand using a two-band trace; retain the old component framings
and prove its exact linking changes. (iii) Isolate all framing twists
by a band, then cap the remaining zero-framed knot by a Seifert surface
pushed into the ambient four-cylinder; give the extending normal frame
and the product collars. (iv) Merge separated a- and b-framed unknots
by a framed pair of pants to the (a+b)-framed unknot. Supply actual
relative embeddings/framing equations for every witness, rather than
inferring existence from agreement of H.

By finitely many mixed crossing changes split an arbitrary finite link,
including algebraically unlinked nonsplit links. Apply the four witnesses,
remove knotting and merge the separated framed unknots. The result has
framing H(L); a zero-framed unknot bounds its reference framed disc,
while H-invariance forbids any nonzero-framed unknot from bounding.
Include the empty link and disconnected traces. A reference frame on a
pair of pants has oriented boundary twist sum0; absolute Seifert framings
instead require the linking correction. Preserve this distinction on
all surface-boundary corollaries. Compare the resulting geometric Z
classification with HS5.0's honest-rank c=2 finite PT and the explicitly
positively calibrated Hopf fibre. Neither the framed moves nor the
integer invariant requires the value π3S2 as an earlier premise.

For the figure-eight homework own a finite peripheral certificate, not
only an abstract presentation. Realize its diagram by the closed braid
(σ1σ2^(-1))² and prove the diagram-isotopy certificate at the exact
crossing convention. For punctured-disc generators x1,x2,x3 use the
Artin automorphisms S=(x1x2x1^(-1),x1,x3) and
T=(x1,x3,x3^(-1)x2x3); pin B=(S∘T)² and the closure relations
B(x_i)=x_i. Derive its Wirtinger presentation from the actual cover and
base paths. Track a marked longitude through the full orbit, prove its
meridian exponent0 and its Seifert-preferred peripheral class, including
orientation; centralizing a meridian and having exponent0 alone does
not characterize a longitude. Return finite forward/inverse generator
and peripheral-word certificates. Layer5's framing+1 filling then adds
the actual relation λμ=1 (or its explicitly transported convention).
No surgery-manifold classification is inferred just from that quotient.

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
  tubular neighbourhood (layer 1), with the boundary a torus per component. Layer 5 consumes
  Layer 4 through this object. (Rolfsen, *Knots and Links*, Chapter 9,
  is the reference for the surgery picture throughout this layer,
  [extract](references/rolfsen-dehn-surgery.md).)
- **Exterior naturality, tube choices and the open complement.** For a realized tame
  smooth link L in compact S³ and a specified compatible closed tubular neighborhood
  Nτ of its components, write Eτ=S³∖int(Nτ), with its actual manifold-with-boundary
  structure and framed meridian/Seifert-longitude classes. Restrict an ambient smooth
  diffeomorphism F:S³→S³ carrying L to L′ to obtain a diffeomorphism
  Eτ→E_(Fτ), including its boundary collars and induced peripheral classes. Consume
  Layer 1's quotient-normal bundle and normalized tube-derivative constructions.
  Own the tube-isotopy construction here: regard both tubular embeddings as germs
  on the same quotient-normal bundle over L, fixing its zero section pointwise.
  Precompose their vertical derivatives with the corresponding bundle automorphisms
  so each induces the identity on the quotient normal fibre. Preserve specified
  compatible framings; comparing different markings must retain their actual
  peripheral change of basis rather than identify them by this normalization.
  On a common neighborhood form the transition germ h fixing the zero section.
  For positive t deform it by fibre rescaling `δ_t⁻¹ ∘ h ∘ δ_t`, with `δ_t(v)=t•v`.
  Prove in bundle charts, by the first-derivative formula and the smooth Hadamard
  factorization, that the deformation extends smoothly at t=0 to the identity.
  The base component of h may vary with v; include it in this chart argument.
  Prove uniform domain and embedding estimates over compact L and t∈[0,1],
  then restrict to one sufficiently small closed disc bundle to obtain an ACTUAL
  isotopy of tubular embeddings between the normalized germs. For continuous
  families in the C∞ topology indexed by a compact finite CW parameter space,
  prove the same estimates with one uniform shrinking radius over all parameters.
  Keep the isotopy fixed on prescribed parameter subsets and spatial neighborhoods
  where the input germs and normalizations agree. Compare each shrunk tube with
  its original radius by positive radial embedding isotopies, including the
  disc/ellipsoid domains arising from derivative normalization. Only after these
  constructions apply Layer 3's compact-ambient continuous-parameter isotopy
  extension, relative to the zero section and agreed prescribed collar data.
  Obtain the comparison diffeomorphism, with support in a specified neighborhood
  of the tubes, and prove the exterior diffeomorphism type independent of tube
  choice. For specified tube isotopies and
  comparison families prove the induced-map naturality/composition laws up to the
  specified relative isotopy; do not assert literal equality or uniqueness of all
  choices of diffeomorphism. Retain support restrictions and prescribed boundary
  collars, using Layer 3's finite-CW-pair lifts for parameter families. An ambient
  isotopy of the link consequently yields the required compact-exterior diffeomorphism
  and its meridian/longitude map; mirror and component-reversal comparisons retain
  their actual induced signs rather than silently preserving every framing.
  Prove int(Eτ) is diffeomorphic to S³∖L: in a slightly larger tube send the punctured
  radial interval (0,2) smoothly and monotonically to (1,2), identically near2,
  and extend by the identity outside; compare the resulting end collar with the
  boundary collar of Eτ. Track peripheral curves through this explicit map.
  The compact exterior includes its boundary; it is its OPEN INTERIOR, not Eτ
  itself, that is identified with the open link complement. GT7 consumes these
  targets without returning a dependency to this construction or to early GT4.
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

#### GT5: finite lens and E8-boundary model certificates

For p≥1 and gcd(p,q)=1 construct the free action generated by
(z1,z2)↦(exp(2πi/p)z1,exp(2πiq/p)z2) on the actual unit S3,
including p=1. Construct quotient charts, the smooth oriented lens
space and its covering S3→L(p,q), with its marked deck group C_p.
The covering LES gives π1=C_p and all higher groups from S3; give
all basepoint/deck conventions. Build its one-cell-in-each-degree CW
model with integral d2=p and other differentials0. Thus compute H0,H3=Z,
H1=Z/p and H2=0, not an unqualified homotopy classification by p.
Noncoprime or zero-p action data do not inherit this free-cover claim.

For the explicitly signed rank-two E8 plumbing, calculate the boundary
fundamental group by its finite Kirby diagram, boundary collars and
meridian relations. Supply actual diagram-to-plumbing identifications,
finite handle slides and forward/inverse Tietze maps to the binary
icosahedral presentation ⟨x,y,z | x²=y³=z⁵=xyz⟩, with orientation
and peripheral choices fixed. Construct its explicit120-element unit
quaternion model and an exhaustive coset/rewrite normal-form proof of
the reverse bound; a surjection onto a120-element group is insufficient.
This proves the k=1 boundary group, not its triviality or standard S3.
For E8 rank2k plumbing with k≥2, the dual relative handles have indices
2k and4k. Prove by the actual handle attachment/van Kampen comparison
that inclusion of the boundary induces a π1 isomorphism with the
simply connected plumbing. Its integral homology-sphere calculation
then gives a homotopy sphere by the actual Hurewicz/Whitehead theorem.
Obtain a topological S^(4k−1) using the genuine high-dimensional
h-cobordism/sphere recognition and Alexander extension contracts.
Do not conclude smooth standardness; k=1 has a separate group result.
All finite E8 tangent-frame, conventional-model and later classification
programmes remain separate from this core homology/π1 calculation.

### Layer 6: knot concordance and 4D cobordism (owned here)

Two knots are concordant if they cobound a smoothly (or locally flatly) embedded annulus in
`S³ × [0,1]`; concordance classes form a group under connected sum. This layer owns the
concordance group and the cobordism category, building on layer 4's knots and layer 1's
gluing. It consumes the grid invariant `τ` from the combinatorial Heegaard Floer roadmap,
builds its geometric connected-sum/descent adapter here, and owns the Lee deformation
and Rasmussen's `s` comparison with the shared ordinary Khovanov theory below. Both are definite targets on smooth concordance.

**From Mathlib / earlier layers.** Layer 4's knots, slice-ness, and Seifert surfaces; layer
1's gluing and connected sum; the combinatorial Heegaard Floer roadmap's grid `τ`,
filtered-complex interface and smooth slice-genus bound. Its group-valued descent and
additivity are targets of the GT6 adapter below. The classical signature invariant is
built here from layer 4's Seifert matrix; KhovanovHomology supplies the ordinary theory
and this layer owns its Lee deformation and `s` comparison.

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
- **Concordance invariants**: the raw signature with its nonroot concordance comparison
  and the full-circle averaged Tristram–Levine signature specified below, the imported
  grid `τ` with its owned GT6 connected-sum and geometric descent,
  and the owned Khovanov–Lee/Rasmussen `s` construction below. Export the smooth
  concordance-group homomorphisms only after proving these comparison and additivity targets.
- **Mutation** as an operation on knots (Conway mutation by a `(±1)`-tangle replacement) and
  the statement that it does *not* preserve the smooth concordance class.

```lean
-- K, K' : SmoothLink (sphere 3)   -- the geometric presentation; no `Knot` type
-- def Concordant (K K' : SmoothLink (sphere 3)) : Prop := ∃ Σ : Annulus (sphere 3 ×ₘ I), boundary Σ = K ⊔ K'.mirror
-- instance : Group (Quotient concordanceSetoid)   -- concordance classes; # as operation
-- def rawSignature (K : SmoothLink (sphere 3)) (ω : Circle) : ℤ   -- native Hermitian matrix signature
-- def averagedSignature (K : SmoothLink (sphere 3)) (ω : Circle) : ℤ   -- average of the proved one-sided values
-- theorem rawSignature_concordance_of_nonroots (h : Concordant K J) (hω : ω ≠ 1)
--     (hK : alexanderEval K ω ≠ 0) (hJ : alexanderEval J ω ≠ 0) : rawSignature K ω = rawSignature J ω
-- theorem averagedSignature_concordance (h : Concordant K J) : averagedSignature K ω = averagedSignature J ω
-- theorem mutation_not_concordance_invariant : ∃ K, ¬ Concordant K (mutate K)
-- theorem levine_homologySphere_not_S3 : -- a knot in a homology sphere not smoothly concordant to any in S³
```

#### GT6: raw and averaged Tristram–Levine signatures

Consume the actual native `TauCeti.KnotTheory.tristramLevineForm` and
`tristramLevineSignature`, their congruence/enlargement, mirror and block-sum
laws, and Layer4's geometric Seifert-surface/matrix comparisons. Write
`rawSignature(K,ω)` for the resulting matrix signature of
`(1−ω)V+(1−conj(ω))Vᵀ`, with `ω : Circle`; its value at `1` is zero.
This is defined at Alexander roots too. Its descent through presentation
changes uses the actual Seifert comparisons. For concordant knots K,J, prove
raw-signature equality under the explicit safe premises `ω≠1`, `Δ_K(ω)≠0`
and `Δ_J(ω)≠0`. Raw values at roots are not the full-circle concordance invariant.

##### GT6: torus signatures

**Torus knots and chirality.** For coprime positive P,Q≥2, construct the standard
positive-braid Seifert surface and its ordered homology basis. With `B_n` having
diagonal1, superdiagonal−1 and all other entries zero, identify its Seifert matrix
with `V=−B_(P−1)⊗B_(Q−1)` in the native sign convention. Supply the oriented
basis loops and their pairing entries, with any explicit unimodular basis-change
matrix used: the equality is entrywise in that constructed basis.
For the signature calculation, derive the eigenvalues `−exp(2πik/(n+1))` of
`B_n⁻¹B_nᵀ` from its finite recurrence. Positive definiteness of the A_n Cartan
matrix `B_n+B_nᵀ` fixes the phase of `x*B_n x` for each eigenvector to
`π(1/2−k/(n+1))`. Tensor eigenvectors of `V⁻¹Vᵀ` have distinct eigenvalues
`exp(2πi(i/P+j/Q))` by coprimality, and are orthogonal for `V+Vᵀ`.
The value on each tensor eigenvector has the sign of `cos(π(i/P+j/Q))`.
Thus, letting N_mid count the pairs `1≤i<P`, `1≤j<Q` with
`1/2<i/P+j/Q<3/2`, and N_out count the other pairs, prove the signed equation
`rawSignature(T(P,Q),−1)=N_out−N_mid<0` and hence `N_mid−N_out>0`.
Coprimality excludes the two boundary
values. For strict positivity, partition the lattice rectangle into orbits under
`i↦P−i` and `j↦Q−j`. Put `a=min(i/P,1−i/P)` and `b=min(j/Q,1−j/Q)`.
An orbit with a+b<1/2 has equally many inside/outside points; if a+b>1/2 every point
is inside. Equality is excluded. The orbit of `i=floor(P/2),j=floor(Q/2)` is of the
second kind, so the total difference is positive. Prove this count explicitly.
Transport to signed p,q using
GT4's mirror/reversal constructions. The mirror-sign and reversal laws then show
that T(p,q) and T(p,−q) are distinct even after forgetting circle orientation
when |p|,|q|≥2, with ambient equivalence still given by isotopy.
Together with the explicit GT4 unknot isotopies this gives the full unknot range
`|p|≤1` or `|q|≤1` for coprime p,q. This signature comparison is downstream of the
GT4 geometric/braid identifications; the early ambient isotopies do not consume it.

<a id="gt6-crossing-change-signatures"></a>
**Crossing changes and unknotting bounds.** Develop the proof from physical
pages102–103 of the course *Knot Theory.pdf*. For two realized oriented knot
diagrams differing at one specified crossing, construct their Seifert surfaces
from the same oriented smoothing and identify the abstract disc-band surfaces
and integral homology bases. With the local crossing and positive push-off
conventions fixed, prove the entrywise formula
`V₊−V₋=ε vvᵀ`, where `ε∈{−1,1}` and the integral vector `v` records algebraic
traversals of the changed band by those basis curves. Determine `ε` from the
pinned local model. If the band is a bridge of the disc-band graph, prove
`v=0` and the pairing is unchanged. In the nonseparating case construct the
adapted basis giving the single-diagonal-entry version of this formula.
Prove the required connectedness and basis comparisons; they are not
consequences of calling the cut surface connected.

Own the finite-dimensional Hermitian inertia estimate: if two Hermitian matrices
have difference `c vv*`, with `c` real, their signatures differ in absolute value
by at most2. Include singular matrices and zero vectors, using their common
codimension-at-most-one restriction rather than assuming nonzero diagonalization
pivots. Under the Seifert comparison the Hermitian forms differ by
`ε(2−ω−conj(ω)) vvᵀ`; this scalar is real, and for `ω : Circle` it is
`ε|1−ω|²`. Apply the estimate and presentation descent to obtain
`|rawSignature(K₊,ω)−rawSignature(K₋,ω)|≤2` at every unit parameter,
including Alexander roots and `ω=1`. Iterate over an actual finite
crossing-change movie to the unknot, retaining isotopies between changes,
and then minimize its length to prove `|rawSignature(K,ω)|≤2u(K)`.
At `ω=−1`, use the native `tristramLevineSignature_neg_one` comparison to
`Matrix.signature`; this gives the classical `|σ(K)|≤2u(K)` used by the
Bleiler example. The matrix targets in [CrossingChangeTargets.lean](CrossingChangeTargets.lean)
use the existing signature carriers; geometric surfaces, bases, local crossing
comparisons and descent are additional required targets here.
[Conway, §2.3](https://arxiv.org/html/1903.04477v1#S2.SS3)
provides the signature crossing-change and unknotting comparisons.

Own the geometric algebraic-sliceness comparison for concordance invariance: from a
smooth or locally flat slice disk construct a stabilized integral Seifert
presentation with a primitive half-rank summand on which the Seifert pairing
vanishes. Use the earlier tubular exterior, relative homology exact sequence
and integral duality interfaces to construct this summand and prove its rank,
primitivity and vanishing equations. The locally flat branch retains Four's
actual disk normal-neighborhood supplier. For a concordance use the already
constructed slice disk of K#reverse(mirror J), and the geometric block-sum
comparison. At a safe parameter the Hermitian form is nonsingular by its
Alexander determinant; the half-rank isotropic summand then forces signature
zero. Prove these Hermitian Witt-index implications using native matrix
signatures. S-equivalence of matrices alone does not supply algebraic sliceness.

For the full-circle invariant construct the two angular one-sided values
`σ₊(K,ω)` and `σ₋(K,ω)` as the eventual integer values of
`rawSignature(K,ω*exp(iθ))` for sufficiently small positive and negative θ.
Prove their existence and uniqueness: the knot Alexander polynomial is
nonzero with Δ(1)=1, hence has finitely many unit roots; the Hermitian form is
nonsingular off those roots and 1, and its inertia is constant on each such
arc. Own the required finite-dimensional Hermitian inertia-continuity lemma
and determinant comparison. At 1 use the nonsingular skew Seifert pairing
and its paired eigenvalues to prove the nearby signature is zero. Prove
independence from the angular lift and from Seifert presentation, including
at the exceptional points.

Off the exceptional set the form has even rank and its signature is even.
Thus `σ₊+σ₋` is even. Define the integer
`averagedSignature(K,ω)=(σ₊(K,ω)+σ₋(K,ω))/2` with this exact divisibility
proof, and prove its value at 1 is zero. The average need not be even at an
Alexander root. Prove agreement with the raw signature off the roots and at
1. To prove concordance invariance at any ω, take the two small arcs avoiding
the finite union of the two knots' exceptional sets, apply the safe raw
comparison on each arc, then average. Descend this averaged function, pointwise
in ω, to both the smooth and locally flat concordance groups. Export its
connected-sum additivity, orientation-reversal, conjugate-parameter and mirror
laws by transporting the native matrix laws through the one-sided limits,
and its slice-vanishing and classical ω=−1 comparisons.

Keep the native signature sign. Prove the realized trefoil's Seifert-matrix
comparison before using the native matrix example with value −2 at −1.
The positive-trefoil normalization `σ_RH=+2` used in the rational alternating
`s` computation below has its explicit sign comparison with this convention;
no matrix sign is changed silently. These geometric and averaging interfaces
are owned here. The Lickorish extract's nonroot theorem and
[Conway, §2.1 and §2.4](https://arxiv.org/html/1903.04477v1#S2.SS4)
fix the raw/averaged distinction; all stated construction and comparison
proof obligations remain targets of this layer.

#### GT6: the Khovanov–Lee supplier and smooth concordance invariants

Suggested rank-two Frobenius forms are in [`LeeFrobenius.lean`](LeeFrobenius.lean).

This layer owns the rational Lee deformation, its filtered geometric and cobordism comparisons, and Rasmussen's rational `s`. Consume [KhovanovHomology G/K1–K7](../KhovanovHomology/README.md) for ordinary integral even Khovanov homology, its coefficient comparisons, finite diagram/resolution carriers, ordinary Reidemeister maps, and the common marked affine movie presentation. That roadmap's G consumes the earlier GT link/presentation definitions and generic manifold foundations; its ordinary construction does not depend on this Lee or `s` development. GT also owns the geometric descent and connected-sum comparison for the imported grid `τ`. The generic filtered-complex interface stays with [CombinatorialHeegaardFloer Lane ALG](../CombinatorialHeegaardFloer/README.md#lane-alg-bigraded-and-filtered-homological-algebra): use degreewise submodules, actual maps and homotopies on native `CochainComplex (ModuleCat R) ℤ`. The following targets construct the Lee extension and its comparisons with that single ordinary theory.

1. **The rank-two deformation and the ordinary-algebra comparison.** Retain the general `LeeFrobenius.lean` quotient algebra `A_c=AdjoinRoot (X²−c)` with basis `1,X`, multiplication `X²=c`, unit `1`, counit `ε(1)=0, ε(X)=1`, and `Δ(1)=1⊗X+X⊗1`, `Δ(X)=X⊗X+c·1⊗1`. Retain all basis, quotient, Frobenius, nondegeneracy and tensor-coherence targets. At `c=0`, construct the explicit algebra equivalence `A_0 ≃ₐ[R] DualNumber R` sending `[X]` to the native square-zero generator `(0,1)` and `a+b[X]` to `(a,b)` for every commutative coefficient ring used here, including the zero ring. Prove its inverse, coefficient-change naturality and preservation of unit, multiplication, the chosen counit and K2's chosen comultiplication. The dual-number coalgebra is the particular K2 structure, not an arbitrary global coalgebra instance. Ordinary integral and rational theory consume K2/K5 through this comparison; `c=1` over `ℚ` is the Lee deformation, with no algebra equivalence to the `c=0` algebra asserted. With `deg(1)=1,deg(X)=−1`, retain the ordinary saddle degrees `−1`, birth/death degrees `+1`, and the additional Lee terms of degree `+3`. Empty circle sets have tensor `R`; retain actual indexed tensor comparisons at zero and one circles.

2. **The shared signed cube and the Lee extension.** Use K1/G's actual `OrientedPDCode n` with `PDCode.IsPlanar`, crossing order, labelled smoothing circles, unaffected-circle correspondences and plane realization. Transport Layer4 presentations through G's labelled relative comparison. A subset `S` records B/1 resolutions, while the native Boolean state is true on its complement. Prove the dictionary with the oriented smoothing and crossing signs. Use K3's normalization `i=|S|−n₋`, `j=sum(label degrees)+|S|+n₊−2n₋` and edge sign `(-1)^(#{b∈S:b<a})`. At `c=0`, tensor the algebra equivalence of item1 over each actual circle set to construct a bigraded chain isomorphism to K3's ordinary complex, natural under circle/crossing reorderings, disjoint unions, scalar extension, skein comparisons, K4 Reidemeister maps and K7 ordinary elementary cobordism maps and relation homotopies. Retain K3's quantum-object/underlying-total/Finsupp comparison and the normalized cochain shift and tensor signs; no second ordinary complex or generic movie theorem is commissioned here.

   At `c=1` construct the deformation differential using the same finite enhanced-state modules, signs and saddle correspondences. Prove the Frobenius square identities and `d_Lee²=0`, and construct the Lee-specific filtered Reidemeister maps, inverses and homotopies on these shared carriers. Retain mapping cones, disjoint-union tensors, based-circle action, finite rational computation, and presentation invariance. The `c=0` Euler characteristic and coefficient/finite-generation results are the K3/K5 outputs transported by the actual comparison: for nonempty links, `χ_z Kh=(z+z⁻¹)V(t)` with `t=z²` and `t^(1/2)=−z`, and the explicit `(-1)^(μ−1)` comparison to the positive square root. Keep the unknot, two-component unlink, right-handed trefoil and separate empty complex `R` checks. Lee homology is filtered rather than assigned this ordinary quantum grading.

3. **Lee's filtered complex and canonical classes.** Over `ℚ` use `c=1` on the same finite enhanced-state module. Prove `d_Lee=d_Kh+Φ`, with bidegrees `(1,0)` and `(1,4)`, including the separate square-zero and anticommutation identities. Let `F^j C_Lee` be the subcomplex spanned by enhanced states of quantum degree at least `j`; it is descending, finite, exhaustive and separated. Construct its associated-graded chain isomorphism to the rational ordinary complex from KhovanovHomology K3/K5, using item1’s c=0 algebra equivalence on every actual circle tensor and item2’s normalization and naturality. Prove this identification commutes with the associated-graded maps and homotopies of the Lee comparison; equality of enhanced-state dimensions alone is insufficient. On native homology define `F^j H` as the image of `H(F^j C)→H(C)`, not as the span of chosen homology representatives. Prove the representative-lifting criterion and filtered-map degree inequality. Give finite rational row-reduction procedures for these subspace images with verifiable kernel/image certificates.

   Construct `e₊=(1+X)/2`, `e₋=(1−X)/2` and prove their orthogonal-idempotent identities. For each circle of an oriented Seifert resolution, let `p` be the number of other Seifert circles whose bounded interior contains it, plus1 if its orientation is counterclockwise and plus0 if clockwise, modulo2. Use `e₊` for `p=0` and `e₋` for `p=1`; prove this definition independent of the chosen regular point on the circle and verify its local saddle rule; the resulting orientation-indexed Lee cycles form a homology basis for all component counts, giving total rank `2^μ`. Prove this by cancelling the explicit contractible colored-cube summands, with maps to and from the surviving orientation summands. Track their cohomological degrees for each choice of component orientations; for knots both classes lie in degree0. Prove the global-orientation-reversal relation, the splitting by quantum degree modulo4 and the filtration of the two sums/differences of a knot's orientation classes. Do not identify the filtration with a grading or infer it from the mere dimension-two result.

4. **Lee maps on the shared geometric movie category.** Consume KhovanovHomology G/K7's finite labelled, oriented plane diagrams, marked collared affine link surfaces, supported elementary movie generators, all numbered relations with their variants, and its relative presentation/completeness theorem. Use its boundary convention `∂Σ=−L₀⊔L₁`, product collars, chosen point at infinity and affine chart; construct the comparison with the generic GT6 cobordism carrier while retaining those data. The common movie presentation, ordinary maps and their ordinary relation homotopies stay at K7. Construct here the Lee-specific filtered elementary maps using item2's filtered Reidemeister data and the deformed unit, saddles and counit. Verify chain maps, the Lee relation homotopies for every shared schema and variant, distant-event interchange, planar naturality, identities, composition, disjoint union and marked-boundary transport. Their target is the filtered homotopy category modulo one global sign, with the actual homotopies and filtration degrees retained.

   GT6 also constructs the passage from this marked affine domain to its full `S³×[0,1]` surface target. Encode the additional sweep-around relation: the two movies move a specified strand past the rest of a braid closure on its front and back sides. Prove the geometric relation for changing infinity data and prove the two Lee composites agree up to a common sign and filtration-preserving chain homotopy. Use the homogeneous universal relation over `ℚ[T]`, with `X²=T` and `deg T=−4`, and prove specialization at `T=1` preserves the required filtration on maps and homotopies. Construct the finite changes of chart/infinity data and their composition laws, then descend the filtered maps to boundary-fixed spherical surface isotopies. The shared affine movie theorem alone supplies no such descent. [Lipshitz–Sarkar, Proposition3.7](https://arxiv.org/html/2109.09018v3#S3) supplies the deformed sweep-around proof route; encode its finite words and verify their maps, rather than taking a diagram or citation as a chain-level certificate.

   Every elementary birth/death has filtration degree `+1`, every saddle degree `−1`, and every Reidemeister map degree0; hence a surface map has filtration degree `χ(Σ)`, meaning `F^j` maps into `F^(j+χ(Σ))`. Prove its action on canonical orientation classes, summing over compatible surface orientations with the actual nonzero rational coefficients. If every connected component of `Σ` meets the incoming boundary, a specified extending orientation sends its incoming canonical class to a nonzero multiple of its outgoing one. In particular an oriented connected genus-`g` cobordism between knots induces an isomorphism on their two-dimensional Lee homology, of filtered degree `−2g`. The reverse surface is a separate map of the same degree, not a claimed filtered inverse. Keep the incoming/outgoing boundary orientation convention explicit. A disjoint closed sphere can kill a map, so neither nonvanishing nor invertibility is asserted for arbitrary disconnected surfaces.

5. **Normalized Rasmussen invariant and its bounds.** For a knot define
   `s_min=max{j∈ℤ : F^j H_Lee=H_Lee}` and
   `s_max=max{j∈ℤ : F^j H_Lee≠0}`.
   Prove these integer maxima exist from the finite filtration, that both are odd and `s_max=s_min+2`; use the two modulo4 summands and the based merge/split exact sequence with the unknot, including the degree`−1` maps. Define `s=s_min+1=s_max−1∈2ℤ`. This is specifically the rational Lee invariant. Prove `s(unknot)=0`, invariance under reversing the knot orientation and `s(mirror K)=−s(K)` by the actual filtered duality, including the annihilator-filtration indices. Construct the based connected-sum merge/split maps and exact sequence, prove their canonical-class formulas and degree shifts, and derive `s(K#J)=s(K)+s(J)`; a genus-bound inequality alone is not additivity.

   Apply the nonvanishing surface maps in both directions to prove `|s(K)−s(J)|≤2g` for a connected smooth genus-`g` cobordism. Puncturing a smooth slice surface and identifying the puncture with an unknot gives `|s(K)|≤2g_s(K)≤2g(K)` and `|s(K)|≤2u(K)`; a single crossing change gives difference at most2. Prove smooth concordance invariance and descend `s` to an additive homomorphism on the smooth concordance group already constructed above. Do not descend this invariant to topological locally flat concordance or apply its smooth slice bound to the topological slice genus.

6. **The missing grid-`τ` connected-sum and descent adapter.** Consume the actual [CombinatorialHeegaardFloer G6/G10/G13 and Lane K](../CombinatorialHeegaardFloer/README.md#lane-g-grid-homology-the-spine): its grid invariant `τ`, genus/cobordism maps, filtered grid complexes and diagram-to-geometric-knot reconciliation. Build here the further normalized connected-sum comparison rather than attribute it to a genus-bound statement. Construct a finite, one-basepoint hat filtered complex `Ĉ_K` over `𝔽₂`, with increasing Alexander subcomplexes `A_≤m` and total homology `𝔽₂` in absolute Maslov degree0, using cochain degree `i=−M` when transporting the grid differential. Compare it with the G13 grid complex by actual pointed stabilization/destabilization and variable-identification maps. Account for every extra two-dimensional grid factor and its Alexander/Maslov shifts: give the normalized pointed model and maps proving the comparison, not a cancellation of an arbitrary tensor factor. Prove that the least `m` for which `H(A_≤m Ĉ_K)→H(Ĉ_K)` is nonzero is exactly G6's `τ`, including its tower/filtration normalization and the unknot value0. This comparison is an explicit construction target; a bare associated-graded grid homology group is not the filtered complex.

   Construct the geometric connected-sum grid/pointed-diagram operation and the filtered chain homotopy equivalence `Ĉ_(K#J)≃Ĉ_K⊗_(𝔽₂)Ĉ_J`. Pin the tensor filtration `A_≤m=Σ_(a+b≤m) A_≤a⊗A_≤b` and additive absolute gradings; prove both comparison maps and homotopies respect it after the specified normalization. Prove the required finite-field filtered Künneth statement, using filtration-adapted cycle/boundary bases: for finite filtered complexes with one-dimensional total homology, the nonzero homology-image threshold of their tensor product is the sum of their thresholds. Apply it to deduce `τ(K#J)=τ(K)+τ(J)`. Prove mirror duality `τ(mirror K)=−τ(K)` with the increasing-filtration annihilator shift, orientation reversal and agreement of geometric/grid normalizations. Combining these with G10's smooth slice bound and the geometric slice knot `K#(reverse mirror J)` for a concordance proves descent to `C_smooth→+ℤ`. This is the group-homomorphism proof; no additivity is inferred from the genus bound alone. The grid complex, rectangle-count theory and generic filtered interfaces remain at their existing owner.

7. **Computations, comparison and acceptance examples.** Prove the full positive-diagram formula `s(K)=n−r+1=2g(K)=2g_s(K)`, where `n` is the number of crossings of the chosen positive diagram and `r` is that diagram’s Seifert-circle count; its proof uses the actual canonical cycles, absence of incoming degree`−1` chains and the Seifert surface. For a connected reduced alternating knot diagram, prove rational Khovanov thinness over `ℚ` and compute `s` from the signature: use the classical-signature normalization `σ_RH` in which the right-handed trefoil is `+2`, and explicitly prove its sign relative to Layer6's matrix signature before stating `s(K)=σ_RH(K)`. Give integral/rational chain and filtration certificates for unknot, right/left trefoil and figure-eight, with `s=0,2,−2,0`. For positive coprime `p,q`, prove `s(T_(p,q))=(p−1)(q−1)` and compare with G7's normalized `τ(T_(p,q))=(p−1)(q−1)/2`, including `p=1` or `q=1`. These are specified comparisons on these families; no universal equality `s=2τ`, equality of their filtered complexes, or identification of either with signature is required or assumed. Export finite-matrix computation and geometric-presentation transport APIs, as well as the full concordance and genus statements, so this supplier is usable beyond one obstruction.

Use the primary accounts [Lee, §§2 and4](https://arxiv.org/html/math/0210213), [Rasmussen, §§2–6](https://arxiv.org/html/math/0402131), [Bar-Natan, §§4,7–9](https://arxiv.org/html/math/0410495), and [Ozsváth–Szabó, §§2 and3.2](https://arxiv.org/html/math/0301149). Their geometric diagrams must be encoded and proved against the actual finite carriers; a citation does not provide the local maps. The Lee cube and filtration consume the shared ordinary finite carriers, K1–K5 comparisons and existing complex/filtered interfaces. The surface maps additionally consume K7’s common affine movie presentation and the early Layer6 cobordism foundations; their spherical descent requires item4’s Lee sweep-around comparison. The group-valued invariants follow the earlier concordance-group construction. None of Layer4's Jones or Alexander definitions, Layer6's concordance relation, or the generic filtered-complex supplier depends back on `s` or on the new connected-sum adapter.

**Design notes.** Keep smooth and topological concordance separate from the start; the
Levine and mutation results are about the smooth category specifically. The signature is
elementary and self-contained (a good first target). Its construction is independent of
the imported grid `τ`, its GT6 connected-sum adapter and the owned Khovanov–Lee/`s` construction. Concordance in homology spheres
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

#### GT7 finite-volume complements and certified computation

GT7 includes curvature/model comparisons, closed Mostow rigidity, the concrete Weeks
construction/minimality and the separate fibering, Haken and virtual-fibering programme.
The finite-volume programme consumes GT4 realized tame diagrams/links and
Conway identity, Layer 5 compact exteriors/peripheral tori/tube independence, Layer 3
compact-ambient isotopy extension and item 3g relative PL/smooth comparison. No early GT4 target
consumes GT7. Native signatures are in [`FiniteVolumeExtension.lean`](FiniteVolumeExtension.lean).
The positivity and Mostow–Prasad bodies remain explicit hard theorem targets.

**Model comparisons and closed structures.** Build the following comparisons in
addition to the closed-manifold targets.

- **Native-model comparison interfaces (owned by this roadmap).** Consume RiemannianGeometry R4.7 model-construction targets and the actual
  native upper-half-space carrier. Own the explicit dimension-two Riemannian isometry from Mathlib's `UpperHalfPlane` with tensor
  `(dx²+dy²)/y²` to native `TauCeti.UpperHalfSpace ℝ`, including its induced-distance and
  volume-density comparison as a GT7 specialization. Prove that the explicitly installed model metric and
  the chosen native `HyperbolicMetric` witness give the same intrinsic distance.
  Consume the native `TauCeti.HyperbolicMetric` carrier from
  `Riemannian/Hyperbolic.lean` and R4.7's model witness in that carrier. For each
  `n≥2`, compare the geometric-structure model with the R4.7 native
  hyperbolic model by an explicit metric isometry and transport completeness, curvature, and
  volume through it. These comparison targets are GT-owned; R4.7 supplies model-construction targets. Its comparison with Layer8's ModelGeometry
  is a later comparison; the direct model construction does not consume this late GT7 programme.
The closed Mostow theorem remains an actual theorem target in every n≥3, not the native
`IsMostowRigid` hypothesis. Define the Weeks manifold by finite oriented face-pairing
maps with exact algebraic data/isolating intervals and prove the quotient closed,
orientable, complete and curvature−1 before minimality. The generic Weeks minimality,
virtual fibering and virtually Haken targets above remain required separately.

**Precise prerequisite handoffs.** Consume the existing Layer 3 continuous-parameter
isotopy-extension/local-section/restriction-bundle theorem on its pinned compact ambient
C∞ topology. For links in S³ the ambient manifold is compact and boundaryless, so the
actual theorem applies to the compact link and its compact tube; use its finite CW
parameter-pair lifting and support-relative/collar clauses. Do not introduce a topology
on a noncompact diffeomorphism group or move this generic theorem to Layer 1. Layer 1
supplies the general isotopy definitions and tubular foundations. Layer 5's
exterior-naturality target owns exterior comparisons and
interior identification. Existing item 3g supplies independent relative Moise/smoothing
for dimension≤3, including collars and prescribed-neighborhood data; compact truncated
cores meet those hypotheses. GT4 must export an actual realized tame link with finite
planar rotation/PD code, all crossing signs/over-under data and a verified source
picture/Conway/reference identity branch. This programme does not invent those data or
call an unchecked row label a link.

- **Finite-volume hyperbolic structures and the Appendix link-volume table (GT4 consumer).**
  A link complement is the open interior of its compact exterior from Layer 5. Use the smooth
  structure obtained by the verified exterior collar and the GT4 diagram-to-link realization;
  do not assume that an unproved row label already identifies a link. The volume is a metric
  invariant of the underlying complement, unchanged by mirror image or component reorientation
  once the corresponding complement diffeomorphism is established.

  **Native metric and finite real mass.** Use the actual `TauCeti.HyperbolicMetric`,
  `HyperbolicMetric.HasFiniteVolume` and `IsFiniteVolumeHyperbolic`; no second hyperbolic
  metric or finite-measure predicate is defined. The native witness carries its smooth
  tensor, completeness for its OWN intrinsic metric and constant-curvature tensor−1.
  Retain finite-dimensional real model, T3/preconnected smooth manifold, Borel measurable
  structure and Lindelöf hypotheses. The link complements in scope are connected,
  nonempty and boundaryless. Install only `g.metric.toRiemannianMetric` and its actual
  continuous-bundle instance locally when forming `TauCeti.riemannianVolume I M`.
  The native prototype's `metricVolume g` is exactly that measure, and
  `finiteVolume g hg` requires `hg : g.HasFiniteVolume` before converting total mass.
  Prove mass≠∞, nonnegativity, recovery by `ENNReal.ofReal` and proof-witness independence.
  Prove strict positivity by taking a nonempty coordinate ball, using positive continuous
  Gram determinant density bounded below on a smaller closed ball and its positive
  Euclidean measure. An arbitrary finite measure is not necessarily nonzero.

  Prove agreement with native compact `hypVolumeOfMetric` and chosen-metric `hypVolume`.
  Their compact metric-independence lemmas assume `IsMostowRigid`, which is not a proof
  of rigidity. Consume the implemented `RiemannianIsometry.measurePreserving_riemannianVolume`
  with its actual continuous-bundle, C1, Borel and Lindelöf hypotheses; it needs no compactness.
  Deduce equality of ENNReal masses, transport of the native finite-volume witness, and
  equality of finite real masses. Include orientation-reversing isometries, since the
  positive density measure acquires no sign. Never give a nonhyperbolic complement the
  artificial value `ENNReal.toReal ⊤ = 0`.

  Prove the dimension-three finite-volume Mostow–Prasad theorem for connected, orientable,
  complete finite-volume hyperbolic 3-manifolds: a homotopy equivalence is homotopic to an
  isometry. The resulting map is a smooth `RiemannianIsometry`; consequently the total masses
  agree. Own the Margulis lemma, thick–thin decomposition and finite-volume cusp theorem.
  Follow the volume/straightening route: build real singular chains with their ℓ¹ norm,
  straightening and chain homotopy, the maximal-volume regular ideal tetrahedron theorem,
  Haar smearing, and the fundamental-class comparison with Riemannian volume. For cusps,
  prove compact-core relative fundamental classes, norm-controlled filling on boundary tori,
  and cusp truncation with vanishing boundary error. Prove that a homotopy equivalence
  preserves maximal parabolic subgroups, can be made proper on the cusp ends, and induces
  the relative fundamental-class isomorphism. Then prove the boundary-extension and equality-
  rigidity steps: the equivariant sphere map preserves regular ideal tetrahedra almost
  everywhere and agrees almost everywhere with a Möbius or anti-Möbius transformation.
  Descend that transformation to the smooth quotient isometry and identify its homotopy
  class via the induced fundamental-group map. These are GT7 targets, consuming AlgebraicTopology Stage 6's
  relative fundamental-class comparison and existing real measure/Haar integration; they
  do not assume a bounded-cohomology or simplicial-volume library. Thurston,
  *The Geometry and Topology of Three-Manifolds*, §§6.1–6.5, gives the straightening,
  smearing and relative-volume route; the finite-volume boundary/equality adapters stated
  here are also owned targets. Consume
  Riemannian Geometry R4.3 (complete local isometry is a covering), R4.4 (Cartan–Hadamard),
  R4.7 (hyperbolic quotient/isometry classification), and the isometry-germ and quotient-atlas
  interfaces. Order these after this layer's curvature and `HyperbolicMetric` contracts so the
  dependency graph remains acyclic.

**Same-dimension finite-volume Mostow–Prasad.** For two connected boundaryless
complete native hyperbolic metrics g on M and g' on N of the same real dimension n≥3,
quantify independently over `hg : g.HasFiniteVolume` and `hg' : g'.HasFiniteVolume`.
Given actual basepoints x,y and a specified native `FundamentalGroup M x ≃* FundamentalGroup N y`,
construct a native Riemannian isometry for THESE tensors and a path from its image of x
to y whose native basepoint transport induces that isomorphism. The prototype uses
Mathlib's reverse-concatenation convention and `fundamentalGroupMulEquivOfPath`.

In every n≥3, own the Margulis lemma, thick–thin/cusp structure and constant-curvature
space-form comparison, faithful holonomy, and finite-volume-to-lattice measure comparison.
Construct the measurable equivariant boundary sphere map for the specified lattice
isomorphism, with parabolic control for nonuniform lattices. Prove nondegeneracy,
measurable boundary rigidity and agreement almost everywhere with a Möbius or anti-Möbius
map. Promote almost-everywhere equivariance to exact conjugacy using continuity and
full-support boundary measure; descend smoothly through quotient atlases, prove the
tangent inner-product identity and recover the specified group map/basepoint path.
The retained dimension-three straightening/smearing route above supplies its own
boundary/equality prerequisites; it does not alone establish the general n theorem.
For nonorientable manifolds prove orientable-double-cover reduction and equivariant
descent. Requiring an orientation-preserving output needs the corresponding
orientation/fundamental-class sign premise.

The prototype uses a shared real vector model. For different finite-dimensional models,
choose explicit linear coordinates to the same real n-model and prove transport of
charts, metrics, measures and basepoint maps. RiemannianGeometry R4.3, R4.4 and R4.7
supply complete-local-isometry covering, Cartan–Hadamard, model/isometry-germ/quotient-atlas
targets. The order is native GT7 curvature/metric → generic RG constructions → this late
finite-volume application, not a whole-layer cycle. Given rigidity define volume from
a native finite-volume existence witness, prove equality with EVERY such metric's mass,
and transport it along actual complement equivalences. End count alone gives no metric.

  **From a link diagram to a certified metric.** Consume GT4's row-specific diagram encoding, Conway realization and identity audit. On a matching branch use the stated link; on a discrepancy branch use the certified actual class and preserve the printed reference outcome as a separate conditional source claim. Consume Layer 5's
  compact exterior and prove its interior is diffeomorphic to the link complement using its
  torus-boundary collar, then consume Layer 3's existing compact-ambient continuous-parameter isotopy-extension theorem and let Layer 5 own exterior naturality and tube independence: extend ambient isotopies over tubular neighborhoods and prove the induced compact-exterior diffeomorphism is independent of tube choice up to the specified isotopy. Construct a finite relative PL starting complex from each row's PD/rotation-system code. Realize the diagram polygonally as a subcomplex of a triangulated cube `B³`, and form `S³` by attaching the cone on `∂B³`; triangulate this cone compatibly. Take a derived regular neighborhood of the link subcomplex and triangulate its complement in all of `S³`; its boundary tori are the exterior boundary, with no extra `S²` component. Prove regular-neighborhood uniqueness identifies this PL neighborhood with Layer 5's smooth tubular neighborhood, and use the relative PL-to-smooth comparison in item 3g to identify the resulting core with the smooth exterior. Existence of an unspecified triangulation is not certificate input.
  Before row certificates, GT7 owns a finite normal-surface algorithm for compact exteriors: triangulate the boundary-peripheral problem, prove Haken normalisation for embedded spheres and meridional annuli, derive computable bounds for least-weight essential witnesses through fundamental normal-surface/Haken-sum analysis and prove bounded search detects existence. Exclude boundary-parallel/trivial-factor cases. Do not assert all normal representatives are bounded; enumerate the finite witness candidates and prove decision completeness. The row-level prime/split result is then a finite certificate checked against the compact exterior. This target consumes the actual-class diagram identity from GT4 and the exterior construction below; it has no edge back to GT4 or Layer 5.

  Construct a finite special spine of this triangulated compact exterior: specify its local
  disk, triple-line and true-vertex models, the subdivision and spine moves, and the
  homeomorphism between its regular neighborhood and the exterior. Dualize the spine to a
  finite ideal face-pairing complex; prove that deleting its ideal vertices gives the
  exterior's interior and that ideal vertices correspond to the boundary tori. This is
  the special-spine route of Jaco–Rubinstein–Spreer–Tillmann, *On minimal ideal triangulations
  of cusped hyperbolic 3-manifolds*, Proposition 3, using Matveev's special-spine construction.
  It does not follow just by collapsing the boundary of an arbitrary triangulation.
  Own finite move certificates from that explicit starting complex to each chosen row complex, with a verified PL homeomorphism at every move. Truncating ideal tetrahedra produces compact polyhedra with triangular and hexagonal faces, not simplices or the open finite-volume manifold. Subdivide each truncation compatibly into simplices, glue the compact truncated pieces to obtain the compact core, and attach the product cusp collars to recover its interior. Prove the induced smooth triangulation and its boundary-collar compatibility, then compare its PL structure with the core above using item 3g before identifying the resulting interior with the hyperbolic manifold. Track Layer 5's
  `FramedBoundaryTorus` meridian/longitude through these identifications. This gives a
  reusable diagram-to-ideal-triangulation route without a geometric decomposition claim.

  An ideal-triangulation certificate records finitely many oriented ideal tetrahedra, face
  pairings yielding a 3-manifold, ideal vertices in bijection with boundary tori of the compact
  core, exact shapes in the upper half-plane, all edge equations, and peripheral completeness
  equations for a named meridian/longitude basis at each cusp. Exact edge products together with
  positive dihedral angles and the ideal-triangulation Euler count force the total angle at each
  edge to be `2π`; include the angle identity as a checked certificate consequence, not on the
  false ground that the equations permit arbitrary `2πk`. Peripheral equations are stated in
  multiplicative form (holonomy `1`) or an exactly equivalent specified logarithmic form, with
  branch data, and prove complete flat-torus cusp links. The geometric gluing theorem constructs
  a connected complete finite-volume metric on the ideal realization. Construct its
  developing map using R4.7's continuation of isometry germs and quotient atlas, and use
  R4.3's complete-local-isometry covering theorem for the completeness comparison.
  Truncate the cells to a PL core and apply this roadmap's item 3g relative Moise/smoothing theorem
  along its collared boundary to upgrade the proved PL identification with the smooth
  link exterior to a diffeomorphism of interiors. Transport the assembled metric along
  that diffeomorphism and compare the native Riemannian measures by chart characterization
  and smooth isometry invariance. Thus the output metric lives on the specified complement.

  Permit a second, explicitly finite constructor from positively oriented ideal polyhedra whose
  exact shapes and face isometries satisfy edge-cycle angles `2π` and whose cusp-link quotients
  are certified complete flat tori. Apply the same assembly, smoothing, completeness and volume
  proofs. Supply the same exact algebraic vertex/face data and a certified PL identification
  with the exterior interior. Triangulate each convex ideal polyhedron by an explicitly
  compatible coning construction; prove nondegeneracy, positive shapes, boundary-face
  compatibility and volume additivity, so the exact-shape and integral verification below
  applies to this constructor as well. These are certificate constructors for their
  represented manifolds; do not claim every finite-volume cusped manifold has a positive ideal triangulation or a two-polyhedron
  decomposition.

  For exact shape data, use a common number field for the finite shape tuple, with each
  tetrahedron shape represented as `z_t = g_t(θ)` for the same root `θ` of a
  specified irreducible `f ∈ ℤ[X]`, together with rational isolating data selecting the root and
  proving `Im(z_t)>0`. Check gluing, peripheral and nonvanishing-denominator equations by exact
  polynomial reduction in `ℚ[X]/(f)`.

  **Real-algebraic certificates and effective isolation (GT7 owner).** Use Mathlib's
  existing intermediate field `algebraicClosure ℚ ℝ` as the semantic real-algebraic
  carrier, with its actual inclusion into `ℝ` and `mem_algebraicClosure_iff`.
  The semantic realization and interval-refinement adapter has suggested forms in
  [`RealAlgebraicRealization.lean`](RealAlgebraicRealization.lean).
  Finite polynomial/interval/Thom records are representations of its elements, not
  a replacement field. Consume Real Algebraic Geometry Layer 1's polynomial
  IVT/Rolle, Sturm–Tarski and Thom-encoding theorems. Build here the finite
  certificate and effective-isolation adapters required by shape computations.
  A certificate binds a nonzero integer polynomial, its squarefree reduction,
  a signed remainder chain with checked identities and signs, and rational dyadic
  intervals `(a,b]`. Check each interval has exactly one distinct real root,
  the intervals are ordered/disjoint, and their total covers every real root.
  Specify zero-skipping sign variations and the one-sided/endpoint contributions
  giving this HALF-OPEN convention: roots at b are included and roots at a are
  excluded, including a root hit exactly during bisection. Prove soundness,
  uniqueness and algebraicity of every interpreted root, and completeness for
  every nonzero polynomial; nonzero constants return no roots and zero is rejected.
  Multiplicity is recorded separately from distinct-root isolation and recovered
  from the squarefree factorization. Clear rational denominators with the exact
  coefficient map and a nonzero scaling proof before applying the integer checker.

  Prove a finite rational root bound and an effective positive separation bound
  for distinct roots of the squarefree polynomial. Use these to prove termination
  of exact Sturm bisection and refinement to any specified positive rational width;
  an optional search heuristic must still pass the same finite checks. Export
  representation-to-native-carrier evaluation, invariance under valid refinement
  and change of defining polynomial, and completeness of finite representations
  for elements of `algebraicClosure ℚ ℝ`. Build certified addition, subtraction,
  multiplication, rational embedding and inversion with an explicit nonzero
  premise. Use elimination polynomials plus isolation to select the actual result;
  prove each operation agrees with the existing field operation. Decide equality,
  order and signs of rational-polynomial expressions at represented roots by
  exact common-root/gcd and Sturm–Tarski/Thom tests. Equality and zero cases need
  these algebraic tests; disjoint-interval refinement alone does not decide them.
  Supply the denominator-nonvanishing tests needed for rational expressions.

  Follow the half-open interval and ordinary-polynomial interface of the existing
  [Hex real-root work](https://github.com/leanprover/hex-real-roots) and its
  [theory companion](https://github.com/leanprover/hex-real-roots-mathlib/blob/e869b0f6c1e45199498994faf0de1b01786a97a7/HexRealRootsTheory/IsolateRoots.lean), whose
  `Hex.IsolatedRealRoots` exposes uniqueness, coverage and ordering. Prove the
  adapter from accepted finite checks to those semantics and the native
  algebraic-closure carrier; the arithmetic and sign adapters above remain GT7
  targets. Coordinate any code integration under the repository's porting rules.

  GT7 also owns complex-root isolation and the complex-to-real sign adapter.
  In the resultant route substitute `θ=x+iy` into f, derive the coupled real and
  imaginary polynomial equations, isolate the finitely many candidate coordinate
  roots and check the ORIGINAL coupled equations to exclude extraneous resultant
  pairs. Prove existence, uniqueness and exhaustion for the selected complex root;
  couple every `g_t(θ)` to that same root and certify its positive imaginary part.
  Alternatively own a complex-box root-count theorem with the same existence and
  uniqueness guarantees. Rational boxes alone are not certificates. State the full
  error-controlled integral construction for `Λ(θ)=−∫₀^θ log(2 sin t) dt`, including directed
  enclosures for branch-controlled shape angles and improper endpoint integrals. HIKMOT
  §§2–4 is a reference for interval verification of gluing and hyperbolicity, not a volume
  integral or exact algebraic root certificate; use Ratcliffe's ideal-tetrahedron volume
  formula as the geometric reference.

  Prove that a positively oriented ideal tetrahedron with dihedral angles `(α,β,γ)` has
  hyperbolic Riemannian volume `Λ(α)+Λ(β)+Λ(γ)`, that the triangulation 2-skeleton has measure
  zero, and that summing these terms equals the integral of the installed metric's
  `TauCeti.riemannianVolume` on the link complement. Do not assume an existing dilogarithm,
  shape-equation or interval-arithmetic API. A certificate returns rational bounds `a < b` with
  `a < vol(M) < b`; Mostow–Prasad makes the value independent of the chosen metric certificate.

  **GT7.KnotTable.RowExteriorClassification.** After the row diagram is identified
  and its compact exterior constructed, prove a normal-surface decision procedure
  for splitting spheres and meridional annuli. State normal matching equations and
  embeddedness/Euler-characteristic constraints; prove the least-weight
  essential-witness bounds, normalization and Haken-sum reductions, including
  essentiality and boundary-parallel exclusions. Enumerate bounded witnesses and
  prove existence detection rather than bounding all normal representatives.
  Classify the actual exterior on the diagram branch and, separately, the named
  reference exterior when its identity is certified.

  Pin equivalence to unoriented ambient homeomorphism of `S³` carrying the link
  setwise, allowing either ambient orientation; thus mirrors are identified,
  component orientations are forgotten and component ordering is forgotten.
  Crossing number is the minimum over all regular diagrams in that class, not
  the number of crossings in a chosen picture. A reference prime link is nonsplit,
  nontrivial, and prime under connected sum along any component: every sphere
  meeting the link transversely in two points cuts off a ball whose intersection
  with the link is a single unknotted arc. The ball contains no other components.
  Distinguish this from mere nonsplittability and from primeness of a diagram.

  Define three intrinsic reference classes at the fixed bounds from the Appendix:
  prime knots with crossing number at most9 (equivalently3–9), prime two-component
  links with crossing number at most8, and prime three-component links with crossing
  number at most7. The intended finite comparisons are respectively the84 knot
  rows, the30 non-unlink two-component rows, and the four three-component rows.
  The31 two-component rows comprise those30 reference rows plus the explicit
  two-component unlink exception. Prove distinctness, crossing minimality and
  exhaustion for these intrinsic classes by comparison with the GT4 finite
  enumeration; an index set of the advertised size is not a completeness theorem.
  Reference diagrams, labels and the source-picture identity branch require their
  separate GT4 checks under exactly this equivalence relation. If a reference or
  source identity fails, classify the actual diagram and prove the discrepancy
  rather than imposing the advertised class on it.

  Keep the source introduction's unrestricted completeness assertion as a separate
  claim to establish or refute. Classify ALL omitted types at the SAME bounds:
  knots≤9, two-component links≤8 and three-component links≤7, including the unknot,
  connected sums, split/disjoint unions and componentwise composite links.
  Use GT4's generic prime-decomposition and finite-diagram enumeration targets,
  prove the splitting/connected-sum reconstruction exhaustive, and check membership
  in each crossing bound using that enumeration and crossing-minimality proofs.
  Do not assume crossing-number additivity for arbitrary knots or links to truncate
  the search. This target owns the row-specific exterior certificates and finite
  comparison; GT4 owns generic link prime decomposition and diagram enumeration.
  It consumes GT4 identities and Layer5 compact exteriors, with no dependency back
  to either owner.

  **Complete source ledger and WITHOUT ROUNDING.** Colin Adams's *The Knot Book*
  Appendix, printed pp.279–290 (physical pp.8–19 of the source extract), contains all 119
  retained row obligations: 84 knots, 31 two-component links, 4 three-component links;
  107 positive decimal strings and 12 `0.0` sentinels. The full ledger is
  [`references/finite-volume-table-obligations.md`](references/finite-volume-table-obligations.md).
  Keep every literal label, Conway string, decimal, fractional digit count, GT4 row ID,
  picture-identification obligation and qualification, including all cropped/repeated
  occurrences. This is the whole finite Appendix, not a small-crossing sample. Its 84 knot
  reference rows have the prime-knot conventions and omissions specified above; the
  broader literal introduction is retained separately, not silently reinterpreted.

  The stated display rule is WITHOUT ROUNDING to eight decimal places. A matching
  positive ordinary eight-place row with exact rational d requires `d ≤ Vol < d+10⁻⁸`.
  A symmetric tolerance or nearest rounding does not discharge this. If a rigorous
  interval proves the literal claim false, prove a source discrepancy with the corrected
  interval instead of asserting a false theorem. Keep `5₂ = 2.8281220` with seven places
  and `8₈ = 7.801341224` with nine places. For those exceptions test displayed-k truncation
  `d ≤ Vol < d+10⁻ᵏ` AND adjudicate the conflicting general eight-place assertion separately.
  A seven-place success is not eight-place source closure. Keep competing readings
  and their uncertainties in the source evidence; infer no missing digit and
  discard no ninth digit.

  First prove the actual diagram-to-reference identity. On a matching branch certify
  the reference complete finite-volume metric and truncation bound, or a proved decimal
  discrepancy; sentinel rows require their separate reference obstruction. On a mismatch
  branch certify the actual class either finite-volume hyperbolic with a rigorous interval
  or with no complete finite-volume metric, then report the reference claim separately
  and conditionally. Do not force a reference value or obstruction on another actual class.
  A `0.0` row asserts absence of COMPLETE FINITE VOLUME metrics, not all infinite-volume
  hyperbolic metrics. Applying the introduction's knot sentinel convention to link rows
  remains the explicit interpretation being tested. Produce rigorous comparison intervals;
  repeated printed decimals alone do not assert exact equality, and any claimed equality
  needs its own geometric or analytic proof. Finite row-list equality is not tabulation
  completeness, crossing minimality or distinctness: the retained downstream classification
  programme remains substantive and has no GT7-to-GT4 dependency.

  **Canonical decomposition and tilt targets.** Prove existence and local finiteness of the Epstein–Penner decomposition for the complete finite-volume cusped hyperbolic structures in scope, from a specified positive cusp decoration; prove the quotient has finitely many cells and simultaneous global rescaling of all cusp decorations preserves its canonical combinatorial decomposition. Prove the exact signed-tilt criterion used by the certificate: derive each tilt from algebraic shape and horospherical data, fix its sign convention, and show the stated inequalities, including equality cases resolved by the canonical face-poset convention, characterize precisely the canonical faces. A finite list of signs must establish that the candidate is canonical, not merely a cellulation.

  **GT7.KnotTable.NoninvertibilityByPeripheralAction (downstream of GT4).** For `8₁₇`, `9₃₂`, and `9₃₃`, consume GT4's row-specific diagram-to-link identity and Layer 5's compact exterior and construct the complete finite-volume hyperbolic metric, cusp structure, and framed meridian-longitude basis. Prove `Isom(H³/Γ) ≃ N_{Isom(H³)}(Γ)/Γ`, including both orientations, and prove the normalizer quotient finite by its faithful action on a finite canonical cusp-decorated Epstein–Penner cellulation. Fix one equal-area horospherical section per cusp; show the canonical cellulation and decoration are invariant under the full isometry group. Prove local finiteness and finite quotient of the canonical cellulation from the compact thick core, finitely many cusp ends, and the explicit cusp truncation; the row certificate records the finite cell list. From algebraic shape/cusp data, compute every convex-hull and tilt comparison with exact real-algebraic sign certificates, including equality cases. Use the isometry-invariant barycentric subdivision of the abstract face-poset cell structure for finite computation. Enumerate automorphisms of the developed finite cell presentation, including every ideal-vertex occurrence, face flag, and side-pairing (not merely cusp labels in the quotient), recording whether an automorphism preserves or reverses orientation and its
induced peripheral basis matrices, rather than requiring it to fix that basis.
For each combinatorial candidate, choose three distinct ideal-vertex occurrences
of a developed cell and construct the unique Möbius map carrying them to their
prescribed images; also construct the anti-Möbius candidate by conjugation.
Use exact algebraic coordinate/cross-ratio tests on every remaining vertex and
face, and verify every side-pairing intertwining equation. Reject candidates
that fail a test. Prove accepted maps carry every cell isometrically to its
prescribed cell, extend equivariantly over the connected developed cellulation,
and normalize `Γ`, hence descend to global isometries. Conversely every isometry
induces an enumerated combinatorial candidate and passes these tests. This proves
that the accepted finite list, with composition, is exactly the full isometry
group, rather than only a finite group containing its faithful image. Compute
and record the induced `GL₂(ℤ)` action on each framed cusp, allowing all matrices
that the isometry realizes. In the kernel, choose a lift fixing one cell; connected side-pairing incidence then forces it to fix every vertex occurrence. A full-dimensional cell has four ideal vertices not on one circle, so no nontrivial Möbius or anti-Möbius isometry can fix that set and the kernel is trivial.  Prove each cusp stabilizer is the full parabolic group of that cusp and is self-normalizing in the torsion-free lattice; consequently the induced map on the rank-two peripheral group determines a basis action independently of the chosen lift and cusp representative. If an ambient orientation-preserving isotopy starts at the identity and its
end map carries the knot to itself with reversed orientation, restrict that end
map to the exterior using Layer 3 isotopy extension and Layer 5 tube independence;
prove it induces `(-1,-1)` on the framed meridian-longitude basis. Compare against the full enumerated action set; an invertibility conclusion from another action additionally requires a meridional-filling extension proof. This resolves only the oriented orbit records and is downstream of, never a prerequisite for, GT4's finite unoriented enumeration.

  The peripheral-action conclusion also has a rigidity bridge. Given an ambient isotopy whose endpoint reverses the oriented knot, first restrict the endpoint to the compact exterior and obtain its induced peripheral map. Apply finite-volume Mostow–Prasad to the resulting homotopy equivalence to obtain an isometry in the same homotopy class; for cusped ends, construct a proper homotopy by straightening the map on cusp neighborhoods while preserving the induced maximal-parabolic subgroups. Prove that properly homotopic maps induce the same map on each peripheral `H₁` after the cusp correspondence is fixed (basepoint conjugacy disappears in abelianization). Only then compare the endpoint's `(-1,-1)` matrix with the enumerated isometry actions. This bridge is owned by GT7 and consumes the finite-volume rigidity theorem above.

  On a matching identity branch, each of the 12 `0.0` reference rows requires a separate
  `NoCompleteFiniteVolumeHyperbolicMetric` theorem, not an equality saying volume is zero. If identity fails, prove the actual class either has a complete finite-volume hyperbolic structure with exact interval or admits no complete finite-volume hyperbolic metric; the printed sentinel and the routes below remain reference-class claims. The reference obstruction alternatives are: (a) a
  diagram-certified split sphere, contradicted by irreducibility of a finite-volume hyperbolic
  3-manifold; (b) a diagram-certified torus-knot/link or Seifert fibration with nontrivial
  central fibre, contradicted by the centerless lattice theorem; (c) a diagram-certified
  essential interior torus, contradicted by the finite-volume lattice's peripheral subgroup
  structure. Prove the lattice facts used here: finite covolume implies non-elementarity, and
  a torsion-free non-elementary lattice has trivial center and no normal infinite cyclic
  subgroup. Prove hyperbolic irreducibility using the universal cover `ℍ³ ≃ ℝ³` and
  Brown–Schoenflies. Since `S²` is simply connected, its inclusion lifts to an embedded sphere in the universal cover `ℍ³ ≃ ℝ³`; Schoenflies bounds that lift by a compact ball `B`. Distinct deck translates of the lifted sphere are disjoint, so their Schoenflies balls are disjoint or nested. A strict nesting `γB ⊊ B` (or `B ⊊ γB`) would make infinitely many iterates meet `B`, contrary to proper discontinuity. Equality gives a compact-set stabilizer, which is finite by proper discontinuity and trivial because the lattice is torsion-free. Thus distinct translates of `B` are disjoint, and `B` projects to an embedded ball bounded by the original sphere. This proves irreducibility rather than citing it as a label. Prove the essential-torus obstruction by identifying its injected `ℤ²` subgroup and proving the geometric peripheral/atoroidality theorem. Prove an embedded incompressible torus homotopic into a cusp is boundary-parallel using the irreducible-exterior product/annulus comparison; mere placement in the interior is not an obstruction. Consume GT4's
  Wirtinger presentation and the diagram-identification targets only after the row diagram has been identified. GT4 owns explicit PD/Reidemeister certificates identifying the listed torus knots, torus links, and pretzel diagrams; GT7 owns their exterior homeomorphisms, Seifert/torus-fibration models and central-fibre computations. Neither follows from a label or Conway string alone.

  The ledger assigns the torus-knot route to `3₁`, `5₁`, `7₁`, and `9₁`; the torus-link route
  to `2₁²`, `4₁²`, `6₁²`, and `8₁²`; the splitting-sphere route to `0₁²`; and the
  Seifert-fibration route to `7₇²`. For the three pretzel-coded rows, first prove
  the GT4 Conway/diagram identifications `8₁₉ ≅ P(−2,3,3)`, `7₇² ≅ P(−2,2,3)`, and
  `6₂³ ≅ P(−2,2,2)` (allowing mirror and component reorientation, which preserve the
  complement volume). Then use Stoimenow, “On the crossing number of semiadequate links,” §4.3, Corollary 4.3 and Proposition 4.3 for the pretzel-form identifications: respectively `T(3,4)`, a Seifert-fibered Montesinos link, and `T(3,3)`. GT4 must still give finite Reidemeister/code certificates from the literal row diagrams to those pretzel diagrams; the citation does not certify that encoding step. The remaining torus knot/link and unlink identifications are likewise finite GT4 diagram theorems, and GT7 supplies their group/exterior models. No row's topology is inferred from a label or Conway string alone.


**Checker and analytic soundness programme.** Define finite records of oriented face
permutations, cusp links/peripheral curves, exact polynomial systems, rational interval
boxes, integer edge/peripheral exponents and logarithmic branch counts, and a finite PL
move certificate from the actual exterior starting complex. A checker returns an error
or structured certified data; an unchecked Boolean is not geometric validity. Prove
rational interval operations outward enclosing, with denominator zero exclusion.
The exact-algebraic branch proves irreducibility, complex-root isolation and shape
substitution identities; the analytic branch proves a concrete interval Newton/Krawczyk
inclusion theorem with rational preconditioner, derivative bounds and an actual root.
Prove all omitted equation dependencies and cusp relations. Zero in an interval alone
proves neither existence nor equality. Certify the branches and full angle sums; the
retained positive-shape/Euler-count lemma justifies any omitted angle tests under its
precise ideal-torus-triangulation hypotheses, not for arbitrary polyhedral input.

Pin ordered ideal vertices `(∞,0,1,z)`, `Im z>0`, edge shapes z,1/(1−z),(z−1)/z and their
face-order/orientation convention. Prove the three positive dihedral angles sumπ and
that the native curvature−1 half-space measure gives the Λ-sum. Define Λ by its
convergent improper integral; prove the equivalently normalized Bloch–Wigner identity,
branch-controlled log/sin/argument estimates, and explicit integrable endpoint-tail
bounds. Prove the 2-skeleton null and finite-volume additivity, not just a formal sum.
For a flat cusp section of area A prove the metric `dt²+exp(−2t)ds²` has density
exp(−2t), end mass A/2 at height0, tail A exp(−2T)/2 after heightT and complete escape
distance. Finitely many cusp ends plus the compact thick core prove completeness and
finite positive mass of the assembled metric.

Soundness returns the actual native HyperbolicMetric, its own HasFiniteVolume witness,
a proved topological/smooth identification with the marked complement, and rigorous
bounds on that exact metric's mass. Failure gives no nonhyperbolicity conclusion.
No universal positive geometric ideal-triangulation existence theorem is assumed;
alternative polyhedral certificates need the same topology, completeness and volume
checks. Exact-boundary decimal cases require an equality/one-sided proof when an open interval
cannot decide them; numerical refinement alone does not decide equality. All 119 rows
still require concrete certificates or explicit alternative proved
constructions. The native measure adapters, rigidity interface and geometric checker
must be connected by the soundness theorems above.

**Primary scope.** The retained Ratcliffe extract proves closed rigidity and only records
the historical finite-volume extension. Thurston's structure/developing-map extract is
not a rigidity proof. [SnapPy verification internals](https://snappy.computop.org/verify_internals.html)
and its [verified interface](https://snappy.computop.org/verify.html) guide separation of
root, geometric and interval checks; external computations are not Lean certificates.
Adams–Hildebrand–Weeks, *Hyperbolic invariants of knots and links*, Trans. AMS 326(1) (1991),
1–56, DOI 10.1090/S0002-9947-1991-0994161-2, is an identified related primary article.
Its table body/display policy and the course's missing Chapter5 key crosswalk remain
unverified. Article metadata authenticates no appendix number or rounding rule. All
original source/glyph/intent/proof uncertainty remains separate from corrected targets.

#### GT7: complete finite classifications

Consume early GT4 raw realized diagram enumeration, geometric invariant and identity certificates, GT5 compact exteriors, and GT7 finite-volume geometric comparison. These semantic classification/minimality outputs are NOT premises of early GT4, the early GT4 colourings, surfaces, tangles, groups and polynomial targets or GT5. Preserve the complete GT7.KnotTable.RowExteriorClassification contract and its 119 exact row obligations; this section extends its count suite through15 and does not silently relocate finite exterior classification into early GT4. Generic connected-sum decomposition and low-crossing direct planar proofs may remain early, but they do not depend on this late finite classification theorem.

The data suite includes every source table occurrence, not only prime knot polynomials: prime knots through9, two-component links through8, three-component links through7, all smaller exercise tables, article Table1/Table2 entries, and prime-count statistics through15. Declare prime/split/composite/mirror/oriented quotient conventions before enumerating. For each declared finite table prove completeness by exhaustive realizable encodings and reduction/isotopy certificates; prove pairwise separation or equivalence including Perko duplicates and orientation conventions. Polynomial equality alone never certifies type. Each entry carries actual diagram/PD code and realization, minimal crossing proof, component/orientation identification, Conway/DT/braid encodings, all requested matrix/polynomial/bridge/genus values and individually qualified hyperbolic data from GT7. Missing printed cells and ambiguous orientations stay source data holds even when a separate corrected dataset is proved. For the source156 count suite, define prime UNORIENTED tame knot images up to ambient homeomorphisms allowing reflection, so mirror pairs and orientation reversals are identified; also retain the finer orientation-preserving/mirror-sensitive classes used by exercise1. Construct exact finite enumeration and equivalence/minimality certificates proving the numbers at crossing3,…,15 are respectively1,1,2,3,7,21,49,165,552,2176,9988,46972,253293 in that declared quotient, or identify an exact source-count correction with its independent proof rather than silently changing the literal. Completeness, primeness, all duplicates and possible chirality identifications require actual certificates through15, not extrapolation from≤9. These are required substantive mathematical targets. Preserving a historical reported statistic alone does not discharge them; an incomplete enumeration specification remains an explicit gap.

#### GT7: unknotting, rational replacement and cyclic fillings

These targets consume early GT4's realized knots, ordinary genus, prime/split
criteria, rational tangles and explicit crossing-change certificates, and
Layer5's compact exteriors, marked slopes and Dehn fillings. They are late
applications and supply no prerequisite for early GT4 or Layer5.

Prove Scharlemann's theorem: no generalized crossing change on a composite tame
knot produces the unknot. A generalized crossing change is ±1/n surgery, n≥1,
on the boundary of an embedded disc pierced twice with opposite signs. Construct
the rational-tangle replacement dictionary, its distance2n, associated genus-two
handlebody, compressing discs and dual boring arcs. Build the sutured-manifold,
conditioned-surface, boundary-compression and finite hierarchy/index interfaces
for Taylor's handle-addition comparison. Prove its meridional planar-surface
replacement theorem: at distance d≥1, assuming Lα is a knot or the specified
complementary handlebody boundary is incompressible, and Lα is split or has no
minimum-genus Seifert surface disjoint from its dual arc, an essential meridional
planar surface with m boundary curves in the Lβ exterior can be replaced by Q
with at mostm boundaries, disjoint from the β dual arc or satisfying
`|Q∩β̄|(d−1) ≤ |∂Q|−2`.

For this application construct a marked model before making the spanning-disc
dichotomy. Use the reverse crossing-circle data on the unknot U: C=∂D, where the disc D meets U
twice with opposite signs, and filling slope μ+kλ, coefficient1/k with |k|=n,
recovers K. Here λ is the disc longitude. Prove the reverse dictionary by taking
μ*=μ+kλ and λ*=λ and adjoining the radial longitude annulus of the filling
solid torus to the punctured crossing disc; the old meridian is μ*−kλ*.
Retain the actual strand and peripheral markings, not just an abstract S³.

Choose an arc η⊂D joining the punctures and W=ν(U∪η). Construct its genus-two
handlebody and central-rung co-core meridian m_U; cutting along it gives the
actual ν(U). Let N=closure(S³ minus W). Prove N irreducible: a locally flat
sphere in N bounds two balls in S³, and connected W lies on one side, so the
other ball misses W. Choose the regular neighborhood compatible with a thin
disc P⊂D around η. The opposite puncture signs and one-component U force the
outside endpoint pairing top-to-top and bottom-to-bottom; hence the middle
proper disc P_W separates W into two solid tori. For γ=∂P_W, prove
 i(m_U,γ)=2: the displayed co-core crosses twice and its boundary homology has
nonzero projection to BOTH once-punctured-torus summands of ∂W−γ, excluding a
disjoint representative; separating-curve parity gives the lower bound.

Construct the signed k-fold proper-disc twist φ on W and m_K=T_γ^k(m_U).
The SAME cut/rotation/regluing map inserts the prescribed full twists in the
two marked strands, carries the U core to K, and carries its meridian to m_K.
Thus N[m_U] and N[m_K] are the actual compact U and K exteriors. Prove the
annular self-curve intersection formula, including the no-bigon comparison,
to obtain i(m_U,m_K)=|k|i(m_U,γ)^2=4n and rational distance2n. These are actual
labelled filling comparisons. In the above surface theorem U is Lα, K is Lβ,
and the U-side dual arc is this chosen η; no claim about an arbitrary earlier
tunnel with the same endpoints is needed.

If U has a spanning disc E disjoint from the interior of η, put E and D
transverse in their endpoint collars. Compact separation away from the two
endpoints permits P to be narrowed so C₀=∂P meets E exactly twice. The annulus
D−int(P) avoids U and isotopes C to C₀ preserving its disc framing; this circle
isotopy need not fix E. At its end use the original E spanning the unchanged U.
The two intersection signs are opposite because lk(C₀,U)=D·U=0. Remove small
discs at those intersections and attach an oriented tube along a C₀ subarc
whose interior misses E. The resulting embedded surface F lies in the surgery
exterior, has boundary U and χ(F)=−1, and survives the coefficient1/k filling
to span K. Consequently g(K)≤1 for every |k|=n≥1. Ordinary genus additivity and
positivity give g(K)≥2 for a composite nontrivial K, a contradiction. Own the
relative collar, framed-annulus, oriented-tube and marked surgery comparisons.
The spanning disc restricts in the compact unknot exterior to a proper disc
bounded by the preferred LONGITUDE, not the knot meridian.

Otherwise every minimum-genus Seifert surface of U is a spanning disc meeting
this η. Since U is a knot, the alternative hypotheses of the above planar-surface
comparison hold for this constructed model; apply that theorem. A nonseparating
meridian by itself would not supply the missing spanning-disc hypothesis.
The composite Lβ has an essential meridional
annulus; exclude the essential-disc replacement by the nontrivial knot-group
criterion. At d=2n≥2 the inequality forces zero dual-arc intersections. Track
the resulting decomposing sphere through the local replacement, proving one
nontrivial connected-sum factor unchanged and contradicting an unknot output.
Deduce u(K)=1⇒K prime, and u(K#J)=2 when both u(K)=u(J)=1, using the separate
upper certificate. Reference: [Taylor, Adding2-handles to sutured manifolds,
Theorem5.12 and Corollary5.13](https://arxiv.org/html/0806.1572v2).

Own the cyclic-surgery theorem in the required knot-exterior form: for a
nontrivial tame J⊂S³ whose exterior is not Seifert-fibred, any two slopes with
cyclic filled fundamental groups have distance at most1. Build the finite
SL₂(ℂ) character-variety, valuation/tree-action, detected essential-surface and
boundary-slope comparison needed for this theorem; the asserted conclusion is
a theorem target, not inferred from the existence of a character set. Separately
prove that a Seifert-fibred S³ knot exterior is a torus-knot exterior, and that
reduced a/b surgery on T(r,s), |r|,|s|≥2, gcd(r,s)=1, is a lens space exactly
when |a−brs|=1. Keep the unknot exterior and meridian filling separate. Construct
lens spaces with marked orientation, their fundamental groups, and the exact
unoriented homeomorphism test L(p,q)≅L(p,q′) iff q′≡±q^(±1) modp.

For the explicitly realized rational8₃ diagram [4,4], prove the double branched
cover is L(17,4), with its convention/marking comparison. Prove the Montesinos
crossing-change lemma: unknotting number1 would exhibit this cover as ±17/2
surgery on a knot J⊂S³. The meridian and that filling have cyclic groups at
distance2, so the non-Seifert case is impossible. For the torus-knot case,
|±17−2rs|=1 forces |rs|=8 or9; no such pair is coprime with both absolute
values≥2. The unknot case yields L(17,±2); prove it is not homeomorphic to
L(17,4) by the stated residue test. This gives u(8₃)≥2. Give the actual two
crossing changes reducing [4,4] to a rational unknot, and prove u(8₃)=2.
Every diagram, branched-cover, framing and surgery identity in this argument
requires its own explicit comparison, rather than an inference from a row label.

### Layer 8: Thurston geometries and the JSJ / geometric decomposition

Geometrization is much harder to *state* than the Poincaré conjecture, because its
conclusion is structural: not "homeomorphic to a fixed model" but "cut along canonical
tori, every piece carries one of eight geometries". The general geometrization
target below is a faithful statement. The separate GT8.H closed-Haken
hyperbolization package is a constructive theorem and supplies an actual
metric to Layer10; it does not treat that statement as a proof supplier.

**From Mathlib / earlier layers.** Layer7's Riemannian and hyperbolic
structures and isometry groups; Layer5's torus complements and gluing;
Layer1's connected-sum construction, collars and locally flat/smooth sphere
interfaces; the smoothing-and-triangulation comparison3g's independent
low-dimensional PL/smooth existence and uniqueness; Lie groups
(`Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`) for model isometries.
RiemannianGeometry R4.7 supplies the direct free/proper isometric-quotient
atlas; its model construction precedes the later rigidity/volume comparisons.

**What to build, in this order.**

- **Earlier orientable sphere-theorem construction.** For an orientable smooth
  or PL3-manifold, construct from π₂(M)≠0 an embedded two-sided S² whose class
  in π₂(M) is nonzero (with a path to the supplied basepoint). This precedes
  prime and JSJ decomposition and has no geometrization premise. Consume
  Layer1/3g's triangulation, locally flat sphere/collar, PL general-position,
  covering-lift and regular-neighborhood interfaces. Build the actual PL tower
  proof: compactify the representative's finite triangulated image inside a
  compact regular neighborhood; construct the tower of lifted neighborhoods
  and its cover/π₁-module bookkeeping; desingularize boundary sphere maps by
  disc surgeries, and prove that essentiality cannot disappear from all
  descended sphere components. Supply the well-founded tower reduction and
  termination argument and preserve the represented nonzero class through
  its explicit module relation; a homology-nonzero surface is insufficient.
  Export the embedded essential sphere, its normal two-sided structure and
  smooth/PL transport.
  An irreducible manifold therefore has π₂=0, since every embedded sphere
  bounds a ball. Prime remains different: S²×S¹ is prime and not irreducible.
  Separately, for a connected boundaryless3-manifold with infinite π₁ and π₂=0,
  use its NONCOMPACT universal cover, higher-cover π comparisons, orientation
  local homology, top ordinary homology vanishing and3-dimensional CW type
  to prove the cover contractible by Hurewicz/Whitehead, hence K(π₁,1).
  Never replace the cover by the compact base in that homology calculation.

- **Sphere systems and prime 3-manifold factorization.** For a connected closed
  oriented smooth 3-manifold, construct finite disjoint two-sided embedded
  2-sphere systems, cutting, ball-capping and connected-sum reconstruction.
  Define irreducible to mean every embedded smooth (equivalently locally flat
  PL) 2-sphere bounds a 3-ball. Define prime by connected sums having an S³
  factor; distinguish this predicate from irreducibility. Prove Kneser–Milnor:
  M is an iterated connected sum of finitely many non-S³ prime factors, with
  the empty family representing S³, and the multiset of oriented diffeomorphism
  types of these factors is unique. Prove the only closed oriented prime
  exception to irreducibility is S²×S¹; separating sphere cuts and
  nonseparating sphere cuts have their respective connected-sum and S²×S¹
  reconstruction laws. This is manifold factorization, separate from GT4's
  knot/link factorization.

  Own the proof suppliers here before JSJ: obtain a finite PL triangulation
  from comparison3g, normalize essential spheres by innermost-circle/disc
  surgery and establish Kneser's finite bound on a reduced disjoint essential
  sphere system from its finite tetrahedral data. Build the normal-disc
  compatibility and product-region removal needed for that bound here,
  independently of GT7's link-exterior certificate engine. Cut until the
  remaining capped factors are irreducible, separating off the nonseparating
  S²×S¹ summands. Prove uniqueness by sphere surgery and the comparison of
  complete systems under sphere slides and deletion of ball-bounding/unit
  components; transport through the PL/smooth comparison. The uniqueness
  conclusion is on prime factor types and their multiplicities, not ambient
  isotopy of arbitrary sphere systems. Export factor permutations, connected-
  sum reconstruction and orientation reversal.

- **The eight model geometries** as homogeneous complete simply-connected
  Riemannian 3-manifolds `(X, Isom X)`: S³, E³, ℍ³, S²×ℝ, ℍ²×ℝ,
  SL₂~, Nil and Sol, with the standard maximal model isometry groups (Scott,
  *The geometries of 3-manifolds*). Encode the eight types as a closed
  enumeration with their actual models and homogeneity proofs. A complete
  geometric structure on a connected boundaryless manifold is a Riemannian
  metric whose installed distance metric is complete and which is locally
  isometric to that model. Prove the developing/covering comparison with X/Γ
  for a subgroup acting freely and properly discontinuously by isometries,
  using R4.7's quotient atlas. Discreteness alone does not replace freeness;
  quotient orbifolds are not the manifold carrier. For a compact cut piece P
  with torus boundary, a complete geometry means one on int P. Transport
  completeness and the local model through the interior/collar comparison.

- **Admissible torus decompositions and the minimal JSJ system.** For a compact
  connected orientable irreducible 3-manifold with empty or incompressible
  torus boundary, define incompressibility by π₁-injectivity of a two-sided
  embedded torus; distinguish boundary-parallel tori. An admissible
  decomposition bundles a finite indexed family of disjoint incompressible
  interior tori, the compact cut pieces with their two marked boundary copies
  for every cutting torus, and a gluing identification recovering M. Each
  piece is Seifert-fibred or atoroidal, where atoroidal means every
  incompressible interior torus is boundary-parallel. Own the Seifert fibration,
  exceptional-fibre/local-model and base-orbifold API needed to state that
  alternative, including the nonunique-fibration examples.

  Define `IsMinimalJSJ` on an admissible decomposition: no proper subfamily
  of its cutting tori, after recomputing the cut pieces, is admissible.
  A `JSJDecomposition` is an admissible object together with this minimality
  condition. Prove existence of such an object and uniqueness of its torus
  system up to ambient isotopy (rel the given boundary collars), with the
  induced permutation and diffeomorphisms of cut/gluing data. The Seifert
  fibration of a piece is not asserted unique. The empty system is the
  convention when M itself is Seifert-fibred or atoroidal; in particular it
  is the JSJ system of T³, so redundant coordinate tori are excluded.
  Treat torus bundles and semi-bundles explicitly: use the actual minimal
  system in this convention, allowing nonseparating fibre tori and the two
  boundary copies of a single cut. Distinguish their possible Sol geometry
  on the closed manifold from the geometry on the interiors of the cut
  pieces. Prove normalization, torus-system finiteness, product-region
  removal and Seifert-piece matching before the existence/uniqueness theorem.
  The classical route is the minimal torus theorem in Hatcher,
  *Notes on Basic 3-Manifold Topology*, Chapter1 §2, Theorem1.9
  ([author's contents](https://pi.math.cornell.edu/~hatcher/3M/3M-tc.html)).

- **Geometrization.** First apply sphere factorization to a connected closed
  orientable M. Its S²×S¹ factors carry the S²×ℝ geometry. For each other
  prime factor apply the irreducible JSJ theorem: every compact cut piece has
  a complete geometric structure on its interior, with the empty-boundary
  piece interpreted as the closed manifold itself. Retain all eight model
  types and the exceptional closed geometric torus-bundle/semi-bundle
  comparisons. State this as geometrization, without claiming finite volume
  or a geometry on a compact manifold with boundary as a boundaryless
  quotient. The Poincaré conclusion is the separate consequence that a
  simply-connected closed 3-manifold is diffeomorphic to S³, using the
  prime/JSJ and model-quotient comparisons.

```lean
-- structure Prime3Factorization (M : ClosedOriented3) where
--   count : ℕ; factor : Fin count → ClosedOriented3
--   nonunit_prime : ∀ i, NonSpherePrime (factor i)
--   reconstruct : M ≃ₘ orientedConnectedSum factor
-- theorem prime3_exists (M) : Nonempty (Prime3Factorization M)
-- theorem prime3_factorTypes_unique (F F' : Prime3Factorization M) : …
-- structure AdmissibleTorusDecomposition (M : IrreducibleOriented3) where
--   count : ℕ; emb : Fin count → EmbeddedTorus (interior M)
--   disjoint : …; incompressible : …; cutAndGlue : …; seifertOrAtoroidal : …
-- def IsMinimalJSJ (D : AdmissibleTorusDecomposition M) : Prop := …
-- def JSJDecomposition M := {D : AdmissibleTorusDecomposition M // IsMinimalJSJ D}
-- theorem jsj_exists (M : IrreducibleOriented3) : Nonempty (JSJDecomposition M)
-- theorem jsj_torusSystem_isotopic (J J' : JSJDecomposition M) : …
-- theorem geometrization_piece (M : ClosedOrientedIrreducible3)
--     (J : JSJDecomposition M) (p : J.pieces) :
--     ∃ G : ModelGeometry, HasCompleteGeometricStructure (interior p) G
```

**Design notes.** Layer1 constructs connected sums; the sphere-factorization
and torus-minimality theorems are the distinct suppliers owned here. The
factor-type multiset and the minimal torus system have different uniqueness
relations. Neither theorem is replaced by gluing data alone.

**Unlocks.** Geometrization, `[Kir97, Problem 3.45]` (Perelman).

#### GT8.H: constructive hyperbolization for closed Haken manifolds

This is a proved metric-existence supplier, separate from the general
geometrization statement above. Its input is a specified connected closed oriented
smooth 3-manifold `M`, irreducibility, an actual two-sided embedded connected
incompressible surface `S` with `χ(S)<0`, and **homotopical atoroidality**:
there is no injective homomorphism `ℤ² → π₁(M)`. Its output
`hakenHyperbolicMetric` is an actual native
`TauCeti.HyperbolicMetric (I := I) (M := M)`, with its smooth positive-definite
tensor, completeness for that tensor's own Riemannian distance, and the
constant-curvature-tensor equation with parameter `−1`. Export the marked
holonomy, quotient comparison and naturality under orientation-preserving
diffeomorphisms, not just the proposition that some homeomorphic manifold is
hyperbolic. Incompressibility supplies an infinite surface subgroup, so finite
fundamental-group and spherical cases are excluded by proved hypotheses.

Keep homotopical atoroidality distinct from Layer8's embedded-torus predicate.
Own the torus-theorem adapter: for a closed orientable irreducible 3-manifold,
an injected `ℤ²` gives an embedded incompressible torus or a Seifert fibration.
Prove this using the characteristic-submanifold/essential-annulus construction,
the least-intersection singular-torus argument and the Seifert alternative;
these proof targets are part of H1 below. Use the preceding Seifert local/base-
orbifold API to prove that a closed embedded-atoroidal Seifert manifold has
`b₁≤1`, including nonorientable bases. Thus irreducibility, embedded
atoroidality, `b₁≥2` and an incompressible negative-Euler-characteristic surface
are a second, fully proved input interface for this constructor. Do not omit
this exceptional-geometry check by conflating the two meanings of atoroidal.
Also export the general closed irreducible, embedded-atoroidal, non-Seifert
Haken corollary through the same torus theorem; no positive-Betti hypothesis
is needed in that corollary. The `b₁≥2` interface is its family-specific
non-Seifert certificate, not a restriction on the hyperbolization engine.

Build the following proof packages in order. They construct the geometry; none
consumes the general geometrization statement or assumes the desired filling
already carries a hyperbolic metric.

1. **H1 — finite marked hierarchies and the characteristic submanifold.**
   Consume comparison3g's compatible finite triangulations and relative
   PL/smooth transport, the earlier sphere/torus/surface cutting and collar
   maps, and AlgebraicTopology's van Kampen and covering-space interfaces.
   Construct hierarchies of compact irreducible manifolds with boundary
   pattern: properly embedded two-sided incompressible and boundary-
   incompressible cutting surfaces, the two boundary copies and the precise
   inverse gluing. Prove normalization, removal of product regions and
   termination by the finite normal-surface complexity argument, ending in
   balls and the specified product/compression-body pieces. Reuse the normal-
   disc and matching-equation library from the earlier topological targets;
   the new targets are boundary patterns and essential-surface hierarchies,
   not a second triangulation theory. Build the characteristic submanifold
   with its `I`-bundle and Seifert solid/thickened-torus components, essential-
   annulus enclosure, uniqueness and boundary marking. Supply the loop,
   annulus and torus theorems and the marked Haken core/rigidity comparison
   used when a representation first gives only a homotopy marking. A group
   isomorphism alone is not a marked diffeomorphism. Distinguish product and
   twisted `I`-bundles and handle their orientable covers and deck maps.

2. **H2 — three-dimensional Kleinian and deformation carriers.** Use finite
   presentations and representation/character spaces from GT7 and actual
   native `Matrix.SpecialLinearGroup (Fin 2) ℂ`, defining `PSL₂(ℂ)` as
   its quotient by the central subgroup `{I,−I}`.
   Compare its Möbius action on the Riemann sphere and its orientation-
   preserving isometric action on the R4.7 hyperbolic 3-model. Define
   discreteness, faithfulness, torsion-freeness, limit/discontinuity sets,
   convex hull/core, convex cocompactness and geometric finiteness. Construct
   the marked deformation spaces with algebraic and geometric convergence,
   and prove their conjugacy/marking transport. Prove the combination theorems
   for amalgamated products and HNN extensions with their actual invariant
   domains, precise intersection hypotheses and fundamental domains; derive
   discreteness, faithfulness and the marked quotient gluing, not merely a
   presentation of the amalgam. Pared annuli/tori and their rank-one/rank-two
   parabolic groups are tracked when they occur in intermediate hierarchies.
   The final closed output must have no remaining parabolic ends.

3. **H3 — boundary uniformization and initial geometric pieces.** Consume the
   public [TeichmullerGeometry T0/T4a/T5](../TeichmullerGeometry/README.md)
   contracts for closed marked surfaces, uniformization, the normalized
   measurable Beltrami solution, parameter dependence, the Teichmüller metric
   and its completeness. The three-dimensional extensions are owned here:
   simultaneous uniformization of quasi-Fuchsian surface groups by the two
   boundary conformal structures; Ahlfors–Bers parameterization of the
   geometrically finite marked structures on a specified hyperbolizable
   compact core with incompressible boundary; for compressible boundary
   construct the deformation map with its correct covering/marking quotient,
   rather than assert an injective parameterization by boundary Teichmüller
   space; and the finite-type/puncture/pared boundary comparisons
   needed in the hierarchy. Prove the quasiconformal conjugation and
   deformation/marking equations using the Beltrami solution; construct
   Schwarzian/Bers coordinates, their boundedness from the univalence
   estimate and their agreement with the existing marked analytic atlas.
   Do not attribute these 3D or punctured statements to a closed-surface
   supplier that does not state them.

   Start the geometric hierarchy with marked Schottky handlebodies,
   quasi-Fuchsian `I`-bundles and finite truncated/polyhedral blocks as
   appropriate to the boundary pattern. Own the hyperbolic polyhedron
   existence/rigidity theorem under its full combinatorial and dihedral-
   angle inequalities, and construct the face maps and metric. Prove
   local rigidity of the angle map, classify the degenerations by its
   face/prismatic-circuit inequalities, establish properness on the admissible
   angle component, and prove existence by the resulting open-and-closed
   deformation argument. Prove these
   base blocks and the H2 combination/deformation induction give the
   required geometrically finite structures on the intermediate compact
   cores, with the prescribed parabolic locus. Prove compatibility at every
   compression, annular cut and product block. For the final closed-gluing
   cut cores, prove from H1 that each component is compact, irreducible
   and homotopically atoroidal with incompressible closed boundary of
   negative Euler characteristic. Prove the same hierarchy construction
   supplies a **convex-cocompact structure with empty parabolic locus**
   on each such component, with the prescribed boundary/core marking;
   absence of accidental parabolics is part of this existence target.
   This is the starting structure consumed by H4, not an additional
   geometric premise on the original closed manifold. Retain the broader
   pared geometrically finite structures for intermediate hierarchy pieces.
   This is an existence proof by a Haken hierarchy, not an assertion that
   every triangulation admits positive ideal shapes. Reuse GT7's cell
   assembly only after its actual hypotheses have been established.

4. **H4 — compactness and bounded skinning, with the non-product hypotheses.**
   Build geodesic measured laminations, train-track coordinates, intersection
   and length, projective compactification, pleated surfaces and their
   compactness/length estimates on the existing marked surface carriers.
   Prove here the binding-pair double-limit compactness theorem for
   sequences of already existing quasi-Fuchsian surface groups, using
   pleating/length control to bound marked generators, exclude elementary
   limits and extract a discrete faithful limit. The stable-letter
   extension is a separate H6 target. Mapping classes and isotopies remain at the existing surface owner;
   their lamination and 3D-limit adapters here are new targets. Own the
   finite-type curve/marking complexes, subsurface projection estimates and
   hierarchy paths required for relative convergence, including curve-complex
   hyperbolicity, the bounded-geodesic-image and projection-consistency
   estimates. Prove the relative
   compactness theorem for already existing geometrically finite Kleinian
   groups: bounded lengths on the specified pared multicurve, control of
   essential annuli and the nondegenerate `I`-bundle condition give a
   convergent subsequence of the marked restricted representations. Supply
   the algebraic/geometric limit comparison, pleated-surface length bounds,
   model/bilipschitz and ending-invariant uniqueness statements for those
   existing surface groups, and the embedded-partial-core theorem used in
   the limit argument. These are owned proof inputs, not an invocation of
   an unwritten general Kleinian or ending-lamination library, and they do
   not assert realization of the final closed topology in advance.

   For the closed-gluing cut cores, consume H3's actual marked
   convex-cocompact structures with empty parabolic locus. Prove their
   boundary-subgroup covers are closed quasi-Fuchsian surface groups and
   use the Ahlfors–Bers parameterization on all of `Teich(∂N)` to construct
   the skinning map `σ_N : Teich(∂N) → Teich(overline(∂N))` from the second
   simultaneous-uniformization coordinate. Prove it holomorphic with the
   marking/complex-orientation conventions. For a compact irreducible
   homotopically atoroidal core with paired incompressible closed boundary
   of negative Euler characteristic, a given orientation-reversing pairing
   `ι`, that convex-cocompact starting structure and homotopically
   atoroidal closed gluing, prove that, unless the core is an `I`-bundle,
   a finite iterate of `F=ι_*∘σ_N` has relatively compact image.
   Geometric finiteness alone permits accidental rank-one parabolics;
   the broader pared hierarchy is not a replacement for these full-domain
   skinning hypotheses. Include the
   characteristic annuli and the finite-system version when cutting
   disconnects the manifold: boundary pairs may join different components,
   and an individual component need not have an even number of boundaries.
   Prove the finite-product skinning/elevation argument with that incidence
   permutation. `N` is not assumed acylindrical merely because
   the closed gluing has no torus subgroup. Prove the successive-elevation
   lemma for characteristic `I`-pairs: arbitrarily long compatible chains
   either give a closed essential torus or the surface-bundle alternative;
   bound the remaining chain complexity. Combine relative convergence,
   boundary length/projection control and the embedded partial cores to
   show an unbounded skinning coordinate would propagate along such a
   forbidden chain. Handle twisted bundles and required finite covers by
   equivariant descent. This is the bounded-image proof package of
   [Lecuire–Ohshika, Theorem1.1 and §§2–6](https://arxiv.org/html/2209.05023v1);
   the relative compactness, model and projection tools it uses are
   required preceding targets of this package.

5. **H5 — fixed point and marked gluing.** In the bounded Bers domain prove
   the holomorphic fixed-point theorem for a self-map with relatively
   compact image: contraction in the intrinsic complex metric gives an
   interior fixed point and uniqueness. Apply it to the finite iterate
   from H4; commutation with `F` and uniqueness give a fixed point of `F`
   itself. Translate the fixed-point equation into the matching of the
   two marked conformal structures, then use H2's combination/gluing
   theorem to construct the discrete faithful total holonomy and its
   marked hyperbolic quotient. Matching conformal boundaries alone is
   not the gluing of Riemannian boundary tensors. Prove that the resulting
   geometrically finite quotient has empty conformal boundary and classify
   its ends using a truncated convex core and the actual cusp fundamental
   domains. Prove that a rank-one parabolic end would meet conformal
   boundary at a puncture, so this case is excluded by that empty-boundary
   conclusion. Prove that a geometrically finite quotient with empty
   conformal boundary has finite volume and only rank-two cusp ends; each
   remaining cusp group would inject `ℤ²`. Homotopical atoroidality excludes
   those cusps, so the compact truncated core is the entire core and the
   quotient is cocompact. These end and volume comparisons are proof
   targets here, using H2's geometric-finiteness carriers and GT7's cusp
   geometry; geometric finiteness alone does not rule out rank-one cusps. Track
   every topological gluing map, core and boundary marking through this
   construction. Prove the resulting quotient homeomorphic to the given
   closed `M`, upgrading any homotopy marking by H1 with its verified
   hypotheses.

6. **H6 — surface-bundle branch.** Do not apply H4 to an `I`-bundle. Construct
   the surface-bundle monodromy from the hierarchy gluing, treating twisted
   bundles through their marked finite covers. Build the needed
   Nielsen–Thurston/train-track and Penner filling-multicurve statements
   on the existing surface mapping classes, with invariant transverse
   measured laminations and their filling property in the pseudo-Anosov
   case. Periodic monodromy gives the Seifert alternative, and reducible
   monodromy gives a torus subgroup; prove and exclude these under the
   actual hypotheses. For pseudo-Anosov monodromy apply H4’s binding-pair
   double-limit theorem to the iterated end conformal structures, verifying
   convergence to the invariant filling pair. Obtain the limiting discrete faithful
   surface representation, construct the isometry implementing monodromy
   and the properly discontinuous extension by the stable letter, and
   prove its quotient compact with the specified mapping-torus marking.
   The stable-letter action, cocompactness and marking are proof targets;
   invariance of an abstract limit alone does not supply them. Follow
   [Thurston, §§1–5](https://arxiv.org/html/math/9801045), retaining the
   distinction between geometric and homotopical atoroidality and the
   separate periodic/reducible alternatives.

7. **H7 — the smooth metric on the original carrier.** Consume only the
   actual model/germ/quotient constructions in
   [RiemannianGeometry R4.3/R4.4/R4.7](../RiemannianGeometry/README.md),
   and GT7's native model/tensor comparisons. The quotient action is free,
   properly discontinuous and cocompact by H5 or H6. Its atlas descends
   the actual hyperbolic tensor and proves its own intrinsic distance
   complete. Upgrade the marked topological identification with `M` to
   a diffeomorphism by comparison3g, transport the tensor back to `M`
   and prove the tangent inner-product, intrinsic-distance, completeness
   and curvature identities. The result is `hakenHyperbolicMetric M`
   on the supplied smooth atlas, with its specified homotopy marking;
   it is not a metric on a newly chosen homeomorphism type. No foliation,
   norm-minimizing surface or Euler-class nonrealizability is a premise
   of this engine. GT10 proves its family satisfies the topological
   hypotheses before consuming this output.

### Layer 9: Heegaard splittings and Heegaard genus

Every closed 3-manifold splits into two handlebodies glued along a surface; the minimal
genus of such a surface is the Heegaard genus, a basic 3-manifold invariant. Waldhausen
asked whether it equals the rank of the fundamental group; the answer is no, and stating
the disproof needs the genus and the rank side by side.

**From Mathlib / earlier layers.** Layer 1's handlebodies (a handlebody is a boundary-sum
of solid tori, built from layer 1's gluing) and boundary-gluing; `FundamentalGroup`
(`Mathlib/AlgebraicTopology/FundamentalGroupoid/`) and `Group.rank` for the rank side; the
surface (closed orientable 2-manifold) classification for the splitting surface.
[SurfaceTopology Layer9](../SurfaceTopology/README.md#layer-9-curves-cutting-and-mapping-class-groups)
owns the full, relative and orientation-preserving mapping-class quotients and
the PL/smooth-to-topological forgetful isomorphisms for compatible structures;
its PlanarTopology Layer8 dependency supplies smooth representatives and the
smooth-isotopy comparison. Layer3 supplies Diff topology and isotopy extension,
not a second surface mapping-class definition.

**What to build.**
- **Handlebodies** of each genus and the **Heegaard splitting** of a closed 3-manifold as
  a decomposition `M = H₁ ∪_φ H₂` along a genus-g surface with an actual
  boundary diffeomorphism φ. For oriented M, φ reverses the boundary
  orientations induced by outward normals. Own the comparison of this gluing
  with the smooth collar gluing of Layer1 and prove invariance under smooth
  isotopy of φ, using extension across a collar. For a mapping-class
  description choose boundary identifications with the standard genus-g
  surface and a fixed orientation-reversing identification, then use the
  orientation-preserving group of SurfaceTopology Layer9. Prove that changing
  a representative by isotopy yields diffeomorphic glued manifolds, and that
  pre/postcomposition by boundary maps extending over the handlebodies gives
  the same splitting up to the specified handlebody equivalence. The bare
  quotient class is not gluing data before this comparison. Retain genus0
  and the full versus orientation-preserving conventions. Scharlemann,
  *Heegaard splittings of compact 3-manifolds*, is the survey.
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
inequality and construct the marked Euler-class-one counterexamples, their
complete hyperbolic metrics and even integral classes. Preserve the general
seminorm/polar theory and its closed-hyperbolic specialization as distinct
interfaces, with the construction and proof suppliers ordered below.

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
  Own the Novikov–Rosenberg and leaf-injectivity package used before metric
  existence: a taut foliation on a closed oriented 3-manifold has no Reeb
  component, its leaves are π₁-injective, and, apart from the explicitly
  classified sphere-leaf `S²×S¹` case, the manifold is irreducible. Construct
  foliated-disc general position, vanishing-cycle/Reeb-component arguments
  and Reeb stability with their C^(∞,0) comparison, not a smooth-only
  hypothesis silently applied to continuous holonomy. Supply suspension
  foliations, prescribed interval holonomy, gluing and tautness criteria
  needed to construct the marked family before computing its norm.
- Construct the integral Euler class of an oriented plane bundle independently
  of foliations, with clutching/obstruction definition, normalization, pullback
  and evaluation. Compare it with CharacteristicClasses C2's general Euler
  class. On closed oriented 3-manifolds prove the
  foliation class lies in 2H²(M;ℤ).
- For a compact oriented 3-manifold, define `χ₋` of a compact oriented
  surface as the sum of `max(0,−χ)` over components. Construct the integral
  Thurston seminorm by the minimum over embedded oriented representatives:
  use closed surfaces in the interior for absolute `H₂(M;ℤ)`, and properly
  embedded surfaces with boundary in `∂M` for relative `H₂(M,∂M;ℤ)`.
  Prove representatives exist by integral duality and regular values of maps
  to the circle, prove the minimum exists in `ℕ`, and prove homogeneity,
  triangle inequality and torsion/change-of-coefficients compatibility by
  oriented cut-and-paste. Extend through rational classes and continuously
  to a bundled `Seminorm ℝ V` on the corresponding real homology `V`.
  Use comparison3g's finite triangulation and AlgebraicTopology Stage6's
  cellular/singular, universal-coefficient and finite-dimensionality
  comparisons. Prove the rational polyhedral description from compatible
  oriented normal/branched-surface cones and their Euler-characteristic
  linear functions, including sphere/disc removal and reducible/product
  pieces. The general unit ball may be an unbounded cylinder; prove
  polyhedrality on the quotient below rather than call that cylinder a
  bounded norm ball.

  **The polar and its finite domain.** Let `x` denote this real seminorm,
  `K={a : V | x(a)=0}` its native linear submodule and `q : V →ₗ[ℝ] V ⧸ K`
  the quotient. The cohomology carrier `W` is real `H²(M;ℝ)` in the absolute
  case and real `H²(M,∂M;ℝ)` in the relative case; use the corresponding
  evaluation pairing `B : W →ₗ[ℝ] Module.Dual ℝ V`. Prove `B` a linear
  equivalence by the real universal-coefficient theorem; do not pair a
  relative homology class with an unqualified absolute cohomology class.
  On **all** of `W` define the extended polar
  `thurstonPolar c : ℝ≥0∞ := ⨆ a : {a : V // x a ≤ 1},
  ENNReal.ofReal (|B c a|)`.
  Prove it takes the genuine value `⊤` exactly when `c` does not annihilate
  `K`, by scaling a zero-seminorm vector with nonzero pairing. In particular
  prove the coordinate-torus example on `T³`; an unbounded real supremum
  or `.toReal ⊤` is not a finite dual norm.

  Construct the induced genuine norm `‖q a‖_x=x(a)` on `V ⧸ K`, prove its
  well-definedness and positive definiteness, and install its compatible
  finite-dimensional normed-space structure. Prove `K` closed, the quotient
  topology agrees with this norm topology, and its unit ball is compact
  (with the zero-dimensional quotient handled explicitly). Define the
  annihilator `Ann(K)={c : W | ∀ a∈K, B c a=0}` as a submodule. Construct
  the natural linear equivalence from `Ann(K)` to the continuous dual of
  this normed quotient by descent/lift along `q`. Finite-dimensional
  continuity, not an assumed bound for an arbitrary functional on a
  seminormed space, licenses the continuous-linear-map structure. Give
  `Ann(K)` its transported operator norm `dualThurstonNorm`, prove
  `thurstonPolar c=ENNReal.ofReal (dualThurstonNorm c)` there, and prove
  the supremum/attainment and pairing inequalities, homogeneity,
  triangle inequality, separation, naturality under marked diffeomorphisms
  and coefficient-change comparisons. Export both the extended polar and
  the finite dual and their comparison; do not replace the general theory
  by the hyperbolic case.

  For a closed oriented hyperbolic 3-manifold prove `K=0`: compress
  zero-cost integral representatives, use irreducibility and atoroidality
  to kill sphere/torus classes, and use the rational polyhedral description
  to pass from the integral/rational kernel to the real kernel. The
  hyperbolic irreducibility and torus statements consume GT7's space-form/
  lattice proofs, not an extra geometrization theorem. Identify `Ann(K)`
  with all `H²(M;ℝ)`, obtain the finite dual norm on every cohomology class,
  and prove its `ENNReal.ofReal` comparison with `thurstonPolar`. This is
  the finite norm denoted `x*` in the following closed-hyperbolic targets.

  For the uniqueness assertions below, a **reduced incompressible minimizer**
  of a positive-norm integral class on a closed hyperbolic manifold means
  an embedded oriented χ₋-minimizer whose components are π₁-injective and
  have negative Euler characteristic, with no nonempty union of components
  representing zero integral homology. Prove the reduction comparison by
  compression and deletion of zero-cost/null-homologous components,
  preserving the homology class and the minimal cost. Thus uniqueness in
  this convention does not assert isotopy to arbitrary representatives
  enlarged by null-homologous spheres or tori. Prove fully marked unions
  of compact leaves reduce in this convention before applying uniqueness.
- Prove Thurston's inequality for a taut transversely oriented C^(∞,0) foliation on a
  closed oriented hyperbolic 3-manifold: |⟨e(F),[S]⟩|≤χ₋(S) for embedded
  oriented surfaces, hence x*(e(F)_ℝ)≤1. Use incompressible representatives,
  the saddle-tangency general-position theorem and Poincaré–Hopf index
  comparison, using Gabai–Yazdi §2.7 and its explicit extension
  from transversely C² to C^(∞,0); build those foliation/surface comparison
  lemmas here. Sphere
  components contribute zero; do not bound their evaluation by −χ(S).
- **The marked Euler-class-one counterexamples.** Construct the Yazdi
  family, including genus3 and every genus `g≥6`, on specified smooth
  closed oriented manifolds `M_g`; retain the actual monodromy, surgery
  curve, meridian/longitude, filling map, embedded marked surfaces `S,F`
  and cohomology evaluations. Use
  [Yazdi v4 §4 and Lemmas5.1–5.5](https://arxiv.org/html/1603.03822v4)
  and Gabai–Yazdi's fully marked surface theorem. A picture is not an
  attaching map: construct the finite curve/arc incidence data, orientations
  and Dehn-twist maps, prove the Penner filling/pseudo-Anosov and homology
  conditions, realize the mapping torus and the specified Dehn filling
  through Layer5, and prove the prescribed copy of `S` survives disjoint
  from the surgery region. GT8.H6 supplies the pseudo-Anosov mapping-torus
  hyperbolic metric when used in the construction; it does not license an
  arbitrary Dehn filling to remain hyperbolic.

  Establish the prerequisites in the following order on this **same**
  `M_g`. Compute the integral `H₂` lattice and prove that the marked
  classes `S,F` form a basis: construct the two integral intersection
  loops dual to them and combine their intersection matrix with the
  Mayer–Vietoris rank bound. Deduce their real-basis comparison and `b₁=2`. Construct the two taut foliations in the proof of Yazdi
  Lemma5.1 by gluing the specified product/shift-holonomy parts and sutured
  solid-torus saddle stacks; prove tautness and the fact that `S` is a leaf
  without first invoking a hyperbolic metric or a Thurston-norm computation.
  Use the Novikov–Rosenberg/leaf-injectivity package above to prove
  irreducibility and incompressibility of `S`; `b₁=2` excludes `S²×S¹`.
  Prove embedded atoroidality by the actual two-stage argument of
  Lemma5.2: a least-intersection incompressible torus is isotoped out of
  the attached solid torus by the essential-annulus/rectangle analysis;
  in the remaining drilled mapping-torus region the pseudo-Anosov and
  marked-annulus argument makes it boundary parallel and excludes a torus
  in the filled manifold. Supply the essential/boundary-parallel and
  isotopy comparisons rather than infer them from a surgery coefficient.
  The surface has genus `g≥3`, hence negative Euler characteristic and
  infinite π₁. GT8.H1's torus/Seifert comparison and `b₁=2` give no injected
  `ℤ²`; verify every hypothesis of `hakenHyperbolicMetric` and construct
  its actual native complete curvature−1 tensor on `M_g`. Keep its marked
  smooth quotient comparison. The topology of a filling and the general
  geometrization statement are not metric-existence suppliers.

  Now apply Thurston's inequality to the already constructed foliations
  and compute, in coordinates `a[S]+b[F]`,
  `x(a[S]+b[F])=(2g−2)|a|+2|b|` for real `a,b`. Prove the upper bounds by
  the surfaces and cut-and-paste and the lower bounds from the two Euler
  pairings and orientation changes. Through the polar/finite-dual
  comparison prove
  `x*(c)=max(|⟨c,[S]⟩|/(2g−2), |⟨c,[F]⟩|/2)`.
  Construct an integral `b` with evaluations `1−g,0`, using integral UCT
  with its torsion/lift ambiguity, and set `e=2b`. Prove
  `⟨e,[S]⟩=2−2g`, `⟨e,[F]⟩=0` and `x*(e_ℝ)=1`; the class is explicitly
  even, rather than assuming a real even lift is even in integral
  cohomology. Prove `S` the unique norm-minimizing representative of its
  class up to oriented ambient isotopy among reduced incompressible
  minimizers in the precise convention and comparison above. Arbitrary added
  zero-cost spheres do not enter a uniqueness assertion. Use the
  disjoint-chain theorem for homologous norm-minimizing surfaces and the
  marked product/solid-torus annulus analysis of Lemmas5.3–5.4.

  Own the full sutured/corner, relative Euler-class trivialization/index,
  incompressible-surface, holonomy, based-transversal-semigroup and
  generalized-saddle-stack APIs used here. On cut/sutured pieces tautness
  allows properly embedded transverse arcs from the negative to positive
  tangential boundary, as well as closed transversals; prove the cut/gluing
  comparison with closed-manifold tautness rather than apply its closed-loop
  definition literally to every boundary leaf. Prove the needed fully marked
  surface theorem: on the constructed closed hyperbolic carrier, an
  algebraically fully marked surface unique among the reduced minimizing
  representatives specified above can
  be made a leaf of a taut C^(∞,0) foliation with homotopic oriented tangent
  plane field. Build its transverse cut/reglue and bad-solid-torus removal
  arguments and prove tautness/plane-field homotopy, not just equality of
  selected Euler evaluations. Under a hypothetical taut foliation with
  Euler class `e`, apply this theorem, cut along the now-leaf `S`, and
  use the marked product region and canonical boundary trivialization to
  show that the induced taut foliation on the specified `(3,1)` sutured
  solid torus has relative Euler evaluation0. Prove the classification/
  reduction to generalized saddle stacks forces that evaluation to be
  `+2` or `−2`. This contradiction is on the same marked `M_g,S,F,e` and
  proves nonrealizability for every taut C^(∞,0) foliation, not only for
  the two foliations used to compute its norm. Export the constructed
  examples and their geometric/marking/norm APIs as well as the
  existential theorem; distinguish the infinite family using the proved
  genus/norm data under the stated marking or additional unmarked
  invariants before claiming pairwise unmarked nonhomeomorphism.

```lean
-- thurstonPolar : H²(M;ℝ) → ℝ≥0∞ is defined for every compact M as above.
-- dualThurstonNorm is finite on Ann(ker x); on a closed hyperbolic M, ker x=0.
-- M below has the specified closed oriented smooth carrier and chosen native hyperbolic metric.
-- eulerClass is in integral singular cohomology; its real image is used by the finite norm.
-- Foliation here carries leafwise-smooth, transversely-continuous C^(∞,0) charts.
-- theorem thurston_euler_bound (F : Foliation M) (hF : Taut F) :
--   dualThurstonNorm (realImage (eulerClass F.tangentPlane)) ≤ 1
-- theorem euler_class_one_counterexample : ∃ (M : ClosedOrientedHyperbolic3)
--   (e : SingularCohomology 2 M ℤ), (∃ b, e = 2 • b) ∧
--   dualThurstonNorm (realImage e) = 1 ∧
--   ∀ (F : Foliation M), Taut F → eulerClass F.tangentPlane ≠ e
```

**References.** [Yazdi, On Thurston's Euler class one
conjecture, v4 §§1.3,4–7](https://arxiv.org/html/1603.03822v4), including the parity condition;
[Gabai–Yazdi, The fully marked surface theorem, Theorem1.1 and Corollary1.2](https://arxiv.org/html/2008.07223v1).
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
  characteristic maps. Own the transport of native CW/relative CW
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
  For interoperability with Mathlib's abstract-face and realization APIs
  ([carrier development](https://github.com/leanprover-community/mathlib4/pull/28125),
  [realization development](https://github.com/leanprover-community/mathlib4/pull/28530)),
  own the comparison with lower families in native `LowerSet (Finset ι)`.
  From an all-singleton/nonempty-face complex adjoin the empty face; from a
  lower family F restrict vertices to `{v // {v} ∈ F}` and retain only
  nonempty projected faces. Track empty-face membership separately: the void
  lower family and the family containing only the empty face have the same
  empty unaugmented realization but distinct augmented combinatorics. Prove
  the inverse/reindexing laws on nonempty faces, compatibility with simplicial
  maps and subdivisions, and canonical homeomorphisms of realizations.
  Compare face-diagram colimits and barycentric-coordinate maps with the
  ordered-simplicial realization already specified here, retaining its single
  transported CW structure. Do not identify augmented carriers after forgetting
  the empty-face datum. Follow Mathlib's carrier and realization interfaces;
  these comparison constructions are owned here, with the detailed
  [interface conventions](references/simplicial-carrier-interfaces.md).
- **Links on their actual vertices.** For a face σ of K, use the vertex
  subtype `{v : ι // v ∉ σ ∧ insert v σ ∈ K.faces}`. Its link consists of
  NONEMPTY finite subsets τ whose projected union with σ is a face. Native
  complexes have no empty face; an empty link-vertex type has an empty face
  set and empty realization. Prove nonempty downward closure and
  the native singleton condition on this subtype. Export face, star/join,
  inclusion, restriction and subdivision comparisons, together with the
  realized local conical-neighborhood law. A maximal face has an empty
  link-vertex type and empty realized link; an excluded original vertex is
  never restored by a singleton axiom.
  The native carrier, maximal-face and dimension0 link lemmas have suggested
  forms in [`SimplicialLinks.lean`](SimplicialLinks.lean).
- **Combinatorial manifolds via the link condition.** Define combinatorial
  n-spheres and n-balls by PL equivalence, after finite subdivisions, to
  the boundary of the standard (n+1)-simplex and the standard n-simplex.
  Their dimension0 models are two isolated vertices and one vertex.
  Set `IsCombinatorialManifold K 0` to mean every face has cardinality≤1:
  its realization is discrete, every vertex link is empty, and its boundary
  is empty. Include the empty complex. For dimension k+1 require every
  vertex link on its actual vertex subtype to be a combinatorial k-sphere
  or k-ball. The sphere case is interior and the ball case is boundary;
  export the boundary subcomplex and its local models, with interval/circle
  and isolated-point checks. Require local finiteness and a countable vertex
  carrier when comparing with Layer1's Hausdorff second-countable PL atlas
  convention. Prove realization, local-finiteness and countability transport
  and the needed discrete0-manifold cases before the chart comparison.
  The definition uses pattern matching on dimension, never truncated `n-1`
  at zero.
- **The reconciliation with layer 1.** Prove that the polyhedron of a combinatorial
  n-manifold with the local-finiteness/countability hypotheses just specified
  is a PL n-manifold in the sense of Layer1's `PLGroupoid`, and conversely
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
- **Simplicial collapse and the finite Zeeman conjecture.** An elementary
  collapse removes a free codimension-one face together with its unique
  maximal coface; collapsibility means a finite sequence ending at one
  vertex. Use a precomplex or change the vertex carrier when the removed
  free face is a vertex; native `AbstractSimplicialComplex` cannot delete
  that vertex while retaining every singleton of the old carrier. Prove
  realization deformation-retraction and finite-sequence composition laws.
  For each finite nonempty contractible simplicial complex K of dimension
  at most2, fix a finite vertex order and the resulting prism triangulation
  of |K|×[0,1], with its explicit product realization. Zeeman's conjecture
  asks for a finite simplicial subdivision of that prism triangulation
  which is collapsible. State subdivision maps, their PL realization and
  the comparison under change of order/initial product triangulation; this
  is the polyhedral conjecture, not collapsibility of every fixed product
  triangulation. Low-dimensional cases and changes of triangulation belong
  to the API; the general assertion remains a conjecture. See Adiprasito–
  Benedetti, [*Subdivisions, shellability, and collapsibility of products*](https://arxiv.org/abs/1202.6606),
  for the distinction between simplicial and PL collapsibility.

```lean
-- def realize (K : AbstractSimplicialComplex ι) : TopCat := …      -- the polyhedron |K|
-- def linkVertex (K) (σ : K.faces) := {v : ι // v ∉ σ ∧ insert v σ ∈ K.faces}
-- def link (K) (σ : K.faces) : AbstractSimplicialComplex (linkVertex K σ) := …
-- def IsCombinatorialManifold (K) : ℕ → Prop
--   | 0 => ∀ σ ∈ K.faces, σ.card ≤ 1
--   | k+1 => ∀ v, IsCombinatorialSphereOrBall (link K {v}) k
-- theorem realize_combinatorialManifold_isPL (K) [Countable K.vertices]
--     (hlf : LocallyFiniteComplex K) (h : IsCombinatorialManifold K n) :
--     HasGroupoid (realize K) PLGroupoid
-- def IsTriangulable (M : TopCat) : Prop := ∃ K, Nonempty (realize K ≃ₜ M)
-- theorem manolescu_not_triangulable : ∃ M : ClosedTopological5Manifold, ¬ IsTriangulable M
-- def Collapsible (K) : Prop := …
-- def ZeemanConjecture : Prop := ∀ (K : FiniteSimplicialComplex),
--   Nonempty K.vertices → DimensionLE K 2 → ContractibleSpace |K| →
--   ∃ S : FiniteSubdivision (prismTriangulation K), Collapsible S.complex
-- This defines the conjecture [Kir97, 5.2]; it does not assert a proof.
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
   finite chart cover; for noncompact M consume the shared target below.

   ##### Covering dimension core

   **CoveringDimensionCore (early shared prerequisite).** Own the common
   Lebesgue covering-dimension interface independently of the manifold,
   embedding and K-theory applications. For every topological space X and
   d∈ℕ use the `HasCoveringDimensionLE X d`, `HasCoveringDimensionLT`,
   `FiniteCoveringDimension`, `coveringDimension : WithBot ℕ∞` and
   `Set.HasOrderLE` design cited below. Every indexed open cover has an
   open refining cover whose range, as a set of distinct subsets of X,
   has order at most d+1. Retain actual refinement/parent witnesses,
   universe reindexing by range and the empty-space conventions; ⊥ is
   dimension −1 and ⊤ means that no finite bound exists. Build its basic
   usable API here: order monotonicity and passage to subfamilies,
   invariance under homeomorphism, monotonicity of dimension bounds,
   closed-subspace monotonicity, and the theorem that a finite closed
   cover of a compact Hausdorff X by spaces of dimension at most d gives
   `HasCoveringDimensionLE X d`. This is the sole generic predicate/value
   and basic closed-cover development; the locally finite closed-cover
   construction below extends it in its stated paracompact Hausdorff scope.

   [AlgebraicKTheory A4](../AlgebraicKTheory/README.md#a4-stable-range-and-finite-matrix-sizes)
   owns the compact-Hausdorff finite/indexed-cover characterization of
   this common predicate, with finite subcovers, explicit deduplication,
   reindexing and parent-map preservation; its partition-of-unity and
   sphere-extension characterizations, nonextendability obstruction and
   real/complex function-ring stable-rank calculations remain there.
   A range-order bound is not an indexed bound before this conversion:
   two copies of the one-point space have range order one and indexed
   multiplicity two. Neither the generic core nor the constructions
   immediately below use A4 or any K-theory output. In particular the
   embedding proof uses its own direct partition-star construction below,
   not A4's compact-space characterization.

   ##### Finite colour chart refinement

   **FiniteColourChartRefinement.** For every Hausdorff, second-countable
   finite-dimensional TOP d-manifold M and every indexed open cover 𝒰,
   construct a countable indexed locally finite **open** cover (V_j),
   parent assignments to 𝒰 and to coordinate domains, and colours
   c(j)∈{1,…,d+1}. Each closure(V_j) is compact and lies in both assigned
   opens. Require indexed disjointness:
   `j≠k ∧ c(j)=c(k) ⇒ V_j∩V_k=∅`.
   Include the empty space, d=0 and boundary charts. In native charted-space
   vocabulary also export the following version without a smoothness
   hypothesis, for topological spaces H and M:
   `I : ModelWithCorners ℝ E H`, E a real normed space with
   `FiniteDimensional ℝ E` and `finrank ℝ E=d`, `[ChartedSpace H M]`,
   `[T2Space M]`, `[SecondCountableTopology M]`. Native
   `I.isClosedEmbedding` and `I.isClosed_range` identify H with a closed
   subspace of E; `I.locallyCompactSpace` and
   `ChartedSpace.locallyCompactSpace` supply local compactness. Compact
   chart pieces transfer their dimension bound from E, identified with
   ℝ^d by native `ContinuousLinearEquiv.ofFinrankEq` followed by
   `EuclideanSpace.equiv.symm`; use the chart homeomorphism and
   `Homeomorph.hasCoveringDimensionLE_of` in the
   covering-dimension design below. The independent TOP formulation uses
   Euclidean or half-space chart homeomorphisms and needs no smooth atlas.
   Smooth and complex manifolds consume this theorem after forgetting their
   additional structure and, for complex manifolds, restricting scalars to ℝ.
   Use native `TopologicalSpace.IsOpenCover`, `Opens`, `LocallyFinite` and
   continuous partition-of-unity carriers. Shape the covering-dimension API
   by the immutable design snapshots [#43476, commit6ad9e2a](https://github.com/leanprover-community/mathlib4/tree/6ad9e2a0848368aaed7d67a8523c00c79da240ed/Mathlib/Topology/CoveringDimension)
   and [#43475, commit9658af8](https://github.com/leanprover-community/mathlib4/tree/9658af89240cb04e5e1807d5fd1402a79bee2906/Mathlib/Topology/CoveringDimension):
   `HasCoveringDimensionLE` and `Set.HasOrderLE` bound the number of distinct
   range members through a point. These design sources are not installed
   Mathlib proofs. Build the required theory in Tau Ceti, adopting Mathlib's
   interfaces and implementations when available. Own these construction
   targets before the embedding theorem:

   - **EuclideanCompactCoverDimension.** For every compact C⊂ℝ^d and every
     finite relatively open cover of C, construct a finite relatively open
     refinement of point multiplicity at most d+1, by Euclidean cubical
     refinements and a Lebesgue number. Derive the arbitrary-open-cover
     version by compactness; include empty and zero-dimensional cases.
   - **RelativeIndexedClosedRefinement.** Given a closed S⊂X with
     `HasCoveringDimensionLE S d` and any indexed open cover (U_b) of X,
     produce an indexed open cover (V_b) on the SAME index type B with
     `V_b⊂U_b`, `V_b\S=U_b\S`, and
     `encard {b : x∈V_b}≤d+1` for x∈S. Reindex a bounded-order refinement
     of the traces U_b∩S by its distinct sets A_i; choose a parent b_i
     satisfying A_i⊂U_(b_i)∩S and an ambient open O_i with A_i=S∩O_i.
     Set
     `V_b=(U_b\S) ∪ ⋃_(i : b_i=b)(O_i∩U_b)`.
     Prove openness, containment, exact equality outside S and
     coverage. At x∈S choose, for each incident b, an incident A_i with
     b_i=b; distinct b give distinct i, so the distinct-trace bound gives
     the INDEXED bound. This relative construction needs no normality and
     does not use the reindexed `existsOpenRefinementWithOrderOnClosedSet`
     or `unionClosed` helpers in the design snapshot.
   - **LocallyFiniteClosedCoverDimension.** If X is paracompact Hausdorff,
     (C_i)_(i∈I) is any locally finite indexed closed cover and every C_i
     satisfies `HasCoveringDimensionLE C_i d`, prove
     `HasCoveringDimensionLE X d`. Well-order I, retaining one fixed
     original cover index B throughout the transfinite construction.
     At successor i apply RelativeIndexedClosedRefinement to C_i:
     shrink each U_b monotonically and change it only on C_i. At a limit
     take the intersection of its earlier b-th opens. For each point choose
     an open neighborhood meeting only finitely many C_i. Before any limit
     if there are relevant earlier modifications, their finite index set
     has a last stage; otherwise every indexed open retains its stage-0
     value there. Thus every indexed open stabilizes on this neighborhood.
     Prove the limit opens
     and cover property from this local stabilization. Previously obtained
     indexed multiplicity bounds persist under shrinking; a bound on the
     number of distinct range sets alone would not have this monotonicity.
     Finish at the full well-order and pass from indexed to range order.
     Apply this to a countable locally finite closed precompact coordinate
     cover of M. Local compactness, Hausdorffness and second countability
     supply paracompactness and that closed cover. The generic theorem
     retains arbitrary I and arbitrary input open covers, not merely finite
     or countable input covers.
   - **Direct partition stars and inner cover.** First refine 𝒰 by
     precompact coordinate opens whose closures lie in BOTH the assigned
     input member and coordinate domain. Take a bounded-order refinement
     and reindex it by its range R of distinct open sets. Use native
     `PartitionOfUnity.exists_isSubordinate` on all M: the paracompact
     Hausdorff manifold is normal. Obtain continuous (ρ_i)_(i∈R), sum1, with locally
     finite closed supports subordinate to those distinct sets. R need not
     be countable. For every nonempty finite σ⊂R define
     `S_σ={x : min_(i∈σ)ρ_i(x) > sup({ρ_j(x) : j∉σ}∪{0})}`.
     On a neighborhood meeting only finitely many supports F, this is empty
     unless σ⊂F and otherwise is a finite strict min/max inequality. Prove
     openness and local finiteness. At each point its nonempty finite set
     of maximum-weight indices gives coverage. If σ≠τ and |σ|=|τ|, choose
     i∈σ\τ and j∈τ\σ; the opposite strict inequalities prove disjointness.
     If S_σ is nonempty then 1≤|σ|≤d+1, and for i∈σ prove
     closure(S_σ)⊂tsupport(ρ_i), hence compact containment in its assigned
     input member AND coordinate domain. Discard all empty S_σ, retaining
     the distinct σ as indices. Colour by |σ|; prove this indexed family
     countable using second countability and local finiteness of its
     nonempty opens. Export it as (V_j), and export on the SAME surviving
     indices an inner OPEN cover (O_j) with closure(O_j) compact and
     closure(O_j)⊂V_j, union_j O_j=M. Obtain it by normal locally finite
     shrinking (closed seeds covering M, then open neighborhoods with
     closure inside V_j). This generic inner cover belongs here. HF owns
     its smooth plateau realization and its subsequent finite analytic
     kernel shrinkings. No manifold triangulation or infinite-complex
     realization is used.

   In each color use the weighted
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
   using native group rings and [AlgebraicKTheory A0–A3](../AlgebraicKTheory/README.md)'s
   single arbitrary-ring stable-matrix K₁ and projective-module K₀, including
   its elementary relations, idempotent comparison and Morita maps. Construct
   the based finite-free cellular chain torsion, basis-change/simple-collapse
   invariance, composition and duality. Own the rank summand and reduced K₀
   used here. Consume [AlgebraicKTheory A6](../AlgebraicKTheory/README.md#a6-milnor-patching-and-the-boundary)'s normalized Milnor patching maps
   when constructing the following localization/patching comparisons. On the common
   ring K-spectrum specified below, prove the Bass–Heller–Swan decomposition in
   degrees0/1, with augmentation, t-multiplication,
   localization/patching maps and their exactness. Prove the Nil summands
   vanish for the iterated Laurent rings over ℤ by regular-Noetherian
   finite resolutions, proving preservation of those hypotheses at each
   extension. Compute K₀(ℤ[ℤⁿ])=ℤ and
   K₁(ℤ[ℤⁿ])=ℤ/2⊕ℤⁿ with generators−1 and the n Laurent units;
   export `whitehead_freeAbelian_eq_zero` and
   `reducedKZero_freeAbelian_eq_zero`, including n=0.
   Consume the single common ring K-spectrum and its model comparisons from
   [GeometryOfNumbersAndQuadraticArithmetic §6.1.7 `ringKTheoryModels`
   and §6.10 `plusConstructionComparison`](../GeometryOfNumbersAndQuadraticArithmetic/README.md),
   the right-projective/common-spectrum adapters to
   [GeneralAlgebraicKTheory §§3.1–3.5,3.12,10.10–10.11,12.10](../GeneralAlgebraicKTheory/README.md).
   GeneralAlgebraicKTheory owns the exact-category Q/S, ring plus/Q and
   Bass/Schlichting constructions; its generic homotopy/plus foundations
   are supplied by [StableHomotopyKTheory Layers1–4 and6](../StableHomotopyKTheory/README.md). GeometryOfNumbersAndQuadraticArithmetic
   transports them to the following shared convention.
   The carrier is the supplier's nonconnective spectrum of the actual split exact
   right-projective category
   `(TauCeti.finiteProjectiveModules Rᵐᵒᵖ).FullSubcategory`, for every associative
   unital ring R, including the zero ring. Use its Q/S and Γ-space connective
   comparison, all K₀ components, the natural zero-component stable-GL plus
   comparison and its Bass-loop/cofiber-to-Schlichting nonconnective equivalence.
   The ordinary models and their equivalences are supplied by GeneralAlgebraicKTheory; the right-projective/common-spectrum comparisons are constructed by GeometryOfNumbersAndQuadraticArithmetic.
   Its low-degree maps identify categorical/projective K₀, matrix K₁ and
   Steinberg K₂ through [AlgebraicKTheory A0–A2/A5](../AlgebraicKTheory/README.md#a5-steinberg-groups-and-k₂) before the higher comparisons.
   Retain its ring maps, stabilization, right/left opposite-ring adapter with
   inverse transpose, and the positive-size Morita module dictionary: for n≥1,
   the right regular M_n(R)-module corresponds to R^n, while the right module
   e₁₁M_n(R) corresponds to R. Retain those identifications, without assuming
   that the two images are inequivalent for every ring or every size.
   Extension of scalars on finite projectives uses the supplied balanced tensor
   functor without an added flatness premise. Use the normalized Laurent boundary
   `∂[t]=[R]` and its low-degree surjective-leg Milnor-square comparison
   `δ([u])=[M(u)]−[Dⁿ]`, with `M(u)={(a,b) | uπ₁(a)=π₂(b)}`.
   The ordinary supplier uses `π₁(a)=απ₂(b)`; with the same ordered
   charts transport at `α=u⁻¹`, so `δ([u])=∂([u⁻¹])=−∂([u])`.
   The common-model comparison does not assert higher excision for every Milnor
   square or Nil vanishing for singular rings. Transport these actual comparison
   maps to the following GT-owned Laurent, torsion and group-ring applications.
   The generic construction consumes the low-degree inputs, not GT's later
   Whitehead/assembly or surgery outputs; GeometryOfNumbersAndQuadraticArithmetic’s §6.10 plus comparison is
   [its `plusConstructionComparison` clause](../GeometryOfNumbersAndQuadraticArithmetic/README.md).
   These are written construction interfaces, not already implemented native
   higher-K declarations. Define the Whitehead coefficient spectrum as
   the cofiber of the actual assembly
   `Σ∞(Bπ)₊ ∧ K(ℤ) → K(ℤ[π])` in that common spectrum category.
   Own this assembly map: combine coefficient extension with the coherent π
   action by left multiplication on the right regular ℤ[π]-module, and prove
   functoriality and agreement with the unit classes ±g in matrix K₁.
   Compute the source in degrees0/1 using K₀(ℤ)=ℤ and K₁(ℤ)=ℤ/2 and
   the first group homology, then use the cofiber sequence and the group-ring
   augmentation splitting on K₀. Identify the cofiber's π₁,π₀ and negative
   groups with Wh(π), reduced K₀ and negative ring K-groups, respectively.
   These coefficient/cofiber and assembly identifications remain GT targets.
   Prove negative K_i vanish
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
   Consume HomotopySpheres §4B's stable-O groups and §9.1–2's
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
   [HomotopySpheres](../HomotopySpheres/README.md)
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
- **Realization round-trips.** For `n ≥ 1`, the geometric realization of the boundary of
  the standard `n`-simplex is homeomorphic to `S^{n-1}` (layer 11), reusing the
  simplicial-set realization where possible. At `n = 0` the boundary has no nonempty
  faces and its unaugmented realization is empty.
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
  LNM 53 (1968): `Γ₄ = 0` and `π₀(Diff⁺ S³) = 0` for orientation-preserving
  diffeomorphisms (Théorème 1),
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
handlebody and tangent-field API exists. The combinatorial Heegaard Floer roadmap supplies
the grid `τ` and its filtered interfaces, consuming layer 4's knot types in return. Layer6
owns the additional `τ` connected-sum/descent adapter and the entire Khovanov–Lee/Rasmussen
`s` supplier; their constructions have the explicit order and smooth-category scope above.

## Acknowledgements

This roadmap grew out of walking the Kirby problem list while building the topology
problems in [`leanprover/lean-eval`](https://github.com/leanprover/lean-eval), and out of
the design discussions behind the
[combinatorial Heegaard Floer roadmap](../CombinatorialHeegaardFloer/README.md), whose
knot-theory and concordance lanes it consumes. Thanks to everyone who contributed to those
discussions on the [Lean Zulip](https://leanprover.zulipchat.com/).
