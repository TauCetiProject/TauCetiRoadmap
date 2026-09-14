import Mathlib
import TauCeti.AlgebraicTopology.SimplicialComplex.Realization
import TauCeti.Geometry.Manifold.LocallyFlat.Basic
import TauCeti.Topology.FilledHull
import TauCeti.Topology.JordanCurve.Basic
import TauCeti.Topology.Triangulable

/-!
# Planar topology and the PL structure of surfaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library: these are targets, not completed proofs.

The roadmap has two interacting tracks. Layers 0--2 build the planar separation engine
(Jordan curves, crosscuts, accessibility, and two-dimensional invariance of domain).
Layers 3--6 build the simplicial/PL engine (subdivision, PL approximation, Rado,
the two-dimensional Hauptvermutung, and Euler characteristic). Layer 7 proves
Schoenflies and automatic tameness in dimension two; layer 8 identifies the topological,
PL, and smooth categories for compact surfaces.

Only declarations whose input vocabulary is already meaningful at the current Tau Ceti
pin are compiled below. In particular, do **not** introduce a vacuous `Prop := sorry` for
`Subdivides`, `IsCombinatorialSurface`, relative PL approximation, or the surface classes.
Their intended shapes are recorded as comments and should become compiled targets once
the prerequisite vocabulary is pinned. This follows the roadmap convention that a
condition which cannot yet be stated is omitted rather than replaced by an empty predicate.
-/

noncomputable section

namespace TauCetiRoadmap.PlanarTopology

open Complex Set Topology

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

/-- Alexander's trick, extension form. The eventual implementation should be
stated dimension-generally even though this roadmap only spends the planar case. -/
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

/-!
The shared isotopy library should acquire a genuine relative/supported isotopy API before
we compile the isotopy form of Alexander's trick. The intended milestone is:

  theorem isotopicRel_of_eqOn_sphere ... : IsotopicRel (Metric.sphere 0 1) f g

Likewise, the space-filling, nonrectifiable, and Osgood-curve examples belong to the
roadmap, but their precise constructors are not interface-defining enough to pin here.
-/

/-! ## Layer 1: polygonal foundations -/

/-- A finite polygonal path. The geometric carrier and simplicity API are deliberately
not baked into the structure: those should be reusable predicates on this object. -/
structure PolygonalPath where
  vertices : List ℂ
  ne_nil : vertices ≠ []

/-- The carrier of a polygonal path, obtained by joining consecutive vertices by line
segments (and, for a closed path, the final vertex to the first). -/
noncomputable def PolygonalPath.carrier (P : PolygonalPath) : Set ℂ :=
  sorry

/-- Crossing parity is the primitive invariant of the polygonal separation proof. -/
noncomputable def crossingParity (P : PolygonalPath) (q : ℂ) : ZMod 2 :=
  sorry

/-- Integer winding is derived from the same polygonal crossing machinery and compared
with Tau Ceti's analytic winding-number API. -/
noncomputable def polygonalWinding (P : PolygonalPath) (q : ℂ) : ℤ :=
  sorry

/-!
Once the exact finite simplicity/crosscut vocabulary is pinned, representative compiled
targets should be added for:

  -- Polygonal Jordan separation.
  theorem complement_connectedComponents_card_eq_two
      (P : PolygonalPath) (hP : P.IsSimpleClosed) :
      Nat.card (ConnectedComponents ((P.carrier)ᶜ : Set ℂ)) = 2

  -- The additive identity that drives both tracks.
  theorem polygonal_crosscut_parity ... :
      crossingParity P = crossingParity (P.splitLeft Q) + crossingParity (P.splitRight Q)

  theorem exists_ear ... : ∃ i, IsEar P i

  -- Polygonal Schoenflies.
  theorem exists_plHomeomorph_map_carrier_to_triangleBoundary ... : ...

The nonplanarity of `K₃,₃` should be stated here only after the common graph-embedding
vocabulary consumed by `SurfaceTopology` has landed; do not introduce a private
`PlanarEmbedding` type in this roadmap.
-/

/-! ## Layer 2: Jordan separation, crosscuts, and invariance of domain -/

/-- The precise frontier statement consumed by `ConformalMapping`: every point of a
Jordan curve is a limit of points on its bounded side. -/
example {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    J ⊆ closure (TauCeti.filledHull J \ J) := by
  sorry

/-- Jordan separation, in the component-count form used by lean-eval and as a useful
corollary of the stronger crosscut/frontier package. -/
example {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    Nat.card (ConnectedComponents ((J : Set ℂ)ᶜ : Set ℂ)) = 2 := by
  sorry

/-- The bounded side of a Jordan curve is connected. -/
example {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    IsConnected (TauCeti.filledHull J \ J) := by
  sorry

/-- Two-dimensional invariance of domain. This is the input that makes manifold boundary
chart-independent for topological surfaces. -/
example {U : Set ℂ} (hU : IsOpen U) (f : C(U, ℂ)) (hf : Function.Injective f) :
    IsOpen (Set.range f) ∧ IsOpenMap f := by
  sorry

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

  def stellarSubdivision ...

  def IsPLMap ... : Prop
  theorem IsPLMap.comp ...

  theorem exists_isomorphic_subdivisions
      (h : Realization K ≃ₜ Realization L) (hPL : IsPLMap h) : ...

`IsCombinatorialSurface` is a particularly important concrete definition: it should use
the dimension-two link condition (vertex links are combinatorial circles or arcs, and
edges lie in one or two triangles), not a dimension-general recognition recursion and not
`Prop := sorry`. Its realization theorem is the bridge consumed by `SurfaceTopology`.
-/

/-! ## Layer 4: PL approximation -/

/-!
Once `Subdivides`, `IsPLMap`, and `IsCombinatorialSurface` are compiled, pin the local
open-set Moise approximation theorem first, then the compact and relative forms. The
local strongly-positive-control-function statement is the one Radó actually consumes;
the compact epsilon statement is a corollary, not a substitute.
-/

/-! ## Layer 5: Radó and the two-dimensional Hauptvermutung -/

/-- **Radó's theorem**, closed-surface form: every compact topological surface is
triangulable. This uses Tau Ceti's existing weak `IsTriangulable` notion at the statement
boundary; the construction later supplies a combinatorial-surface witness. -/
example (M : Type*) [TopologicalSpace M] [CompactSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 2)) M] :
    TauCeti.IsTriangulable M := by
  sorry

/-!
The surface-with-boundary Radó theorem and the Hauptvermutung should become compiled
targets once `IsCombinatorialSurface` and heterogeneous `Subdivides` are present:

  theorem compact_surfaceWithBoundary_isTriangulable ... :
      ∃ K, IsCombinatorialSurface K ∧ Nonempty (Realization K ≃ₜ M)

  -- The two-dimensional Hauptvermutung.
  theorem exists_isomorphic_subdivisions_of_homeomorph_surface ... : ...

  theorem exists_plHomeomorph_of_homeomorph_surface ... : ...
-/

/-! ## Layer 6: Euler characteristic -/

/-!
Compile the finite-complex Euler characteristic only after the finite-face API and
heterogeneous subdivision relation are settled. The targets are:

  def AbstractSimplicialComplex.eulerChar ... : ℤ
  theorem eulerChar_subdivision ...
  theorem eulerChar_simplicialIso ...
  noncomputable def Surface.eulerChar (M : Type*) [CompactSurface M] : ℤ
  theorem Surface.eulerChar_congr ...

The surface-level definition must be transported from a triangulation using Radó and the
Hauptvermutung, not obtained from classification or singular homology.
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

/-!
Tameness should be stated against Tau Ceti's actual `IsLocallyFlat F F' f`, which is a
predicate on an embedding map with explicit model and complementary model. The schematic
set-valued declarations in the README are intentionally not copied here as if they
compiled. Once the chosen parametrizations of arcs and Jordan curves in a surface are
fixed, add representative targets saying those embeddings are locally flat, followed by
the annulus/Möbius regular-neighbourhood dichotomy.
-/

/-! ## Layer 8: uniqueness of PL and smooth structures -/

/-!
These targets wait on the shared `PLStructure`/PL-homeomorphism vocabulary owned by
`GeometricTopology` and on relative isotopy:

  theorem plStructure_unique_up_to_isomorphism ...
  theorem exists_isotopic_plHomeomorph ...
  theorem homeomorph_iff_plHomeomorph ...
  theorem exists_unique_smoothing ...

The isotopy-to-PL theorem is the important interface exported to `SurfaceTopology`'s
mapping-class-group layer.
-/

end TauCetiRoadmap.PlanarTopology
