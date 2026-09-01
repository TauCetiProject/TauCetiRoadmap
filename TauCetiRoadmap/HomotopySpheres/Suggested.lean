import Mathlib

/-!
# High-dimensional differential topology and homotopy spheres: target signatures

This file is not the roadmap and is not exhaustive. The definitive document is README.md.
The declarations below pin representative interfaces whose types rule out the vacuous
orientation, framing, boundary, Pontryagin--Thom, and Wall abstractions discussed in review.

`Internal.OrientationSupplierMirror` is an exact temporary mirror of the Heegaard-Floer-owned
orientation API. Its deletion gate is the import providing `Manifold.Orientation`,
`Manifold.Orientation.Agrees`, and `Manifold.Diffeomorph.PreservesOrientation`; the implementation
then replaces every mirror occurrence by those declarations and deletes the whole namespace.

`Internal.GeometricTopologySupplierMirror` similarly mirrors only the collared-boundary
contracts needed to type-check this file. Its deletion gate is the GeometricTopology import
providing `CollaredOrientedManifold`, `SmoothEmbeddedClosedDisk`, `CollarOpen`, and `CollarSource`.
Neither mirror is a public Tau Ceti target of this roadmap.
-/

open CategoryTheory ContinuousMap Manifold Topology
open CategoryTheory.Limits
open scoped ContDiff Manifold Topology

namespace TauCetiRoadmap.HomotopySpheres

universe u v

/-! ## Convenient spaces and literal colimits -/

abbrev ConvenientSpace := CompactlyGenerated.{u, u}

#check CompactlyGenerated.compactlyGeneratedToTop

noncomputable def stableStemDiagram (k : ℕ) : ℕ ⥤ AddCommGrpCat := by
  sorry

noncomputable def stableStem (k : ℕ) : AddCommGrpCat :=
  colimit (stableStemDiagram k)

noncomputable def stableStemι (k r : ℕ) :
    (stableStemDiagram k).obj r ⟶ stableStem k :=
  colimit.ι (stableStemDiagram k) r

noncomputable def stableStemIsColimit (k : ℕ) :
    IsColimit (colimit.cocone (stableStemDiagram k)) :=
  colimit.isColimit (stableStemDiagram k)

noncomputable def stableSOHomotopyDiagram (k : ℕ) : ℕ ⥤ AddCommGrpCat := by
  sorry

noncomputable def stableSOHomotopy (k : ℕ) : AddCommGrpCat :=
  colimit (stableSOHomotopyDiagram k)

noncomputable def stableJ (k : ℕ) : stableSOHomotopy k ⟶ stableStem k := by
  sorry

theorem stableSOHomotopy_five_subsingleton : Subsingleton (stableSOHomotopy 5) := by
  sorry

theorem stableSOHomotopy_six_subsingleton : Subsingleton (stableSOHomotopy 6) := by
  sorry

end TauCetiRoadmap.HomotopySpheres

/-! ## Internal exact-shape orientation supplier mirror -/

namespace TauCetiRoadmap.HomotopySpheres.Internal.OrientationSupplierMirror

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  (I : ModelWithCorners ℝ E H)

def signedOrientation {ι : Type*} (ε : ℤˣ)
    (orient : _root_.Orientation ℝ E ι) : _root_.Orientation ℝ E ι :=
  Units.map (Int.castRingHom ℝ).toMonoidHom ε • orient

noncomputable def tangentCoordChangeEquiv
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    (x y z : M) : E ≃ₗ[ℝ] E := by
  sorry

/-- A lift of a manifold orientation with continuous, chart-compatible signs. -/
structure OrientationLift (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I 1 M] [FiniteDimensional ℝ E] (ι : Type*) [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)] where
  modelOrientation : _root_.Orientation ℝ E ι
  chartSign : M → M → ℤˣ
  continuousOn_chartSign : ∀ x, ContinuousOn (chartSign x) (chartAt H x).source
  chartSign_eq_one_of_notMem : ∀ x z, z ∉ (chartAt H x).source → chartSign x z = 1
  compatible : ∀ x y z, z ∈ (chartAt H x).source → z ∈ (chartAt H y).source →
    _root_.Orientation.map ι (tangentCoordChangeEquiv I x y z)
        (signedOrientation (chartSign x z) modelOrientation) =
      signedOrientation (chartSign y z) modelOrientation

noncomputable instance OrientationLift.instSMul
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)] :
    SMul ℤˣ (OrientationLift I M ι) := by
  sorry

noncomputable instance OrientationLift.instMulAction
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)] :
    MulAction ℤˣ (OrientationLift I M ι) := by
  sorry

/-- A manifold orientation is the orbit of compatible lifts under simultaneous reversal. -/
abbrev Orientation (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I 1 M] [FiniteDimensional ℝ E] (ι : Type*) [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)] :=
  MulAction.orbitRel.Quotient ℤˣ (OrientationLift I M ι)

namespace Orientation

noncomputable def orientationAt
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)]
    (o : Orientation I M ι) (x : M) : _root_.Orientation ℝ E ι := by
  sorry

def Agrees
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)]
    (o₀ o₁ : Orientation I M ι) : Prop :=
  ∀ x, orientationAt I o₀ x = orientationAt I o₁ x

noncomputable instance
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)] :
    InvolutiveNeg (Orientation I M ι) := by
  sorry

end Orientation

def Diffeomorph.PreservesOrientation
    {E' H' M N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
    [TopologicalSpace H'] (I' : ModelWithCorners ℝ E' H')
    [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace H M] [ChartedSpace H' N]
    [IsManifold I ∞ M] [IsManifold I' ∞ N] [FiniteDimensional ℝ E]
    [FiniteDimensional ℝ E'] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)]
    [Fact (Fintype.card ι = Module.finrank ℝ E')]
    (f : M ≃ₘ⟮I, I'⟯ N) (oM : Orientation I M ι) (oN : Orientation I' N ι) : Prop :=
  ∀ x, _root_.Orientation.map ι
      (f.mfderivToContinuousLinearEquiv (by simp) x).toLinearEquiv
        (Orientation.orientationAt I oM x) =
    Orientation.orientationAt I' oN (f x)

end TauCetiRoadmap.HomotopySpheres.Internal.OrientationSupplierMirror

/-! ## Internal shared-collared-geometry supplier mirror -/

namespace TauCetiRoadmap.HomotopySpheres.Internal.GeometricTopologySupplierMirror

private abbrev ModelSpace (n : ℕ) := EuclideanSpace ℝ (Fin n)

private noncomputable instance modelSpaceRankFact (n : ℕ) :
    Fact (Fintype.card (Fin n) = Module.finrank ℝ (ModelSpace n)) :=
  ⟨by simp [ModelSpace]⟩

private noncomputable abbrev SmoothModel (n : ℕ) :=
  modelWithCornersSelf ℝ (ModelSpace n)

def CollarSource (B : Type*) : Set (unitInterval × B) :=
  {p : unitInterval × B | (p.1 : ℝ) < 1}

noncomputable def CollarOpen (B : Type*) [TopologicalSpace B] :
    TopologicalSpace.Opens (unitInterval × B) :=
  ⟨CollarSource B, by sorry⟩

theorem zero_mem_collarSource {B : Type*} (b : B) :
    (0, b) ∈ CollarSource B := by
  simp [CollarSource]

noncomputable def collarDerivativeEquiv
    {n : ℕ} {H M B : Type*} [TopologicalSpace H]
    (I : ModelWithCorners ℝ (ModelSpace n) H) [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I ∞ M] [TopologicalSpace B]
    [ChartedSpace (ModelSpace (n - 1)) B]
    [IsManifold (SmoothModel (n - 1)) ∞ B]
    (collar : PartialDiffeomorph
      ((𝓡∂ 1).prod (SmoothModel (n - 1))) I (unitInterval × B) M ∞)
    (p : unitInterval × B) (_hp : p ∈ collar.source) :
    (ModelSpace 1 × ModelSpace (n - 1)) ≃ₗ[ℝ] ModelSpace n := by
  sorry

noncomputable def outwardNormalBoundaryOrientation {n : ℕ}
    (_o : _root_.Orientation ℝ (ModelSpace (n - 1)) (Fin (n - 1))) :
    _root_.Orientation ℝ (ModelSpace 1 × ModelSpace (n - 1)) (Fin n) := by
  sorry

/-- The outward-normal-first rule ties the boundary orientation to the ambient one. -/
def CollarInducesBoundaryOrientation
    {n : ℕ} {H M B : Type*} [TopologicalSpace H]
    (I : ModelWithCorners ℝ (ModelSpace n) H) [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I ∞ M] [TopologicalSpace B]
    [ChartedSpace (ModelSpace (n - 1)) B]
    [IsManifold (SmoothModel (n - 1)) ∞ B]
    (ambientOrientation : Internal.OrientationSupplierMirror.Orientation I M (Fin n))
    (boundaryOrientation : Internal.OrientationSupplierMirror.Orientation
      (SmoothModel (n - 1)) B (Fin (n - 1)))
    (collar : PartialDiffeomorph
      ((𝓡∂ 1).prod (SmoothModel (n - 1))) I (unitInterval × B) M ∞)
    (collarSource_eq : collar.source = CollarSource B) : Prop :=
  ∀ b, _root_.Orientation.map (Fin n)
      (collarDerivativeEquiv I collar (0, b) (by
        rw [collarSource_eq]
        exact zero_mem_collarSource b))
      (outwardNormalBoundaryOrientation
        (Internal.OrientationSupplierMirror.Orientation.orientationAt
          (SmoothModel (n - 1)) boundaryOrientation b)) =
    Internal.OrientationSupplierMirror.Orientation.orientationAt
      I ambientOrientation (collar (0, b))

/-- A compact connected oriented manifold with its actual boundary and a half-open collar. -/
structure CollaredOrientedManifold (n : ℕ) where
  H : Type
  [modelTopology : TopologicalSpace H]
  model : ModelWithCorners ℝ (ModelSpace n) H
  M : Type
  [topology : TopologicalSpace M]
  [charted : ChartedSpace H M]
  [manifold : IsManifold model ∞ M]
  [t2 : T2Space M]
  [secondCountable : SecondCountableTopology M]
  [compact : CompactSpace M]
  [connected : ConnectedSpace M]
  orientation : Internal.OrientationSupplierMirror.Orientation model M (Fin n)
  B : Type
  [boundaryTopology : TopologicalSpace B]
  [boundaryCharted : ChartedSpace (ModelSpace (n - 1)) B]
  [boundaryManifold : IsManifold (SmoothModel (n - 1)) ∞ B]
  [intrinsicBoundaryCharted :
    ChartedSpace (ModelSpace (n - 1)) {x : M // x ∈ model.boundary M}]
  [intrinsicBoundaryManifold :
    IsManifold (SmoothModel (n - 1)) ∞ {x : M // x ∈ model.boundary M}]
  boundaryOrientation : Internal.OrientationSupplierMirror.Orientation
    (SmoothModel (n - 1)) B (Fin (n - 1))
  boundaryIdentification :
    B ≃ₘ⟮SmoothModel (n - 1), SmoothModel (n - 1)⟯ {x : M // x ∈ model.boundary M}
  collarNeighbourhood : Set M
  collarNeighbourhood_open : IsOpen collarNeighbourhood
  boundary_subset_collarNeighbourhood : model.boundary M ⊆ collarNeighbourhood
  collar : PartialDiffeomorph
    ((𝓡∂ 1).prod (SmoothModel (n - 1))) model (unitInterval × B) M ∞
  collar_source : collar.source = CollarSource B
  collar_target : collar.target = collarNeighbourhood
  collar_zero : ∀ b, collar (0, b) = boundaryIdentification b
  collar_meets_boundary_iff : ∀ t b, (t, b) ∈ CollarSource B →
    (collar (t, b) : M) ∈ model.boundary M ↔ t = 0
  ambient_induces_boundary :
    CollarInducesBoundaryOrientation model orientation boundaryOrientation collar collar_source
  boundary_nonempty : Nonempty B

attribute [instance] CollaredOrientedManifold.modelTopology
  CollaredOrientedManifold.topology CollaredOrientedManifold.charted
  CollaredOrientedManifold.manifold CollaredOrientedManifold.t2
  CollaredOrientedManifold.secondCountable CollaredOrientedManifold.compact
  CollaredOrientedManifold.connected CollaredOrientedManifold.boundaryTopology
  CollaredOrientedManifold.boundaryCharted CollaredOrientedManifold.boundaryManifold
  CollaredOrientedManifold.intrinsicBoundaryCharted
  CollaredOrientedManifold.intrinsicBoundaryManifold

/-- A smoothly embedded standard closed disc with an exterior half-open collar. -/
structure SmoothEmbeddedClosedDisk (n : ℕ) {H M : Type*} [TopologicalSpace H]
    (I : ModelWithCorners ℝ (ModelSpace n) H) [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I ∞ M] where
  disk : CollaredOrientedManifold n
  [dimensionPositive : NeZero n]
  [standardBallCharted :
    ChartedSpace (EuclideanHalfSpace n) (Metric.closedBall (0 : ModelSpace n) 1)]
  [standardBallManifold :
    IsManifold (𝓡∂ n) ∞ (Metric.closedBall (0 : ModelSpace n) 1)]
  standardBall :
    disk.M ≃ₘ⟮disk.model, 𝓡∂ n⟯ Metric.closedBall (0 : ModelSpace n) 1
  embedding : C(disk.M, M)
  smoothEmbedding : IsSmoothEmbedding disk.model I ∞ embedding
  range_closed : IsClosed (Set.range embedding)
  range_ne_univ : Set.range embedding ≠ Set.univ
  exteriorNeighbourhood : Set M
  exteriorNeighbourhood_open : IsOpen exteriorNeighbourhood
  exteriorCollar : PartialDiffeomorph
    ((𝓡∂ 1).prod (SmoothModel (n - 1))) I (unitInterval × disk.B) M ∞
  exteriorCollar_source : exteriorCollar.source = CollarSource disk.B
  exteriorCollar_target : exteriorCollar.target = exteriorNeighbourhood
  exterior_zero : ∀ b,
    exteriorCollar (0, b) = embedding (disk.boundaryIdentification b)
  exterior_positive_disjoint : ∀ t b, (t, b) ∈ CollarSource disk.B → t ≠ 0 →
    (exteriorCollar (t, b) : M) ∉ Set.range embedding

noncomputable def SmoothEmbeddedClosedDisk.exterior
    {n : ℕ} {H M : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ (ModelSpace n) H} [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I ∞ M]
    (D : SmoothEmbeddedClosedDisk (M := M) n I) : TopologicalSpace.Opens M :=
  ⟨(Set.range D.embedding)ᶜ, D.range_closed.isOpen_compl⟩

end TauCetiRoadmap.HomotopySpheres.Internal.GeometricTopologySupplierMirror

/-! ## Small atlas, genuine tangent framings, and fillings -/

namespace TauCetiRoadmap.HomotopySpheres

private abbrev ModelSpace (n : ℕ) := EuclideanSpace ℝ (Fin n)

private noncomputable instance modelSpaceRankFact (n : ℕ) :
    Fact (Fintype.card (Fin n) = Module.finrank ℝ (ModelSpace n)) :=
  ⟨by simp [ModelSpace]⟩

private noncomputable abbrev SmoothModel (n : ℕ) :=
  modelWithCornersSelf ℝ (ModelSpace n)

private abbrev Sphere (n : ℕ) :=
  Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1

/-- A finite lawful smooth atlas code on the fixed Type-0 model. -/
structure SmoothAtlasCode (n : ℕ) where
  chartCount : ℕ
  chartDomain : Fin chartCount → Set (ModelSpace n)
  chartDomain_open : ∀ i, IsOpen (chartDomain i)
  overlap : Fin chartCount → Fin chartCount → Set (ModelSpace n)
  overlap_open : ∀ i j, IsOpen (overlap i j)
  overlap_subset_source : ∀ i j, overlap i j ⊆ chartDomain i
  self_overlap : ∀ i, overlap i i = chartDomain i
  transition : Fin chartCount → Fin chartCount →
    OpenPartialHomeomorph (ModelSpace n) (ModelSpace n)
  transition_source : ∀ i j, (transition i j).source = overlap i j
  transition_target : ∀ i j, (transition i j).target = overlap j i
  transition_mem_groupoid :
    ∀ i j, transition i j ∈ contDiffGroupoid ∞ (SmoothModel n)
  transition_id : ∀ i x, x ∈ chartDomain i → transition i i x = x
  transition_inv : ∀ i j x, x ∈ overlap i j → transition j i (transition i j x) = x
  transition_cocycle : ∀ i j k x, x ∈ overlap i j →
    transition i j x ∈ overlap j k →
      x ∈ overlap i k ∧ transition i k x = transition j k (transition i j x)
  identified : (Σ i, chartDomain i) → (Σ i, chartDomain i) → Prop
  identified_iff : ∀ i j x y,
    identified ⟨i, x⟩ ⟨j, y⟩ ↔
      (x : ModelSpace n) ∈ overlap i j ∧ transition i j x = y
  identified_refl : ∀ x, identified x x
  identified_symm : ∀ {x y}, identified x y → identified y x
  identified_trans : ∀ {x y z}, identified x y → identified y z → identified x z
  separated : IsClosed {p : (Σ i, chartDomain i) × (Σ i, chartDomain i) |
    identified p.1 p.2}

abbrev SmoothAtlasCode.PrePoint {n : ℕ} (C : SmoothAtlasCode n) :=
  Σ i, C.chartDomain i

def SmoothAtlasCode.gluingSetoid {n : ℕ} (C : SmoothAtlasCode n) : Setoid C.PrePoint where
  r := C.identified
  iseqv :=
    ⟨fun x ↦ C.identified_refl x,
      fun {_ _} h ↦ C.identified_symm h,
      fun {_ _ _} hxy hyz ↦ C.identified_trans hxy hyz⟩

abbrev SmoothAtlasCode.Realization {n : ℕ} (C : SmoothAtlasCode n) :=
  Quotient C.gluingSetoid

def SmoothAtlasCode.quotientProjection {n : ℕ} (C : SmoothAtlasCode n) :
    C.PrePoint → C.Realization :=
  Quotient.mk C.gluingSetoid

theorem SmoothAtlasCode.quotientProjection_isOpenQuotientMap
    {n : ℕ} (C : SmoothAtlasCode n) : IsOpenQuotientMap C.quotientProjection := by
  sorry

def SmoothAtlasCode.chartToRealization {n : ℕ} (C : SmoothAtlasCode n)
    (i : Fin C.chartCount) : C.chartDomain i → C.Realization :=
  fun x ↦ C.quotientProjection ⟨i, x⟩

theorem SmoothAtlasCode.chartToRealization_isOpenEmbedding
    {n : ℕ} (C : SmoothAtlasCode n) (i : Fin C.chartCount) :
    IsOpenEmbedding (C.chartToRealization i) := by
  sorry

noncomputable def SmoothAtlasCode.realizedChart {n : ℕ} (C : SmoothAtlasCode n)
    (i : Fin C.chartCount) : OpenPartialHomeomorph C.Realization (ModelSpace n) := by
  sorry

@[instance_reducible]
noncomputable def SmoothAtlasCode.realizationChartedSpace
    {n : ℕ} (C : SmoothAtlasCode n) :
    ChartedSpace (ModelSpace n) C.Realization := by
  sorry

attribute [local instance] SmoothAtlasCode.realizationChartedSpace

theorem SmoothAtlasCode.realization_atlas {n : ℕ} (C : SmoothAtlasCode n) :
    atlas (ModelSpace n) C.Realization = Set.range C.realizedChart := by
  sorry

theorem SmoothAtlasCode.realized_transition {n : ℕ} (C : SmoothAtlasCode n)
    (i j : Fin C.chartCount) :
    (C.realizedChart i).symm ≫ₕ C.realizedChart j = C.transition i j := by
  sorry

structure SmoothClosedOrientedCycle (n : ℕ) where
  code : SmoothAtlasCode n
  t2 : T2Space code.Realization
  secondCountable : SecondCountableTopology code.Realization
  compact : CompactSpace code.Realization
  manifold : IsManifold (SmoothModel n) ∞ code.Realization
  orientation : Internal.OrientationSupplierMirror.Orientation
    (SmoothModel n) code.Realization (Fin n)

attribute [instance] SmoothClosedOrientedCycle.t2
  SmoothClosedOrientedCycle.secondCountable SmoothClosedOrientedCycle.compact
  SmoothClosedOrientedCycle.manifold

def OrientationPreservingDiffeomorph {n : ℕ} (M : Type u) (N : Type v)
    [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace (ModelSpace n) M]
    [ChartedSpace (ModelSpace n) N] [IsManifold (SmoothModel n) ∞ M]
    [IsManifold (SmoothModel n) ∞ N]
    (oM : Internal.OrientationSupplierMirror.Orientation (SmoothModel n) M (Fin n))
    (oN : Internal.OrientationSupplierMirror.Orientation (SmoothModel n) N (Fin n)) :=
  {f : M ≃ₘ⟮SmoothModel n, SmoothModel n⟯ N //
    Internal.OrientationSupplierMirror.Diffeomorph.PreservesOrientation
      (SmoothModel n) (SmoothModel n) f oM oN}

structure HomotopySphereCycle (n : ℕ) extends SmoothClosedOrientedCycle n where
  marking : code.Realization ≃ₕ Sphere n

abbrev StabilizedTangentBundle
    {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    (M : Type*) [TopologicalSpace M] [ChartedSpace H M] (r : ℕ) :=
  (fun x : M => TangentSpace I x) ×ᵇ Bundle.Trivial M (ModelSpace r)

structure StableTangentFraming
    {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] (r : ℕ) where
  trivialization : Bundle.Trivialization (E × ModelSpace r)
    (Bundle.TotalSpace.proj :
      Bundle.TotalSpace (E × ModelSpace r) (StabilizedTangentBundle I M r) → M)
  global : trivialization.baseSet = Set.univ
  linear : trivialization.IsLinear ℝ
  memAtlas : MemTrivializationAtlas trivialization

structure TangentFraming
    {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] where
  trivialization : Bundle.Trivialization E
    (Bundle.TotalSpace.proj : TangentBundle I M → M)
  global : trivialization.baseSet = Set.univ
  linear : trivialization.IsLinear ℝ
  memAtlas : MemTrivializationAtlas trivialization

noncomputable def TangentFraming.stabilize
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    (framing : TangentFraming I M) (r : ℕ) : StableTangentFraming I M r := by
  sorry

noncomputable def StableTangentFraming.orientation
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)] {r : ℕ}
    (_framing : StableTangentFraming I M r) :
    Internal.OrientationSupplierMirror.Orientation I M ι := by
  sorry

structure FramedCycle (n : ℕ) extends SmoothClosedOrientedCycle n where
  stabilizationRank : ℕ
  framing : StableTangentFraming (SmoothModel n) code.Realization stabilizationRank
  orientation_agrees : Internal.OrientationSupplierMirror.Orientation.Agrees
    (SmoothModel n) orientation
    (StableTangentFraming.orientation (ι := Fin n) framing)

abbrev CollaredOrientedFilling :=
  Internal.GeometricTopologySupplierMirror.CollaredOrientedManifold

noncomputable def HalfOpenCollarDomain {n : ℕ} (W : CollaredOrientedFilling n) :
    TopologicalSpace.Opens (unitInterval × W.B) :=
  Internal.GeometricTopologySupplierMirror.CollarOpen W.B

noncomputable def pullbackFramingAlongCollar {n r : ℕ}
    (W : CollaredOrientedFilling n)
    (_framing : StableTangentFraming W.model W.M r) :
    StableTangentFraming ((𝓡∂ 1).prod (SmoothModel (n - 1)))
      (HalfOpenCollarDomain W) r := by
  sorry

noncomputable def collarProductFraming {n r : ℕ}
    (W : CollaredOrientedFilling n)
    (_boundaryFraming : StableTangentFraming (SmoothModel (n - 1)) W.B r) :
    StableTangentFraming ((𝓡∂ 1).prod (SmoothModel (n - 1)))
      (HalfOpenCollarDomain W) r := by
  sorry

structure StableTangentFraming.IsProductOnCollar {n r : ℕ}
    (W : CollaredOrientedFilling n)
    (framing : StableTangentFraming W.model W.M r) where
  boundaryFraming : StableTangentFraming (SmoothModel (n - 1)) W.B r
  agrees : (pullbackFramingAlongCollar W framing).trivialization =
    (collarProductFraming W boundaryFraming).trivialization

structure StableFramedFillingCycle (n : ℕ) where
  filling : CollaredOrientedFilling n
  boundaryMarking : filling.B ≃ₕ Sphere (n - 1)
  framingRank : ℕ
  stableFraming : StableTangentFraming filling.model filling.M framingRank
  framingOrientation : Internal.OrientationSupplierMirror.Orientation.Agrees
    filling.model filling.orientation
    (StableTangentFraming.orientation (ι := Fin n) stableFraming)
  productOnCollar : stableFraming.IsProductOnCollar filling

structure StableFramedFillingCycle.StabilizesRelBoundary
    {n : ℕ} (W : StableFramedFillingCycle n)
    (honest : TangentFraming W.filling.model W.filling.M) where
  stabilized : StableTangentFraming W.filling.model W.filling.M W.framingRank
  stabilized_eq : stabilized.trivialization =
    (honest.stabilize W.framingRank).trivialization
  fixedOnCollar :
    (pullbackFramingAlongCollar W.filling W.stableFraming).trivialization =
      (pullbackFramingAlongCollar W.filling stabilized).trivialization

theorem stableFraming_destabilizes (n : ℕ) (hn : 6 ≤ n)
    (W : StableFramedFillingCycle n) :
    ∃ honest : TangentFraming W.filling.model W.filling.M,
      Nonempty (W.StabilizesRelBoundary honest) := by
  sorry

/-! ## Embedded defects and canonical open complements -/

noncomputable def DefectCollarDomain
    {n : ℕ} {H M : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ (ModelSpace n) H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    (D : Internal.GeometricTopologySupplierMirror.SmoothEmbeddedClosedDisk (M := M) n I) :
    TopologicalSpace.Opens (unitInterval × D.disk.B) :=
  ⟨{p | p ∈ Internal.GeometricTopologySupplierMirror.CollarSource D.disk.B ∧ p.1 ≠ 0},
    by sorry⟩

noncomputable def pullbackFrameToDefectCollar
    {n r : ℕ} {H M : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ (ModelSpace n) H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    (D : Internal.GeometricTopologySupplierMirror.SmoothEmbeddedClosedDisk (M := M) n I)
    (_framing : StableTangentFraming I D.exterior r) :
    StableTangentFraming ((𝓡∂ 1).prod (SmoothModel (n - 1)))
      (DefectCollarDomain D) r := by
  sorry

noncomputable def defectCollarProductFraming
    {n r : ℕ} {H M : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ (ModelSpace n) H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    (D : Internal.GeometricTopologySupplierMirror.SmoothEmbeddedClosedDisk (M := M) n I)
    (_boundaryFraming : StableTangentFraming (SmoothModel (n - 1)) D.disk.B r) :
    StableTangentFraming ((𝓡∂ 1).prod (SmoothModel (n - 1)))
      (DefectCollarDomain D) r := by
  sorry

structure StableTangentFraming.IsProductNearDefect
    {n r : ℕ} {H M : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ (ModelSpace n) H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    (D : Internal.GeometricTopologySupplierMirror.SmoothEmbeddedClosedDisk (M := M) n I)
    (framing : StableTangentFraming I D.exterior r) where
  boundaryFraming : StableTangentFraming (SmoothModel (n - 1)) D.disk.B r
  agrees : (pullbackFrameToDefectCollar D framing).trivialization =
    (defectCollarProductFraming D boundaryFraming).trivialization

structure AlmostFramedCycle (n : ℕ) extends SmoothClosedOrientedCycle n where
  defect : Internal.GeometricTopologySupplierMirror.SmoothEmbeddedClosedDisk
    (M := code.Realization) n (SmoothModel n)
  frameRank : ℕ
  frameOffDefect : StableTangentFraming (SmoothModel n) defect.exterior frameRank
  productNearDefect : frameOffDefect.IsProductNearDefect defect

/-! ## Geometric bordism quotients and the Kervaire--Milnor segment -/

/-- The two closed boundary components of a collared cobordism are supplied by actual smooth
embeddings whose disjoint ranges cover its intrinsic boundary carrier. -/
structure BoundaryIdentification {n : ℕ} (X Y : SmoothClosedOrientedCycle n)
    (W : CollaredOrientedFilling (n + 1)) where
  incoming : C(X.code.Realization, W.B)
  outgoing : C(Y.code.Realization, W.B)
  incomingSmooth : IsSmoothEmbedding (SmoothModel n) (SmoothModel ((n + 1) - 1)) ∞ incoming
  outgoingSmooth : IsSmoothEmbedding (SmoothModel n) (SmoothModel ((n + 1) - 1)) ∞ outgoing
  disjointRanges : Disjoint (Set.range incoming) (Set.range outgoing)
  rangesCover : Set.range incoming ∪ Set.range outgoing = Set.univ

/-- Compose the incoming boundary identification with the intrinsic boundary inclusion. -/
noncomputable def BoundaryIdentification.incomingInclusion
    {n : ℕ} {X Y : SmoothClosedOrientedCycle n} {W : CollaredOrientedFilling (n + 1)}
    (D : BoundaryIdentification X Y W) : C(X.code.Realization, W.M) := by
  sorry

/-- Compose the outgoing boundary identification with the intrinsic boundary inclusion. -/
noncomputable def BoundaryIdentification.outgoingInclusion
    {n : ℕ} {X Y : SmoothClosedOrientedCycle n} {W : CollaredOrientedFilling (n + 1)}
    (D : BoundaryIdentification X Y W) : C(Y.code.Realization, W.M) := by
  sorry

/-- A geometric h-cobordism witness. Both displayed boundary inclusions, rather than unrelated
maps, are the forward maps of homotopy equivalences. -/
structure GeometricHCobordismWitness {n : ℕ} (X Y : HomotopySphereCycle n) where
  cobordism : CollaredOrientedFilling (n + 1)
  boundary : BoundaryIdentification X.toSmoothClosedOrientedCycle
    Y.toSmoothClosedOrientedCycle cobordism
  incomingEquiv : X.code.Realization ≃ₕ cobordism.M
  outgoingEquiv : Y.code.Realization ≃ₕ cobordism.M
  incomingEquiv_toFun : incomingEquiv.toFun = boundary.incomingInclusion
  outgoingEquiv_toFun : outgoingEquiv.toFun = boundary.outgoingInclusion

/-- Oriented geometric h-cobordism is witnessed by the preceding collared object. -/
def GeometricHCobordant {n : ℕ} (X Y : HomotopySphereCycle n) : Prop :=
  Nonempty (GeometricHCobordismWitness X Y)

theorem geometricHCobordant_equivalence (n : ℕ) :
    Equivalence (@GeometricHCobordant n) := by
  sorry

/-- The setoid used for the geometric quotient of homotopy spheres. -/
def homotopySphereSetoid (n : ℕ) : Setoid (HomotopySphereCycle n) :=
  ⟨GeometricHCobordant, geometricHCobordant_equivalence n⟩

/-- The underlying quotient carrier of oriented homotopy spheres modulo geometric h-cobordism. -/
def HomotopySphereClass (n : ℕ) :=
  Quotient (homotopySphereSetoid n)

/-- Connected sum, orientation reversal, and the explicit inverse h-cobordism descend to the
geometric quotient. -/
noncomputable instance homotopySphereClassAddCommGroup (n : ℕ) :
    AddCommGroup (HomotopySphereClass n) := by
  sorry

/-- The geometric Kervaire--Milnor group `Theta_n`; its carrier is definitionally the quotient
above, not an arbitrary additive group. -/
abbrev Theta (n : ℕ) := HomotopySphereClass n

/-- A stably framed cobordism between closed cycles, including its collared-boundary geometry. -/
structure StableFramedCobordismData {n : ℕ} (X Y : SmoothClosedOrientedCycle n) where
  cobordism : CollaredOrientedFilling (n + 1)
  boundary : BoundaryIdentification X Y cobordism
  rank : ℕ
  framing : StableTangentFraming cobordism.model cobordism.M rank
  productOnCollar : framing.IsProductOnCollar cobordism

/-- Pull the collared boundary framing back to the incoming closed cycle. -/
noncomputable def StableFramedCobordismData.incomingFraming
    {n : ℕ} {X Y : SmoothClosedOrientedCycle n} (W : StableFramedCobordismData X Y) :
    StableTangentFraming (SmoothModel n) X.code.Realization W.rank := by
  sorry

/-- Pull the collared boundary framing back to the outgoing closed cycle. -/
noncomputable def StableFramedCobordismData.outgoingFraming
    {n : ℕ} {X Y : SmoothClosedOrientedCycle n} (W : StableFramedCobordismData X Y) :
    StableTangentFraming (SmoothModel n) Y.code.Realization W.rank := by
  sorry

/-- Stabilize a cycle's actual tangent-bundle trivialization to a displayed common rank. -/
noncomputable def FramedCycle.stabilizeTo {n : ℕ} (X : FramedCycle n) (r : ℕ)
    (_hr : X.stabilizationRank ≤ r) :
    StableTangentFraming (SmoothModel n) X.code.Realization r := by
  sorry

/-- A framed bordism witness whose boundary framing is the stabilization of each input framing. -/
structure FramedBordismWitness {n : ℕ} (X Y : FramedCycle n) where
  data : StableFramedCobordismData X.toSmoothClosedOrientedCycle
    Y.toSmoothClosedOrientedCycle
  incomingRank : X.stabilizationRank ≤ data.rank
  outgoingRank : Y.stabilizationRank ≤ data.rank
  incomingAgrees : data.incomingFraming.trivialization =
    (X.stabilizeTo data.rank incomingRank).trivialization
  outgoingAgrees : data.outgoingFraming.trivialization =
    (Y.stabilizeTo data.rank outgoingRank).trivialization

def FramedBordant {n : ℕ} (X Y : FramedCycle n) : Prop :=
  Nonempty (FramedBordismWitness X Y)

theorem framedBordant_equivalence (n : ℕ) : Equivalence (@FramedBordant n) := by
  sorry

def framedBordismSetoid (n : ℕ) : Setoid (FramedCycle n) :=
  ⟨FramedBordant, framedBordant_equivalence n⟩

def FramedBordismClass (n : ℕ) := Quotient (framedBordismSetoid n)

noncomputable instance framedBordismClassAddCommGroup (n : ℕ) :
    AddCommGroup (FramedBordismClass n) := by
  sorry

abbrev FramedBordism (n : ℕ) := FramedBordismClass n

/-- An almost-framed bordism has a tracked collared defect and a genuine stable framing on its
open complement. -/
structure AlmostFramedBordismWitness {n : ℕ} (X Y : AlmostFramedCycle n) where
  cobordism : CollaredOrientedFilling (n + 1)
  boundary : BoundaryIdentification X.toSmoothClosedOrientedCycle
    Y.toSmoothClosedOrientedCycle cobordism
  defectTrack : Internal.GeometricTopologySupplierMirror.SmoothEmbeddedClosedDisk
    (M := cobordism.M) (n + 1) cobordism.model
  rank : ℕ
  frameOffDefect : StableTangentFraming cobordism.model defectTrack.exterior rank
  productNearDefect : frameOffDefect.IsProductNearDefect defectTrack

def AlmostFramedBordant {n : ℕ} (X Y : AlmostFramedCycle n) : Prop :=
  Nonempty (AlmostFramedBordismWitness X Y)

theorem almostFramedBordant_equivalence (n : ℕ) :
    Equivalence (@AlmostFramedBordant n) := by
  sorry

def almostFramedBordismSetoid (n : ℕ) : Setoid (AlmostFramedCycle n) :=
  ⟨AlmostFramedBordant, almostFramedBordant_equivalence n⟩

def AlmostFramedBordismClass (n : ℕ) := Quotient (almostFramedBordismSetoid n)

noncomputable instance almostFramedBordismClassAddCommGroup (n : ℕ) :
    AddCommGroup (AlmostFramedBordismClass n) := by
  sorry

abbrev AlmostFramedBordism (n : ℕ) := AlmostFramedBordismClass n

/-- A cobordism with corners between two stably framed fillings, represented here by its ambient
collared trace, the two smooth boundary embeddings, and a product-compatible stable framing. -/
structure StableFillingBordismWitness {n : ℕ}
    (X Y : StableFramedFillingCycle n) where
  trace : CollaredOrientedFilling (n + 1)
  incoming : C(X.filling.M, trace.B)
  outgoing : C(Y.filling.M, trace.B)
  incomingSmooth : IsSmoothEmbedding X.filling.model (SmoothModel ((n + 1) - 1)) ∞ incoming
  outgoingSmooth : IsSmoothEmbedding Y.filling.model (SmoothModel ((n + 1) - 1)) ∞ outgoing
  disjointRanges : Disjoint (Set.range incoming) (Set.range outgoing)
  rangesCover : Set.range incoming ∪ Set.range outgoing = Set.univ
  rank : ℕ
  framing : StableTangentFraming trace.model trace.M rank
  productOnCollar : framing.IsProductOnCollar trace

def StableFillingBordant {n : ℕ}
    (X Y : StableFramedFillingCycle n) : Prop :=
  Nonempty (StableFillingBordismWitness X Y)

theorem stableFillingBordant_equivalence (n : ℕ) :
    Equivalence (@StableFillingBordant n) := by
  sorry

def stableFillingBordismSetoid (n : ℕ) : Setoid (StableFramedFillingCycle n) :=
  ⟨StableFillingBordant, stableFillingBordant_equivalence n⟩

def StableFillingBordismClass (n : ℕ) := Quotient (stableFillingBordismSetoid n)

noncomputable instance stableFillingBordismClassAddCommGroup (n : ℕ) :
    AddCommGroup (StableFillingBordismClass n) := by
  sorry

abbrev StableFillingBordism (n : ℕ) := StableFillingBordismClass n

/-- The Kervaire--Milnor map `i : Theta_n -> A_n`, induced by the canonical punctured stable
framing of a homotopy sphere. -/
noncomputable def thetaToAlmostFramed (n : ℕ) :
    Theta n →+ AlmostFramedBordism n := by
  sorry

/-- The Kervaire--Milnor map `p : A_n -> P_n`, induced by deleting the defect-disc interior. -/
noncomputable def almostFramedToStableFilling (n : ℕ) :
    AlmostFramedBordism n →+ StableFillingBordism n := by
  sorry

/-- The Kervaire--Milnor boundary map `b : P_(n+1) -> Theta_n`. -/
noncomputable def stableFillingBoundaryToTheta (n : ℕ) :
    StableFillingBordism (n + 1) →+ Theta n := by
  sorry

/-- One displayed geometric exact segment of the Kervaire--Milnor sequence. -/
theorem kervaireMilnor_exact_at_theta (n : ℕ) (_hn : 5 ≤ n) :
    Function.Exact (stableFillingBoundaryToTheta n) (thetaToAlmostFramed n) := by
  sorry

theorem kervaireMilnor_exact_at_almostFramed (n : ℕ) (_hn : 5 ≤ n) :
    Function.Exact (thetaToAlmostFramed n) (almostFramedToStableFilling n) := by
  sorry

/-! ## Pointed Pontryagin--Thom data -/

structure SmoothEuclideanEmbedding
    (n k : ℕ) (M : Type*) [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M] where
  map : C(M, ModelSpace (n + k))
  smoothEmbedding : IsSmoothEmbedding (SmoothModel n) (SmoothModel (n + k)) ∞ map

abbrev NormalFiber
    {n k : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (e : SmoothEuclideanEmbedding n k M) (x : M) :=
  TangentSpace (SmoothModel (n + k)) (e.map x) ⧸
    LinearMap.range (mfderiv (SmoothModel n) (SmoothModel (n + k)) e.map x).toLinearMap

noncomputable def euclideanNormalPrebundle
    {n k : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (e : SmoothEuclideanEmbedding n k M) :
    VectorPrebundle ℝ (ModelSpace k) (NormalFiber e) := by
  sorry

noncomputable instance normalTotalSpaceTopology
    {n k : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (e : SmoothEuclideanEmbedding n k M) :
    TopologicalSpace (Bundle.TotalSpace (ModelSpace k) (NormalFiber e)) :=
  (euclideanNormalPrebundle e).totalSpaceTopology

noncomputable instance normalFiberBundle
    {n k : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (e : SmoothEuclideanEmbedding n k M) :
    FiberBundle (ModelSpace k) (NormalFiber e) :=
  (euclideanNormalPrebundle e).toFiberBundle

noncomputable instance normalVectorBundle
    {n k : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (e : SmoothEuclideanEmbedding n k M) :
    VectorBundle ℝ (ModelSpace k) (NormalFiber e) :=
  (euclideanNormalPrebundle e).toVectorBundle

noncomputable instance normalContMDiffVectorBundle
    {n k : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (e : SmoothEuclideanEmbedding n k M) :
    ContMDiffVectorBundle ∞ (ModelSpace k) (NormalFiber e) (SmoothModel n) := by
  sorry

structure StableNormalFraming
    (n k : ℕ) (M : Type*) [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M] where
  embedding : SmoothEuclideanEmbedding n k M
  trivialization : Bundle.Trivialization (ModelSpace k)
    (Bundle.TotalSpace.proj :
      Bundle.TotalSpace (ModelSpace k) (NormalFiber embedding) → M)
  global : trivialization.baseSet = Set.univ
  linear : trivialization.IsLinear ℝ
  memAtlas : MemTrivializationAtlas trivialization

structure SmoothTubularNeighborhood
    {n k : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (e : SmoothEuclideanEmbedding n k M) where
  discDomain : TopologicalSpace.Opens
    (Bundle.TotalSpace (ModelSpace k) (NormalFiber e))
  zero_mem : ∀ x,
    (⟨x, 0⟩ : Bundle.TotalSpace (ModelSpace k) (NormalFiber e)) ∈ discDomain
  neighbourhood : TopologicalSpace.Opens (ModelSpace (n + k))
  tubular : C(discDomain, neighbourhood)
  smoothEmbedding : IsSmoothEmbedding
    ((SmoothModel n).prod (SmoothModel k)) (SmoothModel (n + k)) ∞ tubular
  surjective : Function.Surjective tubular
  zeroSection : ∀ x,
    (tubular ⟨⟨x, 0⟩, zero_mem x⟩ : ModelSpace (n + k)) = e.map x

noncomputable def tangentFramingOfNormal
    {n k : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (_normal : StableNormalFraming n k M) :
    StableTangentFraming (SmoothModel n) M k := by
  sorry

abbrev PointedConvenientSpace :=
  CategoryTheory.Under (CompactlyGenerated.of PUnit)

abbrev PointedConvenientMap (X Y : PointedConvenientSpace) := X ⟶ Y

abbrev PointedConvenientIso (X Y : PointedConvenientSpace) := X ≅ Y

noncomputable def pointedSphereCG (n : ℕ) : PointedConvenientSpace := by
  sorry

noncomputable def normalThomCG
    {n k : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (_e : SmoothEuclideanEmbedding n k M) : PointedConvenientSpace := by
  sorry

noncomputable def suspendedBaseCG
    (k : ℕ) {M : Type*} [TopologicalSpace M] : PointedConvenientSpace := by
  sorry

noncomputable def tubularCollapse
    {n k : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    {e : SmoothEuclideanEmbedding n k M} (_tube : SmoothTubularNeighborhood e) :
    PointedConvenientMap (pointedSphereCG (n + k)) (normalThomCG e) := by
  sorry

noncomputable def suspendedAugmentation
    (k : ℕ) {M : Type*} [TopologicalSpace M] :
    PointedConvenientMap (suspendedBaseCG k (M := M)) (pointedSphereCG k) := by
  sorry

structure PontryaginThomFactorization (n : ℕ) where
  cycle : FramedCycle n
  normalFraming :
    StableNormalFraming n cycle.stabilizationRank cycle.code.Realization
  tubularNeighbourhood : SmoothTubularNeighborhood normalFraming.embedding
  thomEquivSuspendedBase :
    PointedConvenientIso (normalThomCG normalFraming.embedding)
      (suspendedBaseCG cycle.stabilizationRank (M := cycle.code.Realization))
  tangentNormalCompatibility :
    (tangentFramingOfNormal normalFraming).trivialization = cycle.framing.trivialization

noncomputable def PontryaginThomFactorization.collapse
    {n : ℕ} (P : PontryaginThomFactorization n) :
    PointedConvenientMap (pointedSphereCG (n + P.cycle.stabilizationRank))
      (normalThomCG P.normalFraming.embedding) :=
  tubularCollapse P.tubularNeighbourhood

noncomputable def PontryaginThomFactorization.augmentation
    {n : ℕ} (P : PontryaginThomFactorization n) :
    PointedConvenientMap (normalThomCG P.normalFraming.embedding)
      (pointedSphereCG P.cycle.stabilizationRank) :=
  P.thomEquivSuspendedBase.hom ≫ suspendedAugmentation P.cycle.stabilizationRank

/-! ## Genuine Wall forms and formations -/

abbrev WallLattice (rank : ℕ) := Fin rank → ℤ

abbrev WallQuadraticValue (q : ℕ) := ZMod (if Even q then 0 else 2)

structure EvenWallForm (q : ℕ) where
  rank : ℕ
  pairing : LinearMap.BilinForm ℤ (WallLattice rank)
  quadratic : WallLattice rank → WallQuadraticValue q
  pairing_symmetry : ∀ x y,
    pairing x y = (-1 : ℤ) ^ q * pairing y x
  quadratic_zero : quadratic 0 = 0
  quadratic_add : ∀ x y,
    quadratic (x + y) =
      quadratic x + quadratic y + (pairing x y : WallQuadraticValue q)
  quadratic_smul : ∀ (a : ℤ) x,
    quadratic (a • x) = (a : WallQuadraticValue q) ^ 2 * quadratic x
  diagonal : ∀ x, (pairing x x : WallQuadraticValue q) =
    quadratic x + ((-1 : ℤ) ^ q : WallQuadraticValue q) * quadratic x
  unimodular : Function.Bijective pairing

structure EvenWallForm.Lagrangian {q : ℕ} (form : EvenWallForm q) where
  carrier : Submodule ℤ (WallLattice form.rank)
  isotropic : ∀ x ∈ carrier, ∀ y ∈ carrier, form.pairing x y = 0
  quadratic_zero : ∀ x ∈ carrier, form.quadratic x = 0
  self_orthogonal : form.pairing.orthogonal carrier = carrier
  directSummand : ∃ complement, IsCompl carrier complement

structure OddWallFormation (q : ℕ) where
  form : EvenWallForm q
  firstLagrangian : form.Lagrangian
  secondLagrangian : form.Lagrangian

inductive WallSurgeryDatum : ℕ → Type
  | even (q : ℕ) : EvenWallForm q → WallSurgeryDatum (2 * q)
  | odd (q : ℕ) : OddWallFormation q → WallSurgeryDatum (2 * q + 1)

structure EvenWallForm.Isometry {q : ℕ} (F G : EvenWallForm q) where
  toLinearEquiv : WallLattice F.rank ≃ₗ[ℤ] WallLattice G.rank
  pairing_eq : ∀ x y, G.pairing (toLinearEquiv x) (toLinearEquiv y) = F.pairing x y
  quadratic_eq : ∀ x, G.quadratic (toLinearEquiv x) = F.quadratic x

structure OddWallFormation.Isometry {q : ℕ} (F G : OddWallFormation q) where
  formIsometry : F.form.Isometry G.form
  first_eq : Submodule.map formIsometry.toLinearEquiv.toLinearMap
    F.firstLagrangian.carrier = G.firstLagrangian.carrier
  second_eq : Submodule.map formIsometry.toLinearEquiv.toLinearMap
    F.secondLagrangian.carrier = G.secondLagrangian.carrier

noncomputable def EvenWallForm.orthogonalSum
    {q : ℕ} (F G : EvenWallForm q) : EvenWallForm q := by
  sorry

noncomputable def hyperbolicWallForm (q : ℕ) : EvenWallForm q := by
  sorry

noncomputable def OddWallFormation.hyperbolicSum
    {q : ℕ} (F G : OddWallFormation q) : OddWallFormation q := by
  sorry

noncomputable def hyperbolicWallFormation (q : ℕ) : OddWallFormation q := by
  sorry

structure OddWallFormation.ElementaryModification
    {q : ℕ} (F G : OddWallFormation q) where
  formIsometry : F.form.Isometry G.form
  first_eq : Submodule.map formIsometry.toLinearEquiv.toLinearMap
    F.firstLagrangian.carrier = G.firstLagrangian.carrier
  vector : WallLattice F.form.rank
  vector_mem : vector ∈ F.firstLagrangian.carrier
  coefficient : ℤ
  transvection : WallLattice F.form.rank →ₗ[ℤ] WallLattice F.form.rank
  transvection_apply : ∀ x, transvection x =
    x + (coefficient * F.form.pairing x vector) • vector
  transvection_bijective : Function.Bijective transvection
  second_eq : Submodule.map transvection F.secondLagrangian.carrier =
    Submodule.comap formIsometry.toLinearEquiv.toLinearMap G.secondLagrangian.carrier

inductive WallSurgeryDatum.StablyEquivalent :
    {n : ℕ} → WallSurgeryDatum n → WallSurgeryDatum n → Prop
  | refl {n} (X : WallSurgeryDatum n) : StablyEquivalent X X
  | symm {n} {X Y : WallSurgeryDatum n} :
      StablyEquivalent X Y → StablyEquivalent Y X
  | trans {n} {X Y Z : WallSurgeryDatum n} :
      StablyEquivalent X Y → StablyEquivalent Y Z → StablyEquivalent X Z
  | evenIsometry {q} {F G : EvenWallForm q} :
      F.Isometry G → StablyEquivalent (.even q F) (.even q G)
  | oddIsometry {q} {F G : OddWallFormation q} :
      F.Isometry G → StablyEquivalent (.odd q F) (.odd q G)
  | evenHyperbolic {q} (F : EvenWallForm q) :
      StablyEquivalent (.even q F)
        (.even q (F.orthogonalSum (hyperbolicWallForm q)))
  | oddHyperbolic {q} (F : OddWallFormation q) :
      StablyEquivalent (.odd q F)
        (.odd q (F.hyperbolicSum (hyperbolicWallFormation q)))
  | oddElementary {q} {F G : OddWallFormation q} :
      F.ElementaryModification G → StablyEquivalent (.odd q F) (.odd q G)

def wallStableEquivalence (n : ℕ) : Setoid (WallSurgeryDatum n) where
  r := WallSurgeryDatum.StablyEquivalent
  iseqv :=
    ⟨fun X ↦ WallSurgeryDatum.StablyEquivalent.refl X,
      fun {_ _} h ↦ WallSurgeryDatum.StablyEquivalent.symm h,
      fun {_ _ _} h₀ h₁ ↦ WallSurgeryDatum.StablyEquivalent.trans h₀ h₁⟩

def WallSurgeryClass (n : ℕ) :=
  Quotient (wallStableEquivalence n)

/-! ## The geometric sixth-sphere group -/

/-- The low-stem, Kervaire-invariant, Wall, and exactness chain makes the geometric quotient
`Theta_6` trivial. -/
theorem thetaSix_subsingleton : Subsingleton (Theta 6) := by
  sorry

/-- Additive form of `Theta_6 = 0`, with `Theta` still the literal geometric h-cobordism
quotient. -/
noncomputable def thetaSixIsoZero : Theta 6 ≃+ ZMod 1 := by
  sorry

/-! ## Oriented six-dimensional recognition -/

private abbrev SixSphere := Sphere 6

private noncomputable abbrev SixModel := SmoothModel 6

theorem smoothPoincareSix_oriented
    (M : Type u) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [CompactSpace M]
    [ChartedSpace (ModelSpace 6) M] [IsManifold SixModel ∞ M]
    (oM : Internal.OrientationSupplierMirror.Orientation SixModel M (Fin 6))
    (oS : Internal.OrientationSupplierMirror.Orientation SixModel SixSphere (Fin 6))
    (_h : M ≃ₕ SixSphere) :
    Nonempty (OrientationPreservingDiffeomorph M SixSphere oM oS) := by
  sorry

end TauCetiRoadmap.HomotopySpheres
