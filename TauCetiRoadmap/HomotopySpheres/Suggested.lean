import Mathlib
import TauCeti.Geometry.Manifold.Orientation
import TauCetiRoadmap.AlgebraicTopology.Suggested

/-!
# High-dimensional differential topology and homotopy spheres: target signatures

This file is not the roadmap and is not exhaustive. The definitive document is README.md.
The declarations below pin representative interfaces whose types rule out the vacuous
orientation, framing, boundary, Pontryagin--Thom, and Wall interfaces.

`Internal.OrientationSupplierMirror` copies DifferentialGeometry Layer 2's source-indexed
`OrientationLift` and its diagonal-flip quotient. When the chosen-orientation supplier is imported,
replace this copied carrier and derive agreement and preservation from `orientationAt` and
`IsOrientationPreservingAt`, checking reversal, derivative and boundary-sign comparisons.
Tau Ceti's existing orientation-preserving groupoid is imported directly.

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

/-! Literal integration gate for the algebraic-topology supplier. -/

#check TauCetiRoadmap.AlgebraicTopology.relativeHurewicz
#check TauCetiRoadmap.AlgebraicTopology.homologicalWhitehead
#check TauCetiRoadmap.AlgebraicTopology.poincareDualityMap_isIso
#check TauCetiRoadmap.AlgebraicTopology.compactManifoldFiniteCWType

/-! ## Convenient spaces and literal colimits -/

abbrev ConvenientSpace := CompactlyGenerated.{u, u}

#check CompactlyGenerated.compactlyGeneratedToTop
#check CompactlyGenerated.fullyFaithfulCompactlyGeneratedToTop

/-- Compact generation is the right adjoint to Mathlib's existing fully faithful inclusion. -/
noncomputable def compactGenerationCoreflector : TopCat.{u} ⥤ ConvenientSpace := by
  sorry

/-- The inclusion is left adjoint to compact generation; the continuous comparison is the counit
`i(kX) -> X`. -/
noncomputable def compactGenerationCoreflection :
    CompactlyGenerated.compactlyGeneratedToTop ⊣ compactGenerationCoreflector := by
  sorry

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

/-- DifferentialGeometry Layer 2.1's source-indexed orientation lift. -/
structure OrientationLift (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
    [FiniteDimensional ℝ E] (ι : Type*) [Fintype ι] where
  modelOrientation : _root_.Orientation ℝ E ι
  card_eq : Fintype.card ι = Module.finrank ℝ E
  sign : (x : M) → (chartAt H x).source → ℤˣ
  continuous_sign : ∀ x, Continuous (sign x)
  sign_mul_sign : ∀ x x' y (hy : y ∈ (chartAt H x).source)
      (hy' : y ∈ (chartAt H x').source),
    ((sign x ⟨y, hy⟩ * sign x' ⟨y, hy'⟩ : ℤˣ) : ℤ) =
      (SignType.sign (LinearMap.det
        (fderivWithin ℝ (extChartAt I x' ∘ (extChartAt I x).symm) (Set.range I)
          (extChartAt I x y) : E →ₗ[ℝ] E)) : ℤ)

/-- The supplier's diagonal flip, with no off-source sign data. -/
def OrientationLift.setoid
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι] :
    Setoid (OrientationLift I M ι) where
  r l l' := l' = l ∨
    (l'.modelOrientation = -l.modelOrientation ∧ l'.sign = fun x y ↦ -l.sign x y)
  iseqv := by sorry

abbrev Orientation (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
    [FiniteDimensional ℝ E] (ι : Type*) [Fintype ι] :=
  Quotient (OrientationLift.setoid I (M := M) (ι := ι))

namespace Orientation

noncomputable def orientationAt
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)]
    (o : Orientation I M ι) (x : M) : _root_.Orientation ℝ E ι := by
  sorry

theorem orientationAt_mk
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)] (l : OrientationLift I M ι) (x : M) :
    orientationAt I (Quotient.mk _ l) x =
      if l.sign x ⟨x, mem_chart_source H x⟩ = 1 then l.modelOrientation
      else -l.modelOrientation := by
  sorry

def Agrees
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)]
    (o₀ o₁ : Orientation I M ι) : Prop :=
  ∀ x, orientationAt I o₀ x = orientationAt I o₁ x

noncomputable def neg
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)]
    (o : Orientation I M ι) : Orientation I M ι :=
  Quotient.map (fun l ↦ { l with modelOrientation := -l.modelOrientation }) (by sorry) o

noncomputable instance
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)] :
    InvolutiveNeg (Orientation I M ι) where
  neg := neg I
  neg_neg := by sorry

theorem orientationAt_neg
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    [FiniteDimensional ℝ E] {ι : Type*} [Fintype ι]
    [Fact (Fintype.card ι = Module.finrank ℝ E)] (o : Orientation I M ι) (x : M) :
    orientationAt I (-o) x = -orientationAt I o x := by
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
    (U : TopologicalSpace.Opens M)
    (collar : CollarOpen B ≃ₘ⟮((𝓡∂ 1).prod (SmoothModel (n - 1))), I⟯ U)
    (p : CollarOpen B) :
    (ModelSpace 1 × ModelSpace (n - 1)) ≃ₗ[ℝ] ModelSpace n := by
  sorry

noncomputable def outwardNormalBoundaryOrientation {n : ℕ}
    (_o : _root_.Orientation ℝ (ModelSpace (n - 1)) (Fin (n - 1))) :
    _root_.Orientation ℝ (ModelSpace 1 × ModelSpace (n - 1)) (Fin n) := by
  sorry

/-- Outward-normal-first boundary orientation, using the actual collar derivative. -/
def CollarInducesBoundaryOrientation
    {n : ℕ} {H M B : Type*} [TopologicalSpace H]
    (I : ModelWithCorners ℝ (ModelSpace n) H) [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I ∞ M] [TopologicalSpace B]
    [ChartedSpace (ModelSpace (n - 1)) B]
    [IsManifold (SmoothModel (n - 1)) ∞ B]
    (ambientOrientation : Internal.OrientationSupplierMirror.Orientation I M (Fin n))
    (boundaryOrientation : Internal.OrientationSupplierMirror.Orientation
      (SmoothModel (n - 1)) B (Fin (n - 1)))
    (U : TopologicalSpace.Opens M)
    (collar : CollarOpen B ≃ₘ⟮((𝓡∂ 1).prod (SmoothModel (n - 1))), I⟯ U) : Prop :=
  ∀ b, _root_.Orientation.map (Fin n)
      (collarDerivativeEquiv I U collar ⟨(0, b), zero_mem_collarSource b⟩)
      (outwardNormalBoundaryOrientation
        (Internal.OrientationSupplierMirror.Orientation.orientationAt
          (SmoothModel (n - 1)) boundaryOrientation b)) =
    Internal.OrientationSupplierMirror.Orientation.orientationAt
      I ambientOrientation (collar ⟨(0, b), zero_mem_collarSource b⟩)

/-- A general compact collared oriented manifold, allowing empty and disconnected carriers.
Connectedness and nonempty boundary belong to particular fillings, not to general bordisms.
A later product-framing witness may shrink this supplied collar by returning a width in `(0,1)`. -/
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
  collarNeighbourhood : TopologicalSpace.Opens M
  boundary_subset_collarNeighbourhood : model.boundary M ⊆ collarNeighbourhood
  collar :
    CollarOpen B ≃ₘ⟮((𝓡∂ 1).prod (SmoothModel (n - 1))), model⟯ collarNeighbourhood
  collar_zero : ∀ b, (collar ⟨(0, b), zero_mem_collarSource b⟩ : M) = boundaryIdentification b
  collar_meets_boundary_iff : ∀ p : CollarOpen B,
    (collar p : M) ∈ model.boundary M ↔ p.1.1 = 0
  ambient_induces_boundary :
    CollarInducesBoundaryOrientation model orientation boundaryOrientation
      collarNeighbourhood collar

attribute [instance] CollaredOrientedManifold.modelTopology
  CollaredOrientedManifold.topology CollaredOrientedManifold.charted
  CollaredOrientedManifold.manifold CollaredOrientedManifold.t2
  CollaredOrientedManifold.secondCountable CollaredOrientedManifold.compact
  CollaredOrientedManifold.boundaryTopology
  CollaredOrientedManifold.boundaryCharted CollaredOrientedManifold.boundaryManifold
  CollaredOrientedManifold.intrinsicBoundaryCharted
  CollaredOrientedManifold.intrinsicBoundaryManifold

/-- A smoothly embedded standard closed disc with an exterior half-open collar in the closed
complement of its interior.  The one-sided exterior collar is not claimed to have ambient-open
image in `M`. -/
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
  closedExterior : Set M
  closedExterior_eq : closedExterior =
    (Set.range embedding \ embedding '' {x | x ∈ disk.model.boundary disk.M})ᶜ
  [closedExteriorCharted : ChartedSpace (EuclideanHalfSpace n) closedExterior]
  [closedExteriorManifold : IsManifold (𝓡∂ n) ∞ closedExterior]
  [exteriorBoundaryCharted : ChartedSpace (ModelSpace (n - 1))
    {x : closedExterior // x ∈ (𝓡∂ n).boundary closedExterior}]
  [exteriorBoundaryManifold : IsManifold (SmoothModel (n - 1)) ∞
    {x : closedExterior // x ∈ (𝓡∂ n).boundary closedExterior}]
  exteriorBoundary : disk.B ≃ₘ⟮SmoothModel (n - 1), SmoothModel (n - 1)⟯
    {x : closedExterior // x ∈ (𝓡∂ n).boundary closedExterior}
  exteriorBoundary_eq : ∀ b, ((exteriorBoundary b : closedExterior) : M) =
    embedding (disk.boundaryIdentification b)
  exteriorNeighbourhood : Set closedExterior
  exteriorNeighbourhood_open : IsOpen exteriorNeighbourhood
  exteriorCollar : PartialDiffeomorph
    ((𝓡∂ 1).prod (SmoothModel (n - 1))) (𝓡∂ n)
      (unitInterval × disk.B) closedExterior ∞
  exteriorCollar_source : exteriorCollar.source = CollarSource disk.B
  exteriorCollar_target : exteriorCollar.target = exteriorNeighbourhood
  exterior_zero : ∀ b,
    ((exteriorCollar (0, b) : closedExterior) : M) =
      embedding (disk.boundaryIdentification b)
  exterior_positive_disjoint : ∀ t b, (t, b) ∈ CollarSource disk.B → t ≠ 0 →
    ((exteriorCollar (t, b) : closedExterior) : M) ∉ Set.range embedding

attribute [instance] SmoothEmbeddedClosedDisk.closedExteriorCharted
  SmoothEmbeddedClosedDisk.closedExteriorManifold

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

/-- Regression object for the supplier contract: a standard closed hemisphere is an embedded
disc whose one-sided collar is open in the closed exterior, not in the ambient sphere. -/
noncomputable def standardClosedDiskInSphere (n : ℕ) [NeZero n] :
    Internal.GeometricTopologySupplierMirror.SmoothEmbeddedClosedDisk
      (M := Sphere n) n (SmoothModel n) := by
  sorry

/-- A finite lawful smooth atlas code on the fixed Type-0 model. -/
structure SmoothAtlasCode (n : ℕ) where
  chartCount : ℕ
  chartDomain : Fin chartCount → Set (ModelSpace n)
  chartDomain_open : ∀ i, IsOpen (chartDomain i)
  chartDomain_nonempty : ∀ i, (chartDomain i).Nonempty
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
    (C.realizedChart i).symm ≫ₕ C.realizedChart j ≈ C.transition i j := by
  sorry

theorem SmoothAtlasCode.realizedChart_target {n : ℕ} (C : SmoothAtlasCode n)
    (i : Fin C.chartCount) : (C.realizedChart i).target = C.chartDomain i := by
  sorry

theorem SmoothAtlasCode.realizedChart_source {n : ℕ} (C : SmoothAtlasCode n)
    (i : Fin C.chartCount) :
    (C.realizedChart i).source = Set.range (C.chartToRealization i) := by
  sorry

/-- A literal one-chart code for any nonempty open domain, including proper open sets. -/
def singleChartCode (n : ℕ) (U : Set (ModelSpace n)) (hU : IsOpen U) (hne : U.Nonempty) :
    SmoothAtlasCode n where
  chartCount := 1
  chartDomain _ := U
  chartDomain_open _ := hU
  chartDomain_nonempty _ := hne
  overlap _ _ := U
  overlap_open _ _ := hU
  overlap_subset_source _ _ := Set.Subset.rfl
  self_overlap _ := rfl
  transition _ _ := OpenPartialHomeomorph.ofSet U hU
  transition_source _ _ := rfl
  transition_target _ _ := rfl
  transition_mem_groupoid _ _ := ofSet_mem_contDiffGroupoid hU
  transition_id _ _ _ := rfl
  transition_inv _ _ _ _ := rfl
  transition_cocycle _ _ _ _ hx _ := ⟨hx, rfl⟩
  identified x y := x.2.1 = y.2.1
  identified_iff _ _ x y := by
    change (x.val = y.val ↔ x.val ∈ U ∧ x.val = y.val)
    simp [x.property]
  identified_refl _ := rfl
  identified_symm h := h.symm
  identified_trans h₁ h₂ := h₁.trans h₂
  separated := by
    have hc : Continuous (fun x : Σ _ : Fin 1, U => (x.2 : ModelSpace n)) :=
      continuous_sigma fun _ ↦ continuous_subtype_val
    exact isClosed_eq (hc.comp continuous_fst) (hc.comp continuous_snd)

/-- Zero charts remain available for the empty cycle. -/
def emptyChartCode (n : ℕ) : SmoothAtlasCode n where
  chartCount := 0
  chartDomain i := Fin.elim0 i
  chartDomain_open i := Fin.elim0 i
  chartDomain_nonempty i := Fin.elim0 i
  overlap i := Fin.elim0 i
  overlap_open i := Fin.elim0 i
  overlap_subset_source i := Fin.elim0 i
  self_overlap i := Fin.elim0 i
  transition i := Fin.elim0 i
  transition_source i := Fin.elim0 i
  transition_target i := Fin.elim0 i
  transition_mem_groupoid i := Fin.elim0 i
  transition_id i := Fin.elim0 i
  transition_inv i := Fin.elim0 i
  transition_cocycle i := Fin.elim0 i
  identified _ _ := False
  identified_iff i := Fin.elim0 i
  identified_refl x := Fin.elim0 x.1
  identified_symm h := h.elim
  identified_trans h _ := h.elim
  separated := by change IsClosed {p | False}; simp


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
  smooth : ContMDiff (I.prod 𝓘(ℝ, E × ModelSpace r))
    (I.prod 𝓘(ℝ, E × ModelSpace r)) ∞ trivialization
  smooth_symm : ContMDiff (I.prod 𝓘(ℝ, E × ModelSpace r))
    (I.prod 𝓘(ℝ, E × ModelSpace r)) ∞ trivialization.toOpenPartialHomeomorph.symm

structure TangentFraming
    {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] where
  trivialization : Bundle.Trivialization E
    (Bundle.TotalSpace.proj : TangentBundle I M → M)
  global : trivialization.baseSet = Set.univ
  linear : trivialization.IsLinear ℝ
  smooth : ContMDiff (I.prod 𝓘(ℝ, E)) (I.prod 𝓘(ℝ, E)) ∞ trivialization
  smooth_symm : ContMDiff (I.prod 𝓘(ℝ, E)) (I.prod 𝓘(ℝ, E)) ∞
    trivialization.toOpenPartialHomeomorph.symm

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

/-- Reverse the first stabilization coordinate, keeping the actual tangent component fixed.
For a boundary restriction this is the added normal line; the fixed permutation puts it first. -/
noncomputable def StableTangentFraming.reverseNormalLine
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] {r : ℕ} (framing : StableTangentFraming I M r)
    (_hr : 0 < r) : StableTangentFraming I M r := by
  sorry

theorem StableTangentFraming.reverseNormalLine_apply
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] {r : ℕ} (f : StableTangentFraming I M r) (hr : 0 < r)
    (p : Bundle.TotalSpace (E × ModelSpace r) (StabilizedTangentBundle I M r)) :
    let v := f.trivialization p
    let w := (f.reverseNormalLine hr).trivialization p
    w.1 = v.1 ∧ w.2.1 = v.2.1 ∧
      ∀ i, w.2.2 i = if i = ⟨0, hr⟩ then -v.2.2 i else v.2.2 i := by
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

/-- The actual outward vector from the collar derivative; collar time increases inward. -/
noncomputable def outwardNormalAt {n : ℕ} (W : CollaredOrientedFilling n) (b : W.B) :
    ModelSpace n :=
  -mfderiv ((𝓡∂ 1).prod (SmoothModel (n - 1))) W.model
    (fun p : HalfOpenCollarDomain W ↦ (W.collar p : W.M))
    ⟨(0, b), Internal.GeometricTopologySupplierMirror.zero_mem_collarSource b⟩
    (WithLp.toLp 2 (fun _ : Fin 1 ↦ (1 : ℝ)), 0)

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

/-- Product structure on a returned proper subcollar of the supplied collar.  Equality is
restricted to actual total-space vectors based at collar time `s < width`; no condition is
imposed near the missing width-one endpoint of the original collar.  The product frame is
still the derivative-based normal/product frame above, not an arbitrary chosen frame. -/
structure StableTangentFraming.IsProductOnCollar {n r : ℕ}
    (W : CollaredOrientedFilling n)
    (framing : StableTangentFraming W.model W.M r) where
  width : Set.Ioo (0 : ℝ) 1
  boundaryFraming : StableTangentFraming (SmoothModel (n - 1)) W.B r
  agrees : Set.EqOn (pullbackFramingAlongCollar W framing).trivialization
    (collarProductFraming W boundaryFraming).trivialization
    {z | ((Bundle.TotalSpace.proj z).val.1 : ℝ) < (width : ℝ)}

theorem StableTangentFraming.IsProductOnCollar.width_pos {n r : ℕ}
    {W : CollaredOrientedFilling n} {framing : StableTangentFraming W.model W.M r}
    (h : framing.IsProductOnCollar W) : 0 < (h.width : ℝ) :=
  h.width.property.1

theorem StableTangentFraming.IsProductOnCollar.width_lt_one {n r : ℕ}
    {W : CollaredOrientedFilling n} {framing : StableTangentFraming W.model W.M r}
    (h : framing.IsProductOnCollar W) : (h.width : ℝ) < 1 :=
  h.width.property.2

structure StableFramedFillingCycle (n : ℕ) where
  filling : CollaredOrientedFilling n
  connected : ConnectedSpace filling.M
  boundary_nonempty : Nonempty filling.B
  boundaryCycle : HomotopySphereCycle (n - 1)
  boundaryDiffeomorphism :
    boundaryCycle.code.Realization ≃ₘ⟮SmoothModel (n - 1), SmoothModel (n - 1)⟯ filling.B
  boundaryDiffeomorphism_preservesOrientation :
    Internal.OrientationSupplierMirror.Diffeomorph.PreservesOrientation
      (SmoothModel (n - 1)) (SmoothModel (n - 1)) boundaryDiffeomorphism
      boundaryCycle.orientation filling.boundaryOrientation
  framingRank : ℕ
  stableFraming : StableTangentFraming filling.model filling.M framingRank
  framingOrientation : Internal.OrientationSupplierMirror.Orientation.Agrees
    filling.model filling.orientation
    (StableTangentFraming.orientation (ι := Fin n) stableFraming)
  productOnCollar : stableFraming.IsProductOnCollar filling

/-- A genuine path through global stable trivializations.  Joint continuity of evaluation makes
this more than equality of the endpoints. -/
structure StableFramingHomotopy
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] {r : ℕ} (f₀ f₁ : StableTangentFraming I M r) where
  framingAt : unitInterval → StableTangentFraming I M r
  at_zero : framingAt 0 = f₀
  at_one : framingAt 1 = f₁
  continuous_eval : Continuous fun p : unitInterval ×
      Bundle.TotalSpace (E × ModelSpace r) (StabilizedTangentBundle I M r) ↦
    (framingAt p.1).trivialization p.2

/-- Add trivial summands with the fixed block permutation. -/
noncomputable def StableTangentFraming.stabilize
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] {r : ℕ} (_f : StableTangentFraming I M r) (s : ℕ) :
    StableTangentFraming I M (r + s) := by
  sorry

/-- Restrict the entire homotopy to the collar; this path need not be constant there. -/
noncomputable def StableFramingHomotopy.pullbackAlongCollar
    {n r : ℕ} (W : CollaredOrientedFilling n)
    {f₀ f₁ : StableTangentFraming W.model W.M r} (_h : StableFramingHomotopy f₀ f₁) :
    StableFramingHomotopy (pullbackFramingAlongCollar W f₀)
      (pullbackFramingAlongCollar W f₁) := by
  sorry

/-- Restriction of an honest ambient frame frames TB plus the outward normal, not TB alone.
The boundary stabilization slot is sent to the negative outward normal in the rotation convention. -/
noncomputable def boundaryFrameOfHonest {n : ℕ} [NeZero n]
    (W : CollaredOrientedFilling n) (_f : TangentFraming W.model W.M) :
    StableTangentFraming (SmoothModel (n - 1)) W.B 1 := by
  sorry

noncomputable def boundaryStableTargetEquiv (n : ℕ) [NeZero n] :
    (ModelSpace (n - 1) × ModelSpace 1) ≃L[ℝ] ModelSpace n := by
  sorry

noncomputable def boundaryTangentMap {n : ℕ} (W : CollaredOrientedFilling n)
    (b : W.B) (v : ModelSpace (n - 1)) : ModelSpace n :=
  mfderiv (SmoothModel (n - 1)) W.model
    (fun y : W.B ↦ (W.boundaryIdentification y : W.M)) b v

/-- The normal is retained as the boundary's stabilization slot. -/
theorem boundaryFrameOfHonest_apply {n : ℕ} [NeZero n]
    (W : CollaredOrientedFilling n) (f : TangentFraming W.model W.M)
    (b : W.B) (v : ModelSpace (n - 1)) (a : ℝ) :
    boundaryStableTargetEquiv n
      ((boundaryFrameOfHonest W f).trivialization
        ⟨b, v, WithLp.toLp 2 (fun _ : Fin 1 ↦ a)⟩).2 =
      (f.trivialization ⟨(W.boundaryIdentification b : W.M),
        boundaryTangentMap W b v - a • outwardNormalAt W b⟩).2 := by
  sorry

/-- Normalize after adding an extra line: rotate the collar normal into that line and the
added line into the negative normal, with a cutoff to the identity away from the collar.
This is a gauge-modified stabilization, not the unmodified block stabilization. -/
noncomputable def collarNormalizedStabilization {n : ℕ}
    (W : CollaredOrientedFilling n) (_f : TangentFraming W.model W.M) (r : ℕ) :
    StableTangentFraming W.model W.M (r + 1) := by
  sorry

noncomputable def collarNormalizationHomotopy {n : ℕ}
    (W : CollaredOrientedFilling n) (f : TangentFraming W.model W.M) (r : ℕ) :
    StableFramingHomotopy (f.stabilize (r + 1))
      (collarNormalizedStabilization W f r) := by
  sorry

/-- The normalized endpoint returns a proper subcollar on which it is product.
The global normalization path moves the boundary framing and need not stay product there. -/
noncomputable def collarNormalizedStabilization_product {n : ℕ}
    (W : CollaredOrientedFilling n) (f : TangentFraming W.model W.M) (r : ℕ) :
    (collarNormalizedStabilization W f r).IsProductOnCollar W := by
  sorry

def StableTangentFraming.castRank
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] {r s : ℕ} (h : r = s) (f : StableTangentFraming I M r) :
    StableTangentFraming I M s := h ▸ f

theorem collarNormalizedStabilization_boundary {n : ℕ} [NeZero n]
    (W : CollaredOrientedFilling n) (f : TangentFraming W.model W.M) (r : ℕ) :
    (collarNormalizedStabilization_product W f r).boundaryFraming.trivialization =
      (StableTangentFraming.castRank (Nat.add_comm 1 r)
        ((boundaryFrameOfHonest W f).stabilize r)).trivialization := by
  sorry

/-- The normal occupies an added coordinate, not a fixed coordinate of the honest target. -/
theorem collarNormalizedStabilization_normal {n : ℕ}
    (W : CollaredOrientedFilling n) (f : TangentFraming W.model W.M) (r : ℕ) (b : W.B) :
    let w := (collarNormalizedStabilization W f r).trivialization
      ⟨(W.boundaryIdentification b : W.M), outwardNormalAt W b, 0⟩
    w.2.1 = 0 ∧ ∀ i, w.2.2 i = if i = 0 then 1 else 0 := by
  sorry

/-- Comparison with a normalized honest frame after common stabilization. Its boundary path
is the actual pullback of this global homotopy, not a fixed-collar condition. -/
structure StableFramedFillingCycle.CompatibleWithHonestFrame
    {n : ℕ} (W : StableFramedFillingCycle n)
    (honest : TangentFraming W.filling.model W.filling.M) where
  extraRank : ℕ
  comparison : StableFramingHomotopy (W.stableFraming.stabilize (extraRank + 1))
    (collarNormalizedStabilization W.filling honest (W.framingRank + extraRank))

/-- An honestly parallelizable filling with a chosen normalization and boundary transport.
The boundary is only stably framed; no honest boundary frame is required. -/
structure CollarNormalizedParallelizableFillingCycle (n : ℕ)
    extends StableFramedFillingCycle n where
  honestFraming : TangentFraming filling.model filling.M
  comparison : toStableFramedFillingCycle.CompatibleWithHonestFrame honestFraming

/-- Disc regression target, constructed before the historical comparison. -/
noncomputable def standardSevenDiskFilling : CollarNormalizedParallelizableFillingCycle 7 := by
  sorry

noncomputable def standardSevenDiskFilling_carrier :
    standardSevenDiskFilling.filling.M ≃ₜ Metric.closedBall (0 : ModelSpace 7) 1 := by
  sorry

/-- Use the chosen boundary atlas of this particular disc, without constructing another atlas. -/
noncomputable instance : ChartedSpace (ModelSpace 6) standardSevenDiskFilling.filling.B :=
  standardSevenDiskFilling.filling.boundaryCharted

noncomputable instance : IsManifold (SmoothModel 6) ∞ standardSevenDiskFilling.filling.B :=
  standardSevenDiskFilling.filling.boundaryManifold

noncomputable def standardSevenDiskFilling_boundary :
    standardSevenDiskFilling.filling.B ≃ₘ⟮SmoothModel 6, SmoothModel 6⟯ Sphere 6 := by
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
  width : Set.Ioo (0 : ℝ) 1
  agrees : Set.EqOn (pullbackFrameToDefectCollar D framing).trivialization
    (defectCollarProductFraming D boundaryFraming).trivialization
    {z | ((Bundle.TotalSpace.proj z).val.1 : ℝ) < (width : ℝ)}

noncomputable def orientationOnOpen
    {n : ℕ} {H M : Type*} [TopologicalSpace H]
    (I : ModelWithCorners ℝ (ModelSpace n) H) [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I ∞ M]
    (_o : Internal.OrientationSupplierMirror.Orientation I M (Fin n))
    (U : TopologicalSpace.Opens M) :
    Internal.OrientationSupplierMirror.Orientation I U (Fin n) := by
  sorry

structure AlmostFramedCycle (n : ℕ) extends SmoothClosedOrientedCycle n where
  connected : ConnectedSpace code.Realization
  defect : Internal.GeometricTopologySupplierMirror.SmoothEmbeddedClosedDisk
    (M := code.Realization) n (SmoothModel n)
  frameRank : ℕ
  frameOffDefect : StableTangentFraming (SmoothModel n) defect.exterior frameRank
  productNearDefect : frameOffDefect.IsProductNearDefect defect
  framingOrientation : Internal.OrientationSupplierMirror.Orientation.Agrees
    (SmoothModel n) (orientationOnOpen (SmoothModel n) orientation defect.exterior)
    (StableTangentFraming.orientation (ι := Fin n) frameOffDefect)

/-- Extend the actual open-exterior frame across its product collar to the closed exterior. -/
noncomputable def extendFramingAcrossDefectCollar {n : ℕ} [NeZero n] (X : AlmostFramedCycle n) :
    StableTangentFraming (𝓡∂ n) X.defect.closedExterior X.frameRank := by
  sorry

/-- Restrict through the actual codimension-zero inclusion of the open exterior. -/
noncomputable def restrictClosedExteriorFraming {n r : ℕ} [NeZero n] (X : AlmostFramedCycle n)
    (_f : StableTangentFraming (𝓡∂ n) X.defect.closedExterior r) :
    StableTangentFraming (SmoothModel n) X.defect.exterior r := by
  sorry

theorem extendFramingAcrossDefectCollar_restrict {n : ℕ} [NeZero n] (X : AlmostFramedCycle n) :
    (restrictClosedExteriorFraming X (extendFramingAcrossDefectCollar X)).trivialization =
      X.frameOffDefect.trivialization := by
  sorry

/-! ## Geometric bordism quotients and the Kervaire--Milnor segment -/

/-- Pull the intrinsic boundary orientation back along a same-dimensional smooth embedding.  The
implementation is defined from `mfderiv` and the shared orientation API. -/
noncomputable def pullbackBoundaryOrientation {n : ℕ} (X : SmoothClosedOrientedCycle n)
    (W : CollaredOrientedFilling (n + 1))
    (f : C(X.code.Realization, W.B))
    (_hf : IsSmoothEmbedding (SmoothModel n) (SmoothModel ((n + 1) - 1)) ∞ f) :
    Internal.OrientationSupplierMirror.Orientation
      (SmoothModel n) X.code.Realization (Fin n) := by
  sorry

/-- The two closed boundary components of a collared cobordism are supplied by actual smooth
embeddings whose disjoint ranges cover its intrinsic boundary carrier.  The incoming component
has the reversed endpoint orientation and the outgoing component has the given orientation. -/
structure BoundaryIdentification {n : ℕ} (X Y : SmoothClosedOrientedCycle n)
    (W : CollaredOrientedFilling (n + 1)) where
  incoming : C(X.code.Realization, W.B)
  outgoing : C(Y.code.Realization, W.B)
  incomingSmooth : IsSmoothEmbedding (SmoothModel n) (SmoothModel ((n + 1) - 1)) ∞ incoming
  outgoingSmooth : IsSmoothEmbedding (SmoothModel n) (SmoothModel ((n + 1) - 1)) ∞ outgoing
  disjointRanges : Disjoint (Set.range incoming) (Set.range outgoing)
  rangesCover : Set.range incoming ∪ Set.range outgoing = Set.univ
  incomingOrientation : Internal.OrientationSupplierMirror.Orientation.Agrees
    (SmoothModel n) (pullbackBoundaryOrientation X W incoming incomingSmooth) (-X.orientation)
  outgoingOrientation : Internal.OrientationSupplierMirror.Orientation.Agrees
    (SmoothModel n) (pullbackBoundaryOrientation Y W outgoing outgoingSmooth) Y.orientation

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

/-- A chosen framed normal line and smooth splitting of the actual tangent map.
The last summand is the chosen signed normal; boundary constructors use the outward normal.
Incoming comparisons reverse this normal, then use the fixed summand permutation. -/
structure FramedNormalLine
    {E F H K M N : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [TopologicalSpace H] [TopologicalSpace K]
    (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ F K)
    [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace H M] [IsManifold I ∞ M]
    [ChartedSpace K N] [IsManifold J ∞ N] (f : C(M, N)) where
  dimension : Module.finrank ℝ F = Module.finrank ℝ E + 1
  splitting : ∀ x : M, (E × ℝ) ≃L[ℝ] F
  tangent_eq : ∀ x v, splitting x (v, 0) = mfderiv I J f x v
  smooth : ContMDiff (I.prod 𝓘(ℝ, E × ModelSpace 1)) (I.prod 𝓘(ℝ, F)) ∞
    (fun p : Bundle.TotalSpace (E × ModelSpace 1) (StabilizedTangentBundle I M 1) ↦
      (⟨p.proj, splitting p.proj (p.2.1, p.2.2 0)⟩ :
        Bundle.TotalSpace F (Bundle.Pullback f (fun y : N ↦ TangentSpace J y))))
  smooth_symm : ContMDiff (I.prod 𝓘(ℝ, F)) (I.prod 𝓘(ℝ, E × ModelSpace 1)) ∞
    (fun p : Bundle.TotalSpace F (Bundle.Pullback f (fun y : N ↦ TangentSpace J y)) ↦
      (⟨p.proj, ((splitting p.proj).symm p.2).1,
        WithLp.toLp 2 (fun _ : Fin 1 ↦ ((splitting p.proj).symm p.2).2)⟩ :
        Bundle.TotalSpace (E × ModelSpace 1) (StabilizedTangentBundle I M 1)))

/-- Regression target: the standard sphere has an outward normal without a tangent framing. -/
noncomputable def sphereOutwardNormalLine (n : ℕ) :
    FramedNormalLine (SmoothModel n) (SmoothModel (n + 1))
      (⟨Subtype.val, continuous_subtype_val⟩ : C(Sphere n, ModelSpace (n + 1))) := by
  sorry

theorem sphereOutwardNormalLine_apply (n : ℕ) (x : Sphere n) (v : ModelSpace n) (a : ℝ) :
    (sphereOutwardNormalLine n).splitting x (v, a) =
      NormedSpace.fromTangentSpace (x : ModelSpace (n + 1))
        (mfderiv (SmoothModel n) (SmoothModel (n + 1))
          (Subtype.val : Sphere n → ModelSpace (n + 1)) x v) +
        a • (x : ModelSpace (n + 1)) := by
  sorry

/-- Stable boundary frame of the standard disc; it retains one normal slot. -/
noncomputable def standardSphereBoundaryFrame (n : ℕ) :
    StableTangentFraming (SmoothModel n) (Sphere n) 1 := by
  sorry

theorem standardSphereBoundaryFrame_apply (n : ℕ) (x : Sphere n) (v : ModelSpace n) (a : ℝ) :
    boundaryStableTargetEquiv (n + 1)
      ((standardSphereBoundaryFrame n).trivialization
        ⟨x, v, WithLp.toLp 2 (fun _ : Fin 1 ↦ a)⟩).2 =
      NormedSpace.fromTangentSpace (x : ModelSpace (n + 1))
        (mfderiv (SmoothModel n) (SmoothModel (n + 1))
          (Subtype.val : Sphere n → ModelSpace (n + 1)) x v) -
        a • (x : ModelSpace (n + 1)) := by
  sorry

noncomputable def pullbackStableFramingAlongDiffeomorph
    {n r : ℕ} {M N : Type*} [TopologicalSpace M] [TopologicalSpace N]
    [ChartedSpace (ModelSpace n) M] [ChartedSpace (ModelSpace n) N]
    [IsManifold (SmoothModel n) ∞ M] [IsManifold (SmoothModel n) ∞ N]
    (_e : M ≃ₘ⟮SmoothModel n, SmoothModel n⟯ N)
    (_f : StableTangentFraming (SmoothModel n) N r) :
    StableTangentFraming (SmoothModel n) M r := by
  sorry

/-- The disc's chosen boundary identification carries the explicit normal-stable sphere frame. -/
theorem standardSevenDiskFilling_boundaryFrame :
    (boundaryFrameOfHonest standardSevenDiskFilling.filling
      standardSevenDiskFilling.honestFraming).trivialization =
    (pullbackStableFramingAlongDiffeomorph standardSevenDiskFilling_boundary
      (standardSphereBoundaryFrame 6)).trivialization := by
  sorry

noncomputable def restrictStableFramingAlongCodimOne
    {E F H K M N : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [TopologicalSpace H] [TopologicalSpace K]
    {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K}
    [TopologicalSpace M] [TopologicalSpace N]
    [ChartedSpace H M] [IsManifold I ∞ M]
    [ChartedSpace K N] [IsManifold J ∞ N] {r : ℕ}
    (f : C(M, N)) (_hf : IsSmoothEmbedding I J ∞ f)
    (_normal : FramedNormalLine I J f)
    (_framing : StableTangentFraming J N r) :
    StableTangentFraming I M (r + 1) := by
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

/-- The product cylinder, with `boundary = (-X) disjointUnion X`, is the reflexive witness for
oriented h-cobordism. -/
noncomputable def geometricHCobordismCylinderWitness {n : ℕ} (X : HomotopySphereCycle n) :
    GeometricHCobordismWitness X X := by
  sorry

theorem geometricHCobordant_refl_fromCylinder {n : ℕ} (X : HomotopySphereCycle n) :
    GeometricHCobordant X X :=
  ⟨geometricHCobordismCylinderWitness X⟩

theorem geometricHCobordant_equivalence (n : ℕ) :
    Equivalence (@GeometricHCobordant n) := by
  refine ⟨geometricHCobordant_refl_fromCylinder, ?_, ?_⟩
  · sorry
  · sorry

/-- The setoid used for the geometric quotient of homotopy spheres. -/
def homotopySphereSetoid (n : ℕ) : Setoid (HomotopySphereCycle n) :=
  ⟨GeometricHCobordant, geometricHCobordant_equivalence n⟩

/-- The underlying quotient carrier of oriented homotopy spheres modulo geometric h-cobordism. -/
def HomotopySphereClass (n : ℕ) :=
  Quotient (homotopySphereSetoid n)

/-- Connected sum, orientation reversal, and the explicit inverse h-cobordism descend to the
geometric quotient. -/
noncomputable instance homotopySphereClassAddCommGroup (n : ℕ) [Fact (5 ≤ n)] :
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
    StableTangentFraming (SmoothModel n) X.code.Realization (W.rank + 1) := by
  sorry

/-- Pull the collared boundary framing back to the outgoing closed cycle. -/
noncomputable def StableFramedCobordismData.outgoingFraming
    {n : ℕ} {X Y : SmoothClosedOrientedCycle n} (W : StableFramedCobordismData X Y) :
    StableTangentFraming (SmoothModel n) Y.code.Realization (W.rank + 1) := by
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
  incomingRank : X.stabilizationRank ≤ data.rank + 1
  outgoingRank : Y.stabilizationRank ≤ data.rank + 1
  incomingAgrees : data.incomingFraming.trivialization =
    ((X.stabilizeTo (data.rank + 1) incomingRank).reverseNormalLine (by omega)).trivialization
  outgoingAgrees : data.outgoingFraming.trivialization =
    (Y.stabilizeTo (data.rank + 1) outgoingRank).trivialization

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

/-- Stabilize the complement framing of an almost-framed cycle to a common displayed rank. -/
noncomputable def AlmostFramedCycle.stabilizeTo {n : ℕ} (X : AlmostFramedCycle n) (r : ℕ)
    (_hr : X.frameRank ≤ r) :
    StableTangentFraming (SmoothModel n) X.defect.exterior r := by
  sorry

/-- Positive width rescaling extends over the closed parameter interval because `ε < 1`. -/
def properCollarTime (ε : Set.Ioo (0 : ℝ) 1) (s : unitInterval) : unitInterval :=
  ⟨(ε : ℝ) * (s : ℝ), by
    constructor
    · exact mul_nonneg ε.property.1.le s.property.1
    · nlinarith [ε.property.1, ε.property.2, s.property.1, s.property.2]⟩

theorem properCollarTime_lt_one (ε : Set.Ioo (0 : ℝ) 1) (s : unitInterval) :
    (properCollarTime ε s : ℝ) < 1 := by
  change (ε : ℝ) * (s : ℝ) < 1
  nlinarith [ε.property.1, ε.property.2, s.property.1, s.property.2]

noncomputable def AlmostFramedCycle.defectCollarAtWidth {n : ℕ}
    (X : AlmostFramedCycle n) (ε : Set.Ioo (0 : ℝ) 1)
    (p : unitInterval × X.defect.disk.B) : X.defect.closedExterior :=
  X.defect.exteriorCollar (properCollarTime ε p.1, p.2)


/-- A proper defect tube has named endcaps and a lateral face. The exterior collar is
required only along that lateral face; the endcap interiors lie in the trace boundary. -/
structure ProperDefectTube {n : ℕ} (X Y : AlmostFramedCycle n)
    (W : CollaredOrientedFilling (n + 1))
    (boundary : BoundaryIdentification X.toSmoothClosedOrientedCycle
      Y.toSmoothClosedOrientedCycle W) where
  outgoingDisk :
    Y.defect.disk.M ≃ₘ⟮Y.defect.disk.model, X.defect.disk.model⟯ X.defect.disk.M
  outgoingBoundary :
    Y.defect.disk.B ≃ₘ⟮SmoothModel (n - 1), SmoothModel (n - 1)⟯ X.defect.disk.B
  outgoingBoundary_eq : ∀ b,
    outgoingDisk (Y.defect.disk.boundaryIdentification b) =
      X.defect.disk.boundaryIdentification (outgoingBoundary b)
  embedding : C(unitInterval × X.defect.disk.M, W.M)
  smoothEmbedding : IsSmoothEmbedding ((𝓡∂ 1).prod X.defect.disk.model) W.model ∞ embedding
  range_closed : IsClosed (Set.range embedding)
  incoming_eq : ∀ x, embedding (0, x) = boundary.incomingInclusion (X.defect.embedding x)
  outgoing_eq : ∀ y, embedding (1, outgoingDisk y) =
    boundary.outgoingInclusion (Y.defect.embedding y)
  proper_boundary : ∀ (t : unitInterval) x,
    embedding (t, x) ∈ W.model.boundary W.M ↔ t = 0 ∨ t = 1
  lateralCollar : C(unitInterval × (unitInterval × X.defect.disk.B), W.M)
  lateralCollarSmooth : ContMDiff
    ((𝓡∂ 1).prod ((𝓡∂ 1).prod (SmoothModel (n - 1)))) W.model ∞ lateralCollar
  lateralCollarEmbedding : IsEmbedding lateralCollar
  lateralCollar_zero : ∀ t b, lateralCollar (0, t, b) =
    embedding (t, X.defect.disk.boundaryIdentification b)
  lateralCollar_positive : ∀ (s : unitInterval) t b, 0 < (s : ℝ) →
    lateralCollar (s, t, b) ∉ Set.range embedding
  incomingWidth : Set.Ioo (0 : ℝ) 1
  outgoingWidth : Set.Ioo (0 : ℝ) 1
  incomingWidth_product : (incomingWidth : ℝ) < (X.productNearDefect.width : ℝ)
  outgoingWidth_product : (outgoingWidth : ℝ) < (Y.productNearDefect.width : ℝ)
  incomingCollar_eq : ∀ (s : unitInterval) b,
    lateralCollar (s, 0, b) = boundary.incomingInclusion
      ((X.defectCollarAtWidth incomingWidth (s, b) : X.defect.closedExterior) :
        X.code.Realization)
  outgoingCollar_eq : ∀ (s : unitInterval) b,
    lateralCollar (s, 1, outgoingBoundary b) = boundary.outgoingInclusion
      ((Y.defectCollarAtWidth outgoingWidth (s, b) : Y.defect.closedExterior) :
        Y.code.Realization)

def ProperDefectTube.exterior {n : ℕ} {X Y : AlmostFramedCycle n}
    {W : CollaredOrientedFilling (n + 1)}
    {boundary : BoundaryIdentification X.toSmoothClosedOrientedCycle
      Y.toSmoothClosedOrientedCycle W} (T : ProperDefectTube X Y W boundary) :
    TopologicalSpace.Opens W.M := ⟨(Set.range T.embedding)ᶜ, T.range_closed.isOpen_compl⟩

/-- The outside half of the lateral collar, excluding both its zero and width endpoints. -/
noncomputable def TubeExteriorCollarDomain {n : ℕ} {X Y : AlmostFramedCycle n}
    {W : CollaredOrientedFilling (n + 1)}
    {boundary : BoundaryIdentification X.toSmoothClosedOrientedCycle
      Y.toSmoothClosedOrientedCycle W} (T : ProperDefectTube X Y W boundary) :
    TopologicalSpace.Opens (unitInterval × (unitInterval × X.defect.disk.B)) :=
  ⟨{p | p.1 ≠ 0 ∧ (p.1 : ℝ) < 1}, by sorry⟩

noncomputable def pullbackFrameToTubeCollar {n r : ℕ} {X Y : AlmostFramedCycle n}
    {W : CollaredOrientedFilling (n + 1)}
    {boundary : BoundaryIdentification X.toSmoothClosedOrientedCycle
      Y.toSmoothClosedOrientedCycle W} (T : ProperDefectTube X Y W boundary)
    (_f : StableTangentFraming W.model T.exterior r) :
    StableTangentFraming ((𝓡∂ 1).prod ((𝓡∂ 1).prod (SmoothModel (n - 1))))
      (TubeExteriorCollarDomain T) r := by
  sorry

noncomputable def tubeCollarProductFraming {n r : ℕ} {X Y : AlmostFramedCycle n}
    {W : CollaredOrientedFilling (n + 1)}
    {boundary : BoundaryIdentification X.toSmoothClosedOrientedCycle
      Y.toSmoothClosedOrientedCycle W} (T : ProperDefectTube X Y W boundary)
    (_f : StableTangentFraming ((𝓡∂ 1).prod (SmoothModel (n - 1)))
      (unitInterval × X.defect.disk.B) r) :
    StableTangentFraming ((𝓡∂ 1).prod ((𝓡∂ 1).prod (SmoothModel (n - 1))))
      (TubeExteriorCollarDomain T) r := by
  sorry

structure StableTangentFraming.IsProductNearTube {n r : ℕ} {X Y : AlmostFramedCycle n}
    {W : CollaredOrientedFilling (n + 1)}
    {boundary : BoundaryIdentification X.toSmoothClosedOrientedCycle
      Y.toSmoothClosedOrientedCycle W} (T : ProperDefectTube X Y W boundary)
    (f : StableTangentFraming W.model T.exterior r) where
  lateralFraming : StableTangentFraming ((𝓡∂ 1).prod (SmoothModel (n - 1)))
      (unitInterval × X.defect.disk.B) r
  width : Set.Ioo (0 : ℝ) 1
  agrees : Set.EqOn (pullbackFrameToTubeCollar T f).trivialization
    (tubeCollarProductFraming T lateralFraming).trivialization
    {z | ((Bundle.TotalSpace.proj z).val.1 : ℝ) < (width : ℝ)}

/-- An almost-framed bordism tracks a proper tube, with a framing on its open complement. -/
structure AlmostFramedBordismWitness {n : ℕ} (X Y : AlmostFramedCycle n) where
  cobordism : CollaredOrientedFilling (n + 1)
  boundary : BoundaryIdentification X.toSmoothClosedOrientedCycle
    Y.toSmoothClosedOrientedCycle cobordism
  defectTrack : ProperDefectTube X Y cobordism boundary
  incomingComplement : C(X.defect.exterior, defectTrack.exterior)
  outgoingComplement : C(Y.defect.exterior, defectTrack.exterior)
  incomingComplementSmooth : IsSmoothEmbedding (SmoothModel n) cobordism.model ∞
    incomingComplement
  outgoingComplementSmooth : IsSmoothEmbedding (SmoothModel n) cobordism.model ∞
    outgoingComplement
  incomingComplement_commutes : ∀ p,
    ((incomingComplement p : defectTrack.exterior) : cobordism.M) =
      boundary.incomingInclusion (p : X.code.Realization)
  outgoingComplement_commutes : ∀ p,
    ((outgoingComplement p : defectTrack.exterior) : cobordism.M) =
      boundary.outgoingInclusion (p : Y.code.Realization)
  rank : ℕ
  frameOffDefect : StableTangentFraming cobordism.model defectTrack.exterior rank
  productNearDefect : frameOffDefect.IsProductNearTube defectTrack
  incomingNormal : FramedNormalLine (SmoothModel n) cobordism.model incomingComplement
  outgoingNormal : FramedNormalLine (SmoothModel n) cobordism.model outgoingComplement
  incomingNormal_eq : ∀ x, incomingNormal.splitting x (0, 1) =
    outwardNormalAt cobordism (boundary.incoming (x : X.code.Realization))
  outgoingNormal_eq : ∀ x, outgoingNormal.splitting x (0, 1) =
    outwardNormalAt cobordism (boundary.outgoing (x : Y.code.Realization))
  incomingRank : X.frameRank ≤ rank + 1
  outgoingRank : Y.frameRank ≤ rank + 1
  incomingFramingAgrees :
    (restrictStableFramingAlongCodimOne incomingComplement incomingComplementSmooth
      incomingNormal frameOffDefect).trivialization =
        ((X.stabilizeTo (rank + 1) incomingRank).reverseNormalLine (by omega)).trivialization
  outgoingFramingAgrees :
    (restrictStableFramingAlongCodimOne outgoingComplement outgoingComplementSmooth
      outgoingNormal frameOffDefect).trivialization =
        (Y.stabilizeTo (rank + 1) outgoingRank).trivialization

def AlmostFramedBordant {n : ℕ} (X Y : AlmostFramedCycle n) : Prop :=
  Nonempty (AlmostFramedBordismWitness X Y)

/-- The actual product trace and defect tube, using one common proper endpoint width. -/
noncomputable def almostFramedCylinderWitness {n : ℕ} (X : AlmostFramedCycle n) :
    AlmostFramedBordismWitness X X := by
  sorry

noncomputable def almostFramedCylinderCoordinates {n : ℕ} (X : AlmostFramedCycle n) :
    (almostFramedCylinderWitness X).cobordism.M ≃ₜ unitInterval × X.code.Realization := by
  sorry

theorem almostFramedCylinderWitness_tube {n : ℕ} (X : AlmostFramedCycle n)
    (t : unitInterval) (x : X.defect.disk.M) :
    almostFramedCylinderCoordinates X
      ((almostFramedCylinderWitness X).defectTrack.embedding (t, x)) =
        (t, X.defect.embedding x) := by
  sorry

theorem almostFramedCylinderWitness_collar {n : ℕ} (X : AlmostFramedCycle n)
    (s t : unitInterval) (b : X.defect.disk.B) :
    let T := (almostFramedCylinderWitness X).defectTrack
    T.incomingWidth = T.outgoingWidth ∧
      almostFramedCylinderCoordinates X (T.lateralCollar (s, t, b)) =
        (t, (X.defectCollarAtWidth T.incomingWidth (s, b) : X.code.Realization)) := by
  sorry

/-- Reflexivity comes from the product cylinder, not from a separate axiom. -/
theorem almostFramedBordant_refl_fromCylinder {n : ℕ} (X : AlmostFramedCycle n) :
    AlmostFramedBordant X X := ⟨almostFramedCylinderWitness X⟩

theorem almostFramedBordant_equivalence (n : ℕ) :
    Equivalence (@AlmostFramedBordant n) := by
  refine ⟨almostFramedBordant_refl_fromCylinder, ?_, ?_⟩
  · sorry
  · sorry

def almostFramedBordismSetoid (n : ℕ) : Setoid (AlmostFramedCycle n) :=
  ⟨AlmostFramedBordant, almostFramedBordant_equivalence n⟩

def AlmostFramedBordismClass (n : ℕ) := Quotient (almostFramedBordismSetoid n)

noncomputable instance almostFramedBordismClassAddCommGroup (n : ℕ) [Fact (5 ≤ n)] :
    AddCommGroup (AlmostFramedBordismClass n) := by
  sorry

abbrev AlmostFramedBordism (n : ℕ) := AlmostFramedBordismClass n

/-- The actual boundary inclusion of a filling after applying its displayed boundary
diffeomorphism. -/
noncomputable def StableFramedFillingCycle.boundaryInclusion {n : ℕ}
    (X : StableFramedFillingCycle n) :
    C(X.boundaryCycle.code.Realization, X.filling.M) := by
  sorry

/-- Stabilize a filling's displayed framing to a common rank. -/
noncomputable def StableFramedFillingCycle.stabilizeTo {n : ℕ}
    (X : StableFramedFillingCycle n) (r : ℕ) (_hr : X.framingRank ≤ r) :
    StableTangentFraming X.filling.model X.filling.M r := by
  sorry

/-- The three faces of the rounded boundary of a cobordism with corners between fillings.  The
horizontal faces meet the vertical face exactly in their displayed boundary spheres; the
vertical face is itself an oriented h-cobordism between those spheres. -/
structure StableFillingBoundaryFaces {n : ℕ}
    (X Y : StableFramedFillingCycle n) (trace : CollaredOrientedFilling (n + 1)) where
  [dimensionPositive : NeZero n]
  incoming : C(X.filling.M, trace.B)
  outgoing : C(Y.filling.M, trace.B)
  vertical : CollaredOrientedFilling (n - 1 + 1)
  verticalFace : C(vertical.M, trace.B)
  incomingSmooth : IsSmoothEmbedding X.filling.model (SmoothModel ((n + 1) - 1)) ∞ incoming
  outgoingSmooth : IsSmoothEmbedding Y.filling.model (SmoothModel ((n + 1) - 1)) ∞ outgoing
  verticalSmooth : IsSmoothEmbedding vertical.model (SmoothModel ((n + 1) - 1)) ∞ verticalFace
  incomingAmbient : C(X.filling.M, trace.M)
  outgoingAmbient : C(Y.filling.M, trace.M)
  verticalAmbient : C(vertical.M, trace.M)
  incomingAmbientSmooth : IsSmoothEmbedding X.filling.model trace.model ∞ incomingAmbient
  outgoingAmbientSmooth : IsSmoothEmbedding Y.filling.model trace.model ∞ outgoingAmbient
  verticalAmbientSmooth : IsSmoothEmbedding vertical.model trace.model ∞ verticalAmbient
  incomingAmbient_eq : ∀ x, incomingAmbient x = trace.boundaryIdentification (incoming x)
  outgoingAmbient_eq : ∀ x, outgoingAmbient x = trace.boundaryIdentification (outgoing x)
  verticalAmbient_eq : ∀ x, verticalAmbient x = trace.boundaryIdentification (verticalFace x)
  incomingNormal : FramedNormalLine X.filling.model trace.model incomingAmbient
  outgoingNormal : FramedNormalLine Y.filling.model trace.model outgoingAmbient
  verticalNormal : FramedNormalLine vertical.model trace.model verticalAmbient
  incomingNormal_eq : ∀ x, incomingNormal.splitting x (0, 1) =
    outwardNormalAt trace (incoming x)
  outgoingNormal_eq : ∀ x, outgoingNormal.splitting x (0, 1) =
    outwardNormalAt trace (outgoing x)
  verticalNormal_eq : ∀ x, verticalNormal.splitting x (0, 1) =
    outwardNormalAt trace (verticalFace x)
  horizontalDisjoint : Disjoint (Set.range incoming) (Set.range outgoing)
  facesCover : Set.range incoming ∪ Set.range outgoing ∪ Set.range verticalFace = Set.univ
  verticalBoundary : BoundaryIdentification X.boundaryCycle.toSmoothClosedOrientedCycle
    Y.boundaryCycle.toSmoothClosedOrientedCycle vertical
  incomingCorner : ∀ p,
    incoming (X.boundaryInclusion p) =
      verticalFace (verticalBoundary.incomingInclusion p)
  outgoingCorner : ∀ p,
    outgoing (Y.boundaryInclusion p) =
      verticalFace (verticalBoundary.outgoingInclusion p)
  incomingVerticalIntersection : Set.range incoming ∩ Set.range verticalFace =
    Set.range (fun p => incoming (X.boundaryInclusion p))
  outgoingVerticalIntersection : Set.range outgoing ∩ Set.range verticalFace =
    Set.range (fun p => outgoing (Y.boundaryInclusion p))
  incomingEquiv : X.boundaryCycle.code.Realization ≃ₕ vertical.M
  outgoingEquiv : Y.boundaryCycle.code.Realization ≃ₕ vertical.M
  incomingEquiv_toFun : incomingEquiv.toFun = verticalBoundary.incomingInclusion
  outgoingEquiv_toFun : outgoingEquiv.toFun = verticalBoundary.outgoingInclusion

/-- The vertical h-cobordism uses the negative of the trace-induced face orientation.
Reverse the outward normal line so its own endpoint convention is incoming-minus/outgoing-plus;
this is the transposition sign of the time and boundary-normal directions at each corner. -/
noncomputable def StableFillingBoundaryFaces.verticalFraming {n : ℕ}
    {X Y : StableFramedFillingCycle n} {trace : CollaredOrientedFilling (n + 1)}
    (F : StableFillingBoundaryFaces X Y trace) {r : ℕ}
    (framing : StableTangentFraming trace.model trace.M r) :
    StableTangentFraming F.vertical.model F.vertical.M (r + 1) :=
  (restrictStableFramingAlongCodimOne F.verticalAmbient F.verticalAmbientSmooth
    F.verticalNormal framing).reverseNormalLine (by omega)

/-- The trace framing restricted to the incoming horizontal face. -/
noncomputable def StableFillingBoundaryFaces.incomingFraming {n : ℕ}
    {X Y : StableFramedFillingCycle n} {trace : CollaredOrientedFilling (n + 1)}
    (F : StableFillingBoundaryFaces X Y trace) {r : ℕ}
    (framing : StableTangentFraming trace.model trace.M r) :
    StableTangentFraming X.filling.model X.filling.M (r + 1) :=
  restrictStableFramingAlongCodimOne F.incomingAmbient F.incomingAmbientSmooth
    F.incomingNormal framing

/-- The trace framing restricted to the outgoing horizontal face. -/
noncomputable def StableFillingBoundaryFaces.outgoingFraming {n : ℕ}
    {X Y : StableFramedFillingCycle n} {trace : CollaredOrientedFilling (n + 1)}
    (F : StableFillingBoundaryFaces X Y trace) {r : ℕ}
    (framing : StableTangentFraming trace.model trace.M r) :
    StableTangentFraming Y.filling.model Y.filling.M (r + 1) :=
  restrictStableFramingAlongCodimOne F.outgoingAmbient F.outgoingAmbientSmooth
    F.outgoingNormal framing

/-- A genuine framed cobordism with corners between collar-normalized parallelizable fillings.  Endpoint
framing equations are stated after one common stabilization, and the vertical face carries the
restriction of the trace framing, product-compatible on its own collar. -/
structure StableFillingBordismWitness {n : ℕ}
    (X Y : CollarNormalizedParallelizableFillingCycle n) where
  trace : CollaredOrientedFilling (n + 1)
  faces : StableFillingBoundaryFaces X.toStableFramedFillingCycle
    Y.toStableFramedFillingCycle trace
  rank : ℕ
  framing : StableTangentFraming trace.model trace.M rank
  framingOrientation : Internal.OrientationSupplierMirror.Orientation.Agrees
    trace.model trace.orientation (StableTangentFraming.orientation (ι := Fin (n + 1)) framing)
  incomingOrientation : Internal.OrientationSupplierMirror.Orientation.Agrees
    X.filling.model (-X.filling.orientation)
    (StableTangentFraming.orientation (ι := Fin n) (faces.incomingFraming framing))
  outgoingOrientation : Internal.OrientationSupplierMirror.Orientation.Agrees
    Y.filling.model Y.filling.orientation
    (StableTangentFraming.orientation (ι := Fin n) (faces.outgoingFraming framing))
  verticalOrientation : Internal.OrientationSupplierMirror.Orientation.Agrees
    faces.vertical.model faces.vertical.orientation
    (StableTangentFraming.orientation (ι := Fin (n - 1 + 1)) (faces.verticalFraming framing))
  productOnCollar : framing.IsProductOnCollar trace
  incomingRank : X.framingRank ≤ rank + 1
  outgoingRank : Y.framingRank ≤ rank + 1
  incomingFramingAgrees :
    (faces.incomingFraming framing).trivialization =
        ((X.toStableFramedFillingCycle.stabilizeTo (rank + 1) incomingRank).reverseNormalLine
          (by omega)).trivialization
  outgoingFramingAgrees :
    (faces.outgoingFraming framing).trivialization =
        (Y.toStableFramedFillingCycle.stabilizeTo (rank + 1) outgoingRank).trivialization
  verticalProductOnCollar : (faces.verticalFraming framing).IsProductOnCollar faces.vertical

def StableFillingBordant {n : ℕ}
    (X Y : CollarNormalizedParallelizableFillingCycle n) : Prop :=
  Nonempty (StableFillingBordismWitness X Y)

/-- The rounded product-with-an-interval trace, with horizontal faces `(-X)` and `X` and the
vertical cylinder on the boundary sphere, supplies reflexivity with all corner and framing data. -/
noncomputable def stableFillingCylinderWitness {n : ℕ}
    (X : CollarNormalizedParallelizableFillingCycle n) : StableFillingBordismWitness X X := by
  sorry

theorem stableFillingBordant_refl_fromCylinder {n : ℕ}
    (X : CollarNormalizedParallelizableFillingCycle n) : StableFillingBordant X X :=
  ⟨stableFillingCylinderWitness X⟩

theorem stableFillingBordant_equivalence (n : ℕ) :
    Equivalence (@StableFillingBordant n) := by
  refine ⟨stableFillingBordant_refl_fromCylinder, ?_, ?_⟩
  · sorry
  · sorry

def stableFillingBordismSetoid (n : ℕ) : Setoid (CollarNormalizedParallelizableFillingCycle n) :=
  ⟨StableFillingBordant, stableFillingBordant_equivalence n⟩

def StableFillingBordismClass (n : ℕ) := Quotient (stableFillingBordismSetoid n)

noncomputable instance stableFillingBordismClassAddCommGroup (n : ℕ) [Fact (5 ≤ n)] :
    AddCommGroup (StableFillingBordismClass n) := by
  sorry

abbrev StableFillingBordism (n : ℕ) := StableFillingBordismClass n

/-- The Kervaire--Milnor map `i : Theta_n -> A_n`, induced by the canonical punctured stable
framing of a homotopy sphere. -/
noncomputable def thetaToAlmostFramed (n : ℕ) [Fact (5 ≤ n)] :
    Theta n →+ AlmostFramedBordism n := by
  sorry

/-- The representative-level deletion construction uses the connected closed exterior with
its inherited orientation, the extended collar framing, and the reversed defect-sphere boundary. -/
noncomputable def defectDeletionFilling {n : ℕ} [Fact (5 ≤ n)]
    (X : AlmostFramedCycle n) : StableFramedFillingCycle n := by
  sorry

noncomputable def defectDeletionFilling_carrier {n : ℕ} [Fact (5 ≤ n)] [NeZero n]
    (X : AlmostFramedCycle n) :
    X.defect.closedExterior ≃ₘ⟮𝓡∂ n, (defectDeletionFilling X).filling.model⟯
      (defectDeletionFilling X).filling.M := by
  sorry

/-- The Kervaire--Milnor map `p : A_n -> P_n`, induced by deleting the defect-disc interior. -/
noncomputable def almostFramedToStableFilling (n : ℕ) [Fact (5 ≤ n)] :
    AlmostFramedBordism n →+ StableFillingBordism n := by
  sorry

/-- The Kervaire--Milnor boundary map `b : P_(n+1) -> Theta_n`. -/
noncomputable def stableFillingBoundaryToTheta (n : ℕ) [Fact (5 ≤ n)] [Fact (5 ≤ n + 1)] :
    StableFillingBordism (n + 1) →+ Theta n := by
  sorry

/-- One displayed geometric exact segment of the Kervaire--Milnor sequence. -/
theorem kervaireMilnor_exact_at_theta (n : ℕ) [Fact (5 ≤ n)] [Fact (5 ≤ n + 1)] :
    Function.Exact (stableFillingBoundaryToTheta n) (thetaToAlmostFramed n) := by
  sorry

theorem kervaireMilnor_exact_at_almostFramed (n : ℕ) [Fact (5 ≤ n)] :
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
  smooth : ContMDiff ((SmoothModel n).prod (SmoothModel k))
    ((SmoothModel n).prod (SmoothModel k)) ∞ trivialization
  smooth_symm : ContMDiff ((SmoothModel n).prod (SmoothModel k))
    ((SmoothModel n).prod (SmoothModel k)) ∞ trivialization.toOpenPartialHomeomorph.symm

/-- A fibre curve uses the actual tubular map near zero. Its outside values do not affect
its derivative, since the disc domain is open and contains the zero section. -/
noncomputable def tubularFiberCurve
    {n k : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (e : SmoothEuclideanEmbedding n k M)
    (U : TopologicalSpace.Opens (Bundle.TotalSpace (ModelSpace k) (NormalFiber e)))
    (V : TopologicalSpace.Opens (ModelSpace (n + k))) (f : C(U, V))
    (x : M) (v : NormalFiber e x) (t : ℝ) : ModelSpace (n + k) := by
  classical
  exact if h : (⟨x, t • v⟩ : Bundle.TotalSpace (ModelSpace k) (NormalFiber e)) ∈ U then
    (f ⟨⟨x, t • v⟩, h⟩ : ModelSpace (n + k)) else e.map x

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
  normalCoordinates : Bundle.TotalSpace (ModelSpace k) (NormalFiber e) ≃ₜ discDomain
  compressionScale : C(Bundle.TotalSpace (ModelSpace k) (NormalFiber e), ℝ)
  compressionScale_pos : ∀ v, 0 < compressionScale v
  normalCoordinates_radial : ∀ v,
    (normalCoordinates v).val = ⟨v.proj, compressionScale v • v.snd⟩
  normalCoordinates_zero : ∀ x,
    normalCoordinates ⟨x, 0⟩ = ⟨⟨x, 0⟩, zero_mem x⟩
  zeroSection : ∀ x,
    (tubular ⟨⟨x, 0⟩, zero_mem x⟩ : ModelSpace (n + k)) = e.map x
  normalDerivative : ∀ x (v : NormalFiber e x),
    (LinearMap.range (mfderiv (SmoothModel n) (SmoothModel (n + k)) e.map x).toLinearMap).mkQ
      (fderiv ℝ (tubularFiberCurve e discDomain neighbourhood tubular x v) 0 1) = v

theorem SmoothTubularNeighborhood.normalCoordinates_over_base
    {n k : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    {e : SmoothEuclideanEmbedding n k M} (tube : SmoothTubularNeighborhood e)
    (v : Bundle.TotalSpace (ModelSpace k) (NormalFiber e)) :
    (tube.normalCoordinates v).val.proj = v.proj := by
  rw [tube.normalCoordinates_radial]

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

/-- The chosen sphere model is the one-point compactification of its Euclidean chart. -/
noncomputable def ambientSphereHomeomorph (d : ℕ) :
    OnePoint (ModelSpace d) ≃ₜ (pointedSphereCG d).right := by
  sorry

/-- For a compact base, the normal Thom quotient is the one-point compactification of the
normal total space, identifying every fibre-infinity with its single Thom basepoint. -/
noncomputable def normalThomHomeomorph
    {n k : ℕ} {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (e : SmoothEuclideanEmbedding n k M) :
    OnePoint (Bundle.TotalSpace (ModelSpace k) (NormalFiber e)) ≃ₜ (normalThomCG e).right := by
  sorry

theorem ambientSphereHomeomorph_infty (d : ℕ) :
    ambientSphereHomeomorph d OnePoint.infty = (pointedSphereCG d).hom PUnit.unit := by
  sorry

theorem normalThomHomeomorph_infty
    {n k : ℕ} {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (e : SmoothEuclideanEmbedding n k M) :
    normalThomHomeomorph e OnePoint.infty = (normalThomCG e).hom PUnit.unit := by
  sorry

/-- The trivial-bundle Thom model uses the same fibre compactification as `pointedSphereCG`. -/
noncomputable def suspendedBaseHomeomorph
    (k : ℕ) {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M] :
    OnePoint (M × ModelSpace k) ≃ₜ (suspendedBaseCG k (M := M)).right := by
  sorry

theorem suspendedBaseHomeomorph_infty
    (k : ℕ) {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M] :
    suspendedBaseHomeomorph k (M := M) OnePoint.infty =
      (suspendedBaseCG k (M := M)).hom PUnit.unit := by
  sorry

/-- Construct this isomorphism from the displayed trivialization, rather than choosing an iso. -/
noncomputable def framedThomEquiv
    {n k : ℕ} {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (normal : StableNormalFraming n k M) :
    PointedConvenientIso (normalThomCG normal.embedding) (suspendedBaseCG k (M := M)) := by
  sorry

theorem framedThomEquiv_coordinates
    {n k : ℕ} {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (normal : StableNormalFraming n k M)
    (v : Bundle.TotalSpace (ModelSpace k) (NormalFiber normal.embedding)) :
    (framedThomEquiv normal).hom.right (normalThomHomeomorph normal.embedding (v : OnePoint _)) =
      suspendedBaseHomeomorph k (M := M)
        (normal.trivialization v : OnePoint (M × ModelSpace k)) := by
  sorry

theorem framedThomEquiv_infty
    {n k : ℕ} {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (normal : StableNormalFraming n k M) :
    (framedThomEquiv normal).hom.right
      (normalThomHomeomorph normal.embedding OnePoint.infty) =
        (suspendedBaseCG k (M := M)).hom PUnit.unit := by
  sorry

noncomputable def tubularCollapse
    {n k : ℕ} {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    {e : SmoothEuclideanEmbedding n k M} (_tube : SmoothTubularNeighborhood e) :
    PointedConvenientMap (pointedSphereCG (n + k)) (normalThomCG e) := by
  sorry

theorem tubularCollapse_coordinates
    {n k : ℕ} {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    {e : SmoothEuclideanEmbedding n k M} (tube : SmoothTubularNeighborhood e)
    (v : Bundle.TotalSpace (ModelSpace k) (NormalFiber e)) :
    (tubularCollapse tube).right
      (ambientSphereHomeomorph (n + k)
        ((tube.tubular (tube.normalCoordinates v) : ModelSpace (n + k)) :
          OnePoint (ModelSpace (n + k)))) = normalThomHomeomorph e (v : OnePoint _) := by
  sorry

theorem tubularCollapse_zeroSection
    {n k : ℕ} {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    {e : SmoothEuclideanEmbedding n k M} (tube : SmoothTubularNeighborhood e) (x : M) :
    (tubularCollapse tube).right
      (ambientSphereHomeomorph (n + k) (e.map x : OnePoint (ModelSpace (n + k)))) =
        normalThomHomeomorph e
          ((⟨x, 0⟩ : Bundle.TotalSpace (ModelSpace k) (NormalFiber e)) : OnePoint _) := by
  sorry

theorem tubularCollapse_complement
    {n k : ℕ} {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    {e : SmoothEuclideanEmbedding n k M} (tube : SmoothTubularNeighborhood e)
    (x : OnePoint (ModelSpace (n + k)))
    (_hx : ∀ y : tube.neighbourhood, x ≠ ((y : ModelSpace (n + k)) : OnePoint (ModelSpace (n + k)))) :
    (tubularCollapse tube).right (ambientSphereHomeomorph (n + k) x) =
      normalThomHomeomorph e OnePoint.infty := by
  sorry

noncomputable def suspendedAugmentation
    (k : ℕ) {M : Type*} [TopologicalSpace M] :
    PointedConvenientMap (suspendedBaseCG k (M := M)) (pointedSphereCG k) := by
  sorry

theorem suspendedAugmentation_coordinates
    (k : ℕ) {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    (x : M) (v : ModelSpace k) :
    (suspendedAugmentation k (M := M)).right
      (suspendedBaseHomeomorph k ((x, v) : OnePoint (M × ModelSpace k))) =
        ambientSphereHomeomorph k (v : OnePoint (ModelSpace k)) := by
  sorry

/-- The finite representative is determined by the normal framing and an allowed tube. -/
noncomputable def framedCollapse
    {n k : ℕ} {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (normal : StableNormalFraming n k M) (tube : SmoothTubularNeighborhood normal.embedding) :
    PointedConvenientMap (pointedSphereCG (n + k)) (pointedSphereCG k) :=
  tubularCollapse tube ≫ (framedThomEquiv normal).hom ≫ suspendedAugmentation k

/-- The homotopy keeps ambient infinity at the sphere basepoint. -/
theorem framedCollapse_independent_tube
    {n k : ℕ} {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M]
    [ChartedSpace (ModelSpace n) M] [IsManifold (SmoothModel n) ∞ M]
    (normal : StableNormalFraming n k M) (a b : SmoothTubularNeighborhood normal.embedding) :
    ContinuousMap.HomotopicRel
      (framedCollapse normal a).right.hom.hom
      (framedCollapse normal b).right.hom.hom
      {(pointedSphereCG (n + k)).hom PUnit.unit} := by
  sorry

/-- The positively framed point at the origin, in ambient dimension one. -/
noncomputable def positivePointNormalFraming : StableNormalFraming 0 1 (ModelSpace 0) := by
  sorry

theorem positivePointNormalFraming_embedding :
    positivePointNormalFraming.embedding.map 0 = 0 := by
  sorry

theorem positivePointNormalFraming_coordinate (v : ModelSpace 1) :
    (positivePointNormalFraming.trivialization ⟨0,
      (LinearMap.range (mfderiv (SmoothModel 0) (SmoothModel 1)
        positivePointNormalFraming.embedding.map 0).toLinearMap).mkQ v⟩).2 = v := by
  sorry

noncomputable def positivePointTube :
    SmoothTubularNeighborhood positivePointNormalFraming.embedding := by
  sorry

theorem positivePointTube_coordinates (v : ModelSpace 1) :
    let q := (LinearMap.range (mfderiv (SmoothModel 0) (SmoothModel 1)
      positivePointNormalFraming.embedding.map 0).toLinearMap).mkQ v
    (positivePointTube.tubular (positivePointTube.normalCoordinates ⟨0, q⟩) :
      ModelSpace 1) = v := by
  sorry

/-- Every allowed tube/compression for the same positively framed point gives the identity
class on the compactified line, hence degree `+1`, with infinity fixed throughout. -/
theorem positivePoint_framedCollapse (tube :
    SmoothTubularNeighborhood positivePointNormalFraming.embedding) :
    ContinuousMap.HomotopicRel
      (framedCollapse positivePointNormalFraming tube).right.hom.hom
      (ContinuousMap.id (pointedSphereCG 1).right)
      {(pointedSphereCG 1).hom PUnit.unit} := by
  sorry

structure PontryaginThomFactorization (n : ℕ) where
  cycle : FramedCycle n
  normalFraming :
    StableNormalFraming n cycle.stabilizationRank cycle.code.Realization
  tubularNeighbourhood : SmoothTubularNeighborhood normalFraming.embedding
  tangentNormalCompatibility :
    (tangentFramingOfNormal normalFraming).trivialization = cycle.framing.trivialization

noncomputable def PontryaginThomFactorization.thomEquivSuspendedBase
    {n : ℕ} (P : PontryaginThomFactorization n) :
    PointedConvenientIso (normalThomCG P.normalFraming.embedding)
      (suspendedBaseCG P.cycle.stabilizationRank (M := P.cycle.code.Realization)) :=
  framedThomEquiv P.normalFraming

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

/-- Both elementary-zero relations in the standard odd L-group. -/
def OddWallFormation.IsElementaryZero {q : ℕ} (F : OddWallFormation q) : Prop :=
  IsCompl F.firstLagrangian.carrier F.secondLagrangian.carrier ∨
    ∃ L : F.form.Lagrangian,
      IsCompl F.firstLagrangian.carrier L.carrier ∧
      IsCompl F.secondLagrangian.carrier L.carrier

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
  | oddElementaryZero {q} (F Z : OddWallFormation q) :
      Z.IsElementaryZero → StablyEquivalent (.odd q F) (.odd q (F.hyperbolicSum Z))
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

/-- The two Lagrangians in the standard hyperbolic formation are complementary. -/
theorem hyperbolicWallFormation_complementary (q : ℕ) :
    IsCompl (hyperbolicWallFormation q).firstLagrangian.carrier
      (hyperbolicWallFormation q).secondLagrangian.carrier := by
  sorry

/-- The diagonal test formation uses the same first Lagrangian twice. -/
noncomputable def diagonalWallFormation (q : ℕ) : OddWallFormation q where
  form := (hyperbolicWallFormation q).form
  firstLagrangian := (hyperbolicWallFormation q).firstLagrangian
  secondLagrangian := (hyperbolicWallFormation q).firstLagrangian

theorem hyperbolicWallFormation_isElementaryZero (q : ℕ) :
    (hyperbolicWallFormation q).IsElementaryZero :=
  Or.inl (hyperbolicWallFormation_complementary q)

theorem diagonalWallFormation_isElementaryZero (q : ℕ) :
    (diagonalWallFormation q).IsElementaryZero :=
  Or.inr ⟨(hyperbolicWallFormation q).secondLagrangian,
    hyperbolicWallFormation_complementary q, hyperbolicWallFormation_complementary q⟩

/-- Both elementary test formations can be added and removed by the defining relation. -/
example (q : ℕ) (F : OddWallFormation q) :
    WallSurgeryDatum.StablyEquivalent (.odd q F)
      (.odd q (F.hyperbolicSum (diagonalWallFormation q))) :=
  .oddElementaryZero F _ (diagonalWallFormation_isElementaryZero q)

/-! ## The geometric sixth-sphere group -/

/-- The low-stem, Kervaire-invariant, Wall, and exactness chain makes the geometric quotient
`Theta_6` trivial. -/
theorem thetaSix_subsingleton : Subsingleton (Theta 6) := by
  sorry

private instance : Fact (5 ≤ 6) := ⟨by decide⟩

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
