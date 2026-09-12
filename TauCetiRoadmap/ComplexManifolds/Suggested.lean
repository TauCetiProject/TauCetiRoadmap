import Mathlib.Analysis.Complex.Basic
import Mathlib.Geometry.Manifold.Instances.Quotient
import Mathlib.Geometry.Manifold.LocalDiffeomorph
import Mathlib.Geometry.Manifold.VectorBundle.Pullback
import Mathlib.LinearAlgebra.Complex.Orientation
import Mathlib.Topology.Compactification.OnePoint.ProjectiveLine
import Mathlib.Topology.Gluing

/-!
# Complex manifolds, quotients, bundles, and gluing: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These declarations suggest Lean forms for representative load-bearing interfaces.
The roadmap also requires the full basic API, compatibility, and naturality described there.

Missing compatibility conditions are not represented by empty `Prop` wrappers. In particular,
the open-gluing theorem will state compatibility directly in Mathlib's structure-groupoid
vocabulary once its input signature is implemented.
-/

namespace TauCetiRoadmap.ComplexManifolds

open Topology
open scoped ContDiff Manifold

/-! ## Existing carriers which the roadmap extends -/

/-- Open gluing keeps Mathlib's glued carrier and canonical inclusions. -/
example (D : TopCat.GlueData) (i : D.J) : IsOpenEmbedding (D.toGlueData.ι i) :=
  D.ι_isOpenEmbedding i

/-- Free properly discontinuous quotients keep Mathlib's standard orbit quotient. -/
noncomputable example {M G H : Type*} [TopologicalSpace M] [Group G] [MulAction G M]
    [ProperlyDiscontinuousSMul G M] [ContinuousConstSMul G M] [IsCancelSMul G M]
    [T2Space M] [LocallyCompactSpace M] [TopologicalSpace H] [ChartedSpace H M] :
    ChartedSpace H (MulAction.orbitRel.Quotient G M) :=
  inferInstance

/-! ## Named atlas transport -/

/-- Pull a charted-space structure back along a homeomorphism. The roadmap develops this in the
shape of mathlib4#42847 and proves composition, inverse, and groupoid-transport laws. -/
@[instance_reducible]
noncomputable def pullbackChartedSpace {H M N : Type*} [TopologicalSpace H]
    [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace H N] (e : M ≃ₜ N) :
    ChartedSpace H M := by
  sorry

/-- A manifold structure transports with the named atlas. Use this through a local or scoped
instance when a carrier supports more than one transported atlas. -/
theorem pullback_isManifold {𝕜 E H M N : Type*} {n : ℕ∞} [NontriviallyNormedField 𝕜]
    [NormedAddCommGroup E] [NormedSpace 𝕜 E] [TopologicalSpace H]
    (I : ModelWithCorners 𝕜 E H) [TopologicalSpace M] [TopologicalSpace N] [ChartedSpace H N]
    [IsManifold I n N] (e : M ≃ₜ N) :
    @IsManifold 𝕜 _ E _ _ H _ I n M _ (pullbackChartedSpace e) := by
  sorry

/-! ## Restriction of scalars and canonical orientation -/

/-- Complex differentiability implies smoothness for the realified models on the same carriers. -/
theorem contMDiff_real_of_complex {E F M N : Type*} [NormedAddCommGroup E]
    [NormedSpace ℂ E] [NormedAddCommGroup F] [NormedSpace ℂ F] [TopologicalSpace M]
    [TopologicalSpace N] [ChartedSpace E M] [ChartedSpace F N]
    (f : M → N) (hf : ContMDiff 𝓘(ℂ, E) 𝓘(ℂ, F) ∞ f) :
    ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, F) ∞ f := by
  sorry

/-- The canonical orientation of a finite-dimensional complex model, expressed in Mathlib's
existing real `Orientation` carrier. The manifold construction transports this through charts and
then compares it literally with the shared manifold-orientation API. -/
noncomputable def complexModelOrientation (E : Type*) [NormedAddCommGroup E] [NormedSpace ℂ E]
    [FiniteDimensional ℂ E] : Orientation ℝ E (Fin (2 * Module.finrank ℂ E)) := by
  sorry

/-! ## The Riemann sphere on `OnePoint ℂ` -/

/-- The two-chart complex atlas on Mathlib's existing one-point compactification. -/
@[instance_reducible]
noncomputable def riemannSphereChartedSpace : ChartedSpace ℂ (OnePoint ℂ) := by
  sorry

/-- The named atlas is an integrable one-dimensional complex-manifold atlas. -/
theorem riemannSphere_isManifold :
    letI := riemannSphereChartedSpace
    IsManifold 𝓘(ℂ, ℂ) ∞ (OnePoint ℂ) := by
  sorry

/-! ## Complex quotients by biholomorphic actions -/

section ComplexQuotient

variable {E M G : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
  [TopologicalSpace M] [Group G] [MulAction G M] [ProperlyDiscontinuousSMul G M]
  [ContinuousConstSMul G M] [IsCancelSMul G M] [T2Space M] [LocallyCompactSpace M]
  [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]

/-- After consuming Mathlib's quotient-manifold structure, the orbit projection is a local
biholomorphism. This is not a theorem about a separate projection from the quotient to an unrelated
base. -/
theorem quotientMk_isLocalBiholomorph
    (_holo : ∀ g : G, ContMDiff 𝓘(ℂ, E) 𝓘(ℂ, E) ∞ fun x : M ↦ g • x) :
    IsLocalDiffeomorph 𝓘(ℂ, E) 𝓘(ℂ, E) ∞
      (Quotient.mk (MulAction.orbitRel G M)) := by
  sorry

end ComplexQuotient

/-! ## Compatible open gluing -/

/-- The architecture-defining gluing target keeps `TopCat.GlueData.glued`. The two hypotheses say
that the chosen atlas on every overlap is compatible with both adjacent piece atlases: first along
`D.f i j`, then along the canonical right inclusion `x ↦ D.f j i (D.t i j x)`. Merely requiring
`D.t i j` to be smooth between independently chosen overlap atlases would not imply this. -/
@[instance_reducible]
noncomputable def gluedChartedSpace {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [TopologicalSpace H] (I : ModelWithCorners ℂ E H) (D : TopCat.GlueData)
    [∀ i, ChartedSpace H (D.U i)] [∀ i, ChartedSpace H (D.V i)]
    (_left : ∀ i j, IsLocalDiffeomorph I I ∞ (D.f i j))
    (_right : ∀ i j, IsLocalDiffeomorph I I ∞
      (fun x : D.V (i, j) ↦ D.f j i (D.t i j x))) :
    ChartedSpace H D.toGlueData.glued := by
  sorry

/-- Hausdorffness is controlled by the closedness of the full equivalence relation `D.Rel` on
the disjoint union, not by separate closed-graph tests for the generating overlaps. -/
theorem glued_t2Space_of_isClosed_rel (D : TopCat.GlueData)
    [∀ i, T2Space (D.U i)]
    (_hrel : IsClosed {p : (Σ i, D.U i) × (Σ i, D.U i) | D.Rel p.1 p.2}) :
    T2Space D.toGlueData.glued := by
  sorry

/-! ## Holomorphic vector bundles -/

/-- A holomorphic vector bundle uses Mathlib's existing fixed-fibre vector-bundle carrier. Over a
complex model its transition maps are holomorphic exactly when it is a complex `C^∞` vector
bundle. Finite-rank operations add `[FiniteDimensional ℂ F]` at their declarations. -/
abbrev HolomorphicVectorBundle {EB HB B F : Type*} [NormedAddCommGroup EB] [NormedSpace ℂ EB]
    [TopologicalSpace HB] (IB : ModelWithCorners ℂ EB HB) [TopologicalSpace B]
    [ChartedSpace HB B] [NormedAddCommGroup F] [NormedSpace ℂ F]
    (V : B → Type*) [∀ x, AddCommMonoid (V x)] [∀ x, Module ℂ (V x)]
    [∀ x, TopologicalSpace (V x)] [TopologicalSpace (Bundle.TotalSpace F V)] [FiberBundle F V]
    [VectorBundle ℂ F V] : Prop :=
  ContMDiffVectorBundle ∞ F V IB

/-- The normal fibre of a complex submanifold is the quotient by the image of its complex-linear
differential. The roadmap promotes this fibrewise construction to a holomorphic quotient bundle. -/
abbrev complexNormalFiber {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    (T : Submodule ℂ E) := E ⧸ T

/-- Injectivity of the character-to-Picard map is the public hypothesis which upgrades divisibility
of the associated bundle's tensor order to exactness. -/
theorem associatedBundle_hasExactOrder_of_injective {C P : Type*} [Group C] [Group P]
    (associated : C →* P) (hassociated : Function.Injective associated) (χ : C) (m : ℕ)
    (hm : orderOf χ = m) : orderOf (associated χ) = m := by
  sorry

end TauCetiRoadmap.ComplexManifolds
