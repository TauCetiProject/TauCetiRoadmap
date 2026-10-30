module

public import Mathlib.Geometry.Manifold.Instances.Sphere
public import Mathlib.Geometry.Manifold.Diffeomorph
public import Mathlib.AlgebraicTopology.FundamentalGroupoid.SimplyConnected
public import Mathlib.Analysis.SpecialFunctions.Pow.Deriv

/-!
# Three-dimensional Poincaré: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; its P1--P15 sections specify every required layer and predecessor.
The statements here suggest Lean forms for selected interfaces, so that contributors
and reviewers converge on names and signatures. Discharging the declarations here
finishes neither a layer nor the roadmap.

The admitted declarations are mathematical targets. The README specifies the
intermediate Ricci-flow, surgery, and width objects; further prototypes should
expose their data and laws at the major layer interfaces. The endpoint signatures
quantify over closed simply connected manifolds, with smoothness assumed for P13.
-/

@[expose] public section

open scoped Manifold ContDiff
open Metric (sphere)

namespace TauCetiRoadmap.Poincare3D

/-- P1: compact charted three-manifolds have the countability needed by the analytic layers. -/
theorem secondCountable_closed_three_manifold {M : Type*} [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [CompactSpace M] :
    SecondCountableTopology M :=
  ChartedSpace.secondCountable_of_sigmaCompact (EuclideanSpace ℝ (Fin 3)) M

/-- P11: the exact scalar comparison profile for normalized initial width `w₀`. -/
noncomputable def extinctionBarrier (w₀ t : ℝ) : ℝ :=
  (w₀ + 2 * Real.pi) * (1 + 4 * t) ^ ((3 : ℝ) / 4) -
    2 * Real.pi * (1 + 4 * t)

/-- P11: normalization check for the width comparison ODE. -/
theorem hasDerivAt_extinctionBarrier (w₀ : ℝ) {t : ℝ} (ht : 0 ≤ t) :
    HasDerivAt (extinctionBarrier w₀)
      (-2 * Real.pi + 3 * extinctionBarrier w₀ t / (1 + 4 * t)) t := by
  sorry

/-- P11: the comparison profile eventually contradicts nonnegative surviving width. -/
theorem extinctionBarrier_eventually_negative (w₀ : ℝ) :
    ∃ T : ℝ, 0 < T ∧ ∀ t : ℝ, T ≤ t → extinctionBarrier w₀ t < 0 := by
  sorry

/-- P13: the smooth three-dimensional Poincaré theorem, on the native sphere. -/
theorem poincare_3d_smooth {M : Type*} [TopologicalSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [IsManifold (𝓡 3) ∞ M]
    [SimplyConnectedSpace M] [CompactSpace M] :
    Nonempty (M ≃ₘ⟮𝓡 3, 𝓡 3⟯ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  sorry

/-- P14: a compatible smooth atlas exists on the original topological carrier. -/
theorem smoothable_closed_three_manifold {M : Type*} [TopologicalSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M] [CompactSpace M] [ConnectedSpace M] :
    ∃ atlas : ChartedSpace (EuclideanSpace ℝ (Fin 3)) M,
      letI : ChartedSpace (EuclideanSpace ℝ (Fin 3)) M := atlas
      IsManifold (𝓡 3) ∞ M := by
  sorry

/-- P15: transport through the chosen compatible atlas preserves the exact topological target. -/
theorem poincare_3d_topological {M : Type*} [TopologicalSpace M] [T2Space M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 3)) M]
    [SimplyConnectedSpace M] [CompactSpace M] :
    Nonempty (M ≃ₜ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1) := by
  obtain ⟨atlas, hSmooth⟩ := smoothable_closed_three_manifold (M := M)
  let : ChartedSpace (EuclideanSpace ℝ (Fin 3)) M := atlas
  let : IsManifold (𝓡 3) ∞ M := hSmooth
  obtain ⟨e⟩ := poincare_3d_smooth (M := M)
  exact ⟨e.toHomeomorph⟩

end TauCetiRoadmap.Poincare3D
