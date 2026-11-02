import Mathlib
import TauCeti.AlgebraicTopology.SimplicialComplex.Realization
import TauCeti.Analysis.Complex.Conformal.Jordan.Domain
import TauCeti.Geometry.Manifold.Instances.ClosedBall
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

The guiding philosophy is classical geometric and combinatorial surface topology: curves,
triangles, subdivisions, and elementary moves. Later PL, isotopy, and smoothing theorems
complete the agreement of topological, PL, and compatible smooth structures, at the level
of surface classifications and isotopy classes of homeomorphisms. Euler characteristic
is computed by `V - E + F` and proved invariant by finite cell counts. The companion
roadmap's classical homology comes from finite boundary matrices and equivalence of
triangulations; singular homology is not a prerequisite. These results supply
`SurfaceTopology`'s elementary classification and `GeometricTopology`'s surface input.

A surface is a type carrying `[TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M]
[T2Space M] [SecondCountableTopology M]`, as the README's conventions fix it, and the
compiled statements below spell the instances out. Closed means `(𝓡∂ 2).boundary M = ∅`. The
piecewise-linear notion on the plane is Tau Ceti's `TauCeti.IsPLOn`.

The closed-disc charts and boundary identification are imported from
`TauCeti.Geometry.Manifold.Instances.ClosedBall` (`instChartedSpaceClosedBall` and
`boundary_closedBall`). No private admitted disc atlas is used.

The README also requires the following headlines whose input carriers are absent at
the library pin: polygonal ears/crosscut splitting and PL Schoenflies need the ear,
polygonal-crosscut and standard-triangle APIs; Radó's combinatorial form, the
Hauptvermutung and Pachner need IsCombinatorialSurface and support-aware heterogeneous
Subdivides; orientation transport needs the simplicial orientation double cover and
its realization comparisons; Euler characteristic needs those finite invariance
results; Epstein, smoothing and category comparison need relative/supported isotopies,
PL structures and compatible smoothings. They remain full README targets.

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

/-- Transport into the common half-space surface family, with empty boundary.
The construction is a prerequisite target, not an admitted chart atlas. -/
theorem exists_boundaryless_transport (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 2)) M] :
    ∃ c : ChartedSpace (EuclideanHalfSpace 2) M,
      letI := c
      (𝓡∂ 2).boundary M = ∅ := by
  sorry

/-- Alexander's trick, extension form. The README specifies the radial extension and
its norm and PL properties; this headline asserts extension of every sphere homeomorphism. -/
theorem exists_coneExtension {n : ℕ}
    (h : Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1 ≃ₜ
      Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1) :
    ∃ F : Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1 ≃ₜ
        Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1,
      ∀ (z : Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1)
        (hz : (z : EuclideanSpace ℝ (Fin n)) ∈ Metric.sphere 0 1),
        (F z : EuclideanSpace ℝ (Fin n)) = h ⟨z, hz⟩ := by
  sorry

/-- A space-filling curve: continuity does not give a curve of dimension one. -/
theorem exists_spaceFillingCurve : ∃ f : C(unitInterval, Metric.closedBall (0 : ℂ) 1), Function.Surjective f := by
  sorry

/-- A non-rectifiable Jordan curve: no parametrization has bounded variation. -/
theorem exists_nonrectifiable_jordanCurve : ∃ J : Set ℂ, TauCeti.IsJordanCurve J ∧
    ∀ γ : C(unitInterval, ℂ), Set.range γ = J → ¬ BoundedVariationOn γ Set.univ := by
  sorry

/-- An Osgood curve: a Jordan curve of positive area. -/
theorem exists_osgoodCurve : ∃ J : Set ℂ, TauCeti.IsJordanCurve J ∧ 0 < MeasureTheory.volume J := by
  sorry

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
  Set.range (fun i : Fin P.vertices.length => P.vertices.get i) ∪
    ⋃ i : Fin (P.vertices.length - 1),
      segment ℝ (P.vertices.get ⟨i.val, by omega⟩)
        (P.vertices.get ⟨i.val + 1, by omega⟩)

/-- The `i`-th side of a loop: the segment from vertex `i` to the cyclically next vertex. -/
noncomputable def PolygonalLoop.side (P : PolygonalLoop) (i : Fin P.vertices.length) : Set ℂ :=
  segment ℝ (P.vertices.get i) (P.vertices.get (finRotate _ i))

/-- The carrier of a polygonal loop: the union of its sides, including the closing one. -/
noncomputable def PolygonalLoop.carrier (P : PolygonalLoop) : Set ℂ :=
  ⋃ i, P.side i

/-- Simplicity is a condition on the vertex presentation, not on the carrier: at least three
vertices, no vertex repeated, consecutive sides meeting only in their shared vertex, and
non-consecutive sides disjoint. The list `[A, B, C, A, B, C]` has the triangle as its carrier and
is not simple; a ray from an interior point crosses it twice, so the carrier cannot be what
crossing parity is computed on. That the carrier of a simple loop is a Jordan curve is a layer 1
theorem, and a Jordan polygonal set has a simple presentation by renormalization. -/
def PolygonalLoop.IsSimple (P : PolygonalLoop) : Prop :=
  3 ≤ P.vertices.length ∧ P.vertices.Nodup ∧
    ∀ i j, i ≠ j →
      (finRotate _ i = j → P.side i ∩ P.side j = {P.vertices.get j}) ∧
      (finRotate _ i ≠ j → finRotate _ j ≠ i → Disjoint (P.side i) (P.side j))

/-- The carrier of a simple loop is a Jordan curve. -/
theorem PolygonalLoop.isJordanCurve_carrier (P : PolygonalLoop) (hP : P.IsSimple) : TauCeti.IsJordanCurve P.carrier := by
  sorry

/-- Renormalization: a polygonal set that is a Jordan curve has a simple presentation. -/
theorem PolygonalLoop.exists_simple_presentation (P : PolygonalLoop) (h : TauCeti.IsJordanCurve P.carrier) :
    ∃ Q : PolygonalLoop, Q.IsSimple ∧ Q.carrier = P.carrier := by
  sorry

/-- Horizontal-ray parity, with the lower endpoint included and upper endpoint excluded.
Horizontal sides contribute nothing; side occurrences are counted with multiplicity.
The value on the carrier is zero, and separation statements concern its complement. -/
noncomputable def crossingParity (P : PolygonalLoop) (q : ℂ) : ZMod 2 := by
  classical
  exact if q ∈ P.carrier then 0 else
    ((Finset.univ.filter fun i : Fin P.vertices.length =>
      let u := P.vertices.get i
      let v := P.vertices.get (finRotate _ i)
      let a := if u.im ≤ v.im then u else v
      let b := if u.im ≤ v.im then v else u
      a.im < b.im ∧ a.im ≤ q.im ∧ q.im < b.im ∧
        q.re < a.re + (q.im - a.im) * (b.re - a.re) / (b.im - a.im)).card : ZMod 2)

/-- The total parity function has the fixed value zero on the polygonal carrier. -/
theorem crossingParity_eq_zero_of_mem (P : PolygonalLoop) {q : ℂ} (hq : q ∈ P.carrier) :
    crossingParity P q = 0 := by
  simp [crossingParity, hq]

/-- Integer winding is derived from the same polygonal crossing machinery and compared
with Tau Ceti's analytic winding-number API. -/
noncomputable def polygonalWinding (P : PolygonalLoop) (q : ℂ) : ℤ := by
  classical
  exact if q ∈ P.carrier then 0 else
    ∑ i : Fin P.vertices.length,
      let u := P.vertices.get i
      let v := P.vertices.get (finRotate _ i)
      let a := if u.im ≤ v.im then u else v
      let b := if u.im ≤ v.im then v else u
      if a.im < b.im ∧ a.im ≤ q.im ∧ q.im < b.im ∧
        q.re < a.re + (q.im - a.im) * (b.re - a.re) / (b.im - a.im)
      then (if u.im < v.im then 1 else -1) else 0

/-- A piecewise-linear homeomorphism of the plane, in Tau Ceti's vocabulary. -/
def IsPLHomeomorph (h : ℂ ≃ₜ ℂ) : Prop :=
  TauCeti.IsPLOn h Set.univ ∧ TauCeti.IsPLOn h.symm Set.univ

/-- Polygonal Jordan separation. -/
theorem polygonal_jordan_separation (P : PolygonalLoop) (hP : P.IsSimple) :
    Nat.card (ConnectedComponents ((P.carrier)ᶜ : Set ℂ)) = 2 := by
  sorry

/-! ## Layer 2: Jordan separation, crosscuts, Brouwer, and invariance of domain -/

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

/-- Accessibility is a condition on points of the boundary itself. -/
theorem Accessible.mem {J : Set ℂ} {p : ℂ} (hp : Accessible J p) : p ∈ J :=
  hp.1

/-- A crosscut meets the original boundary exactly at its two distinct endpoints. -/
theorem IsCrosscut.exists_boundary_endpoints {J P : Set ℂ} (hP : IsCrosscut J P) :
    ∃ a b : ℂ, a ∈ J ∧ b ∈ J ∧ a ≠ b ∧ P ∩ J = {a, b} := by
  obtain ⟨γ, hγ, hrange, hzero, hone, hne, hinterior⟩ := hP
  refine ⟨γ 0, γ 1, hzero, hone, hne, ?_⟩
  ext z
  constructor
  · rintro ⟨hzP, hzJ⟩
    rw [← hrange] at hzP
    obtain ⟨t, rfl⟩ := hzP
    by_cases htzero : t = 0
    · simp [htzero]
    by_cases htone : t = 1
    · simp [htone]
    exact False.elim ((hinterior t htzero htone).2 hzJ)
  · intro hz
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hz
    rcases hz with rfl | rfl
    · constructor
      · rw [← hrange]
        exact ⟨0, rfl⟩
      · exact hzero
    · constructor
      · rw [← hrange]
        exact ⟨1, rfl⟩
      · exact hone

/-- The inside of a Jordan curve is a Jordan domain, supplying the four hypotheses of
Carathéodory's boundary-correspondence theorem. -/
theorem isJordanDomain_inside {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    TauCeti.IsJordanDomain (TauCeti.filledHull J \ J) := by
  sorry

/-- Simple connectivity is a library consequence of the Layer 2 output. -/
example {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    IsSimplyConnected (TauCeti.filledHull J \ J) :=
  (isJordanDomain_inside hJ).isSimplyConnected

/-- Accessible boundary points have ambient closure exactly equal to the Jordan curve. -/
theorem closure_accessible {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    closure {p | Accessible J p} = J := by
  sorry

/-- A crosscut produces two Jordan curves, their intersection and union, and the two inside regions. -/
theorem crosscut {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) (P : Set ℂ)
    (hP : IsCrosscut J P) :
    ∃ J₁ J₂ : Set ℂ, TauCeti.IsJordanCurve J₁ ∧ TauCeti.IsJordanCurve J₂ ∧
      J₁ ∩ J₂ = P ∧ J₁ ∪ J₂ = J ∪ P ∧
      (TauCeti.filledHull J \ J) \ P =
        (TauCeti.filledHull J₁ \ J₁) ∪ (TauCeti.filledHull J₂ \ J₂) ∧
      Disjoint (TauCeti.filledHull J₁ \ J₁) (TauCeti.filledHull J₂ \ J₂) := by
  sorry

end IsJordanCurve

/-- Jordan separation in the component-count form, the shape
[lean-eval](https://github.com/leanprover/lean-eval) states, as a corollary of the stronger
crosscut/frontier package. -/
theorem jordan_separation (hJ : TauCeti.IsJordanCurve J) :
    Nat.card (ConnectedComponents ((J : Set ℂ)ᶜ : Set ℂ)) = 2 := by
  sorry

/-- No retraction of the disc onto its circle: the winding number of the identity of the circle
is one, and would be zero if a retraction existed. -/
theorem no_retraction_disc_circle :
    ¬ ∃ r : C(Metric.closedBall (0 : ℂ) 1, Metric.sphere (0 : ℂ) 1),
      ∀ z : Metric.closedBall (0 : ℂ) 1, (z : ℂ) ∈ Metric.sphere (0 : ℂ) 1 → (r z : ℂ) = z := by
  sorry

/-- Brouwer's fixed-point theorem in dimension two. -/
theorem brouwer_fixedPoint₂ (f : C(Metric.closedBall (0 : ℂ) 1, Metric.closedBall (0 : ℂ) 1)) : ∃ z, f z = z := by
  sorry

/-- Two-dimensional invariance of domain, derived from Brouwer. It needs nothing from the
Jordan curve theorem, and it is the input that makes manifold boundary chart-independent. -/
theorem invarianceOfDomain₂ {U : Set ℂ} (hU : IsOpen U) (f : C(U, ℂ)) (hf : Function.Injective f) :
    IsOpen (Set.range f) ∧ IsOpenMap f := by
  sorry

section Boundary

variable {M N : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]
  [TopologicalSpace N] [ChartedSpace (EuclideanHalfSpace 2) N] [T2Space N]

/-- Homeomorphisms of surfaces preserve the boundary: chart-independence of `∂M`. -/
theorem image_boundary (e : M ≃ₜ N) : e '' (𝓡∂ 2).boundary M = (𝓡∂ 2).boundary N := by
  sorry

/-- The number of boundary components, a homeomorphism invariant by the preceding statement. -/
noncomputable def boundaryComponentCount (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanHalfSpace 2) M] : ℕ :=
  Nat.card (ConnectedComponents ((𝓡∂ 2).boundary M))

theorem boundaryComponentCount_homeomorph (e : M ≃ₜ N) : boundaryComponentCount M = boundaryComponentCount N := by
  sorry

end Boundary

/-! ## Layer 4: PL approximation -/

/-!
The local forms already use the existing `OpenPartialHomeomorph` and `TauCeti.IsPLOn` APIs.
The error function has a positive lower bound on a neighbourhood within the source at each
source point; it need not be continuous or have a positive global lower bound. The half-plane
form preserves both the half-plane and its boundary line. Extend boundary-preserving maps
between relative-open subsets of the half-plane by reflection first, and restrict the
approximation back afterwards. These are the local forms Radó consumes.

The compact and relative forms use the layer 3 subdivision, realization-metric, and simplicial
map APIs. Present a subcomplex by an injective simplicial map `iA : SimplicialMap KA K`.
Carry `hK`, `hL`, and `f : Realization K ≃ₜ Realization L` explicitly; require
`IsPLMap (f ∘ iA.realization)` and conclude agreement on every `iA.realization a`.
The corresponding relative isotopy fixes `Set.range iA.realization`.
Include local relative versions fixing a closed, locally finite polyhedral subcomplex on
which `f` is PL, with the same error condition, including the boundary-line gluing case.
-/

section LocalApproximation

local notation "E" => EuclideanSpace ℝ (Fin 2)
local notation "H" => (fun x : E => 0 ≤ x 0)
local notation "B" => (fun x : E => x 0 = 0)

/-- Local plane approximation with an explicitly locally positive error bound. -/
theorem exists_pl_approximation_open
    (f : OpenPartialHomeomorph E E) (φ : E → ℝ)
    (hφ : ∀ x ∈ f.source, ∃ c : ℝ, 0 < c ∧ ∀ᶠ y in 𝓝[f.source] x, c ≤ φ y) :
    ∃ g : OpenPartialHomeomorph E E,
      g.source = f.source ∧ g.target = f.target ∧
      TauCeti.IsPLOn g g.source ∧ TauCeti.IsPLOn g.symm g.target ∧
      ∀ x ∈ f.source, dist (f x) (g x) < φ x := by
  sorry

/-- The half-plane approximation preserves its boundary line as well as the half-plane. -/
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
      ∀ x ∈ f.source, dist (f x) (g x) < φ x := by
  sorry

end LocalApproximation

/-! ## Layer 5: Radó, the two-dimensional Hauptvermutung, and Pachner's theorem -/

/-- **Radó's theorem**, in the weak form Tau Ceti's `IsTriangulable` can state: a corollary of
the combinatorial-surface form below, which is the actual target. -/
theorem isTriangulable_of_compactSurface (M : Type*) [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]
    [CompactSpace M] : TauCeti.IsTriangulable M := by
  sorry

/-! ## Layer 7: Schoenflies and tameness -/

/-- **Schoenflies theorem**, ambient planar form. -/
theorem schoenflies_plane {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    ∃ h : ℂ ≃ₜ ℂ, h '' J = Metric.sphere 0 1 := by
  sorry

/-- Schoenflies for the closed inside: the bounded side together with the curve is a
closed disc. -/
theorem schoenflies_closed_inside {J : Set ℂ} (hJ : TauCeti.IsJordanCurve J) :
    Nonempty (closure (TauCeti.filledHull J \ J) ≃ₜ Metric.closedBall (0 : ℂ) 1) := by
  sorry

/-!
The Schoenflies proof follows the elementary crosscut and matched-cellulation route.
The conformal application and its simple-connectivity consequence are supplied in Layer 2.
-/

section Tameness

variable {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace 2) M] [T2Space M]

/-- Tameness of simple closed curves in the interior of a surface, stated on the embedding with
its model factors: charts of `M` valued in `F × F'` carry the image onto `F × {0}`. -/
theorem isLocallyFlat_circle (f : Circle → M) (hf : IsEmbedding f) (hint : Set.range f ⊆ (𝓡∂ 2).interior M) :
    TauCeti.IsLocallyFlat (EuclideanSpace ℝ (Fin 1)) ℝ f := by
  sorry

/-- Tameness of arcs. The ambient model stays the plane; it is the slice that becomes the
half-line, so that one statement covers the endpoints and the interior points. -/
theorem isSliceEmbedding_arc (f : unitInterval → M) (hf : IsEmbedding f)
    (hint : Set.range f ⊆ (𝓡∂ 2).interior M) :
    TauCeti.IsSliceEmbedding (Set.Ici (0 : ℝ) ×ˢ ({0} : Set ℝ)) f := by
  sorry

end Tameness

end TauCetiRoadmap.PlanarTopology
