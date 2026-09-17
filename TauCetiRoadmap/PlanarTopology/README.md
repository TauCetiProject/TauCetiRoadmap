# Roadmap: Planar topology and the piecewise-linear structure of surfaces

Two-dimensional topology is the last dimension in which several kinds of structure coincide without additional hypotheses. Every surface is triangulable; topological homeomorphisms between triangulated surfaces can be replaced by piecewise-linear ones; embedded arcs and simple closed curves are tame; and every topological surface has essentially unique piecewise-linear and smooth structures. The corresponding statements separate in higher dimensions: triangulations and the Hauptvermutung can fail, and wild embeddings make local flatness a genuine condition. This roadmap develops the specifically two-dimensional theorems behind that coincidence.

That framing matters for how the results are used. These theorems are not obtained by specializing a dimension-independent theory: their proofs use planar separation, polygonal approximation, and the combinatorics of two-dimensional links. Some individual conclusions also hold in dimension three, but the full package—especially automatic tameness—is specifically two-dimensional. The *definitions* are shared with `GeometricTopology`; see the interface table below.

The summits, in order of construction:

1. **The Jordan curve theorem and the crosscut theorem**, with the frontier and
   accessibility API that `ConformalMapping` consumes, and **invariance of domain** in
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

### This roadmap supplies

| Consumer | What it needs | Where it is proved here |
|---|---|---|
| `ConformalMapping` layer 5 | the inside of every Jordan curve is a Jordan domain, `IsJordanDomain hJ.inside`, and is simply connected, `IsSimplyConnected hJ.inside`; together these are the hypotheses of Carathéodory's theorem, so it applies to every Jordan curve | layers 2 and 7 |
| `GeometricTopology` layer 11 | triangulability is unconditional in dimension two; the two-dimensional Hauptvermutung and Pachner's theorem; the compatibility of `IsCombinatorialSurface` with `IsCombinatorialManifold K 2` | layers 3 and 5 |
| `GeometricTopology` layer 2 | `IsLocallyFlat` is automatic for arcs, simple closed curves, and finite graphs in a surface | layer 7 |
| `GeometricTopology` layer 1 | invariance of domain in dimension two, hence chart-independence of the manifold boundary in the topological case `k = 0` that `isBoundaryPoint_iff_mem_frontier_range` excludes | layer 2 |
| `SurfaceTopology` | Radó, the Hauptvermutung, Pachner, the Euler characteristic, orientability and orientations, the boundary count, Schoenflies, tameness, Epstein's theorem, and the comparison of the topological, PL, and smooth categories | layers 2, 5, 6, 7, and 8 |

### This roadmap consumes

The mathematical development is intended to use the following existing definitions and
theorems rather than introduce parallel versions.

| Item | Location | Owner |
|---|---|---|
| `Isotopy`, `Isotopic` | `TauCeti/Topology/Homotopy/Isotopy/{Basic,Comp,Prod}.lean` | `GeometricTopology` layer 1 |
| `AmbientIsotopy`, `AmbientIsotopic` | `TauCeti/Topology/Homotopy/AmbientIsotopic/{Basic,Complement,Naturality}.lean` | `GeometricTopology` layer 1 |
| `Realization`, `Face`, `faceInclusion`, `StandardSimplex` | `TauCeti/AlgebraicTopology/SimplicialComplex/Realization.lean` | `GeometricTopology` layer 11 |
| `link`, `closedStar`, `deletion` | `TauCeti/AlgebraicTopology/SimplicialComplex/LinkStar.lean` | `GeometricTopology` layer 11 |
| barycentric subdivision, `barycentricSubdivisionMap`, and `barycentricSubdivisionRealizationHomeomorph` | `TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/{Basic,Realization,Homeomorph}.lean` | `GeometricTopology` layer 11 |
| stellar subdivision and `StellarEquivalent` | `TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Stellar/{Basic,Equivalence}.lean` | `GeometricTopology` layer 11 |
| `IsCombinatorialBall`, `IsCombinatorialSphere`, `IsCombinatorialManifold` | `TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold.lean` | `GeometricTopology` layer 11 |
| `SimplicialMap`, `domainRestrict` | `TauCeti/AlgebraicTopology/SimplicialComplex/Maps.lean` | `GeometricTopology` layer 11 |
| `dimension` | `TauCeti/AlgebraicTopology/SimplicialComplex/Dimension.lean` | `GeometricTopology` layer 11 |
| the collapse API | `TauCeti/AlgebraicTopology/SimplicialComplex/Collapse/`, `ElementaryCollapse.lean` | `GeometricTopology` layer 11 |
| `IsTriangulable` | `TauCeti/Topology/Triangulable.lean` | `GeometricTopology` layer 11 |
| `IsLocallyFlat`, `IsSliceChart`, `IsSliceEmbedding` | `TauCeti/Geometry/Manifold/LocallyFlat/{Basic,Smooth}.lean` | `GeometricTopology` layer 2 |
| half-space boundary model, boundary charts, collar charts, and the topological collar `IsCollar` | `TauCeti/Geometry/Manifold/Boundary/{Basic,Charts,Model}.lean`, `Boundary/Collar/{Basic,Chart,Local,Global}.lean` | `GeometricTopology` layer 1 |
| `IsPiecewiseAffineOn`, `IsPLOn` | `TauCeti/Topology/PL/Map.lean` | `GeometricTopology` layer 1 |
| `PLPregroupoid`, `PLGroupoid` | `TauCeti/Geometry/Manifold/PLGroupoid.lean` | `GeometricTopology` layer 1 |
| `IsJordanCurve` and the arc theory | `TauCeti/Topology/JordanCurve/{Basic,Path,Separation,SmallArc,Subcontinuum,Monotone,OnePoint}.lean` | `ConformalMapping` |
| `filledHull` | `TauCeti/Topology/FilledHull.lean` | `ConformalMapping` |
| `IsJordanDomain` | `TauCeti/Analysis/Complex/Conformal/Jordan/Domain.lean` | `ConformalMapping` |
| the Borsuk separation criterion and Janiszewski's theorem | `TauCeti/Analysis/Complex/PlaneSeparation/Basic.lean` | `ConformalMapping` |
| winding numbers for contours | `TauCeti/Analysis/Contour/Winding/` | `ContourIntegration` |
| `Circle` arc and metric API | `TauCeti/Topology/Circle/{Basic,Arc,Metric}.lean` | `ConformalMapping` |
| continua, local connectedness | `TauCeti/Topology/{Continuum,LocallyConnected,UniformlyLocallyConnected}.lean` | `ConformalMapping` |

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

⚠ `CircularOrder` on the topological circle has nothing to do with cyclic words. Keep them in separate namespaces with no coercion between them.

### Surfaces

There is one family of surfaces, and it is Mathlib's. A **surface** is a type `M` with

```lean
[TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M] [SecondCountableTopology M]
```

and nothing bundled: a manifold is a type with instances, as `GeometricTopology` fixes it, and since the `C⁰` structure groupoid is the continuous one (`contDiffGroupoid_zero_eq`) no `IsManifold` instance carries information. **Compact**, **connected**, and **closed** are the hypotheses `CompactSpace M`, `ConnectedSpace M`, and `(𝓡∂ 2).boundary M = ∅`. Every displayed signature below abbreviates this list by a `variable` line at the head of its block; names such as `Surface` or `CompactSurface` are not classes and appear nowhere. Second countability of a compact charted space is Mathlib's `ChartedSpace.secondCountable_of_sigmaCompact` and is not a target.

Half-space charts cover the boundaryless case, so a surface charted over `EuclideanSpace ℝ (Fin 2)`, such as Mathlib's sphere or the plane itself, enters the family by transport: layer 0 fixes a half-space chart on `EuclideanSpace ℝ (Fin 2)`, composes with `ChartedSpace.comp`, and proves that the result has empty boundary. The closed unit disc of `ℂ` gets its half-space structure in layer 0 as well; Mathlib does not provide one.

Manifold boundary `∂M` is the set `(𝓡∂ 2).boundary M` of points that are boundary points in their own chart. ⚠ Chart-independence in the topological case is **not** available from `isBoundaryPoint_iff_mem_frontier_range`, which requires `k ≠ 0`. It follows from invariance of domain, proved in layer 2. Nothing in this roadmap may use a property of `∂M` before layer 2, and every statement about an arc or curve *in* a surface that needs a full disc around it says so with `⊆ (𝓡∂ 2).interior M`.

### Simplicial and PL

Abstract simplicial complexes are Tau Ceti's (`PreAbstractSimplicialComplex` / `AbstractSimplicialComplex`, `SetLike`, `Face K := {σ : Finset ι // σ ∈ K}`, realization into `ι →₀ ℝ`). No private complex type.

A **PL map** is defined by existential quantification over subdivisions of the domain complex, not by a triangulation. Composability then depends on the common-subdivision theorem, which is a layer 3 target.

`IsCombinatorialSurface` is defined concretely by the link condition on a complex with finitely many faces: every vertex link is a finite combinatorial circle or a finite combinatorial arc, and every edge lies in one or two triangles. It is *not* defined by instantiating a dimension-general recursion. Tau Ceti's `IsCombinatorialManifold K n` (`SimplicialComplex/CombinatorialManifold.lean`) asks instead that each vertex link be stellar equivalent to the boundary of a simplex or to a simplex; the equality of the two notions at `n = 2` is a compatibility theorem, listed in layer 3's targets, and no dimension-two result depends on it.

### Bundled index types

Every finite combinatorial object bundles its own index type, and every move relation is closed under isomorphism of that type before `Relation.ReflTransGen` is applied. This is stated here because it is shared with `SurfaceTopology`.

---

## Layer Dependency Chart

```
L0 conventions
 |
L1 polygonal engine
 |\
 | \__ Track I  (approximation and separation)
 |    L2 separation, crosscuts, Brouwer, invariance of domain
 |    L7 topological Schoenflies and tameness
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

/-- The closed unit disc as a surface with boundary the unit circle. -/
def closedDiscChartedSpace : ChartedSpace (EuclideanHalfSpace 2) (Metric.closedBall (0 : ℂ) 1)
theorem boundary_closedDisc :
    (𝓡∂ 2).boundary (Metric.closedBall (0 : ℂ) 1) = Subtype.val ⁻¹' Metric.sphere 0 1

/-- Isotopy relative to a subset; intended for the shared isotopy API. -/
def IsotopicRel (A : Set X) (f g : C(X, Y)) : Prop


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

- Alexander's trick is short but needed in three places. L4 uses the PL version to correct the 2-skeleton and fills each triangle. L7 uses the topological version when it glues the two Schoenflies discs along the curve. L8 uses the isotopy form in exists_isotopic_plHomeomorph.
- The half-space transport is what makes Mathlib's sphere, the plane, and every Euclidean-charted surface a surface in the sense of the conventions. Its boundary is empty because every transported chart lands in the interior of the half-space. The closed disc is charted by hand, interior points by the identity and boundary points by straightening the circle, and its boundary is the unit circle.
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
def PolygonalLoop.carrier (P : PolygonalLoop) : Set ℂ
def PolygonalLoop.IsSimple (P : PolygonalLoop) : Prop
def crossingParity (P : PolygonalLoop) (q : ℂ) : ZMod 2
def polygonalWinding (P : PolygonalLoop) (q : ℂ) : ℤ

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
    ∃ h : ℂ ≃ₜ ℂ, IsPLOn h univ ∧ IsPLOn h.symm univ ∧ h '' P.carrier = standardTriangle.boundary

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
- Crossing parity is ray casting: `crossingParity P q` counts, modulo two, the segments of `P` crossed by the horizontal ray from `q` to the right, where a ray through a vertex counts once if the two segments at that vertex leave on opposite sides of the ray and not at all if they leave on the same side, and a segment lying along the ray counts as its two endpoints do. This is what makes parity locally constant off the loop.
- Nonplanarity of `K₃,₃` for polygonal drawings is a **finite** statement provable from the polygonal crosscut theorem alone. It is the lever that takes layer 2 from polygons to arbitrary curves. Its topological form, for drawings whose edges are arbitrary arcs, is not needed here: `SurfaceTopology` layer 10 derives nonplanarity of `K₅` and `K₃,₃` from Euler's formula, and layer 7's tameness of drawings identifies the two notions.
- Ear-clipping is the engine of polygonal Schoenflies: triangulate a simple polygon by diagonals, then induct.

**Examples and mathematical checks.** The crossing parity is computed in an exact worked example for a non-convex polygon and a point in a re-entrant pocket. A figure-eight polygonal loop shows that simplicity is essential in polygonal Jordan separation. The strict size hypothesis in the ear theorem is tested on a triangle, and a polygon with exactly two ears provides a sharp positive example.

**Natural intermediate results.** (i) polygonal chains and loops, carriers, and simplicity; (ii) strips and the two-sidedness lemma; (iii) crossing parity, local constancy, and the integer winding number; (iv) polygonal Jordan separation; (v) the polygonal crosscut theorem; (vi) two ears and polygon triangulation; (vii) polygonal Schoenflies; (viii) nonplanarity of `K₃,₃` for polygonal drawings.

**Consequences.** Both tracks depend on this.

---

## Layer 2: Separation, crosscuts, and invariance of domain

The milestone of this layer is the crosscut theorem.

⚠ Component count is a corollary of separation, but not the primary objective. The statement `Nat.card (ConnectedComponents Jᶜ) = 2`, the form the [lean-eval](https://github.com/leanprover/lean-eval) problem states, is not sufficient for `ConformalMapping`'s length-area argument or this roadmap's layer 7.

**From layer 1.** The polygonal crosscut theorem, nonplanarity of `K₃,₃` for polygonal drawings, the integer winding number.
**From Tau Ceti.** `IsJordanCurve` and the arc theory in `TauCeti/Topology/JordanCurve/`; `filledHull`; `IsJordanDomain` (`Analysis/Complex/Conformal/Jordan/Domain.lean`); `TauCeti/Topology/{Continuum,LocallyConnected}.lean`; the contour winding number in `TauCeti/Analysis/Contour/Winding/`.

**Representative formal statements.**

```lean
namespace IsJordanCurve
variable {J : Set ℂ} (hJ : IsJordanCurve J)

def inside  : Set ℂ := filledHull J \ J
def outside : Set ℂ := (filledHull J)ᶜ

theorem isConnected_inside      : IsConnected hJ.inside
theorem isConnected_outside     : IsConnected hJ.outside
theorem isBounded_inside        : Bornology.IsBounded hJ.inside
theorem not_isBounded_outside   : ¬ Bornology.IsBounded hJ.outside
theorem frontier_inside         : frontier hJ.inside = J
theorem frontier_outside        : frontier hJ.outside = J

/-- Every point of the curve is a limit of inside points. -/
theorem subset_closure_inside   : J ⊆ closure (filledHull J \ J)

/-- The inside of a Jordan curve is a Jordan domain: the hypothesis Carathéodory's theorem takes. -/
theorem isJordanDomain_inside   : IsJordanDomain hJ.inside

theorem dense_accessible : Dense {p ∈ J | hJ.Accessible p}

/-- The workhorse. -/
theorem crosscut (P : Set ℂ) (hP : hJ.IsCrosscut P) :
    ∃ J₁ J₂, IsJordanCurve J₁ ∧ IsJordanCurve J₂ ∧
      J₁ ∩ J₂ = P ∧ J₁ ∪ J₂ = J ∪ P ∧
      hJ.inside \ P = insideOf J₁ ∪ insideOf J₂ ∧ Disjoint (insideOf J₁) (insideOf J₂)

/-- The corollary, including the shape used by lean-eval. -/
theorem card_connectedComponents : Nat.card (ConnectedComponents ((J : Set ℂ)ᶜ)) = 2
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

- The order of development follows Thomassen. Approximate the paths that would have to cross the curve, not the curve itself, because Osgood gives an obstruction to curve approximation.  A curve can have positive measure (layer 0) whereas the crossing paths are compact arcs in an open set and are cheap to control. A hypothetical failure of separation, or a third complementary component, would result in a polygonal drawing of `K₃,₃`.
- Arc non-separation is proved by the chain-of-small-squares argument using the small-arc diameter bounds in `TauCeti/Topology/JordanCurve/SmallArc.lean`.
- ⚠ `invarianceOfDomain₂` is key. Without it neither `∂M` nor the boundary count is known to be a topological invariant of a surface. Its route needs nothing from the Jordan curve theorem: layer 1's integer winding number and its homotopy invariance show that the circle is not a retract of the disc, that gives Brouwer's fixed-point theorem by the usual construction of a retraction from a fixed-point-free map, and invariance of domain follows from Brouwer by the standard derivation. Mathlib has neither Brouwer nor invariance of domain nor degree theory for $C^0$ manifolds, and Brouwer is a reusable theorem in its own right.

**Examples and mathematical checks.** `subset_closure_inside` is stated in the same form as `TauCeti/Topology/FilledHull.lean`. `isJordanDomain_inside` is checked against the constructors of `IsJordanDomain` from a ball and from a convex set, which it subsumes. `crosscut` is checked on a worked example where the two pieces are visibly different (an off-centre chord of a disc). Brouwer is exercised on a rotation of the disc, whose only fixed point is the centre, and `boundaryComponentCount` is computed for the closed disc, one, and the transported sphere, zero.

**Natural intermediate results.** (i) `inside`, `outside`, boundedness, and connectedness; (ii) the common frontier; (iii) arc non-separation; (iv) accessibility and its density; (v) the crosscut theorem; (vi) the component count; (vii) no retraction, Brouwer, `invarianceOfDomain₂`, chart-independence of `∂M`, and the boundary count.

**Consequences.** `ConformalMapping` layer 5, through `isJordanDomain_inside`. Layer 7. `∂M` and the boundary count for the rest of this roadmap and for `SurfaceTopology`.

---

## Layer 3: The simplicial and piecewise-linear toolkit in dimension two

This layer develops everything the approximation theorem needs, built on Tau Ceti's existing API.

**From Tau Ceti.** `AbstractSimplicialComplex`, `Realization`, `link`, `closedStar`, `deletion`, barycentric subdivision and `barycentricSubdivisionRealizationHomeomorph`, `stellarSubdivision` and `StellarEquivalent`, `SimplicialMap`, `dimension`, the collapse API, `IsTriangulable`, `IsCombinatorialManifold`, `IsPLOn`.

**Representative formal statements.**

```lean
/-- General subdivision, heterogeneous in the vertex types. The eventual API may bundle the subdividing complex instead of exposing these parameters. -/
def Subdivides {ι' ι : Type*}
    (K' : AbstractSimplicialComplex ι') (K : AbstractSimplicialComplex ι) : Prop

theorem Subdivides.realization_homeomorph (h : Subdivides K' K) :
    Realization K' ≃ₜ Realization K

theorem Subdivides.stellarSubdivision (hσ : σ ∈ K) (hv : ({v} : Finset ι) ∉ K) :
    Subdivides (stellarSubdivision K σ v) K
theorem Subdivides.barycentricSubdivision : Subdivides K.barycentricSubdivision K

/-- Realizations of finite complexes are metrized by barycentric coordinates; the metric induces
    the existing topology, and it is what the approximation theorems measure with. -/
noncomputable def realizationDist (K : AbstractSimplicialComplex ι) [Finite K.faces] :
    Realization K → Realization K → ℝ
theorem realizationDist_inducesTopology (K : AbstractSimplicialComplex ι) [Finite K.faces] :
    TopologicalSpace.induced by `realizationDist` = the realization topology   -- schematic

def IsPLMap {K : AbstractSimplicialComplex ι} {L : AbstractSimplicialComplex κ}
    (f : Realization K → Realization L) : Prop :=
  ∃ (ι' κ' : Type) (K' : AbstractSimplicialComplex ι')
      (L' : AbstractSimplicialComplex κ'),
      Subdivides K' K ∧ Subdivides L' L ∧
      ∃ g : SimplicialMap K' L', SimplicialRealizes g f

theorem IsPLMap.comp : IsPLMap f → IsPLMap g → IsPLMap (g ∘ f)

/-- A PL homeomorphism becomes simplicial after subdividing source and target. -/
theorem exists_isomorphic_subdivisions
    (h : Realization K ≃ₜ Realization L) (hPL : IsPLMap h) :
    ∃ (ι' κ' : Type) (K' : AbstractSimplicialComplex ι')
      (L' : AbstractSimplicialComplex κ'),
      Subdivides K' K ∧ Subdivides L' L ∧ Nonempty (K' ≃ₛ L')

/-- Concrete, not an instance of a dimension-general recursion. -/
def IsCombinatorialSurface (K : AbstractSimplicialComplex ι) : Prop :=
  K.faces.Finite ∧ K.dimension = 2 ∧ K.IsPure ∧
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
- The common-subdivision theorem in this layer starts with a **PL** homeomorphism (or, equivalently, two PL triangulations of one polyhedron). Its conclusion is best stated as subdivisions of the two complexes together with a simplicial isomorphism. The two-dimensional Hauptvermutung in layer 5 is the deeper theorem that starts with an arbitrary topological homeomorphism and produces such a PL comparison. Keeping these two statements separate exposes a genuine mathematical distinction which could be hidden by a convenient choice of vertex types.
- The compatibility theorem with Tau Ceti's `IsCombinatorialManifold K 2` is proved here: a finite complex whose vertex links are circles or arcs is one whose vertex links are stellar equivalent to the boundary of a triangle or to a triangle, and conversely. No dimension-two result depends on it.
- Tau Ceti already has stellar subdivision with `StellarEquivalent`, and the homeomorphism between the realizations of a complex and its barycentric subdivision. `Subdivides` is the general relation both instantiate, and the realization homeomorphism for a general subdivision is the target.
- The realization of a finite complex is metrized by its barycentric coordinates. This metric is what layer 4's `ε` and layer 7's small-cell estimates measure with; no metric on realizations exists in Tau Ceti.
- Combinatorial circles and arcs in dimension one are concrete: a combinatorial circle is a finite connected 1-complex in which every vertex has exactly two neighbours; a combinatorial arc is a finite connected 1-complex in which exactly two vertices have one neighbour and the rest have two. These should not be based on a general sphere-recognition recursion.

**Examples and mathematical checks.** `IsCombinatorialSurface` is **false** for each of: two triangles sharing exactly one vertex; three triangles sharing an edge; the dunce hat; the cone on a theta graph. It is **true** for: the boundary of the tetrahedron; a triangulated disc; a triangulated Möbius band. Every one of these is a concrete finite complex checked by `decide`. ⚠ This is the layer where vacuity is a risk, because pinch points are possible for abstract complexes.

**Natural intermediate results.** (i) general subdivision and its realization homeomorphism, with stellar and barycentric subdivision as instances; (ii) the metric on a finite realization; (iii) purity, facets, and skeleta; (iv) isomorphic subdivisions for PL-homeomorphic complexes; (v) `IsPLMap` and its closure properties; (vi) combinatorial circles and arcs; (vii) `IsCombinatorialSurface` and the counter-witness battery; (viii) the realization theorem; (ix) the compatibility theorem with `IsCombinatorialManifold`; (x) the comparison of `IsPLOn` with `IsPLMap`.

**Consequences.** Layers 4, 5, 6. `SurfaceTopology` layer 3.

---

## Layer 4: The piecewise-linear approximation theorem

Moise's PL approximation theorem is the central theorem of the piecewise-linear. In its local form, a homeomorphism from an open polyhedron in a triangulated surface into the plane or another triangulated surface admits an arbitrarily close PL-homeomorphic approximation. The familiar compact statement for a homeomorphism between triangulated surfaces is a corollary.

This is the main technical engine for both Radó's theorem and the Hauptvermutung.

**From layers 1 and 3.** Polygonal Schoenflies, general position for polygonal arcs, subdivision, `IsPLMap`.

**Representative formal statements.**

```lean
/-- Moise's local form. Here `U` and `V` are open polyhedra in the plane or in the closed half-plane,
    `φ` is strongly positive, and when `U` meets the boundary line the approximation preserves it;
    the exact subtype packaging is schematic. -/
theorem exists_pl_approximation_open
    (f : U ≃ₜ V) (φ : U → ℝ) (hφ : StronglyPositive φ) :
    ∃ g : U ≃ₜ V, IsPLMap g ∧ ∀ x, realizationDist _ (f x) (g x) < φ x

/-- Compact global form. -/
theorem exists_pl_approximation {K : AbstractSimplicialComplex ι}
    {L : AbstractSimplicialComplex κ}
    (hK : IsCombinatorialSurface K) (hL : IsCombinatorialSurface L)
    (f : Realization K ≃ₜ Realization L) (ε : ℝ) (hε : 0 < ε) :
    ∃ g : Realization K ≃ₜ Realization L, IsPLMap g ∧ ∀ x, realizationDist L (f x) (g x) < ε

/-- Relative form, agreeing with `f` on a subcomplex. -/
theorem exists_pl_approximation_rel {A : Set (Realization K)}
    (hA : IsSubcomplexCarrier A) (hf : IsPLMap (f.restrict A)) (ε : ℝ) (hε : 0 < ε) :
    ∃ g, IsPLMap g ∧ g.restrict A = f.restrict A ∧ ∀ x, realizationDist L (f x) (g x) < ε
```

**Mathematical route and formalization notes.**

- The proof first approximates the image of the 1-skeleton by a polygonal embedding and then extends across each 2-simplex by polygonal Schoenflies. The control function is strongly positive rather than globally constant so that the theorem applies on noncompact open subsets, as required in Radó's inductive construction.
- The relative form is needed for surfaces with boundary and for the isotopy statement in layer 8.
- The argument uses polygonal Schoenflies, but it does not need the topological Schoenflies theorem or the tameness results of layer 7.
- The half-plane form of the local theorem, with the boundary line preserved, is what layer 5's boundary case consumes; it is not a separate theorem but the same statement with the boundary carried along.

**Examples and mathematical checks.** The approximation is exhibited on a worked example where the original homeomorphism is not piecewise linear (a radial map with a non-linear radial profile). The epsilon is checked to be achievable for arbitrarily small values, that is, the statement is not accidentally vacuous by allowing `g = f`.

**Natural intermediate results.** (i) the local open-set approximation theorem; (ii) general position and polygonal approximation of the 1-skeleton; (iii) the mesh-refinement construction; (iv) correction on the 1-skeleton; (v) filling triangles by polygonal Schoenflies; (vi) the compact and relative forms.

---

## Layer 5: Radó's theorem and the two-dimensional Hauptvermutung

This layer shows combinatorial invariants are topological.

⚠ **Neither of these depends on the Schoenflies theorem.** Moise makes this point immediately after his triangulation theorem.  The usual derivation from Schoenflies "is in a way misleading", since in dimension three Schoenflies fails and triangulation still holds.

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

/-- Pachner's theorem in dimension two: triangulations with a common subdivision are related by
    the bistellar moves `1 ↔ 3` and `2 ↔ 2`, and, for surfaces with boundary, by those together with
    the boundary moves, relative to the boundary. The relation is closed under isomorphism of the
    vertex type, as the conventions require. -/
inductive BistellarMove : BundledCombinatorialSurface → BundledCombinatorialSurface → Prop
  | oneThree : ...
  | twoTwo : ...
  | boundary : ...

theorem pachner₂ {K L} (hK : IsCombinatorialSurface K) (hL : IsCombinatorialSurface L)
    (h : ∃ (ι' : Type) (K' : AbstractSimplicialComplex ι'), Subdivides K' K ∧ Subdivides K' L) :
    Relation.ReflTransGen (isoClosure BistellarMove) ⟨K, hK⟩ ⟨L, hL⟩
```

**Mathematical route and formalization notes.**

- Radó's construction grows an already triangulated region across a countable chart cover. On each overlap, the **local** form of the approximation theorem replaces a topological coordinate change by a controlled PL homeomorphism; this is the point at which the approximation theorem enters the triangulation proof.
- The boundary case runs the same construction in half-plane charts, carrying the boundary along as a subcomplex at every stage: layer 4's local theorem is applied in its half-plane form, the polygonal replacement of chart boundaries preserves the boundary line, and the exposed boundary faces survive subdivision, relabelling, and gluing. No collar is used. The topological collar is then a corollary: a triangulated surface with boundary has a combinatorial collar, and `IsCollared` in Tau Ceti's sense follows by realization. Tau Ceti's `Boundary/Collar/` files supply the chart vocabulary and smooth collars only.
- Every boundary component is a circle because the boundary subcomplex is a combinatorial 1-manifold, hence a disjoint union of combinatorial circles.
- Pachner's theorem is what turns "invariant under the elementary moves" into "topological invariant": with the Hauptvermutung it says that triangulations of homeomorphic compact surfaces are related by bistellar moves. Its proof runs through the common subdivision: its vertices are inserted by `1 → 3` moves and flips, and two triangulations of a disc on the same vertex set are flip-connected.
- Locally finite triangulations of second-countable noncompact surfaces are built only insofar as the compact proof needs them, and the general noncompact Radó is out of scope.

**Examples and mathematical checks.** A triangulation is produced for a surface presented only by charts, with no combinatorial data supplied. For the Hauptvermutung, the tetrahedral and octahedral triangulations of the sphere are refined to isomorphic subdivisions; the example is stated in the same two-subdivision form as the theorem. Pachner's theorem is checked on the tetrahedral and octahedral spheres by exhibiting a move sequence.

**Natural intermediate results.** (i) finite chart covers and shrinking; (ii) polygonal replacement of chart boundaries; (iii) assembly and Radó, closed case; (iv) boundary circles and the collar, as corollaries; (v) Radó with boundary; (vi) the Hauptvermutung; (vii) Pachner's theorem.

**Consequences.** Layer 6, layer 8, `GeometricTopology` layer 11, `SurfaceTopology` throughout.

---

## Layer 6: The Euler characteristic and orientability

The invariants that `SurfaceTopology` runs on: the Euler characteristic, orientability, and a chosen orientation. Each is defined on a finite combinatorial surface, proved invariant under subdivision and isomorphism, and carried to the surface by Radó and the Hauptvermutung. The boundary count, the third invariant of the classification, is layer 2's.

**From layers 2, 3, and 5.** `boundaryComponentCount`, `Subdivides`, `IsCombinatorialSurface`, Radó, the Hauptvermutung, Pachner.

**Representative formal statements.**

```lean
def AbstractSimplicialComplex.eulerChar (K : AbstractSimplicialComplex ι) [Finite K.faces] : ℤ :=
  ∑ i : Fin 3, (-1 : ℤ) ^ (i : ℕ) * (K.facesOfDim i).card

theorem eulerChar_subdivision (h : Subdivides K' K) : K'.eulerChar = K.eulerChar
theorem eulerChar_simplicialIso (h : K ≃ₛ L) : K.eulerChar = L.eulerChar

/-- A coherent orientation: a cyclic order on each triangle such that the two triangles on an
    interior edge induce opposite directions on it. -/
structure Orientation (K : AbstractSimplicialComplex ι) (hK : IsCombinatorialSurface K) where ...
def IsOrientable (K : AbstractSimplicialComplex ι) (hK : IsCombinatorialSurface K) : Prop :=
  Nonempty (Orientation K hK)

theorem isOrientable_subdivision (h : Subdivides K' K) : IsOrientable K' hK' ↔ IsOrientable K hK
theorem isOrientable_simplicialIso (h : K ≃ₛ L) : IsOrientable K hK ↔ IsOrientable L hL

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
    when a PL homeomorphism isotopic to the comparison map carries one orientation to the other. -/
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
- An orientation is data, and the quotient defining `Surface.Orientation` needs the lemma that isotopic homeomorphisms act the same way. The route avoids homology: the sign of a PL homeomorphism between oriented triangulated surfaces is whether it preserves the two sheets of the orientation double cover, and an isotopy lifts to the cover by path lifting, so isotopic maps have the same sign. Layer 8's comparison of mapping class groups spends the same lemma.
- **The boundary convention.** An oriented triangle directs its edges, and on a boundary circle the directions agree, so an orientation of `M` directs each boundary circle. The convention is that the surface lies to the left of the direction, so the unit disc's boundary runs counterclockwise. `SurfaceTopology`'s capping, doubling, and mapping-class conventions read this one.
- **General principle of both roadmaps.** Every invariant is defined on a finite presentation, proved invariant under subdivision and the elementary moves, and upgraded to a homeomorphism invariant by the Hauptvermutung, or by Pachner's theorem when only invariance under the moves is at hand. There is no comparison theorem with Mathlib's singular homology or fundamental group here or in `SurfaceTopology`.

**Examples and mathematical checks.** On concrete finite complexes, `eulerChar` reduces to an explicit alternating sum. It computes 2 for the tetrahedron boundary, 2 for the octahedron boundary, 1 for a triangulated disc, 0 for a triangulated annulus, 0 for a triangulated Möbius band. `eulerChar_subdivision` is checked against a barycentric subdivision of the tetrahedron boundary, where the face counts change and the alternating sum does not. Orientability is decided by `decide` on the tetrahedron boundary and on a triangulated Möbius band, and the two orientations of the tetrahedron boundary are exhibited. The disc's Euler characteristic is computed on the surface structure of layer 0.

**Natural intermediate results.** (i) `eulerChar` on finite complexes and its effective computation; (ii) subdivision invariance; (iii) isomorphism invariance; (iv) the surface-level definition and transport; (v) the worked example table; (vi) orientability on complexes and its invariance; (vii) `Surface.IsOrientable` and `Surface.Orientation`, with the isotopy lemma and the boundary convention.

**Consequences.** Layer 8. `SurfaceTopology` layers 3, 5, 7, 8, and 9.

---

## Layer 7: The Schoenflies theorem and tameness

Schoenflies is one of the pinnacles of this roadmap.  It's why `GeometricTopology` layer 2's local flatness hypothesis is always true in dimension two.

**From layers 0 and 2.** Alexander's trick, `IsotopicRel`, the crosscut theorem, accessibility, `isJordanDomain_inside`.

**Representative formal statements.**

```lean
theorem schoenflies {J : Set ℂ} (hJ : IsJordanCurve J) :
    ∃ h : ℂ ≃ₜ ℂ, h '' J = Metric.sphere 0 1

theorem schoenflies_closure {J : Set ℂ} (hJ : IsJordanCurve J) :
    Nonempty (closure hJ.inside ≃ₜ Metric.closedBall (0 : ℂ) 1)

local notation "S²" => Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1
theorem schoenflies_sphere {J : Set S²} (hJ : IsJordanCurve J) :
    ∃ h : S² ≃ₜ S², h '' J = equator

/-- The inside of a Jordan curve is simply connected. With layer 2's `isJordanDomain_inside`, this
    is the pair of hypotheses under which `ConformalMapping`'s Carathéodory theorem applies. -/
theorem isSimplyConnected_inside {J : Set ℂ} (hJ : IsJordanCurve J) : IsSimplyConnected hJ.inside

variable {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]

/-- Tameness. The discharge of `GeometricTopology` layer 2's hypothesis, stated on the embedding with
    its model factors: charts of `M` valued in `F × F'` carry the image onto `F × {0}`. For a simple
    closed curve `F` is the line; for an arc it is the half-line, so that the endpoints are covered. -/
theorem isLocallyFlat_of_isEmbedding_circle (f : Circle → M) (hf : IsEmbedding f)
    (hint : Set.range f ⊆ (𝓡∂ 2).interior M) :
    IsLocallyFlat (EuclideanSpace ℝ (Fin 1)) ℝ f
theorem isLocallyFlat_of_isEmbedding_unitInterval (f : unitInterval → M) (hf : IsEmbedding f)
    (hint : Set.range f ⊆ (𝓡∂ 2).interior M) :
    IsLocallyFlat (EuclideanHalfSpace 1) ℝ f

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
    piecewise-linear arcs of one triangulation. -/
theorem exists_ambientIsotopy_pl_of_arcs (A : Fin n → Set M) (hA : ∀ i, IsArc (A i))
    (hmeet : ∀ i j, i ≠ j → A i ∩ A j ⊆ endpoints (A i) ∩ endpoints (A j))
    (hint : ∀ i, A i ⊆ (𝓡∂ 2).interior M) :
    ∃ e : M ≃ₜ M, Isotopic e (Homeomorph.refl M) ∧
      ∃ K (hK : IsCombinatorialSurface K) (t : Realization K ≃ₜ M), ∀ i, t ⁻¹' (e '' A i) is a subcomplex
```

**Mathematical route and formalization notes.**

- No homeomorphism is built directly.  Instead this approach builds two matched finite cell decompositions, one of the closed interior and one of the closed square, isomorphic as cellulations and agreeing with a chosen boundary correspondence.  It refines them alternately so that cells become small on both sides and constructs the homeomorphism off the nested closed stars. Every finite stage is a plane graph governed by layer 2's crosscut theorem. No polygonal approximation of the curve appears anywhere.
- The matched cellulations here are finite approximating devices internal to this proof. They are not the generalized maps of `SurfaceTopology` and carry no realization theory of their own.
- Tameness of a finite family of arcs is proved arc by arc and then at the joints: each arc extends to a simple closed curve away from the others, by layer 2's accessibility, and Schoenflies straightens it; at a common endpoint the finitely many arcs are straightened together by a second application of Schoenflies inside a small disc around the point. The second step is where a finite star needs more than the tameness of each of its arcs.
- An analytic derivation exists in principle: `ConformalMapping`'s Carathéodory theorem gives `closure hJ.inside ≃ₜ closedBall 0 1`, and gluing the inside and outside discs along `J` with Alexander's trick would give `schoenflies`. It is not taken, because Carathéodory takes the homotopy hypothesis `IsSimplyConnected hJ.inside`, which is available here only after Schoenflies; once `schoenflies_closure` is proved, `isSimplyConnected_inside` is immediate.

**Examples and mathematical checks.** `schoenflies_closure` is instantiated on a curve that is not rectifiable. The tameness statements are stated against Tau Ceti's `IsLocallyFlat F F' f` with its model factors, not against a set-valued restatement, and `isSimplyConnected_inside` against Mathlib's `IsSimplyConnected`. The tameness of a star of three arcs at a point is exhibited, since it is not a consequence of the tameness of each arc. The core circle of a Möbius band is the essential counterexample to an unconditional product collar: it is tame and locally flat but one-sided. A note also records that automatic tameness fails in dimension three, where wild embeddings occur.

**Natural intermediate results.** (i) `IsCrosscut` and finite cellulations of a Jordan domain; (ii) matching and refinement transfer; (iii) alternation and the small-cell estimate; (iv) the nested-star limit and `schoenflies_closure`; (v) the ambient and spherical forms; (vi) tameness of arcs; (vii) tameness of simple closed curves; (viii) the annulus/Möbius regular-neighbourhood dichotomy and the two-sided collar corollary; (ix) the inside is simply connected; (x) tameness of finite families of arcs.

**Consequences.** `GeometricTopology` layer 2. `ConformalMapping` layer 5, through `isSimplyConnected_inside`. `SurfaceTopology` layers 5 and 9.

---

## Layer 8: Uniqueness of the piecewise-linear and smooth structures

Where the two tracks rejoin. Radó and the Hauptvermutung say that a compact surface has a piecewise-linear structure and that it is unique up to PL isomorphism; this layer says the same for homeomorphisms, isotopies, and smooth structures. Every statement is in triangulation terms; the chart-based PL manifolds of `GeometricTopology` enter only through the bridge recorded below.

**From layers 3, 4, 5, and 7.** `IsPLMap`, the relative approximation theorem, Radó, the Hauptvermutung, Schoenflies, Alexander's trick.
**From Tau Ceti and Mathlib.** `PLGroupoid` (`Geometry/Manifold/PLGroupoid.lean`), `IsManifold`, `Diffeomorph`, `Isotopic`, `IsotopicRel`.

**Representative formal statements.**

```lean
variable {M N : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]
  [CompactSpace M] [TopologicalSpace N] [ChartedSpace (EuclideanHalfSpace 2) N] [T2Space N]
  [CompactSpace N]

/-- A PL structure on a compact surface is a triangulation. Two are equivalent when the identity of
    `M`, read through them, is PL; any two are equivalent, which is the Hauptvermutung. -/
structure PLStructure (M : Type*) [TopologicalSpace M] where
  ι : Type
  K : AbstractSimplicialComplex ι
  hK : IsCombinatorialSurface K
  e : Realization K ≃ₜ M
def PLStructure.Equiv (s t : PLStructure M) : Prop := IsPLMap (t.e.symm ∘ s.e)
theorem PLStructure.equiv (s t : PLStructure M) : s.Equiv t

/-- Every homeomorphism of compact surfaces is isotopic to a PL homeomorphism, and rel a subcomplex
    on which it is already PL. -/
theorem exists_isotopic_plHomeomorph (s : PLStructure M) (t : PLStructure N) (f : M ≃ₜ N) :
    ∃ g : M ≃ₜ N, IsPLMap (t.e.symm ∘ g ∘ s.e) ∧ Isotopic f g
theorem exists_isotopicRel_plHomeomorph (s : PLStructure M) (t : PLStructure N) (f : M ≃ₜ N)
    {A : Set M} (hA : A is the carrier of a subcomplex of s) (hf : IsPLMap on A) :
    ∃ g : M ≃ₜ N, IsPLMap (t.e.symm ∘ g ∘ s.e) ∧ IsotopicRel A f g

/-- Epstein: homotopic homeomorphisms of a compact surface are isotopic, and homotopic PL
    homeomorphisms are PL isotopic. Hence PL isotopy classes inject into topological ones. -/
theorem isotopic_of_homotopic (f g : M ≃ₜ N) (h : ContinuousMap.Homotopic f g) : Isotopic f g
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
    diffeomorphism isotopic to the identity. -/
def PLStructure.smoothing (s : PLStructure M) : ChartedSpace (EuclideanHalfSpace 2) M
theorem PLStructure.smoothing_isManifold (s : PLStructure M) :
    @IsManifold _ _ _ _ _ _ _ (𝓡∂ 2) ∞ M _ s.smoothing
theorem PLStructure.smoothing_isPL (s : PLStructure M) :
    every chart of s.smoothing is PL for s   -- schematic
theorem PLStructure.smoothing_unique (s : PLStructure M)
    (σ τ : ChartedSpace (EuclideanHalfSpace 2) M) (hσ : smooth and PL for s) (hτ : smooth and PL for s) :
    ∃ φ : M ≃ₘ⟮𝓡∂ 2, 𝓡∂ 2⟯ M, Isotopic φ.toHomeomorph (Homeomorph.refl M)   -- σ on the left, τ on the right

/-- Isotopic diffeomorphisms of compact surfaces are smoothly isotopic. -/
theorem smoothIsotopic_of_isotopic (φ ψ : M ≃ₘ⟮𝓡∂ 2, 𝓡∂ 2⟯ N)
    (h : Isotopic φ.toHomeomorph ψ.toHomeomorph) : SmoothIsotopic φ ψ
```

**Mathematical route and formalization notes.**

- A PL structure is a triangulation, and the Hauptvermutung is exactly the statement that any two are equivalent, so uniqueness is a restatement; what the layer adds is the treatment of maps. The PL homeomorphism type `≃ₚₗ` bundles a homeomorphism with `IsPLMap` in both directions.
- Isotopy to a PL homeomorphism is layer 4's relative approximation theorem followed by Alexander's trick: a fine enough PL approximation of `f` differs from `f` by a map that is small on each triangle, and coning fills each triangle with an isotopy. The rel form keeps a subcomplex fixed throughout, which is what surfaces with boundary and layer 9 of `SurfaceTopology` need.
- Epstein's theorem is the injectivity that the mapping class group comparisons of `SurfaceTopology` layer 9 need. Its route: homotopic simple closed curves are isotopic, in Epstein's piecewise-linear form, then the Alexander method cuts the surface along a filling system of curves and reduces to the disc, where Alexander's trick finishes.
- Smoothing follows Whitehead and Munkres: a triangulated surface is made `C¹` triangle by triangle, the corners along edges and at vertices are rounded with a partition of unity on the star of each simplex, and the result is a smooth atlas whose transition maps are PL for the given structure. Uniqueness uses layer 4's relative approximation to make a diffeomorphism between two smoothings PL, then Epstein to make it isotopic to the identity; smooth isotopy of isotopic diffeomorphisms is Munkres' smoothing of the isotopy.
- `GeometricTopology` owns the chart-based `PLGroupoid`. The bridge theorem is stated here because it is what a consumer of both roadmaps needs, and its proof is the reconciliation that `GeometricTopology` layer 11 targets.

**Examples and mathematical checks.** Two genuinely different triangulations of the torus are shown PL-equivalent, with the PL homeomorphism produced. A homeomorphism of the torus that is not PL is shown isotopic to a PL one. A note records that uniqueness of smooth structure fails in dimension four, so the smoothing theorem is visibly dimension-specific.

**Natural intermediate results.** (i) PL structures and their equivalence; (ii) isotopy to a PL homeomorphism, absolute and rel a subcomplex; (iii) Epstein's theorem; (iv) the Top/PL classification agreement; (v) the bridge to `PLGroupoid`; (vi) corner rounding and existence of a smoothing; (vii) uniqueness of the smoothing and smooth isotopy.

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

**Deriving Schoenflies from Carathéodory.** **Not taken.** `ConformalMapping`'s Carathéodory
theorem takes Mathlib's homotopy-theoretic `IsSimplyConnected` as a hypothesis, and for the
inside of a Jordan curve that is available only after Schoenflies. The direction that does hold
is recorded in layer 7: `isSimplyConnected_inside` is a consequence of Schoenflies, and it is
what makes Carathéodory applicable to every Jordan curve.

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
- Riemann surfaces, conformal structure, uniformization, Carathéodory's theorem. `ConformalMapping` owns it. This roadmap supplies its missing input and consumes nothing analytic in return.
- Singular homology, Mayer–Vietoris, excision, van Kampen, cohomology, duality.
- Continuum theory beyond the local-connectedness lemmas actually consumed. See the roadmap-for-a-roadmap above.
- Noncompact surfaces beyond what the compact proofs require. The classification of noncompact surfaces (Kerékjártó) is a natural follow-on roadmap.
- Measure-theoretic properties of curves beyond the single Osgood example in layer 0.

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

- C. Thomassen, *The Jordan–Schönflies theorem and the classification of surfaces*,
  Amer. Math. Monthly **99** (1992), 116–130. The route for layers 1, 2, and 7.
- `alonamaloh/jordan-schoenflies`, the blueprint. The only source cited here written at
  formalization granularity, with a statement-level index and a suggested module order.
  Treat it as the primary route document for layers 1, 2, and 7.
- E. Moise, *Geometric Topology in Dimensions 2 and 3*, chapters 1–9. The route for layers 3,
  4, 5, and 8. Note in particular his remark following the triangulation theorem that
  deriving it from Schoenflies "is in a way misleading".
- C. Rourke and B. Sanderson, *Introduction to Piecewise-Linear Topology*, chapters 1–3.
  The PL vocabulary, already followed by `TauCeti/AlgebraicTopology/SimplicialComplex/`.
- M. H. A. Newman, *Elements of the Topology of Plane Sets of Points*. Classical reference
  for the plane material.
- J. R. Munkres, *Elementary Differential Topology*; J. H. C. Whitehead, *On C¹-complexes*.
  The smoothing route for layer 8.
- D. B. A. Epstein, *Curves on 2-manifolds and isotopies*, Acta Math. **115** (1966), 83–107. The
  route for layer 8's isotopy theorem.
- J. Cannon, *Topology as Fluid Geometry*, volume 2. Exposition reference for the
  point-set lemmas in layer 0, and the reference for the roadmap-for-a-roadmap above. Note
  that it is an idiosyncratic tour rather than a reference text, and its selection principle
  is explicitly aesthetic; it should not be used to scope a roadmap.