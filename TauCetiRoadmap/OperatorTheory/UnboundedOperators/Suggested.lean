/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Unbounded operators: target signatures

The roadmap is README.md; this file is not the roadmap. It states headline theorems
against the pinned APIs: maximal multiplication operators, Hilbert-basis cardinal
classification, closed-form representation, and Nelson essential self-adjointness
and commutation of the closures' resolvents.

The unbounded spectral-integral, normal spectral, joint-PVM, spectral-type,
staircase-approximation and tensor spectral-calculus headlines cannot yet be stated
on their intended carriers: the pins have no normalized projection-valued-measure
carrier or unbounded spectral integral. The square-root form-domain identity and
real spectral restriction likewise require that integral and the supplier's Hilbert
complexification; the Friedrichs and singular-endpoint headlines additionally need
the closed-form completion and minimal/maximal differential-operator constructions.
The analytic-perturbation spectral-branch and geometric Nelson-counterexample
headlines require the corresponding spectral-subspace and translation-surface
constructions described in the README. No planning prototype is imported here.
-/

open MeasureTheory

namespace TauCetiRoadmap.UnboundedOperators

/-! ## Layer 1: unbounded Borel calculus and spectral correspondences -/

/-- Every measurable scalar multiplier on an arbitrary measure space has a unique
maximal L² realization, with its pointwise action interpreted almost everywhere.
It is closed and densely defined; a real multiplier gives a self-adjoint operator. -/
theorem existsUnique_maximal_multiplier {X : Type*} [MeasurableSpace X]
    (μ : Measure X) (f : X → ℂ) (hf : Measurable f) :
    ∃! T : Lp ℂ 2 μ →ₗ.[ℂ] Lp ℂ 2 μ,
      (∀ x : Lp ℂ 2 μ, x ∈ T.domain ↔ MemLp (fun t => f t * x t) 2 μ) ∧
      (∀ x : T.domain, ∀ᵐ t ∂μ, (T x) t = f t * (x : Lp ℂ 2 μ) t) ∧
      Dense (T.domain : Set (Lp ℂ 2 μ)) ∧ T.IsClosed ∧
      ((∀ᵐ t ∂μ, star (f t) = f t) → IsSelfAdjoint T) := by
  sorry

/-! ## Layer 4: symmetric operators, deficiency and boundary data -/

/-- Complete complex Hilbert spaces with specified Hilbert bases are unitarily
isomorphic exactly when the basis index cardinals agree, across universes. -/
theorem nonempty_linearIsometryEquiv_iff_lift_mk_eq
    {ι : Type u} {κ : Type v} {H K : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    (b : HilbertBasis ι ℂ H) (c : HilbertBasis κ ℂ K) :
    Nonempty (H ≃ₗᵢ[ℂ] K) ↔
      Cardinal.lift.{v} (Cardinal.mk ι) = Cardinal.lift.{u} (Cardinal.mk κ) := by
  sorry

/-- A bounded Hermitian form on a complete Hilbert form domain, with a continuous
injective dense inclusion and a positive shifted coercivity bound, represents a
unique self-adjoint partial operator. The graph specifies its domain and action
in the conjugate-linear-first convention; compactness is not assumed. -/
theorem existsUnique_selfAdjoint_of_closed_form
    {𝕜 H : Type*} [RCLike 𝕜] [NormedAddCommGroup H]
    [InnerProductSpace 𝕜 H] [CompleteSpace H]
    {V : Type*} [NormedAddCommGroup V] [InnerProductSpace 𝕜 V] [CompleteSpace V]
    (j : V →L[𝕜] H) (hj : Function.Injective j) (hdense : DenseRange j)
    (q : V →L⋆[𝕜] V →L[𝕜] 𝕜)
    (hHermitian : ∀ u v, q u v = star (q v u))
    (α c : ℝ) (hc : 0 < c)
    (hcoercive : ∀ u, c * ‖u‖ ^ 2 ≤ RCLike.re (q u u) + α * ‖j u‖ ^ 2) :
    ∃! A : H →ₗ.[𝕜] H, IsSelfAdjoint A ∧
      ∀ x h : H, (x, h) ∈ A.graph ↔
        ∃ u : V, j u = x ∧ ∀ v : V, q u v = inner 𝕜 h (j v) := by
  sorry

/-! ## Layer 5: cores, analytic vectors and perturbations -/

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]

/-- A common dense invariant domain inside the actual partial-operator domains.
Graph-core density is a further theorem; dense invariance alone does not assert it. -/
structure CommonInvariantDomain (k : ℕ) (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] where
  operators : Fin k → H →ₗ.[ℂ] H
  carrier : Submodule ℂ H
  dense : Dense (carrier : Set H)
  domain_le : ∀ i, carrier ≤ (operators i).domain
  invariant : ∀ i (x : carrier),
    operators i ⟨x.1, domain_le i x.2⟩ ∈ carrier

/-- The action on the common domain is determined by the actual operators. -/
def CommonInvariantDomain.action {k : ℕ} (D : CommonInvariantDomain k H)
    (i : Fin k) : D.carrier →ₗ[ℂ] D.carrier :=
  ((D.operators i).toFun.comp (Submodule.inclusion (D.domain_le i))).codRestrict
    D.carrier (fun x => D.invariant i x)

/-- Ordered application: `[i,j]` means A_i(A_j(x)); every intermediate stays in the
invariant domain and the derived action is the actual partial operator. -/
def CommonInvariantDomain.applyWord {k : ℕ} (D : CommonInvariantDomain k H)
    (w : List (Fin k)) (x : D.carrier) : D.carrier :=
  w.foldr (fun i y => D.action i y) x

/-- The restriction to the common domain has the original operator's action. -/
def CommonInvariantDomain.restricted {k : ℕ} (D : CommonInvariantDomain k H)
    (i : Fin k) : H →ₗ.[ℂ] H :=
  ⟨D.carrier, D.carrier.subtype.comp (D.action i)⟩

/-- The quantitative hypothesis uses actual ordered words, operators, and vector.
UO-E03 requires this for every vector in the common dense invariant domain. -/
structure MixedWordAnalyticBound {k : ℕ} (D : CommonInvariantDomain k H)
    (x : D.carrier) (C R : ℝ) where
  C_pos : 0 < C
  R_pos : 0 < R
  bound : ∀ w : List (Fin k),
    ‖(D.applyWord w x : H)‖ ≤ C * R ^ w.length * (Nat.factorial w.length : ℝ)

/-- A dense invariant domain of analytic vectors for symmetric operators makes
all their restrictions essentially self-adjoint. Constants may depend on the vector. -/
theorem nelson_essential_selfAdjoint [CompleteSpace H] {k : ℕ}
    (D : CommonInvariantDomain k H)
    (hsym : ∀ i, (D.restricted i).IsFormalAdjoint (D.restricted i))
    (hbound : ∀ x : D.carrier, ∃ C R : ℝ, MixedWordAnalyticBound D x C R) :
    ∀ i, IsSelfAdjoint (D.restricted i).closure := by
  sorry

/-- Commuting symmetric restrictions with a common mixed-word analytic bound
have commuting bounded resolvents at every pair of nonreal parameters.
Each graph identity specifies an inverse of zI minus the corresponding closure;
self-adjointness makes the nonreal shifts injective, so these right inverses
are also left inverses. This is the resolvent formulation of strong commutation. -/
theorem nelson_resolvent_commute [CompleteSpace H] {k : ℕ}
    (D : CommonInvariantDomain k H)
    (hsym : ∀ i, (D.restricted i).IsFormalAdjoint (D.restricted i))
    (hcomm : ∀ i j, Commute (D.action i) (D.action j))
    (hbound : ∀ x : D.carrier, ∃ C R : ℝ, MixedWordAnalyticBound D x C R)
    (i j : Fin k) (z w : ℂ) (hz : z.im ≠ 0) (hw : w.im ≠ 0) :
    ∃ R S : H →L[ℂ] H,
      (∀ x : H, (R x, z • R x - x) ∈ (D.restricted i).closure.graph) ∧
      (∀ x : H, (S x, w • S x - x) ∈ (D.restricted j).closure.graph) ∧
      Commute R S := by
  sorry

end TauCetiRoadmap.UnboundedOperators
