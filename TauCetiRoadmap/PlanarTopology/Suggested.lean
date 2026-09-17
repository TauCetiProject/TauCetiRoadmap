import Mathlib
import TauCeti.AlgebraicTopology.SimplicialComplex.Realization
import TauCeti.Geometry.Manifold.LocallyFlat.Basic
import TauCeti.Topology.FilledHull
import TauCeti.Topology.JordanCurve.Basic
import TauCeti.Topology.PL.Map
import TauCeti.Topology.Triangulable

/-!
# Planar topology and the PL structure of surfaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library: these are targets, not completed proofs.

The roadmap has two interacting tracks. Layers 0--2 build the planar separation engine
(Jordan curves, crosscuts, accessibility, Brouwer's fixed-point theorem, and two-dimensional
invariance of domain). Layers 3--6 build the simplicial/PL engine (subdivision, PL
approximation, Radó, the two-dimensional Hauptvermutung, Pachner's theorem, Euler
characteristic, and orientability). Layer 7 proves Schoenflies and automatic tameness in
dimension two; layer 8 identifies the topological, PL, and smooth categories for compact
surfaces.

A surface is a type carrying `[TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M]
[T2Space M] [SecondCountableTopology M]`, as the README's conventions fix it, and the
compiled statements below spell the instances out. Closed means `(𝓡∂ 2).boundary M = ∅`. The
piecewise-linear notion on the plane is Tau Ceti's `TauCeti.IsPLOn`.

Only declarations whose input vocabulary is already meaningful at the current Tau Ceti
pin are compiled below. In particular, do **not** introduce a vacuous `Prop := sorry` for
`Subdivides`, `IsCombinatorialSurface`, relative PL approximation, or `PLStructure`.
Their intended shapes are recorded as comments and should become compiled targets once
the prerequisite vocabulary is pinned. This follows the roadmap convention that a
condition which cannot yet be stated is omitted rather than replaced by an empty predicate.
-/

noncomputable section

namespace TauCetiRoadmap.PlanarTopology

open Complex Set Topology
open scoped Manifold

/-! ## Layer 0: conventions and plane transport -/

/-- The fixed identification of the complex plane with Mathlib's two-dimensional
Euclidean model. It is an isometry, so metric statements transport without a separate
comparison theorem. -/
noncomputable def planeEquiv : ℂ ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 2) :=
  Complex.orthonormalBasisOneI.repr

/-- Rotation through a right angle in the complex-plane model. -/
def perp (u : ℂ) : ℂ := Complex.I * u

/-- The oriented area form used by the polygonal engine. -/
def det (u v : ℂ) : ℝ := ((starRingEnd ℂ) u * v).im

/-- The plane as a half-space-charted surface with empty boundary. This is what lets a
Euclidean-charted surface be transported into the single family of the conventions. -/
@[instance_reducible] noncomputable def halfSpaceChartedSpace :
    ChartedSpace (EuclideanHalfSpace 2) (EuclideanSpace ℝ (Fin 2)) :=
  sorry

/-- Transport of a Euclidean-charted surface to the half-space family, by composing charts. -/
@[instance_reducible] noncomputable def ofBoundaryless (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 2)) M] : ChartedSpace (EuclideanHalfSpace 2) M :=
  letI := halfSpaceChartedSpace
  ChartedSpace.comp (EuclideanHalfSpace 2) (EuclideanSpace ℝ (Fin 2)) M

/-- The transported structure has empty boundary. -/
example (M : Type*) [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) M] :
    letI := ofBoundaryless M
    (𝓡∂ 2).boundary M = ∅ := by
  sorry

/-- The closed unit disc as a surface with boundary the unit circle. -/
@[instance_reducible] noncomputable def closedDiscChartedSpace :
    ChartedSpace (EuclideanHalfSpace 2) (Metric.closedBall (0 : ℂ) 1) :=
  sorry

/-- The boundary of the disc structure is the circle. -/
example :
    letI := closedDiscChartedSpace
    (𝓡∂ 2).boundary (Metric.closedBall (0 : ℂ) 1) =
      Subtype.val ⁻¹' Metric.sphere (0 : ℂ) 1 := by
  sorry

/-- Alexander's trick, extension form: a homeomorphism of the boundary sphere cones radially to
a homeomorphism of the closed ball. Stated dimension-generally; the disc is `n = 2`, the case
this roadmap spends. -/
noncomputable def coneExtend {n : ℕ}
    (h : Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1 ≃ₜ
      Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1) :
    Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1 ≃ₜ
      Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1 :=
  sorry

/-- Alexander's trick preserves radius. -/
example {n : ℕ}
    (h : Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1 ≃ₜ
      Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1)
    (z : Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1) :
    ‖(coneExtend h z : EuclideanSpace ℝ (Fin n))‖ = ‖(z : EuclideanSpace ℝ (Fin n))‖ := by
  sorry

/-- A space-filling curve: continuity does not give a curve of dimension one. -/
example : ∃ f : C(unitInterval, Metric.closedBall (0 : ℂ) 1), Function.Surjective f := by
  sorry

/-- A non-rectifiable Jordan curve: no parametrization has bounded variation. -/
example : ∃ J : Set ℂ, TauCeti.IsJordanCurve J ∧
    ∀ γ : C(unitInterval, ℂ), Set.range γ = J → ¬ BoundedVariationOn γ Set.univ := by
  sorry

/-- An Osgood curve: a Jordan curve of positive area. -/
example : ∃ J : Set ℂ, TauCeti.IsJordanCurve J ∧ 0 < MeasureTheory.volume J := by
  sorry

/-!
The shared isotopy library should acquire a genuine relative/supported isotopy API before
we compile the isotopy form of Alexander's trick. The intended milestones are:

  def IsotopicRel (A : Set X) (f g : C(X, Y)) : Prop

  theorem isotopicRel_of_eqOn_sphere (f g : closedBall ≃ₜ closedBall)
      (h : Set.EqOn f g (Metric.sphere 0 1)) : IsotopicRel (Metric.sphere 0 1) f g

  -- The PL flavour, read in the plane through `planeEquiv`: coning a piecewise-linear
  -- homeomorphism of the circle gives a piecewise-linear homeomorphism of the disc.
  theorem isPLOn_coneExtend (h) (hPL : TauCeti.IsPLOn h _) : TauCeti.IsPLOn (coneExtend h) _
-/

/-! ## Layer 1: polygonal foundations -/

/-- A polygonal chain: finitely many vertices joined in order by segments. The geometric
carrier and the simplicity API are predicates on this object, not fields. -/
structure PolygonalChain where
  vertices : List ℂ
  ne_nil : vertices ≠ []

/-- A polygonal loop: a chain closed up from its last vertex back to its first. -/
structure PolygonalLoop where
  vertices : List ℂ
  ne_nil : vertices ≠ []

/-- The carrier of a polygonal chain: the union of the segments between consecutive vertices. -/
noncomputable def PolygonalChain.carrier (P : PolygonalChain) : Set ℂ :=
  sorry

/-- The carrier of a polygonal loop: the chain's segments together with the closing segment. -/
noncomputable def PolygonalLoop.carrier (P : PolygonalLoop) : Set ℂ :=
  sorry

/-- A loop is simple when its carrier is a Jordan curve. Layer 1 shows this is equivalent to the
finite condition that segments meet only at shared consecutive vertices. -/
def PolygonalLoop.IsSimple (P : PolygonalLoop) : Prop :=
  TauCeti.IsJordanCurve P.carrier

/-- Crossing parity is the primitive invariant of the polygonal separation proof. -/
noncomputable def crossingParity (P : PolygonalLoop) (q : ℂ) : ZMod 2 :=
  sorry

/-- Integer winding is derived from the same polygonal crossing machinery and compared
with Tau Ceti's analytic winding-number API. -/
noncomputable def polygonalWinding (P : PolygonalLoop) (q : ℂ) : ℤ :=
  sorry

/-- A piecewise-linear homeomorphism of the plane, in Tau Ceti's vocabulary. -/
def IsPLHomeomorph (h : ℂ ≃ₜ ℂ) : Prop :=
  TauCeti.IsPLOn h Set.univ ∧ TauCeti.IsPLOn h.symm Set.univ

/-- Polygonal Jordan separation. -/
example (P : PolygonalLoop) (hP : P.IsSimple) :
    Nat.card (ConnectedComponents ((P.carrier)ᶜ : Set ℂ)) = 2 := by
  sorry

/-!
Once the crosscut, ear, and standard-triangle vocabulary is pinned, representative compiled
targets should be added for:

  -- The additive identity that drives both tracks, stated pointwise off the curves it
  -- compares, with the ray-casting convention for vertices and collinear segments fixed.
  theorem polygonal_crosscut_parity (P : PolygonalLoop) (hP : P.IsSimple)
      (Q : PolygonalCrosscut P) (q : ℂ) (hq : q ∉ P.carrier ∪ Q.carrier) :
      crossingParity P q = crossingParity (P.splitLeft Q) q + crossingParity (P.splitRight Q) q

  theorem exists_ear (P : PolygonalLoop) (hP : P.IsSimple) (h : 3 < P.vertices.length) :
      ∃ i, IsEar P i

  -- Polygonal Schoenflies.
  theorem polygonal_schoenflies (P : PolygonalLoop) (hP : P.IsSimple) :
      ∃ h : ℂ ≃ₜ ℂ, IsPLHomeomorph h ∧ h '' P.carrier = standardTriangle.boundary

  -- Polygonal drawings of finite simple graphs are owned here; `K₃,₃` has none. This is the
  -- lever of layer 2's Thomassen route. `SurfaceTopology` layer 10 proves nonplanarity again,
  -- combinatorially, from Euler's formula, and does not consume this statement.
  structure PolygonalDrawing (G : SimpleGraph V) where ...
  theorem not_exists_polygonalDrawing_K33 :
      ¬ Nonempty (PolygonalDrawing (completeBipartiteGraph (Fin 3) (Fin 3)))
-/

/-! ## Layer 2: Jordan separation, crosscuts, Brouwer, and invariance of domain -/

/-- Every point of a Jordan curve is a limit of points on its bounded side. With connectedness
and boundedness of the inside, this is the statement that the inside is a Jordan domain,
`TauCeti.IsJordanDomain` in `TauCeti/Analysis/Complex/Conformal/Jordan/Domain.lean`, which is
the hypothesis `ConformalMapping`'s Carathéodory theorem takes. -/
example {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    J ⊆ closure (TauCeti.filledHull J \ J) := by
  sorry

/-- Jordan separation in the component-count form, the shape
[lean-eval](https://github.com/leanprover/lean-eval) states, as a corollary of the stronger
crosscut/frontier package. -/
example {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    Nat.card (ConnectedComponents ((J : Set ℂ)ᶜ : Set ℂ)) = 2 := by
  sorry

/-- The bounded side of a Jordan curve is connected. -/
example {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    IsConnected (TauCeti.filledHull J \ J) := by
  sorry

/-- No retraction of the disc onto its circle: the winding number of the identity of the circle
is one, and would be zero if a retraction existed. -/
example :
    ¬ ∃ r : C(Metric.closedBall (0 : ℂ) 1, Metric.sphere (0 : ℂ) 1),
      ∀ z : Metric.closedBall (0 : ℂ) 1, (z : ℂ) ∈ Metric.sphere (0 : ℂ) 1 → (r z : ℂ) = z := by
  sorry

/-- Brouwer's fixed-point theorem in dimension two. -/
example (f : C(Metric.closedBall (0 : ℂ) 1, Metric.closedBall (0 : ℂ) 1)) : ∃ z, f z = z := by
  sorry

/-- Two-dimensional invariance of domain, derived from Brouwer. It needs nothing from the
Jordan curve theorem, and it is the input that makes manifold boundary chart-independent. -/
example {U : Set ℂ} (hU : IsOpen U) (f : C(U, ℂ)) (hf : Function.Injective f) :
    IsOpen (Set.range f) ∧ IsOpenMap f := by
  sorry

section Boundary

variable {M N : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]
  [TopologicalSpace N] [ChartedSpace (EuclideanHalfSpace 2) N] [T2Space N]

/-- Homeomorphisms of surfaces preserve the boundary: chart-independence of `∂M`. -/
example (e : M ≃ₜ N) : e '' (𝓡∂ 2).boundary M = (𝓡∂ 2).boundary N := by
  sorry

/-- The number of boundary components, a homeomorphism invariant by the preceding statement. -/
noncomputable def boundaryComponentCount (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] : ℕ :=
  Nat.card (ConnectedComponents ((𝓡∂ 2).boundary M))

example (e : M ≃ₜ N) : boundaryComponentCount M = boundaryComponentCount N := by
  sorry

end Boundary

/-!
The crosscut theorem and accessibility package should be compiled when `IsCrosscut` and
its endpoint/arc vocabulary are fixed. The roadmap's target is deliberately stronger than
component count: it must identify the two Jordan curves produced by a crosscut and the
two corresponding inside regions.
-/

/-! ## Layer 3: simplicial and PL toolkit -/

/-!
The following are architectural targets, but they should not be represented here by
placeholder propositions. Compile them when their actual data is pinned in Tau Ceti:

  def Subdivides {ι' ι : Type*}
      (K' : AbstractSimplicialComplex ι') (K : AbstractSimplicialComplex ι) : Prop

  theorem Subdivides.realization_homeomorph (h : Subdivides K' K) :
      AbstractSimplicialComplex.Realization K' ≃ₜ AbstractSimplicialComplex.Realization K

  -- Tau Ceti's stellar subdivision (`Subdivision/Stellar/Basic.lean`) and barycentric
  -- subdivision (`Subdivision/Homeomorph.lean`) are the two instances.
  theorem Subdivides.stellarSubdivision ...
  theorem Subdivides.barycentricSubdivision ...

  -- The metric on the realization of a finite complex, by barycentric coordinates; the
  -- approximation theorems of layer 4 measure with it.
  noncomputable def realizationDist (K : AbstractSimplicialComplex ι) [Finite K.faces] :
      Realization K → Realization K → ℝ

  def IsPLMap ... : Prop
  theorem IsPLMap.comp ...

  theorem exists_isomorphic_subdivisions
      (h : Realization K ≃ₜ Realization L) (hPL : IsPLMap h) : ...

`IsCombinatorialSurface` is a particularly important concrete definition. It carries
finiteness, and it uses the dimension-two link condition (vertex links are combinatorial
circles or arcs, and edges lie in one or two triangles), not a dimension-general recognition
recursion and not `Prop := sorry`. Its compatibility with Tau Ceti's stellar-equivalence
definition is a theorem:

  theorem isCombinatorialSurface_iff_isCombinatorialManifold_two :
      IsCombinatorialSurface K ↔ K.faces.Finite ∧ TauCeti.IsCombinatorialManifold K 2

Its realization theorem is data, the bridge consumed by `SurfaceTopology`:

  def IsCombinatorialSurface.realizationChartedSpace (h : IsCombinatorialSurface K) :
      ChartedSpace (EuclideanHalfSpace 2) (Realization K)

and the plane and simplicial PL notions agree on complexes realized affinely in the plane:

  theorem isPLMap_iff_isPLOn ... : IsPLMap f ↔ TauCeti.IsPLOn (e' ∘ f ∘ e.symm) P
-/

/-! ## Layer 4: PL approximation -/

/-!
Once `Subdivides`, `IsPLMap`, `realizationDist`, and `IsCombinatorialSurface` are compiled,
pin the local open-set Moise approximation theorem first, in the plane and in the closed
half-plane, then the compact and relative forms. The local strongly-positive-control-function
statement is the one Radó consumes, in its half-plane form for surfaces with boundary; the
compact epsilon statement is a corollary, not a substitute.
-/

/-! ## Layer 5: Radó, the two-dimensional Hauptvermutung, and Pachner's theorem -/

/-- **Radó's theorem**, in the weak form Tau Ceti's `IsTriangulable` can state: a corollary of
the combinatorial-surface form below, which is the actual target. -/
example (M : Type*) [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]
    [CompactSpace M] : TauCeti.IsTriangulable M := by
  sorry

/-!
The combinatorial-surface form of Radó, with boundary, the Hauptvermutung, and Pachner's
theorem become compiled targets once `IsCombinatorialSurface` and heterogeneous `Subdivides`
are present:

  -- Every compact surface is the realization of a finite combinatorial surface, with the
  -- boundary a subcomplex; the boundary case runs the same construction in half-plane charts.
  theorem exists_combinatorialSurface_homeomorph :
      ∃ (ι : Type) (K : AbstractSimplicialComplex ι), IsCombinatorialSurface K ∧
        ∃ e : Realization K ≃ₜ M, e '' (boundary subcomplex) = (𝓡∂ 2).boundary M

  -- Every boundary component is a circle, and the boundary is collared (Tau Ceti main's
  -- `IsCollared`, in `Geometry/Manifold/Boundary/Collar/Global.lean`).
  theorem isJordanCurve_of_mem_connectedComponents_boundary ...
  theorem isCollared_boundary : IsCollared (Subtype.val : (𝓡∂ 2).boundary M → M)

  -- The two-dimensional Hauptvermutung and its PL consequence.
  theorem hauptvermutung₂ ... : ∃ K' L', Subdivides K' K ∧ Subdivides L' L ∧ Nonempty (K' ≃ₛ L')
  theorem hauptvermutung₂_isPL ... : ∃ g : Realization K ≃ₜ Realization L, IsPLMap g ∧ IsPLMap g.symm

  -- Pachner in dimension two: triangulations with a common subdivision are related by the
  -- bistellar moves `1 ↔ 3` and `2 ↔ 2`, with the boundary moves relative to the boundary.
  inductive BistellarMove : BundledCombinatorialSurface → BundledCombinatorialSurface → Prop
  theorem pachner₂ ... : Relation.ReflTransGen (isoClosure BistellarMove) ⟨K, hK⟩ ⟨L, hL⟩
-/

/-! ## Layer 6: Euler characteristic and orientability -/

/-!
Compile the finite-complex Euler characteristic and orientability only after the finite-face
API and heterogeneous subdivision relation are settled. The targets are:

  def AbstractSimplicialComplex.eulerChar (K) [Finite K.faces] : ℤ :=
    ∑ i : Fin 3, (-1 : ℤ) ^ (i : ℕ) * (K.facesOfDim i).card
  theorem eulerChar_subdivision ...
  theorem eulerChar_simplicialIso ...

  -- A coherent orientation: a cyclic order on each triangle such that the two triangles on
  -- an interior edge induce opposite directions on it.
  structure Orientation (K) (hK : IsCombinatorialSurface K) where ...
  def IsOrientable (K) (hK : IsCombinatorialSurface K) : Prop := Nonempty (Orientation K hK)
  theorem isOrientable_subdivision ...
  theorem isOrientable_simplicialIso ...

  -- Transported to surfaces by Radó and the Hauptvermutung, never obtained from
  -- classification or singular homology.
  noncomputable def Surface.eulerChar (M : Type*) [TopologicalSpace M]
      [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M] [CompactSpace M] : ℤ
  theorem Surface.eulerChar_congr (h : M ≃ₜ N) : Surface.eulerChar M = Surface.eulerChar N
  def Surface.IsOrientable (M : Type*) [...] : Prop
  theorem Surface.isOrientable_congr (h : M ≃ₜ N) : Surface.IsOrientable M ↔ Surface.IsOrientable N

  -- A chosen orientation: an oriented triangulation modulo agreement under PL homeomorphisms
  -- isotopic to the comparison map. Isotopic homeomorphisms act the same way, and a connected
  -- orientable surface has exactly two. Each boundary circle is directed with the surface on
  -- its left; the unit circle bounding the disc runs counterclockwise.
  def Surface.Orientation (M : Type*) [...] : Type
  def Surface.Orientation.map (e : M ≃ₜ N) : Surface.Orientation M ≃ Surface.Orientation N
  theorem Surface.Orientation.map_of_isotopic ...
  theorem Surface.card_orientation [ConnectedSpace M] (h : Surface.IsOrientable M) :
      Nat.card (Surface.Orientation M) = 2
  def Surface.Orientation.boundary ...

  theorem eulerChar_sphere : Surface.eulerChar (Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1) = 2
  theorem eulerChar_disc : Surface.eulerChar (Metric.closedBall (0 : ℂ) 1) = 1
-/

/-! ## Layer 7: Schoenflies and tameness -/

/-- **Schoenflies theorem**, ambient planar form. -/
example {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    ∃ h : ℂ ≃ₜ ℂ, h '' J = Metric.sphere 0 1 := by
  sorry

/-- Schoenflies for the closed inside: the bounded side together with the curve is a
closed disc. -/
example {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    Nonempty (closure (TauCeti.filledHull J \ J) ≃ₜ Metric.closedBall (0 : ℂ) 1) := by
  sorry

/-- The inside of a Jordan curve is simply connected, in Mathlib's homotopy sense. Together
with the Jordan-domain statement of layer 2, this is the pair of hypotheses under which
`ConformalMapping`'s Carathéodory theorem applies to every Jordan curve. -/
example {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    IsSimplyConnected (TauCeti.filledHull J \ J) := by
  sorry

section Tameness

variable {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]

/-- Tameness of simple closed curves in the interior of a surface, stated on the embedding with
its model factors: charts of `M` valued in `F × F'` carry the image onto `F × {0}`. -/
example (f : Circle → M) (hf : IsEmbedding f) (hint : Set.range f ⊆ (𝓡∂ 2).interior M) :
    TauCeti.IsLocallyFlat (EuclideanSpace ℝ (Fin 1)) ℝ f := by
  sorry

/-- Tameness of arcs; the model is the half-line so that the endpoints are covered. -/
example (f : unitInterval → M) (hf : IsEmbedding f)
    (hint : Set.range f ⊆ (𝓡∂ 2).interior M) :
    TauCeti.IsLocallyFlat (EuclideanHalfSpace 1) ℝ f := by
  sorry

end Tameness

/-!
Once two-sidedness and regular neighbourhoods are pinned, add:

  -- The annular collar of a two-sided curve in the interior, and the annulus/Möbius-band
  -- regular-neighbourhood dichotomy for every simple closed curve in the interior.
  theorem exists_collar_of_twoSided_isJordanCurve ...
  theorem jordanCurve_neighborhood_dichotomy ...

  -- Tameness of finite graphs, in the vocabulary of arcs: finitely many arcs in the interior,
  -- meeting pairwise only in common endpoints, are carried by an ambient isotopy onto
  -- piecewise-linear arcs of one triangulation. `SurfaceTopology` layer 5 consumes this.
  theorem exists_ambientIsotopy_pl_of_arcs ...
-/

/-! ## Layer 8: uniqueness of PL and smooth structures, and Epstein's theorem -/

/-!
A PL structure on a compact surface is a triangulation; the targets are stated in
triangulation terms and bridged to `GeometricTopology`'s chart-based PL manifolds, whose
groupoid is Tau Ceti's `TauCeti.PLGroupoid` (`Geometry/Manifold/PLGroupoid.lean`). They wait on
`IsCombinatorialSurface`, `IsPLMap`, and relative isotopy:

  structure PLStructure (M : Type*) [TopologicalSpace M] where
    ι : Type
    K : AbstractSimplicialComplex ι
    hK : IsCombinatorialSurface K
    e : Realization K ≃ₜ M
  def PLStructure.Equiv (s t : PLStructure M) : Prop := IsPLMap (t.e.symm ∘ s.e)
  theorem PLStructure.equiv (s t : PLStructure M) : s.Equiv t        -- the Hauptvermutung

  -- Every homeomorphism is isotopic to a PL one, and rel a subcomplex on which it is PL.
  theorem exists_isotopic_plHomeomorph (s : PLStructure M) (t : PLStructure N) (f : M ≃ₜ N) :
      ∃ g : M ≃ₜ N, IsPLMap (t.e.symm ∘ g ∘ s.e) ∧ Isotopic f g
  theorem exists_isotopicRel_plHomeomorph ...

  -- Epstein: homotopic homeomorphisms of a compact surface are isotopic; homotopic PL
  -- homeomorphisms are PL isotopic. The two together make the PL and smooth mapping class
  -- groups of `SurfaceTopology` layer 9 isomorphic to the topological one.
  theorem isotopic_of_homotopic (f g : M ≃ₜ N) (h : ContinuousMap.Homotopic f g) : Isotopic f g
  theorem plIsotopic_of_isotopic ...

  theorem homeomorph_iff_plHomeomorph ...
  theorem hasGroupoid_plGroupoid (s : PLStructure M) :
      HasGroupoid M (TauCeti.PLGroupoid (𝓡∂ 2))     -- with the atlas the triangulation induces

  -- Smoothing: existence (Whitehead) and uniqueness up to a diffeomorphism isotopic to the
  -- identity (Munkres), in Mathlib's `IsManifold (𝓡∂ 2) ∞ M` vocabulary; isotopic
  -- diffeomorphisms are smoothly isotopic.
  def PLStructure.smoothing (s : PLStructure M) : ChartedSpace (EuclideanHalfSpace 2) M
  theorem PLStructure.smoothing_isManifold ...
  theorem PLStructure.smoothing_unique ...
  theorem smoothIsotopic_of_isotopic ...
-/

end TauCetiRoadmap.PlanarTopology
