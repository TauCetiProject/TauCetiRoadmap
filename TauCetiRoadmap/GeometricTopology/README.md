# Roadmap: geometric topology and the solved Kirby-list problems

A useful exercise while building the topology problems in
[`leanprover/lean-eval`](https://github.com/leanprover/lean-eval) has been to walk Rob
Kirby's problem list (`[Kir97]`, *Problems in Low-Dimensional Topology*) and its recent
successor lists, pick out problems that have since been **solved** (sometimes by proving
the negation of Kirby's question), and ask a narrower question than "can we prove this":
can we even *state* the resolved theorem in Lean today?

For a good fraction of them the answer is no. Not because the proof is hard, but because
the *statement* needs primitives Mathlib does not have: Dehn surgery, knot concordance,
hyperbolic volume, Heegaard genus, foliation Euler classes, locally flat embeddings,
diffeomorphism-group topologies. This roadmap builds, on top of Mathlib, everything
needed to *state* (not prove) these theorems faithfully.

To be clear about scope: this is about **statements**, not proofs. A faithful, idiomatic
statement of "the Weeks manifold has the smallest volume among closed orientable
hyperbolic 3-manifolds" is already a large, valuable target, independent of any hope of
proving it. Several of the layers below (the manifold buildout, gluing, surgery, the
diffeomorphism-group topology) are reusable library infrastructure whose value does not
depend on any one Kirby problem.

Suggested homes: `TauCeti/Geometry/Manifold/` (gluing, connected sum, tubular
neighbourhoods, structure groups), `TauCeti/Geometry/Diffeomorphism/` (the C^∞ topology),
`TauCeti/LowDimTopology/` (Dehn surgery, Heegaard splittings, foliations),
`TauCeti/Geometry/Hyperbolic/` (constant-curvature structures and volume),
`TauCeti/Topology/PL/` (triangulations, collapse).

## Relationship to the Heegaard Floer roadmaps

The [combinatorial Heegaard Floer roadmap](../CombinatorialHeegaardFloer/README.md)
already owns **knot theory done properly** and **concordance**: its Lane K builds the many
presentations of a knot or link (grid diagrams, PD codes, braid closures), Reidemeister
and Cromwell adequacy, and the Alexander polynomial; its grid-homology spine builds the
concordance invariant `τ`, the slice-genus bound `|τ(K)| ≤ g_s(K)`, and knot cobordisms.
This roadmap does **not** duplicate that work. Where a Kirby problem needs knots or
concordance, it consumes that roadmap's types and adds only the geometric-topology pieces
those roadmaps assume away: knot complements *as manifolds* (for Dehn surgery), the
4-dimensional topology behind topological sliceness (Freedman), and the surgery and
cobordism constructions. The roadmaps share the convention "a knot has no privileged
representation"; reconciliation theorems between presentations live in the combinatorial
Heegaard Floer roadmap, and this roadmap states its targets against whichever presentation
is most natural, noting the dependency.

## Principles

- **Connected all the way down to Mathlib.** Every layer starts exactly where Mathlib
  leaves off today, with no floating definitions. Where a primitive already exists
  (`ModelWithCorners`, the tangent bundle, `IsCoveringMap`, `HomotopyGroup`, singular
  homology, the nascent Riemannian-metric library) we consume it; where it does not, the
  roadmap adds it as an explicit dependency. The deliverable is a dependency graph rooted
  in current Mathlib, not a wishlist. The inventories below name the exact files we build
  on.
- **Maximum generality where it is natural.** We do not specialise to dimensions 3 and 4
  just because the Kirby problems live there. Build manifolds-with-boundary, gluing,
  tubular neighbourhoods, and surgery in general dimension; work with arbitrary structure
  groups (Top, PL, Diff, and `O(n)`, `SO(n)`) rather than hard-coding the smooth
  orthogonal case; build the diffeomorphism-group topology for general manifolds rather
  than just `S³`. The low-dimensional statements then fall out as instances. It is more
  work up front, but it is the difference between a library and a pile of special cases.
- **Treat the foundations as first-class goals.** A lot of the gap is just missing
  differential and geometric topology. The roadmap treats "build connected sums" or
  "build Dehn surgery" as library goals that happen to unlock several problems, not as
  one-off scaffolding for a single theorem.
- **Statements stay unbundled.** As in the PDE and Heegaard Floer roadmaps, named
  hypotheses (locally flat vs smooth, Top vs PL vs Diff structure group, orientable vs
  not) stay separate rather than bundled into one structure, so a theorem can be restated
  in a neighbouring category without rebuilding the topology.

## Inventory: what Mathlib gives us (consume)

Verified against the pinned Mathlib (`Mathlib/`, commit `9caeba1`, Lean `v4.31.0-rc1`).

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
  Hannah Fechtner's program) in `Mathlib/Algebra/PresentedMonoid/Basic.lean`. Both are
  consumed by the Heegaard Floer roadmap's Lane K, not rebuilt here.

## Inventory: what is missing (build)

Everything geometric-topological past the smooth-manifold-and-tangent-bundle level. In
rough dependency order:

- **PL and Top manifold categories as structure groups.** Mathlib has the `contDiff`,
  `analytic`, and `continuous` groupoids, but no piecewise-linear groupoid and no
  category-of-structure-groups API tying Top, PL, and Diff together. Smoothing and
  triangulation theory (the obstruction theory relating the three) is entirely absent.
- **Gluing and surgery primitives.** Connected sum, gluing two manifolds along
  diffeomorphic boundary pieces, tubular neighbourhoods, handle attachment, and
  Dehn-style surgery (cut out a tubular neighbourhood of a submanifold, reglue by a
  diffeomorphism of the boundary). None of this exists; it is the load-bearing core of
  layers 1 and 5.
- **Locally flat embeddings** in general dimension (a topological embedding that is
  locally a flat slice in a chart). Absent.
- **Diffeomorphism groups as topological groups** with the C^∞ topology, and the
  smooth-families ↔ continuous-maps-into-`Diff` correspondence. The `Diffeomorph` *type*
  exists; the group object and its topology do not.
- **Knot complements as manifolds**, slopes, solid-torus gluing (Dehn surgery proper).
  Absent. The knot itself comes from the Heegaard Floer roadmap; the complement-as-manifold
  and the surgery do not.
- **The 4-dimensional topology behind topological sliceness** (Freedman's theory): topologically
  locally flat surfaces in the 4-ball, and topological slice discs. Absent.
- **Riemannian volume and curvature.** The metric-and-distance layer exists; the Riemannian
  volume measure, sectional and Ricci curvature, complete constant-curvature metrics,
  hyperbolic structures, and the volume of a hyperbolic manifold are all missing.
- **Thurston geometries and geometric decomposition** (the eight model geometries, the
  JSJ decomposition, the statement of a geometric structure on a piece). Absent.
- **Heegaard splittings and Heegaard genus** of a 3-manifold. Absent.
- **Foliations and their Euler class.** Absent.
- **Geometric realization of abstract simplicial complexes** as topological spaces (the
  realization functor exists for simplicial *sets*, but not the triangulation-of-a-manifold
  notion), PL structures, and simplicial or CW collapse. Absent.

## The layers, bottom-up from Mathlib

Ordered roughly from "closest to Mathlib" to "furthest". The early layers are
high-leverage and close to Mathlib; the geometric-structures layers are the hardest. Each
layer names the Mathlib types it starts from and the Kirby problems it would let us
*state*. The ordering and granularity are a first cut, offered to be argued with: layers 1
and 5 in particular could be split further, and layers 7 and 8 share a Riemannian
substrate that could be its own node.

### Layer 1: manifold-library buildout (general dimension, general structure group)

Manifolds-with-boundary and corners (consume `ModelWithCorners` and the
`InteriorBoundary` API), gluing along boundary, tubular neighbourhoods, connected sum, and
the Top / PL / Diff categories as structure groups (consume `StructureGroupoid`,
`contDiffGroupoid`, `continuousGroupoid`; build the PL groupoid and the comparison API).
This underlies almost everything below.

Unlocks: smoothability of `⋆RP⁴ # ⋆CP²`, `[Kir97, Problem 4.82]` (connected sum plus a
smooth structure on a fake `RP⁴`).

### Layer 2: locally flat embeddings in general dimension

A usable encoding exists in lean-eval via partial-homeomorphism model charts; generalise
it. Build on `Homeomorph`, `IsEmbedding`, and the chart machinery of `ChartedSpace`.

Unlocks: the Annulus Conjecture (Kirby 1969 in dimension `≥ 5`; Quinn 1982 in dimension 4;
no Kirby number), that a locally flat embedded annulus between parallel locally flat
spheres bounds a product region.

### Layer 3: diffeomorphism groups with the C^∞ topology

Topological-group structure on the automorphisms of a manifold, for general manifolds,
with the smooth-families ↔ continuous-maps correspondence. Consume the `Diffeomorph` type;
build the group object and the topology. lean-eval currently dodges this with an ad-hoc
"relative parameterized" form.

Unlocks: direct statements of the Smale conjecture `Diff(S³) ≃ O(4)` (Hatcher),
`[Kir97, Problem 4.34]`, and Watanabe's disproof of the 4-dimensional Smale conjecture,
`[Kir97, Problem 4.126]`.

### Layer 4: knot theory (consumed from the Heegaard Floer roadmap)

Slice-ness and the knot polynomials live in the
[combinatorial Heegaard Floer roadmap](../CombinatorialHeegaardFloer/README.md) (Lane K
and the grid-homology spine): the presentations of a knot or link as first-class types
with the maps between them, smoothly and topologically slice as clean definitions, and
Alexander, Jones, and HOMFLY with algorithms computing them. This roadmap adds the
**4-manifold input to topological sliceness** that those roadmaps assume (layer 6 below),
and consumes the rest.

Unlocks (jointly with Heegaard Floer): `0`-shake genus vs slice genus,
`[Kir97, Problem 1.41]` (Piccirillo, via the Conway knot); Alexander-polynomial-one knots
are topologically slice, `[Kir97, Problem 1.36]` (Freedman).

### Layer 5: Dehn surgery

Knot and link complements as manifolds (consume layer 1's manifold-with-boundary and the
Heegaard Floer roadmap's knots), slopes on the boundary torus, and gluing in solid tori
(consume layer 1's boundary-gluing). General-dimension surgery on framed embedded spheres
specialises to the 3-dimensional case.

Unlocks: Property P `[Kir97, Problem 1.15]`, Property R `[Kir97, Problem 1.82]`,
Akbulut–Kirby `0`-surgery concordance `[Kir97, Problem 1.19]`, and chirally cosmetic
surgery `[Kir97, Problem 1.81]`.

### Layer 6: knot concordance and 4D cobordism

The concordance group and cobordism invariants (signature, and ideally `s` and `τ`) build
on the combinatorial Heegaard Floer roadmap's `τ` and knot-cobordism machinery; this
roadmap adds the topological 4-manifold input (Freedman) and the cobordism category in
general dimension.

Unlocks: Conway mutation does not preserve concordance, `[Kir97, Problem 1.53]`;
concordance of knots in homology spheres to knots in `S³`, `[Kir97, Problem 1.31]`
(Levine, disproved smoothly).

### Layer 7: Riemannian geometric structures and volume

Complete constant-curvature metrics, hyperbolic structures, and the volume of a
(hyperbolic) manifold, building on Mathlib's `RiemannianBundle` and `riemannianEDist`. The
gap from current Mathlib is the Riemannian volume measure, curvature, and completeness; the
metric-and-distance layer is already present.

Unlocks: virtual fibering and virtually Haken, `[Kir97, Problem 3.51]` (Agol); the
smallest-volume closed orientable hyperbolic 3-manifold is the Weeks manifold,
`[Kir97, Problem 3.60]` (Gabai–Meyerhoff–Milley).

### Layer 8: Thurston geometries and the JSJ / geometric decomposition

The eight model geometries, the JSJ decomposition along tori, and what it means for a
piece to carry a geometric structure. Shares the Riemannian substrate of layer 7.

Unlocks: Geometrization, `[Kir97, Problem 3.45]` (Perelman). Its conclusion is
*structural* (each piece of a canonical decomposition is geometric), not "homeomorphic to
a fixed model", which is why it is much harder to state than the Poincaré conjecture.

### Layer 9: Heegaard splittings and Heegaard genus

Splittings of a 3-manifold into two handlebodies, the Heegaard genus invariant, and its
relation to the rank of the fundamental group. Builds on layer 1's handlebodies.

Unlocks: Waldhausen's rank-versus-genus conjecture (disproved by Li; no Kirby number).

### Layer 10: foliations and their Euler class

Codimension-one foliations of a 3-manifold, taut foliations, and the Euler class of the
tangent plane field. Builds on the tangent bundle and layer 1.

Unlocks: Gabai–Yazdi's disproof of Thurston's foliation Euler-class conjecture (no Kirby
number).

### Layer 11: triangulations, PL structures, and collapse

Geometric realization of abstract simplicial complexes as topological spaces (extend the
simplicial-set realization to the complexes of `Mathlib/Analysis/Convex/SimplicialComplex/`),
the notion of a triangulation of a manifold, PL structures, and simplicial or CW collapse.

Unlocks: Manolescu's disproof of the triangulation conjecture (no Kirby number); the
Zeeman collapsibility conjecture, `[Kir97, Problem 5.2]`.

## Acceptance criteria (checks along the way)

Concrete checks that rule out vacuous or mis-stated definitions:

- **Gluing computes.** `S³` presented as two solid tori glued along their boundary, and
  `S^n # S^n ≃ S^n` (connected sum with a sphere is trivial): both should be theorems, not
  just definitions, on the layer-1 API.
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

- R. Kirby (ed.), *Problems in Low-Dimensional Topology*, in *Geometric Topology*
  (AMS/IP Stud. Adv. Math. 2.2, 1997): the source problem list `[Kir97]`.
- G. Perelman, *The entropy formula for the Ricci flow and its geometric applications*,
  [arXiv:math/0211159](https://arxiv.org/abs/math/0211159); *Ricci flow with surgery on
  three-manifolds*, [arXiv:math/0303109](https://arxiv.org/abs/math/0303109);
  *Finite extinction time...*, [arXiv:math/0307245](https://arxiv.org/abs/math/0307245):
  Geometrization (layer 8).
- I. Agol, *The virtual Haken conjecture* (with an appendix by Agol, Groves, Manning),
  Doc. Math. 18 (2013), [arXiv:1204.2810](https://arxiv.org/abs/1204.2810): layer 7.
- D. Gabai, R. Meyerhoff, P. Milley, *Minimum volume cusped hyperbolic three-manifolds*,
  J. Amer. Math. Soc. 22 (2009), and the closed-case companion work: the Weeks manifold as
  the smallest-volume closed orientable hyperbolic 3-manifold (layer 7).
- L. Piccirillo, *The Conway knot is not slice*, Ann. of Math. 191 (2020),
  [arXiv:1808.02923](https://arxiv.org/abs/1808.02923): layer 4 (`[Kir97, 1.41]`).
- M. Freedman, *The topology of four-dimensional manifolds*, J. Differential Geom. 17
  (1982); M. Freedman, F. Quinn, *Topology of 4-Manifolds*, Princeton, 1990:
  topological sliceness and Alexander-polynomial-one knots (layers 4 and 6).
- A. Hatcher, *A proof of the Smale conjecture, `Diff(S³) ≃ O(4)`*, Ann. of Math. 117
  (1983): layer 3 (`[Kir97, 4.34]`).
- T. Watanabe, *Some exotic nontrivial elements of the rational homotopy groups of
  `Diff(S⁴)`*, [arXiv:1812.02448](https://arxiv.org/abs/1812.02448): the disproof of the
  4-dimensional Smale conjecture (layer 3, `[Kir97, 4.126]`).
- C. Manolescu, *Pin(2)-equivariant Seiberg–Witten Floer homology and the triangulation
  conjecture*, J. Amer. Math. Soc. 29 (2016),
  [arXiv:1303.2354](https://arxiv.org/abs/1303.2354): layer 11.
- T. Li, *Rank and genus of 3-manifolds*, J. Amer. Math. Soc. 26 (2013): the disproof of
  Waldhausen's rank-versus-genus conjecture (layer 9).
- F. Quinn, *Ends of maps III: dimensions 4 and 5*, J. Differential Geom. 17 (1982): the
  Annulus Conjecture in dimension 4 (layer 2); Kirby (1969) for dimension `≥ 5`.

The author/title/venue citations above are deliberately conservative; a contributor
expanding a layer should attach the precise reference for each theorem they state (and the
relevant Kirby-list successor entry where one exists), rather than relying on the summary
here.

## How to drive it

Layers 1, 2, and 3 can start immediately and independently against current Mathlib: they
are the high-leverage substrate, and each is reusable library infrastructure on its own.
Layer 1 is the spine almost everything else waits on, so push it first; layers 2 and 3 are
genuinely parallel on-ramps. Layer 5 (Dehn surgery) follows layer 1 and the Heegaard Floer
roadmap's knot types. Layers 7 and 8 share a Riemannian substrate and should be planned
together, after the layer-7 volume measure lands. Layers 9, 10, and 11 are independent of
each other and can begin once layer 1's handlebody and tangent-field API exists. The
knot-theory and concordance content (layers 4 and 6) is coordinated with the Heegaard
Floer roadmap rather than driven from here.

## Acknowledgements

This roadmap grew out of walking the Kirby problem list while building the topology
problems in [`leanprover/lean-eval`](https://github.com/leanprover/lean-eval), and out of
the design discussions behind the
[combinatorial Heegaard Floer roadmap](../CombinatorialHeegaardFloer/README.md), whose
knot-theory and concordance lanes it consumes. Thanks to everyone who contributed to those
discussions on the [Lean Zulip](https://leanprover.zulipchat.com/).
