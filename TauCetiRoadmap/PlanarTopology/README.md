# Roadmap: Planar topology and the piecewise-linear structure of surfaces

The guiding philosophy is classical geometric and combinatorial surface topology, in the
early twentieth-century tradition of triangulation: draw curves, cut into triangles,
subdivide, count, and glue. Later PL, isotopy, and smoothing theorems complete the comparison
of structures. The organizing phenomenon is specific to dimension two: topological,
piecewise-linear, and smooth descriptions give the same classification of compact surfaces.

A compact topological surface admits a triangulation and a compatible smooth structure.
Triangulations are unique up to PL homeomorphism, and compatible smoothings are unique up to
diffeomorphism. With these compatible structures, homeomorphisms have PL and smooth
representatives in their isotopy classes, with the boundary-relative forms specified below.
This agreement concerns structures and isotopy classes of homeomorphisms. Embedded arcs and
simple closed curves in the interior of a surface are tame as well. In higher dimensions these conclusions separate:
triangulations and the Hauptvermutung can fail, and wild embeddings make local flatness a
genuine condition.

The proofs use planar separation, polygonal approximation, and the combinatorics of
two-dimensional links. On a triangulated surface the Euler characteristic is `V - E + F`,
with invariance proved by counting the changes under subdivision and elementary moves.
The companion roadmap's classical homology is built from finite boundary matrices and made
topologically invariant through equivalence of triangulations. Singular homology and general
algebraic-topology machinery are outside the prerequisites. Some individual conclusions
also hold in dimension three, but the full package, especially automatic tameness, is
specifically two-dimensional. The definitions are shared with `GeometricTopology`; together
with [SurfaceTopology](../SurfaceTopology/README.md), this roadmap supplies its elementary
surface theory and classification.

The summits, in order of construction:

1. **The Jordan curve theorem and the crosscut theorem**, with the frontier and
   accessibility API used by `ConformalMapping`, and **invariance of domain** in
   dimension two, by way of Brouwer's fixed-point theorem.
2. **Radó's theorem**: every compact surface is triangulable.
3. **The two-dimensional Hauptvermutung and Pachner's theorem**: homeomorphic triangulated
   surfaces admit isomorphic subdivisions, and any two triangulations of a compact surface
   are related by bistellar moves. Together with Radó's theorem, this makes the
   piecewise-linear structure of a compact surface well defined up to PL isomorphism, and
   makes every invariant of a triangulation that survives the moves a topological invariant.
4. **The Euler characteristic and orientability** of a compact surface, with its
   orientations and its boundary components, all well defined and homeomorphism invariants.
5. **The Schoenflies theorem** in its polygonal, planar, spherical, and relative forms, and
   tameness of arcs, simple closed curves, and finite graphs in a surface.
6. **Uniqueness of the piecewise-linear and smooth structures** on a compact surface, and
   Epstein's theorem that homotopic homeomorphisms are isotopic.

The companion roadmap
[SurfaceTopology](../SurfaceTopology/README.md) consumes items 2 through 6 and proves the classification of compact surfaces. This roadmap is simplicial only: generalized maps, hypermaps, and polygon words appear nowhere in it, and no reusable cellulation presentation is developed here.

Each layer below is organized around a theorem, its mathematical dependencies, and a proof route. The displayed Lean declarations are representative interfaces rather than part of the mathematical statement; they remain useful for exposing how the layers fit into Tau Ceti.

---

## Relationship to other roadmaps

### Downstream consumers

| Consumer | What it needs | Where it is proved here |
|---|---|---|
| `ConformalMapping` layer 5, elementary proof comparison | `IsJordanDomain hJ.inside` is the shared open, connected, bounded, and Jordan-frontier interface; simple connectivity follows from `TauCeti.IsJordanDomain.isSimplyConnected` | layer 2 |
| `GeometricTopology` layer 11 | triangulability is unconditional in dimension two; the two-dimensional Hauptvermutung and Pachner's theorem; the compatibility of `IsCombinatorialSurface` with `IsCombinatorialManifold K 2` | layers 3 and 5 |
| `GeometricTopology` layer 2 | local flatness of embedded circles and arc interiors in a surface interior; half-line slices at arc endpoints; tameness of finite graphs with finite-star vertex models | layer 7 |
| `GeometricTopology` layer 1 | invariance of domain in dimension two, hence chart-independence of the manifold boundary in the topological case `k = 0` that `isBoundaryPoint_iff_mem_frontier_range` excludes | layer 2 |
| `SurfaceTopology` | Radó, the Hauptvermutung, Pachner, the Euler characteristic, orientability and orientations, the boundary count, Schoenflies, tameness, Epstein's theorem, and the comparison of the topological, PL, and smooth categories | layers 2, 5, 6, 7, and 8 |

The [completed ConformalMapping area](../../Completed/ConformalMapping/README.md) already
supplies general Jordan separation and the Jordan-domain interface. Layer 2 develops the
elementary polygonal and crosscut route to those statements, with the accessibility and
finite decomposition results needed by layer 7. It uses the shared native predicates and
compares its conclusions with the existing theorems. Likewise,
[AlgebraicTopology, Stage 2, item 7](../AlgebraicTopology/README.md#stage-2-relative-singular-chains-and-homology)
owns general no-retraction and Brouwer theorems; layer 2 retains the elementary winding-number
proofs of their two-dimensional specializations. These proof routes keep the geometric
surface programme independent of general homology and complex analysis.

### Existing library prerequisites

The following definitions and theorems supply the topological and finite simplicial
vocabulary, cited directly by library module. Their use does not assume completion of
`GeometricTopology`: that roadmap consumes the new dimension-two theorems listed above.
Additional elementary infrastructure constructed here is listed in the next subsection.

| Item | Existing library location |
| --- | --- |
| `Isotopy`, `Isotopic` | `TauCeti/Topology/Homotopy/Isotopy/{Basic,Comp,Prod}.lean` |
| `AmbientIsotopy`, `AmbientIsotopic` | `TauCeti/Topology/Homotopy/AmbientIsotopic/{Basic,Complement,Naturality}.lean` |
| `Realization`, `Face`, `faceInclusion`, `StandardSimplex` | `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/{Basic,Map,Subcomplex}.lean` |
| `link`, `closedStar`, `deletion` | `TauCeti/AlgebraicTopology/SimplicialComplex/LinkStar.lean` |
| barycentric subdivision, `barycentricSubdivisionMap`, and `barycentricSubdivisionRealizationHomeomorph` | `TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/{Basic,Realization,Homeomorph}.lean` |
| stellar subdivision and `StellarEquivalent` | `TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Stellar/{Basic,Equivalence}.lean` |
| `IsCombinatorialBall`, `IsCombinatorialSphere`, `IsCombinatorialManifold` | `TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold.lean` |
| `SimplicialMap`, `domainRestrict` | `TauCeti/AlgebraicTopology/SimplicialComplex/Maps.lean` |
| `SimplicialMap.realizationMap`, its barycentric-coordinate formula, vertex, identity and composition laws | `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Map.lean` |
| `Geometry.SimplicialComplex.isPLOn_of_locallyFinite` | `TauCeti/Topology/PL/Simplicial.lean` |
| `dimension` | `TauCeti/AlgebraicTopology/SimplicialComplex/Dimension.lean` |
| the collapse API | `TauCeti/AlgebraicTopology/SimplicialComplex/Collapse/`, `ElementaryCollapse.lean` |
| `IsTriangulable` | `TauCeti/Topology/Triangulable.lean` |
| `IsLocallyFlat`, `IsSliceChart`, `IsSliceEmbedding` | `TauCeti/Geometry/Manifold/LocallyFlat/{Basic,Smooth}.lean` |
| half-space boundary model, boundary charts, collar charts, and the topological collar `IsCollar` | `TauCeti/Geometry/Manifold/Boundary/{Basic,Charts,Model}.lean`, `Boundary/Collar/{Basic,Chart,Local,Global}.lean` |
| `IsPiecewiseAffineOn`, `IsPLOn` | `TauCeti/Topology/PL/Map.lean` |
| `PLPregroupoid`, `PLGroupoid` | `TauCeti/Geometry/Manifold/PLGroupoid.lean` |
| `IsJordanCurve` and the arc theory | `TauCeti/Topology/JordanCurve/{Basic,Path,Separation,SmallArc,Subcontinuum,Monotone,OnePoint}.lean` |
| `filledHull` | `TauCeti/Topology/FilledHull.lean` |
| `IsJordanDomain` | `TauCeti/Analysis/Complex/Conformal/Jordan/Domain.lean` |
| the Borsuk separation criterion and Janiszewski's theorem | `TauCeti/Analysis/Complex/PlaneSeparation/Basic.lean` |
| winding numbers for contours | `TauCeti/Analysis/Contour/Winding/` |
| `Circle` arc and metric API | `TauCeti/Topology/Circle/{Basic,Arc,Metric}.lean` |
| continua, local connectedness | `TauCeti/Topology/{Continuum,LocallyConnected,UniformlyLocallyConnected}.lean` |

### Shared formal infrastructure needed

- **Relative and supported isotopy** (`IsotopicRel`, ambient isotopy with prescribed support) into `TauCeti/Topology/Homotopy/`.
- **General subdivision** (a complex refining another with the same realization), stellar subdivision, and the common-subdivision theorem, into  `TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/`.
- **Purity, facets, and skeleta** into `TauCeti/AlgebraicTopology/SimplicialComplex/`.
- **`IsPLMap`** in the same directory, defined by quantification over subdivisions.


---

## Mathematical objects and formalization conventions

The following choices fix the mathematical models used in statements and keep the formal development interoperable with the surrounding Tau Ceti libraries.

### The plane

**Planar topology is stated over `ℂ`.** `ConformalMapping` works over `ℂ`, `Circle` lives in `ℂ`, the normal to a directed segment is `I * u`, and the exterior is handled by `z ↦ z⁻¹`.

**Chart-level results are stated over `EuclideanSpace ℝ (Fin 2)` and `EuclideanHalfSpace 2`**, because that is Mathlib's `ModelWithCorners` vocabulary and there is no alternative.

Layer 0 fixes one named linear isometry equivalence `ℂ ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 2)`, obtained from `Complex.orthonormalBasisOneI.repr`. It is an isometry, not merely a homeomorphism, so every metric, diameter, and convexity statement transports for free.  Headline theorems should be proved in one model and transported to the other, rather than developed independently twice.

Layer 0 also fixes the sup-norm comparison `‖x‖_∞ ≤ ‖x‖ ≤ √2 · ‖x‖_∞`, which is what square-mesh arguments run on.

**Piecewise-linear maps of the plane are Tau Ceti's `IsPLOn`.** A map between real vector spaces is piecewise affine on a set when the set is covered by finitely many convex polyhedra on each of which the map is affine, and `IsPLOn f s` asks this near every point of `s` (`TauCeti/Topology/PL/Map.lean`). A **PL homeomorphism of the plane** is `h : ℂ ≃ₜ ℂ` with `IsPLOn h univ` and `IsPLOn h.symm univ`, and a PL map of a polygon is `IsPLOn` on it. Layer 3 relates this to the subdivision-based `IsPLMap` on realizations.

### The circle

`Circle`, the unit circle of `ℂ`, is the statement-level circle, because `TauCeti.IsJordanCurve C` is defined as `Nonempty (C ≃ₜ Circle)`. Its group structure is used when gluing two Schoenflies discs along a curve.

`AddCircle (1 : ℝ)` is the parametrization used whenever lifting, degree, or a linear order on a lift is needed. `AddCircle.homeomorphCircle one_ne_zero`, `Circle.exp`, and `sphereCircleHomeomorph` are the bridges; layer 0 states the round trips.

⚠ `CircularOrder` on the topological circle has nothing to do with `SurfaceTopology`'s cyclic words, which are Mathlib's `Cycle`. Keep them apart, with no coercion between them.

### Surfaces

There is one family of surfaces, and it is Mathlib's. A **surface** is a type `M` with

```lean
[TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M] [SecondCountableTopology M]
```

and nothing bundled: a manifold is a type with instances, as `GeometricTopology` fixes it, and since the `C⁰` structure groupoid is the continuous one (`contDiffGroupoid_zero_eq`) no `IsManifold` instance carries information. **Compact**, **connected**, and **closed** are the hypotheses `CompactSpace M`, `ConnectedSpace M`, and `(𝓡∂ 2).boundary M = ∅`. Every displayed signature below abbreviates this list by a `variable` line at the head of its block; names such as `Surface` or `CompactSurface` are not classes and appear nowhere. Second countability of a compact charted space is Mathlib's `ChartedSpace.secondCountable_of_sigmaCompact` and is not a target. The empty type satisfies every one of these hypotheses and is the empty surface: the empty complex is a combinatorial surface, Radó's theorem holds for it with the empty complex, its Euler characteristic is `0`, it is orientable, and it has no boundary components. Only `ConnectedSpace` excludes it.

Half-space charts cover the boundaryless case, so a surface charted over `EuclideanSpace ℝ (Fin 2)`, such as Mathlib's sphere or the plane itself, enters the family by transport: layer 0 fixes a half-space chart on `EuclideanSpace ℝ (Fin 2)`, composes with `ChartedSpace.comp`, and proves that the result has empty boundary. The closed unit disc of `ℂ` uses Tau Ceti's existing `instChartedSpaceClosedBall`
and `boundary_closedBall` from `Geometry/Manifold/Instances/ClosedBall.lean`, with
`n = 2` and `E = ℂ`.

Manifold boundary `∂M` is the set `(𝓡∂ 2).boundary M` of points that are boundary points in their own chart. ⚠ Chart-independence in the topological case is **not** available from `isBoundaryPoint_iff_mem_frontier_range`, which requires `k ≠ 0`. It follows from invariance of domain, proved in layer 2. Nothing in this roadmap may use a property of `∂M` before layer 2, and every statement about an arc or curve *in* a surface that needs a full disc around it says so with `⊆ (𝓡∂ 2).interior M`.

### Simplicial and PL

Abstract simplicial complexes are Tau Ceti's (`PreAbstractSimplicialComplex` / `AbstractSimplicialComplex`, `SetLike`, `Face K := {σ : Finset ι // σ ∈ K}`, realization into `ι →₀ ℝ`). No private complex type.

A **PL map** is defined by existential quantification over subdivisions of the domain complex, not by a triangulation. Composability then depends on the common-subdivision theorem, which is a layer 3 target.

`IsCombinatorialSurface` is defined concretely by the link condition on a complex with finitely many faces: every vertex link is a finite combinatorial circle or a finite combinatorial arc, and every edge lies in one or two triangles. It is *not* defined by instantiating a dimension-general recursion. Tau Ceti's `IsCombinatorialManifold K n` (`SimplicialComplex/CombinatorialManifold.lean`) asks instead that each vertex link be stellar equivalent to the boundary of a simplex or to a simplex; the equality of the two notions at `n = 2` is a compatibility theorem, listed in layer 3's targets, and no dimension-two result depends on it.

### Bundled index types

Every finite combinatorial object bundles its own index type. Let `surfaceIsoSetoid`
be the setoid on bundled combinatorial surfaces whose relation is existence of a
simplicial isomorphism of the underlying complexes. An allowed step is either this
isomorphism or a bistellar move; apply `Relation.ReflTransGen` to their disjunction.
Pure relabelling is therefore allowed with zero geometric moves. In relative forms,
isomorphisms must respect the prescribed boundary or subcomplex identification.
This is the same finite-relation convention as in `SurfaceTopology`, and uses only
simplicial isomorphisms here.

---

## Dependencies

```
L0 conventions
 |
L1 polygonal engine
 |\
 | \__ Track I  (approximation and separation)
 |    L2 separation, crosscuts, Brouwer, invariance of domain
 |    L7 topological Schoenflies and tameness  (graph tameness also uses L3 and L5)
 |
 \____ Track II (piecewise-linear)
      L3 simplicial and PL toolkit in dimension two
      L4 the PL approximation theorem
      L5 Rado, the two-dimensional Hauptvermutung, and Pachner's theorem
      L6 Euler characteristic and orientability
           |
           L8 uniqueness of PL and smooth structure, Epstein's theorem  (joins I and II)
```

---

## Layer 0: Conventions, transport, and plane pathologies

This preliminary layer fixes the ambient models and transport lemmas used throughout the roadmap. It also contains three classical constructions showing that the hypotheses in later separation theorems are necessary, describes Alexander's trick, and puts the sphere and the closed disc into the surface family of the conventions.

**From Mathlib and Tau Ceti.** `Complex.orthonormalBasisOneI`, `OrthonormalBasis.repr`, `Circle`, `AddCircle`, `AddCircle.homeomorphCircle`, `Circle.exp`, `sphereCircleHomeomorph`, `Isotopy`, `Isotopic`, `AmbientIsotopic`, `Continuum`, `LocallyConnected`, `ChartedSpace.comp`, `Homeomorph.chartedSpace`, `ChartedSpace.secondCountable_of_sigmaCompact`, `IsPLOn`, `BoundedVariationOn`.

**Representative formal statements.**

```lean
/-- The plane transport. An isometry, so metric statements move for free. -/
noncomputable def planeEquiv : ℂ ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 2) :=
  Complex.orthonormalBasisOneI.repr

def perp (u : ℂ) : ℂ := Complex.I * u
def det (u v : ℂ) : ℝ := (starRingEnd ℂ u * v).im

theorem det_eq_inner_perp (u v : ℂ) : det u v = inner ℝ (perp u) v
theorem norm_inf_le_norm (z : ℂ) : ‖z‖_∞ ≤ ‖z‖
theorem norm_le_sqrt_two_norm_inf (z : ℂ) : ‖z‖ ≤ Real.sqrt 2 * ‖z‖_∞

/-- The plane as a half-space-charted surface, and the transport of any Euclidean-charted surface
    into the family of the conventions. The exact instance packaging is schematic. -/
def halfSpaceChartedSpace : ChartedSpace (EuclideanHalfSpace 2) (EuclideanSpace ℝ (Fin 2))
def ofBoundaryless (M : Type*) [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) M] :
    ChartedSpace (EuclideanHalfSpace 2) M :=
  ChartedSpace.comp (EuclideanHalfSpace 2) (EuclideanSpace ℝ (Fin 2)) M
theorem boundary_ofBoundaryless (M) [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) M] :
    (𝓡∂ 2).boundary M = ∅          -- with the transported instance

-- Consume the existing closed-ball atlas and its boundary theorem at n = 2, E = ℂ:
-- TauCeti.instChartedSpaceClosedBall
-- TauCeti.boundary_closedBall :
--   (𝓡∂ 2).boundary (Metric.closedBall (0 : ℂ) 1) =
--     Subtype.val ⁻¹' Metric.sphere (0 : ℂ) 1

/-- Isotopy relative to a subset; intended for the shared isotopy API. -/
def IsotopicRel (A : Set X) (f g : C(X, Y)) : Prop

/-- Arcs, in the shape of Tau Ceti's `IsJordanCurve`: a subset homeomorphic to the interval. The
    endpoints are the two points whose removal leaves it connected, so naming them needs no choice
    of parametrization. `SurfaceTopology` layer 9's `Arc M` is the bundled form of the same
    notion. -/
def IsArc (A : Set X) : Prop := Nonempty (A ≃ₜ unitInterval)
def endpoints (A : Set X) : Set X := {x ∈ A | IsPreconnected (A \ {x})}
theorem card_endpoints (hA : IsArc A) : Nat.card (endpoints A) = 2
theorem endpoints_eq_image (hA : IsArc A) (e : A ≃ₜ unitInterval) :
    endpoints A = Subtype.val '' (e ⁻¹' {0, 1})


/-- Alexander's trick, extension form. A homeomorphism of the boundary sphere cones radially to a homeomorphism of the closed ball. Stated dimension-generally; the disc is
    `n = 2`, the case spent here. -/
noncomputable def coneExtend {n : ℕ} (h : Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1 ≃ₜ
    Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1) :
    Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1 ≃ₜ
    Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1

theorem norm_coneExtend (h) (z) : ‖(coneExtend h z : _)‖ = ‖(z : _)‖
theorem coneExtend_eqOn_sphere (h) : ∀ z ∈ Metric.sphere 0 1, coneExtend h z = h z

/-- Alexander's trick, isotopy form. Two self-homeomorphisms of the ball that agree on the boundary are isotopic rel boundary. -/
theorem isotopicRel_of_eqOn_sphere {n : ℕ} (f g : Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1 ≃ₜ
    Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1)
    (h : Set.EqOn f g (Metric.sphere 0 1)) :
    IsotopicRel (Metric.sphere 0 1) f g

/-- The PL flavour, which is what layer 4 spends: coning a piecewise-linear homeomorphism of the
    circle, read in the plane through `planeEquiv`, gives a piecewise-linear homeomorphism of the
    disc. Polygons follow by layer 1's polygonal Schoenflies theorem. -/
theorem isPLOn_coneExtend (h) (hPL : IsPLOn h) : IsPLOn (coneExtend h)


/-- Plane pathologies: these certify that later hypotheses cannot be weakened. -/
theorem exists_spaceFillingCurve :
    ∃ f : C(unitInterval, Metric.closedBall (0 : ℂ) 1), Surjective f

/-- Not rectifiable: no parametrization of the curve has bounded variation. -/
theorem exists_jordanCurve_not_rectifiable :
    ∃ J : Set ℂ, IsJordanCurve J ∧
      ∀ γ : C(unitInterval, ℂ), Set.range γ = J → ¬ BoundedVariationOn γ Set.univ

theorem exists_jordanCurve_volume_pos : ∃ J : Set ℂ, IsJordanCurve J ∧ 0 < volume J


```
**Mathematical route and formalization notes.**

- Alexander's trick is short but needed in three places. L4 uses the PL version to correct the 2-skeleton and fills each triangle. L7 uses the topological version when it glues the two Schoenflies discs along the curve. L5 uses the isotopy form in `exists_isotopic_plHomeomorph`.
- The half-space transport is what makes Mathlib's sphere, the plane, and every Euclidean-charted surface a surface in the sense of the conventions. Its boundary is empty because every transported chart lands in the interior of the half-space. The native closed-ball atlas uses the identity at interior points and straightens the circle at boundary points; its boundary theorem identifies the boundary with the unit circle.
- Second countability of a compact surface is `ChartedSpace.secondCountable_of_sigmaCompact` and is not restated here.

- The space-filling curve is why the Jordan curve theorem needs injectivity, and the non rectifiable curve (Koch snowflake) shows why one may not assume a curve is rectifiable.  The positive measure Osgood curve is why one may not assume the curve is measure 0.

**Examples and mathematical checks.** The round trips for `planeEquiv`, `Circle`, and `AddCircle` are proved explicitly, and at least one metric theorem is transported through the plane equivalence. The space-filling curve is given by a concrete construction rather than by an unstructured existence assertion. The transported sphere and the closed disc are checked to have the expected boundaries, empty and the unit circle.

**Natural intermediate results.** (i) plane transport and the `perp`/`det` API; (ii) circle transport; (iii) the half-space transport and the closed disc; (iv) Alexander's trick: coneExtend, the norm identity, the isotopy form, and the PL flavour. (v) relative and supported isotopy, in the shared isotopy library; (vi) the space-filling curve; (vii) the Osgood curve.

---

## Layer 1: Polygonal Foundations

This layer includes dimension two results that are true for elementary reasons. This layer is entirely finite and produces the identity that both tracks run on.

The organizing object is the **crossing parity** of a point against a closed polygon.  The additive identity that makes the theory work is: cutting a polygonal Jordan curve by a polygonal crosscut splits it into two polygonal Jordan curves whose parities add.

**From layer 0.** The plane, `perp`, `det`, the sup-norm comparison.
**From Tau Ceti.** `TauCeti/Analysis/Contour/Winding/` for the comparison with the analytic winding number; `Combinatorics/SimpleGraph/Acyclic` for the graph-theoretic pieces.

**Representative formal statements.**

```lean
/-- A polygonal chain: finitely many vertices joined in order by segments. -/
structure PolygonalChain where
  vertices : List ℂ
  ne_nil : vertices ≠ []

/-- A polygonal loop: a chain closed up from its last vertex back to its first. -/
structure PolygonalLoop where
  vertices : List ℂ
  ne_nil : vertices ≠ []

def PolygonalChain.carrier (P : PolygonalChain) : Set ℂ
/-- The sides of a loop, cyclically indexed, and their union. -/
def PolygonalLoop.side (P : PolygonalLoop) (i : Fin P.vertices.length) : Set ℂ :=
  segment ℝ (P.vertices.get i) (P.vertices.get (finRotate _ i))
def PolygonalLoop.carrier (P : PolygonalLoop) : Set ℂ := ⋃ i, P.side i
/-- Simplicity is a condition on the vertex presentation, not on the carrier: at least three
    vertices, no vertex repeated, consecutive sides meeting only in their shared vertex, and
    other pairs of sides disjoint. The list `[A, B, C, A, B, C]` has the triangle as its carrier
    and is not simple, and must not be, since a ray from an interior point crosses it twice. -/
def PolygonalLoop.IsSimple (P : PolygonalLoop) : Prop :=
  3 ≤ P.vertices.length ∧ P.vertices.Nodup ∧
    ∀ i j, i ≠ j →
      (finRotate _ i = j → P.side i ∩ P.side j = {P.vertices.get j}) ∧
      (finRotate _ i ≠ j → finRotate _ j ≠ i → Disjoint (P.side i) (P.side j))
theorem isJordanCurve_carrier (P : PolygonalLoop) (hP : P.IsSimple) : IsJordanCurve P.carrier
/-- Renormalization: a polygonal set that is a Jordan curve has a simple presentation. -/
theorem exists_isSimple_of_isJordanCurve_carrier (P : PolygonalLoop) (h : IsJordanCurve P.carrier) :
    ∃ Q : PolygonalLoop, Q.IsSimple ∧ Q.carrier = P.carrier
/-- The half-open ray-crossing count modulo two, with value zero on the carrier. -/
def crossingParity (P : PolygonalLoop) (q : ℂ) : ZMod 2
theorem crossingParity_eq_zero_of_mem (P : PolygonalLoop) {q : ℂ} (hq : q ∈ P.carrier) :
    crossingParity P q = 0
def polygonalWinding (P : PolygonalLoop) (q : ℂ) : ℤ  -- signed half-open ray count; zero on the carrier

theorem crossingParity_locallyConstant (P : PolygonalLoop) (hP : P.IsSimple) :
    IsLocallyConstant (fun q : (P.carrier)ᶜ => crossingParity P q)

/-- Polygonal Jordan separation. -/
theorem polygonal_jordan (P : PolygonalLoop) (hP : P.IsSimple) :
    Nat.card (ConnectedComponents ((P.carrier)ᶜ : Set ℂ)) = 2

/-- The identity everything runs on, stated off the curves it compares. -/
theorem polygonal_crosscut_parity (P : PolygonalLoop) (hP : P.IsSimple)
    (Q : PolygonalCrosscut P) (q : ℂ) (hq : q ∉ P.carrier ∪ Q.carrier) :
    crossingParity P q = crossingParity (P.splitLeft Q) q + crossingParity (P.splitRight Q) q

/-- Two ears. -/
theorem exists_ear (P : PolygonalLoop) (hP : P.IsSimple) (h : 3 < P.vertices.length) :
    ∃ i, IsEar P i

/-- Polygonal Schoenflies. The closed inside of a simple polygon is PL-homeomorphic to a triangle, and the homeomorphism extends to the plane. -/
theorem polygonal_schoenflies (P : PolygonalLoop) (hP : P.IsSimple) :
    ∃ h : ℂ ≃ₜ ℂ, IsPLOn h univ ∧ IsPLOn h.symm univ ∧ h '' P.carrier =
      segment ℝ (0 : ℂ) 1 ∪ segment ℝ (1 : ℂ) I ∪ segment ℝ I 0

/-- A polygonal drawing of a finite simple graph: distinct points for the vertices, a polygonal
    chain for each edge, chains meeting only at shared endpoints. -/
structure PolygonalDrawing (G : SimpleGraph V) where ...

/-- The lever for layer 2. -/
theorem not_exists_polygonalDrawing_K33 :
    ¬ Nonempty (PolygonalDrawing (completeBipartiteGraph (Fin 3) (Fin 3)))
```

**Mathematical route and formalization notes.**

- Crossing parity, not the winding number, is the primitive. It is `ZMod 2`-valued, it is decidable, and the crosscut identity is additive in it. The integer winding number and the comparison with `TauCeti/Analysis/Contour/Winding/` are corollaries.
- ⚠ Do not restrict to lattice polygons.  You cannot inscribe a lattice polygon in an arbitrary Jordan curve, so the lattice version cannot serve layer 2. Re-derive at general-vertex generality.  (contrast with `rkirov/jordan_pick`)
- **Half-open crossing convention.** Set `crossingParity P q = 0` when `q` lies on the carrier. Otherwise ignore horizontal sides, order each remaining side's endpoints as `a`, `b` with `a.im < b.im`, and count it exactly when `a.im ≤ q.im < b.im` and `q.re < a.re + (q.im - a.im) * (b.re - a.re) / (b.im - a.im)`. Thus the lower endpoint is included, the upper excluded, and the intersection must lie strictly to the right of `q`. Reduce the count modulo two. Count side occurrences in the vertex list, including repeated occurrences, so traversing a loop twice doubles the count. This rule also handles horizontal runs through the ray without an extra endpoint rule. Local constancy and separation statements are stated on the carrier's complement.
- Crossing parity is a function of the presentation, so simplicity must be too. A loop that traverses a triangle twice has a Jordan carrier and even parity at every interior point. `polygonal_jordan` and the crosscut identity therefore take `IsSimple`, the Jordan property of the carrier is a theorem, and a Jordan polygonal set is first renormalized to a simple presentation.
- Nonplanarity of `K₃,₃` for polygonal drawings is a **finite** statement provable from the polygonal crosscut theorem alone. It is the lever that takes layer 2 from polygons to arbitrary curves. Its topological form, for drawings whose edges are arbitrary arcs, is not needed here: `SurfaceTopology` layer 10 derives nonplanarity of `K₅` and `K₃,₃` from Euler's formula, and layer 7's tameness of drawings identifies the two notions.
- Ear-clipping is the engine of polygonal Schoenflies: triangulate a simple polygon by diagonals, then induct.

**Examples and mathematical checks.** The crossing parity is computed in an exact worked example for a non-convex polygon and a point in a re-entrant pocket. A figure-eight polygonal loop shows that simplicity is essential in polygonal Jordan separation. The strict size hypothesis in the ear theorem is tested on a triangle, and a polygon with exactly two ears provides a sharp positive example. The twice-traversed triangle `[A, B, C, A, B, C]` is the check that simplicity is not a property of the carrier.

For the horizontal-run check, take the loop with vertices
`(0,−1), (1,0), (2,0), (3,1), (−2,1), (−2,−1)`. The rays from
`q = (0,−1/10)`, `(0,0)`, and `(0,1/10)` have exactly one counted crossing, at horizontal
coordinates `9/10`, `2`, and `21/10` respectively. Parity is `1` at all three heights,
including the height of the horizontal run. Also check a query on the carrier, where the
total function is `0`, and an interior query for the twice-traversed triangle, where the
two counted side occurrences give parity `0`.

**Natural intermediate results.** (i) polygonal chains and loops, sides, carriers, simplicity, the Jordan carrier, and renormalization; (ii) strips and the two-sidedness lemma; (iii) crossing parity, local constancy, and the integer winding number; (iv) polygonal Jordan separation; (v) the polygonal crosscut theorem; (vi) two ears and polygon triangulation; (vii) polygonal Schoenflies; (viii) nonplanarity of `K₃,₃` for polygonal drawings.

**Consequences.** Both tracks depend on this.

---

## Layer 2: Separation, crosscuts, and invariance of domain

The milestone of this layer is the crosscut theorem.

⚠ Component count is a corollary of separation, but not the primary objective. The statement `Nat.card (ConnectedComponents Jᶜ) = 2`, the form the [lean-eval](https://github.com/leanprover/lean-eval) problem states, is not sufficient for `ConformalMapping`'s length-area argument or this roadmap's layer 7.

**From layer 1.** The polygonal crosscut theorem, nonplanarity of `K₃,₃` for polygonal drawings, the integer winding number.
**From Tau Ceti.** `IsJordanCurve` and the arc theory in `TauCeti/Topology/JordanCurve/`; `filledHull`; `IsJordanDomain` (`Analysis/Complex/Conformal/Jordan/Domain.lean`); `TauCeti/Topology/{Continuum,LocallyConnected}.lean`; the contour winding number in `TauCeti/Analysis/Contour/Winding/`.

The crosscut and accessibility definitions belong here, before their theorems. A crosscut
includes both endpoints: it is an embedded closed arc with two distinct endpoints on `J`,
with every other point in `filledHull J \ J`. A point is accessible **from the inside** if
an embedded approach arc ends there and all its other points, including its starting point,
lie inside. These definitions use the existing interval, continuous-map, and embedding APIs;
they do not use Schoenflies. Reversing a crosscut parametrization preserves its carrier.
The basic API identifies its two boundary endpoints, proves compactness of the arc carrier,
and makes each endpoint accessible by taking a terminal subarc, with reversal when needed.
Relate the witness definition to layer 0's arc vocabulary: it is equivalent to `IsArc P`,
`endpoints P ⊆ J`, and `P \ endpoints P ⊆ filledHull J \ J`.

**Representative formal statements.**

```lean
namespace IsJordanCurve
/-- The bounded complementary side, used in the crosscut and accessibility conditions. -/
def inside {J : Set ℂ} (_hJ : TauCeti.IsJordanCurve J) : Set ℂ :=
  TauCeti.filledHull J \ J

/-- The unbounded complementary side. -/
def outside {J : Set ℂ} (_hJ : TauCeti.IsJordanCurve J) : Set ℂ :=
  (TauCeti.filledHull J)ᶜ

/-- A closed embedded arc with distinct endpoints on `J` and all other points on its inside. -/
def IsCrosscut (J P : Set ℂ) : Prop :=
  ∃ γ : C(unitInterval, ℂ), IsEmbedding γ ∧ Set.range γ = P ∧
    γ 0 ∈ J ∧ γ 1 ∈ J ∧ γ 0 ≠ γ 1 ∧
    ∀ t : unitInterval, t ≠ 0 → t ≠ 1 → γ t ∈ TauCeti.filledHull J \ J

/-- A boundary point reached by an embedded arc whose other points all lie on the inside. -/
def Accessible (J : Set ℂ) (p : ℂ) : Prop :=
  p ∈ J ∧ ∃ γ : C(unitInterval, ℂ), IsEmbedding γ ∧ γ 1 = p ∧
    ∀ t : unitInterval, t ≠ 1 → γ t ∈ TauCeti.filledHull J \ J

variable {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J)

theorem Accessible.mem {p : ℂ} (hp : Accessible J p) : p ∈ J
theorem IsCrosscut.exists_boundary_endpoints {P : Set ℂ} (hP : IsCrosscut J P) :
    ∃ a b : ℂ, a ∈ J ∧ b ∈ J ∧ a ≠ b ∧ P ∩ J = {a, b}

theorem isConnected_inside      : IsConnected hJ.inside
theorem isConnected_outside     : IsConnected hJ.outside
theorem isBounded_inside        : Bornology.IsBounded hJ.inside
theorem not_isBounded_outside   : ¬ Bornology.IsBounded hJ.outside
theorem frontier_inside         : frontier hJ.inside = J
theorem frontier_outside        : frontier hJ.outside = J

/-- Every point of the curve is a limit of inside points. -/
theorem subset_closure_inside (hJ : TauCeti.IsJordanCurve J) : J ⊆ closure (filledHull J \ J)

/-- The inside of a Jordan curve is a Jordan domain: the hypothesis Carathéodory's theorem takes. -/
theorem isJordanDomain_inside (hJ : TauCeti.IsJordanCurve J) : TauCeti.IsJordanDomain hJ.inside

/-- Library consequence of the Jordan-domain output, available in this layer. -/
example (hJ : TauCeti.IsJordanCurve J) : IsSimplyConnected hJ.inside :=
  (isJordanDomain_inside hJ).isSimplyConnected

/-- Accessible points are dense in `J`: their ambient closure equals `J`. -/
theorem closure_accessible (hJ : TauCeti.IsJordanCurve J) : closure {p | Accessible J p} = J

/-- The workhorse. -/
theorem crosscut (hJ : TauCeti.IsJordanCurve J) (P : Set ℂ) (hP : IsCrosscut J P) :
    ∃ J₁ J₂ : Set ℂ, TauCeti.IsJordanCurve J₁ ∧ TauCeti.IsJordanCurve J₂ ∧
      J₁ ∩ J₂ = P ∧ J₁ ∪ J₂ = J ∪ P ∧
      (TauCeti.filledHull J \ J) \ P =
        (TauCeti.filledHull J₁ \ J₁) ∪ (TauCeti.filledHull J₂ \ J₂) ∧
      Disjoint (TauCeti.filledHull J₁ \ J₁) (TauCeti.filledHull J₂ \ J₂)

/-- The corollary, including the shape used by lean-eval. -/
theorem card_connectedComponents (hJ : TauCeti.IsJordanCurve J) :
    Nat.card (ConnectedComponents ((J : Set ℂ)ᶜ)) = 2
end IsJordanCurve

/-- An arc does not separate. -/
theorem arc_not_separates (A : Set ℂ) (hA : IsArc A) : IsConnected (Aᶜ)

/-- No retraction of the disc onto its circle: the winding number of the identity of the circle is
    one, and would be zero if a retraction existed. -/
theorem not_exists_retraction_closedBall_sphere :
    ¬ ∃ r : C(Metric.closedBall (0 : ℂ) 1, Metric.sphere (0 : ℂ) 1),
      ∀ z : Metric.closedBall (0 : ℂ) 1, (z : ℂ) ∈ Metric.sphere (0 : ℂ) 1 → (r z : ℂ) = z

/-- Brouwer's fixed-point theorem in dimension two. -/
theorem brouwer₂ (f : C(Metric.closedBall (0 : ℂ) 1, Metric.closedBall (0 : ℂ) 1)) : ∃ z, f z = z

/-- Invariance of domain in dimension two, from Brouwer. -/
theorem invarianceOfDomain₂ {U : Set ℂ} (hU : IsOpen U) (f : C(U, ℂ)) (hf : Injective f) :
    IsOpen (Set.range f) ∧ IsOpenMap f

variable {M N : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]
  [TopologicalSpace N] [ChartedSpace (EuclideanHalfSpace 2) N] [T2Space N]

/-- Homeomorphisms of surfaces preserve the boundary; this is chart-independence of `∂M`. -/
theorem image_boundary (e : M ≃ₜ N) : e '' (𝓡∂ 2).boundary M = (𝓡∂ 2).boundary N

/-- The number of boundary components, a homeomorphism invariant by the preceding theorem. -/
noncomputable def boundaryComponentCount (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] : ℕ :=
  Nat.card (ConnectedComponents ((𝓡∂ 2).boundary M))
theorem boundaryComponentCount_congr (e : M ≃ₜ N) :
    boundaryComponentCount M = boundaryComponentCount N
```

**Mathematical route and formalization notes.**

- **The conformal interface.** Apply `TauCeti.IsJordanDomain.isSimplyConnected` (`TauCeti/Analysis/Complex/Conformal/Jordan/Domain.lean`) to `isJordanDomain_inside`. The Carathéodory declaration `TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier` (`Jordan/Approach.lean`) takes exactly the four Jordan-domain fields: openness, connectedness, boundedness, and a Jordan frontier. Layer 2 proves these fields by its elementary route for the inside of every Jordan curve, using the same interface as the existing separation theorems. This application uses no Layer 7 result; the Schoenflies development below follows its elementary geometric route.
- The order of development follows Thomassen. Approximate the paths that would have to cross the curve, not the curve itself, because Osgood gives an obstruction to curve approximation.  A curve can have positive measure (layer 0) whereas the crossing paths are compact arcs in an open set and are cheap to control. A hypothetical failure of separation, or a third complementary component, would result in a polygonal drawing of `K₃,₃`.
- Arc non-separation is proved by the chain-of-small-squares argument using the small-arc diameter bounds in `TauCeti/Topology/JordanCurve/SmallArc.lean`.
- ⚠ `invarianceOfDomain₂` is key. Without it neither `∂M` nor the boundary count is known to be a topological invariant of a surface. Its route needs nothing from the Jordan curve theorem: layer 1's integer winding number and its homotopy invariance show that the circle is not a retract of the disc, that gives Brouwer's fixed-point theorem by the usual construction of a retraction from a fixed-point-free map, and invariance of domain follows by the finite approximation argument of Kulpa (1998), pp. 127–129 and 132–133, with its auxiliary lemma constructed below. Neither step needs a regularity hypothesis on the paths: Tau Ceti's `windingNumber_eq_of_pathHomotopy` (`Analysis/Contour/Winding/Number/Homotopy.lean`) is invariance under continuous fixed-endpoint homotopies of piecewise-`C¹` paths, and a retraction `r` of the disc onto its circle contracts the standard loop `p` through `H s t = r ((1 - s) * p t + s)`, which is valued in the circle and fixes both endpoints since the disc is convex and `r 1 = 1`. AlgebraicTopology Stage 2, item 7 owns the dimension-general no-retraction and Brouwer interfaces; the plane proofs here use the shared specializations and the earlier winding-number calculation.

**The finite approximation input for invariance of domain.** Build Kulpa's plane
zero-avoidance lemma: for compact `X, Y ⊆ ℂ` with `interior Y = ∅`, continuous
`f : X → ℂ \ {0}`, and `ε > 0`, construct continuous
`F : X ∪ Y → ℂ \ {0}` within `ε` of `f` on `X`. Use coordinatewise Tietze extension,
affine interpolation on a fine finite triangular grid, and a small translation avoiding
the interpolant's image of `Y`. Each affine piece is invertible or has image in a line,
so that compact image has empty interior. This uses ordinary continuous-map
approximation before layer 4's homeomorphism approximation.

Transport disc Brouwer radially to the square; derive Poincaré–Miranda by coordinatewise
clipping. A point outside an embedded square but near its centre image then gives, by
radial pushing and the lemma applied to its inverse, a zero-free square map with the
forbidden opposite-face signs. The input lemma and deduction are explicit layer 2
targets (Kulpa, pp. 127–129, 132–133).

**Examples and mathematical checks.** `subset_closure_inside` is stated in the same form as `TauCeti/Topology/FilledHull.lean`. `isJordanDomain_inside` is checked against the constructors of `IsJordanDomain` from a ball and from a convex set, which it subsumes. `crosscut` is checked on a worked example where the two pieces are visibly different (an off-centre chord of a disc). Brouwer is exercised on a rotation of the disc, whose only fixed point is the centre, and `boundaryComponentCount` is computed for the closed disc, one, and the transported sphere, zero.

Crosscut checks in the unit disc: the real diameter is a crosscut, and so is the off-centre
chord joining `1` to `I`. A boundary semicircle fails interior containment; the segment from
`0` to `1` fails the two-boundary-endpoint condition; a singleton fails to be an embedded
arc with distinct endpoints. Check the exact identity `P ∩ J = {a, b}` in the positive cases.
For accessibility, the radial approaches to `1` and `I` are positive examples, while `0`
is not a boundary point. A path approaching `1` from outside the disc does not witness
accessibility from the inside. These checks precede the Schoenflies construction.

**Natural intermediate results.** (i) `inside`, `outside`, boundedness, and connectedness; (ii) the crosscut and interior-accessibility definitions, the endpoint and reversal API, and compactness of crosscut carriers; (iii) the common frontier and arc non-separation; (iv) accessibility of crosscut endpoints and density of accessible boundary points; (v) the crosscut theorem; (vi) the component count; (vii) no retraction, Brouwer, the finite-grid zero-avoidance lemma, Poincaré–Miranda, `invarianceOfDomain₂`, chart-independence of `∂M`, and the boundary count.

**Consequences.** An elementary proof comparison for `ConformalMapping` layer 5 through `isJordanDomain_inside`. Layer 7. `∂M` and the boundary count for the rest of this roadmap and for `SurfaceTopology`.

---

## Layer 3: The simplicial and piecewise-linear toolkit in dimension two

This layer develops everything the approximation theorem needs, built on Tau Ceti's existing API.

**From Tau Ceti.** `AbstractSimplicialComplex`, `Realization`, `link`, `closedStar`, `deletion`, barycentric subdivision and `barycentricSubdivisionRealizationHomeomorph`, `stellarSubdivision` and `StellarEquivalent`, `SimplicialMap`, `dimension`, the collapse API, `IsTriangulable`, `IsCombinatorialManifold`, `IsPLOn`.

**Representative formal statements.**

```lean
/-- A subdivision is data, not a proposition: the placement of the subdividing complex in the
    realization it refines. One abstract pair admits distinct placements (a path with three
    vertices subdivides an edge with its middle vertex at `1/3` or at `2/3`), and the maps that
    realize a function, fix a subcomplex, or carry a smooth structure depend on which placement
    was chosen, so the witness is kept and every consumer is stated against its `toHomeomorph`.
    The shape is Tau Ceti's `barycentricSubdivisionRealizationMap`
    (`AlgebraicTopology/SimplicialComplex/Subdivision/Realization.lean`): a vertex placement,
    extended affinely over each simplex. Heterogeneous in the vertex types. -/
structure Subdivision {ι' ι : Type*}
    (K' : AbstractSimplicialComplex ι') (K : AbstractSimplicialComplex ι) where
  /-- Where each vertex of `K'` lands in `|K|`. -/
  vertexImage : ι' → Realization K
  /-- The affine extension of `vertexImage`, which is a homeomorphism. -/
  toHomeomorph : Realization K' ≃ₜ Realization K
  toHomeomorph_vertex : ∀ v, toHomeomorph (vertex K' v) = vertexImage v
  /-- Each closed simplex of `K'` is carried affinely into a closed simplex of `K`. -/
  toHomeomorph_affine : ∀ σ : Face K', ∃ τ : Face K,
    toHomeomorph is affine on the closed simplex of σ with image in the closed simplex of τ   -- schematic

/-- The bare existence predicate, for statements that need some subdivision and no particular one. -/
abbrev Subdivides (K' : AbstractSimplicialComplex ι') (K : AbstractSimplicialComplex ι) : Prop :=
  Nonempty (Subdivision K' K)

def Subdivision.refl (K : AbstractSimplicialComplex ι) : Subdivision K K
def Subdivision.trans (s : Subdivision K'' K') (t : Subdivision K' K) : Subdivision K'' K
theorem Subdivision.trans_toHomeomorph (s : Subdivision K'' K') (t : Subdivision K' K) :
    (s.trans t).toHomeomorph = s.toHomeomorph.trans t.toHomeomorph
/-- Two subdivisions of one complex have a common refinement, and the two composites to `K` are
    the same homeomorphism. -/
theorem Subdivision.exists_common (s : Subdivision K₁ K) (t : Subdivision K₂ K) :
    ∃ (ι₃ : Type) (K₃ : AbstractSimplicialComplex ι₃) (u : Subdivision K₃ K₁) (v : Subdivision K₃ K₂),
      (u.trans s).toHomeomorph = (v.trans t).toHomeomorph

/-- Map the pre-complex of `K` along `some : ι → Option ι` and apply Tau Ceti's
    `stellarSubdivision` at the face `σ.image some`, with fresh vertex `none`; call the resulting
    pre-complex `P`. Define `K.stellarAt σ` on the actual vertex support
    `{v : Option ι // {v} ∈ P}`, with a finite set `τ` a face exactly when
    `τ.image Subtype.val ∈ P`. The placement sends `none` to the barycentre of `σ` and each
    surviving `some v` to the original vertex. A face is nonempty by Mathlib's convention,
    including when `σ` is a singleton; the removed vertex is absent from the support. -/
def Subdivision.stellar (hσ : σ ∈ K) : Subdivision (K.stellarAt σ) K
/-- Barycentric subdivision uses Tau Ceti's existing realization homeomorphism. -/
def Subdivision.barycentric (K : AbstractSimplicialComplex ι) : Subdivision K.barycentricSubdivision K
theorem Subdivision.barycentric_toHomeomorph (K : AbstractSimplicialComplex ι) :
    (Subdivision.barycentric K).toHomeomorph = barycentricSubdivisionRealizationHomeomorph K

-- Use the native continuous map `g.realizationMap`, with `realizationMap_val`,
-- `realizationMap_vertex`, `realizationMap_id`, and `realizationMap_comp`.
/-- `g` realizes `f` through two chosen subdivisions: the square `f ∘ s = t ∘ |g|` commutes. -/
def SimplicialRealizes (s : Subdivision K' K) (t : Subdivision L' L) (g : SimplicialMap K' L')
    (f : Realization K → Realization L) : Prop :=
  f ∘ s.toHomeomorph = t.toHomeomorph ∘ g.realizationMap

/-- Realizations of finite complexes are metrized by barycentric coordinates; the metric induces
    the existing topology, and it is what the approximation theorems measure with. -/
noncomputable def realizationDist (K : AbstractSimplicialComplex ι) [Finite K.faces] :
    Realization K → Realization K → ℝ
theorem realizationDist_inducesTopology (K : AbstractSimplicialComplex ι) [Finite K.faces] :
    TopologicalSpace.induced by `realizationDist` = the realization topology   -- schematic

def IsPLMap {K : AbstractSimplicialComplex ι} {L : AbstractSimplicialComplex κ}
    (f : Realization K → Realization L) : Prop :=
  ∃ (ι' κ' : Type) (K' : AbstractSimplicialComplex ι')
      (L' : AbstractSimplicialComplex κ')
      (s : Subdivision K' K) (t : Subdivision L' L) (g : SimplicialMap K' L'),
      SimplicialRealizes s t g f

theorem IsPLMap.comp : IsPLMap f → IsPLMap g → IsPLMap (g ∘ f)
/-- Subdivision homeomorphisms are PL and transport PL-ness, so a statement on `|K|` can be read on
    any chosen subdivision of `K`. -/
theorem Subdivision.isPLMap_toHomeomorph (s : Subdivision K' K) : IsPLMap s.toHomeomorph
theorem IsPLMap.comp_subdivision (s : Subdivision K' K) : IsPLMap f → IsPLMap (f ∘ s.toHomeomorph)

/-- A PL homeomorphism becomes a simplicial isomorphism after subdividing source and target, and
    the isomorphism realizes it through the two chosen subdivisions. -/
theorem exists_isomorphic_subdivisions
    (h : Realization K ≃ₜ Realization L) (hPL : IsPLMap h) :
    ∃ (ι' κ' : Type) (K' : AbstractSimplicialComplex ι')
      (L' : AbstractSimplicialComplex κ')
      (s : Subdivision K' K) (t : Subdivision L' L) (e : K' ≃ₛ L'),
      SimplicialRealizes s t e.toSimplicialMap h

/-- Concrete, not an instance of a dimension-general recursion. Every facet is a triangle, which is
    purity in dimension two and admits the empty complex: the empty surface is a surface, and
    `IsCombinatorialManifold K 2` holds for it vacuously, so the comparison below is unconditional. -/
def IsCombinatorialSurface (K : AbstractSimplicialComplex ι) : Prop :=
  K.faces.Finite ∧ (∀ σ ∈ K.facets, σ.card = 3) ∧
    (∀ e ∈ K.faces, e.card = 2 → 1 ≤ (K.trianglesContaining e).card ∧
       (K.trianglesContaining e).card ≤ 2) ∧
    (∀ v ∈ K.vertices, IsCombinatorialCircle (K.link v) ∨ IsCombinatorialArc (K.link v))

def IsClosedCombinatorialSurface (K : AbstractSimplicialComplex ι) : Prop :=
  IsCombinatorialSurface K ∧ ∀ v ∈ K.vertices, IsCombinatorialCircle (K.link v)

/-- The realization of a combinatorial surface is a compact surface: the structure itself, not an
    existence statement, with its boundary the carrier of the boundary subcomplex. -/
def IsCombinatorialSurface.realizationChartedSpace (h : IsCombinatorialSurface K) :
    ChartedSpace (EuclideanHalfSpace 2) (Realization K)
theorem IsCombinatorialSurface.compactSpace_realization (h : IsCombinatorialSurface K) :
    CompactSpace (Realization K)
theorem IsCombinatorialSurface.boundary_realization (h : IsCombinatorialSurface K) :
    (𝓡∂ 2).boundary (Realization K) = carrier of the boundary subcomplex   -- schematic

/-- Compatibility with Tau Ceti's stellar-equivalence definition. -/
theorem isCombinatorialSurface_iff_isCombinatorialManifold_two :
    IsCombinatorialSurface K ↔ K.faces.Finite ∧ IsCombinatorialManifold K 2

/-- The plane notion and the simplicial notion agree on complexes realized affinely as polyhedra
    `P`, `Q` in the plane. -/
theorem isPLMap_iff_isPLOn (e : Realization K ≃ₜ P) (e' : Realization L ≃ₜ Q)
    (he : affine on each simplex) (he' : affine on each simplex) (f : Realization K → Realization L) :
    IsPLMap f ↔ IsPLOn (e' ∘ f ∘ e.symm) P
```

**Mathematical route and formalization notes.**

- A subdivision may introduce vertices, so its vertex type cannot be fixed in advance. The shared API must therefore be heterogeneous or bundle the subdividing complex.  A similar issue affects combinatorial surface move relations, and is solved by bundling index types.
- Stellar subdivision is defined for every nonempty face, including a singleton. Its result is an `AbstractSimplicialComplex` on the support of the resulting pre-complex, rather than on all of `Option ι`. Starring `{v}` removes `some v` and replaces it by `none`, including in every incident face; starring an edge or triangle retains its old vertices and introduces `none`. The support-reindexing API includes the face correspondence above and preservation of finite faces. The stellar realization homeomorphism is a target of this layer, with the specified affine placement.
- The common-subdivision theorem in this layer starts with a **PL** homeomorphism (or, equivalently, two PL triangulations of one polyhedron). Its conclusion is best stated as subdivisions of the two complexes together with a simplicial isomorphism. The two-dimensional Hauptvermutung in layer 5 is the deeper theorem that starts with an arbitrary topological homeomorphism and produces such a PL comparison. Keeping these two statements separate exposes a genuine mathematical distinction which could be hidden by a convenient choice of vertex types.
- The compatibility theorem with Tau Ceti's `IsCombinatorialManifold K 2` is proved here: a finite complex whose vertex links are circles or arcs is one whose vertex links are stellar equivalent to the boundary of a triangle or to a triangle, and conversely. No dimension-two result depends on it.
- Tau Ceti already has stellar subdivision with `StellarEquivalent`, and the homeomorphism between the realizations of a complex and its barycentric subdivision. `Subdivision` is the general notion both instantiate, and it is data: the realization homeomorphism is a field, fixed by the vertex placement, not something extracted from a proof, because layer 4's relative approximation, layer 8's smoothing, and `SimplicialRealizes` all depend on which placement was chosen. Simplicial maps use the native `realizationMap`, whose coordinates add the weights of vertices with the same image; its identity, composition, and vertex laws are imported from `Realization/Map.lean`.
- `GeometricTopology` layer 11 owns the dimension-general reconciliation of combinatorial manifolds with PL chart structures. The additional comparison here, `isPLMap_iff_isPLOn`, concerns a specified map between finite polyhedra affinely realized in the plane: it identifies the subdivision-based map predicate with the native local polyhedral predicate. Its forward implication uses `Geometry.SimplicialComplex.isPLOn_of_locallyFinite` (`Topology/PL/Simplicial.lean`); the reverse refines a finite polyhedral cover into triangles. The circle/arc link construction of surface charts is the direct dimension-two proof.
- The realization of a finite complex is metrized by its barycentric coordinates. This metric is what layer 4's `ε` and layer 7's small-cell estimates measure with; no metric on realizations exists in Tau Ceti.
- Combinatorial circles and arcs in dimension one are concrete: a combinatorial circle is a finite connected 1-complex in which every vertex has exactly two neighbours; a combinatorial arc is a finite connected 1-complex in which exactly two vertices have one neighbour and the rest have two. These should not be based on a general sphere-recognition recursion.

**Examples and mathematical checks.** `IsCombinatorialSurface` is **false** for each of: two triangles sharing exactly one vertex; three triangles sharing an edge; the dunce hat; the cone on a theta graph. It is **true** for: the boundary of the tetrahedron; a triangulated disc; a triangulated Möbius band; and the empty complex, the empty surface. Every one of these is a concrete finite complex checked by `decide`. ⚠ This is the layer where vacuity is a risk, because pinch points are possible for abstract complexes.

Stellar subdivision checks: (i) starring the only vertex of a one-vertex complex leaves one
vertex, `none`, and a realization homeomorphic to a point; (ii) starring a single edge at that
edge yields two edges meeting at `none`, with both endpoints retained; (iii) starring a filled
triangle at that triangle yields three triangles meeting at `none`, with the boundary fixed by
the realization homeomorphism. No isolated copy of a removed vertex is added.

**Natural intermediate results.** (i) general subdivision as data with its realization homeomorphism, stellar and barycentric subdivision as instances, composition and common refinement, and the realization of a simplicial map; (ii) the metric on a finite realization; (iii) purity, facets, and skeleta; (iv) isomorphic subdivisions for PL-homeomorphic complexes; (v) `IsPLMap` and its closure properties; (vi) combinatorial circles and arcs; (vii) `IsCombinatorialSurface` and the counter-witness battery; (viii) the realization theorem; (ix) the compatibility theorem with `IsCombinatorialManifold`; (x) the comparison of `IsPLOn` with `IsPLMap`.

**Consequences.** Layers 4, 5, 6. `SurfaceTopology` layer 3.

---

## Layer 4: The piecewise-linear approximation theorem

Moise's PL approximation theorem is the central theorem of the piecewise-linear track. Its local form approximates a homeomorphism between open planar regions, including the boundary-preserving half-plane case, by a PL homeomorphism with a prescribed local error bound. The familiar compact statement for a homeomorphism between triangulated surfaces is a corollary.

This is the main technical engine for both Radó's theorem and the Hauptvermutung.

**From layers 1 and 3.** Polygonal Schoenflies, general position for polygonal arcs, subdivision, `IsPLMap`.

The local model is `E = EuclideanSpace ℝ (Fin 2)`, identified with `ℂ` by layer 0.
Write `H = {x : E | 0 ≤ x 0}` for the closed half-plane and `B = {x : E | x 0 = 0}`
for its boundary line. This is Mathlib's `EuclideanHalfSpace 2` model. An
`OpenPartialHomeomorph E E` supplies its open source and target as well as the map and inverse.
For relative-open subsets of `H`, first construct the reflection extension across `B` of a
boundary-preserving homeomorphism; this gives an ambient open partial homeomorphism with
the half-plane and boundary properties below. Reflect the error function as well, preserving
its local positive lower bounds, and restrict the approximation back to `H`.

The error function `φ` has a **locally positive lower bound**: at each source point there
are a positive real `c` and a neighbourhood within the source on which `c ≤ φ`. No
continuity of `φ` is required. The displayed filter condition states this directly, using
Mathlib's neighbourhoods within a set. Positive continuous functions and positive constants
satisfy it; pointwise positivity alone is insufficient.

**Representative formal statements.**

```lean
local notation "E" => EuclideanSpace ℝ (Fin 2)
local notation "H" => (fun x : E => 0 ≤ x 0)
local notation "B" => (fun x : E => x 0 = 0)

/-- Local plane form, with the same open source and target. Values of `φ` outside the source
    play no role. Piecewise linearity here is the existing ambient-space predicate. -/
theorem exists_pl_approximation_open
    (f : OpenPartialHomeomorph E E) (φ : E → ℝ)
    (hφ : ∀ x ∈ f.source, ∃ c : ℝ, 0 < c ∧ ∀ᶠ y in 𝓝[f.source] x, c ≤ φ y) :
    ∃ g : OpenPartialHomeomorph E E,
      g.source = f.source ∧ g.target = f.target ∧
      TauCeti.IsPLOn g g.source ∧ TauCeti.IsPLOn g.symm g.target ∧
      ∀ x ∈ f.source, dist (f x) (g x) < φ x

/-- Boundary-preserving half-plane form, after reflection extension to the ambient plane. -/
theorem exists_pl_approximation_halfPlane
    (f : OpenPartialHomeomorph E E)
    (hH : f '' (f.source ∩ H) = f.target ∩ H)
    (hB : f '' (f.source ∩ B) = f.target ∩ B)
    (φ : E → ℝ)
    (hφ : ∀ x ∈ f.source, ∃ c : ℝ, 0 < c ∧ ∀ᶠ y in 𝓝[f.source] x, c ≤ φ y) :
    ∃ g : OpenPartialHomeomorph E E,
      g.source = f.source ∧ g.target = f.target ∧
      TauCeti.IsPLOn g g.source ∧ TauCeti.IsPLOn g.symm g.target ∧
      g '' (g.source ∩ H) = g.target ∩ H ∧
      g '' (g.source ∩ B) = g.target ∩ B ∧
      ∀ x ∈ f.source, dist (f x) (g x) < φ x

/-- Compact global form. -/
theorem exists_pl_approximation {K : AbstractSimplicialComplex ι}
    {L : AbstractSimplicialComplex κ}
    (hK : IsCombinatorialSurface K) (hL : IsCombinatorialSurface L)
    (f : Realization K ≃ₜ Realization L) (ε : ℝ) (hε : 0 < ε) :
    ∃ g : Realization K ≃ₜ Realization L, IsPLMap g ∧ ∀ x, realizationDist L (f x) (g x) < ε

/-- Relative compact form. An injective simplicial map presents the chosen subcomplex;
    the restriction of `f` to it is PL, and the approximation agrees there pointwise. -/
theorem exists_pl_approximation_rel
    {ι κ ιA : Type*} {K : AbstractSimplicialComplex ι} {L : AbstractSimplicialComplex κ}
    {KA : AbstractSimplicialComplex ιA}
    (hK : IsCombinatorialSurface K) (hL : IsCombinatorialSurface L)
    (f : Realization K ≃ₜ Realization L)
    (iA : SimplicialMap KA K) (hiA : Function.Injective iA)
    (hf : IsPLMap (f ∘ iA.realizationMap)) (ε : ℝ) (hε : 0 < ε) :
    ∃ g : Realization K ≃ₜ Realization L,
      IsPLMap g ∧ IsPLMap g.symm ∧
      (∀ a : Realization KA, g (iA.realizationMap a) = f (iA.realizationMap a)) ∧
      ∀ x, realizationDist L (f x) (g x) < ε
```

**Mathematical route and formalization notes.**

- The proof first approximates the image of the 1-skeleton by a polygonal embedding and then extends across each 2-simplex by polygonal Schoenflies. The locally positive lower bound supplies a positive working margin in each neighbourhood, while allowing the error to tend to zero towards the boundary or infinity of a noncompact open source. This is the local control needed in Radó's inductive construction.
- The relative form is needed for surfaces with boundary and for the isotopy statement in layer 8. The image of an injective simplicial map is the specified subcomplex, on its actual vertex support. The PL condition on `f ∘ iA.realizationMap` is a map from the source complex `KA` into `L`, so it includes the data needed to leave that restriction fixed. The local forms also include relative versions: a closed, locally finite polyhedral subcomplex of the source on which `f` is already PL is kept fixed, with the same local error condition. Include the boundary-line case used when gluing the half-plane approximation.
- The argument uses polygonal Schoenflies, but it does not need the topological Schoenflies theorem or the tameness results of layer 7.
- The half-plane form is what layer 5's boundary case consumes. Construct the reflection extension and the boundary-line PL approximation first, then approximate the two sides with that common boundary approximation and glue. The output preserves both `H` and `B`; restrict it to the original relative-open half-plane source. This uses only the planar and interval arguments of the preceding layers.

**Examples and mathematical checks.** The approximation is exhibited on a worked example where the original homeomorphism is not piecewise linear (a radial map with a non-linear radial profile). The epsilon is checked to be achievable for arbitrarily small values, that is, the statement is not accidentally vacuous by allowing `g = f`.

Error-bound checks: (i) `φ = ε` for `ε > 0` satisfies the local condition; (ii)
`φ(x) = 1 / (1 + ‖x‖)` on the full plane satisfies it despite having no positive global
lower bound; (iii) a discontinuous function taking only the values `1` and `2` satisfies it.
As a negative control on the square, set `φ = 1/q` at a reduced rational first coordinate
`p/q` and `φ = 1` at irrational first coordinates. It is positive everywhere but has no
positive lower bound on any neighbourhood. Requiring a continuous approximation within
this bound forces it to agree with the original map everywhere, so it cannot approximate
the non-PL homeomorphism `(x, y) ↦ (x³, y)` by a PL one. The repaired hypothesis excludes it.

For the half-plane form, check both the boundary line and the interior half-plane after
restriction. In the relative form, the empty subcomplex recovers unrestricted approximation;
the whole complex with a PL `f` allows `g = f`; and a fixed boundary subcomplex stays fixed
pointwise throughout the approximation.

**Natural intermediate results.** (i) the local positive-lower-bound condition and its constant, continuous, and discontinuous checks; (ii) the local plane approximation theorem; (iii) general position and polygonal approximation of the 1-skeleton; (iv) the mesh-refinement construction; (v) correction on the 1-skeleton; (vi) filling triangles by polygonal Schoenflies; (vii) reflection extension, boundary-line approximation, and the half-plane theorem; (viii) the compact and relative forms.

---

## Layer 5: Radó's theorem and the two-dimensional Hauptvermutung

This layer shows combinatorial invariants are topological.

⚠ **Neither of these depends on the Schoenflies theorem.** Moise makes this point immediately after his triangulation theorem.  The usual derivation from Schoenflies "is in a way misleading", since in dimension three Schoenflies fails and triangulation still holds.

**From layers 0, 3, and 4.** Alexander's trick in its topological and PL forms, `Subdivides`, `IsPLMap`, the local and relative approximation theorems.

**Representative formal statements.**

```lean
variable {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]
  [CompactSpace M]

/-- Radó. Every compact surface, with or without boundary, is the realization of a finite
    combinatorial surface, with the boundary a subcomplex. -/
theorem exists_combinatorialSurface_homeomorph :
    ∃ (ι : Type) (K : AbstractSimplicialComplex ι), IsCombinatorialSurface K ∧
      ∃ e : Realization K ≃ₜ M, e '' (carrier of the boundary subcomplex) = (𝓡∂ 2).boundary M

/-- The weak form that Tau Ceti's `IsTriangulable` states, as a corollary. -/
theorem isTriangulable_of_compactSurface : IsTriangulable M

/-- Every boundary component of a compact surface is a circle. -/
theorem isJordanCurve_of_mem_connectedComponents_boundary
    (C : Set M) (hC : C is a connected component of (𝓡∂ 2).boundary M) : IsJordanCurve C

/-- The topological collar, a corollary of triangulation with boundary. -/
theorem isCollared_boundary : IsCollared (Subtype.val : (𝓡∂ 2).boundary M → M)

/-- The two-dimensional Hauptvermutung. -/
theorem hauptvermutung₂ {K : AbstractSimplicialComplex ι}
    {L : AbstractSimplicialComplex κ}
    (hK : IsCombinatorialSurface K) (hL : IsCombinatorialSurface L)
    (h : Realization K ≃ₜ Realization L) :
    ∃ (ι' κ' : Type) (K' : AbstractSimplicialComplex ι')
      (L' : AbstractSimplicialComplex κ'),
      Subdivides K' K ∧ Subdivides L' L ∧ Nonempty (K' ≃ₛ L')

/-- The consequence that makes it useful. -/
theorem hauptvermutung₂_isPL {K L} (hK : IsCombinatorialSurface K)
    (hL : IsCombinatorialSurface L) (h : Realization K ≃ₜ Realization L) :
    ∃ g : Realization K ≃ₜ Realization L, IsPLMap g ∧ IsPLMap g.symm

/-- The sharp form, on a given homeomorphism: every homeomorphism of compact triangulated
    surfaces is isotopic to a PL homeomorphism, and rel a subcomplex on which it is already PL.
    It is layer 4's relative approximation theorem followed by Alexander's trick, and
    `hauptvermutung₂_isPL` is its corollary. Layer 6's orientations and layer 8's comparison of
    categories both spend it. -/
theorem exists_isotopic_plHomeomorph {K L} (hK : IsCombinatorialSurface K)
    (hL : IsCombinatorialSurface L) (f : Realization K ≃ₜ Realization L) :
    ∃ g : Realization K ≃ₜ Realization L, IsPLMap g ∧ IsPLMap g.symm ∧ Isotopic f g
theorem exists_isotopicRel_plHomeomorph {K L} (hK : IsCombinatorialSurface K)
    (hL : IsCombinatorialSurface L) (f : Realization K ≃ₜ Realization L)
    {ιA : Type*} {KA : AbstractSimplicialComplex ιA}
    (iA : SimplicialMap KA K) (hiA : Function.Injective iA)
    (hf : IsPLMap (f ∘ iA.realizationMap)) :
    ∃ g : Realization K ≃ₜ Realization L, IsPLMap g ∧ IsPLMap g.symm ∧
      IsotopicRel (Set.range iA.realizationMap) f g

/-- Pachner's theorem in dimension two: triangulations with a common subdivision are related by
    the bistellar moves `1 ↔ 3` and `2 ↔ 2`, and, for surfaces with boundary, by those together with
    the boundary moves, relative to the boundary. An isomorphism of the bundled complex is
    itself an allowed step; inverse bistellar moves are included. -/
inductive BistellarMove : BundledCombinatorialSurface → BundledCombinatorialSurface → Prop
  | oneThree : ...
  | twoTwo : ...
  | boundary : ...

theorem pachner₂ {K L} (hK : IsCombinatorialSurface K) (hL : IsCombinatorialSurface L)
    (h : ∃ (ι' : Type) (K' : AbstractSimplicialComplex ι'), Subdivides K' K ∧ Subdivides K' L) :
    Relation.ReflTransGen (fun A B => surfaceIsoSetoid.r A B ∨ BistellarMove A B)
      ⟨K, hK⟩ ⟨L, hL⟩
```

**Mathematical route and formalization notes.**

- Radó's construction grows an already triangulated region across a countable chart cover. On each overlap, the **local** form of the approximation theorem replaces a topological coordinate change by a controlled PL homeomorphism; this is the point at which the approximation theorem enters the triangulation proof.
- The boundary case runs the same construction in half-plane charts, carrying the boundary along as a subcomplex at every stage: layer 4's local theorem is applied in its half-plane form, the polygonal replacement of chart boundaries preserves the boundary line, and the exposed boundary faces survive subdivision, relabelling, and gluing. No collar is used. The topological collar is then a corollary: a triangulated surface with boundary has a combinatorial collar, and `IsCollared` in Tau Ceti's sense follows by realization. Tau Ceti's `Boundary/Collar/` files supply the chart vocabulary and smooth collars only.
- Every boundary component is a circle because the boundary subcomplex is a combinatorial 1-manifold, hence a disjoint union of combinatorial circles.
- Pachner's theorem is what turns "invariant under the elementary moves" into "topological invariant": with the Hauptvermutung it says that triangulations of homeomorphic compact surfaces are related by bistellar moves. Its proof runs through the common subdivision: its vertices are inserted by `1 → 3` moves and flips, and two triangulations of a disc on the same vertex set are flip-connected.
- Isotopy to a PL homeomorphism is the relative approximation theorem followed by Alexander's trick: a fine enough PL approximation of `f` differs from `f` by a map that is small on each triangle, and coning fills each triangle with an isotopy. The rel form keeps a subcomplex fixed throughout, which is what surfaces with boundary and `SurfaceTopology` layer 9 need.
- Locally finite triangulations of second-countable noncompact surfaces are built only insofar as the compact proof needs them, and the general noncompact Radó is out of scope.

**Examples and mathematical checks.** A triangulation is produced for a surface presented only by charts, with no combinatorial data supplied. For the Hauptvermutung, the tetrahedral and octahedral triangulations of the sphere are refined to isomorphic subdivisions; the example is stated in the same two-subdivision form as the theorem. Pachner's theorem is checked on the tetrahedral and octahedral spheres by exhibiting a move sequence.

**Natural intermediate results.** (i) finite chart covers and shrinking; (ii) polygonal replacement of chart boundaries; (iii) assembly and Radó, closed case; (iv) boundary circles and the collar, as corollaries; (v) Radó with boundary; (vi) the Hauptvermutung; (vii) Pachner's theorem; (viii) isotopy to a PL homeomorphism, absolute and rel a subcomplex.

**Consequences.** Layer 6, layer 8, `GeometricTopology` layer 11, `SurfaceTopology` throughout.

---

## Layer 6: The Euler characteristic and orientability

The invariants that `SurfaceTopology` runs on: the Euler characteristic, orientability, and a chosen orientation. Each is defined on a finite combinatorial surface, proved invariant under subdivision and isomorphism, and carried to the surface by Radó and the Hauptvermutung. The orientation double cover is constructed here before it is used to transport orientations through an isotopy. The boundary count, the third invariant of the classification, is layer 2's.

**From layers 2, 3, and 5.** `boundaryComponentCount`, `Subdivides`, `IsCombinatorialSurface`, Radó, the Hauptvermutung, Pachner, isotopy to a PL homeomorphism.
**From Mathlib.** Covering maps and their elementary path- and homotopy-lifting API:
`IsCoveringMap.liftPath`, `IsCoveringMap.liftHomotopy`, `IsCoveringMap.liftHomotopy_lifts`,
`IsCoveringMap.liftHomotopy_zero`, and `IsCoveringMap.eq_liftHomotopy_iff'`, in
`Mathlib/Topology/Homotopy/Lifting.lean`.

**Representative formal statements.**

```lean
/-- The alternating sum over all faces, of every dimension. A sum over `Fin 3` is wrong for a
    complex of dimension three: the full tetrahedron would give `4 - 6 + 4 = 2` and its barycentric
    subdivision `15 - 50 + 60 = 25`. -/
def AbstractSimplicialComplex.eulerChar (K : AbstractSimplicialComplex ι) [Finite K.faces] : ℤ :=
  ∑ σ : Face K, (-1 : ℤ) ^ (σ.1.card - 1)

/-- On a combinatorial surface it is vertices minus edges plus triangles. -/
theorem eulerChar_eq_of_isCombinatorialSurface (hK : IsCombinatorialSurface K) :
    K.eulerChar = (K.facesOfDim 0).card - (K.facesOfDim 1).card + (K.facesOfDim 2).card

/-- Invariance under subdivision, in dimension at most two, the only case this roadmap proves. -/
theorem eulerChar_subdivision (hK : K.dimension ≤ 2) (h : Subdivides K' K) : K'.eulerChar = K.eulerChar
theorem eulerChar_simplicialIso (h : K ≃ₛ L) : K.eulerChar = L.eulerChar

/-- A coherent orientation: a cyclic order on each triangle such that the two triangles on an
    interior edge induce opposite directions on it. -/
structure Orientation (K : AbstractSimplicialComplex ι) (hK : IsCombinatorialSurface K) where ...
def IsOrientable (K : AbstractSimplicialComplex ι) (hK : IsCombinatorialSurface K) : Prop :=
  Nonempty (Orientation K hK)

theorem isOrientable_subdivision (h : Subdivides K' K) : IsOrientable K' hK' ↔ IsOrientable K hK
theorem isOrientable_simplicialIso (h : K ≃ₛ L) : IsOrientable K hK ↔ IsOrientable L hL

/-- Finite simplicial data for the orientation cover. The construction uses the two oriented
    copies of each triangle, glued across a shared edge when their induced edge directions
    are opposite. The link condition verifies the gluing at vertices, including boundary vertices. -/
structure SimplicialOrientationCover (K : AbstractSimplicialComplex ι) where
  vertexType : Type
  complex : AbstractSimplicialComplex vertexType
  isSurface : IsCombinatorialSurface complex
  projection : SimplicialMap complex K
  orientation : Orientation complex isSurface
  deck : complex ≃ₛ complex

def orientationDoubleCover (hK : IsCombinatorialSurface K) : SimplicialOrientationCover K
/-- The projection has an evenly covered disc or half-disc neighbourhood at every base point. -/
theorem orientationDoubleCover_isCovering (hK : IsCombinatorialSurface K) :
    let C := orientationDoubleCover hK
    IsCoveringMap C.projection.realization
theorem orientationDoubleCover_fiber_card (hK : IsCombinatorialSurface K) (x : Realization K) :
    let C := orientationDoubleCover hK
    Nat.card {y : Realization C.complex // C.projection.realization y = x} = 2

variable {M N : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]
  [CompactSpace M] [TopologicalSpace N] [ChartedSpace (EuclideanHalfSpace 2) N] [T2Space N]
  [CompactSpace N]

/-- Well defined by Radó, invariant by the Hauptvermutung. -/
noncomputable def Surface.eulerChar (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M] [CompactSpace M] : ℤ
theorem Surface.eulerChar_congr (h : M ≃ₜ N) : Surface.eulerChar M = Surface.eulerChar N

/-- Likewise. -/
def Surface.IsOrientable (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M] [CompactSpace M] : Prop
theorem Surface.isOrientable_congr (h : M ≃ₜ N) : Surface.IsOrientable M ↔ Surface.IsOrientable N

/-- A chosen orientation of a surface: an oriented triangulation modulo agreement, where two agree
    when a PL homeomorphism isotopic to their comparison map carries one orientation to the other.
    Layer 5's `exists_isotopic_plHomeomorph` supplies such a map for any two triangulations, and
    the isotopy lemma below says the sign does not depend on which one is taken. -/
def Surface.Orientation (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M] [CompactSpace M] : Type
def Surface.Orientation.map (e : M ≃ₜ N) : Surface.Orientation M ≃ Surface.Orientation N
theorem Surface.Orientation.map_of_isotopic (e e' : M ≃ₜ N) (h : Isotopic e e') :
    Surface.Orientation.map e = Surface.Orientation.map e'
theorem Surface.card_orientation [ConnectedSpace M] (h : Surface.IsOrientable M) :
    Nat.card (Surface.Orientation M) = 2
/-- The direction each boundary circle inherits: the surface lies to its left. -/
def Surface.Orientation.boundary (o : Surface.Orientation M) :
    ∀ C, C is a component of (𝓡∂ 2).boundary M → orientation of the circle C   -- schematic

theorem eulerChar_sphere : Surface.eulerChar (Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1) = 2
theorem eulerChar_disc  : Surface.eulerChar (Metric.closedBall (0 : ℂ) 1) = 1
theorem isOrientable_sphere : Surface.IsOrientable (Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1)
```

**Mathematical route and formalization notes.**

- ⚠ Classification of surfaces is downstream of this, so we do not prove topological invariance of the cell count by appealing to that. Invariance comes from subdivision invariance and the Hauptvermutung.
- Define `eulerChar` and `IsOrientable` on complexes first, then transport. Each surface-level definition is `Classical.choice` over triangulations plus the invariance theorem.
- For surfaces, prove invariance by direct cell counts: a `1 → 3` triangle move changes `(V, E, F)` by `(1, 3, 2)`, a `2 ↔ 2` flip leaves all three counts unchanged, and subdividing a boundary edge changes them by `(1, 2, 1)`. Each preserves `V - E + F`; Pachner's theorem then gives invariance across triangulations of a surface. Homology ranks are not used to define or prove invariance of this Euler characteristic.
- **Construct the orientation cover first.** Take both cyclic orientations of every triangle and glue copies along an interior edge precisely when their induced edge directions are opposite. The resulting finite simplicial complex projects to the original one and carries the tautological orientation of its triangle copies. Swapping the two orientations is a fixed-point-free simplicial involution, reverses that orientation, and commutes with projection; its orbits are exactly the fibres. Prove that every base face has exactly two lifts. At a vertex the circle-or-arc link condition supplies two disc or half-disc neighbourhoods, so the projection is a two-sheeted covering also at boundary points. Its boundary is exactly the inverse image of the base boundary, and each boundary circle has two lifts, each mapping homeomorphically to it.
- **Comparison and orientation transport.** Construct the cover identifications induced by simplicial isomorphisms and subdivisions, prove that they commute with projection and the deck involution, and prove their composition laws. Define local orientation transport by cyclic order in disc or half-disc neighbourhoods, prove agreement with transport of oriented triangles for PL maps, and prove continuity for an isotopy. Combine these comparisons with the sharp isotopy-to-PL theorem and the lifting argument below to identify covers over the actual comparison map between triangulations, proving independence of a chosen triangulation. For a connected orientable surface the two components of the cover are its two global orientations; for a connected nonorientable surface the cover is connected and there is no global orientation. This constructs the orientation transport used below without a homological definition of local orientation.
- An orientation is data. Comparing two oriented triangulations uses layer 5's `exists_isotopic_plHomeomorph`. For isotopy invariance, lift `(t, x) ↦ f_t(p(x))` through the target orientation cover, starting from the orientation lift of `f_0`, using `IsCoveringMap.liftHomotopy`. Its projection, initial value, and uniqueness are supplied by the cited Mathlib lemmas; lifting the inverse isotopy verifies that the lifted slices are homeomorphisms. The local-orientation transport theorem identifies the endpoint lifts with those of the endpoint PL maps. Consequently isotopic maps act identically on global orientations, which makes the quotient defining `Surface.Orientation` and its map independent of the PL approximation. Prove these comparisons before `Surface.Orientation.map_of_isotopic`. Layer 8 uses the same lemma.
- **The boundary convention.** An oriented triangle directs its edges, and on a boundary circle the directions agree, so an orientation of `M` directs each boundary circle. The convention is that the surface lies to the left of the direction, so the unit disc's boundary runs counterclockwise. `SurfaceTopology`'s capping, doubling, and mapping-class conventions read this one.
- **General principle of both roadmaps.** Every invariant is defined on a finite presentation, proved invariant under subdivision and the elementary moves, and upgraded to a homeomorphism invariant by the Hauptvermutung, or by Pachner's theorem when only invariance under the moves is at hand. There is no comparison theorem with Mathlib's singular homology or fundamental group here or in `SurfaceTopology`.

**Examples and mathematical checks.** On concrete finite complexes, `eulerChar` reduces to an explicit alternating sum. It computes 2 for the tetrahedron boundary, 2 for the octahedron boundary, 1 for a triangulated disc, 0 for a triangulated annulus, 0 for a triangulated Möbius band. `eulerChar_subdivision` is checked against a barycentric subdivision of the tetrahedron boundary, where the face counts change and the alternating sum does not. Orientability is decided by `decide` on the tetrahedron boundary and on a triangulated Möbius band, and the two orientations of the tetrahedron boundary are exhibited. The disc's Euler characteristic is computed on the surface structure of layer 0.

Orientation-cover checks: the cover of a triangulated disc is two disjoint triangulated
discs; that of a triangulated Möbius band is a connected annulus, with two points over every
base point and two boundary circles; that of a triangulated sphere is two disjoint spheres.
Check the covering projection and the orientation-reversing deck involution in each case.
These checks are proved directly from the finite gluings and their realizations, before
surface classification. The Möbius-band case distinguishes this cover from a trivial product.

**Natural intermediate results.** (i) `eulerChar` on finite complexes and its effective computation; (ii) subdivision invariance; (iii) isomorphism invariance; (iv) the surface-level definition and transport; (v) the worked example table; (vi) orientability on complexes and its invariance; (vii) the simplicial orientation cover, its deck involution, covering theorem, and boundary behaviour; (viii) comparison under isomorphism and subdivision, and local orientation transport with its isotopy-lifting theorem; (ix) `Surface.IsOrientable` and `Surface.Orientation`, with the isotopy lemma and the boundary convention.

**Consequences.** Layer 8. `SurfaceTopology` layers 3, 5, 7, 8, and 9.

---

## Layer 7: The Schoenflies theorem and tameness

Schoenflies gives local flatness for embedded circles and arc interiors lying in the interior of a surface. Arc endpoints have half-line slices. Finite embedded graphs are tame, with finite planar stars at their vertices and a point at an isolated vertex. These are the dimension-two results supplied to `GeometricTopology` and `SurfaceTopology`.

**From layers 0 and 2.** Alexander's trick, `IsotopicRel`, the crosscut theorem, accessibility, `isJordanDomain_inside`.
**From layers 3 and 5.** `IsCombinatorialSurface`, `Subdivides`, and Radó: the tameness of finite graphs concludes with a triangulation of the surface, so it is downstream of both.

**Representative formal statements.**

```lean
theorem schoenflies {J : Set ℂ} (hJ : IsJordanCurve J) :
    ∃ h : ℂ ≃ₜ ℂ, h '' J = Metric.sphere 0 1

theorem schoenflies_closure {J : Set ℂ} (hJ : IsJordanCurve J) :
    Nonempty (closure hJ.inside ≃ₜ Metric.closedBall (0 : ℂ) 1)

local notation "S²" => Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1
theorem schoenflies_sphere {J : Set S²} (hJ : IsJordanCurve J) :
    ∃ h : S² ≃ₜ S², h '' J = {p | (p : EuclideanSpace ℝ (Fin 3)) 2 = 0}

/-- Extend the prescribed boundary correspondence pointwise. -/
theorem schoenflies_extend {J K : Set ℂ}
    (hJ : IsJordanCurve J) (hK : IsJordanCurve K) (e : J ≃ₜ K) :
    ∃ h : ℂ ≃ₜ ℂ, ∀ z : J, h z = (e z : ℂ)

variable {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]

/-- Tameness. The discharge of `GeometricTopology` layer 2's hypothesis, stated on the embedding with
    its model slice: ambient charts of `M` carry the image onto the slice. For a simple closed curve
    the slice is the coordinate line of the model `EuclideanSpace ℝ (Fin 1) × ℝ`, which is local
    flatness. An arc is not locally flat in the half-plane: the ambient model stays the full plane
    and the slice becomes the half-line `Ici 0 ×ˢ {0}`, whose endpoint accounts for an endpoint of
    the arc and whose interior for an interior point. Making the ambient model a half-plane instead
    would contradict invariance of boundary at an interior point of the arc. -/
theorem isLocallyFlat_of_isEmbedding_circle (f : Circle → M) (hf : IsEmbedding f)
    (hint : Set.range f ⊆ (𝓡∂ 2).interior M) :
    IsLocallyFlat (EuclideanSpace ℝ (Fin 1)) ℝ f
theorem isSliceEmbedding_of_isEmbedding_unitInterval (f : unitInterval → M) (hf : IsEmbedding f)
    (hint : Set.range f ⊆ (𝓡∂ 2).interior M) :
    IsSliceEmbedding (Set.Ici (0 : ℝ) ×ˢ ({0} : Set ℝ)) f

/-- A two-sided simple closed curve in the interior has an annular collar. The homeomorphism carries
    the zero section to `J`; the exact subtype packaging is schematic. -/
theorem exists_collar_of_twoSided_isJordanCurve {J : Set M} (hJ : IsJordanCurve J)
    (hint : J ⊆ (𝓡∂ 2).interior M) (h₂ : IsTwoSided J) :
    ∃ (U : Set M), IsOpen U ∧ J ⊆ U ∧
      ∃ e : J × Ioo (-1 : ℝ) 1 ≃ₜ U,
        ∀ p : J, (e (p, ⟨0, by norm_num⟩) : M) = p

/-- A simple closed curve in the interior has an annular or Möbius-band regular neighbourhood,
    according as it is two-sided or one-sided. -/
theorem jordanCurve_neighborhood_dichotomy {J : Set M} (hJ : IsJordanCurve J)
    (hint : J ⊆ (𝓡∂ 2).interior M) :
    (IsTwoSided J ∧ HasAnnularNeighborhood J) ∨ (¬ IsTwoSided J ∧ HasMobiusNeighborhood J)

/-- Tameness of finite graphs, in the vocabulary of arcs: finitely many arcs in the interior of a
    surface, meeting pairwise only in common endpoints, are carried by an ambient isotopy onto
    piecewise-linear arcs of a subdivision of any given triangulation. At a graph vertex the
    local model is a finite planar star, with one branch for each incident arc end; branch
    vertices are not asserted to be locally flat as one-dimensional submanifolds.
    The triangulation is given first: quantified after the isotopy, the identity and a
    triangulation built around the arcs would satisfy the statement and no isotopy would
    reach a consumer. -/
theorem exists_ambientIsotopy_pl_of_arcs [CompactSpace M] (A : Fin n → Set M) (hA : ∀ i, IsArc (A i))
    (hmeet : ∀ i j, i ≠ j → A i ∩ A j ⊆ endpoints (A i) ∩ endpoints (A j))
    (hint : ∀ i, A i ⊆ (𝓡∂ 2).interior M)
    {K : AbstractSimplicialComplex ι} (hK : IsCombinatorialSurface K) (t : Realization K ≃ₜ M) :
    ∃ e : M ≃ₜ M, Isotopic e (Homeomorph.refl M) ∧
      ∃ (ι' : Type) (K' : AbstractSimplicialComplex ι') (s : Subdivision K' K),
        ∀ i, (t ∘ s.toHomeomorph) ⁻¹' (e '' A i) is the carrier of a subcomplex of K'
```

**Mathematical route and formalization notes.**

- No homeomorphism is built directly.  Instead this approach builds two matched finite cell decompositions, one of the closed interior and one of the closed square, isomorphic as cellulations and agreeing with a chosen boundary correspondence.  It refines them alternately so that cells become small on both sides and constructs the homeomorphism off the nested closed stars. Every finite stage is a plane graph governed by layer 2's crosscut theorem. No polygonal approximation of the curve appears anywhere.
- The matched cellulations here are finite approximating devices internal to this proof. They are not the generalized maps of `SurfaceTopology` and carry no realization theory of their own.
- Tameness of a finite family of arcs is proved arc by arc and then at the joints: each arc extends to a simple closed curve away from the others, by layer 2's accessibility, and Schoenflies straightens it; at a common endpoint the finitely many arcs are straightened together by a second application of Schoenflies inside a small disc around the point. The second step is where a finite star needs more than the tameness of each of its arcs. This gives a finite-star model at a graph vertex and a line model along an edge interior. An arc endpoint has one branch, an edge interior has two, and a Y vertex has three; straightening preserves this distinction.
- Carathéodory applies to the Jordan-domain output of layer 2 and gives an analytic route to the closed-inside disc identification. The proof developed here is the elementary matched-cellulation construction, followed by the geometric straightening arguments for arcs and finite stars. Its prerequisites are the earlier polygonal, separation, accessibility, and crosscut results.

**Examples and mathematical checks.** `schoenflies_closure` is instantiated on a curve that is not rectifiable. Circle and arc statements use Tau Ceti's `IsSliceEmbedding`, with local flatness the coordinate-line case. Exhibit an ambient straightening of a Y-shaped union of three arcs into a triangulation: it is a positive graph-tameness check. It is a negative local-flatness check at the common vertex, since removing that vertex from a small graph neighbourhood leaves three components, whereas a punctured line neighbourhood has two. A simple circle gives the positive line-model check; an arc endpoint gives the distinct half-line model. The core circle of a Möbius band is the counterexample to an unconditional product collar: it is tame and locally flat but one-sided. Automatic tameness fails in dimension three, where wild embeddings occur.

**Natural intermediate results.** (i) finite cellulations of a Jordan domain using layer 2's crosscuts; (ii) matching and refinement transfer; (iii) alternation and the small-cell estimate; (iv) the nested-star limit and `schoenflies_closure`; (v) the ambient and spherical forms; (vi) tameness of arcs; (vii) tameness of simple closed curves; (viii) the annulus/Möbius regular-neighbourhood dichotomy and the two-sided collar corollary; (ix) tameness of finite families of arcs.

**Consequences.** `GeometricTopology` layer 2. `SurfaceTopology` layers 5 and 9.

---

## Layer 8: Uniqueness of the piecewise-linear and smooth structures

Where the two tracks rejoin. Radó and the Hauptvermutung say that a compact surface has a piecewise-linear structure and that it is unique up to PL isomorphism; this layer says the same for homeomorphisms, isotopies, and smooth structures. Every statement is in triangulation terms; the chart-based PL manifolds of `GeometricTopology` enter only through the bridge recorded below.

**From layers 3, 4, 5, and 7.** `IsPLMap`, the relative approximation theorem, Radó, the Hauptvermutung, Schoenflies, Alexander's trick.
**From Tau Ceti and Mathlib.** `PLGroupoid` (`Geometry/Manifold/PLGroupoid.lean`), `IsManifold`, `Diffeomorph`, `Isotopic`, `IsotopicRel`.

**Curve and arc isotopy inputs.** The following are separate targets on finite triangulated
surfaces, proved before the homeomorphism theorem. Closed curves are parametrized embeddings
of the circle with image in the surface interior; homotopy here is free unless a relative
condition is stated. The PL conclusions include ambient isotopies.

- **Two-sided curves:** homotopic PL embeddings of the circle are ambient PL isotopic when
  the first image is two-sided and does not bound a disc. The isotopy is fixed outside a
  compact subset of the interior, hence fixes the surface boundary. Boundary-parallel curves
  and boundaries of Möbius bands are included when they satisfy these hypotheses. Source:
  Epstein, Theorem 2.1, printed p. 86.
- **One-sided curves:** homotopic PL embeddings of the circle are ambient PL isotopic when
  the first image is one-sided, again with support in a compact subset of the interior.
  Use the Möbius regular neighbourhood and the orientation cover constructed in layers 7
  and 6. Source: Epstein, Theorem 3.3, printed p. 90, with the relative Möbius-band argument
  of Theorem 3.4, pp. 90–91.
- **Proper arcs:** two embedded PL intervals with the same ordered endpoints, meeting the
  surface boundary exactly at those endpoints, are ambient PL isotopic if they are
  homotopic keeping both endpoints fixed. The ambient isotopy fixes the entire surface
  boundary. Source: Epstein, Theorem 3.1, printed p. 89.
- **Disc-bounding curves:** in an oriented closed disc neighbourhood, two parametrized PL
  curves whose filling discs lie in its interior and which induce the same boundary
  orientation are ambient PL isotopic by an isotopy supported there and fixed on its boundary. Construct the global disc-bounding
  case by transporting chosen filling discs along paths, with local orientations tracked
  by layer 6's orientation cover, and applying the disc extension and Alexander-trick
  results of layers 0 and 7. Filling discs and orientation transport are part of the data.
  Bare free homotopy is insufficient in this case: the two parametrizations of the unit
  circle with opposite winding signs in the plane give the negative check. See Epstein's
  Remark 1 following Theorem 2.1, printed p. 86.

Based and relative curve statements carry their own hypotheses. In particular, Epstein's
based Theorem 4.1, printed p. 91, excludes curves bounding a Möbius band as well as those
bounding a disc. Prove the Möbius and disc cases with their explicit local data; do not use
the free-homotopy theorem as a based or fixed-subcomplex theorem.

**Representative formal statements.**

```lean
variable {M N : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]
  [CompactSpace M] [TopologicalSpace N] [ChartedSpace (EuclideanHalfSpace 2) N] [T2Space N]
  [CompactSpace N]

/-- A PL structure on a compact surface is a triangulation. The comparison map of two of them need
    not be PL: precomposing one realization with a non-PL self-homeomorphism of the square leaves a
    PL structure whose comparison with the original is that map. The Hauptvermutung, layer 5's
    `hauptvermutung₂_isPL`, gives a PL homeomorphism of the two polyhedra, not that the comparison
    map is one; the sharp form on a single surface is the identity case of
    layer 5's `exists_isotopic_plHomeomorph`. -/
structure PLStructure (M : Type*) [TopologicalSpace M] where
  ι : Type
  K : AbstractSimplicialComplex ι
  hK : IsCombinatorialSurface K
  e : Realization K ≃ₜ M

/-- Layer 5's isotopy to a PL homeomorphism, read through two PL structures; the rel form is
    layer 5's `exists_isotopicRel_plHomeomorph`. -/
theorem PLStructure.exists_isotopic_plHomeomorph (s : PLStructure M) (t : PLStructure N) (f : M ≃ₜ N) :
    ∃ g : M ≃ₜ N, IsPLMap (t.e.symm ∘ g ∘ s.e) ∧ Isotopic f g

/-- Epstein. Homotopic homeomorphisms of a closed surface are isotopic; with boundary the statement
    is relative, since on the disc the identity and conjugation are homotopic through continuous
    maps but not isotopic through homeomorphisms, having opposite local orientation. The compact
    relative case specializes Theorem 6.3 (printed p. 99), and the closed case also follows
    from Theorem 6.4(a) (p. 101). Compactness supplies properness where required. Homotopic PL
    homeomorphisms are PL isotopic, so PL isotopy classes inject into topological ones. -/
theorem isotopic_of_homotopic [BoundarylessManifold (𝓡∂ 2) M] (f g : M ≃ₜ N)
    (h : ContinuousMap.Homotopic f g) : Isotopic f g
theorem isotopicRel_of_homotopicRel (f g : M ≃ₜ N)
    (h : ContinuousMap.HomotopicRel f g ((𝓡∂ 2).boundary M)) :
    IsotopicRel ((𝓡∂ 2).boundary M) f g
theorem plIsotopic_of_isotopic (s : PLStructure M) (t : PLStructure N) (f g : M ≃ₜ N)
    (hf : IsPLMap (t.e.symm ∘ f ∘ s.e)) (hg : IsPLMap (t.e.symm ∘ g ∘ s.e)) (h : Isotopic f g) :
    PLIsotopic s t f g

/-- Topological and PL homeomorphism classes agree. -/
theorem homeomorph_iff_plHomeomorph {K L} (hK : IsCombinatorialSurface K)
    (hL : IsCombinatorialSurface L) :
    Nonempty (Realization K ≃ₜ Realization L) ↔ Nonempty (Realization K ≃ₚₗ Realization L)

/-- The bridge to `GeometricTopology`'s chart-based PL manifolds: with the atlas a triangulation
    induces, a compact surface is a PL manifold. Its proof is the reconciliation that
    `GeometricTopology` layer 11 targets. -/
theorem hasGroupoid_plGroupoid (s : PLStructure M) :
    @HasGroupoid _ _ _ _ (chartedSpace induced by s) (PLGroupoid (𝓡∂ 2))

/-- Smoothing: every PL structure is compatible with a smooth structure, unique up to a
    diffeomorphism isotopic to the identity. Compatibility is Whitehead's and Kuiper's smooth
    triangulation condition, that each closed simplex embeds smoothly with injective differential,
    asked of some subdivision of `s.K` rather than of `s.K` itself. It cannot be asked of `s.K`: a
    disc triangulated as one triangle has two boundary edges at each vertex, which a half-space
    chart must both send into its boundary line, so the differential of the closed triangle has
    rank at most one there; after one barycentric subdivision no triangle meets the boundary in
    two edges at a vertex. Nor is compatibility that the smooth charts are PL, since a chart that
    is both is locally affine, and an affine atlas on the sphere would develop into a local
    diffeomorphism to `ℝ²` with open compact image. No boundary condition on `s.e` is needed:
    layer 2's `image_boundary` makes any realization carry the boundary subcomplex onto `∂M`. -/
def PLStructure.IsCompatible (s : PLStructure M) (σ : ChartedSpace (EuclideanHalfSpace 2) M) : Prop :=
  ∃ (ι' : Type) (K' : AbstractSimplicialComplex ι') (h : Subdivision K' s.K),
    ∀ τ : Face K', s.e ∘ h.toHomeomorph is a smooth embedding with injective differential on τ, for σ   -- schematic
def PLStructure.smoothing (s : PLStructure M) : ChartedSpace (EuclideanHalfSpace 2) M
theorem PLStructure.smoothing_isManifold (s : PLStructure M) :
    @IsManifold _ _ _ _ _ _ _ (𝓡∂ 2) ∞ M _ s.smoothing
theorem PLStructure.smoothing_isCompatible (s : PLStructure M) : s.IsCompatible s.smoothing
theorem PLStructure.smoothing_unique (s : PLStructure M)
    (σ τ : ChartedSpace (EuclideanHalfSpace 2) M)
    (hσ : σ is smooth and s.IsCompatible σ) (hτ : τ is smooth and s.IsCompatible τ) :
    ∃ φ : M ≃ₘ⟮𝓡∂ 2, 𝓡∂ 2⟯ M, Isotopic φ.toHomeomorph (Homeomorph.refl M)   -- σ on the left, τ on the right

/-- Every homeomorphism is isotopic to a diffeomorphism, for a smooth structure compatible with a
    PL structure, and rel the boundary when it fixes the boundary pointwise. With Epstein's theorem
    and `smoothIsotopic_of_isotopic` this makes the smooth mapping class groups of
    `SurfaceTopology` layer 9 the topological ones. -/
theorem exists_isotopic_diffeomorph (s : PLStructure M) (σ : ChartedSpace (EuclideanHalfSpace 2) M)
    (hσ : σ is smooth and s.IsCompatible σ) (f : M ≃ₜ M) :
    ∃ φ : M ≃ₘ⟮𝓡∂ 2, 𝓡∂ 2⟯ M, Isotopic f φ.toHomeomorph   -- σ on both sides
theorem exists_isotopicRel_diffeomorph (s : PLStructure M) (σ : ChartedSpace (EuclideanHalfSpace 2) M)
    (hσ : σ is smooth and s.IsCompatible σ) (f : M ≃ₜ M) (hf : Set.EqOn f id ((𝓡∂ 2).boundary M)) :
    ∃ φ : M ≃ₘ⟮𝓡∂ 2, 𝓡∂ 2⟯ M, Set.EqOn φ id ((𝓡∂ 2).boundary M) ∧
      IsotopicRel ((𝓡∂ 2).boundary M) f φ.toHomeomorph

/-- Isotopic diffeomorphisms of compact surfaces are smoothly isotopic. -/
theorem smoothIsotopic_of_isotopic (φ ψ : M ≃ₘ⟮𝓡∂ 2, 𝓡∂ 2⟯ N)
    (h : Isotopic φ.toHomeomorph ψ.toHomeomorph) : SmoothIsotopic φ ψ
```

**Mathematical route and formalization notes.**

- A PL structure is a triangulation, and the Hauptvermutung of layer 5 compares any two of them by some PL homeomorphism, not by their own comparison map, which need not be PL. What this layer adds is the treatment of maps: the sharp uniqueness statement on a single surface is the identity case of `exists_isotopic_plHomeomorph`. The PL homeomorphism type `≃ₚₗ` bundles a homeomorphism with `IsPLMap` in both directions.
- Isotopy to a PL homeomorphism is layer 5's. What this layer adds is its consequences for isotopy classes, Epstein's theorem, and the smooth side.
- **Finite homotopy lemmas before isotopy.** Build relative simplicial approximation for the disc, annulus, and interval-homotopy domains used here, keeping the prescribed PL boundary data. Prove directly on finite triangulations that a null-homotopic simple interior PL loop bounds an embedded PL disc; that disjoint homotopic two-sided PL loops not bounding discs cobound an embedded PL annulus, with the given parametrizations; and that intersecting homotopic curves or proper arcs in transverse position have a removable innermost bigon under the hypotheses of the corresponding isotopy input. Removing a bigon decreases the finite intersection count. These are explicit targets of this layer: compare Epstein's Theorem 1.7 (p. 85), Lemma 2.4 (pp. 87–88), and Lemmas 2.5 and 3.2 (pp. 89–90). Prove the statements by finite triangle, disc, and annulus arguments here, independently of `SurfaceTopology`'s classification or homology. The citation of Epstein fixes the statements; his uses of general fundamental-group and homological results are not prerequisite theorems of this roadmap.
- **Homeomorphism isotopy.** Construct a finite cutting system directly from a triangulation. Apply the separate two-sided, one-sided, proper-arc, and oriented-disc inputs successively, retaining the boundary and already fixed pieces with explicitly relative homotopies and isotopies. Cutting reduces the remaining homeomorphism to the disc case of Alexander's trick; include the annulus and Möbius-band relative base cases. This proves the full closed and boundary-relative homeomorphism headlines and supplies the injectivity used by `SurfaceTopology` layer 9. All auxiliary curve hypotheses are internal to the proof; they do not narrow the homeomorphism statements.
- Smoothing follows Whitehead and Munkres: a triangulated surface is made `C¹` triangle by triangle, the corners along edges and at vertices are rounded with a partition of unity on the star of each simplex, and the result is a smooth atlas for which the barycentric subdivision of the given triangulation is smooth and nondegenerate on each simplex. The subdivision is what lets a boundary vertex lying in a single triangle open its corner to a straight angle. The transition maps are not PL, and cannot be: a map that is both smooth and PL is locally affine. Uniqueness and isotopy to a diffeomorphism are Munkres' smoothing of piecewise-differentiable homeomorphisms: the identity between two compatible smoothings, or a PL homeomorphism from layer 5, is piecewise differentiable on a common subdivision, in dimension two there is no obstruction to approximating it by a diffeomorphism, and the approximation is close enough to be isotopic to it; the rel form keeps the boundary fixed throughout. Smooth isotopy of isotopic diffeomorphisms is Munkres' smoothing of the isotopy. Whitehead's converse, that every smooth structure is compatible with some triangulation, is not targeted; the comparison of smooth and topological mapping classes is stated for compatible structures.
- `GeometricTopology` owns the chart-based `PLGroupoid`. The bridge theorem is stated here because it is what a consumer of both roadmaps needs, and its proof is the reconciliation that `GeometricTopology` layer 11 targets.

**Examples and mathematical checks.** Two genuinely different triangulations of the torus are shown PL-equivalent, with the PL homeomorphism produced. A homeomorphism of the torus that is not PL is shown isotopic to a PL one. A note records that uniqueness of smooth structure fails in dimension four, so the smoothing theorem is visibly dimension-specific.

For the isotopy inputs, two parallel core circles of an annulus exercise the two-sided case;
a core circle and a small PL perturbation in a Möbius band exercise the one-sided case;
two proper arcs in a disc with the same ordered endpoints exercise the relative arc case.
Proper arcs crossing an annulus with different winding numbers fail the relative-homotopy
hypothesis. The clockwise and counterclockwise unit-circle parametrizations in the plane
fail the non-disc-bounding hypothesis of the two-sided theorem and the orientation
condition of the disc theorem; equally oriented parametrizations give the positive disc
case. Check fixed endpoints and fixed boundary throughout the resulting ambient isotopies.


**Natural intermediate results.** (i) PL structures and their equivalence; (ii) the PL-structure reading of layer 5's isotopy theorem; (iii) relative finite simplicial approximation, the disc and annulus lemmas, and bigon removal; (iv) the separate two-sided, one-sided, proper-arc, and oriented-disc isotopy inputs, with based and relative qualifications; (v) finite cutting systems, the relative annulus and Möbius-band base cases, and Epstein's homeomorphism theorem; (vi) the Top/PL classification agreement; (vii) the bridge to `PLGroupoid`; (viii) corner rounding and existence of a smoothing; (ix) smoothing of piecewise-differentiable homeomorphisms: uniqueness of the smoothing, isotopy to a diffeomorphism, and smooth isotopy.

**Consequences.** `SurfaceTopology` layer 9. `GeometricTopology` layers 1 and 11.

---

## Alternative routes and why they are not primary

These alternatives clarify the mathematical choices made in the dependency graph.

**The homological route to the Jordan curve theorem** (Cannon chapter 7: singular homology
of sphere complements, then arc non-separation and Jordan). **Not taken.** It needs excision,
Mayer–Vietoris, and the homology of spheres for singular homology, a substantial piece of
algebraic topology that is outside this roadmap and outside `GeometricTopology`.

**The Kline sphere characterization route to Schoenflies** (Cannon chapter 8: Schoenflies as
a corollary of a topological recognition theorem for the 2-sphere). **Rejected on cost.**
It is the more illuminating route and it is substantially more expensive, requiring Peano
continua, upper semicontinuous decompositions, and Bing's proof. See the
roadmap-for-a-roadmap below.

**Maehara's route to the Jordan curve theorem** (Jordan from the Brouwer fixed point
theorem). **Not built.** It is the shortest proof of the component count that exists, and
`rkirov/jordan_pick` closes it. It supplies no frontier statement, no accessibility, and no
crosscut theorem, so it discharges nothing downstream, and a second proof of a theorem is not a
target. Brouwer itself is a layer 2 target, for invariance of domain.

**Invariance of domain from the Jordan curve theorem.** **Not taken.** The classical
alternative to the Brouwer route: the image of an open disc under an injective map is a
connected subset of the complement of the image circle, and since the image of the closed disc
does not separate the plane, it is a whole component and hence open. The non-separation step
follows from Tau Ceti's Borsuk criterion (`Analysis/Complex/PlaneSeparation/Basic.lean`) and
Mathlib's lifting of maps on simply connected domains through `exp`. The Brouwer route was
chosen because it needs nothing from the Jordan curve theorem and because Brouwer is reusable.

**Deriving Schoenflies from Carathéodory.** **Not taken.** This analytic route is available
from layer 2's Jordan-domain output: Carathéodory identifies the closed inside with a disc,
and the corresponding outside identification and Alexander's trick give the ambient form.
The route specified here is elementary geometric topology, with matched finite cellulations,
crosscuts, and a nested-star limit, followed by straightening of curves and finite stars.
It develops that geometric infrastructure without an analytic input to Schoenflies.

---

## Roadmap-for-a-roadmap: continuum theory and wild plane topology

This section motivates a separate future roadmap. Its theorems lie outside the scope of the present one.

The point-set topology of compact connected metric spaces is a subject in its own right, with named theorems and essentially no Lean prior art, and it is the natural home for the *wild* side of plane topology that `GeometricTopology` layer 2 quantifies over. A roadmap for it would build: continua and Peano continua; the boundary-bumping lemma; **Hahn–Mazurkiewicz** (a space is a continuous image of the interval exactly when it is a Peano continuum); characterizations of the arc and the simple closed curve; **Brouwer's characterization of the Cantor set**; upper semicontinuous decompositions and decomposition spaces; **R. L. Moore's decomposition theorem**; the **Kline sphere characterization** (conjectured by Kline, proved by Bing); and **tameness of Cantor sets in the plane**, against Antoine's necklace as the dimension-three counterexample.

The principal reference is Cannon, *Topology as Fluid Geometry*, volume 2, chapters 5, 6, 8, 10, and 11.

Moore's decomposition theorem is the two-dimensional ancestor of the cell-like approximation theorems, and it is what makes Douady's pinched-disc model of the Mandelbrot set a disc; locally connected models of the Mandelbrot set are standard objects in complex dynamics. Brouwer's characterization of the Cantor set is used throughout descriptive set theory and one-dimensional dynamics.


---

## Out of scope

- Anything in dimension three or higher is owned by `GeometricTopology`.
- The general (chart-based) `PLGroupoid` is owned by `GeometricTopology` layer 1. This roadmap's PL language is subdivisions and simplicial maps.
- Combinatorial maps, hypermaps, generalized maps, cellulations, polygon words, the classification of surfaces, mapping class groups, graph embeddings. [SurfaceTopology](../SurfaceTopology/README.md) develops all of this.
- Riemann surfaces, conformal structure, uniformization, Carathéodory's theorem. `ConformalMapping` owns it. This roadmap develops the elementary separation and crosscut route to the shared Jordan-domain interface, followed by geometric Schoenflies.
- Singular homology, Mayer–Vietoris, excision, van Kampen, cohomology, duality.
- Continuum theory beyond the local-connectedness lemmas actually consumed. See the roadmap-for-a-roadmap above.
- Noncompact surfaces beyond what the compact proofs require. The classification of noncompact surfaces (Kerékjártó) is a natural follow-on roadmap.
- Measure-theoretic properties of curves beyond the single Osgood example in layer 0.
- Whitehead's smooth triangulation theorem, that every smooth structure on a compact surface is compatible with some triangulation. Layer 8 goes from PL to smooth and compares smooth structures compatible with a given PL structure.

---

## Provenance and prior art

| Development | Licence | Coordination | What it evidences |
|---|---|---|---|
| `mccorvie/classification-of-surfaces` | Apache-2.0 | authored by this roadmap's author | that the Moise route to Radó and the Hauptvermutung closes, at roughly 90k lines of PL infrastructure plus 70k for Schoenflies |
| `alonamaloh/schoenflies-lean`, blueprint `alonamaloh/jordan-schoenflies` | Apache-2.0 code, CC BY 4.0 blueprint | contacted, agreed | a proof of Schoenflies along Thomassen's route |
| `rkirov/jordan_pick` | Apache-2.0 | contacted, agreed | Maehara's route to the component count; Brouwer; lattice-polygon crossing parity and ear-clipping |

**Lessons from prior art.** Previous experience from formalizing the classification of surfaces underscored the importance of treating positive and negative examples as part of every validity definition, and treating realization as a construction followed by a comparison theorem rather than as an unconstrained structure field.

**Integration.** Where existing code is adapted it will be re-derived against Tau Ceti's
vocabulary: `TauCeti.IsJordanCurve` rather than a parametrized definition, `ℂ` rather than
`EuclideanSpace ℝ (Fin 2)` for planar statements, and
`TauCeti/AlgebraicTopology/SimplicialComplex/` rather than a private complex type.


---

## References

Stable bibliographic keys and printed-page locators are recorded in `sources.toml`.

- C. Thomassen, *The Jordan–Schönflies theorem and the classification of surfaces*,
  Amer. Math. Monthly **99** (1992), 116–131. Polygonal separation and crosscuts are Lemmas 2.3–2.4, pp. 119–120; polygonal nonplanarity of `K₃,₃` is Lemma 2.5, p. 120; the Jordan curve theorem is Theorem 2.12, p. 122; the Jordan crosscut lemma is Lemma 2.13, pp. 122–123; the prescribed-boundary Schoenflies extension is Theorem 3.1, pp. 123–125. These are the inputs for layers 1, 2, and 7.
- `alonamaloh/jordan-schoenflies`, the blueprint. The only source cited here written at
  formalization granularity, with a statement-level index and a suggested module order.
  Treat it as the primary route document for layers 1, 2, and 7.
- E. Moise, *Geometric Topology in Dimensions 2 and 3* (1977). PL vocabulary and coning are
  §5, pp. 42–45; strong positivity is defined at the start of §6, p. 46;
  Theorems 6.2–6.4, pp. 46–50, give the PL approximation argument. The open-set
  triangulation lemma is Theorem 8.2, pp. 58–59; Radó is Theorem 8.3, pp. 60–62;
  the same-image approximation is Theorem 8.4, p. 63; the Hauptvermutung is
  Theorem 8.5, p. 64. The half-plane and relative approximation forms are the
  explicit extensions targeted here. Note in particular his remark following the triangulation theorem that
  a derivation from Schoenflies can obscure the independent approximation argument.
- C. Rourke and B. Sanderson, *Introduction to Piecewise-Linear Topology*, chapters 1–3.
  The PL vocabulary, already followed by `TauCeti/AlgebraicTopology/SimplicialComplex/`.
- M. H. A. Newman, *Elements of the Topology of Plane Sets of Points*. Classical reference
  for the plane material.
- J. R. Munkres, *Elementary Differential Topology*; J. H. C. Whitehead, *On C¹-complexes*.
  The smoothing route for layer 8.
- J. R. Munkres, *Obstructions to the smoothing of piecewise-differentiable homeomorphisms*,
  Ann. of Math. **72** (1960), 521–554; N. Kuiper, *On the smoothings of triangulated and
  combinatorial manifolds*, in *Differential and Combinatorial Topology*, Princeton (1965). The
  compatibility condition and the smoothing of piecewise-differentiable maps in layer 8.
- D. B. A. Epstein, [*Curves on 2-manifolds and isotopies*](https://doi.org/10.1007/BF02392203),
  Acta Math. **115** (1966), 83–107. Two-sided curves: Theorem 2.1, p. 86; proper arcs:
  Theorem 3.1, p. 89; one-sided curves and the Möbius-band base case: Theorems 3.3–3.4,
  pp. 90–91; based curves: Theorem 4.1, p. 91; homeomorphisms: Theorems 6.3–6.4,
  pp. 99–103. Layer 8 constructs the elementary finite prerequisites explicitly.
- J. Cannon, *Topology as Fluid Geometry*, volume 2. Exposition reference for the
  point-set lemmas in layer 0, and the reference for the roadmap-for-a-roadmap above. Note
  that it is an idiosyncratic tour rather than a reference text, and its selection principle
  is explicitly aesthetic; it should not be used to scope a roadmap.
- U. Pachner, *Shellings of simplicial balls and P.L. manifolds with boundary*,
  Discrete Math. **81** (1990), 37–47,
  [doi:10.1016/0012-365X(90)90178-K](https://doi.org/10.1016/0012-365X(90)90178-K).
  Bistellar moves together with boundary shellings; layer 5 constructs the
  dimension-two move sequences from common subdivisions.
- W. Kulpa, [*Poincaré and domain invariance theorem*](https://dml.cz/dmlcz/702050),
  Acta Univ. Carolin. Math. Phys. **39** (1998), no. 1–2, 127–136.
  The preliminary zero-avoidance lemma is stated on p. 127 and proved by finite affine
  interpolation on pp. 132–133; invariance of domain is deduced on pp. 128–129.
  Layer 2 specializes this elementary proof to the plane.
