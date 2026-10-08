import Mathlib
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Compact
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Euclidean
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Examples.OpenUnitBall
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.FirstVariation
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Gauss.Uniqueness
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.MetricSegment
import TauCeti.Geometry.Manifold.Riemannian.Isometry.Completeness
import TauCeti.Geometry.Manifold.Riemannian.Isometry.Distance
import TauCeti.Geometry.Manifold.Riemannian.LengthSpace

/-!
# Geodesics, the exponential map, and the Hopf-Rinow theorem: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for the milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Every milestone of `README.md` has a statement here, in the form the roadmap asks for, closed
by the Tau Ceti declaration that realizes it, so the correspondence is checked by the Lean kernel
rather than asserted in prose. No statement is left as `sorry`. That is evidence for completion,
not its criterion: completion is judged by a milestone-by-milestone audit against `README.md`,
which a `sorry`-free file of suggested forms cannot replace.

The earlier version of this file stated one Layer 0 target, the comparison of
`Manifold.riemannianEDist` with an infimum over paths that are `C¹` on the pieces of an
`ℕ`-indexed strict partition, and deferred the geodesic-level signatures until Layer 1 supplied
real types. That target is kept verbatim (`riemannianEDist_eq_iInf_piecewiseCOne`) and is now
proved from Tau Ceti's `Fin`-indexed form; the deferred signatures are stated below against the
Tau Ceti objects (`IsGeodesicCurveOn`, `geodesicInterval`, `expDomain`, `riemannianExp`, ...).

The following differences between the README and Tau Ceti are deliberate.

* The pinned Mathlib already provides `CovariantDerivative.IsMetricCompatible`,
  `CovariantDerivative.IsLeviCivitaConnection` and the connection
  `CovariantDerivative.leviCivitaConnection`, so no local metric-compatibility shim exists. Tau
  Ceti supplies uniqueness as the vanishing of the difference tensor, and the `C^∞` regularity.
* The covariant derivative along a curve, `CovariantDerivative.alongCurveWithin`, is constructed
  by the coordinate formula `v' + Γ(v, u')` in the chart at the current point of the curve. The
  same formula computed in any other chart whose base set contains that point gives the same
  vector, for an arbitrary differentiable field along the curve, and the coordinate readings in
  two such charts are related by the tangent coordinate change. Its agreement with the ambient
  derivative is proved for pulled-back fields.
* `riemannianExp` is total, with junk value `p` outside `expDomain p`. Domain hypotheses are
  carried where genuine geodesic evaluation or smoothness is needed.
  Identities and bounds that remain valid for the total extension are stated without them: for
  example the homogeneity identity `exp_p (t • v) = γ_{p,v}(t)` for every `t`, the closed-ball
  identity `closedBall p r = exp_p '' closedBall 0 r`, and the intertwining of exponential maps by
  Riemannian isometries.
* The Layer 3 statements assume `[MetricSpace M]` and `[IsRiemannianManifold I M]` but not
  `[ConnectedSpace M]`: a metric whose distance is the Riemannian distance has finite Riemannian
  distances, so a nonempty such `M` is already connected. Connectedness is assumed explicitly where
  the ordinary metric is constructed from the manifold (`dist_ofRiemannianMetric`).
* Do Carmo's Corollary 2.9 is realized without `[ConnectedSpace M]`, through the extended metric.
  This is stronger than the connected route the README settles for.
* Metric curve length is Mathlib's `eVariationOn`, which is the supremum of finite sums of
  successive distances, rather than a new definition.
* The finite-endpoint extension criterion is stated for any integral curve of a `C¹` vector field
  on an open interval, not only a maximal one; it applies to the geodesic spray on `TM`. The
  manifold inverse-function theorem is stated for `C^n` maps, `1 ≤ n`, at an interior point,
  which covers the boundaryless `C¹` case the README asks for.
* Constant-speed reparametrization assumes the curve is `C¹` on an open set containing `[a, b]`;
  lower semicontinuity of length is stated for a Riemannian extended metric, which supplies the
  uniform structure in which convergence is uniform. The variational characterization of
  geodesics is stated for smooth curves and smooth variations; Tau Ceti proves it at every order
  `2 ≤ n ≤ ∞`.
-/

namespace TauCetiRoadmap.HopfRinow

open Bundle CovariantDerivative Filter Function Manifold Set TauCeti TauCeti.Manifold
open scoped ContDiff ENNReal Manifold Topology

/-! ## Layer 0: the reconciled Riemannian distance -/

section Layer0

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]

/-- A smooth Riemannian metric is in particular continuous. -/
local instance : IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x) :=
  IsContMDiffRiemannianBundle.toIsContinuousRiemannianBundle (IB := I) (n := ∞)

/-- **Constant-speed reparametrization of a regular `C¹` curve.** A curve that is `C¹` near
`[a, b]` with nowhere-vanishing velocity there is reparametrized by arc length: with
`L = ∫_a^b ‖γ'‖`, a strictly increasing `C¹` change of parameter `ψ` from `[0, L]` into `[a, b]`
makes `γ ∘ ψ` a `C¹` curve of unit speed with the same endpoints and the same length, and `L` is
that length. -/
theorem exists_unit_speed_reparametrization {γ : ℝ → M} {J : Set ℝ} (hJ : IsOpen J)
    (hγ : ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ J) {a b : ℝ} (hab : a ≤ b) (hsub : Icc a b ⊆ J)
    (hreg : ∀ t ∈ Icc a b, curveVelocity I γ t ≠ 0) :
    ∃ ψ : ℝ → ℝ,
      MapsTo ψ (Icc 0 (∫ r in a..b, ‖curveVelocity I γ r‖)) (Icc a b) ∧
      StrictMonoOn ψ (Icc 0 (∫ r in a..b, ‖curveVelocity I γ r‖)) ∧
      ContDiffOn ℝ 1 ψ (Icc 0 (∫ r in a..b, ‖curveVelocity I γ r‖)) ∧
      ContMDiffOn 𝓘(ℝ, ℝ) I 1 (γ ∘ ψ) (Icc 0 (∫ r in a..b, ‖curveVelocity I γ r‖)) ∧
      (γ ∘ ψ) 0 = γ a ∧ (γ ∘ ψ) (∫ r in a..b, ‖curveVelocity I γ r‖) = γ b ∧
      (∀ s ∈ Icc (0 : ℝ) (∫ r in a..b, ‖curveVelocity I γ r‖),
        ‖curveVelocity I (γ ∘ ψ) s‖ = 1) ∧
      pathELength I (γ ∘ ψ) 0 (∫ r in a..b, ‖curveVelocity I γ r‖) = pathELength I γ a b ∧
      (∫ r in a..b, ‖curveVelocity I γ r‖) = (pathELength I γ a b).toReal := by
  obtain ⟨ψ, -, -, hmaps, hmono, hC1, hγψ, h0, hL, hspeed, hlen, hreal⟩ :=
    TauCeti.Manifold.exists_unit_speed_reparametrization hJ hγ hab hsub hreg
  exact ⟨ψ, hmaps, hmono, hC1, hγψ, h0, hL, hspeed, hlen, hreal⟩

omit [IsManifold I ∞ M] [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
/-- **Piecewise-`C¹` paths.** A path is piecewise `C¹` on `[a, b]` exactly when some finite strict
partition from `a` to `b`, with at least one piece, makes it `C¹` on every closed piece. -/
theorem isPiecewiseContMDiffOn_iff {γ : ℝ → M} {a b : ℝ} :
    IsPiecewiseContMDiffOn I 1 γ a b ↔
      ∃ (k : ℕ) (τ : Fin (k + 2) → ℝ), τ 0 = a ∧ τ (Fin.last (k + 1)) = b ∧
        (∀ i : Fin (k + 1), τ i.castSucc < τ i.succ) ∧
        ∀ i : Fin (k + 1), ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ (Icc (τ i.castSucc) (τ i.succ)) :=
  ⟨fun h ↦ h.exists_partition, fun ⟨_, τ, ha, hb, hτ, hγ⟩ ↦ .of_partition τ ha hb hτ hγ⟩

omit [IsManifold I ∞ M] [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
/-- **The length of a piecewise-`C¹` path is the sum of the lengths of its pieces**, computed with
Mathlib's `pathELength` on each piece of some witnessing partition. -/
theorem IsPiecewiseContMDiffOn.exists_partition_sum_pathELength_eq {γ : ℝ → M} {a b : ℝ}
    (h : IsPiecewiseContMDiffOn I 1 γ a b) :
    ∃ (k : ℕ) (τ : Fin (k + 2) → ℝ), τ 0 = a ∧ τ (Fin.last (k + 1)) = b ∧
      (∀ i : Fin (k + 1), τ i.castSucc < τ i.succ) ∧
      (∀ i : Fin (k + 1), ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ (Icc (τ i.castSucc) (τ i.succ))) ∧
      ∑ i : Fin (k + 1), pathELength I γ (τ i.castSucc) (τ i.succ) = pathELength I γ a b :=
  h.exists_partition_sum_pathELength_eq

omit [IsManifold I ∞ M] [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
/-- **Independence under refinement.** Two ordered partitions with the same endpoints give the
same sum of piece lengths; in particular refining a partition does not change the length. -/
theorem sum_pathELength_eq_of_endpoints_eq {γ : ℝ → M} {r s : ℕ} {τ : Fin (r + 1) → ℝ}
    {σ : Fin (s + 1) → ℝ} (hτ : ∀ i : Fin r, τ i.castSucc ≤ τ i.succ)
    (hσ : ∀ i : Fin s, σ i.castSucc ≤ σ i.succ) (h₀ : τ 0 = σ 0)
    (h₁ : τ (Fin.last r) = σ (Fin.last s)) :
    ∑ i : Fin r, pathELength I γ (τ i.castSucc) (τ i.succ) =
      ∑ i : Fin s, pathELength I γ (σ i.castSucc) (σ i.succ) :=
  TauCeti.Manifold.sum_pathELength_eq_of_endpoints_eq hτ hσ h₀ h₁

omit [IsManifold I ∞ M] [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
/-- **Corner smoothing.** Every piecewise-`C¹` path has a `C¹` path on `[0, 1]` with the same
endpoints and the same length, whose image stays in the image of the original path. -/
theorem IsPiecewiseContMDiffOn.exists_contMDiff_pathELength_eq {γ : ℝ → M} {a b : ℝ}
    (h : IsPiecewiseContMDiffOn I 1 γ a b) :
    ∃ η : ℝ → M, ContMDiff 𝓘(ℝ, ℝ) I 1 η ∧ η 0 = γ a ∧ η 1 = γ b ∧
      pathELength I η 0 1 = pathELength I γ a b ∧ MapsTo η (Icc 0 1) (γ '' Icc a b) :=
  h.exists_contMDiff_pathELength_eq

omit [IsManifold I ∞ M] [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
/-- **Do Carmo's distance is Mathlib's distance.** The infimum of the lengths of piecewise-`C¹`
paths from `x` to `y` is Mathlib's `C¹` infimum `Manifold.riemannianEDist`. -/
theorem riemannianEDist_eq_iInf_pathELength_piecewise (x y : M) :
    riemannianEDist I x y =
      ⨅ (γ : ℝ → M) (a : ℝ) (b : ℝ) (_ : IsPiecewiseContMDiffOn I 1 γ a b)
        (_ : γ a = x) (_ : γ b = y), pathELength I γ a b :=
  TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise I x y

omit [IsManifold I ∞ M] [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
/-- The same comparison in the form proposed by the earlier version of this file, with the
partition indexed by `ℕ` rather than by `Fin`. -/
theorem riemannianEDist_eq_iInf_piecewiseCOne (x y : M) :
    riemannianEDist I x y =
      ⨅ (γ : ℝ → M) (n : ℕ) (τ : ℕ → ℝ) (_ : 0 < n)
        (_ : ∀ i < n, τ i < τ (i + 1))
        (_ : ∀ i < n, ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ (Icc (τ i) (τ (i + 1))))
        (_ : γ (τ 0) = x) (_ : γ (τ n) = y),
        pathELength I γ (τ 0) (τ n) := by
  rw [TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise I]
  apply le_antisymm
  · refine le_iInf fun γ ↦ le_iInf fun n ↦ le_iInf fun τ ↦ le_iInf fun hn ↦ le_iInf fun hτ ↦
      le_iInf fun hγ ↦ le_iInf fun hx ↦ le_iInf fun hy ↦ ?_
    obtain ⟨k, rfl⟩ := Nat.exists_eq_add_of_lt hn
    have hpw : IsPiecewiseContMDiffOn I 1 γ (τ 0) (τ (0 + k + 1)) :=
      .of_partition (k := k) (fun i : Fin (k + 2) ↦ τ i) rfl (by simp)
        (fun i ↦ by simpa using hτ i (by omega)) (fun i ↦ by simpa using hγ i (by omega))
    exact iInf_le_of_le γ (iInf_le_of_le (τ 0) (iInf_le_of_le (τ (0 + k + 1))
      (iInf_le_of_le hpw (iInf_le_of_le hx (iInf_le_of_le hy le_rfl)))))
  · refine le_iInf fun γ ↦ le_iInf fun a ↦ le_iInf fun b ↦ le_iInf fun hpw ↦ le_iInf fun hx ↦
      le_iInf fun hy ↦ ?_
    obtain ⟨k, τ, ha, hb, hτ, hγ⟩ := hpw.exists_partition
    let σ : ℕ → ℝ := fun i ↦ if h : i < k + 2 then τ ⟨i, h⟩ else b
    have hσ (i : Fin (k + 2)) : σ i = τ i := by simp [σ]
    have hσ0 : σ 0 = a := by simpa using (hσ 0).trans ha
    have hσn : σ (k + 1) = b := by simpa using (hσ (Fin.last (k + 1))).trans hb
    have hlt : ∀ i < k + 1, σ i < σ (i + 1) := fun i hi ↦ by
      simpa [σ, show i < k + 2 by omega, show i + 1 < k + 2 by omega] using hτ ⟨i, hi⟩
    have hC : ∀ i < k + 1, ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ (Icc (σ i) (σ (i + 1))) := fun i hi ↦ by
      simpa [σ, show i < k + 2 by omega, show i + 1 < k + 2 by omega] using hγ ⟨i, hi⟩
    refine iInf_le_of_le γ (iInf_le_of_le (k + 1) (iInf_le_of_le σ (iInf_le_of_le (by omega)
      (iInf_le_of_le hlt (iInf_le_of_le hC (iInf_le_of_le (by rw [hσ0, hx])
        (iInf_le_of_le (by rw [hσn, hy]) ?_)))))))
    rw [hσ0, hσn]

omit [IsManifold I ∞ M] [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
/-- **Restriction to open submanifolds.** An open subset `U` carries the restricted Riemannian
bundle, whose inner product on `T_x U` is the ambient one on `T_x M`. -/
theorem inner_tangentSpace_open (U : TopologicalSpace.Opens M) (x : U)
    (v w : TangentSpace I x) :
    letI := instRiemannianBundleOpen (I := I) U
    inner ℝ v w = inner ℝ (tangentSpaceOpenEquiv (I := I) x v)
      (tangentSpaceOpenEquiv (I := I) x w) :=
  TauCeti.Manifold.inner_tangentSpace_open U x v w

/-- The restricted Riemannian bundle on an open subset is as smooth as the ambient one. -/
theorem isContMDiffRiemannianBundle_open (U : TopologicalSpace.Opens M) :
    letI := instRiemannianBundleOpen (I := I) U
    IsContMDiffRiemannianBundle I ∞ E (fun x : U ↦ TangentSpace I x) :=
  instIsContMDiffRiemannianBundleOpen U

/-- On an open subset of a regular manifold, Mathlib's `EMetricSpace.ofRiemannianMetric` applied
to the restricted Riemannian bundle has the Riemannian distance of `U` as its extended distance. -/
theorem edist_ofRiemannianMetric_open [T3Space M] (U : TopologicalSpace.Opens M) (x y : U) :
    letI := instRiemannianBundleOpen (I := I) U
    letI := EMetricSpace.ofRiemannianMetric I U
    edist x y = riemannianEDist I x y :=
  rfl

/-- **Distance finiteness.** On a connected manifold the Riemannian extended distance is finite. -/
theorem riemannianEDist_ne_top [ConnectedSpace M] (x y : M) : riemannianEDist I x y ≠ (∞ : ℝ≥0∞) :=
  TauCeti.Manifold.riemannianEDist_ne_top I x y

variable (I M) in
/-- **The ordinary metric-space presentation**, constructed from Mathlib's extended metric once its
distance is known to be finite: its distance is the real part of `Manifold.riemannianEDist`. -/
theorem dist_ofRiemannianMetric [T3Space M] [ConnectedSpace M] (x y : M) :
    letI := TauCeti.MetricSpace.ofRiemannianMetric I M
    dist x y = (riemannianEDist I x y).toReal :=
  letI := TauCeti.MetricSpace.ofRiemannianMetric I M
  dist_edist x y

variable (I M) in
/-- The ordinary metric space so constructed satisfies `IsRiemannianManifold`. -/
theorem isRiemannianManifold_ofRiemannianMetric [T3Space M] [ConnectedSpace M] :
    letI := TauCeti.MetricSpace.ofRiemannianMetric I M
    IsRiemannianManifold I M :=
  inferInstance

end Layer0

section Layer0Convex

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] (U : TopologicalSpace.Opens F)

/-- **Convex open subsets.** On a convex open subset of a real inner-product space, with the
restricted flat metric, the Riemannian distance is the ambient norm distance. -/
theorem riemannianEDist_eq_enorm_sub_of_convex (hU : Convex ℝ (U : Set F)) (x y : U) :
    riemannianEDist 𝓘(ℝ, F) x y = ‖(x : F) - (y : F)‖ₑ :=
  TauCeti.Manifold.riemannianEDist_eq_enorm_sub_of_convex U hU x y

/-- Such a subset, with its subspace metric, is therefore a Riemannian manifold. -/
theorem isRiemannianManifold_of_convex (hU : Convex ℝ (U : Set F)) :
    IsRiemannianManifold 𝓘(ℝ, F) U :=
  TauCeti.Manifold.isRiemannianManifold_of_convex U hU

end Layer0Convex

section Layer0Metric

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [EMetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [IsRiemannianManifold I M]

/-- A smooth Riemannian metric is in particular continuous. -/
local instance : IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x) :=
  IsContMDiffRiemannianBundle.toIsContinuousRiemannianBundle (IB := I) (n := ∞)

/-- **Lower semicontinuity of length** for a sequence of `C¹` curves converging uniformly on one
fixed compact interval to a `C¹` limit curve. -/
theorem pathELength_le_liminf_of_tendstoUniformlyOn {γ : ℝ → M} {γs : ℕ → ℝ → M} {a b : ℝ}
    (hγs : ∀ n, ContMDiffOn 𝓘(ℝ, ℝ) I 1 (γs n) (Icc a b))
    (hγ : ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ (Icc a b))
    (hconv : TendstoUniformlyOn γs γ atTop (Icc a b)) :
    pathELength I γ a b ≤ liminf (fun n ↦ pathELength I (γs n) a b) atTop :=
  pathELength_le_liminf_pathELength_of_tendstoUniformlyOn (Eventually.of_forall hγs) hγ hconv

end Layer0Metric

/-! ## Layer 1: the geodesic equation, the flow, and the exponential map -/

section Layer1Connection

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]

/-- A smooth Riemannian metric is in particular continuous. -/
local instance : IsContinuousRiemannianBundle E (fun x : M => TangentSpace I x) :=
  IsContMDiffRiemannianBundle.toIsContinuousRiemannianBundle (IB := I) (n := ∞)

/-- **The Levi-Civita connection.** A connection on `TM` is Levi-Civita exactly when it is
metric-compatible, in the sense of Mathlib's `CovariantDerivative.IsMetricCompatible`, and
torsion-free. -/
theorem isLeviCivitaConnection_iff (cov : CovariantDerivative I E (fun x : M => TangentSpace I x)) :
    cov.IsLeviCivitaConnection ↔
      cov.IsMetricCompatible (M := M) (V := TangentSpace I) ∧ cov.torsion = 0 :=
  ⟨fun h ↦ ⟨h.isMetricCompatible, h.torsion⟩, fun h ↦ ⟨h.1, h.2⟩⟩

/-- **Existence**: Mathlib's `leviCivitaConnection` is a Levi-Civita connection. -/
theorem isLeviCivitaConnection_leviCivitaConnection :
    (leviCivitaConnection I M).IsLeviCivitaConnection :=
  CovariantDerivative.isLeviCivitaConnection_leviCivitaConnection I

/-- **Uniqueness**: two Levi-Civita connections have vanishing difference tensor. -/
theorem IsLeviCivitaConnection.difference_eq_zero
    {cov cov' : CovariantDerivative I E (fun x : M => TangentSpace I x)}
    (h : cov.IsLeviCivitaConnection) (h' : cov'.IsLeviCivitaConnection) :
    cov.difference cov' = 0 :=
  CovariantDerivative.IsLeviCivitaConnection.difference_eq_zero h h'

/-- **Regularity of the Levi-Civita connection**: it is a `C^∞` connection. -/
example : ContMDiffCovariantDerivative (leviCivitaConnection I M) ∞ := inferInstance

/-- In every tangent-bundle trivialization of the atlas, the model-space Christoffel map
`x ↦ Γ_x`, valued in continuous bilinear maps on the model space, is `C^∞` on the base set. -/
theorem contMDiffOn_christoffelMap_leviCivitaConnection {ι : Type*} [Fintype ι]
    (b : Module.Basis ι ℝ E) (e : Trivialization E (TotalSpace.proj : TangentBundle I M → M))
    [MemTrivializationAtlas e] :
    ContMDiffOn I 𝓘(ℝ, E →L[ℝ] E →L[ℝ] E) ∞
      (christoffelMap b ((leviCivitaConnection I M).isCovariantDerivativeOn (s := e.baseSet)))
      e.baseSet :=
  CovariantDerivative.contMDiffOn_christoffelMap_leviCivitaConnection (n := ∞) (m := ∞) (k := ∞)
    b le_rfl le_rfl

/-- The scalar Christoffel symbols of the Levi-Civita connection are `C^∞` there as well. -/
theorem contMDiffOn_christoffelSymbol_leviCivitaConnection {ι : Type*}
    (b : Module.Basis ι ℝ E) (e : Trivialization E (TotalSpace.proj : TangentBundle I M → M))
    [MemTrivializationAtlas e] (i j l : ι) :
    ContMDiffOn I 𝓘(ℝ) ∞ (christoffelSymbol I b e (leviCivitaConnection I M).toFun i j l)
      e.baseSet :=
  CovariantDerivative.contMDiffOn_christoffelSymbol_leviCivitaConnection (n := ∞) (m := ∞)
    (k := ∞) b le_rfl le_rfl i j l

end Layer1Connection

section Layer1AlongCurve

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  (cov : CovariantDerivative I E (fun x : M => TangentSpace I x)) (γ : ℝ → M)
  (V : ∀ t, TangentSpace I (γ t))

/-- **Covariant derivative along a curve**, of a section `V` of `γ*TM` within a parameter set
`s`: in the chart at the current point `γ t` it is `v' + Γ(v, u')`, for `u` and `v` the chart
readings of the curve and of the field, transported back to `T_{γ t} M`. -/
theorem alongCurveWithin_apply (s : Set ℝ) (t : ℝ) :
    alongCurveWithin cov γ V s t =
      (trivializationAt E (TangentSpace I) (γ t)).symmL ℝ (γ t)
        (derivWithin (sectionCoord (F := E) γ V (γ t)) s t +
          christoffelMap (Module.finBasis ℝ E)
            (cov.isCovariantDerivativeOn (s := (trivializationAt E (TangentSpace I) (γ t)).baseSet))
            (γ t) (sectionCoord (F := E) γ V (γ t) t) (derivWithin (extChartAt I (γ t) ∘ γ) s t)) :=
  CovariantDerivative.alongCurveWithin_apply cov γ V s t

/-- **Chart independence**: for an arbitrary field along the curve, the coordinate formula
computed in the chart at any point `x` whose base set contains `γ t`, transported back to
`T_{γ t} M`, is the derivative along `γ`. -/
theorem symmL_alongCurveInChartWithin {x : M} {s : Set ℝ} {t : ℝ}
    (hx : γ t ∈ (trivializationAt E (TangentSpace I) x).baseSet) (hu : UniqueDiffWithinAt ℝ s t)
    (hγ : MDifferentiableWithinAt 𝓘(ℝ, ℝ) I γ s t)
    (hV : DifferentiableWithinAt ℝ (sectionCoord (F := E) γ V (γ t)) s t) :
    (trivializationAt E (TangentSpace I) x).symmL ℝ (γ t) (alongCurveInChartWithin cov γ V s x t) =
      alongCurveWithin cov γ V s t :=
  CovariantDerivative.symmL_alongCurveInChartWithin cov γ V hx hu hγ hV

/-- The coordinate readings in two charts are related by the tangent coordinate change. -/
theorem alongCurveInChartWithin_coordChange {x y : M} {s : Set ℝ} {t : ℝ}
    (hx : γ t ∈ (trivializationAt E (TangentSpace I) x).baseSet)
    (hy : γ t ∈ (trivializationAt E (TangentSpace I) y).baseSet)
    (hu : UniqueDiffWithinAt ℝ s t) (hγ : MDifferentiableWithinAt 𝓘(ℝ, ℝ) I γ s t)
    (hV : DifferentiableWithinAt ℝ (sectionCoord (F := E) γ V (γ t)) s t) :
    alongCurveInChartWithin cov γ V s y t =
      tangentCoordChange I x y (γ t) (alongCurveInChartWithin cov γ V s x t) :=
  CovariantDerivative.alongCurveInChartWithin_coordChange cov γ V hx hy hu hγ hV

/-- Linearity: the derivative along `γ` is additive in the field. -/
theorem alongCurveWithin_add (W : ∀ t, TangentSpace I (γ t)) (s : Set ℝ) {t : ℝ}
    (hV : DifferentiableWithinAt ℝ (sectionCoord (F := E) γ V (γ t)) s t)
    (hW : DifferentiableWithinAt ℝ (sectionCoord (F := E) γ W (γ t)) s t) :
    alongCurveWithin cov γ (fun r ↦ V r + W r) s t =
      alongCurveWithin cov γ V s t + alongCurveWithin cov γ W s t :=
  CovariantDerivative.alongCurveWithin_add cov γ V W s hV hW

/-- **The Leibniz rule** for a scalar function along the curve. -/
theorem alongCurveWithin_smul (f : ℝ → ℝ) (s : Set ℝ) {t : ℝ}
    (hf : DifferentiableWithinAt ℝ f s t)
    (hV : DifferentiableWithinAt ℝ (sectionCoord (F := E) γ V (γ t)) s t) :
    alongCurveWithin cov γ (fun r ↦ f r • V r) s t =
      derivWithin f s t • V t + f t • alongCurveWithin cov γ V s t :=
  CovariantDerivative.alongCurveWithin_smul cov γ V f s hf hV

/-- **Locality under restriction**: shrinking the parameter set to a neighbourhood of `t` does not
change the derivative at `t`. -/
theorem alongCurveWithin_inter {s u : Set ℝ} {t : ℝ} (hu : u ∈ 𝓝 t) :
    alongCurveWithin cov γ V (s ∩ u) t = alongCurveWithin cov γ V s t :=
  CovariantDerivative.alongCurveWithin_inter cov γ V hu

/-- Locality in the field: only the germ of the field along the parameter set matters. -/
theorem alongCurveWithin_congr {W : ∀ t, TangentSpace I (γ t)} {s : Set ℝ} {t : ℝ}
    (h : ∀ᶠ r in 𝓝[s] t, V r = W r) (ht : V t = W t) :
    alongCurveWithin cov γ V s t = alongCurveWithin cov γ W s t :=
  CovariantDerivative.alongCurveWithin_congr cov γ V h ht

/-- **Naturality under reparametrization.** -/
theorem alongCurveWithin_comp (φ : ℝ → ℝ) {s s' : Set ℝ} {t : ℝ}
    (hφ : DifferentiableWithinAt ℝ φ s' t) (hmaps : MapsTo φ s' s)
    (hγ : DifferentiableWithinAt ℝ (extChartAt I (γ (φ t)) ∘ γ) s (φ t))
    (hV : DifferentiableWithinAt ℝ (sectionCoord (F := E) γ V (γ (φ t))) s (φ t)) :
    alongCurveWithin cov (γ ∘ φ) (fun r ↦ V (φ r)) s' t =
      derivWithin φ s' t • alongCurveWithin cov γ V s (φ t) :=
  CovariantDerivative.alongCurveWithin_comp cov γ V φ hφ hmaps hγ hV

/-- **Agreement with the ambient derivative** for a pulled-back vector field `X`:
`D_t (X ∘ γ) = ∇_{γ'(t)} X`. -/
theorem alongCurveWithin_pullback (X : Π y : M, TangentSpace I y) {s : Set ℝ} {t : ℝ}
    {w : TangentSpace I (γ t)} (hu : UniqueDiffWithinAt ℝ s t)
    (hγ : HasMFDerivWithinAt 𝓘(ℝ, ℝ) I γ s t (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) w))
    (hX : MDifferentiableAt I I.tangent (fun y ↦ (⟨y, X y⟩ : TangentBundle I M)) (γ t)) :
    alongCurveWithin cov γ (fun r ↦ X (γ r)) s t = cov X (γ t) w :=
  CovariantDerivative.alongCurveWithin_pullback cov γ X hu hγ hX

/-- **Covariant acceleration** is the derivative along `γ` of its velocity field, the velocity
being `mfderivWithin 𝓘(ℝ, ℝ) I γ s t` applied to the unit tangent vector. -/
theorem accelerationWithin_eq (s : Set ℝ) (t : ℝ) :
    accelerationWithin cov γ s t =
      alongCurveWithin cov γ (fun r ↦ mfderivWithin 𝓘(ℝ, ℝ) I γ s r 1) s t :=
  CovariantDerivative.accelerationWithin_def cov γ s t

end Layer1AlongCurve

section Layer1

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]

omit [I.Boundaryless] in
/-- **`IsGeodesicCurveOn γ s`**: the parameter set has unique derivatives, the curve is `C²` on it,
and its covariant acceleration for the Levi-Civita connection vanishes on it. -/
theorem isGeodesicCurveOn_iff {γ : ℝ → M} {s : Set ℝ} :
    IsGeodesicCurveOn I γ s ↔ UniqueDiffOn ℝ s ∧ ContMDiffOn 𝓘(ℝ, ℝ) I 2 γ s ∧
      ∀ r ∈ s, accelerationWithin (leviCivitaConnection I M) γ s r = 0 :=
  ⟨fun h ↦ ⟨h.uniqueDiffOn, h.contMDiffOn, h.accelerationWithin_eq_zero⟩,
    fun h ↦ ⟨h.1, h.2.1, h.2.2⟩⟩

omit [I.Boundaryless] in
/-- The all-time predicate is the `s = univ` case. -/
theorem isGeodesicCurveOn_univ {γ : ℝ → M} : IsGeodesicCurveOn I γ univ ↔ IsGeodesicCurve I γ :=
  TauCeti.Manifold.isGeodesicCurveOn_univ

omit [I.Boundaryless] in
/-- **The chart form of the geodesic equation**, read in the chart at the current point of the
curve: `u'' + Γ(u', u') = 0`. -/
theorem isGeodesicCurveOn_iff_chart {γ : ℝ → M} {s : Set ℝ} (hs : UniqueDiffOn ℝ s) :
    IsGeodesicCurveOn I γ s ↔ ContMDiffOn 𝓘(ℝ, ℝ) I 2 γ s ∧ ∀ r ∈ s,
      derivWithin (derivWithin (extChartAt I (γ r) ∘ γ) s) s r +
        christoffelMap (Module.finBasis ℝ E)
          ((leviCivitaConnection I M).isCovariantDerivativeOn
            (s := (trivializationAt E (TangentSpace I) (γ r)).baseSet)) (γ r)
          (derivWithin (extChartAt I (γ r) ∘ γ) s r)
          (derivWithin (extChartAt I (γ r) ∘ γ) s r) = 0 :=
  TauCeti.Manifold.isGeodesicCurveOn_iff_chart hs

omit [I.Boundaryless] in
/-- **Initial data.** A geodesic from `(p, v)` on `s` is a geodesic on `s` with `0 ∈ s` whose
velocity lift at `0` is the tangent vector `v` at `p`. -/
theorem isGeodesicCurveOnFrom_iff {γ : ℝ → M} {s : Set ℝ} {p : M} {v : TangentSpace I p} :
    IsGeodesicCurveOnFrom I γ s p v ↔ IsGeodesicCurveOn I γ s ∧ (0 : ℝ) ∈ s ∧
      TotalSpace.mk' E (γ 0) (curveVelocityWithin I γ s 0) = TotalSpace.mk' E p v :=
  ⟨fun h ↦ ⟨h.isGeodesicCurveOn, h.zero_mem, h.initial_eq⟩, fun h ↦ ⟨h.1, h.2.1, h.2.2⟩⟩

omit [I.Boundaryless] in
/-- **The geodesic spray** in the tangent-bundle chart at its argument is
`(x, v) ↦ (v, -Γ_x(v, v))`. -/
theorem geodesicSpray_apply (z : TangentBundle I M) :
    geodesicSpray I M z =
      (z.2, -christoffelMap (Module.finBasis ℝ E)
        ((leviCivitaConnection I M).isCovariantDerivativeOn
          (s := (trivializationAt E (TangentSpace I) z.proj).baseSet)) z.proj z.2 z.2) :=
  TauCeti.Manifold.geodesicSpray_apply z

omit [I.Boundaryless] in
/-- The spray has the same formula in every overlapping tangent-bundle chart. -/
theorem tangentCoordChange_geodesicSpray {x x₀ : M} (hx₀ : x ∈ (extChartAt I x₀).source)
    (u : TangentSpace I x) :
    tangentCoordChange I.tangent (TotalSpace.mk' E x u) (TotalSpace.mk' E x₀ 0)
        (TotalSpace.mk' E x u) (geodesicSpray I M (TotalSpace.mk' E x u)) =
      let v := tangentCoordChange I x x₀ x u
      (v, -christoffelMap (Module.finBasis ℝ E)
        ((leviCivitaConnection I M).isCovariantDerivativeOn
          (s := (trivializationAt E (TangentSpace I) x₀).baseSet)) x v v) :=
  TauCeti.Manifold.tangentCoordChange_geodesicSpray hx₀ u

omit [I.Boundaryless] in
/-- The spray is a `C^∞` vector field on `TM`. -/
theorem contMDiff_geodesicSpray :
    ContMDiff I.tangent I.tangent.tangent ∞ (fun z : TangentBundle I M ↦
      (⟨z, geodesicSpray I M z⟩ : TangentBundle I.tangent (TangentBundle I M))) :=
  contMDiff_infty_geodesicSpray

omit [I.Boundaryless] in
/-- **Geodesics are the base curves of the spray**: the velocity lift of a `C²` curve is an
integral curve of the spray on `s` exactly when the curve is a geodesic on `s`. -/
theorem isMIntegralCurveOn_curveVelocityLiftWithin_iff {γ : ℝ → M} {s : Set ℝ}
    (hs : UniqueDiffOn ℝ s) (hγ : ContMDiffOn 𝓘(ℝ, ℝ) I 2 γ s) :
    IsMIntegralCurveOn (curveVelocityLiftWithin I γ s) (geodesicSpray I M) s ↔
      IsGeodesicCurveOn I γ s :=
  TauCeti.Manifold.isMIntegralCurveOn_curveVelocityLiftWithin_iff hs hγ

omit [I.Boundaryless] in
/-- Conversely, every integral curve of the spray is the velocity lift of its base curve. -/
theorem eq_curveVelocityLiftWithin_of_isMIntegralCurveOn {z : ℝ → TangentBundle I M} {s : Set ℝ}
    {t : ℝ} (hs : UniqueDiffWithinAt ℝ s t) (h : IsMIntegralCurveOn z (geodesicSpray I M) s)
    (ht : t ∈ s) :
    z t = curveVelocityLiftWithin I (fun r ↦ (z r).proj) s t :=
  TauCeti.Manifold.eq_curveVelocityLiftWithin_of_isMIntegralCurveOn hs h ht

/-- On an open time set, the base curve of an integral curve of the spray is the geodesic with
the initial data encoded by its value at `0`. -/
theorem isGeodesicCurveOnFrom_proj {z : ℝ → TangentBundle I M} {s : Set ℝ}
    {w : TangentBundle I M} (hz : IsMIntegralCurveOn z (geodesicSpray I M) s) (hs : IsOpen s)
    (h0s : (0 : ℝ) ∈ s) (h0 : z 0 = w) :
    IsGeodesicCurveOnFrom I (fun t ↦ (z t).proj) s w.proj w.2 :=
  IsMIntegralCurveOn.isGeodesicCurveOnFrom_proj hz hs h0s h0

/-- **Local existence** of the geodesic from `(p, v)` on an open interval around `0`. -/
theorem exists_geodesicCurveOnFrom_Ioo (p : M) (v : TangentSpace I p) :
    ∃ a b : ℝ, a < b ∧ 0 ∈ Ioo a b ∧ ∃ γ : ℝ → M, IsGeodesicCurveOnFrom I γ (Ioo a b) p v :=
  TauCeti.Manifold.exists_geodesicCurveOnFrom_Ioo p v

/-- **Uniqueness** on the overlap of two intervals of existence. -/
theorem IsGeodesicCurveOnFrom.eqOn_of_inter [T2Space M] {p : M} {v : TangentSpace I p}
    {γ γ' : ℝ → M} {a b a' b' : ℝ} (hγ : IsGeodesicCurveOnFrom I γ (Ioo a b) p v)
    (hγ' : IsGeodesicCurveOnFrom I γ' (Ioo a' b') p v) :
    EqOn γ γ' (Ioo (max a a') (min b b')) :=
  TauCeti.Manifold.IsGeodesicCurveOnFrom.eqOn_of_inter hγ hγ'

/-- **The smooth local geodesic flow** on `TM`, smooth jointly in initial state and time. -/
theorem exists_contMDiffAt_localGeodesicFlow (z : TangentBundle I M) :
    ∃ U ∈ 𝓝 z, ∃ s ∈ 𝓝 (0 : ℝ), IsOpen s ∧
      ∃ Φ : TangentBundle I M → ℝ → TangentBundle I M,
        ContMDiffAt (I.tangent.prod 𝓘(ℝ, ℝ)) I.tangent ∞
          (fun q : TangentBundle I M × ℝ ↦ Φ q.1 q.2) (z, 0) ∧
          ∀ w ∈ U, Φ w 0 = w ∧ IsMIntegralCurveOn (Φ w) (geodesicSpray I M) s ∧
            (∀ t ∈ s, ∀ u, Φ w (t + u) = Φ (Φ w t) u) ∧
            IsGeodesicCurveOnFrom I (fun t ↦ (Φ w t).proj) s w.proj w.2 :=
  TauCeti.Manifold.exists_contMDiffAt_localGeodesicFlow z

omit [I.Boundaryless] in
/-- **Constant speed** on a preconnected parameter set. -/
theorem IsGeodesicCurveOn.norm_curveVelocityWithin_eq {γ : ℝ → M} {s : Set ℝ}
    (h : IsGeodesicCurveOn I γ s) (hconn : IsPreconnected s) {a b : ℝ} (ha : a ∈ s) (hb : b ∈ s) :
    ‖curveVelocityWithin I γ s a‖ = ‖curveVelocityWithin I γ s b‖ :=
  h.norm_curveVelocityWithin_eq hconn ha hb

omit [I.Boundaryless] in
/-- Constant speed on each connected component of an arbitrary parameter set. -/
theorem IsGeodesicCurveOn.norm_curveVelocityWithin_eq_of_mem_connectedComponentIn {γ : ℝ → M}
    {s : Set ℝ} (h : IsGeodesicCurveOn I γ s) {a b : ℝ} (hb : b ∈ connectedComponentIn s a) :
    ‖curveVelocityWithin I γ s a‖ = ‖curveVelocityWithin I γ s b‖ :=
  h.norm_curveVelocityWithin_eq_of_mem_connectedComponentIn hb

omit [I.Boundaryless] in
/-- **The maximal interval** `J(p, v)` is the union of the open intervals around `0` carrying a
geodesic with initial data `(p, v)`. -/
theorem mem_geodesicInterval_iff {p : M} {v : TangentSpace I p} {t : ℝ} :
    t ∈ geodesicInterval I M p v ↔
      ∃ γ a b, IsGeodesicCurveOnFrom I γ (Ioo a b) p v ∧ t ∈ Ioo a b :=
  TauCeti.Manifold.mem_geodesicInterval_iff

/-- The maximal interval is an open interval containing `0`. -/
theorem isOpen_geodesicInterval {p : M} {v : TangentSpace I p} :
    IsOpen (geodesicInterval I M p v) ∧ IsPreconnected (geodesicInterval I M p v) ∧
      (0 : ℝ) ∈ geodesicInterval I M p v :=
  ⟨TauCeti.Manifold.isOpen_geodesicInterval, TauCeti.Manifold.isPreconnected_geodesicInterval,
    TauCeti.Manifold.zero_mem_geodesicInterval⟩

/-- The maximal geodesic `γ_{p,v}` is a geodesic with initial data `(p, v)` on `J(p, v)`. -/
theorem isGeodesicCurveOnFrom_maximalGeodesic [T2Space M] (p : M) (v : TangentSpace I p) :
    IsGeodesicCurveOnFrom I (maximalGeodesic I M p v) (geodesicInterval I M p v) p v :=
  TauCeti.Manifold.isGeodesicCurveOnFrom_maximalGeodesic p v

/-- Every open-interval geodesic with initial data `(p, v)` is a restriction of `γ_{p,v}`. -/
theorem IsGeodesicCurveOnFrom.eqOn_maximalGeodesic [T2Space M] {p : M} {v : TangentSpace I p}
    {γ : ℝ → M} {a b : ℝ} (hγ : IsGeodesicCurveOnFrom I γ (Ioo a b) p v) :
    EqOn (maximalGeodesic I M p v) γ (Ioo a b) :=
  hγ.eqOn_maximalGeodesic

/-- Constant speed along the maximal geodesic: its speed is `‖v‖` on all of `J(p, v)`. -/
theorem norm_curveVelocityWithin_maximalGeodesic [T2Space M] {p : M} {v : TangentSpace I p}
    {t : ℝ} (ht : t ∈ geodesicInterval I M p v) :
    ‖curveVelocityWithin I (maximalGeodesic I M p v) (geodesicInterval I M p v) t‖ = ‖v‖ := by
  have h := TauCeti.Manifold.isGeodesicCurveOnFrom_maximalGeodesic (I := I) (M := M) p v
  rw [h.isGeodesicCurveOn.norm_curveVelocityWithin_eq isPreconnected_geodesicInterval ht
    zero_mem_geodesicInterval]
  exact congrArg (fun z : TangentBundle I M ↦ ‖z.2‖) h.initial_eq

/-- **Homogeneity**: `γ_{p,λv}(t) = γ_{p,v}(λt)` whenever `t ∈ J(p, λv)`, ... -/
theorem maximalGeodesic_smul [T2Space M] {p : M} {v : TangentSpace I p} {a t : ℝ}
    (ht : t ∈ geodesicInterval I M p (a • v)) :
    maximalGeodesic I M p (a • v) t = maximalGeodesic I M p v (a * t) :=
  TauCeti.Manifold.maximalGeodesic_smul ht

omit [I.Boundaryless] in
/-- ... and, for `λ ≠ 0`, `t ∈ J(p, λv) ↔ λt ∈ J(p, v)`. -/
theorem mem_geodesicInterval_smul_iff {p : M} {v : TangentSpace I p} {a t : ℝ} (ha : a ≠ 0) :
    t ∈ geodesicInterval I M p (a • v) ↔ a * t ∈ geodesicInterval I M p v :=
  TauCeti.Manifold.mem_geodesicInterval_smul_iff ha

/-- **The smooth maximal geodesic flow**: `(z, t) ↦ γ_{z}(t)` is `C^∞` on its domain in `TM × ℝ`,
which is open. -/
theorem contMDiffOn_maximalGeodesic [T2Space M] :
    IsOpen {q : TangentBundle I M × ℝ | q.2 ∈ geodesicInterval I M q.1.proj q.1.2} ∧
      ContMDiffOn (I.tangent.prod 𝓘(ℝ, ℝ)) I ∞
        (fun q : TangentBundle I M × ℝ ↦ maximalGeodesic I M q.1.proj q.1.2 q.2)
        {q | q.2 ∈ geodesicInterval I M q.1.proj q.1.2} :=
  ⟨isOpen_setOfPred_mem_geodesicInterval, TauCeti.Manifold.contMDiffOn_maximalGeodesic⟩

omit [I.Boundaryless] in
/-- **The exponential map**: `expDomain p = {v | 1 ∈ J(p, v)}` and `exp_p v = γ_{p,v}(1)`. -/
theorem mem_expDomain_iff {p : M} {v : TangentSpace I p} :
    v ∈ expDomain I M p ↔ (1 : ℝ) ∈ geodesicInterval I M p v :=
  TauCeti.Manifold.mem_expDomain_iff

omit [I.Boundaryless] in
/-- `exp_p v = γ_{p,v}(1)`. -/
theorem riemannianExp_def (p : M) (v : TangentSpace I p) :
    riemannianExp I M p v = maximalGeodesic I M p v 1 :=
  TauCeti.Manifold.riemannianExp_def p v

/-- `0 ∈ expDomain p` and `exp_p 0 = p`. -/
theorem zero_mem_expDomain [T2Space M] (p : M) :
    (0 : TangentSpace I p) ∈ expDomain I M p ∧ riemannianExp I M p 0 = p :=
  ⟨TauCeti.Manifold.zero_mem_expDomain p, riemannianExp_zero p⟩

/-- `expDomain p` is open. -/
theorem isOpen_expDomain [T2Space M] (p : M) : IsOpen (expDomain I M p) :=
  TauCeti.Manifold.isOpen_expDomain p

/-- Evaluation of the smooth flow at time `1` is `C^∞` on the open subset of `TM` where it is
defined; its base projection is `exp`. -/
theorem contMDiffOn_riemannianExp_tangentBundle [T2Space M] :
    IsOpen {z : TangentBundle I M | z.2 ∈ expDomain I M z.proj} ∧
      ContMDiffOn I.tangent I ∞ (fun z : TangentBundle I M ↦ riemannianExp I M z.proj z.2)
        {z : TangentBundle I M | z.2 ∈ expDomain I M z.proj} :=
  ⟨isOpen_setOfPred_mem_expDomain, TauCeti.Manifold.contMDiffOn_riemannianExp_tangentBundle⟩

/-- `exp_p` is `C^∞` on `expDomain p`, as a map from the vector space `T_p M` to `M`. -/
theorem contMDiffOn_riemannianExp [T2Space M] (p : M) :
    ContMDiffOn 𝓘(ℝ, TangentSpace I p) I ∞ (riemannianExp I M p) (expDomain I M p) :=
  TauCeti.Manifold.contMDiffOn_riemannianExp p

theorem continuousOn_riemannianExp [T2Space M] (p : M) :
    ContinuousOn (riemannianExp I M p) (expDomain I M p) :=
  TauCeti.Manifold.continuousOn_riemannianExp p

theorem contMDiffAt_riemannianExp [T2Space M] {p : M} {v : TangentSpace I p}
    (hv : v ∈ expDomain I M p) : ContMDiffAt 𝓘(ℝ, TangentSpace I p) I ∞ (riemannianExp I M p) v :=
  TauCeti.Manifold.contMDiffAt_riemannianExp hv

theorem continuousAt_riemannianExp [T2Space M] {p : M} {v : TangentSpace I p}
    (hv : v ∈ expDomain I M p) : ContinuousAt (riemannianExp I M p) v :=
  TauCeti.Manifold.continuousAt_riemannianExp hv

/-- **Homogeneity of `exp`**: `t ∈ J(p, v) ↔ t • v ∈ expDomain p`, ... -/
theorem mem_geodesicInterval_iff_smul_mem_expDomain {p : M} {v : TangentSpace I p} {t : ℝ} :
    t ∈ geodesicInterval I M p v ↔ t • v ∈ expDomain I M p :=
  TauCeti.Manifold.mem_geodesicInterval_iff_smul_mem_expDomain

/-- ... and `exp_p (t • v) = γ_{p,v}(t)`. -/
theorem riemannianExp_smul [T2Space M] (p : M) (v : TangentSpace I p) (t : ℝ) :
    riemannianExp I M p (t • v) = maximalGeodesic I M p v t :=
  TauCeti.Manifold.riemannianExp_smul p v t

/-- `expDomain p` is star-shaped at `0`. -/
theorem starConvex_expDomain (p : M) : StarConvex ℝ (0 : TangentSpace I p) (expDomain I M p) :=
  TauCeti.Manifold.starConvex_expDomain p

/-- **The derivative at zero** is the identity under the canonical identification
`NormedSpace.fromTangentSpace` of `T_0(T_p M)` with `T_p M`. -/
theorem mfderiv_riemannianExp_zero [T2Space M] (p : M) :
    mfderiv 𝓘(ℝ, TangentSpace I p) I (riemannianExp I M p) 0 =
      (NormedSpace.fromTangentSpace (0 : TangentSpace I p)).toContinuousLinearMap :=
  TauCeti.Manifold.mfderiv_riemannianExp_zero p

/-- The corresponding strict derivative, in extended coordinates. -/
theorem hasStrictFDerivAt_riemannianExp_zero [T2Space M] (p : M) :
    HasStrictFDerivAt (writtenInExtChartAt 𝓘(ℝ, TangentSpace I p) I 0 (riemannianExp I M p))
      (tangentSpaceCastModel I p).toContinuousLinearMap 0 :=
  TauCeti.Manifold.hasStrictFDerivAt_riemannianExp_zero p

/-- `exp_p` is a local diffeomorphism at `0`. -/
theorem isLocalDiffeomorphAt_riemannianExp_zero [T2Space M] (p : M) :
    IsLocalDiffeomorphAt 𝓘(ℝ, TangentSpace I p) I ∞ (riemannianExp I M p) 0 :=
  TauCeti.Manifold.isLocalDiffeomorphAt_riemannianExp_zero p

omit [I.Boundaryless] in
/-- **Pointwise geodesic completeness** `(d_p)`: every maximal geodesic from `p` is defined for
all time. -/
theorem isGeodesicallyCompleteAt_iff {p : M} :
    IsGeodesicallyCompleteAt I M p ↔ ∀ v : TangentSpace I p, geodesicInterval I M p v = univ :=
  Iff.rfl

omit [I.Boundaryless] in
/-- **`(a_p) ↔ (d_p)`.** -/
theorem expDomain_eq_univ_iff {p : M} :
    expDomain I M p = univ ↔ IsGeodesicallyCompleteAt I M p :=
  TauCeti.Manifold.expDomain_eq_univ_iff

end Layer1

section Layer1IntegralCurves

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {v : (x : M) → TangentSpace I x} {γ : ℝ → M} {a b : ℝ} {y : M}

/-- **The finite-endpoint extension criterion** at the right endpoint: if `γ (u n) → y` along a
sequence `u n → b` from below, an integral curve of a `C¹` field on `(a, b)` extends past `b`. -/
theorem exists_gt_isMIntegralCurveOn_Ioo_of_tendsto [CompleteSpace E] [I.Boundaryless]
    [IsManifold I 1 M] [T2Space M]
    (hγ : IsMIntegralCurveOn γ v (Ioo a b)) (hab : a < b)
    (hv : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, v x⟩ : TangentBundle I M)))
    {u : ℕ → ℝ} (hu : ∀ᶠ n in atTop, u n < b) (hub : Tendsto u atTop (𝓝 b))
    (hy : Tendsto (γ ∘ u) atTop (𝓝 y)) :
    ∃ c > b, ∃ δ : ℝ → M, IsMIntegralCurveOn δ v (Ioo a c) ∧ EqOn δ γ (Ioo a b) :=
  IsMIntegralCurveOn.exists_gt_isMIntegralCurveOn_Ioo_of_tendsto hγ hab hv hu hub hy

/-- The finite-endpoint extension criterion at the left endpoint. -/
theorem exists_lt_isMIntegralCurveOn_Ioo_of_tendsto [CompleteSpace E] [I.Boundaryless]
    [IsManifold I 1 M] [T2Space M]
    (hγ : IsMIntegralCurveOn γ v (Ioo a b)) (hab : a < b)
    (hv : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, v x⟩ : TangentBundle I M)))
    {u : ℕ → ℝ} (hu : ∀ᶠ n in atTop, a < u n) (hub : Tendsto u atTop (𝓝 a))
    (hy : Tendsto (γ ∘ u) atTop (𝓝 y)) :
    ∃ c < a, ∃ δ : ℝ → M, IsMIntegralCurveOn δ v (Ioo c b) ∧ EqOn δ γ (Ioo a b) :=
  IsMIntegralCurveOn.exists_lt_isMIntegralCurveOn_Ioo_of_tendsto hγ hab hv hu hub hy

end Layer1IntegralCurves

section Layer1InverseFunction

variable {𝕂 : Type*} [RCLike 𝕂]
  {E : Type*} [NormedAddCommGroup E] [NormedSpace 𝕂 E] [CompleteSpace E]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace 𝕂 F]
  {H : Type*} [TopologicalSpace H] {G : Type*} [TopologicalSpace G]
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {N : Type*} [TopologicalSpace N] [ChartedSpace G N]
  {I : ModelWithCorners 𝕂 E H} {J : ModelWithCorners 𝕂 F G} {n : WithTop ℕ∞}
  [IsManifold I n M] [IsManifold J n N]

/-- **The manifold inverse-function theorem**: a `C^n` map, `1 ≤ n`, whose `mfderiv` at an
interior point is a continuous linear equivalence is a `C^n` local diffeomorphism there. -/
theorem isLocalDiffeomorphAt_of_mfderiv_eq {f : M → N} {s : Set M} {x : M}
    (hf : ContMDiffOn I J n f s) (hs : IsOpen s) (hx : x ∈ s) (hIx : I.IsInteriorPoint x)
    (hn : 1 ≤ n) {e : TangentSpace I x ≃L[𝕂] TangentSpace J (f x)}
    (he : (e : TangentSpace I x →L[𝕂] TangentSpace J (f x)) = mfderiv I J f x) :
    IsLocalDiffeomorphAt I J n f x :=
  TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq hf hs hx hIx hn he

end Layer1InverseFunction

/-! ## Layer 2: normal neighbourhoods, the Gauss lemma, and minimizing geodesics -/

section Layer2Normal

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [T2Space M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  {p : M} {U : Set (TangentSpace I p)}

omit [I.Boundaryless] [T2Space M] in
/-- **Normal domains**: an open star-shaped neighbourhood of `0` in `T_p M`, inside `expDomain p`,
on which `exp_p` is injective and a local diffeomorphism, hence a diffeomorphism onto its image,
the normal neighbourhood `exp_p '' U`. -/
theorem isNormalDomain_iff :
    IsNormalDomain I M p U ↔ IsOpen U ∧ (0 : TangentSpace I p) ∈ U ∧
      StarConvex ℝ (0 : TangentSpace I p) U ∧ U ⊆ expDomain I M p ∧
      InjOn (riemannianExp I M p) U ∧
      IsLocalDiffeomorphOn 𝓘(ℝ, TangentSpace I p) I ∞ (riemannianExp I M p) U :=
  ⟨fun h ↦ ⟨h.isOpen, h.zero_mem, h.starConvex, h.subset_expDomain, h.injOn,
    h.isLocalDiffeomorphOn⟩, fun ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩ ↦ ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩⟩

/-- **Normal balls exist.** -/
theorem exists_isNormalDomain_ball (p : M) :
    ∃ r : ℝ, 0 < r ∧ IsNormalDomain I M p (Metric.ball 0 r) :=
  TauCeti.Manifold.exists_isNormalDomain_ball p

omit [I.Boundaryless] [T2Space M] in
/-- On a normal domain, `exp_p` is a diffeomorphism from `U` onto the normal neighbourhood
`exp_p '' U`, with inverse the logarithm `log_p`. -/
theorem IsNormalDomain.toPartialDiffeomorph_spec (h : IsNormalDomain I M p U) :
    h.toPartialDiffeomorph.source = U ∧
      h.toPartialDiffeomorph.target = riemannianExp I M p '' U ∧
      ⇑h.toPartialDiffeomorph = riemannianExp I M p ∧
      ∀ q, h.toPartialDiffeomorph.symm q = riemannianLog I M p U q :=
  ⟨h.toPartialDiffeomorph_source, h.toPartialDiffeomorph_target, h.coe_toPartialDiffeomorph,
    h.toPartialDiffeomorph_symm_apply⟩

omit [I.Boundaryless] [T2Space M] in
/-- **The local logarithm** inverts `exp_p` on a normal domain, ... -/
theorem IsNormalDomain.riemannianLog_riemannianExp (h : IsNormalDomain I M p U)
    {v : TangentSpace I p} (hv : v ∈ U) : riemannianLog I M p U (riemannianExp I M p v) = v :=
  h.riemannianLog_riemannianExp hv

omit [I.Boundaryless] [T2Space M] in
/-- ... is inverted by `exp_p` on the normal neighbourhood, ... -/
theorem IsNormalDomain.riemannianExp_riemannianLog (h : IsNormalDomain I M p U) {q : M}
    (hq : q ∈ riemannianExp I M p '' U) : riemannianExp I M p (riemannianLog I M p U q) = q :=
  h.riemannianExp_riemannianLog hq

omit [I.Boundaryless] [T2Space M] in
/-- ... is smooth on the normal neighbourhood, ... -/
theorem IsNormalDomain.contMDiffOn_riemannianLog (h : IsNormalDomain I M p U) :
    ContMDiffOn I 𝓘(ℝ, TangentSpace I p) ∞ (riemannianLog I M p U) (riemannianExp I M p '' U) :=
  h.contMDiffOn_riemannianLog

/-- ... and vanishes at the base point. -/
theorem IsNormalDomain.riemannianLog_self (h : IsNormalDomain I M p U) :
    riemannianLog I M p U p = 0 :=
  h.riemannianLog_self

/-- **The Gauss lemma**: `⟪d(exp_p)_v v, d(exp_p)_v w⟫ = ⟪v, w⟫` on the whole domain of `exp_p`. -/
theorem inner_mfderiv_riemannianExp_radial {v w : TangentSpace I p} (hv : v ∈ expDomain I M p) :
    inner ℝ (mfderiv 𝓘(ℝ, TangentSpace I p) I (riemannianExp I M p) v v)
        (mfderiv 𝓘(ℝ, TangentSpace I p) I (riemannianExp I M p) v w) =
      inner ℝ v w :=
  TauCeti.Manifold.inner_mfderiv_riemannianExp_radial hv

/-- **The polar length inequality**: the image under `exp_p` of a `C¹` curve `w` in the domain is
at least as long as the change `|‖w b‖ - ‖w a‖|` of its radius. -/
theorem ofReal_abs_norm_sub_norm_le_pathELength_riemannianExp {w : ℝ → TangentSpace I p}
    {a b : ℝ} (hab : a ≤ b) (hw : ContDiffOn ℝ 1 w (Icc a b))
    (hdom : MapsTo w (Icc a b) (expDomain I M p)) :
    ENNReal.ofReal |‖w b‖ - ‖w a‖| ≤ pathELength I (riemannianExp I M p ∘ w) a b :=
  TauCeti.Manifold.ofReal_abs_norm_sub_norm_le_pathELength_riemannianExp hab hw hdom

/-- On a normal ball: a piecewise-`C¹` curve from `p` inside the normal neighbourhood has
travelled at least `‖log_p (γ t)‖` by time `t`. -/
theorem IsNormalDomain.ofReal_norm_riemannianLog_le_pathELength_of_piecewise
    (h : IsNormalDomain I M p U) {γ : ℝ → M} {a b : ℝ} (hγ : IsPiecewiseContMDiffOn I 1 γ a b)
    (hγU : MapsTo γ (Icc a b) (riemannianExp I M p '' U)) (hγa : γ a = p) {t : ℝ}
    (ht : t ∈ Icc a b) :
    ENNReal.ofReal ‖riemannianLog I M p U (γ t)‖ ≤ pathELength I γ a t :=
  h.ofReal_norm_riemannianLog_le_pathELength_of_piecewise hγ hγU hγa ht

end Layer2Normal

section Layer2Metric

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [EMetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  {p : M} {U : Set (TangentSpace I p)}

/-- **Ball-internal radial minimization**: the radial segment to `exp_p v` is no longer than any
piecewise-`C¹` competitor from `p` to `exp_p v` staying in the normal neighbourhood. -/
theorem IsNormalDomain.pathELength_riemannianExp_smul_le_of_piecewise
    (h : IsNormalDomain I M p U) {v : TangentSpace I p} (hv : v ∈ U) {γ : ℝ → M} {a b : ℝ}
    (hγ : IsPiecewiseContMDiffOn I 1 γ a b)
    (hγU : MapsTo γ (Icc a b) (riemannianExp I M p '' U))
    (hγa : γ a = p) (hγb : γ b = riemannianExp I M p v) :
    pathELength I (fun t : ℝ ↦ riemannianExp I M p (t • v)) 0 1 ≤ pathELength I γ a b :=
  h.pathELength_riemannianExp_smul_le_of_piecewise hv hγ hγU hγa hγb

/-- **The equality case, constant-speed form**: a piecewise-`C¹` competitor inside the normal
neighbourhood with the length of the radial segment, parametrized proportionally to arc length,
is the affinely parametrized radial geodesic. -/
theorem IsNormalDomain.eqOn_riemannianExp_smul_of_pathELength_eq_of_piecewise
    (h : IsNormalDomain I M p U) {v : TangentSpace I p} (hv : v ∈ U) {γ : ℝ → M} {a b : ℝ}
    (hγ : IsPiecewiseContMDiffOn I 1 γ a b)
    (hγU : MapsTo γ (Icc a b) (riemannianExp I M p '' U)) (hγa : γ a = p)
    (hγb : γ b = riemannianExp I M p v)
    (hlen : pathELength I γ a b = pathELength I (fun t : ℝ ↦ riemannianExp I M p (t • v)) 0 1)
    (hspeed : ∀ t ∈ Icc a b,
      pathELength I γ a t = ENNReal.ofReal ((t - a) / (b - a)) * pathELength I γ a b) :
    EqOn γ (fun t : ℝ ↦ riemannianExp I M p (((t - a) / (b - a)) • v)) (Icc a b) :=
  h.eqOn_riemannianExp_smul_of_pathELength_eq_of_piecewise hv hγ hγU hγa hγb hlen hspeed

/-- **Uniqueness of arbitrary minimizers**: a piecewise-`C¹` competitor inside the normal
neighbourhood with the length of the radial segment is the radial geodesic composed with a
continuous nondecreasing surjection of `[a, b]` onto `[0, 1]`. -/
theorem IsNormalDomain.exists_monotoneOn_eq_riemannianExp_smul_of_pathELength_eq_of_piecewise
    (h : IsNormalDomain I M p U) {v : TangentSpace I p} (hv : v ∈ U) {γ : ℝ → M} {a b : ℝ}
    (hγ : IsPiecewiseContMDiffOn I 1 γ a b)
    (hγU : MapsTo γ (Icc a b) (riemannianExp I M p '' U)) (hγa : γ a = p)
    (hγb : γ b = riemannianExp I M p v)
    (hlen : pathELength I γ a b = pathELength I (fun t : ℝ ↦ riemannianExp I M p (t • v)) 0 1) :
    ∃ φ : ℝ → ℝ, MonotoneOn φ (Icc a b) ∧ ContinuousOn φ (Icc a b) ∧
      SurjOn φ (Icc a b) (Icc 0 1) ∧ φ a = 0 ∧ φ b = 1 ∧
      ∀ t ∈ Icc a b, γ t = riemannianExp I M p (φ t • v) :=
  h.exists_monotoneOn_eq_riemannianExp_smul_of_pathELength_eq_of_piecewise hv hγ hγU hγa hγb hlen

/-- **The escape estimate**: a `C¹` competitor from `p` which leaves the larger normal
neighbourhood is strictly longer than the radial segment to a point of the smaller normal ball. -/
theorem IsNormalDomain.pathELength_riemannianExp_smul_lt_of_not_mapsTo
    (h : IsNormalDomain I M p U) {r : ℝ} {v : TangentSpace I p}
    (hclosed : Metric.closedBall 0 r ⊆ U) (hv : v ∈ Metric.ball 0 r) {γ : ℝ → M}
    (hγ : ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ (Icc 0 1)) (hγ0 : γ 0 = p)
    (hleave : ¬ MapsTo γ (Icc 0 1) (riemannianExp I M p '' U)) :
    pathELength I (fun t : ℝ ↦ riemannianExp I M p (t • v)) 0 1 < pathELength I γ 0 1 :=
  h.pathELength_riemannianExp_smul_lt_of_not_mapsTo hclosed hv hγ hγ0 hleave

/-- **The local distance identity**: a radial segment in the smaller ball realizes the distance,
`pathELength I γ 0 1 = edist p (γ 1)`. -/
theorem IsNormalDomain.pathELength_riemannianExp_smul_eq_edist [IsRiemannianManifold I M]
    (h : IsNormalDomain I M p U) {r : ℝ} {v : TangentSpace I p} (hU : Metric.ball 0 r ⊆ U)
    (hv : v ∈ Metric.ball 0 r) :
    pathELength I (fun t : ℝ ↦ riemannianExp I M p (t • v)) 0 1 =
      edist p (riemannianExp I M p v) :=
  h.pathELength_riemannianExp_smul_eq_edist_of_mem_ball hU hv

end Layer2Metric

section Layer2FirstVariation

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
/-- **The energy functional** `E(γ) = ½ ∫_a^b ‖γ'‖²`. -/
theorem energy_def (γ : ℝ → M) (a b : ℝ) :
    energy I γ a b = (∫ t in a..b, ‖curveVelocity I γ t‖ ^ 2) / 2 :=
  TauCeti.Manifold.energy_def γ a b

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
/-- **Variation fields**: `V(t) = ∂F/∂s (0, t)`. -/
theorem variationField_eq (F : ℝ → ℝ → M) (t : ℝ) :
    variationField I F t = curveVelocity I (fun s ↦ F s t) 0 :=
  TauCeti.Manifold.variationField_apply F t

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
/-- **Smooth variations with fixed endpoints**: `C^n` near `{0} × [a, b]`, with the endpoints
fixed for `s` near `0`. -/
theorem isFixedEndpointVariation_iff {n : WithTop ℕ∞} {F : ℝ → ℝ → M} {a b : ℝ} :
    IsFixedEndpointVariation I n F a b ↔
      (∀ t ∈ uIcc a b, ContMDiffAt 𝓘(ℝ, ℝ × ℝ) I n (fun z : ℝ × ℝ ↦ F z.1 z.2) (0, t)) ∧
      (∀ᶠ s in 𝓝 0, F s a = F 0 a) ∧ (∀ᶠ s in 𝓝 0, F s b = F 0 b) :=
  ⟨fun h ↦ ⟨h.contMDiffAt, h.eventually_apply_left, h.eventually_apply_right⟩,
    fun h ↦ ⟨h.1, h.2.1, h.2.2⟩⟩

/-- **Covariant differentiation in the variation direction**: the transverse derivative of the
squared speed is `2 ⟪D_t V, γ'⟫`. -/
theorem hasDerivAt_norm_sq_curveVelocity {F : ℝ → ℝ → M} {t : ℝ}
    (hf : ContMDiffAt 𝓘(ℝ, ℝ × ℝ) I 2 (fun z : ℝ × ℝ ↦ F z.1 z.2) (0, t)) :
    HasDerivAt (fun s ↦ ‖curveVelocity I (F s) t‖ ^ 2)
      (2 * inner ℝ (alongCurve (leviCivitaConnection I M) (F 0) (variationField I F) t)
        (curveVelocity I (F 0) t)) 0 :=
  TauCeti.Manifold.hasDerivAt_norm_sq_curveVelocity hf

omit [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
/-- **The symmetry lemma** `D_s ∂_t F = D_t ∂_s F`, for a torsion-free connection. -/
theorem alongCurve_curveVelocity_comm
    (cov : CovariantDerivative I E (fun y : M ↦ TangentSpace I y)) (hcov : cov.IsTorsionFree)
    {f : ℝ → ℝ → M} {u v : ℝ}
    (hf : ContMDiffAt 𝓘(ℝ, ℝ × ℝ) I 2 (fun z : ℝ × ℝ ↦ f z.1 z.2) (u, v)) :
    alongCurve cov (f u) (fun r ↦ curveVelocity I (fun q ↦ f q r) u) v =
      alongCurve cov (fun q ↦ f q v) (fun q ↦ curveVelocity I (f q) v) u := by
  have : IsManifold I (minSmoothness ℝ 2) M := by
    rw [minSmoothness_of_isRCLikeNormedField]; infer_instance
  exact CovariantDerivative.alongCurve_curveVelocity_comm cov hcov
    (by rwa [minSmoothness_of_isRCLikeNormedField])

/-- **The integration-by-parts step**: `d/dt ⟪V, γ'⟫ = ⟪D_t V, γ'⟫ + ⟪V, D_t γ'⟫`. -/
theorem hasDerivAt_inner_variationField_curveVelocity {F : ℝ → ℝ → M} {t : ℝ}
    (hf : ContMDiffAt 𝓘(ℝ, ℝ × ℝ) I 2 (fun z : ℝ × ℝ ↦ F z.1 z.2) (0, t)) :
    HasDerivAt (fun r ↦ inner ℝ (variationField I F r) (curveVelocity I (F 0) r))
      (inner ℝ (alongCurve (leviCivitaConnection I M) (F 0) (variationField I F) t)
          (curveVelocity I (F 0) t) +
        inner ℝ (variationField I F t) (acceleration (leviCivitaConnection I M) (F 0) t)) t :=
  TauCeti.Manifold.hasDerivAt_inner_variationField_curveVelocity hf

/-- **The first variation formula** for a fixed-endpoint variation:
`d/ds E(F s) |_{s=0} = -∫_a^b ⟪V, D_t γ'⟫`. -/
theorem IsFixedEndpointVariation.hasDerivAt_energy {F : ℝ → ℝ → M} {a b : ℝ}
    (hF : IsFixedEndpointVariation I 2 F a b) :
    HasDerivAt (fun s ↦ energy I (F s) a b)
      (-∫ t in a..b, inner ℝ (variationField I F t)
        (acceleration (leviCivitaConnection I M) (F 0) t)) 0 :=
  hF.hasDerivAt_energy

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
/-- **Criticality**: the energy has vanishing derivative along every `C^n` fixed-endpoint
variation. -/
theorem isEnergyCritical_iff {n : WithTop ℕ∞} {γ : ℝ → M} {a b : ℝ} :
    IsEnergyCritical I n γ a b ↔
      (∀ t ∈ uIcc a b, ContMDiffAt 𝓘(ℝ, ℝ) I n γ t) ∧
      ∀ F : ℝ → ℝ → M, F 0 = γ → IsFixedEndpointVariation I n F a b →
        HasDerivAt (fun s ↦ energy I (F s) a b) 0 0 :=
  ⟨fun h ↦ ⟨h.contMDiffAt, fun _ hF hv ↦ h.hasDerivAt hF hv⟩,
    fun h ↦ ⟨h.1, fun hF hv ↦ h.2 _ hF hv⟩⟩

/-- **Critical points of energy are exactly the geodesics**, here for smooth curves and smooth
variations. -/
theorem isEnergyCritical_iff_isGeodesicCurveOn [I.Boundaryless] {γ : ℝ → M} {a b : ℝ}
    (hγ : ∀ t ∈ uIcc a b, ContMDiffAt 𝓘(ℝ, ℝ) I ∞ γ t) :
    IsEnergyCritical I ∞ γ a b ↔ IsGeodesicCurveOn I γ (uIoo a b) :=
  TauCeti.Manifold.isEnergyCritical_iff_isGeodesicCurveOn (by simp) hγ

end Layer2FirstVariation

/-! ## Layer 3: the Hopf-Rinow equivalence -/

section Layer3

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [IsRiemannianManifold I M]

/-- **The Hopf-Rinow theorem** (do Carmo, Ch. 7, Thm. 2.8): for a base point `p`, the following
are equivalent: `(a_p)` `exp_p` is defined on all of `T_p M`; (b) `M` is proper; (c) `M` is
complete; (d) `M` is geodesically complete; `(e_p)` `M` has a compact exhaustion along which the
distance from `p` diverges. -/
theorem tfae_hopfRinow (p : M) :
    List.TFAE [expDomain I M p = univ, ProperSpace M, CompleteSpace M,
      ∀ q : M, IsGeodesicallyCompleteAt I M q,
      ∃ K : ℕ → Set M, (∀ n, IsCompact (K n)) ∧ Monotone K ∧ (⋃ n, K n) = univ ∧
        ∀ q : ℕ → M, (∀ n, q n ∉ K n) → Tendsto (fun n ↦ dist p (q n)) atTop atTop] :=
  tfae_expDomain_eq_univ p

/-- **`(a_p) ⇒ (f_p)`**: every `q` is joined to `p` by a geodesic segment on `[0, 1]` realizing
the distance, each of whose subsegments also realizes the distance between its endpoints. -/
theorem exists_isGeodesicCurveOn_Icc_pathELength_eq_edist {p : M} (ha : expDomain I M p = univ)
    (q : M) :
    ∃ γ : ℝ → M, IsGeodesicCurveOn I γ (Icc 0 1) ∧ γ 0 = p ∧ γ 1 = q ∧
      pathELength I γ 0 1 = edist p q ∧
      ∀ s ∈ Icc (0 : ℝ) 1, ∀ t ∈ Icc (0 : ℝ) 1, s ≤ t →
        pathELength I γ s t = edist (γ s) (γ t) :=
  TauCeti.Manifold.exists_isGeodesicCurveOn_Icc_pathELength_eq_edist ha q

/-- **(c) ⇒ (d)**: metric completeness makes every maximal geodesic defined for all time. -/
theorem isGeodesicallyCompleteAt_of_completeSpace [CompleteSpace M] (p : M) :
    IsGeodesicallyCompleteAt I M p :=
  TauCeti.Manifold.isGeodesicallyCompleteAt_of_completeSpace p

/-- In `(f_p)` the minimizing geodesic is read off a minimizing initial velocity:
`q = exp_p v` with `‖v‖ = dist p q`. -/
theorem exists_riemannianExp_eq_and_norm_eq_dist {p : M} (ha : expDomain I M p = univ) (q : M) :
    ∃ v : TangentSpace I p, riemannianExp I M p v = q ∧ ‖v‖ = dist p q :=
  TauCeti.Manifold.exists_riemannianExp_eq_and_norm_eq_dist ha q

/-- **`(a_p) ∧ (f_p) ⇒ (b)`, the set equality**: if every point of `closedBall p r` is reached by
a minimizing initial velocity, then `closedBall p r = exp_p '' closedBall 0 r`. No injectivity of
`exp_p` is asserted. -/
theorem closedBall_eq_image_riemannianExp {p : M} {r : ℝ}
    (hmin : ∀ q ∈ Metric.closedBall p r, ∃ v : TangentSpace I p,
      riemannianExp I M p v = q ∧ ‖v‖ ≤ dist p q) :
    Metric.closedBall p r = riemannianExp I M p '' Metric.closedBall 0 r :=
  TauCeti.Manifold.closedBall_eq_image_riemannianExp hmin

/-- **`(a_p) ∧ (f_p) ⇒ (b)`**: properness is routed through the everywhere-defined `exp_p`. -/
theorem properSpace_of_expDomain_eq_univ_of_minimizing {p : M} (ha : expDomain I M p = univ)
    (hmin : ∀ q : M, ∃ v : TangentSpace I p, riemannianExp I M p v = q ∧ ‖v‖ ≤ dist p q) :
    ProperSpace M :=
  properSpace_of_expDomain_eq_univ_of_exists_riemannianExp_eq_and_norm_le_dist ha hmin

omit [FiniteDimensional ℝ E] [I.Boundaryless] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [IsRiemannianManifold I M] in
/-- **(b) ⇔ `(e_p)`**, a statement about proper metric spaces. -/
theorem properSpace_iff_exists_exhaustion (p : M) :
    ProperSpace M ↔ ∃ K : ℕ → Set M, (∀ n, IsCompact (K n)) ∧ Monotone K ∧ (⋃ n, K n) = univ ∧
      ∀ q : ℕ → M, (∀ n, q n ∉ K n) → Tendsto (fun n ↦ dist p (q n)) atTop atTop :=
  TauCeti.properSpace_iff_exists_isCompact_monotone_iUnion_eq_univ_tendsto_dist p

/-- **Base-point propagation**: `(d_p)` at one point gives global (d), ... -/
theorem isGeodesicallyCompleteAt_iff_forall (p : M) :
    IsGeodesicallyCompleteAt I M p ↔ ∀ q : M, IsGeodesicallyCompleteAt I M q :=
  TauCeti.Manifold.isGeodesicallyCompleteAt_iff_forall p

/-- ... and `(a_p)` at one point gives `(a_q)` at every point. -/
theorem expDomain_eq_univ_iff_forall (p : M) :
    expDomain I M p = univ ↔ ∀ q : M, expDomain I M q = univ :=
  TauCeti.Manifold.expDomain_eq_univ_iff_forall p

end Layer3

/-! ## Layer 4: corollaries and downstream theory -/

section Layer4Compact

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]

/-- **Compact ⇒ geodesically complete** (do Carmo, Ch. 7, Cor. 2.9), with no connectedness
hypothesis. -/
theorem isGeodesicallyCompleteAt_of_compactSpace [T2Space M] [CompactSpace M] (p : M) :
    IsGeodesicallyCompleteAt I M p :=
  TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace p

end Layer4Compact

section Layer4Length

variable {X : Type*}

/-- **Metric curve length** is Mathlib's `eVariationOn`: the supremum, over finite monotone
families of parameters in the set, of the sums of successive distances. -/
theorem eVariationOn_eq [PseudoEMetricSpace X] (γ : ℝ → X) (s : Set ℝ) :
    eVariationOn γ s = ⨆ p : ℕ × { u : ℕ → ℝ // Monotone u ∧ ∀ i, u i ∈ s },
      ∑ i ∈ Finset.range p.1, edist (γ (p.2.1 (i + 1))) (γ (p.2.1 i)) :=
  rfl

/-- **Length spaces**: the distance is the infimum of the lengths of the continuous curves
joining two points. -/
theorem isLengthSpace_iff [PseudoEMetricSpace X] :
    IsLengthSpace X ↔ ∀ x y : X,
      edist x y = ⨅ (γ : ℝ → X) (_ : IsCurveJoining γ x y), eVariationOn γ (Icc 0 1) :=
  ⟨fun h ↦ h.edist_eq_iInf, fun h ↦ ⟨h⟩⟩

/-- A joining curve is a curve continuous on `[0, 1]` from `x` to `y`. -/
theorem isCurveJoining_iff [TopologicalSpace X] {γ : ℝ → X} {x y : X} :
    IsCurveJoining γ x y ↔ ContinuousOn γ (Icc 0 1) ∧ γ 0 = x ∧ γ 1 = y :=
  ⟨fun h ↦ ⟨h.continuousOn, h.source, h.target⟩, fun h ↦ ⟨h.1, h.2.1, h.2.2⟩⟩

/-- **Geodesic segments**: constant-speed curves on `[0, 1]` with
`dist (γ s) (γ t) = |s - t| * dist x y`. -/
theorem isGeodesicSegment_iff [PseudoMetricSpace X] {γ : ℝ → X} {x y : X} :
    IsGeodesicSegment γ x y ↔ γ 0 = x ∧ γ 1 = y ∧
      ∀ s ∈ Icc (0 : ℝ) 1, ∀ t ∈ Icc (0 : ℝ) 1, dist (γ s) (γ t) = |s - t| * dist x y :=
  ⟨fun h ↦ ⟨h.source, h.target, h.dist_eq⟩, fun h ↦ ⟨h.1, h.2.1, h.2.2⟩⟩

/-- **Geodesic spaces**: every two points are joined by a geodesic segment. -/
theorem isGeodesicSpace_iff [PseudoMetricSpace X] :
    IsGeodesicSpace X ↔ ∀ x y : X, ∃ γ : ℝ → X, IsGeodesicSegment γ x y :=
  ⟨fun h ↦ h.exists_isGeodesicSegment, fun h ↦ ⟨h⟩⟩

/-- Geodesic spaces are length spaces. -/
example [PseudoMetricSpace X] [IsGeodesicSpace X] : IsLengthSpace X := inferInstance

end Layer4Length

section Layer4Riemannian

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H) [I.Boundaryless]
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [IsRiemannianManifold I M]

omit [FiniteDimensional ℝ E] [I.Boundaryless] [IsManifold I ∞ M]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] in
include I in
/-- A Riemannian manifold, with its Riemannian distance, is a length space. -/
theorem isLengthSpace : IsLengthSpace M :=
  TauCeti.Manifold.isLengthSpace I

include I in
/-- **A complete Riemannian manifold is a geodesic space**, hence also a length space. -/
theorem isGeodesicSpace_of_completeSpace [CompleteSpace M] : IsGeodesicSpace M :=
  TauCeti.Manifold.isGeodesicSpace_of_completeSpace I

end Layer4Riemannian

section Layer4Isometry

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  {H' : Type*} [TopologicalSpace H'] {J : ModelWithCorners ℝ F H'}
  {N : Type*} [TopologicalSpace N] [ChartedSpace H' N] [IsManifold J ∞ N]
  [Bundle.RiemannianBundle (fun y : N => TangentSpace J y)]
  [IsContMDiffRiemannianBundle J ∞ F (fun y : N => TangentSpace J y)]

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] [FiniteDimensional ℝ F]
  [IsManifold J ∞ N] [IsContMDiffRiemannianBundle J ∞ F (fun y : N => TangentSpace J y)] in
/-- **Smooth Riemannian isometries**: a map is a `RiemannianIsometry` exactly when it is a `C^∞`
diffeomorphism (so with `C^∞` inverse) whose tangent maps preserve the Riemannian inner products
at every point. -/
theorem exists_riemannianIsometry_iff (f : M → N) :
    (∃ Φ : RiemannianIsometry I J M N, ⇑Φ = f) ↔
      ∃ Ψ : Diffeomorph I J M N ∞, ⇑Ψ = f ∧
        ∀ x (v w : TangentSpace I x),
          inner ℝ (mfderiv I J f x v) (mfderiv I J f x w) = inner ℝ v w := by
  constructor
  · rintro ⟨Φ, rfl⟩
    exact ⟨Φ.toDiffeomorph, Φ.coe_toDiffeomorph, Φ.inner_mfderiv⟩
  · rintro ⟨Ψ, rfl, h⟩
    exact ⟨⟨Ψ, h⟩, rfl⟩

/-- **Transport of the Levi-Civita connection**: `dΦ_x (∇ᴹ_v (Φ^* Y)) = ∇ᴺ_{dΦ_x v} Y`. -/
theorem RiemannianIsometry.mfderiv_leviCivitaConnection_mpullback
    (Φ : RiemannianIsometry I J M N) {Y : Π y : N, TangentSpace J y} {x : M}
    (hY : MDifferentiableAt J J.tangent (fun y ↦ (⟨y, Y y⟩ : TangentBundle J N)) (Φ x))
    (v : TangentSpace I x) :
    mfderiv I J Φ x (leviCivitaConnection I M (VectorField.mpullback I J Φ Y) x v) =
      leviCivitaConnection J N Y (Φ x) (mfderiv I J Φ x v) :=
  Φ.mfderiv_leviCivitaConnection_mpullback hY v

/-- Riemannian isometries preserve geodesics, ... -/
theorem RiemannianIsometry.isGeodesicCurveOnFrom_comp_iff (Φ : RiemannianIsometry I J M N)
    {γ : ℝ → M} {s : Set ℝ} {p : M} {v : TangentSpace I p} :
    IsGeodesicCurveOnFrom J (Φ ∘ γ) s (Φ p) (mfderiv I J Φ p v) ↔
      IsGeodesicCurveOnFrom I γ s p v :=
  Φ.isGeodesicCurveOnFrom_comp_iff

/-- ... maximal intervals, ... -/
theorem RiemannianIsometry.geodesicInterval_mfderiv (Φ : RiemannianIsometry I J M N) (p : M)
    (v : TangentSpace I p) :
    geodesicInterval J N (Φ p) (mfderiv I J Φ p v) = geodesicInterval I M p v :=
  Φ.geodesicInterval_mfderiv p v

/-- ... exponential maps, `Φ ∘ exp_p = exp_{Φ p} ∘ dΦ_p`, ... -/
theorem RiemannianIsometry.riemannianExp_mfderiv [I.Boundaryless] [J.Boundaryless]
    [T2Space M] [T2Space N]
    (Φ : RiemannianIsometry I J M N) (p : M) (v : TangentSpace I p) :
    riemannianExp J N (Φ p) (mfderiv I J Φ p v) = Φ (riemannianExp I M p v) :=
  Φ.riemannianExp_mfderiv p v

/-- ... and geodesic completeness. -/
theorem RiemannianIsometry.forall_isGeodesicallyCompleteAt_iff (Φ : RiemannianIsometry I J M N) :
    (∀ p : M, IsGeodesicallyCompleteAt I M p) ↔ ∀ q : N, IsGeodesicallyCompleteAt J N q :=
  Φ.forall_isGeodesicallyCompleteAt_iff

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)] [FiniteDimensional ℝ F]
  [IsManifold J ∞ N] [IsContMDiffRiemannianBundle J ∞ F (fun y : N => TangentSpace J y)] in
/-- Riemannian isometries preserve the Riemannian distance. -/
theorem RiemannianIsometry.riemannianEDist_eq (Φ : RiemannianIsometry I J M N) (x y : M) :
    riemannianEDist J (Φ x) (Φ y) = riemannianEDist I x y :=
  Φ.riemannianEDist_eq x y

end Layer4Isometry

section Layer4IsometryMetric

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [PseudoEMetricSpace M] [ChartedSpace H M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)] [IsRiemannianManifold I M]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
  {H' : Type*} [TopologicalSpace H'] {J : ModelWithCorners ℝ F H'}
  {N : Type*} [PseudoEMetricSpace N] [ChartedSpace H' N]
  [Bundle.RiemannianBundle (fun y : N => TangentSpace J y)] [IsRiemannianManifold J N]

/-- Through the `IsRiemannianManifold` identification, a Riemannian isometry is an isometry of the
ambient (extended) metrics. -/
theorem RiemannianIsometry.isometry (Φ : RiemannianIsometry I J M N) : Isometry Φ :=
  IsometryClass.isometry Φ

end Layer4IsometryMetric

/-! ## Worked examples -/

section EuclideanExample

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]

/-- **A finite-dimensional real inner-product space.** Its geodesics on an interval are exactly the
affine segments, ... -/
theorem isGeodesicCurveOn_iff_exists_eqOn_add_smul {γ : ℝ → F} {s : Set ℝ}
    (hs : UniqueDiffOn ℝ s) (hs' : IsPreconnected s) :
    IsGeodesicCurveOn 𝓘(ℝ, F) γ s ↔ ∃ p v : F, EqOn γ (fun t : ℝ ↦ p + t • v) s :=
  TauCeti.Manifold.isGeodesicCurveOn_iff_exists_eqOn_add_smul hs hs'

/-- ... its all-time geodesics are exactly the affine lines, ... -/
theorem isGeodesicCurve_iff_exists_eq_add_smul {γ : ℝ → F} :
    IsGeodesicCurve 𝓘(ℝ, F) γ ↔ ∃ p v : F, γ = fun t : ℝ ↦ p + t • v :=
  TauCeti.Manifold.isGeodesicCurve_iff_exists_eq_add_smul

/-- ... `γ_{p,v}(t) = p + t • v` and `J(p, v) = univ`, ... -/
theorem maximalGeodesic_model_space (p v : F) :
    (∀ t, maximalGeodesic 𝓘(ℝ, F) F p v t = p + t • v) ∧
      geodesicInterval 𝓘(ℝ, F) F p v = univ :=
  ⟨TauCeti.Manifold.maximalGeodesic_model_space p v,
    TauCeti.Manifold.geodesicInterval_model_space p v⟩

/-- ... `expDomain p = univ` and `exp_p v = p + v` under the canonical identification, ... -/
theorem riemannianExp_model_space (p : F) :
    expDomain 𝓘(ℝ, F) F p = univ ∧
      ∀ v : TangentSpace 𝓘(ℝ, F) p,
        riemannianExp 𝓘(ℝ, F) F p v = p + NormedSpace.fromTangentSpace p v :=
  ⟨TauCeti.Manifold.expDomain_model_space p, TauCeti.Manifold.riemannianExp_model_space p⟩

/-- ... it is geodesically and metrically complete, ... -/
theorem isGeodesicallyCompleteAt_model_space (p : F) :
    IsGeodesicallyCompleteAt 𝓘(ℝ, F) F p ∧ CompleteSpace F :=
  ⟨TauCeti.Manifold.isGeodesicallyCompleteAt_model_space p, inferInstance⟩

omit [FiniteDimensional ℝ F] in
/-- ... the affine segment from `x` to `y` has length `‖x - y‖`, ... -/
theorem pathELength_lineMap (x y : F) :
    pathELength 𝓘(ℝ, F) (⇑(ContinuousAffineMap.lineMap (R := ℝ) x y)) 0 1 = ‖x - y‖ₑ :=
  TauCeti.Manifold.pathELength_lineMap x y

/-- ... for every `r > 0`, `exp_p` is a diffeomorphism from the tangent ball of radius `r` onto
`Metric.ball p r`, ... -/
theorem isNormalDomain_ball_model_space (p : F) {r : ℝ} (hr : 0 < r) :
    IsNormalDomain 𝓘(ℝ, F) F p (Metric.ball (0 : TangentSpace 𝓘(ℝ, F) p) r) ∧
      riemannianExp 𝓘(ℝ, F) F p '' Metric.ball (0 : TangentSpace 𝓘(ℝ, F) p) r =
        Metric.ball p r :=
  ⟨TauCeti.Manifold.isNormalDomain_ball_model_space p hr,
    TauCeti.Manifold.image_riemannianExp_ball_model_space p r⟩

/-- ... with inverse `log_p q = q - p`, ... -/
theorem riemannianLog_ball_model_space {p q : F} {r : ℝ} (hq : q ∈ Metric.ball p r) :
    riemannianLog 𝓘(ℝ, F) F p (Metric.ball 0 r) q = (NormedSpace.fromTangentSpace p).symm (q - p) :=
  TauCeti.Manifold.riemannianLog_ball_model_space hq

/-- ... the derivative of `exp_p` is the identity, ... -/
theorem mfderiv_riemannianExp_apply_model_space (p : F) (v w : TangentSpace 𝓘(ℝ, F) p) :
    mfderiv 𝓘(ℝ, TangentSpace 𝓘(ℝ, F) p) 𝓘(ℝ, F) (riemannianExp 𝓘(ℝ, F) F p) v w =
      NormedSpace.fromTangentSpace p w :=
  TauCeti.Manifold.mfderiv_riemannianExp_apply_model_space p v w

/-- ... hence the Gauss radial identity holds. -/
theorem inner_mfderiv_riemannianExp_radial_model_space (p : F) (v w : TangentSpace 𝓘(ℝ, F) p) :
    inner ℝ (mfderiv 𝓘(ℝ, TangentSpace 𝓘(ℝ, F) p) 𝓘(ℝ, F) (riemannianExp 𝓘(ℝ, F) F p) v v)
        (mfderiv 𝓘(ℝ, TangentSpace 𝓘(ℝ, F) p) 𝓘(ℝ, F) (riemannianExp 𝓘(ℝ, F) F p) v w) =
      inner ℝ v w :=
  TauCeti.Manifold.inner_mfderiv_riemannianExp_model_space p v v w

end EuclideanExample

section OpenUnitBallExample

open TauCeti.RealOpenUnitBall

/-- **The open unit ball in `ℝ`**, with the restriction of the flat metric, is a Riemannian
manifold for its subspace distance. -/
theorem realOpenUnitBall_isRiemannianManifold : IsRiemannianManifold 𝓘(ℝ, ℝ) realOpenUnitBall :=
  TauCeti.RealOpenUnitBall.isRiemannianManifold

/-- Every `q` is joined to `0` by a geodesic segment, the radial one, realizing `dist 0 q`, ... -/
theorem realOpenUnitBall_exists_isGeodesicCurveOn_Icc_pathELength_eq_edist
    (q : realOpenUnitBall) :
    ∃ γ : ℝ → realOpenUnitBall, IsGeodesicCurveOn 𝓘(ℝ, ℝ) γ (Icc 0 1) ∧
      γ 0 = RealOpenUnitBall.center ∧
      γ 1 = q ∧ pathELength 𝓘(ℝ, ℝ) γ 0 1 = edist RealOpenUnitBall.center q :=
  TauCeti.RealOpenUnitBall.exists_isGeodesicCurveOn_Icc_pathELength_eq_edist q

/-- ... but `closedBall 0 2` is the whole open ball and is not compact, ... -/
theorem realOpenUnitBall_closedBall_two :
    Metric.closedBall RealOpenUnitBall.center 2 = univ ∧
      ¬ IsCompact (Metric.closedBall RealOpenUnitBall.center 2) :=
  ⟨closedBall_center_eq_univ 2 one_le_two, not_isCompact_closedBall_center 2 one_le_two⟩

/-- ... a unit-speed geodesic from `0` is defined exactly on `(-1, 1)` and reaches the missing
boundary as `t → 1⁻`, ... -/
theorem realOpenUnitBall_unit_speed {v : TangentSpace 𝓘(ℝ, ℝ) RealOpenUnitBall.center}
    (hv : ‖v‖ = 1) :
    geodesicInterval 𝓘(ℝ, ℝ) realOpenUnitBall RealOpenUnitBall.center v = Ioo (-1) 1 ∧
      Tendsto (fun t ↦ |(maximalGeodesic 𝓘(ℝ, ℝ) realOpenUnitBall RealOpenUnitBall.center v t : ℝ)|)
        (𝓝[<] 1) (𝓝 1) :=
  ⟨geodesicInterval_center_of_norm_eq_one hv, tendsto_abs_coe_maximalGeodesic_center hv⟩

/-- ... so the space is neither metrically nor geodesically complete, nor proper. -/
theorem realOpenUnitBall_not_complete :
    ¬ CompleteSpace realOpenUnitBall ∧
      ¬ IsGeodesicallyCompleteAt 𝓘(ℝ, ℝ) realOpenUnitBall RealOpenUnitBall.center ∧
      ¬ ProperSpace realOpenUnitBall :=
  ⟨not_completeSpace, not_isGeodesicallyCompleteAt RealOpenUnitBall.center, not_properSpace⟩

end OpenUnitBallExample

end TauCetiRoadmap.HopfRinow
