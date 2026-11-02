module

public import Mathlib
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Sectional
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Ricci
public import TauCeti.Geometry.Manifold.Riemannian.Geodesic.HopfRinow

/-!
# Riemannian geometry: target signatures

**This file is not the roadmap.** The roadmap is `README.md`; this file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, with only
the simple definitions (`IsJacobiFieldOn` and `paraboloidGraph`) those headlines need.

Statable at the pins and stated here: the algebraic characterization of constant sectional
curvature (R1), Schur's theorem and Einstein-factor constancy (R1), existence and interval uniqueness of Jacobi fields (R2),
the absence of endpoint-zero Jacobi fields under nonpositive sectional curvature (R3/R4),
Cartan–Hadamard (R4), Bonnet–Myers in its distance form (R4), two distinct fixed-interval geodesics between
distinct points of a connected closed positive-dimensional manifold (R4.8), the three simple closed geodesic
images on a smooth two-sphere (R4.9) and the smooth-function duality for the Riemannian distance
(R7.8), and the paraboloid crossing and vertex-pole theorems (R5a.3).

Not statable at the pins, hence not stated: the Morse index theorem (R3) and its focal-point
version (R6), which need the index form on continuous piecewise `C¹` sections of `γ*TM` and the
conjugate-point multiplicity, neither of which has a carrier at the pin; the Gauss, Codazzi and
Ricci equations and the first and second variation of volume (R5a, R5b), which need the second
fundamental form of an isometric immersion, hence the pullback ambient connection, absent at the
pin; the canonical Bochner-connection decomposition (R7A), which needs the finite-rank
bundle differential-operator and principal-symbol carriers, absent at the pin; the Bochner vanishing theorems (R7.6, R7.7), which need the Hodge Laplacian on forms and the
de Rham cohomology of a manifold, absent at the pin; and Takahashi's eigenmap theorem (R8.4),
which needs a Laplacian on functions on the round sphere, absent at the pin.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.RiemannianGeometry

open Set Bundle
open scoped Manifold ContDiff

/-! ## Layer 1: Intrinsic curvature calculus -/

section Intrinsic

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]

/-- R1.2: constant sectional curvature `κ` on every tangent two-plane is equivalent to the
pointwise curvature tensor being `κ(⟨Z,Y⟩X − ⟨Z,X⟩Y)`, with the library's two predicates. -/
theorem constant_sectional_tensor_iff (κ : ℝ) :
    (CovariantDerivative.leviCivitaConnection I M).HasConstantSectionalCurvature
      (CovariantDerivative.isMetricCompatible_leviCivitaConnection I) κ ↔
    (RiemannianBundle.g (E := fun x : M => TangentSpace I x)).IsConstantCurvatureTensor
      (CovariantDerivative.leviCivitaConnection I M) inferInstance κ := by
  sorry

/-- R1.3: Schur's theorem. On a connected manifold of dimension at least three, if every tangent
two-plane at each point `x` has sectional curvature `κ x`, then `κ` is constant. -/
theorem schur [ConnectedSpace M] (hdim : 3 ≤ Module.finrank ℝ E)
    (κ : M → ℝ)
    (hplanes : ∀ x, (CovariantDerivative.leviCivitaConnection I M).HasSectionalCurvatureAt
      (CovariantDerivative.isMetricCompatible_leviCivitaConnection I) x (κ x)) :
    ∀ x y : M, κ x = κ y := by
  sorry

/-- R1.3: on a connected smooth Riemannian manifold of dimension at least three,
if the Ricci tensor is pointwise a scalar multiple of the metric, that scalar is constant.
No separate regularity assumption on the scalar is needed: it is scalar curvature divided
by the nonzero dimension. -/
theorem einstein_factor_constant [ConnectedSpace M] (hdim : 3 ≤ Module.finrank ℝ E)
    (a : M → ℝ)
    (hRic : ∀ x (u v : TangentSpace I x),
      (CovariantDerivative.leviCivitaConnection I M).ricciTensor x u v =
        a x * inner ℝ u v) :
    ∀ x y : M, a x = a y := by
  sorry

/-! ## Layer 2: Jacobi fields -/

/-- R2: a Jacobi field along the geodesic `γ` on the parameter set `s`: a `C²` section of `γ*TM`
(its lift to the tangent bundle is `C²` on `s`) satisfying `D_t²X + R(X,γ′)γ′ = 0` on `s`, with
the covariant derivative along `γ` taken within `s` by the Levi-Civita connection. The geodesic
predicate carries the `UniqueDiffOn` hypothesis on `s`. -/
def IsJacobiFieldOn (γ : ℝ → M) (X : ∀ t, TangentSpace I (γ t)) (s : Set ℝ) : Prop :=
  TauCeti.Manifold.IsGeodesicCurveOn I γ s ∧
  ContMDiffOn 𝓘(ℝ, ℝ) I.tangent 2
    (fun t => (⟨γ t, X t⟩ : TangentBundle I M)) s ∧
  ∀ t ∈ s,
    (CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ
      ((CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X s) s t +
      (CovariantDerivative.leviCivitaConnection I M).curvatureTensor (γ t)
        (X t) (TauCeti.Manifold.curveVelocityWithin I γ s t)
        (TauCeti.Manifold.curveVelocityWithin I γ s t) = 0

/-- R2: two Jacobi fields on `[a, b]` with the same value and covariant derivative at `a` agree
on `[a, b]`; nothing is asserted about values outside the interval. -/
theorem jacobi_eq_of_initial_data {γ : ℝ → M}
    {X Y : ∀ t, TangentSpace I (γ t)} {a b : ℝ} (hab : a < b)
    (hX : IsJacobiFieldOn (I := I) γ X (Icc a b))
    (hY : IsJacobiFieldOn (I := I) γ Y (Icc a b))
    (hpos : X a = Y a)
    (hvel : (CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X (Icc a b) a =
      (CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ Y (Icc a b) a) :
    ∀ t ∈ Icc a b, X t = Y t := by
  sorry

/-- R2: along a geodesic on `[a, b]`, every initial value and initial covariant derivative at `a`
is attained by a Jacobi field on `[a, b]`. -/
theorem exists_jacobi_initial_data {γ : ℝ → M} {a b : ℝ} (hab : a < b)
    (hγ : TauCeti.Manifold.IsGeodesicCurveOn I γ (Icc a b))
    (u v : TangentSpace I (γ a)) :
    ∃ X : ∀ t, TangentSpace I (γ t),
      IsJacobiFieldOn (I := I) γ X (Icc a b) ∧ X a = u ∧
      (CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X (Icc a b) a = v := by
  sorry

/-! ## Layer 3: index form consequences -/

/-- R3/R4: under nonpositive sectional curvature (`⟨R(u,v)v,u⟩ ≤ 0` for all `u, v`), a Jacobi
field on `[a, b]` vanishing at both endpoints vanishes on `[a, b]`: there are no conjugate
points. -/
theorem jacobi_eq_zero_of_nonpositive_curvature {γ : ℝ → M}
    {X : ∀ t, TangentSpace I (γ t)} {a b : ℝ} (hab : a < b)
    (hX : IsJacobiFieldOn (I := I) γ X (Icc a b))
    (hK : ∀ x (u v : TangentSpace I x),
      inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor x u v v) u ≤ 0)
    (ha : X a = 0) (hb : X b = 0) : ∀ t ∈ Icc a b, X t = 0 := by
  sorry

end Intrinsic

/-! ## Layer 4: Complete manifolds and comparison -/

section GlobalDistance

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [IsRiemannianManifold I M]

/-- R4.4, Cartan–Hadamard: on a connected complete Riemannian manifold with nonpositive sectional
curvature (`⟨R(u,v)v,u⟩ ≤ 0` for all `u, v`), the exponential map at any point `p` is a covering
map from `T_pM` onto `M`. Completeness makes `expDomain` all of `T_pM`, so the library's
exponential, which is `p` off its domain, is the geometric one everywhere. -/
theorem cartanHadamard_isCoveringMap [ConnectedSpace M] [CompleteSpace M] (p : M)
    (hK : ∀ x (u v : TangentSpace I x),
      inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor x u v v) u ≤ 0) :
    IsCoveringMap (TauCeti.Manifold.riemannianExp I M p) := by
  sorry

/-- R4.5, Bonnet–Myers in distance form: on a connected complete manifold of dimension at least
two with `Ric(v,v) ≥ λ|v|²` for a constant `λ > 0`, every two points are at distance at most
`π√((n−1)/λ)` in the Riemannian distance; compactness and finiteness of the fundamental group
follow in the README. -/
theorem bonnetMyers_distance [ConnectedSpace M] [CompleteSpace M]
    (hdim : 2 ≤ Module.finrank ℝ E) {ricciBound : ℝ} (hRicciBound : 0 < ricciBound)
    (hRic : ∀ x (v : TangentSpace I x),
      ricciBound * ‖v‖ ^ 2 ≤ (CovariantDerivative.leviCivitaConnection I M).ricciTensor x v v)
    (x y : M) :
    dist x y ≤ Real.pi * Real.sqrt (((Module.finrank ℝ E : ℝ) - 1) / ricciBound) := by
  sorry

/-- R4.8: any two distinct points of a connected closed positive-dimensional Riemannian
manifold are joined by two geodesics on `[0,1]` differing at a parameter in that interval.
Distinct extensions outside the interval do not count. -/
theorem two_distinct_geodesics [ConnectedSpace M] [CompactSpace M]
    (hdim : 1 ≤ Module.finrank ℝ E) (p q : M) (hpq : p ≠ q) :
    ∃ (γ η : ℝ → M),
      TauCeti.Manifold.IsGeodesicCurveOn I γ (Icc 0 1) ∧
      TauCeti.Manifold.IsGeodesicCurveOn I η (Icc 0 1) ∧
      γ 0 = p ∧ γ 1 = q ∧ η 0 = p ∧ η 1 = q ∧
      ∃ t ∈ Icc (0 : ℝ) 1, γ t ≠ η t := by
  sorry

end GlobalDistance

/-! ## Layer 4: Three simple closed geodesics on a two-sphere -/

section TwoSphere

variable {M : Type*} [TopologicalSpace M] [T2Space M]
  [ChartedSpace (EuclideanSpace ℝ (Fin 2)) M] [IsManifold (𝓡 2) ∞ M]
  [RiemannianBundle (fun x : M => TangentSpace (𝓡 2) x)]
  [IsContMDiffRiemannianBundle (𝓡 2) ∞ (EuclideanSpace ℝ (Fin 2))
    (fun x : M => TangentSpace (𝓡 2) x)]
  [IsContMDiffRiemannianBundle (𝓡 2) 1 (EuclideanSpace ℝ (Fin 2))
    (fun x : M => TangentSpace (𝓡 2) x)]

/-- R4.9: every smooth Riemannian metric on a smooth manifold diffeomorphic to the standard
two-sphere has three closed geodesics with distinct simple images: each `γ i` is a geodesic on
all of `ℝ`, periodic with period `T i > 0`, injective on `[0, T i)` (so its image is an embedded
circle traversed once), and the three images differ as sets. Reparametrizations, multiple
traversals and reversals are identified by comparing images. The order-one Riemannian-bundle
instance is the one the geodesic predicate reads; it follows from the smooth one. -/
theorem three_simple_closed_geodesics
    (hM : Nonempty (Diffeomorph (𝓡 2) (𝓡 2) M
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1) ∞)) :
    ∃ (γ : Fin 3 → ℝ → M) (T : Fin 3 → ℝ),
      (∀ i, 0 < T i ∧ TauCeti.Manifold.IsGeodesicCurveOn (𝓡 2) (γ i) Set.univ ∧
        (∀ t, γ i (t + T i) = γ i t) ∧ Set.InjOn (γ i) (Set.Ico 0 (T i))) ∧
      ∀ i j, i ≠ j → Set.range (γ i) ≠ Set.range (γ j) := by
  sorry

end TwoSphere

/-! ## Layer 5: Paraboloid geodesics and the vertex pole -/

/-- The graph parametrization of the paraboloid `z = x² + y²`, on the global smooth
coordinate manifold `EuclideanSpace ℝ (Fin 2)`. -/
def paraboloidGraph (x : EuclideanSpace ℝ (Fin 2)) : EuclideanSpace ℝ (Fin 3) :=
  WithLp.toLp 2 ![x 0, x 1, (x 0) ^ 2 + (x 1) ^ 2]

section Paraboloid

variable [RiemannianBundle (fun x : EuclideanSpace ℝ (Fin 2) => TangentSpace (𝓡 2) x)]
  [IsContMDiffRiemannianBundle (𝓡 2) ∞ (EuclideanSpace ℝ (Fin 2))
    (fun x : EuclideanSpace ℝ (Fin 2) => TangentSpace (𝓡 2) x)]
  [IsContMDiffRiemannianBundle (𝓡 2) 1 (EuclideanSpace ℝ (Fin 2))
    (fun x : EuclideanSpace ℝ (Fin 2) => TangentSpace (𝓡 2) x)]

/-- R5a.3: every all-time unit-speed geodesic of the graph-induced paraboloid metric
with nonzero angular momentum has infinitely many transverse self-intersections,
with crossing radii and times tending to infinity. The determinant tests the two
velocities in the global graph chart. -/
theorem paraboloid_geodesic_crossings
    (hmetric : ∀ x (u v : TangentSpace (𝓡 2) x),
      (RiemannianBundle.g (E := fun x : EuclideanSpace ℝ (Fin 2) =>
        TangentSpace (𝓡 2) x)).inner x u v =
          inner ℝ (mvfderiv (𝓡 2) paraboloidGraph x u)
        (mvfderiv (𝓡 2) paraboloidGraph x v))
    (γ : ℝ → EuclideanSpace ℝ (Fin 2))
    (hγ : TauCeti.Manifold.IsGeodesicCurveOn (𝓡 2) γ univ)
    (hspeed : ∀ t, ‖TauCeti.Manifold.curveVelocityWithin (𝓡 2) γ univ t‖ = 1)
    (hmomentum : γ 0 0 * deriv γ 0 1 - γ 0 1 * deriv γ 0 0 ≠ 0) :
    ∃ (t₀ : ℝ) (τ : ℕ → ℝ),
      (∀ n, 0 < τ n) ∧ StrictMono τ ∧ Filter.Tendsto τ Filter.atTop Filter.atTop ∧
      StrictMono (fun n => ‖γ (t₀ + τ n)‖) ∧
      Filter.Tendsto (fun n => ‖γ (t₀ + τ n)‖) Filter.atTop Filter.atTop ∧
      ∀ n, γ (t₀ + τ n) = γ (t₀ - τ n) ∧
        deriv γ (t₀ + τ n) 0 * deriv γ (t₀ - τ n) 1 -
          deriv γ (t₀ + τ n) 1 * deriv γ (t₀ - τ n) 0 ≠ 0 := by
  sorry

/-- R5a.3: the vertex is a pole for the graph-induced paraboloid metric: its
Riemannian exponential is a smooth diffeomorphism from the entire tangent plane. -/
theorem paraboloid_vertex_pole
    (hmetric : ∀ x (u v : TangentSpace (𝓡 2) x),
      (RiemannianBundle.g (E := fun x : EuclideanSpace ℝ (Fin 2) =>
        TangentSpace (𝓡 2) x)).inner x u v =
          inner ℝ (mvfderiv (𝓡 2) paraboloidGraph x u)
        (mvfderiv (𝓡 2) paraboloidGraph x v)) :
    ∃ e : Diffeomorph
        𝓘(ℝ, TangentSpace (𝓡 2) (0 : EuclideanSpace ℝ (Fin 2))) (𝓡 2)
        (TangentSpace (𝓡 2) (0 : EuclideanSpace ℝ (Fin 2)))
        (EuclideanSpace ℝ (Fin 2)) ∞,
      ∀ v, e v = TauCeti.Manifold.riemannianExp (𝓡 2) (EuclideanSpace ℝ (Fin 2)) 0 v := by
  sorry

end Paraboloid

/-! ## Layer 7: Smooth-function duality for the distance -/

section SmoothDistanceDuality

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [MetricSpace M] [SecondCountableTopology M] [ChartedSpace H M]
  [IsManifold I ∞ M] [ConnectedSpace M]
  [RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [IsRiemannianManifold I M]

/-- R7.8: on a connected Riemannian manifold the Riemannian distance is the supremum of
`|f x − f y|` over bounded smooth real functions with `‖df‖ ≤ 1` everywhere; no completeness
is assumed. -/
theorem riemannianDist_eq_sSup_smooth (x y : M) :
    dist x y = sSup {r : ℝ | ∃ f : M → ℝ,
      ContMDiff I 𝓘(ℝ, ℝ) ∞ f ∧ Bornology.IsBounded (Set.range f) ∧
      (∀ p, ‖mfderiv I 𝓘(ℝ, ℝ) f p‖ ≤ 1) ∧ r = |f x - f y|} := by
  sorry

end SmoothDistanceDuality

end TauCetiRoadmap.RiemannianGeometry
