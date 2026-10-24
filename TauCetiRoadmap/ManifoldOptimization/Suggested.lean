import Mathlib
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.AlongCurve.Basic
import TauCeti.Geometry.Manifold.MFDeriv.Curve
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.HopfRinow
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Exponential
import TauCeti.Geometry.Manifold.Riemannian.Sphere
import TauCeti.Geometry.Manifold.Morse.Basic
import TauCeti.Topology.MetricSpace.Length
import TauCetiRoadmap.DifferentialGeometry.Suggested

/-!
# Riemannian optimization: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The gradient and Hessian are DifferentialGeometry Layer 12's `mgradient` and `hessian`, imported
from that roadmap's signature file rather than restated. Unimplemented objects have honest
`sorry` bodies; no free proposition stands in for a derivative, a domain or a rate.
-/

noncomputable section

namespace TauCetiRoadmap.RiemannianOptimization

open Set Bundle Filter
open scoped Manifold Bundle Topology ContDiff InnerProductSpace
open TauCetiRoadmap.DifferentialGeometry (mgradient hessian)

/-! ## O2.1: retractions -/

section Retractions

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]

variable (I M) in
/-- **O2.1.** A retraction: a map on the tangent bundle, smooth on an open domain containing the
zero section, with `R_x(0) = x` and `d/dt R_x(t v)|_{t=0} = v`. It is total, with junk values off
`domain`; every theorem about its values carries the domain hypothesis. -/
structure Retraction where
  /-- The map `(x, v) ↦ R_x(v)`. -/
  toFun : TangentBundle I M → M
  /-- The open set of tangent vectors on which the retraction is meaningful. -/
  domain : Set (TangentBundle I M)
  isOpen_domain : IsOpen domain
  zero_mem_domain : ∀ x : M, (⟨x, 0⟩ : TangentBundle I M) ∈ domain
  contMDiffOn : ContMDiffOn I.tangent I ∞ toFun domain
  apply_zero : ∀ x : M, toFun ⟨x, 0⟩ = x
  mfderiv_curve_zero : ∀ (x : M) (v : TangentSpace I x),
    mfderiv 𝓘(ℝ, ℝ) I (fun t : ℝ ↦ toFun ⟨x, t • v⟩) 0 (1 : ℝ) = v

namespace Retraction

variable (R : Retraction I M)

/-- The retraction at `x`, as a map on `T_x M`. -/
def retr (x : M) (v : TangentSpace I x) : M :=
  R.toFun ⟨x, v⟩

/-- A retraction is *global* when it is defined on the whole tangent bundle. -/
def IsGlobal : Prop :=
  R.domain = univ

end Retraction

end Retractions

/-! ## Riemannian setting: O1–O4 on a topological manifold -/

section Riemannian

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]

variable (I) in
/-- **Conventions.** The Hessian operator `Hess f(x) = ∇ (grad f)` at `x`, the operator form of
DifferentialGeometry 12.3's `hessian` (see `inner_hessianOp`). -/
def hessianOp (f : M → ℝ) (x : M) : TangentSpace I x →L[ℝ] TangentSpace I x :=
  CovariantDerivative.leviCivitaConnection I M (mgradient I f) x

/-- The bilinear form of `hessianOp` is `hessian`; definitional. -/
theorem inner_hessianOp (f : M → ℝ) (x : M) (v w : TangentSpace I x) :
    ⟪hessianOp I f x v, w⟫_ℝ = hessian I f x v w := by
  sorry

/-- **O2.1.** Each `R_x` is a local diffeomorphism at `0`, by the manifold inverse function
theorem `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`. -/
theorem Retraction.isLocalDiffeomorphAt_retr_zero (R : Retraction I M) (x : M) :
    IsLocalDiffeomorphAt 𝓘(ℝ, TangentSpace I x) I ∞ (R.retr x) 0 := by
  sorry

/-- **O2.2.** A second-order retraction: every curve `t ↦ R_x(t v)` has zero covariant
acceleration at `t = 0`, for HopfRinow's along-curve derivative. -/
def Retraction.IsSecondOrder (R : Retraction I M) : Prop :=
  ∀ (x : M) (v : TangentSpace I x),
    (CovariantDerivative.leviCivitaConnection I M).alongCurveWithin
      (fun t : ℝ ↦ R.retr x (t • v))
      (TauCeti.Manifold.curveVelocityWithin I (fun t : ℝ ↦ R.retr x (t • v)) univ) univ 0 = 0

variable (I M) in
/-- **O2.2.** The Riemannian exponential map as a retraction on its natural domain. The proof
fields are discharged by Tau Ceti's `isOpen_setOfPred_mem_expDomain`, `zero_mem_expDomain`,
`contMDiffOn_riemannianExp_tangentBundle`, `riemannianExp_zero` and
`mfderiv_riemannianExp_apply_zero`. -/
def expRetraction : Retraction I M where
  toFun z := TauCeti.Manifold.riemannianExp I M z.proj z.2
  domain := {z | z.2 ∈ TauCeti.Manifold.expDomain I M z.proj}
  isOpen_domain := sorry
  zero_mem_domain := sorry
  contMDiffOn := sorry
  apply_zero := sorry
  mfderiv_curve_zero := sorry

/-- **O2.2.** The exponential map is a second-order retraction. -/
theorem expRetraction_isSecondOrder : (expRetraction I M).IsSecondOrder := by
  sorry

/-! ### O1.4 and O3: curves and optimality conditions -/

/-- **O1.4.** The second derivative of a cost along a curve. -/
theorem deriv_deriv_comp_eq {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) 2 f) {γ : ℝ → M}
    (hγ : ContMDiff 𝓘(ℝ, ℝ) I 2 γ) (t : ℝ) :
    deriv (deriv (f ∘ γ)) t =
      hessian I f (γ t) (TauCeti.Manifold.curveVelocityWithin I γ univ t)
          (TauCeti.Manifold.curveVelocityWithin I γ univ t) +
        ⟪mgradient I f (γ t),
          (CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ
            (TauCeti.Manifold.curveVelocityWithin I γ univ) univ t⟫_ℝ := by
  sorry

/-- **O3.1**, consuming MorseTheory M4's manifold Fermat theorem. -/
theorem mgradient_eq_zero_of_isLocalMin {f : M → ℝ} {x : M}
    (hf : MDifferentiableAt I 𝓘(ℝ) f x) (hx : IsLocalMin f x) : mgradient I f x = 0 := by
  sorry

/-- **O3.2.** Second-order necessary condition. -/
theorem hessian_nonneg_of_isLocalMin {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) 2 f) {x : M}
    (hx : IsLocalMin f x) (v : TangentSpace I x) : 0 ≤ hessian I f x v v := by
  sorry

/-- **O3.3.** Second-order sufficient condition: a strict local minimizer. -/
theorem eventually_lt_of_hessian_pos {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) ∞ f) {x : M}
    (hcrit : mgradient I f x = 0)
    (hpos : ∀ v : TangentSpace I x, v ≠ 0 → 0 < hessian I f x v v) :
    ∀ᶠ y in 𝓝[≠] x, f x < f y := by
  sorry

/-! ### O2.4: pullback regularity -/

/-- **O2.4.** The one-sided pullback bound `(PB_L)` on the whole domain of `R`. -/
def SatisfiesPullbackBound (R : Retraction I M) (f : M → ℝ) (L : ℝ) : Prop :=
  ∀ z ∈ R.domain,
    f (R.toFun z) ≤ f z.proj + ⟪mgradient I f z.proj, z.2⟫_ℝ + L / 2 * ‖z.2‖ ^ 2

/-- **O2.4.** The two-sided pullback bound at a single trial step `s ∈ T_x M`. -/
def PullbackBoundAt (R : Retraction I M) (f : M → ℝ) (L : ℝ) (x : M)
    (s : TangentSpace I x) : Prop :=
  |f (R.retr x s) - f x - ⟪mgradient I f x, s⟫_ℝ| ≤ L / 2 * ‖s‖ ^ 2

/-- **O2.4.** On a compact manifold, a global retraction and a `C²` cost satisfy `(PB_L)`. -/
theorem exists_satisfiesPullbackBound [CompactSpace M] (R : Retraction I M) (hR : R.IsGlobal)
    {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) 2 f) :
    ∃ L : ℝ, 0 < L ∧ SatisfiesPullbackBound R f L := by
  sorry

/-! ### O4.1: gradient descent with a fixed step -/

/-- **O4.1.** One step of Riemannian gradient descent with step size `α`. -/
def rgdStep (R : Retraction I M) (f : M → ℝ) (α : ℝ) (x : M) : M :=
  R.retr x ((-α) • mgradient I f x)

/-- **O4.1.** The gradient-descent sequence from `x₀`. -/
def rgdSeq (R : Retraction I M) (f : M → ℝ) (α : ℝ) (x₀ : M) (k : ℕ) : M :=
  (rgdStep R f α)^[k] x₀

/-- **O4.1.** Summed squared gradient norms are bounded by the initial optimality gap. -/
theorem rgd_sum_sq_norm_mgradient_le (R : Retraction I M) (hR : R.IsGlobal) {f : M → ℝ}
    {L f_low : ℝ} (hL : 0 < L) (hPB : SatisfiesPullbackBound R f L)
    (hlow : ∀ x, f_low ≤ f x) (x₀ : M) (K : ℕ) :
    ∑ k ∈ Finset.range K, ‖mgradient I f (rgdSeq R f L⁻¹ x₀ k)‖ ^ 2 ≤
      2 * L * (f x₀ - f_low) := by
  sorry

/-- **O4.1.** The `O(1/ε²)` complexity bound. -/
theorem rgd_exists_norm_mgradient_le (R : Retraction I M) (hR : R.IsGlobal) {f : M → ℝ}
    {L f_low : ℝ} (hL : 0 < L) (hPB : SatisfiesPullbackBound R f L)
    (hlow : ∀ x, f_low ≤ f x) (x₀ : M) (K : ℕ) (hK : 0 < K) :
    ∃ k < K, ‖mgradient I f (rgdSeq R f L⁻¹ x₀ k)‖ ≤
      Real.sqrt (2 * L * (f x₀ - f_low) / (K : ℝ)) := by
  sorry

/-- **O4.1.** The gradient norms tend to zero. -/
theorem tendsto_norm_mgradient_rgdSeq (R : Retraction I M) (hR : R.IsGlobal) {f : M → ℝ}
    {L f_low : ℝ} (hL : 0 < L) (hPB : SatisfiesPullbackBound R f L)
    (hlow : ∀ x, f_low ≤ f x) (x₀ : M) :
    Tendsto (fun k ↦ ‖mgradient I f (rgdSeq R f L⁻¹ x₀ k)‖) atTop (𝓝 0) := by
  sorry

/-! ### O4.2: Armijo backtracking -/

/-- **O4.2.** The Armijo exponent: the least `i` giving sufficient decrease at step `ᾱ τ^i`. It
is an `sInf` over `ℕ`, hence `0` when no exponent qualifies; `armijo_decrease` excludes that case
under the pullback bound. -/
def armijoExponent (R : Retraction I M) (f : M → ℝ) (αbar τ r : ℝ) (x : M) : ℕ :=
  sInf {i : ℕ | r * (αbar * τ ^ i) * ‖mgradient I f x‖ ^ 2 ≤
    f x - f (R.retr x ((-(αbar * τ ^ i)) • mgradient I f x))}

/-- **O4.2.** The Armijo step size `ᾱ τ^i`. -/
def armijoStepSize (R : Retraction I M) (f : M → ℝ) (αbar τ r : ℝ) (x : M) : ℝ :=
  αbar * τ ^ armijoExponent R f αbar τ r x

/-- **O4.2.** One Armijo gradient step. -/
def armijoStep (R : Retraction I M) (f : M → ℝ) (αbar τ r : ℝ) (x : M) : M :=
  R.retr x ((-armijoStepSize R f αbar τ r x) • mgradient I f x)

/-- **O4.2.** The Armijo gradient-descent sequence from `x₀`. -/
def armijoSeq (R : Retraction I M) (f : M → ℝ) (αbar τ r : ℝ) (x₀ : M) (k : ℕ) : M :=
  (armijoStep R f αbar τ r)^[k] x₀

/-- **O4.2.** Sufficient decrease with the explicit constant `r min(ᾱ, 2τ(1 − r)/L)`. -/
theorem armijo_decrease (R : Retraction I M) (hR : R.IsGlobal) {f : M → ℝ} {L αbar τ r : ℝ}
    (hL : 0 < L) (hPB : SatisfiesPullbackBound R f L) (hαbar : 0 < αbar)
    (hτ : τ ∈ Ioo (0 : ℝ) 1) (hr : r ∈ Ioo (0 : ℝ) 1) (x : M) :
    r * min αbar (2 * τ * (1 - r) / L) * ‖mgradient I f x‖ ^ 2 ≤
      f x - f (armijoStep R f αbar τ r x) := by
  sorry

/-- **O4.2.** The gradient norms along the Armijo sequence tend to zero. -/
theorem tendsto_norm_mgradient_armijoSeq (R : Retraction I M) (hR : R.IsGlobal) {f : M → ℝ}
    {L f_low αbar τ r : ℝ} (hL : 0 < L) (hPB : SatisfiesPullbackBound R f L)
    (hlow : ∀ x, f_low ≤ f x) (hαbar : 0 < αbar) (hτ : τ ∈ Ioo (0 : ℝ) 1)
    (hr : r ∈ Ioo (0 : ℝ) 1) (x₀ : M) :
    Tendsto (fun k ↦ ‖mgradient I f (armijoSeq R f αbar τ r x₀ k)‖) atTop (𝓝 0) := by
  sorry

/-- **O4.2.** Every cluster point of the Armijo sequence of a `C¹` cost is critical. -/
theorem mgradient_eq_zero_of_mapClusterPt (R : Retraction I M) (hR : R.IsGlobal) {f : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ) 1 f) {L f_low αbar τ r : ℝ} (hL : 0 < L)
    (hPB : SatisfiesPullbackBound R f L) (hlow : ∀ x, f_low ≤ f x) (hαbar : 0 < αbar)
    (hτ : τ ∈ Ioo (0 : ℝ) 1) (hr : r ∈ Ioo (0 : ℝ) 1) (x₀ : M) {xbar : M}
    (h : MapClusterPt xbar atTop (armijoSeq R f αbar τ r x₀)) : mgradient I f xbar = 0 := by
  sorry

/-! ### O4.3: trust regions -/

/-- **O4.3.** The trust-region model `m_x(s) = f x + ⟪grad f x, s⟫ + ½⟪H_x s, s⟫`. -/
def trModel (f : M → ℝ) (H : (x : M) → TangentSpace I x →L[ℝ] TangentSpace I x) (x : M)
    (s : TangentSpace I x) : ℝ :=
  f x + ⟪mgradient I f x, s⟫_ℝ + 1 / 2 * ⟪H x s, s⟫_ℝ

/-- **O4.3.** Actual over predicted decrease, with Lean's division (`0` on a zero denominator). -/
def trRatio (R : Retraction I M) (f : M → ℝ)
    (H : (x : M) → TangentSpace I x →L[ℝ] TangentSpace I x) (x : M) (s : TangentSpace I x) :
    ℝ :=
  (f x - f (R.retr x s)) / (trModel f H x 0 - trModel f H x s)

/-- **O4.3.** One trust-region iteration on the state `(x, Δ)`, with the pinned constants: shrink
by `1/4` below ratio `1/4`, double up to `Δbar` above `3/4` on the boundary, accept iff `ρ' < ρ`.
`step x Δ` is the inner solver, for instance truncated CG. -/
def trUpdate (R : Retraction I M) (f : M → ℝ)
    (H : (x : M) → TangentSpace I x →L[ℝ] TangentSpace I x)
    (step : (x : M) → ℝ → TangentSpace I x) (ρ' Δbar : ℝ) (st : M × ℝ) : M × ℝ :=
  let s := step st.1 st.2
  let ρ := trRatio R f H st.1 s
  (if ρ' < ρ then R.retr st.1 s else st.1,
    if ρ < 1 / 4 then st.2 / 4
    else if 3 / 4 < ρ ∧ ‖s‖ = st.2 then min (2 * st.2) Δbar else st.2)

/-- **O4.3.** The trust-region sequence of states from `(x₀, Δ₀)`. -/
def trSeq (R : Retraction I M) (f : M → ℝ)
    (H : (x : M) → TangentSpace I x →L[ℝ] TangentSpace I x)
    (step : (x : M) → ℝ → TangentSpace I x) (ρ' Δbar : ℝ) (x₀ : M) (Δ₀ : ℝ) (k : ℕ) : M × ℝ :=
  (trUpdate R f H step ρ' Δbar)^[k] (x₀, Δ₀)

/-- **O4.3.** The `O(1/ε²)` bound on the index of the first `ε`-critical trust-region iterate
[BAC19]. It does not count iterations with large gradient that follow that index. -/
theorem trSeq_exists_norm_mgradient_le (R : Retraction I M) (hR : R.IsGlobal) {f : M → ℝ}
    {H : (x : M) → TangentSpace I x →L[ℝ] TangentSpace I x}
    {step : (x : M) → ℝ → TangentSpace I x} {f_low L β c₁ ρ' Δbar Δ₀ : ℝ} (x₀ : M)
    (hlow : ∀ x, f_low ≤ f x) (hL : 0 ≤ L) (hβ : 0 < β) (hc₁ : c₁ ∈ Ioc (0 : ℝ) 1)
    (hρ' : ρ' ∈ Ioo (0 : ℝ) (1 / 4)) (hΔ₀ : Δ₀ ∈ Ioc 0 Δbar)
    (hH : ∀ x, ‖H x‖ ≤ β)
    (hHsymm : ∀ (x : M) (u v : TangentSpace I x), ⟪H x u, v⟫_ℝ = ⟪u, H x v⟫_ℝ)
    (hstep : ∀ (x : M) (Δ : ℝ), 0 < Δ → ‖step x Δ‖ ≤ Δ)
    (hcauchy : ∀ (x : M) (Δ : ℝ), 0 < Δ →
      c₁ * ‖mgradient I f x‖ * min Δ (‖mgradient I f x‖ / β) ≤
        trModel f H x 0 - trModel f H x (step x Δ))
    (hpull : ∀ k : ℕ, let st := trSeq R f H step ρ' Δbar x₀ Δ₀ k;
      PullbackBoundAt R f L st.1 (step st.1 st.2)) :
    ∃ C : ℝ, ∀ ε : ℝ, 0 < ε → ε ≤ 1 → ∃ k ≤ ⌈C / ε ^ 2⌉₊,
      ‖mgradient I f (trSeq R f H step ρ' Δbar x₀ Δ₀ k).1‖ ≤ ε := by
  sorry

end Riemannian

/-! ## O0.1 and O1: submanifolds of an inner-product space -/

section LevelSet

variable {V F : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] [FiniteDimensional ℝ V]
  [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]

/-- **O0.1.** The named charted structure on a regular level set `h⁻¹(0)`, from Tau Ceti's
section-zero theorem. Provisional: the body is the target. -/
def levelSetChartedSpace (h : V → F) (n : ℕ)
    (hn : Module.finrank ℝ V = n + Module.finrank ℝ F) (hh : ContDiff ℝ ∞ h)
    (hsurj : ∀ x, h x = 0 → Function.Surjective (fderiv ℝ h x)) :
    ChartedSpace (EuclideanSpace ℝ (Fin n)) {x : V // h x = 0} :=
  sorry

/-- **O0.1.** The level set is a smooth manifold for `levelSetChartedSpace`. -/
theorem isManifold_levelSet (h : V → F) (n : ℕ)
    (hn : Module.finrank ℝ V = n + Module.finrank ℝ F) (hh : ContDiff ℝ ∞ h)
    (hsurj : ∀ x, h x = 0 → Function.Surjective (fderiv ℝ h x)) :
    letI := levelSetChartedSpace h n hn hh hsurj
    IsManifold (𝓡 n) ∞ {x : V // h x = 0} := by
  sorry

end LevelSet

section Embedded

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] [FiniteDimensional ℝ V]

variable (I) in
/-- **O0.1.** The canonical metric is the one induced by `ι : M → V`, the identity recorded by
Tau Ceti's `inducedRiemannianMetric_inner`. -/
def IsInducedBy (ι : M → V) : Prop :=
  ∀ (x : M) (v w : TangentSpace I x), ⟪v, w⟫_ℝ = ⟪mvfderiv I ι x v, mvfderiv I ι x w⟫_ℝ

variable (I) in
/-- **O1.1.** The tangent space at `x`, read as a subspace of `V`. -/
def tangentSubspace (ι : M → V) (x : M) : Submodule ℝ V :=
  LinearMap.range (mvfderiv I ι x)

/-- **O1.2.** The Riemannian gradient of a restricted cost is the projected Euclidean gradient. -/
theorem mvfderiv_mgradient_comp (ι : M → V) (hι : ContMDiff I 𝓘(ℝ, V) ∞ ι)
    (hinj : ∀ x, Function.Injective (mvfderiv I ι x)) (hmet : IsInducedBy I ι)
    {fbar : V → ℝ} {x : M} (hf : DifferentiableAt ℝ fbar (ι x)) :
    mvfderiv I ι x (mgradient I (fbar ∘ ι) x) =
      (tangentSubspace I ι x).starProjection (gradient fbar (ι x)) := by
  sorry

/-- **O1.3**, Lagrangian form. On a level set of `h` with surjective derivative, with `λ` the
multiplier of the normal component of the Euclidean gradient, the Riemannian Hessian is the
projected Hessian of the Lagrangian `f̄ − λ ∘ h`. -/
theorem mvfderiv_hessianOp_comp (ι : M → V) (hι : ContMDiff I 𝓘(ℝ, V) ∞ ι)
    (hinj : ∀ x, Function.Injective (mvfderiv I ι x)) (hmet : IsInducedBy I ι)
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
    {h : V → F} (hh : ContDiff ℝ ∞ h) (hlevel : ∀ x, h (ι x) = 0)
    (hsurj : ∀ x, Function.Surjective (fderiv ℝ h (ι x)))
    (hker : ∀ x, tangentSubspace I ι x = LinearMap.ker (fderiv ℝ h (ι x)))
    {fbar : V → ℝ} (hf : ContDiff ℝ ∞ fbar) (x : M) (lam : F →L[ℝ] ℝ)
    (hlam : gradient (fun y ↦ lam (h y)) (ι x) =
      (tangentSubspace I ι x)ᗮ.starProjection (gradient fbar (ι x)))
    (u : TangentSpace I x) :
    mvfderiv I ι x (hessianOp I (fbar ∘ ι) x u) =
      (tangentSubspace I ι x).starProjection
        (fderiv ℝ (gradient fbar) (ι x) (mvfderiv I ι x u) -
          fderiv ℝ (gradient fun y ↦ lam (h y)) (ι x) (mvfderiv I ι x u)) := by
  sorry

end Embedded

/-! ## O5–O6: rates and geodesic convexity, with the Riemannian distance -/

section Metric

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  [IsRiemannianManifold I M]

/-- **O5.2.** One Riemannian Newton step; `Ring.inverse` gives the junk step `0` where the
Hessian is not invertible. -/
def newtonStep (R : Retraction I M) (f : M → ℝ) (x : M) : M :=
  R.retr x (-(Ring.inverse (hessianOp I f x) (mgradient I f x)))

/-- **O5.2.** The Newton sequence from `x₀`. -/
def newtonSeq (R : Retraction I M) (f : M → ℝ) (x₀ : M) (k : ℕ) : M :=
  (newtonStep R f)^[k] x₀

/-- **O5.2.** Local quadratic convergence of Newton's method to a nondegenerate critical point
of any index, for any retraction. -/
theorem newton_local_quadratic (R : Retraction I M) {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    {xs : M} (hnd : TauCeti.IsManifoldNondegenerateCriticalPoint I f xs) :
    ∃ U ∈ 𝓝 xs, ∃ c : ℝ, ∀ x₀ ∈ U,
      Tendsto (newtonSeq R f x₀) atTop (𝓝 xs) ∧
        ∀ k, dist (newtonSeq R f x₀ (k + 1)) xs ≤ c * dist (newtonSeq R f x₀ k) xs ^ 2 := by
  sorry

/-- **O5.1.** Local linear convergence of Armijo gradient descent to a nondegenerate local
minimizer. -/
theorem armijo_local_linear (R : Retraction I M) {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    {αbar τ r : ℝ} (hαbar : 0 < αbar) (hτ : τ ∈ Ioo (0 : ℝ) 1) (hr : r ∈ Ioo (0 : ℝ) 1)
    {xs : M} (hnd : TauCeti.IsManifoldNondegenerateCriticalPoint I f xs)
    (hmin : IsLocalMin f xs) :
    ∃ U ∈ 𝓝 xs, ∃ C q : ℝ, 0 ≤ q ∧ q < 1 ∧ ∀ x₀ ∈ U, ∀ k : ℕ,
      dist (armijoSeq R f αbar τ r x₀ k) xs ≤ C * q ^ k * dist x₀ xs := by
  sorry

/-- **O6.1.** `κ`-convexity along every metric geodesic segment: a local signature model of
OptimalTransport Layer 9's predicate, whose declaration implementations use. -/
def IsGeodesicallyConvexWith (κ : ℝ) (f : M → ℝ) : Prop :=
  ∀ (γ : ℝ → M) (x y : M), TauCeti.IsGeodesicSegment γ x y → ∀ t ∈ Icc (0 : ℝ) 1,
    f (γ t) ≤ (1 - t) * f x + t * f y - κ / 2 * t * (1 - t) * dist x y ^ 2

/-- **O6.1.** For smooth costs, `κ`-geodesic convexity is `Hess f ⪰ κ g`. -/
theorem isGeodesicallyConvexWith_iff (κ : ℝ) {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) ∞ f) :
    IsGeodesicallyConvexWith κ f ↔
      ∀ (x : M) (v : TangentSpace I x), κ * ‖v‖ ^ 2 ≤ hessian I f x v v := by
  sorry

/-- **O6.3.** Linear convergence of gradient descent for a geodesically strongly convex cost. -/
theorem rgd_linear_of_isGeodesicallyConvexWith [CompleteSpace M] (R : Retraction I M)
    (hR : R.IsGlobal) {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) ∞ f) {κ L : ℝ} (hκ : 0 < κ)
    (hL : 0 < L) (hconv : IsGeodesicallyConvexWith κ f) (hPB : SatisfiesPullbackBound R f L)
    {xs : M} (hmin : IsMinOn f univ xs) (x₀ : M) (k : ℕ) :
    f (rgdSeq R f L⁻¹ x₀ k) - f xs ≤ (1 - κ / L) ^ k * (f x₀ - f xs) := by
  sorry

/-- **O6.4.** On a compact connected manifold, continuous geodesically convex functions are
constant. The `ContMDiff` hypothesis is continuity, stated so that the Riemannian structure is
part of the theorem. -/
theorem const_of_isGeodesicallyConvexWith [CompactSpace M] [ConnectedSpace M] {f : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ) 0 f) (hconv : IsGeodesicallyConvexWith 0 f) (x y : M) :
    f x = f y := by
  sorry

end Metric

/-! ## Acceptance: Manopt's first example -/

section Rayleigh

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] {n : ℕ}
  [Fact (Module.finrank ℝ V = n + 1)]

/-- **Acceptance.** Manopt's first example, the cost `x ↦ -⟪A x, x⟫` on the unit sphere with its
round metric. -/
def rayleighCost (A : V →L[ℝ] V) (x : Metric.sphere (0 : V) 1) : ℝ :=
  -⟪A (x : V), (x : V)⟫_ℝ

/-- The Riemannian gradient, read in `V`, is `−2(Ax − ⟪Ax, x⟫x)`. -/
theorem mvfderiv_mgradient_rayleighCost (A : V →L[ℝ] V) (hA : IsSelfAdjoint A)
    (x : Metric.sphere (0 : V) 1) :
    mvfderiv (𝓡 n) ((↑) : Metric.sphere (0 : V) 1 → V) x
        (mgradient (𝓡 n) (rayleighCost A) x) =
      (-2 : ℝ) • (A (x : V) - ⟪A (x : V), (x : V)⟫_ℝ • (x : V)) := by
  sorry

/-- Critical points are exactly the unit eigenvectors. -/
theorem mgradient_rayleighCost_eq_zero_iff (A : V →L[ℝ] V) (hA : IsSelfAdjoint A)
    (x : Metric.sphere (0 : V) 1) :
    mgradient (𝓡 n) (rayleighCost A) x = 0 ↔
      Module.End.HasEigenvector (A : V →ₗ[ℝ] V) ⟪A (x : V), (x : V)⟫_ℝ (x : V) := by
  sorry

/-- Benign landscape: every second-order critical point is a global minimizer. -/
theorem isMinOn_rayleighCost_of_hessian_nonneg (A : V →L[ℝ] V) (hA : IsSelfAdjoint A)
    {x : Metric.sphere (0 : V) 1} (hcrit : mgradient (𝓡 n) (rayleighCost A) x = 0)
    (hpsd : ∀ v : TangentSpace (𝓡 n) x, 0 ≤ hessian (𝓡 n) (rayleighCost A) x v v) :
    IsMinOn (rayleighCost A) univ x := by
  sorry

end Rayleigh

end TauCetiRoadmap.RiemannianOptimization
