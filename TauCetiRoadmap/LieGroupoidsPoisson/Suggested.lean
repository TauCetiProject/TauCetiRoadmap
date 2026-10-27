import Mathlib
import TauCeti.Geometry.Manifold.Distribution
import TauCeti.Geometry.Lie.RightInvariantVectorField

/-!
# Lie algebroids, Lie groupoids, and Poisson geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, those headline theorems of the roadmap that are statable there: the regular-fiber
theorem and the submersion comparisons of G0.1 on which every Lie-groupoid atlas rests, and the
right-invariant bracket sign of G2.2 that fixes the bracket of the algebroid of a Lie group.

The following headline theorems are not statable at the pins and are not stated here.

* The Crainic–Fernandes integrability criterion (G5.5), Lie II for algebroid morphisms (G5.4) and
  the nonintegrable central extension on `S² × S²` (G5.6): there is no Lie algebroid carrier
  (a smooth vector bundle whose smooth sections carry a Lie–Rinehart structure with a bundle-map
  anchor) and no Lie groupoid carrier, because the composable pairs of a groupoid have no smooth
  fiber-product structure on which multiplication could be required to be smooth.
* The Stefan–Sussmann orbit theorem (G2.4) and the symplectic-leaf decomposition of a Poisson
  manifold (G4.5): there is no carrier for the leaf topology and immersed-manifold structure of a
  singular foliation, and no bivector-field carrier for a Poisson structure.
* The symplectic integration theorem for Poisson manifolds (G6.4): it needs the Lie groupoid
  carrier, the Poisson bivector carrier and multiplicative two-forms on the arrow manifold.
* The groupoid form of Marsden–Weinstein reduction (G7.4): it needs smooth groupoid actions,
  which are maps out of the same missing fiber product.
-/

open scoped Manifold ContDiff

namespace TauCetiRoadmap.LieGroupoidsPoisson

/-- G0.1: `f` is a submersion at `x` in the sense of differentials, meaning that its manifold
derivative at `x` has a continuous linear right inverse. This is the right-inverse analogue of
Mathlib's `IsDiffImmersionAt`, and the predicate is meaningful for arbitrary models with
corners. -/
def IsDiffSubmersionAt {E F H K X Y : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [TopologicalSpace H] [TopologicalSpace K]
    [TopologicalSpace X] [TopologicalSpace Y] [ChartedSpace H X] [ChartedSpace K Y]
    (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ F K) (f : X → Y) (x : X) : Prop :=
  (mfderiv I J f x).HasRightInverse

/-- G0.1, regular-fiber theorem: if `f : X → Y` is a smooth map of boundaryless manifolds of
dimensions `n` and `m` and every point of the fiber over `c` is a regular point, then the fiber
`{x // f x = c}`, with its subspace topology, carries a smooth atlas of dimension `n - m` for
which the inclusion is a smooth embedding whose tangent image at each point is the kernel of the
derivative of `f`. No Hausdorff hypothesis is made on `X`, and the fiber may be empty
(Lee, *Introduction to Smooth Manifolds*, 2nd ed., Corollary 5.14 and Proposition 5.38, for the
Hausdorff case). -/
theorem exists_regularFiber_manifold {n m : ℕ} {X Y : Type*}
    [TopologicalSpace X] [ChartedSpace (Fin n → ℝ) X] [IsManifold 𝓘(ℝ, Fin n → ℝ) ∞ X]
    [TopologicalSpace Y] [ChartedSpace (Fin m → ℝ) Y] [IsManifold 𝓘(ℝ, Fin m → ℝ) ∞ Y]
    (f : X → Y) (c : Y) (hf : ContMDiff 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f)
    (hreg : ∀ x, f x = c →
      Function.Surjective (mfderiv 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f x)) :
    ∃ cs : ChartedSpace (Fin (n - m) → ℝ) {x : X // f x = c},
      letI := cs
      IsManifold 𝓘(ℝ, Fin (n - m) → ℝ) ∞ {x : X // f x = c} ∧
      Manifold.IsSmoothEmbedding 𝓘(ℝ, Fin (n - m) → ℝ) 𝓘(ℝ, Fin n → ℝ) ∞
        (Subtype.val : {x : X // f x = c} → X) ∧
      ∀ z : {x : X // f x = c},
        (mfderiv 𝓘(ℝ, Fin (n - m) → ℝ) 𝓘(ℝ, Fin n → ℝ) Subtype.val z).range =
          (mfderiv 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f z.1).ker := by
  sorry

/-- G0.1: for a smooth map between boundaryless finite-dimensional manifolds, Mathlib's
normal-form submersion predicate holds exactly when the derivative has a continuous right
inverse at every point. -/
theorem submersion_iff_split_mfderiv {n m : ℕ} {X Y : Type*}
    [TopologicalSpace X] [ChartedSpace (Fin n → ℝ) X] [IsManifold 𝓘(ℝ, Fin n → ℝ) ∞ X]
    [TopologicalSpace Y] [ChartedSpace (Fin m → ℝ) Y] [IsManifold 𝓘(ℝ, Fin m → ℝ) ∞ Y]
    (f : X → Y) (hf : ContMDiff 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f) :
    Manifold.IsSubmersion 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f ↔
      ∀ x, IsDiffSubmersionAt 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f x := by
  sorry

/-- G0.1: the tangent kernels of a submersion between boundaryless manifolds of dimensions `n`
and `m` form a smooth distribution of rank `n - m` in Tau Ceti's sense. This is the
source-vertical bundle from which the algebroid of a Lie groupoid is cut out in G2.1. -/
theorem submersionKernel_smooth {n m : ℕ} {X Y : Type*}
    [TopologicalSpace X] [ChartedSpace (Fin n → ℝ) X] [IsManifold 𝓘(ℝ, Fin n → ℝ) ∞ X]
    [TopologicalSpace Y] [ChartedSpace (Fin m → ℝ) Y] [IsManifold 𝓘(ℝ, Fin m → ℝ) ∞ Y]
    (f : X → Y) (hf : Manifold.IsSubmersion 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f) :
    TauCeti.IsContMDiffDistribution 𝓘(ℝ, Fin n → ℝ) ∞ (n - m)
      (fun x => (mfderiv 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f x).ker) := by
  sorry

/-- G2.2: on a Lie group, the bracket of the right-invariant vector fields extending `ξ` and
`η` is minus the right-invariant field of their bracket in Mathlib's `GroupLieAlgebra`, which is
defined through left-invariant fields. Hence the algebroid of a group viewed as a groupoid over a
point is the opposite Lie algebra, identified with `GroupLieAlgebra` by `v ↦ -v`. -/
theorem rightInvariant_bracket {E H G : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [CompleteSpace E] [TopologicalSpace H] [TopologicalSpace G] [ChartedSpace H G]
    (I : ModelWithCorners ℝ E H) [Group G] [LieGroup I ∞ G] [BoundarylessManifold I G]
    (ξ η : GroupLieAlgebra I G) :
    VectorField.mlieBracket I (mulRightInvariantVectorField ξ)
      (mulRightInvariantVectorField η) = -mulRightInvariantVectorField ⁅ξ, η⁆ := by
  sorry

end TauCetiRoadmap.LieGroupoidsPoisson
