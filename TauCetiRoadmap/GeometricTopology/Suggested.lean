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
targets use the existing quotient and projection carriers, and the nearest-point
retraction is stated as an existence theorem on the open thickening. The remaining
geometric and smooth extensions are specified by the README; this file's
illustrative signatures do not certify their completion.

Not statable at the pins:
* the smooth tubular neighbourhood theorem in its diffeomorphism forms (Lee's theorem
  for a general Riemannian ambient manifold, its quotient-bundle transport, the smooth
  and C¹ Euclidean tube charts, and the smoothness of the normal exponential on its
  natural domain). Each needs a smooth manifold structure on the total space of the
  orthogonal or quotient normal bundle of an embedding, that is, `FiberBundle`,
  `VectorBundle` and `ContMDiffVectorBundle` instances for a subbundle or quotient
  bundle of a smooth vector bundle. Neither Mathlib nor Tau Ceti constructs these at
  the pins, and the construction is a Layer 1 target of the README;
* the transport of CW and relative CW structures along a homeomorphism, and the
  subcomplex and relative structure carried by finitely many marked 0-cells. These are
  data constructions (characteristic maps and cells) that the pinned
  `Topology.CWComplex` does not provide, and they are Layer 11 targets of the README.

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

section EuclideanTubular

variable {E H M V : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M]
  [NormedAddCommGroup V] [InnerProductSpace ℝ V]

/-- The intrinsic quotient normal space agrees with the Euclidean orthogonal model: there is a
continuous linear equivalence sending the class of `v` to its orthogonal projection onto the
normal subspace. -/
theorem exists_normalSpaceOrthogonalEquiv [FiniteDimensional ℝ E] [FiniteDimensional ℝ V]
    [IsManifold I ∞ M] [I.Boundaryless]
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V) (x : M) :
    ∃ e : f.NormalSpace x (by simp) ≃L[ℝ] TauCeti.normalSubspace I (f : M → V) x,
      ∀ v : V, e (f.normalClass x (by simp) v) =
        (TauCeti.normalSubspace I (f : M → V) x).orthogonalProjectionOnto v := by
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

/-- For a closed-image smooth Euclidean embedding and any positive radius on whose normal tube
the addition map is injective, the open thickening carries a smooth nearest-point retraction `r`:
`f (r y)` minimises the distance to `y`, and `(r y, y - f (r y))` lies in the normal tube. -/
theorem exists_nearestPoint [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] [IsManifold I ∞ M]
    [I.Boundaryless] (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V)
    (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) :
    ∃ r : nearestPointDomain f ε → M,
      ContMDiff 𝓘(ℝ, V) I ∞ r ∧
      (∀ (y : nearestPointDomain f ε) (z : M), ‖(y : V) - f (r y)‖ ≤ ‖(y : V) - f z‖) ∧
      (∀ y : nearestPointDomain f ε,
        ((r y, (y : V) - f (r y)) : M × V) ∈ TauCeti.normalTube I f ε) := by
  sorry

/-- Under the same hypotheses the addition map is a homeomorphism from the normal tube onto the
open thickening. -/
theorem exists_euclideanTubeEquiv [FiniteDimensional ℝ E] [FiniteDimensional ℝ V]
    [IsManifold I ∞ M] [I.Boundaryless] (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, V) ∞ M V)
    (ε : ℝ) (hε : 0 < ε)
    (hclosed : IsClosed (Set.range f))
    (hinj : Set.InjOn (fun p : M × V => f p.1 + p.2) (TauCeti.normalTube I f ε)) :
    ∃ e : TauCeti.normalTube I f ε ≃ₜ nearestPointDomain f ε,
      ∀ q : TauCeti.normalTube I f ε, (e q : V) = f q.1.1 + q.1.2 := by
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

/-- An open radius tube in the actual general normal bundle. -/
def normalRadiusTube [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] {n : ℕ∞ω} (f : TauCeti.SmoothEmbedding I J n S M) (δ : S → ℝ) :
    Set (TotalSpace (NormalModel (E := E) (F := F)) (fun x => ↥(orthogonalNormal f x))) :=
  {p | ‖(p.2 : TangentSpace J (f p.proj))‖ < δ p.proj}

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

end GeneralAmbient

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

end SmoothEuclideanTube

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
