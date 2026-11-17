module

import Mathlib
import TauCeti.Geometry.Manifold.Boundary.Charts
import TauCeti.Geometry.Manifold.Boundary.Orientation
import TauCeti.Geometry.Manifold.Riemannian.Laplacian
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Basic
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Spray
import TauCeti.Geometry.Manifold.RegularValue

/-!
# Riemannian manifolds with convex boundary: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test: it
states, against the pinned Mathlib and Tau Ceti, the headline theorems that the finished roadmap
proves, each with `sorry`, together with the few simple definitions those statements need.

`M` is a manifold with boundary modelled on Mathlib's half-space `𝓡∂ (n + 1)`, with a Riemannian
metric. The definitions are made for a metric of class `C¹`, the regularity at which Mathlib's
Levi-Civita connection and Tau Ceti's Hessian, gradient and geodesics are defined; every theorem
adds smoothness of the metric (`IsContMDiffRiemannianBundle … ∞ …`). The boundary tangent space is
the image of the differential of the inclusion of Tau Ceti's boundary manifold, and the second
fundamental form is read off the Hessian of the normal coordinate of the preferred chart.

Stated here, in README order:

* Layer 2: the Hessian characterisation of strict convexity, for every boundary defining function
  (§2.2);
* Layer 3: the realisation of every Hausdorff second-countable Riemannian manifold with boundary
  as the regular domain `{ρ ≥ 0}` of a boundaryless Riemannian manifold, compact and connected
  when `M` is (§3.5);
* Layer 4: tangent geodesics leave a strictly convex boundary and nonconstant geodesics of a
  manifold with strictly convex boundary meet the boundary only at their endpoints (§4.2), and
  the existence of a convexity function near a strictly convex boundary point (§4.5);
* Layer 5: the regularity of the exit time, the smoothness of `σ` and `T` and the identity
  `Xσ = −2` (§5.4), the three equivalent non-trapping conditions (§5.5), and the involution,
  fixed-point and smoothness theorems of the scattering relation (§5.6).

The unit sphere bundle `SM` and its boundary `∂SM` carry no manifold structure at the pins (the
tangent bundle of a manifold with boundary is modelled on a product, not on `𝓡∂`, and Tau Ceti's
sphere bundles have boundaryless bases), so the Layer 5 statements are made on the tangent bundle
`TM` of `M` itself, where Tau Ceti's geodesic spray is defined: smoothness of the exit time on
`SM ∖ ∂₀SM` is smoothness on the open cone of nonzero non-glancing vectors (the exit time is
homogeneous of degree `−1`), and a smooth function on `SM` is the restriction of a smooth function
on `TM`. Every headline theorem of the roadmap is statable at the pins and is stated here.
-/

open Bundle Manifold Set Topology
open scoped ContDiff Manifold ENNReal

namespace TauCetiRoadmap.RiemannianManifoldsWithConvexBoundary

universe u

variable {n : ℕ} {M : Type u} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
  [IsManifold (𝓡∂ (n + 1)) ∞ M]

/-! ## Layer 1: The boundary as a Riemannian hypersurface -/

/-- The tangent space `T_q∂M` of the boundary at `q ∈ ∂M`, as a subspace of `T_qM`: the range of
the differential of the inclusion `∂M → M`, for Tau Ceti's manifold structure on the boundary
(README §1.1). It is a hyperplane, the kernel of the differential of the normal coordinate of
every half-space chart at `q`. -/
noncomputable def boundaryTangentSpace (q : (𝓡∂ (n + 1)).boundary M) :
    Submodule ℝ (TangentSpace (𝓡∂ (n + 1)) (q : M)) :=
  LinearMap.range (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1))
    (Subtype.val : (𝓡∂ (n + 1)).boundary M → M) q).toLinearMap

variable (n) in
/-- `ρ` is a boundary defining function on the open set `U ⊆ M`: smooth on `U`, positive at the
interior points of `U`, zero at the boundary points of `U`, with nonzero differential there
(README §1.3; Uhlmann–Vasy, `uhlmann-vasy2016` lines 25–26 and 134–136). -/
structure IsBoundaryDefiningFunctionOn (ρ : M → ℝ) (U : Set M) : Prop where
  isOpen : IsOpen U
  contMDiffOn : ContMDiffOn (𝓡∂ (n + 1)) 𝓘(ℝ) ∞ ρ U
  pos : ∀ x ∈ U, x ∈ (𝓡∂ (n + 1)).interior M → 0 < ρ x
  eq_zero : ∀ x ∈ U, x ∈ (𝓡∂ (n + 1)).boundary M → ρ x = 0
  mfderiv_ne_zero : ∀ x ∈ U, x ∈ (𝓡∂ (n + 1)).boundary M → mfderiv (𝓡∂ (n + 1)) 𝓘(ℝ) ρ x ≠ 0

variable [RiemannianBundle (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)]
  [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) 1 (EuclideanSpace ℝ (Fin (n + 1)))
    (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)]

/-- The scalar second fundamental form of `∂M` at `q`, on `T_q∂M`:
`II_q(u, w) = −Hess x⁰(u, w) / |dx⁰_q|`, where `x⁰` is the normal coordinate of the preferred
half-space chart at `q`, a boundary defining function near `q`, and `Hess` is Tau Ceti's Hessian of
`(M, g)` at the boundary point `q` (README §1.4). With this sign the boundary of the closed unit
ball has `II = h`, and `II(u, w) = ⟨∇_u ν_out, w⟩` for the outward unit normal. -/
noncomputable def secondFundamentalForm (q : (𝓡∂ (n + 1)).boundary M)
    (u w : boundaryTangentSpace q) : ℝ :=
  -TauCeti.Manifold.hessian (𝓡∂ (n + 1)) (fun y : M ↦ extChartAt (𝓡∂ (n + 1)) (q : M) y 0)
      (q : M) u w /
    ‖TauCeti.Manifold.mgradient (𝓡∂ (n + 1)) (fun y : M ↦ extChartAt (𝓡∂ (n + 1)) (q : M) y 0)
      (q : M)‖

/-! ## Layer 2: Convexity of the boundary -/

/-- `∂M` is strictly convex at `q`: `II_q(u, u) > 0` for every nonzero `u ∈ T_q∂M` (README §2.1;
Paternain–Salo–Uhlmann, Definition 3.1.7). In dimension one, where `T_q∂M = 0`, it holds at every
boundary point. -/
def IsStrictlyConvexAt (q : (𝓡∂ (n + 1)).boundary M) : Prop :=
  ∀ u : boundaryTangentSpace q, u ≠ 0 → 0 < secondFundamentalForm q u u

variable (n M) in
/-- `∂M` is strictly convex: it is strictly convex at every boundary point (README §2.1). -/
def IsStrictlyConvexBoundary : Prop :=
  ∀ q : (𝓡∂ (n + 1)).boundary M, IsStrictlyConvexAt q

/-- **Hessian characterisation of strict convexity.** For every boundary defining function `ρ` on
an open neighbourhood of `q ∈ ∂M`, the boundary is strictly convex at `q` exactly when `Hess ρ` is
negative definite on `T_q∂M` (README §2.2; Paternain–Salo–Uhlmann, Lemma 3.1.12; Uhlmann–Vasy,
`uhlmann-vasy2016` lines 499–503). -/
theorem isStrictlyConvexAt_iff_hessian_neg
    [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) ∞ (EuclideanSpace ℝ (Fin (n + 1)))
      (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)]
    {ρ : M → ℝ} {U : Set M} (hρ : IsBoundaryDefiningFunctionOn n ρ U)
    (q : (𝓡∂ (n + 1)).boundary M) (hq : (q : M) ∈ U) :
    IsStrictlyConvexAt q ↔
      ∀ v : boundaryTangentSpace q, v ≠ 0 →
        TauCeti.Manifold.hessian (𝓡∂ (n + 1)) ρ (q : M) v v < 0 := by
  sorry

/-! ## Layer 3: Regular domains and the extension across the boundary -/

section LevelSets

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {N : Type*} [TopologicalSpace N] [ChartedSpace E N] [IsManifold 𝓘(ℝ, E) ∞ N]
  [RiemannianBundle (fun y : N ↦ TangentSpace 𝓘(ℝ, E) y)]
  [IsContMDiffRiemannianBundle 𝓘(ℝ, E) 1 E (fun y : N ↦ TangentSpace 𝓘(ℝ, E) y)]

variable (E) in
/-- The level set of `x : N → ℝ` through `y` is strictly concave from the superlevel sets at `y`:
`dx_y ≠ 0` and `Hess x(v, v) > 0` for every nonzero `v ∈ ker dx_y` (README §3.2;
Stefanov–Uhlmann–Vasy, `stefanov-uhlmann-vasy2021` lines 128–129). For a regular domain
`{ρ ≥ 0}` and `x = −ρ` at a boundary point this is strict convexity of the boundary there. -/
def IsStrictlyConcaveLevelSetAt (x : N → ℝ) (y : N) : Prop :=
  mfderiv 𝓘(ℝ, E) 𝓘(ℝ) x y ≠ 0 ∧
    ∀ v : TangentSpace 𝓘(ℝ, E) y, mfderiv 𝓘(ℝ, E) 𝓘(ℝ) x y v = 0 → v ≠ 0 →
      0 < TauCeti.Manifold.hessian 𝓘(ℝ, E) x y v v

end LevelSets

/-- **The realisation theorem.** Every Hausdorff second-countable Riemannian manifold with boundary
`(M, g)` embeds isometrically, by a smooth embedding `j`, onto the regular domain `{ρ ≥ 0}` of a
smooth function `ρ` with regular value `0` on a Hausdorff second-countable boundaryless Riemannian
manifold `N` of the same dimension, with `j(∂M) = {ρ = 0}`; `N` is compact when `M` is, and
compact and connected when `M` is compact and connected (README §3.5; Paternain–Salo–Uhlmann,
Lemma 3.1.8; Stefanov–Uhlmann–Vasy, `stefanov-uhlmann-vasy2021` lines 96–97). -/
theorem exists_isSmoothEmbedding_regularDomain [T2Space M] [SecondCountableTopology M]
    [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) ∞ (EuclideanSpace ℝ (Fin (n + 1)))
      (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)] :
    ∃ (N : Type u) (_ : TopologicalSpace N)
      (_ : ChartedSpace (EuclideanSpace ℝ (Fin (n + 1))) N)
      (_ : IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin (n + 1))) ∞ N) (_ : T2Space N)
      (_ : SecondCountableTopology N)
      (_ : RiemannianBundle (fun y : N ↦ TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin (n + 1))) y))
      (_ : IsContMDiffRiemannianBundle 𝓘(ℝ, EuclideanSpace ℝ (Fin (n + 1))) ∞
        (EuclideanSpace ℝ (Fin (n + 1)))
        (fun y : N ↦ TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin (n + 1))) y))
      (ρ : N → ℝ) (j : M → N),
      ContMDiff 𝓘(ℝ, EuclideanSpace ℝ (Fin (n + 1))) 𝓘(ℝ) ∞ ρ ∧
      TauCeti.IsRegularValue 𝓘(ℝ, EuclideanSpace ℝ (Fin (n + 1))) 𝓘(ℝ) ρ 0 ∧
      IsSmoothEmbedding (𝓡∂ (n + 1)) 𝓘(ℝ, EuclideanSpace ℝ (Fin (n + 1))) ∞ j ∧
      range j = {y | 0 ≤ ρ y} ∧ j '' (𝓡∂ (n + 1)).boundary M = {y | ρ y = 0} ∧
      (∀ (x : M) (v w : TangentSpace (𝓡∂ (n + 1)) x),
        inner ℝ (mfderiv (𝓡∂ (n + 1)) 𝓘(ℝ, EuclideanSpace ℝ (Fin (n + 1))) j x v)
          (mfderiv (𝓡∂ (n + 1)) 𝓘(ℝ, EuclideanSpace ℝ (Fin (n + 1))) j x w) =
        inner ℝ v w) ∧
      (CompactSpace M → CompactSpace N) ∧
      (CompactSpace M → ConnectedSpace M → ConnectedSpace N) := by
  sorry

/-! ## Layer 4: Geodesics at the boundary -/

/-- **Tangent geodesics leave a strictly convex boundary.** If `∂M` is strictly convex at `q`, no
geodesic of `(M, g)` on `[0, ε)`, `ε > 0`, starts at `q` with a nonzero velocity tangent to `∂M`
(README §4.2; Paternain–Salo–Uhlmann, Lemmas 3.1.12–3.1.13). -/
theorem not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt
    [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) ∞ (EuclideanSpace ℝ (Fin (n + 1)))
      (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)]
    {q : (𝓡∂ (n + 1)).boundary M} (hq : IsStrictlyConvexAt q) {v : boundaryTangentSpace q}
    (hv : v ≠ 0) {ε : ℝ} (hε : 0 < ε) :
    ¬ ∃ γ : ℝ → M, TauCeti.Manifold.IsGeodesicCurveOnFrom (𝓡∂ (n + 1)) γ (Ico 0 ε) q v := by
  sorry

/-- **No interior tangency.** If `∂M` is strictly convex, a nonconstant geodesic of `(M, g)` on
`[a, b]` lies in the interior of `M` at every time strictly between `a` and `b` (README §4.2;
Paternain–Salo–Uhlmann, `paternain-salo-uhlmann2023` lines 2795–2798). -/
theorem mem_interior_of_isGeodesicCurveOn
    [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) ∞ (EuclideanSpace ℝ (Fin (n + 1)))
      (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)]
    (hconv : IsStrictlyConvexBoundary n M) {γ : ℝ → M} {a b : ℝ}
    (hγ : TauCeti.Manifold.IsGeodesicCurveOn (𝓡∂ (n + 1)) γ (Icc a b))
    (hnc : ∃ s ∈ Icc a b, γ s ≠ γ a) {t : ℝ} (ht : t ∈ Ioo a b) :
    γ t ∈ (𝓡∂ (n + 1)).interior M := by
  sorry

section LevelSets

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {N : Type*} [TopologicalSpace N] [ChartedSpace E N] [IsManifold 𝓘(ℝ, E) ∞ N]
  [RiemannianBundle (fun y : N ↦ TangentSpace 𝓘(ℝ, E) y)]
  [IsContMDiffRiemannianBundle 𝓘(ℝ, E) 1 E (fun y : N ↦ TangentSpace 𝓘(ℝ, E) y)]

/-- **Convexity functions near a strictly convex boundary point.** Let `ρ` be smooth on a
Hausdorff boundaryless Riemannian manifold `N`, and `q` a zero of `ρ` at which the level set of
`−ρ` is strictly concave from the superlevel sets (strict convexity of `∂{ρ ≥ 0}` at `q`). Then
there is a convexity function at `q` for `ρ`, by which the roadmap means an open `U ∋ q` and a
function `x̃`, smooth on `U`, with `x̃(q) = 0`, `dx̃_q = −dρ_q`,
level sets strictly concave from the superlevel sets at every point of `U`, and
`{y ∈ U : x̃(y) ≥ −c, ρ(y) ≥ 0}` compact for every `c ∈ [0, c₀]`, some `c₀ > 0` (README §4.5;
Uhlmann–Vasy, `uhlmann-vasy2016` lines 30–32 and 504–524). -/
theorem exists_convexityFunction [T2Space N]
    [IsContMDiffRiemannianBundle 𝓘(ℝ, E) ∞ E (fun y : N ↦ TangentSpace 𝓘(ℝ, E) y)]
    {ρ : N → ℝ} (hρ : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) ∞ ρ) {q : N} (hq : ρ q = 0)
    (hconv : IsStrictlyConcaveLevelSetAt E (fun y ↦ -ρ y) q) :
    ∃ U : Set N, IsOpen U ∧ q ∈ U ∧ ∃ x : N → ℝ, ContMDiffOn 𝓘(ℝ, E) 𝓘(ℝ) ∞ x U ∧ x q = 0 ∧
      mfderiv 𝓘(ℝ, E) 𝓘(ℝ) x q = -mfderiv 𝓘(ℝ, E) 𝓘(ℝ) ρ q ∧
      (∀ y ∈ U, IsStrictlyConcaveLevelSetAt E x y) ∧
      ∃ c₀ > 0, ∀ c ∈ Icc 0 c₀, IsCompact {y ∈ U | -c ≤ x y ∧ 0 ≤ ρ y} := by
  sorry

end LevelSets

/-! ## Layer 5: Exit time and scattering relation -/

/-- A tangent vector `z = (x, v)` of `M` is glancing when `x ∈ ∂M` and `v ∈ T_x∂M` (README §5.1);
the glancing unit vectors form `∂₀SM`. -/
def IsGlancing (z : TangentBundle (𝓡∂ (n + 1)) M) : Prop :=
  ∃ hz : z.proj ∈ (𝓡∂ (n + 1)).boundary M, z.snd ∈ boundaryTangentSpace ⟨z.proj, hz⟩

/-- The exit time `τ(x, v) ∈ [0, ∞]`: the supremum of the `T > 0` for which a geodesic of
`(M, g)` itself is defined on `[0, T]` with initial point `x` and velocity `v`, and `0` when there
is none (README §5.2; Paternain–Salo–Uhlmann, Definition 3.1.1). The constant curve gives
`τ(x, 0) = ∞`. -/
noncomputable def exitTime (z : TangentBundle (𝓡∂ (n + 1)) M) : ℝ≥0∞ :=
  ⨆ (T : ℝ) (_ : ∃ γ : ℝ → M,
      TauCeti.Manifold.IsGeodesicCurveOnFrom (𝓡∂ (n + 1)) γ (Icc 0 T) z.proj z.snd),
    ENNReal.ofReal T

variable (n M) in
/-- `(M, g)` is non-trapping: every unit tangent vector has finite exit time (README §5.2;
Paternain–Salo–Uhlmann, Definition 3.1.3). -/
def IsNonTrapping : Prop :=
  ∀ z : TangentBundle (𝓡∂ (n + 1)) M, ‖z.snd‖ = 1 → exitTime z < ⊤

open Classical in
/-- The endpoint `(γ(T), γ'(T))` in `TM` of a geodesic `γ` of `(M, g)` on `[0, T]` issuing from
`z`, and `z` itself when there is none, as for every `T ≤ 0`. For Hausdorff `M`, geodesics of `M`
with the same initial data agree on a common interval (README §4.1), so the choice of `γ` does not
matter; without the Hausdorff property the value can depend on the choice (the half-line with a
doubled point, README §5.6), and every theorem about this map assumes `[T2Space M]`. -/
noncomputable def geodesicEndpoint (z : TangentBundle (𝓡∂ (n + 1)) M) (T : ℝ) :
    TangentBundle (𝓡∂ (n + 1)) M :=
  if h : ∃ γ : ℝ → M,
      TauCeti.Manifold.IsGeodesicCurveOnFrom (𝓡∂ (n + 1)) γ (Icc 0 T) z.proj z.snd then
    TotalSpace.mk' (EuclideanSpace ℝ (Fin (n + 1))) (h.choose T)
      (TauCeti.Manifold.curveVelocityWithin (𝓡∂ (n + 1)) h.choose (Icc 0 T) T)
  else z

/-- The scattering relation `α(z) = φ_{τ̃(z)}(z)` on `∂SM`: for `z` with positive finite exit time,
the endpoint of the geodesic of `M` issuing from `z` at its exit time; otherwise `(y, −w)` for the
endpoint `(y, w)` of the geodesic issuing from `−z` at the exit time of `−z` (at time `0`, so
`(y, w) = −z`, when that exit time is infinite), which runs the geodesic through `z` backwards to
its entry point; a glancing vector of a strictly convex boundary is fixed (README §5.6;
Paternain–Salo–Uhlmann, Definition 3.3.4). -/
noncomputable def scatteringRelation (z : TangentBundle (𝓡∂ (n + 1)) M) :
    TangentBundle (𝓡∂ (n + 1)) M :=
  if 0 < (exitTime z).toReal then geodesicEndpoint z (exitTime z).toReal
  else
    let w := geodesicEndpoint (TotalSpace.mk z.proj (-z.snd) : TangentBundle (𝓡∂ (n + 1)) M)
      (exitTime (TotalSpace.mk z.proj (-z.snd) : TangentBundle (𝓡∂ (n + 1)) M)).toReal
    TotalSpace.mk w.proj (-w.snd)

/-- **Regularity of the exit time.** On a compact Hausdorff non-trapping `(M, g)` with strictly
convex boundary, the exit time is smooth on the open set of nonzero tangent vectors that are not
glancing, and continuous on the nonzero tangent vectors (README §5.4; Paternain–Salo–Uhlmann,
Lemma 3.2.3, Exercise 3.2.4). -/
theorem contMDiffOn_exitTime [T2Space M] [CompactSpace M]
    [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) ∞ (EuclideanSpace ℝ (Fin (n + 1)))
      (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)]
    (hconv : IsStrictlyConvexBoundary n M) (htrap : IsNonTrapping n M) :
    ContMDiffOn (𝓡∂ (n + 1)).tangent 𝓘(ℝ) ∞ (fun z ↦ (exitTime z).toReal)
      {z : TangentBundle (𝓡∂ (n + 1)) M | z.snd ≠ 0 ∧ ¬ IsGlancing z} ∧
    ContinuousOn (fun z ↦ (exitTime z).toReal)
      {z : TangentBundle (𝓡∂ (n + 1)) M | z.snd ≠ 0} := by
  sorry

/-- **`σ` is smooth and `Xσ = −2`.** On a compact Hausdorff non-trapping `(M, g)` with strictly
convex boundary, `σ(x, v) = τ(x, v) − τ(x, −v)` is, on the unit sphere bundle `SM`, the restriction
of a smooth function `F` on `TM`, and the derivative of `F` along Tau Ceti's geodesic spray is `−2`
on `SM`. On `∂SM`, `σ` is the odd extension `τ̃` (README §5.4; Paternain–Salo–Uhlmann, Lemma 3.2.11
by the fold form of Lemma 3.2.9, Remark 3.2.7 and Lemma 3.2.6 for the restriction to `∂SM`,
Exercise 3.3.3). -/
theorem exists_contMDiff_eq_exitTime_sub_exitTime_neg [T2Space M] [CompactSpace M]
    [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) ∞ (EuclideanSpace ℝ (Fin (n + 1)))
      (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)]
    (hconv : IsStrictlyConvexBoundary n M) (htrap : IsNonTrapping n M) :
    ∃ F : TangentBundle (𝓡∂ (n + 1)) M → ℝ, ContMDiff (𝓡∂ (n + 1)).tangent 𝓘(ℝ) ∞ F ∧
      ∀ z : TangentBundle (𝓡∂ (n + 1)) M, ‖z.snd‖ = 1 →
        F z = (exitTime z).toReal -
          (exitTime (TotalSpace.mk z.proj (-z.snd) : TangentBundle (𝓡∂ (n + 1)) M)).toReal ∧
        mfderiv (𝓡∂ (n + 1)).tangent 𝓘(ℝ) F z
          (TauCeti.Manifold.geodesicSpray (𝓡∂ (n + 1)) M z) = (-2 : ℝ) := by
  sorry

/-- **`T` is smooth.** On a compact Hausdorff non-trapping `(M, g)` with strictly convex boundary,
the product `T(x, v) = τ(x, v) τ(x, −v)` is, on the unit sphere bundle `SM`, the restriction of a
smooth function `G` on `TM`. Together with `σ` it gives the exit time across the glancing set:
`τ = (σ + √(σ² + 4T))/2` on `SM` (README §5.4; Paternain–Salo–Uhlmann, Lemma 3.2.11 and
Remark 3.2.13). -/
theorem exists_contMDiff_eq_exitTime_mul_exitTime_neg [T2Space M] [CompactSpace M]
    [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) ∞ (EuclideanSpace ℝ (Fin (n + 1)))
      (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)]
    (hconv : IsStrictlyConvexBoundary n M) (htrap : IsNonTrapping n M) :
    ∃ G : TangentBundle (𝓡∂ (n + 1)) M → ℝ, ContMDiff (𝓡∂ (n + 1)).tangent 𝓘(ℝ) ∞ G ∧
      ∀ z : TangentBundle (𝓡∂ (n + 1)) M, ‖z.snd‖ = 1 →
        G z = (exitTime z).toReal *
          (exitTime (TotalSpace.mk z.proj (-z.snd) : TangentBundle (𝓡∂ (n + 1)) M)).toReal := by
  sorry

/-- **Non-trapping criteria** (Paternain–Salo–Uhlmann, Proposition 3.3.1). For a compact Hausdorff
`(M, g)` with strictly convex boundary the following are equivalent: `M` is non-trapping; the
geodesic vector field `X` is surjective on smooth functions on `SM` (every smooth `h` on `TM` is
`Xu` on `SM` for a smooth `u` on `TM`); some smooth `f` on `TM` has `Xf > 0` on `SM`
(README §5.5). -/
theorem isNonTrapping_tfae [T2Space M] [CompactSpace M]
    [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) ∞ (EuclideanSpace ℝ (Fin (n + 1)))
      (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)]
    (hconv : IsStrictlyConvexBoundary n M) :
    List.TFAE
      [IsNonTrapping n M,
        ∀ h : TangentBundle (𝓡∂ (n + 1)) M → ℝ, ContMDiff (𝓡∂ (n + 1)).tangent 𝓘(ℝ) ∞ h →
          ∃ u : TangentBundle (𝓡∂ (n + 1)) M → ℝ, ContMDiff (𝓡∂ (n + 1)).tangent 𝓘(ℝ) ∞ u ∧
            ∀ z : TangentBundle (𝓡∂ (n + 1)) M, ‖z.snd‖ = 1 →
              mfderiv (𝓡∂ (n + 1)).tangent 𝓘(ℝ) u z
                (TauCeti.Manifold.geodesicSpray (𝓡∂ (n + 1)) M z) = h z,
        ∃ f : TangentBundle (𝓡∂ (n + 1)) M → ℝ, ContMDiff (𝓡∂ (n + 1)).tangent 𝓘(ℝ) ∞ f ∧
          ∀ z : TangentBundle (𝓡∂ (n + 1)) M, ‖z.snd‖ = 1 →
            (0 : ℝ) < mfderiv (𝓡∂ (n + 1)).tangent 𝓘(ℝ) f z
              (TauCeti.Manifold.geodesicSpray (𝓡∂ (n + 1)) M z)] := by
  sorry

/-- **The scattering relation is an involution of `∂SM` fixing exactly the glancing set.** On a
compact Hausdorff non-trapping `(M, g)` with strictly convex boundary, `α` maps `∂SM` to itself,
`α ∘ α = id` there, `α(z) = z` exactly for glancing `z`, and `α` exchanges inward and outward
non-glancing vectors (README §5.6; Paternain–Salo–Uhlmann, Lemma 3.3.5). -/
theorem scatteringRelation_involutive [T2Space M] [CompactSpace M]
    [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) ∞ (EuclideanSpace ℝ (Fin (n + 1)))
      (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)]
    (hconv : IsStrictlyConvexBoundary n M) (htrap : IsNonTrapping n M)
    (z : TangentBundle (𝓡∂ (n + 1)) M) (hz : z.proj ∈ (𝓡∂ (n + 1)).boundary M)
    (hz1 : ‖z.snd‖ = 1) :
    (scatteringRelation z).proj ∈ (𝓡∂ (n + 1)).boundary M ∧
      ‖(scatteringRelation z).snd‖ = 1 ∧
      scatteringRelation (scatteringRelation z) = z ∧
      (scatteringRelation z = z ↔ IsGlancing z) ∧
      (¬ IsGlancing z → (TauCeti.IsOutwardPointing (scatteringRelation z).proj
        (scatteringRelation z).snd ↔ ¬ TauCeti.IsOutwardPointing z.proj z.snd)) := by
  sorry

/-- **The scattering relation is smooth.** On a compact Hausdorff non-trapping `(M, g)` with
strictly convex boundary, near every point of `∂SM` the scattering relation is the restriction to
`∂SM` of a smooth map of an open subset of `TM` into `TM`; with the involution property, `α` is a
diffeomorphism of `∂SM` (README §5.6; Paternain–Salo–Uhlmann, Lemma 3.3.5). -/
theorem exists_contMDiffOn_eq_scatteringRelation [T2Space M] [CompactSpace M]
    [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) ∞ (EuclideanSpace ℝ (Fin (n + 1)))
      (fun x : M ↦ TangentSpace (𝓡∂ (n + 1)) x)]
    (hconv : IsStrictlyConvexBoundary n M) (htrap : IsNonTrapping n M)
    (z : TangentBundle (𝓡∂ (n + 1)) M) (hz : z.proj ∈ (𝓡∂ (n + 1)).boundary M)
    (hz1 : ‖z.snd‖ = 1) :
    ∃ U ∈ 𝓝 z, ∃ F : TangentBundle (𝓡∂ (n + 1)) M → TangentBundle (𝓡∂ (n + 1)) M,
      ContMDiffOn (𝓡∂ (n + 1)).tangent (𝓡∂ (n + 1)).tangent ∞ F U ∧
        ∀ w ∈ U, w.proj ∈ (𝓡∂ (n + 1)).boundary M → ‖w.snd‖ = 1 →
          F w = scatteringRelation w := by
  sorry

end TauCetiRoadmap.RiemannianManifoldsWithConvexBoundary
