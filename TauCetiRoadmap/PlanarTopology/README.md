# Roadmap: Planar topology and the piecewise-linear structure of surfaces

Two-dimensional topology is the last dimension in which several kinds of structure coincide without additional hypotheses. Every surface is triangulable; topological homeomorphisms between triangulated surfaces can be replaced by piecewise-linear ones; embedded arcs and simple closed curves are tame; and every topological surface has essentially unique piecewise-linear and smooth structures. The corresponding statements separate in higher dimensions: triangulations and the Hauptvermutung can fail, and wild embeddings make local flatness a genuine condition. This roadmap develops the specifically two-dimensional theorems behind that coincidence.

That framing matters for how the results are used. These theorems are not obtained by specializing a dimension-independent theory: their proofs use planar separation, polygonal approximation, and the combinatorics of two-dimensional links. Some individual conclusions also hold in dimension three, but the full package—especially automatic tameness—is specifically two-dimensional. The *definitions* are shared with `GeometricTopology`; see the interface table below.

The summits, in order of construction:

1. **The Jordan curve theorem and the crosscut theorem**, with the frontier and
   accessibility API that feeds into `ConformalMapping`.
2. **Radó's theorem**: every compact surface is triangulable.
3. **The two-dimensional Hauptvermutung**: homeomorphic triangulated surfaces admit
   isomorphic subdivisions. Together with Radó's theorem, this makes the piecewise-linear
   structure of a compact surface well defined up to PL isomorphism.
4. **The Euler characteristic** of a compact surface, well defined and a homeomorphism
   invariant.
5. **The Schoenflies theorem** in its polygonal, planar, spherical, and relative forms, and
   tameness of arcs and simple closed curves in a surface.
6. **Uniqueness of the piecewise-linear and smooth structures** on a compact surface.

The companion roadmap
[SurfaceTopology](../SurfaceTopology/README.md) consumes items 2, 3, and 4 and proves the classification of compact surfaces. This roadmap is simplicial only: generalized maps, hypermaps, cellulations, and polygon words appear nowhere in it.

Each layer below is organized around a theorem, its mathematical dependencies, and a proof route. The displayed Lean declarations are representative interfaces rather than part of the mathematical statement; they remain useful for exposing how the layers fit into Tau Ceti.

---

## Relationship to other roadmaps

### This roadmap supplies

| Consumer | What it needs | Status there today |
|---|---|---|
| `ConformalMapping` layer 5 | plane separation for Jordan curves; `J ⊆ closure (filledHull J \ J)` | named as an open frontier item in `ConformalMapping/STATUS.md` and in the roadmap role of `TauCeti/Topology/FilledHull.lean` |
| `GeometricTopology` layer 11 | `IsTriangulable` is unconditional in dimension two; the two-dimensional Hauptvermutung | the layer states that triangulability fails in dimension five and that the Hauptvermutung is false in general, but does not currently claim dimension two |
| `GeometricTopology` layer 2 | `IsLocallyFlat` is automatic for arcs and simple closed curves in a surface | the predicate exists; the two-dimensional discharge does not |
| `GeometricTopology` layer 1 | invariance of domain in dimension two, hence chart-independence of the manifold boundary in the topological (`k = 0`) case | `isBoundaryPoint_iff_mem_frontier_range` carries the hypothesis `hk : k ≠ 0` |
| `SurfaceTopology` | Radó, the Hauptvermutung, Euler characteristic, Schoenflies, tameness | not built |

### This roadmap consumes

The mathematical development is intended to use the following existing definitions and
theorems rather than introduce parallel versions.

| Item | Location | Owner |
|---|---|---|
| `Isotopy`, `Isotopic` | `TauCeti/Topology/Homotopy/Isotopy/{Basic,Comp,Prod}.lean` | `GeometricTopology` layer 1 |
| `AmbientIsotopy`, `AmbientIsotopic` | `TauCeti/Topology/Homotopy/AmbientIsotopic/{Basic,Complement,Naturality}.lean` | `GeometricTopology` layer 1 |
| `Realization`, `Face`, `faceInclusion`, `StandardSimplex` | `TauCeti/AlgebraicTopology/SimplicialComplex/Realization.lean` | `GeometricTopology` layer 11 |
| `link`, `closedStar`, `deletion` | `TauCeti/AlgebraicTopology/SimplicialComplex/LinkStar.lean` | `GeometricTopology` layer 11 |
| barycentric subdivision, `barycentricSubdivisionMap` | `TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/{Basic,Realization}.lean` | `GeometricTopology` layer 11 |
| `SimplicialMap`, `domainRestrict` | `TauCeti/AlgebraicTopology/SimplicialComplex/Maps.lean` | `GeometricTopology` layer 11 |
| `dimension` | `TauCeti/AlgebraicTopology/SimplicialComplex/Dimension.lean` | `GeometricTopology` layer 11 |
| the collapse API | `TauCeti/AlgebraicTopology/SimplicialComplex/Collapse/`, `ElementaryCollapse.lean` | `GeometricTopology` layer 11 |
| `IsTriangulable` | `TauCeti/Topology/Triangulable.lean` | `GeometricTopology` layer 11 |
| `IsLocallyFlat`, `IsSliceChart`, `IsSliceEmbedding` | `TauCeti/Geometry/Manifold/LocallyFlat/{Basic,Smooth}.lean` | `GeometricTopology` layer 2 |
| half-space boundary model, boundary charts, collars | `TauCeti/Geometry/Manifold/Boundary/{Basic,Charts,Model}.lean`, `Boundary/Collar/{Basic,Chart}.lean` | `GeometricTopology` layer 1 |
| `IsJordanCurve` and the arc theory | `TauCeti/Topology/JordanCurve/{Basic,Path,Separation,SmallArc,Subcontinuum}.lean` | `ConformalMapping` |
| `filledHull` | `TauCeti/Topology/FilledHull.lean` | `ConformalMapping` |
| `IsJordanDomain` | `TauCeti/Analysis/Complex/Conformal/JordanDomain.lean` | `ConformalMapping` |
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

### The circle

`Circle`, the unit circle of `ℂ`, is the statement-level circle, because `TauCeti.IsJordanCurve C` is defined as `Nonempty (C ≃ₜ Circle)`. Its group structure is used when gluing two Schoenflies discs along a curve.

`AddCircle (1 : ℝ)` is the parametrization used whenever lifting, degree, or a linear order on a lift is needed. `AddCircle.homeomorphCircle`, `Circle.exp`, and `sphereCircleHomeomorph` are the bridges; layer 0 states the round trips.

⚠ `CircularOrder` on the topological circle has nothing to do with cyclic words. Keep them in separate namespaces with no coercion between them.

### Surfaces

A **topological surface** is a `ChartedSpace (EuclideanSpace ℝ (Fin 2)) M` with `T2Space M`, plus second countability where needed; a **surface with boundary** charts to `EuclideanHalfSpace 2`. Compactness plus Hausdorff plus locally Euclidean gives second countability, and layer 0 proves that rather than assuming it.

Manifold boundary `∂M` is the set of points that are boundary points in some chart. ⚠ Chart-independence in the topological case is **not** available from `isBoundaryPoint_iff_mem_frontier_range`, which requires `k ≠ 0`. It follows from invariance of domain, proved in layer 2. Nothing in this roadmap may use `∂M` before layer 2.

### Simplicial and PL

Abstract simplicial complexes are Tau Ceti's (`PreAbstractSimplicialComplex` / `AbstractSimplicialComplex`, `SetLike`, `Face K := {σ : Finset ι // σ ∈ K}`, realization into `ι →₀ ℝ`). No private complex type.

A **PL map** is defined by existential quantification over subdivisions of the domain complex, not by a triangulation. Composability then depends on the common-subdivision theorem, which is a layer 3 target.

`IsCombinatorialSurface` is defined concretely by the link condition: every vertex link is a combinatorial circle or a combinatorial arc, and every edge lies in one or two triangles. It is *not* defined by instantiating a dimension-general recursion. If `GeometricTopology` later builds `IsCombinatorialManifold`, then equality at `n = 2` is a compatibility theorem, listed in layer 3's targets.

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
 |    L2 separation, crosscuts, invariance of domain
 |    L7 topological Schoenflies and tameness
 |
 \____ Track II (piecewise-linear)
      L3 simplicial and PL toolkit in dimension two
      L4 the PL approximation theorem
      L5 Rado and the two-dimensional Hauptvermutung
      L6 Euler characteristic
           |
           L8 uniqueness of PL and smooth structure  (joins I and II)
```

---

## Layer 0: Conventions, transport, and plane pathologies

This preliminary layer fixes the ambient models and transport lemmas used throughout the roadmap. It also contains two classical constructions showing that the hypotheses in later separation theorems are necessary.  It also describes Alexander's trick.

**From Mathlib and Tau Ceti.** `Complex.orthonormalBasisOneI`, `OrthonormalBasis.repr`, `Circle`, `AddCircle`, `AddCircle.homeomorphCircle`, `Circle.exp`, `sphereCircleHomeomorph`, `Isotopy`, `Isotopic`, `AmbientIsotopic`, `Continuum`, `LocallyConnected`.

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

/-- Compact plus Hausdorff plus locally Euclidean gives second countable. -/
instance (priority := low) {M : Type*} [TopologicalSpace M] [CompactSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 2)) M] : SecondCountableTopology M

/-- Isotopy relative to a subset; intended for the shared isotopy API. -/
def IsotopicRel (A : Set X) (f g : C(X, Y)) : Prop


/-- Alexander's trick, extension form. A homeomorphism of the boundary sphere cones radially to a homeomorphism of the closed ball. Stated dimension-generally; only
    `n = 1` is used here. -/
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

/-- The PL flavor, which is what layer 4 spends: coning a PL homeomorphism of a polygon boundary over the polygon. -/
theorem isPLMap_coneExtend (h) (hPL : IsPLMap h) : IsPLMap (coneExtend h)


/-- Plane pathologies: these certify that later hypotheses cannot be weakened. -/
theorem exists_spaceFillingCurve :
    ∃ f : C(unitInterval, Metric.closedBall (0 : ℂ) 1), Surjective f

theorem exists_jordanCurve_not_rectifiable :
    ∃ J : Set ℂ, IsJordanCurve J ∧ ¬ IsRectifiable J

theorem exists_jordanCurve_volume_pos : ∃ J : Set ℂ, IsJordanCurve J ∧ 0 < volume J


```
**Mathematical route and formalization notes.**

- Alexander's trick is short but needed in three places. L4 uses the PL version to correct the 2-skeleton and fills each triangle. L7 uses the topological version when it glues the two Schoenflies discs along the curve. L8 uses the isotopy form in exists_isotopic_plHomeomorph.

- The space-filling curve is why the Jordan curve theorem needs injectivity, and the non rectifiable curve (Koch snowflake) shows why one may not assume a curve is rectifiable.  The positive measure Osgood curve is why one may not assume the curve is measure 0.
- ⚠ The Osgood construction may be deferred to layer 7 without blocking anything, if its difficult to formalize

**Examples and mathematical checks.** The round trips for `planeEquiv`, `Circle`, and `AddCircle` are proved explicitly, and at least one metric theorem is transported through the plane equivalence. The space-filling curve is given by a concrete construction rather than by an unstructured existence assertion.

**Natural intermediate results.** (i) plane transport and the `perp`/`det` API; (ii) circle transport; (iii) second countability and surface conventions; (iv) Alexander's trick: coneExtend, the norm identity, the isotopy form, and the PL flavour. (v) relative and supported isotopy, in the shared isotopy library; (vi) the space-filling curve; (vii) the Osgood curve.

---

## Layer 1: Polygonal Foundations

This layer includes dimension two results that are true for elementary reasons. This layer is entirely finite and produces the identity that both tracks run on.

The organizing object is the **crossing parity** of a point against a closed polygon.  The additive identity that makes the theory work is: cutting a polygonal Jordan curve by a polygonal crosscut splits it into two polygonal Jordan curves whose parities add.

**From layer 0.** The plane, `perp`, `det`, the sup-norm comparison.
**From Tau Ceti.** `TauCeti/Analysis/Contour/Winding/` for the comparison with the analytic winding number; `Combinatorics/SimpleGraph/Acyclic` for the graph-theoretic pieces.

**Representative formal statements.**

```lean
structure PolygonalPath where
  vertices : List ℂ
  ne_nil : vertices ≠ []

def PolygonalPath.IsSimpleClosed (P : PolygonalPath) : Prop
def crossingParity (P : PolygonalPath) (q : ℂ) : ZMod 2
def polygonalWinding (P : PolygonalPath) (q : ℂ) : ℤ

theorem crossingParity_locallyConstant (P : PolygonalPath) (hP : P.IsSimpleClosed) :
    IsLocallyConstant (fun q : (P.carrier)ᶜ => crossingParity P q)

/-- Polygonal Jordan separation. -/
theorem polygonal_jordan (P : PolygonalPath) (hP : P.IsSimpleClosed) :
    Nat.card (ConnectedComponents ((P.carrier)ᶜ : Set ℂ)) = 2

/-- The identity everything runs on. -/
theorem polygonal_crosscut_parity (P : PolygonalPath) (hP : P.IsSimpleClosed)
    (Q : PolygonalCrosscut P) :
    crossingParity P = crossingParity (P.splitLeft Q) + crossingParity (P.splitRight Q)

/-- Two ears. -/
theorem exists_ear (P : PolygonalPath) (hP : P.IsSimpleClosed) (h : 3 < P.vertices.length) :
    ∃ i, IsEar P i

/-- Polygonal Schoenflies. The closed inside of a simple polygon is PL-homeomorphic to a triangle, and the homeomorphism extends to the plane. -/
theorem polygonal_schoenflies (P : PolygonalPath) (hP : P.IsSimpleClosed) :
    ∃ h : ℂ ≃ₜ ℂ, IsPLHomeomorph h ∧ h '' P.carrier = standardTriangle.boundary

/-- The lever for layer 2. -/
theorem not_planar_K33 : ¬ Nonempty (PlanarEmbedding (completeBipartiteGraph 3 3))
```

**Mathematical route and formalization notes.**

- Crossing parity, not the winding number, is the primitive. It is `ZMod 2`-valued, it is decidable, and the crosscut identity is additive in it. The integer winding number and the comparison with `TauCeti/Analysis/Contour/Winding/` are corollaries.
- ⚠ Do not restrict to lattice polygons.  You cannot inscribe a lattice polygon in an arbitrary Jordan curve, so the lattice version cannot serve layer 2. Re-derive at general-vertex generality.  (contrast with `rkirov/jordan_pick`)
- Nonplanarity of `K₃,₃` is a **finite** statement provable from the polygonal crosscut theorem alone. This let's us bootstrap from polygons to arbitrary curves, and it is also consumed by `SurfaceTopology` layer 10.
- Ear-clipping is the engine of polygonal Schoenflies: triangulate a simple polygon by diagonals, then induct.

**Examples and mathematical checks.** The crossing parity is computed in an exact worked example for a non-convex polygon and a point in a re-entrant pocket. A figure-eight polygonal loop shows that simplicity is essential in polygonal Jordan separation. The strict size hypothesis in the ear theorem is tested on a triangle, and a polygon with exactly two ears provides a sharp positive example.

**Natural intermediate results.** (i) polygonal paths, carriers, and simplicity; (ii) strips and the two-sidedness lemma; (iii) crossing parity, local constancy, and the integer winding number; (iv) polygonal Jordan separation; (v) the polygonal crosscut theorem; (vi) two ears and polygon triangulation; (vii) polygonal Schoenflies; (viii) nonplanarity of `K₃,₃`.

**Consequences.** Both tracks depend on this. Unit (viii) also unlocks `SurfaceTopology` layer 10.

---

## Layer 2: Separation, crosscuts, and invariance of domain

The milestone of this layer is the crosscut theorem.

⚠ Component count is a corollary of separation, but not the primary objective. The statement `Nat.card (ConnectedComponents Jᶜ) = 2` is not sufficient for  `ConformalMapping`'s length-area argument or roadmap's layer 7.

**From Tau Ceti.** `IsJordanCurve` and the arc theory in `TauCeti/Topology/JordanCurve/`; `filledHull`; `IsJordanDomain`; `TauCeti/Topology/{Continuum,LocallyConnected}.lean`.

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

/-- The statement named in the roadmap role of `TauCeti/Topology/FilledHull.lean` and in `ConformalMapping/STATUS.md`. -/
theorem subset_closure_inside   : J ⊆ closure (filledHull J \ J)

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

/-- Not currently in Mathlib -/
theorem invarianceOfDomain₂ {U : Set ℂ} (hU : IsOpen U) (f : C(U, ℂ)) (hf : Injective f) :
    IsOpen (Set.range f) ∧ IsOpenMap f
```

**Mathematical route and formalization notes.**

- The order of development follows Thomassen. Approximate the paths that would have to cross the curve, not the curve itself, because Osgood gives an obstruction to curve approximation.  A curve can have positive measure (layer 0) whereas the crossing paths are compact arcs in an open set and are cheap to control. A hypothetical failure separation, or a third complementary component, would result in a plane drawing of `K₃,₃`.
- Arc non-separation is proved by the chain-of-small-squares argument using the small-arc diameter bounds in `TauCeti/Topology/JordanCurve/SmallArc.lean`.
- ⚠ `invarianceOfDomain₂` is key. Without it `∂M` is not known to be chart-independent for a topological surface. Mathlib has neither invariance of domain nor degree theory for $C^0$ manifolds.
- Proving Jorden from Brouwer (as in `rkirov/jordan_pick`) is an independent second derivation of the component count. It is not the primary route.  Proving Brouwer is independently worthwhile.

**Examples and mathematical checks.** `subset_closure_inside` is stated in the same form as `TauCeti/Topology/FilledHull.lean`. An `IsJordanDomain` is constructed from an arbitrary `IsJordanCurve`.  Currently this is impossible: the only constructors are from a ball, from a convex set, and by transport along a map. The component count is derived by both the Thomassen and Maehara routes without using one proof inside the other. `crosscut` is checked on a worked example where the two pieces are visibly different (an off-centre chord of a disc).

**Natural intermediate results.** (i) `inside`, `outside`, boundedness, and connectedness; (ii) the common frontier; (iii) arc non-separation; (iv) accessibility and its density; (v) the crosscut theorem; (vi) the component count and the Maehara cross-check; (vii) `invarianceOfDomain₂` and chart-independence of `∂M`.

**Consequences.** `ConformalMapping` layer 5. Layer 7. `∂M` for the rest of this roadmap.

---

## Layer 3: The simplicial and piecewise-linear toolkit in dimension two

This layer developes everything the approximation theorem needs, built on Tau Ceti's existing API.

**From Tau Ceti.** `AbstractSimplicialComplex`, `Realization`, `link`, `closedStar`, `deletion`, barycentric subdivision, `SimplicialMap`, `dimension`, the collapse API, `IsTriangulable`.

**Representative formal statements.**

```lean
/-- General subdivision, heterogeneous in the vertex types. The eventual API may bundle the subdividing complex instead of exposing these parameters. -/
def Subdivides {ι' ι : Type*}
    (K' : AbstractSimplicialComplex ι') (K : AbstractSimplicialComplex ι) : Prop

theorem Subdivides.realization_homeomorph (h : Subdivides K' K) :
    Realization K' ≃ₜ Realization K

def stellarSubdivision (K : AbstractSimplicialComplex ι) (σ : K.Face) :
    AbstractSimplicialComplex (Option ι)

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
  K.dimension = 2 ∧ K.IsPure ∧
    (∀ e ∈ K.faces, e.card = 2 → 1 ≤ (K.trianglesContaining e).card ∧
       (K.trianglesContaining e).card ≤ 2) ∧
    (∀ v ∈ K.vertices, IsCombinatorialCircle (K.link v) ∨ IsCombinatorialArc (K.link v))

def IsClosedCombinatorialSurface (K : AbstractSimplicialComplex ι) : Prop :=
  IsCombinatorialSurface K ∧ ∀ v ∈ K.vertices, IsCombinatorialCircle (K.link v)

theorem IsCombinatorialSurface.realization_isSurface (h : IsCombinatorialSurface K) :
    IsTopologicalSurfaceWithBoundary (Realization K)

/-- Compatibility, for when `GeometricTopology` builds the general recursion. -/
theorem isCombinatorialSurface_iff_isCombinatorialManifold_two :
    IsCombinatorialSurface K ↔ IsCombinatorialManifold 2 K
```

**Mathematical route and formalization notes.**

- A subdivision may introduce vertices, so its vertex type cannot be fixed in advance. The shared API must therefore be heterogeneous or bundle the subdividing complex.  A similar issue affects combinatorial surface move relations, and is solved by bundling index types.
- The common-subdivision theorem in this layer starts with a **PL** homeomorphism (or, equivalently, two PL triangulations of one polyhedron). Its conclusion is best stated as subdivisions of the two complexes together with a simplicial isomorphism. The two-dimensional Hauptvermutung in layer 5 is the deeper theorem that starts with an arbitrary topological homeomorphism and produces such a PL comparison. Keeping these two statements separate exposes a genuine mathematical distinction which could be hidden by a convenient choice of vertex types.
- The compatibility theorem is deferred until the general dimension manifold predicate exists. None of the dimension-two results should depend on that comparison.
- Combinatorial circles and arcs in dimension one are concrete: a combinatorial circle is a connected 1-complex in which every vertex has exactly two neighbours; a combinatorial arc is one in which exactly two vertices have one neighbour and the rest have two. These should not be based on a general sphere-recognition recursion.

**Examples and mathematical checks.** `IsCombinatorialSurface` is **false** for each of: two triangles sharing exactly one vertex; three triangles sharing an edge; the dunce hat; the cone on a theta graph. It is **true** for: the boundary of the tetrahedron; a triangulated disc; a triangulated Möbius band. Every one of these is a concrete finite complex checked by `decide`. ⚠ This is the layer where vacuity is a risk, because pinch points are possible for abstract complexes.

**Natural intermediate results.** (i) general subdivision and realization invariance in the shared simplicial-complex library; (ii) stellar subdivision; (iii) purity, facets, and skeleta; (iv) isomorphic subdivisions for PL-homeomorphic complexes; (v) `IsPLMap` and its closure properties; (vi) combinatorial circles and arcs; (vii) `IsCombinatorialSurface` and the counter-witness battery; (viii) the realization theorem.

**Consequences.** Layers 4, 5, 6. `SurfaceTopology` layer 3.

---

## Layer 4: The piecewise-linear approximation theorem

Moise's PL approximation theorem is the central theorem of the piecewise-linear. In its local form, a homeomorphism from an open polyhedron in a triangulated surface into the plane or another triangulated surface admits an arbitrarily close PL-homeomorphic approximation. The familiar compact statement for a homeomorphism between triangulated surfaces is a corollary.

This is the main technical engine for both Radó's theorem and the Hauptvermutung.

**From layers 1 and 3.** Polygonal Schoenflies, general position for polygonal arcs, subdivision, `IsPLMap`.

**Representative formal statements.**

```lean
/-- Moise's local form. Here `U` and `V` are open polyhedra and `φ` is strongly positive; the exact subtype packaging is schematic. -/
theorem exists_pl_approximation_open
    (f : U ≃ₜ V) (φ : U → ℝ) (hφ : StronglyPositive φ) :
    ∃ g : U ≃ₜ V, IsPLMap g ∧ ∀ x, dist (f x) (g x) < φ x

/-- Compact global form. -/
theorem exists_pl_approximation {K : AbstractSimplicialComplex ι}
    {L : AbstractSimplicialComplex κ}
    (hK : IsCombinatorialSurface K) (hL : IsCombinatorialSurface L)
    (f : Realization K ≃ₜ Realization L) (ε : ℝ) (hε : 0 < ε) :
    ∃ g : Realization K ≃ₜ Realization L, IsPLMap g ∧ ∀ x, dist (f x) (g x) < ε

/-- Relative form, agreeing with `f` on a subcomplex. -/
theorem exists_pl_approximation_rel {A : Set (Realization K)}
    (hA : IsSubcomplexCarrier A) (hf : IsPLMap (f.restrict A)) (ε : ℝ) (hε : 0 < ε) :
    ∃ g, IsPLMap g ∧ g.restrict A = f.restrict A ∧ ∀ x, dist (f x) (g x) < ε
```

**Mathematical route and formalization notes.**

- The proof first approximates the image of the 1-skeleton by a polygonal embedding and then extends across each 2-simplex by polygonal Schoenflies. The control function is strongly positive rather than globally constant so that the theorem applies on noncompact open subsets, as required in Radó's inductive construction.
- The relative form is needed for surfaces with boundary and for the isotopy statement in layer 8.
- The argument uses polygonal Schoenflies, but it does not need the topological Schoenflies theorem or the tameness results of layer 7.

**Examples and mathematical checks.** The approximation is exhibited on a worked example where the original homeomorphism is not piecewise linear (a radial map with a non-linear radial profile). The epsilon is checked to be achievable for arbitrarily small values, that is, the statement is not accidentally vacuous by allowing `g = f`.

**Natural intermediate results.** (i) the local open-set approximation theorem; (ii) general position and polygonal approximation of the 1-skeleton; (iii) the mesh-refinement construction; (iv) correction on the 1-skeleton; (v) filling triangles by polygonal Schoenflies; (vi) the compact and relative forms.

---

## Layer 5: Radó's theorem and the two-dimensional Hauptvermutung

This layer shows combinatorial invariants are topological.

⚠ **Neither of these depends on the Schoenflies theorem.** Moise makes this point immediately after his triangulation theorem.  The usual derivation from Schoenflies "is in a way misleading", since in dimension three Schoenflies fails and triangulation still holds.

**Representative formal statements.**

```lean
/-- Rado. -/
theorem compact_surface_isTriangulable (M : Type*) [TopologicalSpace M] [CompactSpace M]
    [T2Space M] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) M] : IsTriangulable M

theorem compact_surfaceWithBoundary_isTriangulable (M : Type*) [TopologicalSpace M]
    [CompactSpace M] [T2Space M] [ChartedSpace (EuclideanHalfSpace 2) M] :
    ∃ K, IsCombinatorialSurface K ∧ Nonempty (Realization K ≃ₜ M)

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
```

**Mathematical route and formalization notes.**

- Radó's construction grows an already triangulated region across a countable chart cover. On each overlap, the **local** form of the approximation theorem replaces a topological coordinate change by a controlled PL homeomorphism; this is the point at which the approximation theorem enters the triangulation proof.
- The collar theorem is the lever for the boundary case: push `∂M` inward along a collar, triangulate the interior, and extend combinatorially. If `TauCeti/Geometry/Manifold/Boundary/Collar/` is usable at the topological level; if not, the topological two-dimensional collar is a target here and a contribution back to `GeometricTopology` layer 1.
- Locally finite triangulations of second-countable noncompact surfaces are built only insofar as the compact proof needs them, and the general noncompact Radó is out of scope.

**Examples and mathematical checks.** A triangulation is produced for a surface presented only by charts, with no combinatorial data supplied. For the Hauptvermutung, the tetrahedral and octahedral triangulations of the sphere are refined to isomorphic subdivisions; the example is stated in the same two-subdivision form as the theorem.

**Natural intermediate results.** (i) finite chart covers and shrinking; (ii) polygonal replacement of chart boundaries; (iii) assembly and Radó, closed case; (iv) the topological collar in dimension two; (v) Radó with boundary; (vi) the Hauptvermutung.

**Consequences.** `GeometricTopology` layer 11.

---

## Layer 6: The Euler characteristic

Definition of the invariant that much of `SurfaceTopology` runs on.  Euler characteristic here is only defined on simplicial complexes.

**Representative formal statements.**

```lean
def AbstractSimplicialComplex.eulerChar (K : AbstractSimplicialComplex ι) [Finite K.faces] : ℤ :=
  ∑ i, (-1 : ℤ) ^ i * (K.facesOfDim i).card

theorem eulerChar_subdivision (h : Subdivides K' K) : K'.eulerChar = K.eulerChar
theorem eulerChar_simplicialIso (h : K ≃ₛ L) : K.eulerChar = L.eulerChar

/-- Well defined by Rado, invariant by the Hauptvermutung. -/
noncomputable def Surface.eulerChar (M : Type*) [CompactSurface M] : ℤ

theorem Surface.eulerChar_congr {M N} [CompactSurface M] [CompactSurface N] (h : M ≃ₜ N) :
    Surface.eulerChar M = Surface.eulerChar N

theorem eulerChar_sphere : Surface.eulerChar (Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1) = 2
theorem eulerChar_disc  : Surface.eulerChar (Metric.closedBall (0 : ℂ) 1) = 1
```

**Mathematical route and formalization notes.**

- ⚠ Classification of surfaces is downstream of this, so we do not prove topological invariance of the cell count by appealing to that.  Invariance comes from subdivision invariance and the Hauptvermutung.
- Define `eulerChar` on complexes first, then transport. The surface-level definition is `Classical.choice` over triangulations plus the invariance theorem.
- **General principle of both roadmaps.** Every invariant is defined on a finite presentation, proved invariant under the elementary moves, and upgraded to a homeomorphism invariant by the Hauptvermutung. There is no comparison theorem with Mathlib's singular homology or fundamental group here or in `SurfaceTopology`.  Mathlib's singular homology has no excision and  no Mayer–Vietoris.

**Examples and mathematical checks.** On concrete finite complexes, `eulerChar` reduces to an explicit alternating sum. It computes 2 for the tetrahedron boundary, 2 for the octahedron boundary, 1 for a triangulated disc, 0 for a triangulated annulus, 0 for a triangulated Möbius band. `eulerChar_subdivision` is checked against a barycentric subdivision of the tetrahedron boundary, where the face counts change and the alternating sum does not.

**Natural intermediate results.** (i) `eulerChar` on finite complexes and its effective computation; (ii) subdivision invariance; (iii) isomorphism invariance; (iv) the surface-level definition and transport; (v) the worked example table.

---

## Layer 7: The Schoenflies theorem and tameness

Schoenflies is one of the pinnicles of this roadmap.  It's why `GeometricTopology` layer 2's local flatness hypothesis is always true in dimension two.

**Representative formal statements.**

```lean
theorem schoenflies {J : Set ℂ} (hJ : IsJordanCurve J) :
    ∃ h : ℂ ≃ₜ ℂ, h '' J = Metric.sphere 0 1

theorem schoenflies_closure {J : Set ℂ} (hJ : IsJordanCurve J) :
    Nonempty (closure hJ.inside ≃ₜ Metric.closedBall (0 : ℂ) 1)

theorem schoenflies_sphere {S : Type*} [Sphere2 S] {J : Set S} (hJ : IsJordanCurve J) :
    ∃ h : S ≃ₜ S, h '' J = equator

/-- Tameness. The discharge of `GeometricTopology` layer 2's hypothesis. -/
theorem isLocallyFlat_of_isArc_surface {M} [Surface M] {A : Set M} (hA : IsArc A) :
    IsLocallyFlat A
theorem isLocallyFlat_of_isJordanCurve_surface {M} [Surface M] {J : Set M}
    (hJ : IsJordanCurve J) : IsLocallyFlat J

/-- A two-sided simple closed curve has an annular collar. The homeomorphism carries the zero section to `J`; the exact subtype packaging is schematic. -/
theorem exists_collar_of_twoSided_isJordanCurve {M} [Surface M] {J : Set M}
    (hJ : IsJordanCurve J) (h₂ : IsTwoSided J) :
    ∃ (U : Set M), IsOpen U ∧ J ⊆ U ∧
      ∃ e : J × Ioo (-1 : ℝ) 1 ≃ₜ U,
        ∀ p : J, (e (p, ⟨0, by norm_num⟩) : M) = p

/-- A tame simple closed curve has an annular or Möbius-band regular neighbourhood, according as it is two-sided or one-sided. -/
theorem jordanCurve_neighborhood_dichotomy {M} [Surface M] {J : Set M}
    (hJ : IsJordanCurve J) :
    (IsTwoSided J ∧ HasAnnularNeighborhood J) ∨
      (¬ IsTwoSided J ∧ HasMobiusNeighborhood J)
```

**Mathematical route and formalization notes.**

- No homeomorphism is built directly.  Instead this approach builds two matched finite cell decompositions, one of the closed interior and one of the closed square, isomorphic as cellulations and agreeing with a chosen boundary correspondencs.  It refines them alternately so that cells become small on both sides and constructs the homeomorphism off the nested closed stars. Every finite stage is a plane graph governed by layer 2's crosscut theorem. No polygonal approximation of the curve appears anywhere.
- The matched cellulations here are finite approximating devices internal to this proof. They need not be identified with the realized `Cellulation2` objects of `SurfaceTopology`: the two constructions have different mathematical purposes.
- An alternative derivation gives an independent cross-check: once `ConformalMapping` Carathéodory's theorem gives `closure hJ.inside ≃ₜ closed disc` from `riemannMapping`, and gluing the inside and outside discs along `J` gives `schoenflies` again.

**Examples and mathematical checks.** `schoenflies_closure` is instantiated on a curve that is not rectifiable. `isLocallyFlat_of_isArc_surface` is checked against `GeometricTopology`'s actual `IsLocallyFlat` predicate, not a local restatement. The core circle of a Möbius band is the essential counterexample to an unconditional product collar: it is tame and locally flat but one-sided. A note also records that automatic tameness fails in dimension three, where wild embeddings occur.

**Natural intermediate results.** (i) `IsCrosscut` and finite cellulations of a Jordan domain; (ii) matching and refinement transfer; (iii) alternation and the small-cell estimate; (iv) the nested-star limit and `schoenflies_closure`; (v) the ambient and spherical forms; (vi) tameness of arcs; (vii) tameness of simple closed curves; (viii) the annulus/Möbius regular-neighbourhood dichotomy and the two-sided collar corollary.

**Consequences.** `GeometricTopology` layer 2.

---

## Layer 8: Uniqueness of the piecewise-linear and smooth structures


**Representative formal statements.**

```lean
/-- Any two PL structures on a compact surface are PL-isomorphic.
    The precise structure and isomorphism types come from `GeometricTopology`. -/
theorem plStructure_unique_up_to_isomorphism {M} [CompactSurface M]
    (s₁ s₂ : PLStructure M) : Nonempty (PLStructureIso s₁ s₂)

/-- Every homeomorphism of compact surfaces is isotopic to a PL homeomorphism. -/
theorem exists_isotopic_plHomeomorph {M N} [CompactSurface M] [CompactSurface N]
    (f : M ≃ₜ N) : ∃ g : M ≃ₜ N, IsPLMap g ∧ Isotopic f g

/-- Topological and PL homeomorphism classes agree. -/
theorem homeomorph_iff_plHomeomorph {K L} (hK : IsCombinatorialSurface K)
    (hL : IsCombinatorialSurface L) :
    Nonempty (Realization K ≃ₜ Realization L) ↔
      Nonempty (Realization K ≃ₚₗ Realization L)

/-- Every PL surface carries a compatible smooth structure, unique up to diffeomorphism. -/
theorem exists_unique_smoothing {K} (hK : IsCombinatorialSurface K) : ...
```

**Mathematical route and formalization notes.**

- Smoothing in dimension two is Whitehead's theorem, and the proof strategy is corner-rounding on a triangulation. The uniqueness half needs the relative approximation theorem from layer 4.
- ⚠ The mapping class group comparison (topological, PL, and smooth mapping class groups agree) is owned by `SurfaceTopology` layer 9, because that is where the groups are defined. This layer supplies the isotopy statement.
- “Essentially unique” means uniqueness up to the relevant notion of isomorphism, not literal equality of structures. On the PL side, homeomorphic triangulated surfaces admit isomorphic subdivisions. On the smooth side, compatible smoothings are related by a diffeomorphism; relative and isotopy refinements should be stated separately where used.

**Examples and mathematical checks.** The statement is checked to be non-vacuous by exhibiting two genuinely different triangulations of the same surface and producing the PL homeomorphism. A note records that uniqueness of smooth structure fails in dimension four, so the surface theorem is visibly dimension-specific.

**Natural intermediate results.** (i) uniqueness of the PL structure; (ii) isotopy to a PL homeomorphism; (iii) the Top/PL classification agreement; (iv) corner rounding and existence of a smoothing; (v) uniqueness of the smoothing.

---

## Alternative routes and why they are not primary

These alternatives clarify the mathematical choices made in the dependency graph.

**The homological route to the Jordan curve theorem** (Cannon chapter 7: singular homology
of sphere complements, then arc non-separation and Jordan). **Closed.** At the pinned
commit Mathlib's singular homology consists of `Basic`, `HomologyZero`, and
`HomotopyInvariance` only. There is no excision, no Mayer–Vietoris for singular homology,
and no homology of spheres. Taking this route would require building a substantial piece of
algebraic topology first, which is outside this roadmap and outside `GeometricTopology`.

**The Kline sphere characterization route to Schoenflies** (Cannon chapter 8: Schoenflies as
a corollary of a topological recognition theorem for the 2-sphere). **Rejected on cost.**
It is the more illuminating route and it is substantially more expensive, requiring Peano
continua, upper semicontinuous decompositions, and Bing's proof. See the
roadmap-for-a-roadmap below.

**Maehara's route to the Jordan curve theorem** (Jordan from the Brouwer fixed point
theorem). **Retained as a second proof, not as the primary route.** It is the shortest proof
of the component count that exists, and `rkirov/jordan_pick` closes it in roughly 2,600
lines. It supplies no frontier statement, no accessibility, and no crosscut theorem, so it
discharges nothing downstream.

**Deriving Schoenflies from Carathéodory.** **Recorded as a cross-check.** It creates a
roadmap-level cycle through `ConformalMapping` and would make a headline theorem hostage to
another roadmap's schedule.

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
- Continuum theory beyond the local-connectedness lemmas actually consumed. See the  roadmap-for-a-roadmap above.
- Noncompact surfaces beyond what the compact proofs require. The classification of noncompact surfaces (Kerékjártó) is a natural follow-on roadmap.
- Measure-theoretic properties of curves beyond the single Osgood example in layer 0.

---

## Provenance and prior art

| Development | Licence | Coordination | What it evidences |
|---|---|---|---|
| `mccorvie/classification-of-surfaces` | Apache-2.0 | authored by this roadmap's author | that the Moise route to Radó and the Hauptvermutung closes, at roughly 90k lines of PL infrastructure plus 70k for Schoenflies |
| `alonamaloh/schoenflies-lean`, blueprint `alonamaloh/jordan-schoenflies` | Apache-2.0 code, CC BY 4.0 blueprint |  | that follows Thomassen to prove Schoenflies |
| `rkirov/jordan_pick` | Apache-2.0 | | Follows Maehara's route to the component count.  Also proves Brouwer, lattice-polygon crossing parity and ear-clipping |

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
- J. Cannon, *Topology as Fluid Geometry*, volume 2. Exposition reference for the
  point-set lemmas in layer 0, and the reference for the roadmap-for-a-roadmap above. Note
  that it is an idiosyncratic tour rather than a reference text, and its selection principle
  is explicitly aesthetic; it should not be used to scope a roadmap.