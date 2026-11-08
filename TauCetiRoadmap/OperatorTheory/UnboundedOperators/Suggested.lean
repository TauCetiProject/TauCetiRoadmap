/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Topology.Algebra.Module.LinearPMap.Resolvent.Basic

/-!
# Unbounded operators: target signatures

The roadmap is README.md; this file is not the roadmap. It states headline theorems
against the pinned APIs: maximal multiplication operators, the spectrum alternatives
of a closed symmetric operator through Tau Ceti's `LinearPMap.resolventSet`, the
closed-form representation, the existence of the Friedrichs extension, Nelson
essential self-adjointness and commutation of the closures' resolvents, and the
nonclosable integration counterexample on `L²(ℝ)` with its zero adjoint domain. The
Hilbert-basis cardinal classification used by the deficiency theory is BanachSpaceTheory
B5's `nonempty_linearIsometryEquiv_iff_lift_mk_eq` and is not restated here.

The unbounded spectral-integral, normal spectral, joint-PVM, spectral-type,
staircase-approximation and tensor spectral-calculus headlines cannot yet be stated
on their intended carriers: the pins have no normalized projection-valued-measure
carrier or unbounded spectral integral. The square-root form-domain identity and
real spectral restriction likewise require that integral and the supplier's Hilbert
complexification. Of the Friedrichs theorem only the existence of a self-adjoint
extension with the same lower bound is stated: its form-order extremality and the
form-domain identities need the form completion, which is not at the pins. The
singular-endpoint headlines need the minimal/maximal differential-operator
constructions. The analytic-perturbation spectral-branch headlines need the
spectral subspaces of a holomorphic family of type (A), and the geometric
Nelson-counterexample headlines (the completed translation surface, its genus and the
noncommuting Stone groups) need the translation-surface construction described in the
README; none of these is at the pins.
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

/-- Spectrum alternatives for a closed densely defined symmetric operator on a complex
Hilbert space: its resolvent set is empty, exactly the open lower half-plane, exactly
the open upper half-plane, or contains every nonreal point; and it is self-adjoint
exactly when every nonreal point is in its resolvent set. The self-adjointness criterion
is Teschl, Theorem 2.18; the alternative is proved from the half-plane constancy of the
deficiency dimensions (README §4.1, §4.2). -/
theorem resolventSet_alternatives_of_isClosed_symmetric
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (S : H →ₗ.[ℂ] H) (hdense : Dense (S.domain : Set H)) (hclosed : S.IsClosed)
    (hsym : S.IsFormalAdjoint S) :
    (S.resolventSet = ∅ ∨ S.resolventSet = {z : ℂ | z.im < 0} ∨
      S.resolventSet = {z : ℂ | 0 < z.im} ∨ {z : ℂ | z.im ≠ 0} ⊆ S.resolventSet) ∧
    (IsSelfAdjoint S ↔ {z : ℂ | z.im ≠ 0} ⊆ S.resolventSet) := by
  sorry

/-- Friedrichs extension, existence part: a densely defined symmetric partial operator
bounded below by `γ` has a self-adjoint extension with the same lower bound
(Teschl, Theorem 2.12). The order is graph inclusion of partial operators. -/
theorem friedrichs_exists_selfAdjoint_extension
    {𝕜 H : Type*} [RCLike 𝕜] [NormedAddCommGroup H] [InnerProductSpace 𝕜 H]
    [CompleteSpace H] (S : H →ₗ.[𝕜] H) (hdense : Dense (S.domain : Set H))
    (hsym : S.IsFormalAdjoint S) (γ : ℝ)
    (hγ : ∀ x : S.domain, γ * ‖(x : H)‖ ^ 2 ≤ RCLike.re (inner 𝕜 (S x) (x : H))) :
    ∃ T : H →ₗ.[𝕜] H, IsSelfAdjoint T ∧ S ≤ T ∧
      ∀ x : T.domain, γ * ‖(x : H)‖ ^ 2 ≤ RCLike.re (inner 𝕜 (T x) (x : H)) := by
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

section IntegralCounterexample

/-! The UO-E01 counterexample of README §5.1: integration on the integrable classes of
`L²(ℝ)` is a densely defined partial operator with values in `ℂ` that is not closable,
whose graph closure is everything and whose Hilbert adjoint has domain `{0}`. The
normalized interval indicators that witness this are a README Check and are not restated
here. -/

/-- Complex `L²(ℝ)` for Lebesgue measure, the carrier of the integration counterexample. -/
abbrev L2 : Type := Lp ℂ 2 (volume : Measure ℝ)

/-- Integration exists as a partial operator whose domain is exactly the integrable
classes and whose action is the Bochner integral there. -/
theorem exists_integralOperator :
    ∃ I : L2 →ₗ.[ℂ] ℂ,
      (∀ f : L2, f ∈ I.domain ↔ Integrable (f : ℝ → ℂ) volume) ∧
      (∀ f : I.domain, I f = ∫ x : ℝ, (f : L2) x) := by
  sorry

/-- Density of the domain, the full graph closure, the zero adjoint domain and
non-closability of any such integration operator (Jones, Exercises 12.1.11(ii), 12.1.15). -/
theorem integralOperator_counterexample
    (I : L2 →ₗ.[ℂ] ℂ)
    (hdom : ∀ f : L2, f ∈ I.domain ↔ Integrable (f : ℝ → ℂ) volume)
    (hact : ∀ f : I.domain, I f = ∫ x : ℝ, (f : L2) x) :
    Dense (I.domain : Set L2) ∧
      I.graph.topologicalClosure = ⊤ ∧
      I.adjoint.domain = ⊥ ∧ ¬I.IsClosable := by
  sorry

end IntegralCounterexample

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]

/-- A common dense invariant domain inside the actual partial-operator domains.
Graph-core density is a further theorem; dense invariance alone does not assert it. -/
structure CommonInvariantDomain (k : ℕ) (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] where
  /-- The partial operators, indexed by `Fin k`. -/
  operators : Fin k → H →ₗ.[ℂ] H
  /-- The common subspace. -/
  carrier : Submodule ℂ H
  /-- The common subspace is dense in `H`. -/
  dense : Dense (carrier : Set H)
  /-- The common subspace lies in the domain of every operator. -/
  domain_le : ∀ i, carrier ≤ (operators i).domain
  /-- Every operator maps the common subspace into itself. -/
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
  /-- The constant `C` is positive. -/
  C_pos : 0 < C
  /-- The radius constant `R` is positive. -/
  R_pos : 0 < R
  /-- Every ordered word of length `n` moves `x` to a vector of norm at most `C Rⁿ n!`. -/
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
have commuting bounded resolvents at every pair of nonreal parameters: each nonreal
parameter lies in the resolvent set of the corresponding closure, witnessed by Tau Ceti's
`LinearPMap.IsResolventAt`, and the two inverses commute. This is the resolvent
formulation of strong commutation. -/
theorem nelson_resolvent_commute [CompleteSpace H] {k : ℕ}
    (D : CommonInvariantDomain k H)
    (hsym : ∀ i, (D.restricted i).IsFormalAdjoint (D.restricted i))
    (hcomm : ∀ i j, Commute (D.action i) (D.action j))
    (hbound : ∀ x : D.carrier, ∃ C R : ℝ, MixedWordAnalyticBound D x C R)
    (i j : Fin k) (z w : ℂ) (hz : z.im ≠ 0) (hw : w.im ≠ 0) :
    ∃ R S : H →L[ℂ] H, LinearPMap.IsResolventAt (D.restricted i).closure z R ∧
      LinearPMap.IsResolventAt (D.restricted j).closure w S ∧ Commute R S := by
  sorry

end TauCetiRoadmap.UnboundedOperators
