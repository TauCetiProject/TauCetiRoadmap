import Mathlib
import TauCeti.Geometry.Manifold.IntegralCurve.Extension
import TauCeti.Geometry.Manifold.LocalDiffeomorph
import TauCeti.Geometry.Manifold.Riemannian.ArcLength
import TauCeti.Geometry.Manifold.Riemannian.Convex
import TauCeti.Geometry.Manifold.Riemannian.Distance
import TauCeti.Geometry.Manifold.Riemannian.EDistComparison
import TauCeti.Geometry.Manifold.Riemannian.EVariationComparison
import TauCeti.Geometry.Manifold.Riemannian.Examples.OpenUnitBall
import TauCeti.Geometry.Manifold.Riemannian.FirstVariation
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Compact
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Completeness
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.ConstantSpeed
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Escape
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Euclidean
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Examples.OpenUnitBall
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.FirstVariation
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Flow
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Gauss.Basic
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Gauss.Distance
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Gauss.Escape
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Gauss.Minimization
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Gauss.Polar
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Gauss.Rigidity
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Gauss.Uniqueness
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.HopfRinow
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Maximal
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.MetricSegment
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Minimizing
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Normal
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.ProperSpace
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Smoothness
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Spray
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Trajectory
import TauCeti.Geometry.Manifold.Riemannian.Isometry.Completeness
import TauCeti.Geometry.Manifold.Riemannian.Isometry.Distance
import TauCeti.Geometry.Manifold.Riemannian.Isometry.Exponential
import TauCeti.Geometry.Manifold.Riemannian.Isometry.Geodesic
import TauCeti.Geometry.Manifold.Riemannian.Isometry.LeviCivita
import TauCeti.Geometry.Manifold.Riemannian.LengthSpace
import TauCeti.Geometry.Manifold.Riemannian.PathELength
import TauCeti.Geometry.Manifold.Riemannian.PiecewisePath
import TauCeti.Geometry.Manifold.Riemannian.Restriction
import TauCeti.Geometry.Manifold.Riemannian.VariationField
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.AlongCurve.Acceleration
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.AlongCurve.Chart
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.AlongCurve.Pullback
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.AlongCurve.Surface
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
import TauCeti.Topology.MetricSpace.Length
import TauCeti.Topology.MetricSpace.ProperSpace

/-!
# Geodesics, the exponential map, and Hopf-Rinow: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

Every milestone of `README.md` has a statement here, in the form the roadmap asks for, closed by
the Tau Ceti (or Mathlib) declaration that realizes it, so the correspondence is checked by the Lean
kernel rather than asserted in prose. Every statement is proved. That is evidence for completion,
not its criterion: completion is judged by a milestone-by-milestone audit against `README.md`,
which a fully proved file of suggested forms cannot replace.

The earlier version of this file stated only the Layer 0 comparison, over partitions indexed by
`ℕ`, and deferred the geodesic-level signatures until Layer 1 made their types expressible. That
statement is kept (`riemannianEDist_eq_iInf_piecewiseCOne`) and closed through Tau Ceti's
`IsPiecewiseContMDiffOn`, whose partitions are indexed by `Fin`; the deferred signatures are now
stated about the Tau Ceti objects. The metric is the canonical `RiemannianBundle` instance
throughout. The local theory is stated over `[TopologicalSpace M]`, with `[T2Space M]` where Tau
Ceti needs it, and the metric theory over `[MetricSpace M] [IsRiemannianManifold I M]`. Some
differences from the README's requested forms are deliberate.

* **No `[ConnectedSpace M]`.** A metric compatible with the Riemannian structure already makes the
  Riemannian distance finite, hence `M` connected, so Layers 3–4 carry no connectedness hypothesis.
  Compact ⇒ geodesically complete is proved through the extended metric and needs neither
  connectedness nor a metric; the README took the connected route only for convenience.
* **Constant-speed reparametrization** assumes the curve `C¹` on an open set containing `[a, b]`
  rather than `C¹` within `[a, b]`, and produces unit speed on `[0, L]`; constant speed on `[0, 1]`
  is a rescaling.
* **Spray and geodesics.** The base curve of an integral curve of the spray is a geodesic outright
  on open parameter sets; on a general set with unique derivatives Tau Ceti also asks the base
  curve to be `C²`. Every downstream use is on open intervals.
* **Normal coordinates** are the partial diffeomorphism `IsNormalDomain.toPartialDiffeomorph` onto
  the normal neighbourhood from a normal domain in `T_p M`; no chart into `ℝⁿ` through an
  orthonormal frame is named.
* **The escape estimate** is Tau Ceti's for `C¹` competitors on `[0, 1]`. The piecewise-`C¹` form
  that the README's word "competitor" asks for is derived below from the distance identity.
* **Criticality of the energy** is for curves `C^∞` near every point of `[a, b]`, and the geodesic
  it characterizes is on the open interval `uIoo a b`.
* **Levi-Civita existence and uniqueness** and `IsMetricCompatible` are Mathlib's, which the README
  allows; Tau Ceti keeps no local shim.

Left out: the Myers–Steenrod theorem, which the README excludes (transport is stated only for smooth
Riemannian isometries). The README's process items (homes, consuming `Manifold.pathELength_add`
rather than reproving it, the canonical length and distance convention, recording frenzymath
provenance) are conventions met by the Tau Ceti files, not statements.
-/

namespace TauCetiRoadmap.HopfRinow

open Bundle CovariantDerivative Filter Manifold Set TopologicalSpace TauCeti.Manifold
open scoped ContDiff ENNReal Manifold Topology

/-! ## Layer 0: the reconciled Riemannian distance -/

section Distance

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  {γ : ℝ → M} {a b : ℝ}

/-- **Subdivision**, by finite iteration of Mathlib's `Manifold.pathELength_add`: the lengths of
the pieces of an ordered partition add up to the length over the whole interval. -/
theorem sum_pathELength_eq {r : ℕ} (τ : Fin (r + 1) → ℝ)
    (hτ : ∀ i : Fin r, τ i.castSucc ≤ τ i.succ) :
    ∑ i : Fin r, pathELength I γ (τ i.castSucc) (τ i.succ) =
      pathELength I γ (τ 0) (τ (Fin.last r)) :=
  TauCeti.Manifold.sum_pathELength_eq τ hτ

omit [RiemannianBundle (fun x : M ↦ TangentSpace I x)] in
/-- **Piecewise `C^n` paths** are defined by a nonempty finite strict partition. -/
theorem isPiecewiseContMDiffOn_iff (n : WithTop ℕ∞) :
    IsPiecewiseContMDiffOn I n γ a b ↔
      ∃ (k : ℕ) (τ : Fin (k + 2) → ℝ), τ 0 = a ∧ τ (Fin.last (k + 1)) = b ∧
        (∀ i : Fin (k + 1), τ i.castSucc < τ i.succ) ∧
        ∀ i : Fin (k + 1), ContMDiffOn 𝓘(ℝ, ℝ) I n γ (Icc (τ i.castSucc) (τ i.succ)) :=
  Iff.rfl

/-- The length of a piecewise `C^n` path is the sum of the lengths of its pieces. -/
theorem IsPiecewiseContMDiffOn.exists_partition_sum_pathELength_eq {n : WithTop ℕ∞}
    (h : IsPiecewiseContMDiffOn I n γ a b) :
    ∃ (k : ℕ) (τ : Fin (k + 2) → ℝ), τ 0 = a ∧ τ (Fin.last (k + 1)) = b ∧
      (∀ i : Fin (k + 1), τ i.castSucc < τ i.succ) ∧
      (∀ i : Fin (k + 1), ContMDiffOn 𝓘(ℝ, ℝ) I n γ (Icc (τ i.castSucc) (τ i.succ))) ∧
      ∑ i : Fin (k + 1), pathELength I γ (τ i.castSucc) (τ i.succ) = pathELength I γ a b :=
  TauCeti.Manifold.IsPiecewiseContMDiffOn.exists_partition_sum_pathELength_eq h

/-- **Independence under refinement**: two ordered partitions with the same endpoints give the same
sum of piece lengths. -/
theorem sum_pathELength_eq_of_endpoints_eq {r s : ℕ} {τ : Fin (r + 1) → ℝ}
    {σ : Fin (s + 1) → ℝ} (hτ : ∀ i : Fin r, τ i.castSucc ≤ τ i.succ)
    (hσ : ∀ i : Fin s, σ i.castSucc ≤ σ i.succ) (h₀ : τ 0 = σ 0)
    (h₁ : τ (Fin.last r) = σ (Fin.last s)) :
    ∑ i : Fin r, pathELength I γ (τ i.castSucc) (τ i.succ) =
      ∑ i : Fin s, pathELength I γ (σ i.castSucc) (σ i.succ) :=
  TauCeti.Manifold.sum_pathELength_eq_of_endpoints_eq hτ hσ h₀ h₁

/-- **Corner smoothing**: a piecewise `C¹` path has a `C¹` reparametrization on `[0, 1]` with the
same endpoints and length, inside the original image. -/
theorem IsPiecewiseContMDiffOn.exists_contMDiff_pathELength_eq
    (h : IsPiecewiseContMDiffOn I 1 γ a b) :
    ∃ η : ℝ → M, ContMDiff 𝓘(ℝ, ℝ) I 1 η ∧ η 0 = γ a ∧ η 1 = γ b ∧
      pathELength I η 0 1 = pathELength I γ a b ∧ MapsTo η (Icc 0 1) (γ '' Icc a b) :=
  TauCeti.Manifold.IsPiecewiseContMDiffOn.exists_contMDiff_pathELength_eq h

/-- **do Carmo's piecewise-`C¹` distance is Mathlib's `C¹` distance**, over arbitrary parameter
intervals. -/
theorem riemannianEDist_eq_iInf_pathELength_piecewise (x y : M) :
    riemannianEDist I x y =
      ⨅ (γ : ℝ → M) (a : ℝ) (b : ℝ) (_ : IsPiecewiseContMDiffOn I 1 γ a b)
        (_ : γ a = x) (_ : γ b = y), pathELength I γ a b :=
  TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise I x y

/-- **The earlier Layer 0 target**, with partitions indexed by `ℕ`: Mathlib's Riemannian extended
distance is the infimum of `pathELength` over curves that are `C¹` on every piece of a finite strict
partition. -/
theorem riemannianEDist_eq_iInf_piecewiseCOne (x y : M) :
    Manifold.riemannianEDist I x y =
      ⨅ (γ : ℝ → M) (n : ℕ) (τ : ℕ → ℝ) (_ : 0 < n)
        (_ : ∀ i < n, τ i < τ (i + 1))
        (_ : ∀ i < n, ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ (Icc (τ i) (τ (i + 1))))
        (_ : γ (τ 0) = x) (_ : γ (τ n) = y),
        Manifold.pathELength I γ (τ 0) (τ n) := by
  rw [TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise I x y]
  refine le_antisymm ?_ ?_
  · refine le_iInf fun γ ↦ le_iInf fun n ↦ le_iInf fun τ ↦ le_iInf fun hn ↦ le_iInf fun hτ ↦
      le_iInf fun hγ ↦ le_iInf fun hx ↦ le_iInf fun hy ↦ ?_
    obtain ⟨k, rfl⟩ := Nat.exists_eq_add_one_of_ne_zero hn.ne'
    have hpw : IsPiecewiseContMDiffOn I 1 γ (τ 0) (τ (k + 1)) :=
      TauCeti.Manifold.IsPiecewiseContMDiffOn.of_partition (fun i : Fin (k + 2) ↦ τ i) rfl rfl
        (fun i ↦ hτ i i.isLt) (fun i ↦ hγ i i.isLt)
    exact iInf₂_le_of_le γ (τ 0) <| iInf₂_le_of_le (τ (k + 1)) hpw <| iInf₂_le hx hy
  · refine le_iInf fun γ ↦ le_iInf fun a ↦ le_iInf fun b ↦ le_iInf fun hpw ↦ le_iInf fun hx ↦
      le_iInf fun hy ↦ ?_
    obtain ⟨k, τ, h0, hlast, hτ, hγ⟩ := hpw
    let σ : ℕ → ℝ := fun i ↦ if h : i < k + 2 then τ ⟨i, h⟩ else b
    have hσ (i : ℕ) (hi : i < k + 1) :
        σ i = τ (⟨i, hi⟩ : Fin (k + 1)).castSucc ∧ σ (i + 1) = τ (⟨i, hi⟩ : Fin (k + 1)).succ :=
      ⟨dite_eq_left (by omega), dite_eq_left (by omega)⟩
    have hσ0 : σ 0 = a := (dite_eq_left (by omega)).trans h0
    have hσn : σ (k + 1) = b := (dite_eq_left (by omega)).trans hlast
    refine iInf₂_le_of_le γ (k + 1) <| iInf₂_le_of_le σ k.succ_pos <| iInf₂_le_of_le
      (fun i hi ↦ by rw [(hσ i hi).1, (hσ i hi).2]; exact hτ ⟨i, hi⟩)
      (fun i hi ↦ by rw [(hσ i hi).1, (hσ i hi).2]; exact hγ ⟨i, hi⟩) <|
      iInf₂_le_of_le (hσ0 ▸ hx) (hσn ▸ hy) ?_
    rw [hσ0, hσn]

/-- **Restriction to open submanifolds**: the restricted metric is the ambient one under the
canonical tangent-space identification. -/
theorem inner_tangentSpace_open (U : Opens M) (x : U) (v w : TangentSpace I x) :
    letI := TauCeti.Manifold.instRiemannianBundleOpen (I := I) U
    inner ℝ v w = RiemannianBundle.g.inner (x : M)
      (tangentSpaceOpenEquiv (I := I) x v) (tangentSpaceOpenEquiv (I := I) x w) :=
  TauCeti.Manifold.inner_tangentSpace_open U x v w

open scoped TauCeti in
/-- The restricted metric of a `C^∞` metric is `C^∞`. -/
example [IsManifold I ∞ M] [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    (U : Opens M) : IsContMDiffRiemannianBundle I ∞ E (fun x : U ↦ TangentSpace I x) :=
  inferInstance

open scoped TauCeti in
/-- `EMetricSpace.ofRiemannianMetric` applies on an open submanifold. -/
example [T3Space M] [IsManifold I 1 M]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)] (U : Opens M) :
    letI := EMetricSpace.ofRiemannianMetric I U
    IsRiemannianManifold I U :=
  inferInstance

variable [IsManifold I 1 M] [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]

/-- **Finiteness**: on a connected manifold the Riemannian extended distance is never `∞`. -/
theorem riemannianEDist_ne_top [PreconnectedSpace M] (x y : M) : riemannianEDist I x y ≠ ⊤ :=
  TauCeti.Manifold.riemannianEDist_ne_top I x y

/-- Only then the compatible ordinary metric: `TauCeti.MetricSpace.ofRiemannianMetric` satisfies
`IsRiemannianManifold`. -/
example [T3Space M] [PreconnectedSpace M] :
    letI := TauCeti.MetricSpace.ofRiemannianMetric I M
    IsRiemannianManifold I M :=
  inferInstance

/-- The ordinary metric induces the manifold topology. -/
example [T3Space M] [PreconnectedSpace M] :
    (TauCeti.MetricSpace.ofRiemannianMetric I M).toUniformSpace.toTopologicalSpace =
      ‹TopologicalSpace M› :=
  rfl

/-- **Constant-speed reparametrization** of a regular `C¹` curve: arc length `ψ` turns `γ` into a
unit-speed curve on `[0, L]` with the same endpoints and length. -/
theorem exists_unit_speed_reparametrization {J : Set ℝ} (hJ : IsOpen J)
    (hγ : ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ J) (hab : a ≤ b) (hsub : Icc a b ⊆ J)
    (hreg : ∀ t ∈ Icc a b, curveVelocity I γ t ≠ 0) :
    ∃ ψ : ℝ → ℝ,
      (∀ t ∈ Icc a b, ψ (∫ r in a..t, ‖curveVelocity I γ r‖) = t) ∧
      (∀ s ∈ Icc (0 : ℝ) (∫ r in a..b, ‖curveVelocity I γ r‖),
        (∫ r in a..ψ s, ‖curveVelocity I γ r‖) = s) ∧
      (∀ s ∈ Icc (0 : ℝ) (∫ r in a..b, ‖curveVelocity I γ r‖), ψ s ∈ Icc a b) ∧
      StrictMonoOn ψ (Icc 0 (∫ r in a..b, ‖curveVelocity I γ r‖)) ∧
      ContDiffOn ℝ 1 ψ (Icc 0 (∫ r in a..b, ‖curveVelocity I γ r‖)) ∧
      ContMDiffOn 𝓘(ℝ, ℝ) I 1 (γ ∘ ψ) (Icc 0 (∫ r in a..b, ‖curveVelocity I γ r‖)) ∧
      (γ ∘ ψ) 0 = γ a ∧
      (γ ∘ ψ) (∫ r in a..b, ‖curveVelocity I γ r‖) = γ b ∧
      (∀ s ∈ Icc (0 : ℝ) (∫ r in a..b, ‖curveVelocity I γ r‖),
        ‖curveVelocity I (γ ∘ ψ) s‖ = 1) ∧
      pathELength I (γ ∘ ψ) 0 (∫ r in a..b, ‖curveVelocity I γ r‖) = pathELength I γ a b ∧
      (∫ r in a..b, ‖curveVelocity I γ r‖) = (pathELength I γ a b).toReal :=
  TauCeti.Manifold.exists_unit_speed_reparametrization hJ hγ hab hsub hreg

end Distance

section LowerSemicontinuity

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [PseudoEMetricSpace M] [ChartedSpace H M] [IsManifold I 1 M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)] [IsRiemannianManifold I M]

/-- **Lower semicontinuity of length** for `C¹` curves converging uniformly on `[a, b]` to a `C¹`
curve. -/
theorem pathELength_le_liminf_pathELength {γ : ℝ → M} {γs : ℕ → ℝ → M} {a b : ℝ}
    (hγs : ∀ n, ContMDiffOn 𝓘(ℝ, ℝ) I 1 (γs n) (Icc a b))
    (hγ : ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ (Icc a b)) (hconv : TendstoUniformlyOn γs γ atTop (Icc a b)) :
    pathELength I γ a b ≤ atTop.liminf fun n ↦ pathELength I (γs n) a b :=
  TauCeti.Manifold.pathELength_le_liminf_pathELength_of_tendstoUniformlyOn
    (Eventually.of_forall hγs) hγ hconv

end LowerSemicontinuity

section Convex

open scoped TauCeti

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] (U : Opens F)

/-- **A convex open subset of an inner-product space** carries the ambient norm distance as its
restricted Riemannian distance. -/
theorem riemannianEDist_eq_enorm_sub_of_convex (hU : Convex ℝ (U : Set F)) (x y : U) :
    riemannianEDist 𝓘(ℝ, F) x y = ‖(x : F) - y‖ₑ :=
  TauCeti.Manifold.riemannianEDist_eq_enorm_sub_of_convex U hU x y

/-- With its ambient metric, a convex open subset is a Riemannian manifold. -/
theorem isRiemannianManifold_of_convex (hU : Convex ℝ (U : Set F)) :
    IsRiemannianManifold 𝓘(ℝ, F) U :=
  TauCeti.Manifold.isRiemannianManifold_of_convex U hU

end Convex

/-! ## Layer 1: the geodesic equation, the flow, and the exponential map -/

section LeviCivita

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]

/-- **Levi-Civita connections** are the torsion-free connections compatible with the metric, in
Mathlib's `IsMetricCompatible` sense. -/
theorem isLeviCivitaConnection_iff_isMetricCompatible_and_torsion_eq_zero
    (cov : CovariantDerivative I E (fun x : M ↦ TangentSpace I x)) :
    cov.IsLeviCivitaConnection ↔
      cov.IsMetricCompatible (M := M) (V := TangentSpace I) ∧ cov.torsion = 0 :=
  ⟨fun h ↦ ⟨h.isMetricCompatible, h.torsion⟩, fun h ↦ ⟨h.1, h.2⟩⟩

/-- **Existence** of the Levi-Civita connection. -/
theorem isLeviCivitaConnection_leviCivitaConnection :
    (leviCivitaConnection I M).IsLeviCivitaConnection :=
  CovariantDerivative.isLeviCivitaConnection_leviCivitaConnection I

/-- **Uniqueness** of the Levi-Civita connection on differentiable vector fields. -/
theorem IsLeviCivitaConnection.eq
    {cov cov' : CovariantDerivative I E (fun x : M ↦ TangentSpace I x)}
    (hcov : cov.IsLeviCivitaConnection) (hcov' : cov'.IsLeviCivitaConnection)
    {Y : Π x : M, TangentSpace I x} {x : M} (hY : MDiffAt (T% Y) x) (v : TangentSpace I x) :
    cov Y x v = cov' Y x v :=
  CovariantDerivative.IsLeviCivitaConnection.uniqueness I hcov hcov' hY v

/-- **Regularity**: the Levi-Civita connection of a `C^∞` metric is `C^∞`. -/
example : ContMDiffCovariantDerivative (leviCivitaConnection I M) ∞ :=
  inferInstance

/-- The chart Christoffel map `x ↦ Γ_x` of the Levi-Civita connection, into the continuous bilinear
maps on the model space, is `C^∞` on the chart source. -/
theorem contMDiffOn_christoffelMap_leviCivitaConnection {ι : Type*} [Fintype ι]
    (b : Module.Basis ι ℝ E)
    (e : Trivialization E (TotalSpace.proj : TangentBundle I M → M)) [MemTrivializationAtlas e] :
    ContMDiffOn I 𝓘(ℝ, E →L[ℝ] E →L[ℝ] E) ∞
      (christoffelMap b ((leviCivitaConnection I M).isCovariantDerivativeOn (s := e.baseSet)))
      e.baseSet :=
  CovariantDerivative.contMDiffOn_christoffelMap_leviCivitaConnection (n := ∞) (m := ∞) (k := ∞)
    b le_rfl le_rfl

/-- The scalar Christoffel symbols of the Levi-Civita connection are `C^∞` on the chart source. -/
theorem contMDiffOn_christoffelSymbol_leviCivitaConnection {ι : Type*} (b : Module.Basis ι ℝ E)
    (e : Trivialization E (TotalSpace.proj : TangentBundle I M → M)) [MemTrivializationAtlas e]
    (i j l : ι) :
    ContMDiffOn I 𝓘(ℝ) ∞
      (christoffelSymbol I b e (leviCivitaConnection I M).toFun i j l) e.baseSet :=
  CovariantDerivative.contMDiffOn_christoffelSymbol_leviCivitaConnection (n := ∞) (m := ∞)
    (k := ∞) b le_rfl le_rfl i j l

end LeviCivita

section AlongCurve

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  (cov : CovariantDerivative I E (fun x : M ↦ TangentSpace I x)) (γ : ℝ → M)
  (V W : ∀ t, TangentSpace I (γ t)) {s : Set ℝ} {t : ℝ}

/-- **Covariant derivative along a curve**, on sections `V t ∈ T_{γ t} M`: the chart formula
`v' + Γ(v, u')` in the chart at the current point, transported back to `T_{γ t} M`. -/
theorem alongCurveWithin_apply :
    alongCurveWithin cov γ V s t =
      (trivializationAt E (TangentSpace I) (γ t)).symmL ℝ (γ t)
        (derivWithin (sectionCoord (F := E) γ V (γ t)) s t +
          christoffelMap (Module.finBasis ℝ E)
            (cov.isCovariantDerivativeOn (s := (trivializationAt E (TangentSpace I) (γ t)).baseSet))
            (γ t) (sectionCoord (F := E) γ V (γ t) t)
            (derivWithin (extChartAt I (γ t) ∘ γ) s t)) :=
  rfl

/-- **The chart formula in any chart** containing the current point gives the same value. -/
theorem symmL_alongCurveInChartWithin {x : M}
    (hx : γ t ∈ (trivializationAt E (TangentSpace I) x).baseSet) (hu : UniqueDiffWithinAt ℝ s t)
    (hγ : MDifferentiableWithinAt 𝓘(ℝ, ℝ) I γ s t)
    (hV : DifferentiableWithinAt ℝ (sectionCoord (F := E) γ V (γ t)) s t) :
    (trivializationAt E (TangentSpace I) x).symmL ℝ (γ t)
        (alongCurveInChartWithin cov γ V s x t) =
      alongCurveWithin cov γ V s t :=
  CovariantDerivative.symmL_alongCurveInChartWithin cov γ V hx hu hγ hV

/-- **Linearity**: additivity. -/
theorem alongCurveWithin_add
    (hV : DifferentiableWithinAt ℝ (sectionCoord (F := E) γ V (γ t)) s t)
    (hW : DifferentiableWithinAt ℝ (sectionCoord (F := E) γ W (γ t)) s t) :
    alongCurveWithin cov γ (fun r ↦ V r + W r) s t =
      alongCurveWithin cov γ V s t + alongCurveWithin cov γ W s t :=
  CovariantDerivative.alongCurveWithin_add cov γ V W s hV hW

/-- **Linearity**: constant multiples. -/
theorem alongCurveWithin_const_smul (c : ℝ) :
    alongCurveWithin cov γ (fun r ↦ c • V r) s t = c • alongCurveWithin cov γ V s t :=
  CovariantDerivative.alongCurveWithin_const_smul cov γ V c s t

/-- **The Leibniz rule.** -/
theorem alongCurveWithin_smul (f : ℝ → ℝ) (hf : DifferentiableWithinAt ℝ f s t)
    (hV : DifferentiableWithinAt ℝ (sectionCoord (F := E) γ V (γ t)) s t) :
    alongCurveWithin cov γ (fun r ↦ f r • V r) s t =
      derivWithin f s t • V t + f t • alongCurveWithin cov γ V s t :=
  CovariantDerivative.alongCurveWithin_smul cov γ V f s hf hV

/-- **Locality under restriction** to a neighbourhood of the parameter. -/
theorem alongCurveWithin_inter {u : Set ℝ} (hu : u ∈ 𝓝 t) :
    alongCurveWithin cov γ V (s ∩ u) t = alongCurveWithin cov γ V s t :=
  CovariantDerivative.alongCurveWithin_inter cov γ V hu

/-- **Naturality under reparametrization.** -/
theorem alongCurveWithin_comp (φ : ℝ → ℝ) {s' : Set ℝ} (hφ : DifferentiableWithinAt ℝ φ s' t)
    (hmaps : MapsTo φ s' s)
    (hγ : DifferentiableWithinAt ℝ (extChartAt I (γ (φ t)) ∘ γ) s (φ t))
    (hV : DifferentiableWithinAt ℝ (sectionCoord (F := E) γ V (γ (φ t))) s (φ t)) :
    alongCurveWithin cov (γ ∘ φ) (fun r ↦ V (φ r)) s' t =
      derivWithin φ s' t • alongCurveWithin cov γ V s (φ t) :=
  CovariantDerivative.alongCurveWithin_comp cov γ V φ hφ hmaps hγ hV

/-- **Agreement with the ambient derivative** on a pulled-back vector field. -/
theorem alongCurveWithin_pullback (X : Π y : M, TangentSpace I y) {w : TangentSpace I (γ t)}
    (hu : UniqueDiffWithinAt ℝ s t)
    (hγ : HasMFDerivWithinAt 𝓘(ℝ, ℝ) I γ s t (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) w))
    (hX : MDiffAt (T% X) (γ t)) :
    alongCurveWithin cov γ (fun r ↦ X (γ r)) s t = cov X (γ t) w :=
  CovariantDerivative.alongCurveWithin_pullback cov γ X hu hγ hX

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] in
/-- The velocity section is `mfderivWithin` applied to the unit tangent vector. -/
theorem curveVelocityWithin_eq (t : ℝ) :
    curveVelocityWithin I γ s t = mfderivWithin 𝓘(ℝ, ℝ) I γ s t (1 : ℝ) :=
  TauCeti.Manifold.curveVelocityWithin_apply

/-- **Covariant acceleration**: the along-curve derivative of the velocity field. -/
theorem accelerationWithin_eq :
    accelerationWithin cov γ s t = alongCurveWithin cov γ (curveVelocityWithin I γ s) s t :=
  rfl

end AlongCurve

section Geodesic

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  {γ : ℝ → M} {s : Set ℝ} {p : M} {v : TangentSpace I p}

/-- **`IsGeodesicCurveOn γ s`**: unique derivatives on `s`, `C²` on `s`, and vanishing covariant
acceleration (for the Levi-Civita connection) at every parameter of `s`. -/
theorem isGeodesicCurveOn_iff :
    IsGeodesicCurveOn I γ s ↔ UniqueDiffOn ℝ s ∧ ContMDiffOn 𝓘(ℝ, ℝ) I 2 γ s ∧
      ∀ r ∈ s, accelerationWithin (leviCivitaConnection I M) γ s r = 0 :=
  ⟨fun h ↦ ⟨h.1, h.2, h.3⟩, fun h ↦ ⟨h.1, h.2.1, h.2.2⟩⟩

/-- The all-time predicate is the `s = univ` specialization. -/
theorem isGeodesicCurve_iff_isGeodesicCurveOn_univ :
    IsGeodesicCurve I γ ↔ IsGeodesicCurveOn I γ univ :=
  Iff.rfl

/-- **The chart form**: the second-order geodesic ODE with the Christoffel map, read in the chart
at the current point. -/
theorem isGeodesicCurveOn_iff_chart (hs : UniqueDiffOn ℝ s) :
    IsGeodesicCurveOn I γ s ↔ ContMDiffOn 𝓘(ℝ, ℝ) I 2 γ s ∧ ∀ r ∈ s,
      derivWithin (derivWithin (extChartAt I (γ r) ∘ γ) s) s r +
        christoffelMap (Module.finBasis ℝ E)
          ((leviCivitaConnection I M).isCovariantDerivativeOn
            (s := (trivializationAt E (TangentSpace I) (γ r)).baseSet)) (γ r)
          (derivWithin (extChartAt I (γ r) ∘ γ) s r)
          (derivWithin (extChartAt I (γ r) ∘ γ) s r) = 0 :=
  TauCeti.Manifold.isGeodesicCurveOn_iff_chart hs

/-- **Initial data**: a geodesic on `s ∋ 0` leaving `p` with velocity `v`, packaged as one point of
`TM`. -/
theorem isGeodesicCurveOnFrom_iff :
    IsGeodesicCurveOnFrom I γ s p v ↔ IsGeodesicCurveOn I γ s ∧ (0 : ℝ) ∈ s ∧
      TotalSpace.mk' E (γ 0) (curveVelocityWithin I γ s 0) = TotalSpace.mk' E p v :=
  ⟨fun h ↦ ⟨h.1, h.2, h.3⟩, fun h ↦ ⟨h.1, h.2.1, h.2.2⟩⟩

/-- **The geodesic spray** in a tangent-bundle chart: `(x, v) ↦ (v, -Γ_x(v, v))`. -/
theorem geodesicSpray_apply (z : TangentBundle I M) :
    geodesicSpray I M z =
      (z.2, -christoffelMap (Module.finBasis ℝ E)
        ((leviCivitaConnection I M).isCovariantDerivativeOn
          (s := (trivializationAt E (TangentSpace I) z.proj).baseSet)) z.proj z.2 z.2) :=
  TauCeti.Manifold.geodesicSpray_apply z

/-- **Chart independence** of the spray formula. -/
theorem tangentCoordChange_geodesicSpray {x x₀ : M} (hx₀ : x ∈ (extChartAt I x₀).source)
    (u : TangentSpace I x) :
    tangentCoordChange I.tangent (TotalSpace.mk' E x u) (TotalSpace.mk' E x₀ 0)
        (TotalSpace.mk' E x u) (geodesicSpray I M (TotalSpace.mk' E x u)) =
      let v := tangentCoordChange I x x₀ x u
      (v, -christoffelMap (Module.finBasis ℝ E)
        ((leviCivitaConnection I M).isCovariantDerivativeOn
          (s := (trivializationAt E (TangentSpace I) x₀).baseSet)) x v v) :=
  TauCeti.Manifold.tangentCoordChange_geodesicSpray hx₀ u

/-- **The spray is `C^∞`.** -/
theorem contMDiff_geodesicSpray :
    ContMDiff I.tangent I.tangent.tangent ∞ (fun z : TangentBundle I M ↦
      (⟨z, geodesicSpray I M z⟩ : TangentBundle I.tangent (TangentBundle I M))) :=
  TauCeti.Manifold.contMDiff_infty_geodesicSpray

/-- **Integral curves of the spray are the velocity lifts of geodesics**, on a common parameter set
with unique derivatives. -/
theorem isMIntegralCurveOn_curveVelocityLiftWithin_iff (hs : UniqueDiffOn ℝ s)
    (hγ : ContMDiffOn 𝓘(ℝ, ℝ) I 2 γ s) :
    IsMIntegralCurveOn (curveVelocityLiftWithin I γ s) (geodesicSpray I M) s ↔
      IsGeodesicCurveOn I γ s :=
  TauCeti.Manifold.isMIntegralCurveOn_curveVelocityLiftWithin_iff hs hγ

/-- An integral curve of the spray is the velocity lift of its base curve. -/
theorem eq_curveVelocityLiftWithin_of_isMIntegralCurveOn {z : ℝ → TangentBundle I M} {t : ℝ}
    (hs : UniqueDiffWithinAt ℝ s t) (h : IsMIntegralCurveOn z (geodesicSpray I M) s) (ht : t ∈ s) :
    z t = curveVelocityLiftWithin I (fun r ↦ (z r).proj) s t :=
  TauCeti.Manifold.eq_curveVelocityLiftWithin_of_isMIntegralCurveOn hs h ht

/-- **Constant speed** on a preconnected parameter set. -/
theorem IsGeodesicCurveOn.norm_curveVelocityWithin_eq (h : IsGeodesicCurveOn I γ s)
    (hconn : IsPreconnected s) {a b : ℝ} (ha : a ∈ s) (hb : b ∈ s) :
    ‖curveVelocityWithin I γ s a‖ = ‖curveVelocityWithin I γ s b‖ :=
  TauCeti.Manifold.IsGeodesicCurveOn.norm_curveVelocityWithin_eq h hconn ha hb

/-- Constant speed componentwise, on any parameter set. -/
theorem IsGeodesicCurveOn.norm_curveVelocityWithin_eq_of_mem_connectedComponentIn
    (h : IsGeodesicCurveOn I γ s) {a b : ℝ} (hb : b ∈ connectedComponentIn s a) :
    ‖curveVelocityWithin I γ s a‖ = ‖curveVelocityWithin I γ s b‖ :=
  TauCeti.Manifold.IsGeodesicCurveOn.norm_curveVelocityWithin_eq_of_mem_connectedComponentIn h hb

/-- **The maximal interval `J(p,v)`** is the union of the open intervals of genuine geodesic
witnesses with initial data `(p, v)`. -/
theorem mem_geodesicInterval_iff {t : ℝ} :
    t ∈ geodesicInterval I M p v ↔
      ∃ γ a b, IsGeodesicCurveOnFrom I γ (Ioo a b) p v ∧ t ∈ Ioo a b :=
  Iff.rfl

theorem isOpen_geodesicInterval : IsOpen (geodesicInterval I M p v) :=
  TauCeti.Manifold.isOpen_geodesicInterval

theorem ordConnected_geodesicInterval : (geodesicInterval I M p v).OrdConnected :=
  TauCeti.Manifold.ordConnected_geodesicInterval

/-- **Homogeneity of the domains**: `t ∈ J(p, a • v) ↔ a * t ∈ J(p, v)` for `a ≠ 0`. -/
theorem mem_geodesicInterval_smul_iff {a t : ℝ} (ha : a ≠ 0) :
    t ∈ geodesicInterval I M p (a • v) ↔ a * t ∈ geodesicInterval I M p v :=
  TauCeti.Manifold.mem_geodesicInterval_smul_iff ha

variable [I.Boundaryless]

/-- On an open set, the base curve of an integral curve of the spray is the geodesic with the
initial data the integral curve encodes. -/
theorem isGeodesicCurveOnFrom_proj {z : ℝ → TangentBundle I M} {w : TangentBundle I M}
    (hz : IsMIntegralCurveOn z (geodesicSpray I M) s) (hs : IsOpen s) (h0s : (0 : ℝ) ∈ s)
    (h0 : z 0 = w) :
    IsGeodesicCurveOnFrom I (fun t ↦ (z t).proj) s w.proj w.2 :=
  IsMIntegralCurveOn.isGeodesicCurveOnFrom_proj hz hs h0s h0

/-- **Local existence** on an open interval around `0`. -/
theorem exists_geodesicCurveOnFrom_Ioo (p : M) (v : TangentSpace I p) :
    ∃ a b : ℝ, a < b ∧ 0 ∈ Ioo a b ∧ ∃ γ : ℝ → M, IsGeodesicCurveOnFrom I γ (Ioo a b) p v :=
  TauCeti.Manifold.exists_geodesicCurveOnFrom_Ioo p v

/-- **Uniqueness** on the overlap of two intervals. -/
theorem IsGeodesicCurveOnFrom.eqOn_of_inter [T2Space M] {γ γ' : ℝ → M} {a b a' b' : ℝ}
    (hγ : IsGeodesicCurveOnFrom I γ (Ioo a b) p v)
    (hγ' : IsGeodesicCurveOnFrom I γ' (Ioo a' b') p v) :
    EqOn γ γ' (Ioo (max a a') (min b b')) :=
  TauCeti.Manifold.IsGeodesicCurveOnFrom.eqOn_of_inter hγ hγ'

/-- **The local geodesic flow on `TM`**: `C^∞` jointly in time and initial data, a flow, and made
of geodesics. -/
theorem exists_contMDiffAt_localGeodesicFlow (z : TangentBundle I M) :
    ∃ U ∈ 𝓝 z, ∃ s ∈ 𝓝 (0 : ℝ), IsOpen s ∧
      ∃ Φ : TangentBundle I M → ℝ → TangentBundle I M,
        ContMDiffAt (I.tangent.prod 𝓘(ℝ, ℝ)) I.tangent ∞
          (fun p : TangentBundle I M × ℝ ↦ Φ p.1 p.2) (z, 0) ∧
          ∀ w ∈ U, Φ w 0 = w ∧
            IsMIntegralCurveOn (Φ w) (geodesicSpray I M) s ∧
            (∀ t ∈ s, ∀ u, Φ w (t + u) = Φ (Φ w t) u) ∧
            IsGeodesicCurveOnFrom I (fun t ↦ (Φ w t).proj) s w.proj w.2 :=
  TauCeti.Manifold.exists_contMDiffAt_localGeodesicFlow z

variable [T2Space M]

/-- The maximal geodesic is a geodesic with initial data `(p, v)` on `J(p, v)`. -/
theorem isGeodesicCurveOnFrom_maximalGeodesic :
    IsGeodesicCurveOnFrom I (maximalGeodesic I M p v) (geodesicInterval I M p v) p v :=
  TauCeti.Manifold.isGeodesicCurveOnFrom_maximalGeodesic p v

/-- **Homogeneity**: `γ_{p, a • v}(t) = γ_{p,v}(a t)` on the maximal interval. -/
theorem maximalGeodesic_smul {a t : ℝ} (ht : t ∈ geodesicInterval I M p (a • v)) :
    maximalGeodesic I M p (a • v) t = maximalGeodesic I M p v (a * t) :=
  TauCeti.Manifold.maximalGeodesic_smul ht

/-- **Constant speed on the maximal interval.** -/
theorem inner_curveVelocity_maximalGeodesic_self {t : ℝ} (ht : t ∈ geodesicInterval I M p v) :
    inner ℝ (curveVelocity I (maximalGeodesic I M p v) t)
        (curveVelocity I (maximalGeodesic I M p v) t) = inner ℝ v v :=
  TauCeti.Manifold.inner_curveVelocity_maximalGeodesic_self ht

/-- **Smooth dependence** of the maximal geodesic on time and initial data. -/
theorem contMDiffOn_maximalGeodesic :
    ContMDiffOn (I.tangent.prod 𝓘(ℝ, ℝ)) I ∞
      (fun q : TangentBundle I M × ℝ ↦ maximalGeodesic I M q.1.proj q.1.2 q.2)
      {q | q.2 ∈ geodesicInterval I M q.1.proj q.1.2} :=
  TauCeti.Manifold.contMDiffOn_maximalGeodesic

/-- **The geodesic flow on `TM`** is `C^∞` on its domain. -/
theorem contMDiffOn_maximalIntegralCurve_geodesicSpray :
    ContMDiffOn (I.tangent.prod 𝓘(ℝ, ℝ)) I.tangent ∞
      (fun q : TangentBundle I M × ℝ ↦ maximalIntegralCurve (geodesicSpray I M) q.1 q.2)
      {q | q.2 ∈ geodesicInterval I M q.1.proj q.1.2} :=
  TauCeti.Manifold.contMDiffOn_maximalIntegralCurve_geodesicSpray

/-- **Finite-endpoint extension criterion**, right endpoint: an integral curve of the spray on
`(a, b)` whose values converge in `TM` along times tending to `b` extends past `b`. -/
theorem exists_gt_isMIntegralCurveOn_Ioo_of_tendsto {z : ℝ → TangentBundle I M} {a b : ℝ}
    {zb : TangentBundle I M} (hz : IsMIntegralCurveOn z (geodesicSpray I M) (Ioo a b)) (hab : a < b)
    {u : ℕ → ℝ} (hu : ∀ᶠ n in atTop, u n < b) (hub : Tendsto u atTop (𝓝 b))
    (hzb : Tendsto (z ∘ u) atTop (𝓝 zb)) :
    ∃ c > b, ∃ δ : ℝ → TangentBundle I M,
      IsMIntegralCurveOn δ (geodesicSpray I M) (Ioo a c) ∧ EqOn δ z (Ioo a b) :=
  IsMIntegralCurveOn.exists_gt_isMIntegralCurveOn_Ioo_of_tendsto hz hab
    (TauCeti.Manifold.contMDiff_infty_geodesicSpray.of_le (by norm_num)) hu hub hzb

/-- The left-endpoint analogue. -/
theorem exists_lt_isMIntegralCurveOn_Ioo_of_tendsto {z : ℝ → TangentBundle I M} {a b : ℝ}
    {za : TangentBundle I M} (hz : IsMIntegralCurveOn z (geodesicSpray I M) (Ioo a b)) (hab : a < b)
    {u : ℕ → ℝ} (hu : ∀ᶠ n in atTop, a < u n) (hua : Tendsto u atTop (𝓝 a))
    (hza : Tendsto (z ∘ u) atTop (𝓝 za)) :
    ∃ c < a, ∃ δ : ℝ → TangentBundle I M,
      IsMIntegralCurveOn δ (geodesicSpray I M) (Ioo c b) ∧ EqOn δ z (Ioo a b) :=
  IsMIntegralCurveOn.exists_lt_isMIntegralCurveOn_Ioo_of_tendsto hz hab
    (TauCeti.Manifold.contMDiff_infty_geodesicSpray.of_le (by norm_num)) hu hua hza

end Geodesic

section Exponential

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  {p : M} {v : TangentSpace I p}

/-- **`expDomain p = {v | 1 ∈ J(p, v)}`.** -/
theorem mem_expDomain_iff : v ∈ expDomain I M p ↔ (1 : ℝ) ∈ geodesicInterval I M p v :=
  Iff.rfl

/-- **`exp_p v = γ_{p,v}(1)`.** -/
theorem riemannianExp_eq : riemannianExp I M p v = maximalGeodesic I M p v 1 :=
  rfl

theorem zero_mem_expDomain : (0 : TangentSpace I p) ∈ expDomain I M p :=
  TauCeti.Manifold.zero_mem_expDomain p

/-- **`(d_p)`**: every maximal geodesic from `p` is defined for all time. -/
theorem isGeodesicallyCompleteAt_iff :
    IsGeodesicallyCompleteAt I M p ↔ ∀ v : TangentSpace I p, geodesicInterval I M p v = univ :=
  Iff.rfl

/-- **`(a_p) ↔ (d_p)`.** -/
theorem expDomain_eq_univ_iff : expDomain I M p = univ ↔ IsGeodesicallyCompleteAt I M p :=
  TauCeti.Manifold.expDomain_eq_univ_iff

variable [I.Boundaryless]

/-- **`t ∈ J(p, v) ↔ t • v ∈ expDomain p`.** -/
theorem mem_geodesicInterval_iff_smul_mem_expDomain {t : ℝ} :
    t ∈ geodesicInterval I M p v ↔ t • v ∈ expDomain I M p :=
  TauCeti.Manifold.mem_geodesicInterval_iff_smul_mem_expDomain

theorem starConvex_expDomain : StarConvex ℝ (0 : TangentSpace I p) (expDomain I M p) :=
  TauCeti.Manifold.starConvex_expDomain p

/-- **Junk discipline**: off its domain `exp_p` takes the value `p`. -/
theorem riemannianExp_of_notMem_expDomain (hv : v ∉ expDomain I M p) :
    riemannianExp I M p v = p :=
  TauCeti.Manifold.riemannianExp_of_notMem_expDomain hv

variable [T2Space M]

theorem riemannianExp_zero : riemannianExp I M p 0 = p :=
  TauCeti.Manifold.riemannianExp_zero p

theorem isOpen_expDomain : IsOpen (expDomain I M p) :=
  TauCeti.Manifold.isOpen_expDomain p

/-- **The time-one flow, projected to the base, is `exp` and is `C^∞`** on the open subset of `TM`
where it is defined. -/
theorem contMDiffOn_riemannianExp_tangentBundle :
    ContMDiffOn I.tangent I ∞ (fun z : TangentBundle I M ↦ riemannianExp I M z.proj z.2)
      {z | z.2 ∈ expDomain I M z.proj} :=
  TauCeti.Manifold.contMDiffOn_riemannianExp_tangentBundle

/-- **`exp_p` is `C^∞` on its domain**, as a map from `T_p M`. -/
theorem contMDiffOn_riemannianExp :
    ContMDiffOn 𝓘(ℝ, TangentSpace I p) I ∞ (riemannianExp I M p) (expDomain I M p) :=
  TauCeti.Manifold.contMDiffOn_riemannianExp p

theorem continuousOn_riemannianExp : ContinuousOn (riemannianExp I M p) (expDomain I M p) :=
  TauCeti.Manifold.continuousOn_riemannianExp p

theorem contMDiffAt_riemannianExp (hv : v ∈ expDomain I M p) :
    ContMDiffAt 𝓘(ℝ, TangentSpace I p) I ∞ (riemannianExp I M p) v :=
  TauCeti.Manifold.contMDiffAt_riemannianExp hv

theorem continuousAt_riemannianExp (hv : v ∈ expDomain I M p) :
    ContinuousAt (riemannianExp I M p) v :=
  TauCeti.Manifold.continuousAt_riemannianExp hv

/-- **`exp_p (t • v) = γ_{p,v}(t)`** (both sides are junk together off the domain). -/
theorem riemannianExp_smul (t : ℝ) : riemannianExp I M p (t • v) = maximalGeodesic I M p v t :=
  TauCeti.Manifold.riemannianExp_smul p v t

/-- **`d(exp_p)_0` is the identity** under `NormedSpace.fromTangentSpace`. -/
theorem mfderiv_riemannianExp_zero :
    mfderiv 𝓘(ℝ, TangentSpace I p) I (riemannianExp I M p) 0 =
      (NormedSpace.fromTangentSpace (0 : TangentSpace I p)).toContinuousLinearMap :=
  TauCeti.Manifold.mfderiv_riemannianExp_zero p

/-- The strict derivative at `0` used by the inverse-function theorem. -/
theorem hasStrictFDerivAt_riemannianExp_zero :
    HasStrictFDerivAt (writtenInExtChartAt 𝓘(ℝ, TangentSpace I p) I 0 (riemannianExp I M p))
      (tangentSpaceCastModel I p).toContinuousLinearMap 0 :=
  TauCeti.Manifold.hasStrictFDerivAt_riemannianExp_zero p

/-- **`exp_p` is a local diffeomorphism at `0`.** -/
theorem isLocalDiffeomorphAt_riemannianExp_zero :
    IsLocalDiffeomorphAt 𝓘(ℝ, TangentSpace I p) I ∞ (riemannianExp I M p) 0 :=
  TauCeti.Manifold.isLocalDiffeomorphAt_riemannianExp_zero p

end Exponential

section InverseFunctionTheorem

variable {𝕂 : Type*} [RCLike 𝕂]
  {E : Type*} [NormedAddCommGroup E] [NormedSpace 𝕂 E] [CompleteSpace E]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace 𝕂 F]
  {H : Type*} [TopologicalSpace H] {G : Type*} [TopologicalSpace G]
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {N : Type*} [TopologicalSpace N] [ChartedSpace G N]
  {I : ModelWithCorners 𝕂 E H} {J : ModelWithCorners 𝕂 F G} {n : WithTop ℕ∞}
  [IsManifold I n M] [IsManifold J n N] [BoundarylessManifold I M]

/-- **The manifold inverse-function theorem**: on a boundaryless Banach manifold, a `C^n` map
(`1 ≤ n`) whose differential at `x` is a continuous linear equivalence is a local diffeomorphism
at `x`. -/
theorem isLocalDiffeomorphAt_of_mfderiv_eq {f : M → N} {s : Set M} {x : M}
    (hf : ContMDiffOn I J n f s) (hs : IsOpen s) (hx : x ∈ s) (hn : 1 ≤ n)
    {e : TangentSpace I x ≃L[𝕂] TangentSpace J (f x)}
    (he : (e : TangentSpace I x →L[𝕂] TangentSpace J (f x)) = mfderiv I J f x) :
    IsLocalDiffeomorphAt I J n f x :=
  TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq hf hs hx BoundarylessManifold.isInteriorPoint hn he

end InverseFunctionTheorem

/-! ## Layer 2: normal neighbourhoods, the Gauss lemma, and minimizing geodesics -/

section Normal

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  {p : M} {U : Set (TangentSpace I p)} {v : TangentSpace I p} {q : M}

/-- **Normal domains**: open star-shaped neighbourhoods of `0` in the domain of `exp_p`, on which
`exp_p` is injective and a local diffeomorphism. -/
theorem isNormalDomain_iff :
    IsNormalDomain I M p U ↔ IsOpen U ∧ (0 : TangentSpace I p) ∈ U ∧
      StarConvex ℝ (0 : TangentSpace I p) U ∧ U ⊆ expDomain I M p ∧
      InjOn (riemannianExp I M p) U ∧
      IsLocalDiffeomorphOn 𝓘(ℝ, TangentSpace I p) I ∞ (riemannianExp I M p) U :=
  ⟨fun h ↦ ⟨h.1, h.2, h.3, h.4, h.5, h.6⟩,
    fun ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩ ↦ ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩⟩

/-- **Normal coordinates**: `exp_p` is a diffeomorphism from a normal domain onto the normal
neighbourhood, with inverse the logarithm. -/
theorem IsNormalDomain.toPartialDiffeomorph_spec (h : IsNormalDomain I M p U) :
    ⇑h.toPartialDiffeomorph = riemannianExp I M p ∧ h.toPartialDiffeomorph.source = U ∧
      h.toPartialDiffeomorph.target = riemannianExp I M p '' U ∧
      ⇑h.toPartialDiffeomorph.toPartialEquiv.symm = riemannianLog I M p U :=
  ⟨rfl, rfl, rfl, rfl⟩

/-- **The logarithm** relative to `U`, carrying its domain: `invFunOn` of `exp_p` on `U`. -/
theorem riemannianLog_eq : riemannianLog I M p U = Function.invFunOn (riemannianExp I M p) U :=
  rfl

theorem IsNormalDomain.contMDiffOn_riemannianLog (h : IsNormalDomain I M p U) :
    ContMDiffOn I 𝓘(ℝ, TangentSpace I p) ∞ (riemannianLog I M p U) (riemannianExp I M p '' U) :=
  TauCeti.Manifold.IsNormalDomain.contMDiffOn_riemannianLog h

theorem IsNormalDomain.riemannianLog_riemannianExp (h : IsNormalDomain I M p U) (hv : v ∈ U) :
    riemannianLog I M p U (riemannianExp I M p v) = v :=
  TauCeti.Manifold.IsNormalDomain.riemannianLog_riemannianExp h hv

theorem IsNormalDomain.riemannianExp_riemannianLog (h : IsNormalDomain I M p U)
    (hq : q ∈ riemannianExp I M p '' U) : riemannianExp I M p (riemannianLog I M p U q) = q :=
  TauCeti.Manifold.IsNormalDomain.riemannianExp_riemannianLog h hq

variable [I.Boundaryless] [T2Space M]

/-- **Normal balls** exist. -/
theorem exists_isNormalDomain_ball (p : M) :
    ∃ r : ℝ, 0 < r ∧ IsNormalDomain I M p (Metric.ball 0 r) :=
  TauCeti.Manifold.exists_isNormalDomain_ball p

theorem IsNormalDomain.riemannianLog_self (h : IsNormalDomain I M p U) :
    riemannianLog I M p U p = 0 :=
  TauCeti.Manifold.IsNormalDomain.riemannianLog_self h

/-- **The Gauss lemma**: `d(exp_p)_v` preserves inner products with the radial direction. -/
theorem inner_mfderiv_riemannianExp_radial {w : TangentSpace I p} (hv : v ∈ expDomain I M p) :
    inner ℝ (mfderiv 𝓘(ℝ, TangentSpace I p) I (riemannianExp I M p) v v)
        (mfderiv 𝓘(ℝ, TangentSpace I p) I (riemannianExp I M p) v w) = inner ℝ v w :=
  TauCeti.Manifold.inner_mfderiv_riemannianExp_radial hv

/-- **The polar length inequality** on a normal neighbourhood: a `C¹` curve is at least as long as
the change in the norm of its logarithm. -/
theorem IsNormalDomain.ofReal_abs_norm_riemannianLog_sub_le_pathELength
    (h : IsNormalDomain I M p U) {γ : ℝ → M} {a b : ℝ} (hab : a ≤ b)
    (hγ : ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ (Icc a b))
    (hγU : MapsTo γ (Icc a b) (riemannianExp I M p '' U)) :
    ENNReal.ofReal |‖riemannianLog I M p U (γ b)‖ - ‖riemannianLog I M p U (γ a)‖| ≤
      pathELength I γ a b :=
  h.ofReal_abs_norm_riemannianLog_sub_norm_riemannianLog_le_pathELength hab hγ hγU

end Normal

section Minimizing

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  {p : M} {U : Set (TangentSpace I p)} {v : TangentSpace I p} {γ : ℝ → M} {a b : ℝ}

/-- **Ball-internal radial minimization** against piecewise `C¹` competitors in the normal
neighbourhood. -/
theorem IsNormalDomain.pathELength_riemannianExp_smul_le_of_piecewise (h : IsNormalDomain I M p U)
    (hv : v ∈ U) (hγ : IsPiecewiseContMDiffOn I 1 γ a b)
    (hγU : MapsTo γ (Icc a b) (riemannianExp I M p '' U)) (hγa : γ a = p)
    (hγb : γ b = riemannianExp I M p v) :
    pathELength I (fun t : ℝ ↦ riemannianExp I M p (t • v)) 0 1 ≤ pathELength I γ a b :=
  TauCeti.Manifold.IsNormalDomain.pathELength_riemannianExp_smul_le_of_piecewise h hv hγ hγU hγa
    hγb

/-- **Equality case, parametrized**: a constant-speed minimizer is the affinely parametrized radial
geodesic. -/
theorem IsNormalDomain.eqOn_riemannianExp_smul_of_pathELength_eq_of_piecewise
    (h : IsNormalDomain I M p U) (hv : v ∈ U) (hγ : IsPiecewiseContMDiffOn I 1 γ a b)
    (hγU : MapsTo γ (Icc a b) (riemannianExp I M p '' U)) (hγa : γ a = p)
    (hγb : γ b = riemannianExp I M p v)
    (hlen : pathELength I γ a b = pathELength I (fun t : ℝ ↦ riemannianExp I M p (t • v)) 0 1)
    (hspeed : ∀ t ∈ Icc a b,
      pathELength I γ a t = ENNReal.ofReal ((t - a) / (b - a)) * pathELength I γ a b) :
    EqOn γ (fun t : ℝ ↦ riemannianExp I M p (((t - a) / (b - a)) • v)) (Icc a b) :=
  TauCeti.Manifold.IsNormalDomain.eqOn_riemannianExp_smul_of_pathELength_eq_of_piecewise h hv hγ
    hγU hγa hγb hlen hspeed

/-- **Equality case, unparametrized**: every minimizer is the radial segment up to a nondecreasing
surjective reparametrization. -/
theorem IsNormalDomain.exists_monotoneOn_eq_riemannianExp_smul_of_pathELength_eq_of_piecewise
    (h : IsNormalDomain I M p U) (hv : v ∈ U) (hγ : IsPiecewiseContMDiffOn I 1 γ a b)
    (hγU : MapsTo γ (Icc a b) (riemannianExp I M p '' U)) (hγa : γ a = p)
    (hγb : γ b = riemannianExp I M p v)
    (hlen : pathELength I γ a b = pathELength I (fun t : ℝ ↦ riemannianExp I M p (t • v)) 0 1) :
    ∃ φ : ℝ → ℝ, MonotoneOn φ (Icc a b) ∧ ContinuousOn φ (Icc a b) ∧
      SurjOn φ (Icc a b) (Icc 0 1) ∧ φ a = 0 ∧ φ b = 1 ∧
      ∀ t ∈ Icc a b, γ t = riemannianExp I M p (φ t • v) :=
  h.exists_monotoneOn_eq_riemannianExp_smul_of_pathELength_eq_of_piecewise hv hγ hγU hγa hγb
    hlen

/-- The escape estimate as Tau Ceti states it, for `C¹` competitors on `[0, 1]`: a curve from `p`
that leaves the normal neighbourhood is longer than every radial segment in a smaller ball. -/
theorem IsNormalDomain.pathELength_riemannianExp_smul_lt_of_not_mapsTo {r : ℝ}
    (h : IsNormalDomain I M p U) (hclosed : Metric.closedBall 0 r ⊆ U) (hv : v ∈ Metric.ball 0 r)
    (hγ : ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ (Icc 0 1)) (hγ0 : γ 0 = p)
    (hleave : ¬ MapsTo γ (Icc 0 1) (riemannianExp I M p '' U)) :
    pathELength I (fun t : ℝ ↦ riemannianExp I M p (t • v)) 0 1 < pathELength I γ 0 1 :=
  TauCeti.Manifold.IsNormalDomain.pathELength_riemannianExp_smul_lt_of_not_mapsTo h
    hclosed hv hγ hγ0 hleave

variable [IsRiemannianManifold I M]

/-- **The local distance identity**: a radial segment in a closed ball inside a normal domain has
length the distance between its endpoints. -/
theorem IsNormalDomain.pathELength_riemannianExp_smul_eq_edist {r : ℝ} (h : IsNormalDomain I M p U)
    (hU : Metric.closedBall 0 r ⊆ U) (hv : v ∈ Metric.closedBall 0 r) :
    pathELength I (fun t : ℝ ↦ riemannianExp I M p (t • v)) 0 1 =
      edist p (riemannianExp I M p v) :=
  TauCeti.Manifold.IsNormalDomain.pathELength_riemannianExp_smul_eq_edist h hU hv

/-- **The escape estimate for piecewise `C¹` competitors**: a competitor from `p` that leaves the
normal neighbourhood is longer than every radial segment in a smaller ball. -/
theorem IsNormalDomain.pathELength_riemannianExp_smul_lt_of_piecewise {r : ℝ}
    (h : IsNormalDomain I M p U) (hclosed : Metric.closedBall 0 r ⊆ U) (hv : v ∈ Metric.ball 0 r)
    (hγ : IsPiecewiseContMDiffOn I 1 γ a b) (hγa : γ a = p)
    (hleave : ¬ MapsTo γ (Icc a b) (riemannianExp I M p '' U)) :
    pathELength I (fun t : ℝ ↦ riemannianExp I M p (t • v)) 0 1 < pathELength I γ a b := by
  obtain ⟨t, ht, hq⟩ := not_forall₂.1 hleave
  have hr : 0 ≤ r := (norm_nonneg v).trans (mem_ball_zero_iff.1 hv).le
  have hball : Metric.ball (0 : TangentSpace I p) r ⊆ U :=
    Metric.ball_subset_closedBall.trans hclosed
  have hq' : γ t ∉ riemannianExp I M p '' Metric.ball 0 r := fun h' ↦ hq (image_mono hball h')
  rw [TauCeti.Manifold.IsNormalDomain.pathELength_riemannianExp_smul_eq_edist h hclosed
    (Metric.ball_subset_closedBall hv),
    TauCeti.Manifold.IsNormalDomain.edist_riemannianExp_eq h hclosed
    (Metric.ball_subset_closedBall hv)]
  have hvr : ‖v‖ < r := mem_ball_zero_iff.1 hv
  calc ‖v‖ₑ < ENNReal.ofReal r := by
        rw [← ofReal_norm]
        exact (ENNReal.ofReal_lt_ofReal_iff ((norm_nonneg v).trans_lt hvr)).2 hvr
    _ ≤ edist p (γ t) := by
        rw [TauCeti.Manifold.IsNormalDomain.edist_eq_ofReal_add_infEDist h hclosed hr hq']
        exact le_self_add
    _ ≤ pathELength I γ a t := by
        rw [← hγa]
        exact hγ.edist_le_pathELength_of_subset le_rfl ht.1 ht.2
    _ ≤ pathELength I γ a b := by
        rw [← Manifold.pathELength_add ht.1 ht.2]
        exact le_self_add

end Minimizing

section FirstVariation

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {γ : ℝ → M} {F : ℝ → ℝ → M} {a b : ℝ}

/-- **Fixed-endpoint variations**: `C^n` near `{0} × [a, b]`, with the endpoints fixed for `s`
near `0`. -/
theorem isFixedEndpointVariation_iff (n : WithTop ℕ∞) :
    IsFixedEndpointVariation I n F a b ↔
      (∀ t ∈ uIcc a b, ContMDiffAt 𝓘(ℝ, ℝ × ℝ) I n (fun z : ℝ × ℝ ↦ F z.1 z.2) (0, t)) ∧
      (∀ᶠ s in 𝓝 0, F s a = F 0 a) ∧ ∀ᶠ s in 𝓝 0, F s b = F 0 b :=
  ⟨fun h ↦ ⟨h.1, h.2, h.3⟩, fun h ↦ ⟨h.1, h.2.1, h.2.2⟩⟩

/-- **Variation fields** `∂F/∂s` at `s = 0`, vanishing at fixed endpoints. -/
theorem variationField_eq (t : ℝ) : variationField I F t = curveVelocity I (fun s ↦ F s t) 0 :=
  rfl

theorem IsFixedEndpointVariation.variationField_eq_zero {n : WithTop ℕ∞}
    (h : IsFixedEndpointVariation I n F a b) :
    variationField I F a = 0 ∧ variationField I F b = 0 :=
  ⟨h.variationField_left_eq_zero, h.variationField_right_eq_zero⟩

variable [RiemannianBundle (fun x : M ↦ TangentSpace I x)]

/-- **The energy** `½ ∫ ‖γ'‖²`. -/
theorem energy_eq : energy I γ a b = (∫ t in a..b, ‖curveVelocity I γ t‖ ^ 2) / 2 :=
  rfl

/-- **Criticality**: `C^n` near `[a, b]`, and every `C^n` fixed-endpoint variation has energy
derivative `0` at `s = 0`. -/
theorem isEnergyCritical_iff (n : WithTop ℕ∞) :
    IsEnergyCritical I n γ a b ↔ (∀ t ∈ uIcc a b, ContMDiffAt 𝓘(ℝ, ℝ) I n γ t) ∧
      ∀ {F : ℝ → ℝ → M}, F 0 = γ → IsFixedEndpointVariation I n F a b →
        HasDerivAt (fun s ↦ energy I (F s) a b) 0 0 :=
  ⟨fun h ↦ ⟨h.1, h.2⟩, fun h ↦ ⟨h.1, h.2⟩⟩

variable [FiniteDimensional ℝ E] [IsManifold I ∞ M]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]

omit [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)] in
/-- **Covariant differentiation in both variation directions** commutes for a torsion-free
connection: `D/∂v (∂f/∂u) = D/∂u (∂f/∂v)`. -/
theorem alongCurve_curveVelocity_comm (cov : CovariantDerivative I E (fun x : M ↦ TangentSpace I x))
    (hcov : cov.IsTorsionFree) {f : ℝ → ℝ → M} {u v : ℝ}
    (hf : ContMDiffAt 𝓘(ℝ, ℝ × ℝ) I 2 (fun z : ℝ × ℝ ↦ f z.1 z.2) (u, v)) :
    alongCurve cov (f u) (fun r ↦ curveVelocity I (fun q ↦ f q r) u) v =
      alongCurve cov (fun q ↦ f q v) (fun q ↦ curveVelocity I (f q) v) u := by
  have : IsManifold I (minSmoothness ℝ 2) M := by
    rw [minSmoothness_of_isRCLikeNormedField]; infer_instance
  exact CovariantDerivative.alongCurve_curveVelocity_comm cov hcov
    (by rwa [minSmoothness_of_isRCLikeNormedField])

/-- **The integration-by-parts step**: `∂_t ⟪V, γ'⟫ = ⟪D_t V, γ'⟫ + ⟪V, D_t γ'⟫`. -/
theorem hasDerivAt_inner_variationField_curveVelocity {t : ℝ}
    (hf : ContMDiffAt 𝓘(ℝ, ℝ × ℝ) I 2 (fun z : ℝ × ℝ ↦ F z.1 z.2) (0, t)) :
    HasDerivAt (fun r ↦ inner ℝ (variationField I F r) (curveVelocity I (F 0) r))
      (inner ℝ (alongCurve (leviCivitaConnection I M) (F 0) (variationField I F) t)
          (curveVelocity I (F 0) t) +
        inner ℝ (variationField I F t) (acceleration (leviCivitaConnection I M) (F 0) t)) t :=
  TauCeti.Manifold.hasDerivAt_inner_variationField_curveVelocity hf

/-- **The first-variation formula.** -/
theorem hasDerivAt_energy
    (hF : ∀ t ∈ uIcc a b, ContMDiffAt 𝓘(ℝ, ℝ × ℝ) I 2 (fun z : ℝ × ℝ ↦ F z.1 z.2) (0, t)) :
    HasDerivAt (fun s ↦ energy I (F s) a b)
      (inner ℝ (variationField I F b) (curveVelocity I (F 0) b) -
        inner ℝ (variationField I F a) (curveVelocity I (F 0) a) -
        ∫ t in a..b, inner ℝ (variationField I F t)
          (acceleration (leviCivitaConnection I M) (F 0) t)) 0 :=
  TauCeti.Manifold.hasDerivAt_energy hF

/-- The first-variation formula with fixed endpoints. -/
theorem IsFixedEndpointVariation.hasDerivAt_energy (hF : IsFixedEndpointVariation I 2 F a b) :
    HasDerivAt (fun s ↦ energy I (F s) a b)
      (-∫ t in a..b, inner ℝ (variationField I F t)
        (acceleration (leviCivitaConnection I M) (F 0) t)) 0 :=
  TauCeti.Manifold.IsFixedEndpointVariation.hasDerivAt_energy hF

/-- **A smooth curve is critical exactly when it is a geodesic.** -/
theorem isEnergyCritical_iff_isGeodesicCurveOn [I.Boundaryless]
    (hγ : ∀ t ∈ uIcc a b, ContMDiffAt 𝓘(ℝ, ℝ) I ∞ γ t) :
    IsEnergyCritical I ∞ γ a b ↔ IsGeodesicCurveOn I γ (uIoo a b) :=
  TauCeti.Manifold.isEnergyCritical_iff_isGeodesicCurveOn (n := ⊤) le_top hγ

end FirstVariation

/-! ## Layer 3: the Hopf–Rinow equivalence -/

section HopfRinow

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  [IsRiemannianManifold I M]

/-- **The Hopf–Rinow theorem**: the TFAE of `(a_p)`, (b), (c), global (d), and `(e_p)` in the
README's Lean form. -/
theorem tfae_expDomain_eq_univ (p : M) :
    List.TFAE [expDomain I M p = univ, ProperSpace M, CompleteSpace M,
      ∀ q : M, IsGeodesicallyCompleteAt I M q,
      ∃ K : ℕ → Set M, (∀ n, IsCompact (K n)) ∧ Monotone K ∧ (⋃ n, K n) = univ ∧
        ∀ q : ℕ → M, (∀ n, q n ∉ K n) → Tendsto (fun n ↦ dist p (q n)) atTop atTop] :=
  TauCeti.Manifold.tfae_expDomain_eq_univ p

/-- **(c) ⇒ (d).** -/
theorem isGeodesicallyCompleteAt_of_completeSpace [CompleteSpace M] (p : M) :
    IsGeodesicallyCompleteAt I M p :=
  TauCeti.Manifold.isGeodesicallyCompleteAt_of_completeSpace p

/-- **(a_p) ⇒ (f_p)**: a geodesic segment on `[0, 1]` from `p` to `q` realizing the distance, all
of whose subsegments realize distance too. -/
theorem exists_isGeodesicCurveOn_Icc_pathELength_eq_edist {p : M} (ha : expDomain I M p = univ)
    (q : M) :
    ∃ γ : ℝ → M, IsGeodesicCurveOn I γ (Icc 0 1) ∧ γ 0 = p ∧ γ 1 = q ∧
      pathELength I γ 0 1 = edist p q ∧
      ∀ s ∈ Icc (0 : ℝ) 1, ∀ t ∈ Icc (0 : ℝ) 1, s ≤ t → pathELength I γ s t = edist (γ s) (γ t) :=
  TauCeti.Manifold.exists_isGeodesicCurveOn_Icc_pathELength_eq_edist ha q

/-- **(a_p) and (f_p) ⇒ closed balls are exponential images** of tangent balls (no injectivity
claimed). -/
theorem closedBall_eq_image_riemannianExp {p : M} (ha : expDomain I M p = univ) (r : ℝ) :
    Metric.closedBall p r = riemannianExp I M p '' Metric.closedBall 0 r :=
  TauCeti.Manifold.closedBall_eq_image_riemannianExp fun q _ ↦
    (TauCeti.Manifold.exists_riemannianExp_eq_and_norm_eq_dist ha q).imp fun _ h ↦ ⟨h.1, h.2.le⟩

/-- **(a_p) ⇒ (b).** -/
theorem properSpace_of_expDomain_eq_univ {p : M} (ha : expDomain I M p = univ) : ProperSpace M :=
  TauCeti.Manifold.properSpace_of_expDomain_eq_univ ha

/-- **(b) ⇒ (c)**, consuming Mathlib's `complete_of_proper`. -/
example [ProperSpace M] : CompleteSpace M :=
  complete_of_proper

/-- **(b) ⇔ (e_p)**, in any pseudometric space. -/
theorem properSpace_iff_exists_isCompact_monotone_iUnion_eq_univ_tendsto_dist {α : Type*}
    [PseudoMetricSpace α] (p : α) :
    ProperSpace α ↔ ∃ K : ℕ → Set α, (∀ n, IsCompact (K n)) ∧ Monotone K ∧ (⋃ n, K n) = univ ∧
      ∀ q : ℕ → α, (∀ n, q n ∉ K n) → Tendsto (fun n ↦ dist p (q n)) atTop atTop :=
  TauCeti.properSpace_iff_exists_isCompact_monotone_iUnion_eq_univ_tendsto_dist p

/-- **Base-point propagation**: geodesic completeness at one point gives it at every point. -/
theorem isGeodesicallyCompleteAt_iff_forall (p : M) :
    IsGeodesicallyCompleteAt I M p ↔ ∀ q : M, IsGeodesicallyCompleteAt I M q :=
  TauCeti.Manifold.isGeodesicallyCompleteAt_iff_forall p

theorem expDomain_eq_univ_iff_forall (p : M) :
    expDomain I M p = univ ↔ ∀ q : M, expDomain I M q = univ :=
  TauCeti.Manifold.expDomain_eq_univ_iff_forall p

end HopfRinow

section Escape

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  {p : M} {v : TangentSpace I p}

/-- The step of (c) ⇒ (d) that goes through `TM`: at a finite right endpoint of its maximal
interval, a maximal geodesic eventually leaves every compact set. -/
theorem eventually_notMem_nhdsLT_maximalGeodesic {b : ℝ} (hb : IsLUB (geodesicInterval I M p v) b)
    {K : Set M} (hK : IsCompact K) : ∀ᶠ t in 𝓝[<] b, maximalGeodesic I M p v t ∉ K :=
  TauCeti.Manifold.eventually_notMem_nhdsLT_maximalGeodesic hb hK

/-- The left-endpoint analogue. -/
theorem eventually_notMem_nhdsGT_maximalGeodesic {a : ℝ} (ha : IsGLB (geodesicInterval I M p v) a)
    {K : Set M} (hK : IsCompact K) : ∀ᶠ t in 𝓝[>] a, maximalGeodesic I M p v t ∉ K :=
  TauCeti.Manifold.eventually_notMem_nhdsGT_maximalGeodesic ha hK

/-- **Compact ⇒ geodesically complete** (do Carmo, Corollary 2.9), without connectedness. -/
theorem isGeodesicallyCompleteAt_of_compactSpace [CompactSpace M] (p : M) :
    IsGeodesicallyCompleteAt I M p :=
  TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace p

end Escape

/-! ## Layer 4: corollaries and downstream theory -/

section LengthSpace

/-- **Length spaces**: the distance is the infimum of the lengths (`eVariationOn`, the supremum of
finite sums of successive distances) of the continuous curves joining two points. -/
theorem isLengthSpace_iff (X : Type*) [PseudoEMetricSpace X] :
    TauCeti.IsLengthSpace X ↔ ∀ x y : X,
      edist x y = ⨅ (γ : ℝ → X) (_ : TauCeti.IsCurveJoining γ x y), eVariationOn γ (Icc 0 1) :=
  ⟨fun h ↦ h.1, fun h ↦ ⟨h⟩⟩

theorem isCurveJoining_iff {X : Type*} [TopologicalSpace X] (γ : ℝ → X) (x y : X) :
    TauCeti.IsCurveJoining γ x y ↔ ContinuousOn γ (Icc 0 1) ∧ γ 0 = x ∧ γ 1 = y :=
  ⟨fun h ↦ ⟨h.1, h.2, h.3⟩, fun h ↦ ⟨h.1, h.2.1, h.2.2⟩⟩

/-- **Geodesic spaces**: any two points are joined by a constant-speed segment on `[0, 1]`. -/
theorem isGeodesicSpace_iff (X : Type*) [PseudoMetricSpace X] :
    TauCeti.IsGeodesicSpace X ↔ ∀ x y : X, ∃ γ : ℝ → X, TauCeti.IsGeodesicSegment γ x y :=
  ⟨fun h ↦ h.1, fun h ↦ ⟨h⟩⟩

theorem isGeodesicSegment_iff {X : Type*} [PseudoMetricSpace X] (γ : ℝ → X) (x y : X) :
    TauCeti.IsGeodesicSegment γ x y ↔ γ 0 = x ∧ γ 1 = y ∧
      ∀ s ∈ Icc (0 : ℝ) 1, ∀ t ∈ Icc (0 : ℝ) 1, dist (γ s) (γ t) = |s - t| * dist x y :=
  ⟨fun h ↦ ⟨h.1, h.2, h.3⟩, fun h ↦ ⟨h.1, h.2.1, h.2.2⟩⟩

/-- **Geodesic spaces are length spaces.** -/
example (X : Type*) [PseudoMetricSpace X] [TauCeti.IsGeodesicSpace X] : TauCeti.IsLengthSpace X :=
  inferInstance

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [MetricSpace M] [ChartedSpace H M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)] [IsRiemannianManifold I M]

variable (I) in
include I in
/-- **A Riemannian manifold is a length space.** -/
theorem isLengthSpace : TauCeti.IsLengthSpace M :=
  TauCeti.Manifold.isLengthSpace I

variable [FiniteDimensional ℝ E] [I.Boundaryless] [IsManifold I ∞ M]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]

variable (I) in
include I in
/-- **A complete Riemannian manifold is a geodesic space.** -/
theorem isGeodesicSpace_of_completeSpace [CompleteSpace M] : TauCeti.IsGeodesicSpace M :=
  TauCeti.Manifold.isGeodesicSpace_of_completeSpace I

end LengthSpace

section Isometry

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  {H' : Type*} [TopologicalSpace H'] {J : ModelWithCorners ℝ F H'}
  {N : Type*} [TopologicalSpace N] [ChartedSpace H' N] [IsManifold J ∞ N]
  [RiemannianBundle (fun y : N ↦ TangentSpace J y)]
  [IsContMDiffRiemannianBundle J ∞ F (fun y : N ↦ TangentSpace J y)]
  (Φ : TauCeti.RiemannianIsometry I J M N)

/-- **Smooth Riemannian isometries**: a `C^∞` diffeomorphism whose tangent maps preserve the
Riemannian inner products. -/
example (f : Diffeomorph I J M N ∞)
    (hf : ∀ x (v w : TangentSpace I x),
      inner ℝ (mfderiv I J f x v) (mfderiv I J f x w) = inner ℝ v w) :
    TauCeti.RiemannianIsometry I J M N :=
  ⟨f, hf⟩

/-- **Transport of the Levi-Civita connection**, identified with the target connection. -/
theorem mfderiv_leviCivitaConnection_mpullback {Y : Π y : N, TangentSpace J y} {x : M}
    (hY : MDiffAt (T% Y) (Φ x)) (v : TangentSpace I x) :
    mfderiv I J Φ x (leviCivitaConnection I M (VectorField.mpullback I J Φ Y) x v) =
      leviCivitaConnection J N Y (Φ x) (mfderiv I J Φ x v) :=
  Φ.mfderiv_leviCivitaConnection_mpullback hY v

/-- **Geodesics are preserved.** -/
theorem isGeodesicCurveOn_comp_iff {γ : ℝ → M} {s : Set ℝ} :
    IsGeodesicCurveOn J (Φ ∘ γ) s ↔ IsGeodesicCurveOn I γ s :=
  Φ.isGeodesicCurveOn_comp_iff

/-- **Maximal intervals are preserved.** -/
theorem geodesicInterval_mfderiv (p : M) (v : TangentSpace I p) :
    geodesicInterval J N (Φ p) (mfderiv I J Φ p v) = geodesicInterval I M p v :=
  Φ.geodesicInterval_mfderiv p v

/-- **Geodesic completeness is preserved.** -/
theorem isGeodesicallyCompleteAt_iff_of_riemannianIsometry (p : M) :
    IsGeodesicallyCompleteAt I M p ↔ IsGeodesicallyCompleteAt J N (Φ p) :=
  Φ.isGeodesicallyCompleteAt_iff p

variable [I.Boundaryless] [T2Space M] [J.Boundaryless] [T2Space N]

/-- **Exponential maps are preserved.** -/
theorem riemannianExp_mfderiv (p : M) (v : TangentSpace I p) :
    riemannianExp J N (Φ p) (mfderiv I J Φ p v) = Φ (riemannianExp I M p v) :=
  Φ.riemannianExp_mfderiv p v

end Isometry

section IsometryDistance

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [PseudoEMetricSpace M] [ChartedSpace H M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
  {H' : Type*} [TopologicalSpace H'] {J : ModelWithCorners ℝ F H'}
  {N : Type*} [PseudoEMetricSpace N] [ChartedSpace H' N]
  [RiemannianBundle (fun y : N ↦ TangentSpace J y)]
  (Φ : TauCeti.RiemannianIsometry I J M N)

/-- The Riemannian distance is preserved. -/
theorem riemannianEDist_eq (x y : M) :
    riemannianEDist J (Φ x) (Φ y) = riemannianEDist I x y :=
  Φ.riemannianEDist_eq x y

/-- **Transport through `IsRiemannianManifold`**: between Riemannian manifolds whose metrics are
the Riemannian distances, a smooth Riemannian isometry is an isometry. -/
theorem isometry_of_riemannianIsometry [IsRiemannianManifold I M] [IsRiemannianManifold J N] :
    Isometry Φ :=
  IsometryClass.isometry Φ

end IsometryDistance

/-! ## Worked examples -/

section Euclidean

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]

/-- The affine segment from `x` to `y` has length `‖x - y‖`. -/
theorem pathELength_lineMap (x y : F) :
    pathELength 𝓘(ℝ, F) (⇑(ContinuousAffineMap.lineMap (R := ℝ) x y)) 0 1 = ‖x - y‖ₑ :=
  TauCeti.Manifold.pathELength_lineMap x y

variable [FiniteDimensional ℝ F]

/-- **Geodesics of `F` are affine lines.** -/
theorem isGeodesicCurve_iff_exists_eq_add_smul {γ : ℝ → F} :
    IsGeodesicCurve 𝓘(ℝ, F) γ ↔ ∃ p v : F, γ = fun t : ℝ ↦ p + t • v :=
  TauCeti.Manifold.isGeodesicCurve_iff_exists_eq_add_smul

/-- `F` is geodesically complete (metric completeness is Mathlib's finite-dimensional instance). -/
theorem isGeodesicallyCompleteAt_model_space (p : F) :
    IsGeodesicallyCompleteAt 𝓘(ℝ, F) F p :=
  TauCeti.Manifold.isGeodesicallyCompleteAt_model_space p

example : CompleteSpace F := inferInstance

theorem maximalGeodesic_model_space (p v : F) (t : ℝ) :
    maximalGeodesic 𝓘(ℝ, F) F p v t = p + t • v :=
  TauCeti.Manifold.maximalGeodesic_model_space p v t

theorem geodesicInterval_model_space (p v : F) : geodesicInterval 𝓘(ℝ, F) F p v = univ :=
  TauCeti.Manifold.geodesicInterval_model_space p v

theorem expDomain_model_space (p : F) : expDomain 𝓘(ℝ, F) F p = univ :=
  TauCeti.Manifold.expDomain_model_space p

theorem riemannianExp_model_space (p : F) (v : TangentSpace 𝓘(ℝ, F) p) :
    riemannianExp 𝓘(ℝ, F) F p v = p + NormedSpace.fromTangentSpace p v :=
  TauCeti.Manifold.riemannianExp_model_space p v

/-- The tangent `r`-ball is a normal domain, whose normal neighbourhood is `ball p r`. -/
theorem isNormalDomain_ball_model_space (p : F) {r : ℝ} (hr : 0 < r) :
    IsNormalDomain 𝓘(ℝ, F) F p (Metric.ball (0 : TangentSpace 𝓘(ℝ, F) p) r) :=
  TauCeti.Manifold.isNormalDomain_ball_model_space p hr

theorem image_riemannianExp_ball_model_space (p : F) (r : ℝ) :
    riemannianExp 𝓘(ℝ, F) F p '' Metric.ball (0 : TangentSpace 𝓘(ℝ, F) p) r = Metric.ball p r :=
  TauCeti.Manifold.image_riemannianExp_ball_model_space p r

/-- `log_p q = q - p`. -/
theorem riemannianLog_ball_model_space {p q : F} {r : ℝ} (hq : q ∈ Metric.ball p r) :
    riemannianLog 𝓘(ℝ, F) F p (Metric.ball 0 r) q = (NormedSpace.fromTangentSpace p).symm (q - p) :=
  TauCeti.Manifold.riemannianLog_ball_model_space hq

/-- `d exp_p = id`. -/
theorem mfderiv_riemannianExp_apply_model_space (p : F) (v w : TangentSpace 𝓘(ℝ, F) p) :
    mfderiv 𝓘(ℝ, TangentSpace 𝓘(ℝ, F) p) 𝓘(ℝ, F) (riemannianExp 𝓘(ℝ, F) F p) v w =
      NormedSpace.fromTangentSpace p w :=
  TauCeti.Manifold.mfderiv_riemannianExp_apply_model_space p v w

/-- The Gauss identity. -/
theorem inner_mfderiv_riemannianExp_model_space (p : F) (v w₁ w₂ : TangentSpace 𝓘(ℝ, F) p) :
    inner ℝ (mfderiv 𝓘(ℝ, TangentSpace 𝓘(ℝ, F) p) 𝓘(ℝ, F) (riemannianExp 𝓘(ℝ, F) F p) v w₁)
        (mfderiv 𝓘(ℝ, TangentSpace 𝓘(ℝ, F) p) 𝓘(ℝ, F) (riemannianExp 𝓘(ℝ, F) F p) v w₂) =
      inner ℝ w₁ w₂ :=
  TauCeti.Manifold.inner_mfderiv_riemannianExp_model_space p v w₁ w₂

end Euclidean

section OpenUnitBall

open scoped TauCeti
open TauCeti TauCeti.RealOpenUnitBall

/-- The open unit ball in `ℝ`, with the Layer 0 restriction of the flat metric. -/
theorem realOpenUnitBall_isRiemannianManifold : IsRiemannianManifold 𝓘(ℝ, ℝ) realOpenUnitBall :=
  TauCeti.RealOpenUnitBall.isRiemannianManifold

/-- Every `q` is joined to `0` by a geodesic segment realizing `dist 0 q`. -/
theorem realOpenUnitBall_exists_isGeodesicCurveOn_Icc_pathELength_eq_edist (q : realOpenUnitBall) :
    ∃ γ : ℝ → realOpenUnitBall, IsGeodesicCurveOn 𝓘(ℝ, ℝ) γ (Icc 0 1) ∧
      γ 0 = RealOpenUnitBall.center ∧
      γ 1 = q ∧ pathELength 𝓘(ℝ, ℝ) γ 0 1 = edist RealOpenUnitBall.center q :=
  TauCeti.RealOpenUnitBall.exists_isGeodesicCurveOn_Icc_pathELength_eq_edist q

/-- `closedBall 0 2` is the whole ball and is not compact. -/
theorem realOpenUnitBall_closedBall_two :
    Metric.closedBall RealOpenUnitBall.center 2 = univ ∧
      ¬ IsCompact (Metric.closedBall RealOpenUnitBall.center 2) :=
  ⟨closedBall_center_eq_univ 2 (by norm_num), not_isCompact_closedBall_center 2 (by norm_num)⟩

/-- A unit-speed radial geodesic reaches the missing boundary in finite time. -/
theorem realOpenUnitBall_maximalGeodesic {v : TangentSpace 𝓘(ℝ, ℝ) RealOpenUnitBall.center}
    (hv : ‖v‖ = 1) :
    geodesicInterval 𝓘(ℝ, ℝ) realOpenUnitBall RealOpenUnitBall.center v = Ioo (-1) 1 ∧
      Tendsto (fun t ↦ |(maximalGeodesic 𝓘(ℝ, ℝ) realOpenUnitBall RealOpenUnitBall.center v t : ℝ)|)
        (𝓝[<] 1) (𝓝 1) :=
  ⟨geodesicInterval_center_of_norm_eq_one hv, tendsto_abs_coe_maximalGeodesic_center hv⟩

/-- The open unit ball is neither metrically nor geodesically complete. -/
theorem realOpenUnitBall_not_complete :
    ¬ CompleteSpace realOpenUnitBall ∧
      ¬ IsGeodesicallyCompleteAt 𝓘(ℝ, ℝ) realOpenUnitBall RealOpenUnitBall.center :=
  ⟨not_completeSpace, not_isGeodesicallyCompleteAt RealOpenUnitBall.center⟩

end OpenUnitBall

end TauCetiRoadmap.HopfRinow
