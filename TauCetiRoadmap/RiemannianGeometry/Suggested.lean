module

public import Mathlib
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Sectional
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Ricci
public import TauCeti.Geometry.Manifold.Riemannian.Geodesic.HopfRinow
public import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume
public import TauCeti.Geometry.Manifold.Riemannian.Isometry.Basic
public import TauCeti.Geometry.Manifold.Riemannian.Sphere
public import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.UpperHalfSpace

/-!
# Riemannian geometry: target signatures

**This file is not the roadmap.** The roadmap is `README.md`; this file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, with only
the two definitions the Jacobi-field and comparison headlines need to be stated: the Jacobi
predicate `IsJacobiFieldOn` and the model function `modelSine`.

Statable at the pins and stated here: the algebraic characterization of constant sectional
curvature (R1), Schur's theorem (R1), existence and interval uniqueness of Jacobi fields (R2),
the absence of endpoint-zero Jacobi fields under nonpositive sectional curvature (R3/R4), the
Rauch comparison under an upper sectional bound (R4.1), the Bishop–Gromov relative-volume
monotonicity with the flat model (R4.1), Cartan–Hadamard (R4.4), Bonnet–Myers in its distance
form (R4.5), the three cases of the Killing–Hopf classification of simply connected space forms
(R4.7), the three simple closed geodesic images on a smooth two-sphere (R4.9) and the
smooth-function duality for the Riemannian distance (R7.8).

Not statable at the pins, hence not stated: the Morse index theorem (R3) and its focal-point
version (R6), which need the index form on continuous piecewise `C¹` sections of `γ*TM` and the
conjugate-point multiplicity, neither of which has a carrier at the pin; the Günther and
Bishop–Gromov comparisons with a curved model (R4.1), which need the model volume `V_κ(r)` of a
ball in the space form of curvature `κ`, absent at the pin; the Gauss, Codazzi and Ricci equations
and the first and second variation of volume (R5a, R5b), which need the second fundamental form of
an isometric immersion, hence the pullback ambient connection, absent at the pin; Synge's theorem
(R4.6), which needs an orientability predicate for manifolds, absent at the pin; the Lichnerowicz
eigenvalue bound (R7.0), which needs the Laplacian on functions of a Riemannian manifold, absent
at the pin; the Bochner vanishing theorems (R7.6, R7.7), which need the Hodge Laplacian on forms
and the de Rham cohomology of a manifold, absent at the pin; and Takahashi's eigenmap theorem
(R8.4), which needs a Laplacian on functions on the round sphere, absent at the pin.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.RiemannianGeometry

open Set Bundle
open scoped Manifold ContDiff

/-! ## R1: Intrinsic curvature calculus -/

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

/-! ## R2: Jacobi fields -/

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

/-! ## R3/R4: index form consequences -/

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

/-! ## R4.1: Rauch comparison -/

/-- R4.1: the model function `s_κ`, the solution of `s'' + κ s = 0` with `s(0) = 0` and
`s'(0) = 1`: `sin(√κ t)/√κ` for `κ > 0`, `t` for `κ = 0` and `sinh(√(−κ) t)/√(−κ)` for `κ < 0`.
Its first positive zero is `π/√κ` when `κ > 0`; it has none otherwise. -/
def modelSine (κ t : ℝ) : ℝ :=
  if 0 < κ then Real.sin (Real.sqrt κ * t) / Real.sqrt κ
  else if κ = 0 then t
  else Real.sinh (Real.sqrt (-κ) * t) / Real.sqrt (-κ)

/-- R4.1, Rauch comparison under an upper sectional bound: along a unit-speed geodesic `γ` on
`[0, b]`, a Jacobi field `X` with `X 0 = 0` and `D_tX(0)` orthogonal to `γ′(0)` satisfies
`s_κ(t)·|D_tX(0)| ≤ |X t|` on `[0, b]` whenever every sectional curvature of `M` is at most `κ`
(`⟨R(u,v)v,u⟩ ≤ κ(|u|²|v|² − ⟨u,v⟩²)` for all `u, v`) and, when `κ > 0`, `b` is less than the
first positive zero `π/√κ` of the model. -/
theorem rauch_norm_ge_of_sectional_le {γ : ℝ → M} {X : ∀ t, TangentSpace I (γ t)} {b κ : ℝ}
    (hb : 0 < b) (hX : IsJacobiFieldOn (I := I) γ X (Icc 0 b))
    (hunit : ∀ t ∈ Icc 0 b, ‖TauCeti.Manifold.curveVelocityWithin I γ (Icc 0 b) t‖ = 1)
    (h0 : X 0 = 0)
    (hnormal : inner ℝ ((CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X
      (Icc 0 b) 0) (TauCeti.Manifold.curveVelocityWithin I γ (Icc 0 b) 0) = 0)
    (hK : ∀ x (u v : TangentSpace I x),
      inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor x u v v) u ≤
        κ * (‖u‖ ^ 2 * ‖v‖ ^ 2 - (inner ℝ u v) ^ 2))
    (hmodel : 0 < κ → b < Real.pi / Real.sqrt κ) :
    ∀ t ∈ Icc 0 b, modelSine κ t *
      ‖(CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X (Icc 0 b) 0‖ ≤
        ‖X t‖ := by
  sorry

end Intrinsic

/-! ## R4: Complete manifolds and comparison -/

section GlobalDistance

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [IsRiemannianManifold I M]

/-- R4.1, Bishop–Gromov with the flat model: on a connected complete manifold with nonnegative
Ricci curvature, `vol(B(p,s))/sⁿ ≤ vol(B(p,r))/rⁿ` for `0 < r ≤ s`, with `n = dim M` and the
Riemannian volume `TauCeti.riemannianVolume` of the metric balls. Completeness makes closed balls
compact, so the volumes are finite and `toReal` reads them honestly. -/
theorem bishopGromov_flat [ConnectedSpace M] [CompleteSpace M]
    [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M]
    [IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x)] (p : M)
    (hRic : ∀ x (v : TangentSpace I x),
      0 ≤ (CovariantDerivative.leviCivitaConnection I M).ricciTensor x v v)
    {r s : ℝ} (hr : 0 < r) (hrs : r ≤ s) :
    (TauCeti.riemannianVolume I M (Metric.ball p s)).toReal / s ^ Module.finrank ℝ E ≤
      (TauCeti.riemannianVolume I M (Metric.ball p r)).toReal / r ^ Module.finrank ℝ E := by
  sorry

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

end GlobalDistance

/-! ## R4.7: Killing–Hopf classification of simply connected space forms -/

section SpaceForms

variable {n : ℕ} {M : Type*} [MetricSpace M]
  [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [IsManifold (𝓡 n) ∞ M]
  [RiemannianBundle (fun x : M => TangentSpace (𝓡 n) x)]
  [IsContMDiffRiemannianBundle (𝓡 n) ∞ (EuclideanSpace ℝ (Fin n))
    (fun x : M => TangentSpace (𝓡 n) x)]
  [IsContMDiffRiemannianBundle (𝓡 n) 1 (EuclideanSpace ℝ (Fin n))
    (fun x : M => TangentSpace (𝓡 n) x)]
  [IsContMDiffRiemannianBundle (𝓡 n) 2 (EuclideanSpace ℝ (Fin n))
    (fun x : M => TangentSpace (𝓡 n) x)]
  [IsRiemannianManifold (𝓡 n) M] [ConnectedSpace M] [CompleteSpace M] [SimplyConnectedSpace M]

/-- R4.7, Killing–Hopf, Euclidean case: a connected, complete, simply connected Riemannian
manifold modelled on `ℝⁿ` with constant sectional curvature `0` is isometric to Euclidean
`n`-space with its standard metric. The order-one and order-two Riemannian-bundle instances are
the ones the connection and curvature predicates read; they follow from the smooth one. For
`n = 0` both sides are a point and for `n = 1` both are the line. -/
theorem killingHopf_euclidean
    (hK : (CovariantDerivative.leviCivitaConnection (𝓡 n) M).HasConstantSectionalCurvature
      (CovariantDerivative.isMetricCompatible_leviCivitaConnection (𝓡 n)) 0) :
    Nonempty (TauCeti.RiemannianIsometry (𝓡 n) (𝓡 n) M (EuclideanSpace ℝ (Fin n))) := by
  sorry

/-- R4.7, Killing–Hopf, spherical case: for `n ≥ 2`, a connected, complete, simply connected
Riemannian manifold modelled on `ℝⁿ` with constant sectional curvature `1` is isometric to the
unit sphere of `ℝⁿ⁺¹` with its round metric. The dimension bound is needed: the line satisfies
the hypotheses vacuously for `n = 1` and is not a circle. -/
theorem killingHopf_sphere (hn : 2 ≤ n)
    (hK : (CovariantDerivative.leviCivitaConnection (𝓡 n) M).HasConstantSectionalCurvature
      (CovariantDerivative.isMetricCompatible_leviCivitaConnection (𝓡 n)) 1) :
    Nonempty (TauCeti.RiemannianIsometry (𝓡 n) (𝓡 n) M
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)) := by
  sorry

/-- R4.7, Killing–Hopf, hyperbolic case: for `n ≥ 1`, a connected, complete, simply connected
Riemannian manifold modelled on `ℝⁿ` with constant sectional curvature `−1` is isometric to
hyperbolic `n`-space in the upper half-space model `TauCeti.UpperHalfSpace (ℝⁿ⁻¹)`, the open
upper half-space of `ℝⁿ⁻¹ × ℝ` with the metric `(|dx|² + dt²)/t²`. The dimension bound keeps
the two dimensions equal; for `n = 1` both sides are the line. -/
theorem killingHopf_hyperbolic (hn : 1 ≤ n)
    (hK : (CovariantDerivative.leviCivitaConnection (𝓡 n) M).HasConstantSectionalCurvature
      (CovariantDerivative.isMetricCompatible_leviCivitaConnection (𝓡 n)) (-1)) :
    Nonempty (TauCeti.RiemannianIsometry (𝓡 n)
      𝓘(ℝ, WithLp 2 (EuclideanSpace ℝ (Fin (n - 1)) × ℝ)) M
      (TauCeti.UpperHalfSpace (EuclideanSpace ℝ (Fin (n - 1))))) := by
  sorry

end SpaceForms

/-! ## R4.9: Three simple closed geodesics on a two-sphere -/

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

/-! ## R7.8: Smooth-function duality for the distance -/

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
