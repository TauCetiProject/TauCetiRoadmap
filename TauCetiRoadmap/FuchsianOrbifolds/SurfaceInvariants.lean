module

public import TauCeti.Analysis.Complex.RiemannSurface.Degree

/-!
# Complex-curve surface invariants

SurfaceTopology Layer 8 owns generic compact-surface classification, models, genus, and Euler
characteristic, and Layer 5 owns generic topological Riemann–Hurwitz. GeometricTopology Layer 1
supplies the smooth finite-CW comparison adapter; PlanarTopology Layers 5, 6 and 8 supply
triangulation, surface Euler/orientation invariance and the category comparison.
This module owns only their typed specialization to the native compact complex-curve carrier.
The admitted definitions are target signatures: their implementation compares the complex curve's underlying oriented smooth surface with the Layer 8
model and the Layer 1 adapter; they do not introduce a second generic surface carrier.
-/

public section

noncomputable section

namespace TauCetiRoadmap.FuchsianOrbifolds.SurfaceInvariants

open scoped ContDiff Manifold

variable {X : Type*} [TopologicalSpace X] [ChartedSpace ℂ X] [T2Space X]
  [CompactSpace X] [ConnectedSpace X] [IsManifold 𝓘(ℂ) 1 X]

/-- SurfaceTopology Layer 8 Euler characteristic specialized to a compact connected complex curve. -/
noncomputable def surfaceEulerCharacteristic (X : Type*) [TopologicalSpace X]
    [ChartedSpace ℂ X] [T2Space X] [CompactSpace X] [ConnectedSpace X]
    [IsManifold 𝓘(ℂ) 1 X] : ℤ := by
  sorry

/-- SurfaceTopology Layer 8 genus specialized to a compact connected complex curve. -/
noncomputable def genus (X : Type*) [TopologicalSpace X] [ChartedSpace ℂ X] [T2Space X]
    [CompactSpace X] [ConnectedSpace X] [IsManifold 𝓘(ℂ) 1 X] : ℕ := by
  sorry

/-- Closed oriented surface relation for the complex-curve specialization of SurfaceTopology Layer 8. -/
theorem surfaceEulerCharacteristic_eq_two_sub_two_mul_genus :
    surfaceEulerCharacteristic X = 2 - 2 * (genus X : ℤ) := by
  sorry

end TauCetiRoadmap.FuchsianOrbifolds.SurfaceInvariants
