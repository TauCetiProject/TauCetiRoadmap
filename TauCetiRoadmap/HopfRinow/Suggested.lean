import Mathlib

/-!
# Geodesics, the exponential map, and Hopf-Rinow: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.
-/

namespace TauCetiRoadmap.HopfRinow

open Set
open scoped Bundle ContDiff Manifold

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [IsRiemannianManifold I M]

/-- Layer 0 target: Mathlib's Riemannian extended distance agrees with the infimum of
`pathELength` over curves that are `C¹` on every piece of a finite strict partition. -/
theorem riemannianEDist_eq_iInf_piecewiseCOne (x y : M) :
    Manifold.riemannianEDist I x y =
      ⨅ (γ : ℝ → M) (n : ℕ) (τ : ℕ → ℝ) (_ : 0 < n)
        (_ : ∀ i < n, τ i < τ (i + 1))
        (_ : ∀ i < n, ContMDiffOn 𝓘(ℝ, ℝ) I 1 γ (Icc (τ i) (τ (i + 1))))
        (_ : γ (τ 0) = x) (_ : γ (τ n) = y),
        Manifold.pathELength I γ (τ 0) (τ n) := by
  sorry

/-!
Geodesic-level signatures are intentionally deferred until Layer 1 provides the real types for
covariant differentiation along a curve, interval-aware geodesics with initial data, maximal
existence intervals, and the exponential map. In particular, these targets must not be simulated
by quantifying over free `Prop`-valued predicates or arbitrary exponential-map domains.
-/

end TauCetiRoadmap.HopfRinow
