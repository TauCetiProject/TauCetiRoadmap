import Mathlib
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Scalar
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume

/-!
# Asymptotically Euclidean geometry and positive mass: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, with only the definitions those statements
need: the coordinate ADM flux, the metric coefficients in an end chart, an asymptotically
Euclidean end and a finite nonempty family of such ends with compact remainder.

Stated here: the nonspin positive-mass theorem P8.1 in dimensions `3 ≤ n ≤ 7`, as nonnegativity
of the mass of every end and Euclidean rigidity at a zero-mass end. The manifold carries
Mathlib's Riemannian distance (`IsRiemannianManifold`), and scalar curvature and volume are
Tau Ceti's `CovariantDerivative.scalarCurvature` of Mathlib's
`CovariantDerivative.leviCivitaConnection` and `TauCeti.riemannianVolume`.

Not statable at the pins:
* P8.2 (finite-ended spin theorem in every dimension `n ≥ 3`) and P8.3 (spin theorem for one
  asymptotically Euclidean end with arbitrary other complete ends): there is no spin structure
  on a Riemannian manifold, that is no `Spin(n)` lift of the oriented orthonormal frame bundle;
  the pins have the algebraic spin group only.
* P3.1's torus obstruction (a closed oriented `d`-manifold, `3 ≤ d ≤ 7`, with a nonzero-degree
  map to `T^d` carries no metric of positive scalar curvature): the degree of a map between
  closed oriented manifolds is absent.
* P1's weighted Fredholm theorems, P1.3's round spinor spectrum and P6.1's Callias solvability:
  weighted Sobolev spaces of sections of a bundle over a manifold, and the spinor bundle with
  its Dirac operator, are absent.
-/

noncomputable section

open MeasureTheory Filter Bundle
open scoped Topology Manifold ContDiff

namespace TauCetiRoadmap.PositiveMass

/-! ## Layer 0: ends, decay and the mass functional -/

/-- The integrand of the coordinate ADM flux through the Euclidean sphere of radius `r`: for
coefficients `g i j` on `ℝⁿ` it is `Σ_j (Σ_i (∂_i g_ij − ∂_j g_ii)) x_j / r`, the outward
Euclidean unit normal being `x / r`. -/
def coordinateFluxIntegrand (n : ℕ) (g : EuclideanSpace ℝ (Fin n) → Fin n → Fin n → ℝ)
    (r : ℝ) (x : EuclideanSpace ℝ (Fin n)) : ℝ :=
  ∑ j, (∑ i, (
    fderiv ℝ (fun y => g y i j) x (EuclideanSpace.basisFun (Fin n) ℝ i) -
      fderiv ℝ (fun y => g y i i) x (EuclideanSpace.basisFun (Fin n) ℝ j))) *
        (x j / r)

/-- The normalized coordinate ADM flux at radius `r`: the flux integral over the sphere of
radius `r` divided by `2 (n − 1)` times the area of the unit sphere (Cecchini–Zeidler,
equation (2.1)). Both areas use the same normalized Hausdorff measure, so its normalization
constant cancels. The ADM mass of an end is the limit of this quantity as `r → ∞`. -/
def normalizedCoordinateFlux (n : ℕ) (g : EuclideanSpace ℝ (Fin n) → Fin n → Fin n → ℝ)
    (r : ℝ) : ℝ :=
  (∫ x in Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) r,
      coordinateFluxIntegrand n g r x
      ∂(Measure.euclideanHausdorffMeasure (n - 1))) /
    (2 * ((n : ℝ) - 1) *
      ((Measure.euclideanHausdorffMeasure (n - 1) : Measure (EuclideanSpace ℝ (Fin n)))
        (Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1)).toReal)

/-- The coefficients `g_ij(x) = g(∂_i, ∂_j)` at `φ x` of the Riemannian metric of `M` in the
coordinates given by a parametrization `φ : ℝⁿ → M`, the coordinate vectors being pushed forward
by the manifold derivative of `φ`. -/
def pullbackMetricCoeff {n : ℕ} {M : Type*} [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [RiemannianBundle (fun x : M ↦ TangentSpace (𝓡 n) x)]
    (φ : EuclideanSpace ℝ (Fin n) → M) (x : EuclideanSpace ℝ (Fin n)) (i j : Fin n) : ℝ :=
  inner ℝ (mfderiv (𝓡 n) (𝓡 n) φ x (EuclideanSpace.basisFun (Fin n) ℝ i))
    (mfderiv (𝓡 n) (𝓡 n) φ x (EuclideanSpace.basisFun (Fin n) ℝ j))

/-- An asymptotically Euclidean end of `M` of order `t`: a smooth parametrization of an open
subset of `M` by the exterior `{x : ‖x‖ > R}` of a ball, injective with bijective derivative
there (hence a diffeomorphism onto its open image), in which the metric coefficients satisfy
`|∂^α (g_ij − δ_ij)| ≤ C ‖x‖^(−t−|α|)` for `|α| ≤ 2` (Cecchini–Zeidler, Definition 2.1). The
integrability of the scalar curvature on the end, which Definition 2.1 also requires, is not
part of this structure: the theorems carry it as the hypothesis `hint`. -/
structure AsymptoticallyEuclideanEnd (n : ℕ) (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [RiemannianBundle (fun x : M ↦ TangentSpace (𝓡 n) x)] (t : ℝ) where
  /-- The radius of the excised coordinate ball. -/
  radius : ℝ
  radius_pos : 0 < radius
  /-- The end parametrization, meaningful on `{x : radius < ‖x‖}`. -/
  toFun : EuclideanSpace ℝ (Fin n) → M
  contMDiffOn : ContMDiffOn (𝓡 n) (𝓡 n) ∞ toFun {x | radius < ‖x‖}
  injOn : Set.InjOn toFun {x | radius < ‖x‖}
  isOpen_image : IsOpen (toFun '' {x | radius < ‖x‖})
  mfderiv_bijective : ∀ x : EuclideanSpace ℝ (Fin n), radius < ‖x‖ →
    Function.Bijective (mfderiv (𝓡 n) (𝓡 n) toFun x)
  decay : ∃ C : ℝ, ∀ x : EuclideanSpace ℝ (Fin n), radius < ‖x‖ → ∀ i j : Fin n,
    |pullbackMetricCoeff toFun x i j - if i = j then 1 else 0| ≤ C * ‖x‖ ^ (-t) ∧
    ‖fderiv ℝ (fun y => pullbackMetricCoeff toFun y i j) x‖ ≤ C * ‖x‖ ^ (-t - 1) ∧
    ‖fderiv ℝ (fderiv ℝ (fun y => pullbackMetricCoeff toFun y i j)) x‖ ≤ C * ‖x‖ ^ (-t - 2)

/-- A finite-ended asymptotically Euclidean structure of order `t` on `M`: a finite nonempty
family of asymptotically Euclidean ends with pairwise disjoint images whose union has compact
complement (Cecchini–Zeidler, Definition 2.3, without boundary). Nonemptiness excludes closed
manifolds such as a flat torus. -/
structure FiniteEndedAE (n : ℕ) (M : Type*) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [RiemannianBundle (fun x : M ↦ TangentSpace (𝓡 n) x)] (t : ℝ) where
  /-- The number of ends. -/
  numEnds : ℕ
  numEnds_pos : 0 < numEnds
  /-- The ends. -/
  ends : Fin numEnds → AsymptoticallyEuclideanEnd n M t
  pairwise_disjoint : Pairwise fun a b =>
    Disjoint ((ends a).toFun '' {x | (ends a).radius < ‖x‖})
      ((ends b).toFun '' {x | (ends b).radius < ‖x‖})
  isCompact_compl : IsCompact (⋃ a, (ends a).toFun '' {x | (ends a).radius < ‖x‖})ᶜ

/-! ## Layer 8: theorems -/

/-- **Positive mass theorem, nonspin, `3 ≤ n ≤ 7`** (P8.1). On a complete connected smooth
Riemannian `n`-manifold with a finite-ended asymptotically Euclidean structure of order
`t > (n − 2)/2`, nonnegative integrable scalar curvature, the normalized coordinate ADM flux of
every end converges as the radius tends to infinity, and its limit, the ADM mass, is
nonnegative (Schoen–Yau, *Positive scalar curvature and minimal hypersurface singularities*,
Theorem 5.3; Lee–Parker, Theorem 10.1). -/
theorem exists_tendsto_mass_nonneg {n : ℕ} {M : Type*} [MetricSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [IsManifold (𝓡 n) ∞ M]
    [SecondCountableTopology M] [ConnectedSpace M] [CompleteSpace M]
    [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace (𝓡 n) x)]
    [IsContMDiffRiemannianBundle (𝓡 n) ∞ (EuclideanSpace ℝ (Fin n))
      (fun x : M ↦ TangentSpace (𝓡 n) x)]
    [IsContMDiffRiemannianBundle (𝓡 n) 1 (EuclideanSpace ℝ (Fin n))
      (fun x : M ↦ TangentSpace (𝓡 n) x)]
    [IsContinuousRiemannianBundle (EuclideanSpace ℝ (Fin n))
      (fun x : M ↦ TangentSpace (𝓡 n) x)]
    [IsRiemannianManifold (𝓡 n) M]
    (hn : 3 ≤ n) (hn7 : n ≤ 7) {t : ℝ} (ht : ((n : ℝ) - 2) / 2 < t)
    (A : FiniteEndedAE n M t)
    (hscal : ∀ x, 0 ≤ (CovariantDerivative.leviCivitaConnection (𝓡 n) M).scalarCurvature x)
    (hint : Integrable (CovariantDerivative.leviCivitaConnection (𝓡 n) M).scalarCurvature
      (TauCeti.riemannianVolume (𝓡 n) M))
    (a : Fin A.numEnds) :
    ∃ m : ℝ, 0 ≤ m ∧ Tendsto
      (normalizedCoordinateFlux n (pullbackMetricCoeff (A.ends a).toFun)) atTop (𝓝 m) := by
  sorry

/-- **Rigidity in the positive mass theorem, nonspin, `3 ≤ n ≤ 7`** (P8.1). Under the
hypotheses of `exists_tendsto_mass_nonneg`, if the ADM mass of one end is zero then `M` is
isometric to Euclidean space `ℝⁿ` (Schoen–Yau, *On the proof of the positive mass conjecture
in general relativity*, §5; Lee–Parker, Lemma 10.7). -/
theorem nonempty_isometryEquiv_of_mass_eq_zero {n : ℕ} {M : Type*} [MetricSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [IsManifold (𝓡 n) ∞ M]
    [SecondCountableTopology M] [ConnectedSpace M] [CompleteSpace M]
    [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace (𝓡 n) x)]
    [IsContMDiffRiemannianBundle (𝓡 n) ∞ (EuclideanSpace ℝ (Fin n))
      (fun x : M ↦ TangentSpace (𝓡 n) x)]
    [IsContMDiffRiemannianBundle (𝓡 n) 1 (EuclideanSpace ℝ (Fin n))
      (fun x : M ↦ TangentSpace (𝓡 n) x)]
    [IsContinuousRiemannianBundle (EuclideanSpace ℝ (Fin n))
      (fun x : M ↦ TangentSpace (𝓡 n) x)]
    [IsRiemannianManifold (𝓡 n) M]
    (hn : 3 ≤ n) (hn7 : n ≤ 7) {t : ℝ} (ht : ((n : ℝ) - 2) / 2 < t)
    (A : FiniteEndedAE n M t)
    (hscal : ∀ x, 0 ≤ (CovariantDerivative.leviCivitaConnection (𝓡 n) M).scalarCurvature x)
    (hint : Integrable (CovariantDerivative.leviCivitaConnection (𝓡 n) M).scalarCurvature
      (TauCeti.riemannianVolume (𝓡 n) M))
    (a : Fin A.numEnds)
    (hzero : Tendsto
      (normalizedCoordinateFlux n (pullbackMetricCoeff (A.ends a).toFun)) atTop (𝓝 0)) :
    Nonempty (M ≃ᵢ EuclideanSpace ℝ (Fin n)) := by
  sorry

end TauCetiRoadmap.PositiveMass
