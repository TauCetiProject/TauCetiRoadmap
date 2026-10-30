import Mathlib.Basic.Real.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.Topology.OpenPartialHomeomorph.Defs

/-!
Suggested forms are aids; the README is definitive and this file is not exhaustive.
These targets describe the linear and chart steps of T1.1. The metric-preserving
manifold action, polar construction and exponential chart are specified in the README.
The acting group carries no topology and is not assumed compact.
-/
noncomputable section
namespace TauCetiRoadmap.SymplecticGeometry.FixedLocus

variable {K V : Type*} [Group K] [AddCommGroup V] [Module ℝ V]

/-- The common fixed submodule is stable under every commuting linear endomorphism. -/
theorem invariants_stable (ρ : Representation ℝ K V) (J : V →ₗ[ℝ] V)
    (hcomm : ∀ k v, ρ k (J v) = J (ρ k v)) :
    ∀ v ∈ ρ.invariants, J v ∈ ρ.invariants := by
  sorry

/-- Positivity against J proves both separating properties on the actual fixed submodule. -/
theorem invariants_symplectic (ρ : Representation ℝ K V)
    (ω : LinearMap.BilinForm ℝ V) (hω : ω.IsAlt) (J : V →ₗ[ℝ] V)
    (hJ : J.comp J = -LinearMap.id)
    (hpositive : ∀ v : V, v ≠ 0 → 0 < ω v (J v))
    (hcomm : ∀ k v, ρ k (J v) = J (ρ k v)) :
    (ω.restrict ρ.invariants).Nondegenerate := by
  sorry

section Chart
variable {M : Type*} [TopologicalSpace V] [TopologicalSpace M] [MulAction K M]

/-- On an invariant exponential-chart ball, common fixed points are exactly invariant vectors. -/
theorem fixed_iff_chart_invariant (ρ : Representation ℝ K V)
    (e : OpenPartialHomeomorph V M)
    (hsource : ∀ k v, v ∈ e.source → ρ k v ∈ e.source)
    (hequiv : ∀ k v, v ∈ e.source → e (ρ k v) = k • e v)
    (v : V) (hv : v ∈ e.source) :
    (∀ k : K, k • e v = e v) ↔ v ∈ ρ.invariants := by
  sorry
end Chart
end TauCetiRoadmap.SymplecticGeometry.FixedLocus
