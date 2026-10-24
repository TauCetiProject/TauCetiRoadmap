import Mathlib
import TauCeti.Geometry.Manifold.SmoothEmbedding.NormalSpace
import TauCeti.Geometry.Manifold.TubularNeighborhood.Euclidean
import TauCeti.Geometry.Manifold.TubularNeighborhood.NormalFrame
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Exponential
import TauCeti.Geometry.Manifold.Morse.Basic
import TauCeti.Analysis.Calculus.Sard.EqualDimension

/-!
# Geometric topology and the Kirby-list problems: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap is in `README.md`: eleven layers of differential and geometric
topology built bottom-up from current Mathlib (the manifold buildout and structure
groups; locally flat embeddings; diffeomorphism-group topologies; knot theory; Dehn
surgery; knot concordance and 4D cobordism; Riemannian volume and hyperbolic structures;
geometric decomposition; Heegaard genus; foliations; triangulations and collapse), each
attached to the solved Kirby-list problems it would let us *state*. Knot theory and the
concordance foundations (layers 4 and 6) are owned here. The
[combinatorial Heegaard Floer roadmap](../CombinatorialHeegaardFloer/README.md) supplies
the grid invariant `τ` and filtered interfaces, consuming the knot types defined here.
Layer 6 additionally owns its `τ` connected-sum/descent adapter and the entire
Khovanov–Lee/Rasmussen `s` supplier, as specified by the definitive README.

The current Tau Ceti substrate includes smooth embeddings, quotient normal
spaces and the topological Euclidean tubular neighbourhood. The normal-space
targets use the existing quotient and projection carriers; nearest-point and
smooth normal-bundle extensions below are suggested targets. The remaining
geometric and smooth extensions are specified by the README; this file's
illustrative signatures do not certify their completion.

As the prerequisite *types* land in `TauCeti/` (layer 1's gluing and connected sum first,
then surgery, then the volume measure), state each layer's milestones here with `sorry`
(human-owned roadmap territory, so `sorry` is allowed). The natural first new targets, in
dependency order, have these shapes:

  -- Layer 1, the gluing engine and its first invariant:
  -- Layer 1 first constructs ballComplement and its boundary identification.
  -- def connectedSum (M N : Manifold ...) (oM : Orientation M) (oN : Orientation N)
  --     (ballM : EmbeddedBall M) (ballN : EmbeddedBall N)
  --     (collarM : BoundaryCollar (ballComplement ballM))
  --     (collarN : BoundaryCollar (ballComplement ballN)) : Manifold ... := ...
  -- theorem connectedSum_sphere (M : Manifold ...) (oM : Orientation M) (oS : Orientation (sphere n))
  --     (ballM : EmbeddedBall M) (ballS : EmbeddedBall (sphere n))
  --     (collarM : BoundaryCollar (ballComplement ballM)) (collarS : BoundaryCollar (ballComplement ballS)) :
  --     connectedSum M (sphere n) oM oS ballM ballS collarM collarS ≃ₘ M
  --
  -- Layer 3, the Smale conjecture, once Diff carries the C^∞ topology:
  -- theorem smale_conjecture : ∃ h : ContinuousMap.HomotopyEquiv (orthogonalGroup 4 ℝ) (Diff (sphere 3)), h.toFun = orthogonalInclusion   -- [Kir97, 4.34]
  --
  -- Layer 4, topological sliceness stated cleanly (knot theory owned here):
  -- theorem freedman_alexanderOne_slice
  --     (f : TauCeti.SmoothEmbedding (𝓡 1) (𝓡 3) ∞ Circle (sphere 3))
  --     (h : alexanderOfDiagram (diagramOf f) = 1) : IsTopologicallySlice f                                             -- [Kir97, 1.36]
  --
  -- Layer 5, Dehn surgery recovering known manifolds (the convention check):
  -- theorem surgery_unknot_zero : dehnSurgery unknot (0 : Slope) ≃ₘ (circle ×ₘ sphere 2)
  --
  -- Layer 7, the Weeks manifold as the volume minimiser:
  -- theorem weeks_minimal_volume (M : ClosedHyperbolic3Manifold) :
  --     volume weeksManifold ≤ volume M                                    -- [Kir97, 3.60]
-/

namespace TauCetiRoadmap.GeometricTopology

open scoped Manifold ContDiff InnerProductSpace
open Topology
open scoped Bundle

noncomputable section

local instance : NeZero (∞ : ℕ∞ω) := ⟨by simp⟩

section EmbeddingRegularity
variable {E F H G S M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [NormedAddCommGroup F] [NormedSpace ℝ F]
  [TopologicalSpace H] [TopologicalSpace G]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F G}
  [TopologicalSpace S] [ChartedSpace H S] [TopologicalSpace M] [ChartedSpace G M]

/-- Lower only regularity, preserving the actual embedding and immersion data. -/
def smoothEmbeddingOfLE {m n : ℕ∞ω} (f : TauCeti.SmoothEmbedding I J n S M)
    (hmn : m ≤ n) : TauCeti.SmoothEmbedding I J m S M := by
  sorry

theorem smoothEmbeddingOfLE_coe {m n : ℕ∞ω} (f : TauCeti.SmoothEmbedding I J n S M)
    (hmn : m ≤ n) : (smoothEmbeddingOfLE f hmn : S → M) = (f : S → M) := by
  sorry
end EmbeddingRegularity

section EuclideanTubular

variable {E H M V : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M]
  [NormedAddCommGroup V] [InnerProductSpace ℝ V]

/-- The intrinsic quotient normal space agrees with the Euclidean orthogonal model. -/
def normalSpaceOrthogonalEquiv [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] [IsManifold I ∞ M] [I.Boundaryless]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V)
    (x : M) :
    f.NormalSpace x (by simp) ≃L[ℝ] TauCeti.normalSubspace I (f : M → V) x := by
  sorry

theorem normalSpaceOrthogonalEquiv_normalClass [FiniteDimensional ℝ E] [FiniteDimensional ℝ V]
    [IsManifold I ∞ M] [I.Boundaryless]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V) (x : M) (v : V) :
    normalSpaceOrthogonalEquiv f x (f.normalClass x (by simp) v) =
      (TauCeti.normalSubspace I (f : M → V) x).orthogonalProjectionOnto v := by
  sorry

theorem normalSpaceOrthogonalEquiv_symm [FiniteDimensional ℝ E] [FiniteDimensional ℝ V]
    [IsManifold I ∞ M] [I.Boundaryless]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V) (x : M)
    (v : TauCeti.normalSubspace I (f : M → V) x) :
    (normalSpaceOrthogonalEquiv f x).symm v = f.normalClass x (by simp) (v : V) := by
  sorry

/-- Actual injectivity on any positive tube is enough; compactness only supplies one radius. -/
theorem isOpenEmbedding_normalTube_of_injOn [FiniteDimensional ℝ E] [FiniteDimensional ℝ V]
    [IsManifold I 2 M] [I.Boundaryless]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) 2 M V) (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) :
    IsOpenEmbedding ((TauCeti.normalTube I f ε).domRestrict
      fun p : M × V => f p.1 + p.2) := by
  sorry

/-- The compact tubular neighbourhood can be chosen with unique nearest points. -/
theorem exists_uniform_unique_nearestPoint [FiniteDimensional ℝ E] [FiniteDimensional ℝ V]
    [IsManifold I ∞ M]
    [I.Boundaryless] [CompactSpace M]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ y : V, (∃ x : M, ‖y - f x‖ < ε) →
      ∃! x : M, ∀ z : M, ‖y - f x‖ ≤ ‖y - f z‖ := by
  sorry

section NearestPoint

/-- The existing open thickening in the Euclidean ambient space. -/
def nearestPointDomain (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V)
    (ε : ℝ) : TopologicalSpace.Opens V :=
  ⟨Metric.thickening ε (Set.range f), Metric.isOpen_thickening⟩

/-- The closest-point map takes closed image and actual normal-tube injectivity. -/
def nearestPoint [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] [IsManifold I ∞ M] [I.Boundaryless]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V)
    (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) : nearestPointDomain f ε → M := by
  sorry

theorem nearestPoint_minimizes [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] [IsManifold I ∞ M] [I.Boundaryless] (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V)
    (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) (y : nearestPointDomain f ε) :
    ∀ z : M, ‖(y : V) - f (nearestPoint f ε hε hclosed hinj y)‖ ≤ ‖(y : V) - f z‖ := by
  sorry

theorem contMDiff_nearestPoint [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] [IsManifold I ∞ M] [I.Boundaryless] (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V)
    (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) :
    ContMDiff 𝓘(ℝ, V) I ∞ (nearestPoint f ε hε hclosed hinj) := by
  sorry

/-- Normality and the radius bound make the inverse tube map well-typed. -/
theorem nearestPoint_normal [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] [IsManifold I ∞ M] [I.Boundaryless] (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V)
    (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) (y : nearestPointDomain f ε) :
    ((nearestPoint f ε hε hclosed hinj y, (y : V) - f (nearestPoint f ε hε hclosed hinj y)) : M × V)
      ∈ TauCeti.normalTube I f ε := by
  sorry

def euclideanTubeEquiv [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] [IsManifold I ∞ M] [I.Boundaryless]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V)
    (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) :
    TauCeti.normalTube I f ε ≃ₜ nearestPointDomain f ε := by
  sorry

theorem euclideanTubeEquiv_apply [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] [IsManifold I ∞ M] [I.Boundaryless] (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V)
    (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) (q : TauCeti.normalTube I f ε) :
    (euclideanTubeEquiv f ε hε hclosed hinj q : V) = f q.1.1 + q.1.2 := by
  sorry

theorem euclideanTubeEquiv_symm_apply [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] [IsManifold I ∞ M] [I.Boundaryless]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V) (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) (y : nearestPointDomain f ε) :
    (euclideanTubeEquiv f ε hε hclosed hinj).symm y =
      ⟨(nearestPoint f ε hε hclosed hinj y, (y : V) - f (nearestPoint f ε hε hclosed hinj y)),
        nearestPoint_normal f ε hε hclosed hinj y⟩ := by
  sorry
end NearestPoint

end EuclideanTubular

section NormalModelDefinition
variable {E F : Type*} [AddCommGroup E] [Module ℝ E] [AddCommGroup F] [Module ℝ F]
/-- The normal model has the codimension, rather than the ambient dimension. -/
abbrev NormalModel := EuclideanSpace ℝ
  (Fin (Module.finrank ℝ F - Module.finrank ℝ E))
end NormalModelDefinition

section QuotientNormalBundle
open Bundle
variable {E F H G S M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F]
  [TopologicalSpace H] [TopologicalSpace G]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F G}
  [TopologicalSpace S] [ChartedSpace H S]
  [TopologicalSpace M] [ChartedSpace G M]

/-- Intrinsic normal fibres are the existing quotient, independently of a metric. -/
abbrev quotientNormal [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [IsManifold I ∞ S] [IsManifold J ∞ M] (f : TauCeti.SmoothEmbedding I J ∞ S M) (x : S) :=
  f.NormalSpace x (by simp)

/-- Canonical quotient total-space topology: coinduced from the pulled-back tangent bundle. -/
instance quotientNormalTopology [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [IsManifold I ∞ S] [IsManifold J ∞ M] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    TopologicalSpace (TotalSpace (NormalModel (E := E) (F := F)) (quotientNormal f)) :=
  TopologicalSpace.coinduced
    (fun p : TotalSpace F ((f : S → M) *ᵖ (TangentSpace J)) =>
      (⟨p.proj, f.normalClass p.proj (by simp) p.2⟩ :
        TotalSpace (NormalModel (E := E) (F := F)) (quotientNormal f)))
    inferInstance


/-- Register the native pullback on the embedding's function coercion used by consumers. -/
instance smoothEmbeddingTangentPullbackContMDiffVectorBundle [IsManifold I ∞ S] [IsManifold J ∞ M]
    [I.Boundaryless] [J.Boundaryless] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    ContMDiffVectorBundle ∞ F ((f : S → M) *ᵖ (TangentSpace J)) I := by
  change ContMDiffVectorBundle ∞ F (f.toContMDiffMap *ᵖ (TangentSpace J)) I
  infer_instance

/-- Consumers obtain this instance directly on the embedding's function coercion. -/
example [IsManifold I ∞ S] [IsManifold J ∞ M]
    [I.Boundaryless] [J.Boundaryless] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    ContMDiffVectorBundle ∞ F ((f : S → M) *ᵖ (TangentSpace J)) I := inferInstance

/-- The chosen auxiliary metric gives a quotient atlas; the README pins its independence. -/
instance quotientNormalFiberBundle [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] [T2Space M] [SecondCountableTopology M]
    [I.Boundaryless] [J.Boundaryless]
    [IsManifold I ∞ S] [IsManifold J ∞ M] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    FiberBundle (NormalModel (E := E) (F := F)) (quotientNormal f) := by
  sorry

instance quotientNormalVectorBundle [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] [T2Space M] [SecondCountableTopology M]
    [I.Boundaryless] [J.Boundaryless]
    [IsManifold I ∞ S] [IsManifold J ∞ M] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    VectorBundle ℝ (NormalModel (E := E) (F := F)) (quotientNormal f) := by
  sorry

instance quotientNormalContMDiffVectorBundle [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] [T2Space M] [SecondCountableTopology M]
    [I.Boundaryless] [J.Boundaryless]
    [IsManifold I ∞ S] [IsManifold J ∞ M] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    ContMDiffVectorBundle ∞ (NormalModel (E := E) (F := F)) (quotientNormal f) I := by
  sorry
theorem contMDiff_quotientNormalClass [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [IsManifold I ∞ S] [IsManifold J ∞ M] [T2Space M] [SecondCountableTopology M]
    [I.Boundaryless] [J.Boundaryless] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    ContMDiff (I.prod 𝓘(ℝ, F)) (I.prod 𝓘(ℝ, NormalModel (E := E) (F := F))) ∞
      (fun p : TotalSpace F ((f : S → M) *ᵖ (TangentSpace J)) =>
        (⟨p.proj, f.normalClass p.proj (by simp) p.2⟩ :
          TotalSpace (NormalModel (E := E) (F := F)) (quotientNormal f))) := by
  sorry

end QuotientNormalBundle

section NormalBundleCarrier
open Bundle
open scoped Bundle
variable {E F H G S M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F]
  [TopologicalSpace H] [TopologicalSpace G]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F G}
  [TopologicalSpace S] [ChartedSpace H S]
  [TopologicalSpace M] [ChartedSpace G M] [IsManifold J 1 M]
  [RiemannianBundle (fun x : M => TangentSpace J x)]

def orthogonalNormal [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] {n : ℕ∞ω} (f : TauCeti.SmoothEmbedding I J n S M) (x : S) :
    Submodule ℝ (TangentSpace J (f x)) := ((mfderiv I J (f : S → M) x).toLinearMap.range).orthogonal

/-- Use the topology induced by the inclusion into the pulled-back tangent bundle. -/
instance normalBundleTopology [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] {n : ℕ∞ω} (f : TauCeti.SmoothEmbedding I J n S M) :
    TopologicalSpace (TotalSpace (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x))) :=
  TopologicalSpace.induced
    (fun p => (⟨p.proj, (p.2 : TangentSpace J (f p.proj))⟩ :
      TotalSpace F ((f : S → M) *ᵖ (TangentSpace J)))) inferInstance

instance normalFiberBundle [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] {n : ℕ∞ω} [NeZero n]

    [IsManifold I n S] [IsManifold J n M] [I.Boundaryless] [J.Boundaryless]
    [IsContMDiffRiemannianBundle J (n - 1) F (fun x : M => TangentSpace J x)]
    (f : TauCeti.SmoothEmbedding I J n S M) :
    FiberBundle (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x)) := by
  sorry

instance normalVectorBundle [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] {n : ℕ∞ω} [NeZero n]

    [IsManifold I n S] [IsManifold J n M] [I.Boundaryless] [J.Boundaryless]
    [IsContMDiffRiemannianBundle J (n - 1) F (fun x : M => TangentSpace J x)]
    (f : TauCeti.SmoothEmbedding I J n S M) :
    VectorBundle ℝ (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x)) := by
  sorry

instance normalContMDiffVectorBundle [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] {n : ℕ∞ω} [NeZero n]

    [IsManifold I n S] [IsManifold J n M] [I.Boundaryless] [J.Boundaryless]
    [IsContMDiffRiemannianBundle J (n - 1) F (fun x : M => TangentSpace J x)]
    (f : TauCeti.SmoothEmbedding I J n S M) :
    ContMDiffVectorBundle (n - 1) (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x)) I := by
  sorry

/-- An open radius tube in the actual general normal bundle. -/
def normalRadiusTube [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] {n : ℕ∞ω} (f : TauCeti.SmoothEmbedding I J n S M) (δ : S → ℝ) :
    Set (TotalSpace (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x))) :=
  {p | ‖(p.2 : TangentSpace J (f p.proj))‖ < δ p.proj}

theorem orthogonalNormal_smoothEmbeddingOfLE [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    {m n : ℕ∞ω} (f : TauCeti.SmoothEmbedding I J n S M) (hmn : m ≤ n) (x : S) :
    orthogonalNormal (smoothEmbeddingOfLE f hmn) x = orthogonalNormal f x := by
  sorry

theorem contMDiff_normalInclusion [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    {n : ℕ∞ω} [NeZero n] [IsManifold I n S] [IsManifold J n M]
    [I.Boundaryless] [J.Boundaryless]
    [IsContMDiffRiemannianBundle J (n - 1) F (fun x : M => TangentSpace J x)]
    (f : TauCeti.SmoothEmbedding I J n S M) :
    ContMDiff (I.prod 𝓘(ℝ, NormalModel (E := E) (F := F))) (I.prod 𝓘(ℝ, F)) (n - 1)
      (fun p : TotalSpace (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x)) =>
        (⟨p.proj, (p.2 : TangentSpace J (f p.proj))⟩ :
          TotalSpace F ((f : S → M) *ᵖ (TangentSpace J)))) := by
  sorry

/-- The actual open tube subtype supports genuine diffeomorphisms even over an empty base. -/
def normalRadiusTubeOpen [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    {n : ℕ∞ω} [NeZero n] [IsManifold I n S] [IsManifold J n M]
    [I.Boundaryless] [J.Boundaryless]
    [IsContMDiffRiemannianBundle J (n - 1) F (fun x : M => TangentSpace J x)]
    (f : TauCeti.SmoothEmbedding I J n S M) (δ : S → ℝ) (hδ : Continuous δ) :
    TopologicalSpace.Opens
      (TotalSpace (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x))) :=
  ⟨normalRadiusTube f δ, by sorry⟩

end NormalBundleCarrier

section GeneralAmbient
open Bundle
open scoped Bundle
variable {E F H G S M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F]
  [TopologicalSpace H] [TopologicalSpace G]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F G}
  [TopologicalSpace S] [ChartedSpace H S] [IsManifold I ∞ S] [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace G M] [IsManifold J ∞ M] [J.Boundaryless]
  [RiemannianBundle (fun x : M => TangentSpace J x)]

local instance [IsContMDiffRiemannianBundle J ∞ F (fun x : M => TangentSpace J x)] :
    IsContMDiffRiemannianBundle J ((∞ : ℕ∞ω) - 1) F
    (fun x : M => TangentSpace J x) := by
  exact IsContMDiffRiemannianBundle.of_le (n := ∞) (tsub_le_self : (∞ : ℕ∞ω) - 1 ≤ ∞)


/-- The metric complement gives the canonical quotient through the existing quotient map. -/
def normalQuotientEquiv [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [IsContMDiffRiemannianBundle J ∞ F (fun x : M => TangentSpace J x)]
    (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    TotalSpace (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x)) ≃ₜ
      TotalSpace (NormalModel (E := E) (F := F)) (quotientNormal f) := by
  sorry

theorem normalQuotientEquiv_apply [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [IsContMDiffRiemannianBundle J ∞ F (fun x : M => TangentSpace J x)] (f : TauCeti.SmoothEmbedding I J ∞ S M)
    (p : TotalSpace (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x))) :
    normalQuotientEquiv f p = ⟨p.proj, f.normalClass p.proj (by simp) p.2⟩ := by
  sorry

theorem contMDiff_normalQuotientEquiv [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [IsContMDiffRiemannianBundle J ∞ F (fun x : M => TangentSpace J x)] [T2Space M] [SecondCountableTopology M]
    (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    ContMDiff (I.prod 𝓘(ℝ, NormalModel (E := E) (F := F)))
      (I.prod 𝓘(ℝ, NormalModel (E := E) (F := F))) ∞ (normalQuotientEquiv f) ∧
    ContMDiff (I.prod 𝓘(ℝ, NormalModel (E := E) (F := F)))
      (I.prod 𝓘(ℝ, NormalModel (E := E) (F := F))) ∞ (normalQuotientEquiv f).symm := by
  sorry

/-- The normal exponential is pinned to the existing manifold exponential. -/
def normalExponential [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [IsContMDiffRiemannianBundle J ∞ F (fun x : M => TangentSpace J x)] (f : TauCeti.SmoothEmbedding I J ∞ S M)
    (p : TotalSpace (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x))) : M :=
  TauCeti.Manifold.riemannianExp J M (f p.proj) p.2

/-- Global natural domain, not only the small tubular neighborhood of the zero section. -/
def normalExpDomain [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [IsContMDiffRiemannianBundle J ∞ F (fun x : M => TangentSpace J x)] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    Set (TotalSpace (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x))) :=
  {p | (p.2 : TangentSpace J (f p.proj)) ∈ TauCeti.Manifold.expDomain J M (f p.proj)}

theorem isOpen_normalExpDomain [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [IsContMDiffRiemannianBundle J ∞ F (fun x : M => TangentSpace J x)] [T2Space M] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    IsOpen (normalExpDomain f) := by
  sorry

theorem contMDiffOn_normalExponential [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [IsContMDiffRiemannianBundle J ∞ F (fun x : M => TangentSpace J x)] [T2Space M] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    ContMDiffOn (I.prod 𝓘(ℝ, NormalModel (E := E) (F := F))) J ∞
      (normalExponential f) (normalExpDomain f) := by
  sorry

end GeneralAmbient

section LeeAmbient
open Bundle
open scoped Bundle
variable {E F H G S M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F]
  [TopologicalSpace H] [TopologicalSpace G]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F G}
  [TopologicalSpace S] [ChartedSpace H S] [IsManifold I ∞ S] [I.Boundaryless]
  [EMetricSpace M] [ChartedSpace G M] [IsManifold J ∞ M] [J.Boundaryless]
  [RiemannianBundle (fun x : M => TangentSpace J x)]
  [ambientMetricSmooth : IsContMDiffRiemannianBundle J ∞ F (fun x : M => TangentSpace J x)]
  [IsRiemannianManifold J M]

local instance : IsContMDiffRiemannianBundle J ((∞ : ℕ∞ω) - 1) F
    (fun x : M => TangentSpace J x) := by
  exact IsContMDiffRiemannianBundle.of_le (n := ∞) (tsub_le_self : (∞ : ℕ∞ω) - 1 ≤ ∞)

/-- Whole-total-space partial-chart corollary for a nonempty embedded manifold. -/
theorem exists_normalTubularDiffeomorph [Nonempty S] [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [SecondCountableTopology M] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    ∃ (δ : S → ℝ)
      (chart : PartialDiffeomorph
        (I.prod 𝓘(ℝ, NormalModel (E := E) (F := F))) J
        (TotalSpace (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x))) M ∞),
      ContMDiff I 𝓘(ℝ, ℝ) ∞ δ ∧ (∀ x, 0 < δ x) ∧
      chart.source = normalRadiusTube f δ ∧
      (∀ p ∈ chart.source, (p.2 : TangentSpace J (f p.proj)) ∈
        TauCeti.Manifold.expDomain J M (f p.proj)) ∧
      (∀ p ∈ chart.source, chart p = normalExponential f p) ∧
      (∀ x, chart ⟨x, 0⟩ = f x) := by
  sorry
/-- The quotient bundle has the same smooth tubular interface. -/
theorem exists_quotientTubularDiffeomorph [Nonempty S] [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [SecondCountableTopology M] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    ∃ (δ : S → ℝ)
      (chart : PartialDiffeomorph
        (I.prod 𝓘(ℝ, NormalModel (E := E) (F := F))) J
        (TotalSpace (NormalModel (E := E) (F := F)) (quotientNormal f)) M ∞),
      ContMDiff I 𝓘(ℝ, ℝ) ∞ δ ∧ (∀ x, 0 < δ x) ∧
      chart.source = (normalQuotientEquiv f).symm ⁻¹' normalRadiusTube f δ ∧
      (∀ p ∈ chart.source, chart p = normalExponential f ((normalQuotientEquiv f).symm p)) ∧
      (∀ x, chart ⟨x, 0⟩ = f x) := by
  sorry
/-- The full Lee theorem uses actual open subsets; it includes the empty embedded manifold. -/
theorem exists_normalTubeOpenDiffeomorph [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [SecondCountableTopology M] (f : TauCeti.SmoothEmbedding I J ∞ S M) :
    ∃ (δ : S → ℝ) (hδ : ContMDiff I 𝓘(ℝ, ℝ) ∞ δ)
      (U : TopologicalSpace.Opens M)
      (chart : Diffeomorph (I.prod 𝓘(ℝ, NormalModel (E := E) (F := F))) J
        (normalRadiusTubeOpen f δ hδ.continuous) U ∞),
      (∀ x, 0 < δ x) ∧ (∀ x, f x ∈ U) ∧
      (∀ p : normalRadiusTubeOpen f δ hδ.continuous,
        (p.1.2 : TangentSpace J (f p.1.proj)) ∈ TauCeti.Manifold.expDomain J M (f p.1.proj)) ∧
      (∀ p : normalRadiusTubeOpen f δ hδ.continuous, (chart p : M) = normalExponential f p.1) := by
  sorry

end LeeAmbient

section SmoothEuclideanTube
open Bundle
variable {E H M V : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [I.Boundaryless]
  [NormedAddCommGroup V] [InnerProductSpace ℝ V]

/-- The two normal fibre families coincide for the canonical Euclidean metric. -/
theorem orthogonalNormal_map_eq_normalSubspace [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] {n : ℕ∞ω}
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) n M V) (x : M) :
    Submodule.map (NormedSpace.fromTangentSpace (f x)).toLinearEquiv.toLinearMap
      (orthogonalNormal f x) = TauCeti.normalSubspace I (f : M → V) x := by
  sorry

/-- The flat instance of the general smooth normal carrier compares to the native total space. -/
def flatNormalTotalSpaceEquiv [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] {n : ℕ∞ω}
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) n M V) :
    TotalSpace (NormalModel (E := E) (F := V)) (fun x => ↥(orthogonalNormal f x)) ≃ₜ
      TotalSpace V (fun x => TauCeti.normalSubspace I (f : M → V) x) := by
  sorry

theorem flatNormalTotalSpaceEquiv_apply [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] {n : ℕ∞ω}
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) n M V)
    (p : TotalSpace (NormalModel (E := E) (F := V)) (fun x => ↥(orthogonalNormal f x))) :
    (flatNormalTotalSpaceEquiv f p).proj = p.proj ∧
      ((flatNormalTotalSpaceEquiv f p).2 : V) =
        NormedSpace.fromTangentSpace (f p.proj) (p.2 : TangentSpace 𝓘(ℝ, V) (f p.proj)) := by
  sorry

/-- Every positive injective closed-image tube is a smooth diffeomorphism of open subsets,
including empty source and image. -/
theorem exists_smoothEuclideanTubeOpenDiffeomorph [FiniteDimensional ℝ E] [FiniteDimensional ℝ V]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V) (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) :
    ∃ chart : Diffeomorph (I.prod 𝓘(ℝ, NormalModel (E := E) (F := V))) 𝓘(ℝ, V)
      (normalRadiusTubeOpen f (fun _ => ε) continuous_const)
      (⟨Metric.thickening ε (Set.range f), Metric.isOpen_thickening⟩ : TopologicalSpace.Opens V) ∞,
      ∀ p : normalRadiusTubeOpen f (fun _ => ε) continuous_const,
        (chart p : V) = f p.1.proj +
          NormedSpace.fromTangentSpace (f p.1.proj)
            (p.1.2 : TangentSpace 𝓘(ℝ, V) (f p.1.proj)) := by
  sorry

/-- Every injective positive tube for a closed-image embedding has the promised smooth chart. -/
def smoothEuclideanTubeOfInjOn [Nonempty M] [FiniteDimensional ℝ E] [FiniteDimensional ℝ V]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V) (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) :
    PartialDiffeomorph (I.prod 𝓘(ℝ, NormalModel (E := E) (F := V))) 𝓘(ℝ, V)
      (TotalSpace (NormalModel (E := E) (F := V)) (fun x => ↥(orthogonalNormal f x))) V ∞ := by
  sorry

theorem smoothEuclideanTubeOfInjOn_source_target [Nonempty M] [FiniteDimensional ℝ E] [FiniteDimensional ℝ V]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V) (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) :
    (smoothEuclideanTubeOfInjOn f ε hε hclosed hinj).source = normalRadiusTube f (fun _ => ε) ∧
      (smoothEuclideanTubeOfInjOn f ε hε hclosed hinj).target =
        Metric.thickening ε (Set.range f) ∧
      ∀ p ∈ (smoothEuclideanTubeOfInjOn f ε hε hclosed hinj).source,
        smoothEuclideanTubeOfInjOn f ε hε hclosed hinj p = f p.proj +
          NormedSpace.fromTangentSpace (f p.proj)
            (p.2 : TangentSpace 𝓘(ℝ, V) (f p.proj)) := by
  sorry

/-- Compactness supplies one uniform radius; the per-radius theorem above is stronger. -/
theorem exists_smoothEuclideanTube [Nonempty M] [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] [CompactSpace M]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V) :
    ∃ (ε : ℝ) (chart : PartialDiffeomorph
      (I.prod 𝓘(ℝ, NormalModel (E := E) (F := V))) 𝓘(ℝ, V)
      (TotalSpace (NormalModel (E := E) (F := V)) (fun x => ↥(orthogonalNormal f x))) V ∞),
      0 < ε ∧ chart.source = normalRadiusTube f (fun _ => ε) ∧
      chart.target = Metric.thickening ε (Set.range f) ∧
      (∀ p ∈ chart.source, chart p = f p.proj + NormedSpace.fromTangentSpace (f p.proj)
        (p.2 : TangentSpace 𝓘(ℝ, V) (f p.proj))) := by
  sorry
end SmoothEuclideanTube

section C2EuclideanTube
open Bundle
variable {E H M V : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 2 M] [I.Boundaryless]
  [NormedAddCommGroup V] [InnerProductSpace ℝ V]

/-- The C¹ chart for a C² embedding uses the same generic orthogonal carrier at n=2. -/
def c1EuclideanTubeOfInjOn [Nonempty M] [FiniteDimensional ℝ E] [FiniteDimensional ℝ V]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) 2 M V) (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) :
    PartialDiffeomorph (I.prod 𝓘(ℝ, NormalModel (E := E) (F := V))) 𝓘(ℝ, V)
      (TotalSpace (NormalModel (E := E) (F := V)) (fun x => ↥(orthogonalNormal f x))) V 1 := by
  sorry

theorem c1EuclideanTubeOfInjOn_source_target [Nonempty M] [FiniteDimensional ℝ E] [FiniteDimensional ℝ V]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) 2 M V) (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) :
    (c1EuclideanTubeOfInjOn f ε hε hclosed hinj).source = normalRadiusTube f (fun _ => ε) ∧
      (c1EuclideanTubeOfInjOn f ε hε hclosed hinj).target =
        Metric.thickening ε (Set.range f) ∧
      ∀ p ∈ (c1EuclideanTubeOfInjOn f ε hε hclosed hinj).source,
        c1EuclideanTubeOfInjOn f ε hε hclosed hinj p = f p.proj +
          NormedSpace.fromTangentSpace (f p.proj)
            (p.2 : TangentSpace 𝓘(ℝ, V) (f p.proj)) := by
  sorry
/-- Every positive injective closed-image tube is a C¹ diffeomorphism of open subsets,
including empty source and image. -/
theorem exists_c1EuclideanTubeOpenDiffeomorph [FiniteDimensional ℝ E] [FiniteDimensional ℝ V]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) 2 M V) (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) :
    ∃ chart : Diffeomorph (I.prod 𝓘(ℝ, NormalModel (E := E) (F := V))) 𝓘(ℝ, V)
      (normalRadiusTubeOpen f (fun _ => ε) continuous_const)
      (⟨Metric.thickening ε (Set.range f), Metric.isOpen_thickening⟩ : TopologicalSpace.Opens V) 1,
      ∀ p : normalRadiusTubeOpen f (fun _ => ε) continuous_const,
        (chart p : V) = f p.1.proj +
          NormedSpace.fromTangentSpace (f p.1.proj)
            (p.1.2 : TangentSpace 𝓘(ℝ, V) (f p.1.proj)) := by
  sorry

end C2EuclideanTube

section FiniteRegularityEuclideanCharts
variable {E V : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [NormedAddCommGroup V] [InnerProductSpace ℝ V]
  [FiniteDimensional ℝ V]

/-- The single chart Hessian computation, available already for C² maps. -/
theorem euclideanChartSquaredDistanceHessian {g : E → V} {u : E}
    (hg : ContDiffAt ℝ 2 g u) (n : V) (h k : E) :
    (fderiv ℝ (fderiv ℝ (fun z => ‖g z - (g u + n)‖ ^ 2)) u) h k =
      2 * inner ℝ (fderiv ℝ g u h) (fderiv ℝ g u k) -
        2 * inner ℝ n ((fderiv ℝ (fderiv ℝ g) u) h k) := by
  sorry

/-- Differentiate an actual local normal field's orthogonality equation. -/
theorem euclideanChartNormalDerivativePairing {g η : E → V} {u : E}
    (hg : ContDiffAt ℝ 2 g u) (hη : ContDiffAt ℝ 1 η u)
    (hn : ∀ᶠ z in 𝓝 u, η z ∈ (fderiv ℝ g z).rangeᗮ) (h k : E) :
    inner ℝ (fderiv ℝ η u h) (fderiv ℝ g u k) =
      -inner ℝ (η u) ((fderiv ℝ (fderiv ℝ g) u) h k) := by
  sorry
end FiniteRegularityEuclideanCharts

section EuclideanMorseCenters
variable {E H M V : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [T2Space M] [SecondCountableTopology M]
  [NormedAddCommGroup V] [InnerProductSpace ℝ V] [FiniteDimensional ℝ V]
  [I.Boundaryless]

/-- Closed Euclidean embeddings give proper squared distance for every center. -/
theorem euclideanSquaredDistance_isProper [IsManifold I 2 M]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) 2 M V)
    (hclosed : IsClosed (Set.range f)) (a : V) :
    IsProperMap (fun x : M => ‖f x - a‖ ^ 2) := by
  sorry

variable [MeasurableSpace V] [BorelSpace V]

/-- C² is enough for nondegenerate critical points almost everywhere;
the stronger native IsMorse also requires smoothness. -/
theorem ae_nondegenerateCriticalPoints_euclideanSquaredDistance [IsManifold I 2 M]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) 2 M V)
    (ν : MeasureTheory.Measure V) [MeasureTheory.Measure.IsAddHaarMeasure ν] :
    ∀ᵐ a ∂ν, ∀ x : M,
      mfderiv I 𝓘(ℝ, ℝ) (fun y : M => ‖f y - a‖ ^ 2) x = 0 →
        TauCeti.IsManifoldNondegenerateCriticalPoint I (fun y : M => ‖f y - a‖ ^ 2) x := by
  sorry

/-- The same almost-everywhere theorem on the smooth branch uses the native Morse predicate. -/
theorem ae_isMorse_euclideanSquaredDistance [IsManifold I ∞ M]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V)
    (ν : MeasureTheory.Measure V) [MeasureTheory.Measure.IsAddHaarMeasure ν] :
    ∀ᵐ a ∂ν, TauCeti.IsMorse I (fun y : M => ‖f y - a‖ ^ 2) := by
  sorry

end EuclideanMorseCenters


section CWTransport
variable {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]

/-- Transport actual characteristic maps and the weak topology along a homeomorphism. -/
@[instance_reducible]
def cwComplexTransportHomeomorph [CWComplex (Set.univ : Set X)] (h : X ≃ₜ Y) :
    CWComplex (Set.univ : Set Y) := by
  sorry

/-- The relative base is transported by its actual image, rather than by an opaque CW-type label. -/
@[instance_reducible]
def relCWComplexTransportHomeomorph (A : Set X)
    [RelCWComplex (Set.univ : Set X) A] (h : X ≃ₜ Y) :
    RelCWComplex (Set.univ : Set Y) (h '' A) := by
  sorry
variable [CWComplex (Set.univ : Set X)]

/-- A finite set of specified 0-cells gives an actual subcomplex. -/
def finiteZeroCellSubcomplex [T2Space X] (P : Finset X)
    (hP : ∀ x ∈ P, ∃ i : Topology.RelCWComplex.cell (D := ∅) (Set.univ : Set X) 0,
      x ∈ Topology.RelCWComplex.openCell (C := (Set.univ : Set X)) (D := ∅) 0 i) :
    CWComplex.Subcomplex (Set.univ : Set X) := by
  sorry

theorem finiteZeroCellSubcomplex_carrier [T2Space X] (P : Finset X)
    (hP : ∀ x ∈ P, ∃ i : Topology.RelCWComplex.cell (D := ∅) (Set.univ : Set X) 0,
      x ∈ Topology.RelCWComplex.openCell (C := (Set.univ : Set X)) (D := ∅) 0 i) :
    (finiteZeroCellSubcomplex P hP : Set X) = (P : Set X) := by
  sorry

/-- The marked-pair export uses the actual set of marked vertices as relative base. -/
@[instance_reducible]
def markedRelCWComplex [T2Space X] (P : Finset X)
    (hP : ∀ x ∈ P, ∃ i : Topology.RelCWComplex.cell (D := ∅) (Set.univ : Set X) 0,
      x ∈ Topology.RelCWComplex.openCell (C := (Set.univ : Set X)) (D := ∅) 0 i) :
    RelCWComplex (Set.univ : Set X) (P : Set X) := by
  sorry
end CWTransport

section TopologicalMicrobundles

/-- Actual zero-section neighborhoods and centered local product charts.
A Microbundle is a germ object under the isomorphisms specified in comparison3b. -/
structure Microbundle (n : ℕ) (B : Type*) [TopologicalSpace B] where
  total : Type*
  topology : TopologicalSpace total
  zero : @ContinuousMap B total _ topology
  projection : @ContinuousMap total B topology _
  projection_zero : Function.LeftInverse projection zero
  local_product : ∀ b : B, ∃ (U : Set B), IsOpen U ∧ b ∈ U ∧
    ∃ e : @OpenPartialHomeomorph total (B × (Fin n → ℝ)) topology _,
      e.target = U ×ˢ Set.univ ∧
      (∀ a ∈ U, zero a ∈ e.source ∧ e (zero a) = (a, 0)) ∧
      (∀ x ∈ e.source, (e x).1 = projection x)

/-- The neighborhood fiber is an actual subtype of the microbundle's total space. -/
abbrev microbundleNeighborhoodFiber {n : ℕ} {B : Type*} [TopologicalSpace B]
    (ξ : Microbundle n B) (U : Set ξ.total) (b : B) :=
  {x : ξ.total // x ∈ U ∧ ξ.projection x = b}

/-- The induced topology identifies the neighborhood's total space with its source. -/
def microbundleNeighborhoodTotalToSource {n : ℕ} {B : Type*} [TopologicalSpace B]
    (ξ : Microbundle n B) (U : Set ξ.total) :
    Bundle.TotalSpace (Fin n → ℝ) (microbundleNeighborhoodFiber ξ U) → U :=
  fun x => ⟨x.2.val, x.2.property.1⟩

/-- Kister–Mazur produces a native Euclidean FiberBundle inside the germ.
Numerability, zero-preserving charts and the unique germ comparison are
additional explicit comparison3b targets. -/
theorem microbundle_exists_fiberBundleNeighborhood {n : ℕ} {B : Type*}
    [TopologicalSpace B] [T2Space B] [ParacompactSpace B] (ξ : Microbundle n B) :
    letI : TopologicalSpace ξ.total := ξ.topology
    ∃ U : Set ξ.total, IsOpen U ∧ (∀ b, ξ.zero b ∈ U) ∧
      (letI : TopologicalSpace (Bundle.TotalSpace (Fin n → ℝ)
          (microbundleNeighborhoodFiber ξ U)) :=
        TopologicalSpace.induced (microbundleNeighborhoodTotalToSource ξ U) inferInstance
       Nonempty (FiberBundle (Fin n → ℝ) (microbundleNeighborhoodFiber ξ U))) := by
  sorry

/-- TOP(n) uses Mathlib's actual homeomorphism group, with multiplication f∘g. -/
def topGroup (n : ℕ) : Subgroup ((Fin n → ℝ) ≃ₜ (Fin n → ℝ)) where
  carrier := {h | h 0 = 0}
  one_mem' := rfl
  mul_mem' := by
    intro f g hf hg
    change f (g 0) = 0
    rw [hg, hf]
  inv_mem' := by
    intro f hf
    change f 0 = 0 at hf
    change f.symm 0 = 0
    simpa only [hf] using f.symm_apply_apply (0 : Fin n → ℝ)

/-- The topology records both the map and its inverse on native compact-open carriers. -/
def topGroupCompactOpenPair (n : ℕ) (h : topGroup n) :
    ContinuousMap (Fin n → ℝ) (Fin n → ℝ) ×
      ContinuousMap (Fin n → ℝ) (Fin n → ℝ) :=
  (⟨h.val, h.val.continuous⟩, ⟨h.val.symm, h.val.symm.continuous⟩)

instance topGroupTopology (n : ℕ) : TopologicalSpace (topGroup n) :=
  TopologicalSpace.induced (topGroupCompactOpenPair n) inferInstance

/-- Comparison3c supplies the actual continuous group operations. -/
theorem topGroup_isTopologicalGroup (n : ℕ) : IsTopologicalGroup (topGroup n) := by
  sorry

theorem topGroup_continuous_eval (n : ℕ) :
    Continuous (fun p : topGroup n × (Fin n → ℝ) => p.1.val p.2) := by
  sorry

end TopologicalMicrobundles

end

end TauCetiRoadmap.GeometricTopology
