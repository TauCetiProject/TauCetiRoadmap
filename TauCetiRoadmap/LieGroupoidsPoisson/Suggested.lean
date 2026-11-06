import Mathlib
import TauCeti.Geometry.Lie.RightInvariantVectorField

/-!
# Lie algebroids, Lie groupoids and Poisson geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, those headline theorems of the roadmap that are statable there: the comparison of
Mathlib's normal-form submersion predicate with the split-derivative predicate (§G0.1), on which
the Lie-groupoid atlas rests, and the right-invariant bracket sign (§G2.2) that fixes the bracket
of the algebroid of a Lie group. Regular fibres, fibre products and the kernel bundle of a
submersion are SmoothBundlesConnections B1.0's and are not stated here.

The following headline theorems are not statable at the pins and are not stated here.

* The Crainic–Fernandes integrability criterion (§G5.5), Lie II for algebroid morphisms (§G5.4)
  and the nonintegrable central extension on `S² × S²` (§G5.6): there is no Lie algebroid carrier
  (a smooth vector bundle whose smooth sections carry a Lie–Rinehart structure with a bundle-map
  anchor) and no Lie groupoid carrier, because the composable pairs of a groupoid have no smooth
  fibre-product structure on which multiplication could be required to be smooth.
* The orbit theorem (§G2.4) and the symplectic-leaf decomposition of a Poisson manifold (§G4.5):
  there is no carrier for the leaf topology and immersed-manifold structure of a singular
  foliation, and no bivector-field carrier for a Poisson structure.
* The symplectic integration theorem for Poisson manifolds (§G6.4): it needs the Lie groupoid
  carrier, the Poisson bivector carrier and multiplicative two-forms on the arrow manifold.
* The groupoid side of the reduction comparison (§G7.4): it needs smooth groupoid actions, which
  are maps out of the same missing fibre product.
-/

open scoped Manifold ContDiff

namespace TauCetiRoadmap.LieGroupoidsPoisson

/-! ## Layer 0: Topological groupoids and smooth foundations -/

/-- §G0.1: `f` is a submersion at `x` in the sense of differentials, meaning that its manifold
derivative at `x` has a continuous linear right inverse. This is the right-inverse analogue of
Mathlib's `IsDiffImmersionAt`, and the predicate is meaningful for arbitrary models with
corners. -/
def IsDiffSubmersionAt {E F H K X Y : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [TopologicalSpace H] [TopologicalSpace K]
    [TopologicalSpace X] [TopologicalSpace Y] [ChartedSpace H X] [ChartedSpace K Y]
    (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ F K) (f : X → Y) (x : X) : Prop :=
  (mfderiv I J f x).HasRightInverse

/-- §G0.1: for a smooth map between boundaryless finite-dimensional manifolds, Mathlib's
normal-form submersion predicate holds exactly when the derivative has a continuous right
inverse at every point. The forward direction uses no smoothness; the backward direction uses
`hf` and the inverse function theorem. -/
theorem submersion_iff_split_mfderiv {n m : ℕ} {X Y : Type*}
    [TopologicalSpace X] [ChartedSpace (Fin n → ℝ) X] [IsManifold 𝓘(ℝ, Fin n → ℝ) ∞ X]
    [TopologicalSpace Y] [ChartedSpace (Fin m → ℝ) Y] [IsManifold 𝓘(ℝ, Fin m → ℝ) ∞ Y]
    (f : X → Y) (hf : ContMDiff 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f) :
    Manifold.IsSubmersion 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f ↔
      ∀ x, IsDiffSubmersionAt 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f x := by
  sorry

/-! ## Layer 2: Differentiation, orbits and representations -/

/-- §G2.2: on a Lie group, the bracket of the right-invariant vector fields extending `ξ` and
`η` is minus the right-invariant field of their bracket in Mathlib's `GroupLieAlgebra`, which is
defined through left-invariant fields. Hence the algebroid of a group viewed as a groupoid over a
point is the opposite Lie algebra, identified with `GroupLieAlgebra` by `v ↦ -v`. Witness: on the
affine group `(a,b)(a',b') = (aa', ab' + b)` the right-invariant fields `a ∂_a + b ∂_b` and
`∂_b` bracket to `-∂_b`. -/
theorem rightInvariant_bracket {E H G : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [CompleteSpace E] [TopologicalSpace H] [TopologicalSpace G] [ChartedSpace H G]
    (I : ModelWithCorners ℝ E H) [Group G] [LieGroup I ∞ G] [BoundarylessManifold I G]
    (ξ η : GroupLieAlgebra I G) :
    VectorField.mlieBracket I (mulRightInvariantVectorField ξ)
      (mulRightInvariantVectorField η) = -mulRightInvariantVectorField ⁅ξ, η⁆ := by
  sorry

end TauCetiRoadmap.LieGroupoidsPoisson
