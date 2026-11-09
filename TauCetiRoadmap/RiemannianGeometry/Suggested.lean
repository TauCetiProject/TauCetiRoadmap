module

public import Mathlib
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Sectional
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Ricci
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.ExteriorSquare
public import TauCeti.Geometry.Manifold.Riemannian.Geodesic.HopfRinow
public import TauCeti.Geometry.Manifold.Riemannian.Jacobi.Basic
public import TauCeti.Analysis.SpecialFunctions.Trigonometric.Curvature
public import TauCeti.Geometry.Manifold.DeRham.Basic
public import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume
public import TauCeti.Geometry.Manifold.Riemannian.Isometry.Basic
public import TauCeti.Geometry.Manifold.Riemannian.Sphere.Basic
public import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.UpperHalfSpace.Basic
public import TauCeti.Geometry.Manifold.Orientation.Basic
public import TauCeti.RingTheory.MvPolynomial.Harmonic
public import TauCeti.Geometry.Manifold.Riemannian.Laplacian
public import TauCeti.Analysis.MvPolynomial.Sphere

/-!
# Riemannian geometry: target signatures

**This file is not the roadmap.** The roadmap is `README.md`; this file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, with only
the two simple definitions those headlines need: the model ball volume `modelBallVolume` and the
graph parametrization `paraboloidGraph`. Jacobi fields are Tau Ceti's
`TauCeti.Manifold.IsJacobiFieldOn` and the comparison model is Tau Ceti's `TauCeti.curvatureSine`.

Statable at the pins and stated here: existence of Jacobi fields with prescribed initial data on
a compact geodesic interval (R2), the integral homology of the based loop space of a round sphere
(R3.3), the Rauch comparison under an upper sectional bound (R4.1), Günther's volume comparison
under an upper sectional bound (R4.1), the Bishop–Gromov relative-volume monotonicity against the
model of curvature `κ` (R4.1), Cartan–Hadamard (R4.4), Bonnet–Myers in its distance form and the
finiteness of the fundamental group (R4.5), Synge's theorem in its even-dimensional and
odd-dimensional forms (R4.6), the three cases of the Killing–Hopf classification of simply
connected space forms (R4.7), two distinct fixed-interval geodesics between distinct points of a
connected closed positive-dimensional manifold (R4.8), the three simple closed geodesic images on
a smooth two-sphere (R4.9), the paraboloid crossing and vertex-pole theorems (R5a.3), Bochner's
vanishing of the first de Rham cohomology under positive Ricci curvature (R7.6), the vanishing of
de Rham cohomology in every interior degree under a positive curvature operator (R7.7), the
smooth-function duality for the Riemannian distance (R7.8), the identification of the smooth
eigenfunctions of the round-sphere Laplacian with restrictions of harmonic homogeneous polynomials
(R8.2) and the irreducibility of the complex harmonic polynomials of each degree under `SO(N)` for
`N ≥ 3` (R8.3).

Not restated here, because Tau Ceti proves them and the README cites the declarations: the
Bianchi identities, pair interchange and the Ricci identity, parallel curvature under constant
sectional curvature and local isometries, the constant-scaling and product curvature laws, the
characterization of constant sectional curvature, Schur's theorem, the constancy of the Einstein
factor and the completeness of left-invariant metrics on Lie groups (R1); smoothness of geodesics
up to the ends of their parameter sets, the regularity and reparametrization law of covariant
differentiation along curves, the commutation of mixed covariant derivatives up to curvature on
a parametrized surface, uniqueness of Jacobi fields from initial data, the
identification of the differential of the exponential map with radial Jacobi fields, the
vanishing first derivatives of the metric in normal coordinates, conjugate multiplicity and its
bound `n − 1`, and the absence of endpoint-zero Jacobi fields under nonpositive sectional
curvature (R2, R3); the norm-nondecreasing exponential differential under nonpositive sectional
curvature (R4.4); the curvature of the round spheres and of the half-space model, the full
isometry groups of Euclidean space and of the round sphere, and the Gauss formula giving the
round-sphere connection by tangential projection (R4.7, R5a); the round metric in stereographic
coordinates and the second fundamental form and shape operator of a parametrization in a
Euclidean space (R5a.2); the Lax–Milgram solution operator of a coercive form, with its
eigenbasis and Rayleigh principle (R5b); the Hessian of the squared distance along a
parametrization and its kernel, the almost-everywhere Morse property of the squared distance from
a point along an immersion, its properness along a closed embedding, and the normal exponential
of an embedding with its open natural domain and smoothness (R6); the scalar Bochner identity
and the Lichnerowicz eigenvalue bound (R7.0); and the Fischer decomposition of homogeneous
polynomials (R8.1).

Not statable at the pins, hence not stated: the Morse index theorem (R3) and its focal-point
version (R6), which need the index form on continuous piecewise `C¹` sections of `γ*TM`, which
has no carrier at the pin; the Gauss, Codazzi and Ricci equations and the first and second
variation of volume (R5a, R5b), which need the second fundamental form of an isometric immersion
between manifolds, hence the pullback ambient connection, absent at the pin; the vanishing of de
Rham cohomology under a positive Weitzenböck term `ℛ_p` and the parallelism of harmonic forms
under a nonnegative one (R7.6), which need the Weitzenböck curvature term on `p`-forms, absent at
the pin; and Takahashi's eigenmap theorem (R8.4), which needs the mean curvature of an isometric
immersion into a round sphere, absent at the pin.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.RiemannianGeometry

open Set Bundle
open scoped Manifold ContDiff

/-! ## Layer 2: Jacobi fields -/

section Intrinsic

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]

/-- R2: along a geodesic on `[a, b]`, every initial value and initial covariant derivative at `a`
is attained by a Jacobi field on `[a, b]`. -/
theorem exists_jacobi_initial_data {γ : ℝ → M} {a b : ℝ} (hab : a < b)
    (hγ : TauCeti.Manifold.IsGeodesicCurveOn I γ (Icc a b))
    (u v : TangentSpace I (γ a)) :
    ∃ X : ∀ t, TangentSpace I (γ t),
      TauCeti.Manifold.IsJacobiFieldOn I γ X (Icc a b) ∧ X a = u ∧
      (CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X (Icc a b) a = v := by
  sorry

/-! ## Layer 4: Rauch comparison -/

/-- R4.1, Rauch comparison under an upper sectional bound: along a unit-speed geodesic `γ` on
`[0, b]`, a Jacobi field `X` with `X 0 = 0` and `D_tX(0)` orthogonal to `γ′(0)` satisfies
`s_κ(t)·|D_tX(0)| ≤ |X t|` on `[0, b]`, with `s_κ` Tau Ceti's model sine
`TauCeti.curvatureSine κ` (`sin(√κ t)/√κ`, `t` or `sinh(√(−κ) t)/√(−κ)` according to the sign of
`κ`), whenever every sectional curvature of `M` is at most `κ`
(`⟨R(u,v)v,u⟩ ≤ κ(|u|²|v|² − ⟨u,v⟩²)` for all `u, v`) and, when `κ > 0`, `b` is less than the
first positive zero `π/√κ` of the model. -/
theorem rauch_norm_ge_of_sectional_le {γ : ℝ → M} {X : ∀ t, TangentSpace I (γ t)} {b κ : ℝ}
    (hb : 0 < b) (hX : TauCeti.Manifold.IsJacobiFieldOn I γ X (Icc 0 b))
    (hunit : ∀ t ∈ Icc 0 b, ‖TauCeti.Manifold.curveVelocityWithin I γ (Icc 0 b) t‖ = 1)
    (h0 : X 0 = 0)
    (hnormal : inner ℝ ((CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X
      (Icc 0 b) 0) (TauCeti.Manifold.curveVelocityWithin I γ (Icc 0 b) 0) = 0)
    (hK : ∀ x (u v : TangentSpace I x),
      inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor x u v v) u ≤
        κ * (‖u‖ ^ 2 * ‖v‖ ^ 2 - (inner ℝ u v) ^ 2))
    (hmodel : 0 < κ → b < Real.pi / Real.sqrt κ) :
    ∀ t ∈ Icc 0 b, TauCeti.curvatureSine κ t *
      ‖(CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X (Icc 0 b) 0‖ ≤
        ‖X t‖ := by
  sorry

/-! ## Layer 4: Synge's theorem -/

/-- R4.6, Synge's theorem, even dimension: a compact connected orientable Riemannian manifold of
even dimension whose sectional curvatures are all positive (`0 < ⟨R(u,v)v,u⟩` for every linearly
independent pair `u, v`) is simply connected. Orientability is the pinned `TauCeti.Orientable`,
the existence of a manifold orientation: an orientation of the tangent spaces compatible with the
chart Jacobians. In dimension `0` the manifold is a point and the
conclusion holds; `RP²` is excluded by orientability, the flat torus by strict positivity and
`RP³` by parity. -/
theorem synge [ConnectedSpace M] [CompactSpace M] [TauCeti.Orientable I M]
    (heven : Even (Module.finrank ℝ E))
    (hK : ∀ x (u v : TangentSpace I x), LinearIndependent ℝ ![u, v] →
      0 < inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor x u v v) u) :
    SimplyConnectedSpace M := by
  sorry

/-- R4.6, Synge's theorem, odd dimension: a compact connected Riemannian manifold of odd dimension
whose sectional curvatures are all positive is orientable. `RP³` satisfies the hypotheses and is
orientable with fundamental group `ℤ/2`, so the odd-dimensional conclusion is orientability, not
simple connectivity. -/
theorem synge_orientable_of_odd [ConnectedSpace M] [CompactSpace M]
    (hodd : Odd (Module.finrank ℝ E))
    (hK : ∀ x (u v : TangentSpace I x), LinearIndependent ℝ ![u, v] →
      0 < inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor x u v v) u) :
    TauCeti.Orientable I M := by
  sorry

end Intrinsic

/-! ## Layer 3: Loop spaces of round spheres -/

/-- R3.3: for `n ≥ 2` and a point `p` of the unit sphere `Sⁿ ⊂ ℝⁿ⁺¹`, the integral singular
homology of the based loop space `ΩSⁿ`, the space `Path p p` of loops at `p` with the
compact-open topology, is `ℤ` in every degree divisible by `n − 1` and zero in every other degree.
For `n = 2` it is `ℤ` in every degree. The bound `2 ≤ n` is needed: the loop space of the circle
has one contractible component for each winding number, so its degree-zero homology is free of
countably infinite rank, not `ℤ`. -/
theorem singularHomology_loopSpace_sphere {n : ℕ} (hn : 2 ≤ n) (i : ℕ)
    (p : Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) :
    (n - 1 ∣ i → Nonempty
      (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) i).obj
        (ModuleCat.of ℤ ℤ)).obj (TopCat.of (Path p p)) ≅ ModuleCat.of ℤ ℤ)) ∧
    (¬ n - 1 ∣ i → CategoryTheory.Limits.IsZero
      (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) i).obj
        (ModuleCat.of ℤ ℤ)).obj (TopCat.of (Path p p)))) := by
  sorry

/-! ## Layer 4: Complete manifolds and comparison -/

section GlobalDistance

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [IsRiemannianManifold I M]

/-- R4.1: the model ball volume up to the constant `ω_{n−1}`: `V_κ(r) = ∫₀ʳ s_κ(t)^(n−1) dt`, with
`s_κ` Tau Ceti's model sine `TauCeti.curvatureSine κ`,
the volume of the ball of radius `r` in the `n`-dimensional space form of curvature `κ` divided
by the volume of the unit `(n−1)`-sphere, for `0 ≤ r`, and `r < π/√κ` when `κ > 0`. For `n = 1`
the exponent is `0` and the value is `r`; for `n = 0` the natural-number exponent `n − 1` is
again `0`, and the value is again `r`. -/
def modelBallVolume (κ : ℝ) (n : ℕ) (r : ℝ) : ℝ :=
  ∫ t in (0 : ℝ)..r, TauCeti.curvatureSine κ t ^ (n - 1)

/-- R4.1, Günther's volume comparison: on a connected complete manifold of dimension `n` whose
sectional curvatures are at most `κ` (`⟨R(u,v)v,u⟩ ≤ κ(|u|²|v|² − ⟨u,v⟩²)` for all `u, v`), let
`0 < r`, with `r < π/√κ` when `κ > 0`, and let `exp_p` be injective on the tangent ball of radius
`r` at `p`. Then the metric ball `B(p,r)` has Riemannian volume at least `ω_{n−1}·V_κ(r)`, the
volume of the ball of radius `r` in the `n`-dimensional model of curvature `κ`, where
`ω_{n−1} = n·vol(Bⁿ)` is the volume of the unit `(n−1)`-sphere. On a complete manifold the
injectivity hypothesis holds exactly when `r ≤ inj(p)`: past the cut time in a direction `v`, the
point `exp_p(tv)` is also `exp_p(w)` for a strictly shorter minimizing vector `w`. So the
statement needs no injectivity-radius carrier. On the unit two-sphere with `κ = 1` both sides are
`2π(1 − cos r)`; for `n = 1` both sides are `2r`. The route integrates the polar volume-density
bound `F ≥ s_κ^(n−1)` of Kwong, *Quantitative comparison theorems in Riemannian and Kähler
geometry*, Theorem 10(2), p. 27. -/
theorem guenther [ConnectedSpace M] [CompleteSpace M]
    [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M]
    [IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x)] (p : M) {κ r : ℝ}
    (hK : ∀ x (u v : TangentSpace I x),
      inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor x u v v) u ≤
        κ * (‖u‖ ^ 2 * ‖v‖ ^ 2 - (inner ℝ u v) ^ 2))
    (hr : 0 < r) (hmodel : 0 < κ → r < Real.pi / Real.sqrt κ)
    (hinj : Set.InjOn (TauCeti.Manifold.riemannianExp I M p) (Metric.ball 0 r)) :
    ENNReal.ofReal ((Module.finrank ℝ E : ℝ) * modelBallVolume κ (Module.finrank ℝ E) r) *
        MeasureTheory.volume
          (Metric.ball (0 : EuclideanSpace ℝ (Fin (Module.finrank ℝ E))) 1) ≤
      TauCeti.riemannianVolume I M (Metric.ball p r) := by
  sorry

/-- R4.1, Bishop–Gromov: on a connected complete manifold of dimension `n` with
`Ric(v,v) ≥ (n−1)κ|v|²`, the ratio `vol(B(p,r))/V_κ(r)` of the Riemannian volume
`TauCeti.riemannianVolume` of the metric ball to the model ball volume is nonincreasing in `r`:
`vol(B(p,s))/V_κ(s) ≤ vol(B(p,r))/V_κ(r)` for `0 < r ≤ s`, and `s < π/√κ` when `κ > 0`. The
constant `ω_{n−1}` cancels in the ratio. Completeness makes closed balls compact, so the volumes
are finite and `toReal` reads them honestly; for `κ = 0` the model is `rⁿ/n` and the statement is
`vol(B(p,s))/sⁿ ≤ vol(B(p,r))/rⁿ`. -/
theorem bishopGromov [ConnectedSpace M] [CompleteSpace M]
    [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M]
    [IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x)] (p : M) {κ : ℝ}
    (hRic : ∀ x (v : TangentSpace I x),
      ((Module.finrank ℝ E : ℝ) - 1) * κ * ‖v‖ ^ 2 ≤
        (CovariantDerivative.leviCivitaConnection I M).ricciTensor x v v)
    {r s : ℝ} (hr : 0 < r) (hrs : r ≤ s) (hmodel : 0 < κ → s < Real.pi / Real.sqrt κ) :
    (TauCeti.riemannianVolume I M (Metric.ball p s)).toReal /
        modelBallVolume κ (Module.finrank ℝ E) s ≤
      (TauCeti.riemannianVolume I M (Metric.ball p r)).toReal /
        modelBallVolume κ (Module.finrank ℝ E) r := by
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

/-- R4.5, Myers: under the hypotheses of `bonnetMyers_distance` the fundamental group at every
basepoint is finite, because the Riemannian universal cover satisfies the same Ricci bound and
is therefore compact, so the fibre of the covering is finite. -/
theorem myers_finite_fundamentalGroup [ConnectedSpace M] [CompleteSpace M]
    (hdim : 2 ≤ Module.finrank ℝ E) {ricciBound : ℝ} (hRicciBound : 0 < ricciBound)
    (hRic : ∀ x (v : TangentSpace I x),
      ricciBound * ‖v‖ ^ 2 ≤ (CovariantDerivative.leviCivitaConnection I M).ricciTensor x v v)
    (x : M) : Finite (FundamentalGroup M x) := by
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

/-! ## Layer 4: Killing–Hopf classification of simply connected space forms -/

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

/-- The graph parametrization of the paraboloid `z = x² + y²` over the plane
`EuclideanSpace ℝ (Fin 2)`. -/
def paraboloidGraph (x : EuclideanSpace ℝ (Fin 2)) : EuclideanSpace ℝ (Fin 3) :=
  WithLp.toLp 2 ![x 0, x 1, (x 0) ^ 2 + (x 1) ^ 2]

section Paraboloid

variable {S : Type*} [TopologicalSpace S]
  [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S] [IsManifold (𝓡 2) ∞ S]
  [RiemannianBundle (fun x : S => TangentSpace (𝓡 2) x)]
  [IsContMDiffRiemannianBundle (𝓡 2) ∞ (EuclideanSpace ℝ (Fin 2))
    (fun x : S => TangentSpace (𝓡 2) x)]
  [IsContMDiffRiemannianBundle (𝓡 2) 1 (EuclideanSpace ℝ (Fin 2))
    (fun x : S => TangentSpace (𝓡 2) x)]

/-- R5a.3: on a surface `S` with a global graph chart `e` in which its metric is the
graph-induced paraboloid metric, every all-time unit-speed geodesic with nonzero angular
momentum has infinitely many transverse self-intersections, with crossing radii and times
tending to infinity. The curve `γ` is the geodesic read in the chart, and the determinant tests
the two chart velocities. -/
theorem paraboloid_geodesic_crossings
    (e : Diffeomorph (𝓡 2) (𝓡 2) S (EuclideanSpace ℝ (Fin 2)) ∞)
    (hmetric : ∀ x (u v : TangentSpace (𝓡 2) x),
      (RiemannianBundle.g (E := fun x : S => TangentSpace (𝓡 2) x)).inner x u v =
        inner ℝ (mvfderiv (𝓡 2) (paraboloidGraph ∘ e) x u)
          (mvfderiv (𝓡 2) (paraboloidGraph ∘ e) x v))
    (γ : ℝ → EuclideanSpace ℝ (Fin 2))
    (hγ : TauCeti.Manifold.IsGeodesicCurveOn (𝓡 2) (e.symm ∘ γ) univ)
    (hspeed : ∀ t, ‖TauCeti.Manifold.curveVelocityWithin (𝓡 2) (e.symm ∘ γ) univ t‖ = 1)
    (hmomentum : γ 0 0 * deriv γ 0 1 - γ 0 1 * deriv γ 0 0 ≠ 0) :
    ∃ (t₀ : ℝ) (τ : ℕ → ℝ),
      (∀ n, 0 < τ n) ∧ StrictMono τ ∧ Filter.Tendsto τ Filter.atTop Filter.atTop ∧
      StrictMono (fun n => ‖γ (t₀ + τ n)‖) ∧
      Filter.Tendsto (fun n => ‖γ (t₀ + τ n)‖) Filter.atTop Filter.atTop ∧
      ∀ n, γ (t₀ + τ n) = γ (t₀ - τ n) ∧
        deriv γ (t₀ + τ n) 0 * deriv γ (t₀ - τ n) 1 -
          deriv γ (t₀ + τ n) 1 * deriv γ (t₀ - τ n) 0 ≠ 0 := by
  sorry

/-- R5a.3: the vertex is a pole for the graph-induced paraboloid metric: on a surface `S` with a
global graph chart `e` in which its metric is that metric, the Riemannian exponential at the
point over the origin is a smooth diffeomorphism from the entire tangent plane. -/
theorem paraboloid_vertex_pole
    (e : Diffeomorph (𝓡 2) (𝓡 2) S (EuclideanSpace ℝ (Fin 2)) ∞)
    (hmetric : ∀ x (u v : TangentSpace (𝓡 2) x),
      (RiemannianBundle.g (E := fun x : S => TangentSpace (𝓡 2) x)).inner x u v =
        inner ℝ (mvfderiv (𝓡 2) (paraboloidGraph ∘ e) x u)
          (mvfderiv (𝓡 2) (paraboloidGraph ∘ e) x v)) :
    ∃ exp₀ : Diffeomorph
        𝓘(ℝ, TangentSpace (𝓡 2) (e.symm 0)) (𝓡 2) (TangentSpace (𝓡 2) (e.symm 0)) S ∞,
      ∀ v, exp₀ v = TauCeti.Manifold.riemannianExp (𝓡 2) S (e.symm 0) v := by
  sorry

end Paraboloid

/-! ## Layer 7: Bochner vanishing -/

section Bochner

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]

/-- R7.6, Bochner's theorem: on a compact boundaryless Riemannian manifold whose Ricci curvature
is positive (`0 < Ric(v,v)` for every nonzero tangent vector `v`), the first de Rham cohomology
`TauCeti.deRhamCohomology I M 1` vanishes, so `b₁ = 0` (Nicolaescu, *Lectures on the Geometry of
Manifolds*, Theorem 12.2.5(b), p. 661, there for connected oriented `M`). The statement is
componentwise, and a nonorientable `M` reduces to its orientation double cover, so neither
connectedness nor orientability is assumed. The flat circle (`Ric = 0`, `b₁ = 1`) shows that
strict positivity is needed; the round two-sphere with two points removed (`Ric = g`, `b₁ = 1`)
shows that compactness is needed. -/
theorem subsingleton_deRhamCohomology_one_of_ricciTensor_pos [CompactSpace M]
    (hRic : ∀ x (v : TangentSpace I x), v ≠ 0 →
      0 < (CovariantDerivative.leviCivitaConnection I M).ricciTensor x v v) :
    Subsingleton (TauCeti.deRhamCohomology I M 1) := by
  sorry

/-- R7.7, Meyer and Gallot–Meyer: on a compact boundaryless Riemannian manifold of dimension `n`
whose curvature operator on bivectors is positive definite at every point
(`0 < ⟪Rop β, β⟫` for every nonzero `β ∈ Λ²T_xM`, for Tau Ceti's
`CovariantDerivative.curvatureEndomorphism`, normalized by `⟪Rop(u∧v), w∧z⟫ = ⟪R(u,v)z,w⟫`, so
that the unit sphere has `Rop = Id`), the de Rham cohomology vanishes in every degree `p` with
`0 < p < n`. For `n ≥ 3` this is the case `l = ⌈n/2⌉` of Petersen–Wink, *New curvature
conditions for the Bochner technique*, Corollary, p. 1, a positive operator being `l`-positive for
every `l`; for `n = 2` it is the case `p = 1` of Bochner's theorem, `Rop > 0` meaning `K > 0`; for
`n ≤ 1` no degree qualifies. It contains `b₂ = 0` for `n ≥ 3`. The product `S² × S²`
(`Rop ≥ 0` with kernel the mixed bivectors, `b₂ = 2`) shows that positivity is needed, and the
round `n`-sphere with two points removed (`Rop = Id`, `b_(n−1) = 1`) that compactness is. -/
theorem subsingleton_deRhamCohomology_of_curvatureEndomorphism_pos [CompactSpace M]
    (hRop : ∀ x (β : ⋀[ℝ]^2 (TangentSpace I x)), β ≠ 0 →
      0 < inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureEndomorphism
        (CovariantDerivative.isMetricCompatible_leviCivitaConnection I) x β) β)
    {p : ℕ} (hp : 0 < p) (hpn : p < Module.finrank ℝ E) :
    Subsingleton (TauCeti.deRhamCohomology I M p) := by
  sorry

end Bochner

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

/-! ## Layer 8: Spherical harmonics -/

section SphericalHarmonics

open MvPolynomial

/-- R8.2, the smooth eigenfunctions of the round sphere: on the unit round sphere `Sᵐ` of
`ℝᵐ⁺¹`, `m ≥ 1`, with Tau Ceti's round metric, every nonzero smooth function `f` with
`Δf = −λf` for Tau Ceti's Laplace–Beltrami operator `Δ = div grad` has `λ = d(d + m − 1)` for
some degree `d` and is the restriction of a real harmonic homogeneous polynomial of degree `d`.
For `m = 1` the eigenfunctions are `cos dθ` and `sin dθ` with `λ = d²`. The bound `m ≥ 1` is
needed: on `S⁰ = {±1}` the Laplacian vanishes, and the function with values `1` and `2` has
`λ = 0` but is the restriction of neither a constant nor a multiple of `X`. -/
theorem eq_harmonicSphereRestriction_of_laplaceBeltrami_eq_neg_mul {m : ℕ} (hm : 1 ≤ m)
    (f : Metric.sphere (0 : EuclideanSpace ℝ (Fin (m + 1))) 1 → ℝ)
    (hf : ContMDiff (𝓡 m) 𝓘(ℝ, ℝ) ∞ f) (hf0 : f ≠ 0) {lam : ℝ}
    (heig : ∀ x, TauCeti.Manifold.laplaceBeltrami (𝓡 m) f x = -lam * f x) :
    ∃ d : ℕ, lam = (d : ℝ) * ((d : ℝ) + m - 1) ∧
      ∃ p : harmonicSubmodule (Fin (m + 1)) ℝ d,
        ⇑(harmonicSphereRestriction (Fin (m + 1)) d p) = f := by
  sorry

/-- R8.3: for `N ≥ 3` and every degree `d`, the complex harmonic homogeneous polynomials of degree
`d` on `ℝᴺ`, Tau Ceti's `MvPolynomial.harmonicSubmodule` (homogeneous polynomials of degree `d`
killed by the Euclidean Laplacian `Σ ∂ᵢ²`), form an irreducible representation of the real group
`SO(N)` acting by `(g·p)(x) = p(g⁻¹x)`: a complex subspace of them that every rotation maps into
itself is zero or all of them. The bound `N ≥ 3` is needed: for `N = 2` and `d ≥ 1` the space is
spanned by `(x₁ + i x₂)ᵈ` and `(x₁ − i x₂)ᵈ`, which span two invariant lines with the characters
`e^(∓idθ)` of the rotation by `θ`. -/
theorem harmonic_irreducible {N : ℕ} (hN : 3 ≤ N) (d : ℕ)
    (W : Submodule ℂ (MvPolynomial (Fin N) ℂ)) (hW : W ≤ harmonicSubmodule (Fin N) ℂ d)
    (hinv : ∀ g : Matrix.specialOrthogonalGroup (Fin N) ℝ, ∀ p ∈ W,
      aeval (fun i => ∑ j, C ((((g⁻¹ : Matrix.specialOrthogonalGroup (Fin N) ℝ) :
        Matrix (Fin N) (Fin N) ℝ) i j : ℝ) : ℂ) * X j) p ∈ W) :
    W = ⊥ ∨ W = harmonicSubmodule (Fin N) ℂ d := by
  sorry

end SphericalHarmonics

end TauCetiRoadmap.RiemannianGeometry
