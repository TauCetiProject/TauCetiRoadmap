/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.InnerProductSpace.LinearPMap
import TauCeti.LinearAlgebra.LinearPMap.SmulSub
import TauCetiRoadmap.OperatorTheory.SelfAdjointSpectralTheory.Suggested

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms only. The README is the definitive specification.
Unbounded operators use Mathlib `LinearPMap`; PVMs and their diagonal scalar measures
are the existing SAST prototype carriers. `sorry` records target signatures, not proofs.
-/

open MeasureTheory

namespace TauCetiRoadmap.UnboundedOperators

open TauCetiRoadmap.SelfAdjointSpectralTheory

/-- Bridge the `A + αI` convention to the native `cI - A` shift convention. -/
theorem surjective_neg_real_shift_iff
    {𝕜 H : Type*} [RCLike 𝕜] [NormedAddCommGroup H]
    [InnerProductSpace 𝕜 H] (A : H →ₗ.[𝕜] H) (α : ℝ) :
    Function.Surjective (A.smulSub ((-α : ℝ) : 𝕜)) ↔
      Function.Surjective (fun x : A.domain => A x + (α : 𝕜) • (x : H)) := by
  constructor
  · intro h y
    obtain ⟨x, hx⟩ := h (-y)
    change ((-α : ℝ) : 𝕜) • (x : H) - A x = -y at hx
    refine ⟨x, ?_⟩
    calc
      A x + (α : 𝕜) • (x : H) = - (((-α : ℝ) : 𝕜) • (x : H) - A x) := by
        simp [sub_eq_add_neg, add_comm]
      _ = y := by rw [hx]; simp
  · intro h y
    obtain ⟨x, hx⟩ := h (-y)
    change A x + (α : 𝕜) • (x : H) = -y at hx
    refine ⟨x, ?_⟩
    calc
      ((-α : ℝ) : 𝕜) • (x : H) - A x = -(A x + (α : 𝕜) • (x : H)) := by
        simp [sub_eq_add_neg, add_comm]
      _ = y := by rw [hx]; simp

/-- A real shift onto the ambient Hilbert space forces a densely defined
symmetric partial operator to be self-adjoint. The form construction also
provides a bounded inverse, which this criterion does not need to assume. -/
theorem isSelfAdjoint_of_surjective_real_shift
    {𝕜 H : Type*} [RCLike 𝕜] [NormedAddCommGroup H]
    [InnerProductSpace 𝕜 H] [CompleteSpace H]
    (A : H →ₗ.[𝕜] H) (hdense : Dense (A.domain : Set H))
    (hsym : A.IsFormalAdjoint A) (α : ℝ)
    (honto : Function.Surjective fun x : A.domain => A x + (α : 𝕜) • (x : H)) :
    IsSelfAdjoint A := by
  have hle : A ≤ A.adjoint := hsym.le_adjoint hdense
  have hdom : A.adjoint.domain ≤ A.domain := by
    intro y hy
    let y' : A.adjoint.domain := ⟨y, hy⟩
    obtain ⟨x, hx⟩ := honto (A.adjoint y' + (α : 𝕜) • y)
    have hxy : (x : H) = y := by
      apply ext_inner_right 𝕜
      intro w
      obtain ⟨z, rfl⟩ := honto w
      calc
        inner 𝕜 (x : H) (A z + (α : 𝕜) • (z : H)) =
            inner 𝕜 (A x + (α : 𝕜) • (x : H)) (z : H) := by
          simp only [inner_add_right, inner_add_left, inner_smul_left,
            inner_smul_right, RCLike.conj_ofReal, hsym x z]
        _ = inner 𝕜 (A.adjoint y' + (α : 𝕜) • y) (z : H) :=
          congrArg (fun w : H => inner 𝕜 w (z : H)) hx
        _ = inner 𝕜 y (A z + (α : 𝕜) • (z : H)) := by
          simp only [inner_add_right, inner_add_left, inner_smul_left,
            inner_smul_right, RCLike.conj_ofReal,
            A.adjoint_isFormalAdjoint hdense y' z, y']
    exact hxy ▸ x.property
  change A.adjoint = A
  exact (LinearPMap.eq_of_le_of_domain_eq hle (le_antisymm hle.1 hdom)).symm

/-- The native `cI - A` form of the real-shift criterion. -/
theorem isSelfAdjoint_of_surjective_neg_real_shift
    {𝕜 H : Type*} [RCLike 𝕜] [NormedAddCommGroup H]
    [InnerProductSpace 𝕜 H] [CompleteSpace H]
    (A : H →ₗ.[𝕜] H) (hdense : Dense (A.domain : Set H))
    (hsym : A.IsFormalAdjoint A) (α : ℝ)
    (honto : Function.Surjective (A.smulSub ((-α : ℝ) : 𝕜))) :
    IsSelfAdjoint A :=
  isSelfAdjoint_of_surjective_real_shift A hdense hsym α
    ((surjective_neg_real_shift_iff A α).mp honto)

section ClosedForms

variable {𝕜 H : Type*} [RCLike 𝕜] [NormedAddCommGroup H]
  [InnerProductSpace 𝕜 H] [CompleteSpace H]

/-- Representation of a complete shifted-coercive form domain, without compactness.
The scalar-generic graph equivalence specifies the operator domain and action in
the conjugate-linear-first convention. UO-D06 also proves the lower bound and
square-root form-domain identification; over ℝ the latter uses D06's actual
`realSpectralRestriction`, built from V2.3's Hilbert complexification, SA-E01's
complex PVM and the UO-A01 unbounded integral. -/
theorem existsUnique_selfAdjoint_of_closed_form
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

/-- The unique general represented operator of the closed form. Its graph is
the canonical domain-and-action specification consumed by compact specializations. -/
noncomputable def closedFormOperator
    {V : Type*} [NormedAddCommGroup V] [InnerProductSpace 𝕜 V] [CompleteSpace V]
    (j : V →L[𝕜] H) (hj : Function.Injective j) (hdense : DenseRange j)
    (q : V →L⋆[𝕜] V →L[𝕜] 𝕜)
    (hHermitian : ∀ u v, q u v = star (q v u))
    (α c : ℝ) (hc : 0 < c)
    (hcoercive : ∀ u, c * ‖u‖ ^ 2 ≤ RCLike.re (q u u) + α * ‖j u‖ ^ 2) : H →ₗ.[𝕜] H :=
  Classical.choose
    (existsUnique_selfAdjoint_of_closed_form j hj hdense q hHermitian α c hc hcoercive)

theorem closedFormOperator_spec
    {V : Type*} [NormedAddCommGroup V] [InnerProductSpace 𝕜 V] [CompleteSpace V]
    (j : V →L[𝕜] H) (hj : Function.Injective j) (hdense : DenseRange j)
    (q : V →L⋆[𝕜] V →L[𝕜] 𝕜)
    (hHermitian : ∀ u v, q u v = star (q v u))
    (α c : ℝ) (hc : 0 < c)
    (hcoercive : ∀ u, c * ‖u‖ ^ 2 ≤ RCLike.re (q u u) + α * ‖j u‖ ^ 2) :
    IsSelfAdjoint (closedFormOperator j hj hdense q hHermitian α c hc hcoercive) ∧
      ∀ x h : H, (x, h) ∈ (closedFormOperator j hj hdense q hHermitian α c hc hcoercive).graph ↔
        ∃ u : V, j u = x ∧ ∀ v : V, q u v = inner 𝕜 h (j v) :=
  (Classical.choose_spec
    (existsUnique_selfAdjoint_of_closed_form j hj hdense q hHermitian α c hc hcoercive)).1


/-- The represented partial operator depends only on its inclusion and form;
the quantitative shifted-coercivity witnesses do not change its graph. -/
theorem closedFormOperator_eq_of_witnesses
    {V : Type*} [NormedAddCommGroup V] [InnerProductSpace 𝕜 V] [CompleteSpace V]
    (j : V →L[𝕜] H) (hj : Function.Injective j) (hdense : DenseRange j)
    (q : V →L⋆[𝕜] V →L[𝕜] 𝕜)
    (hHermitian : ∀ u v, q u v = star (q v u))
    (α c β d : ℝ) (hc : 0 < c) (hd : 0 < d)
    (hα : ∀ u, c * ‖u‖ ^ 2 ≤ RCLike.re (q u u) + α * ‖j u‖ ^ 2)
    (hβ : ∀ u, d * ‖u‖ ^ 2 ≤ RCLike.re (q u u) + β * ‖j u‖ ^ 2) :
    closedFormOperator j hj hdense q hHermitian α c hc hα =
      closedFormOperator j hj hdense q hHermitian β d hd hβ := by
  exact (existsUnique_selfAdjoint_of_closed_form j hj hdense q hHermitian α c hc hα).unique
    (closedFormOperator_spec j hj hdense q hHermitian α c hc hα)
    (closedFormOperator_spec j hj hdense q hHermitian β d hd hβ)

end ClosedForms

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

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

omit [CompleteSpace H] in
/-- Ordered words act by composition on the same invariant domain. -/
theorem CommonInvariantDomain.applyWord_append {k : ℕ}
    (D : CommonInvariantDomain k H) (u v : List (Fin k)) (x : D.carrier) :
    D.applyWord (u ++ v) x = D.applyWord u (D.applyWord v x) := by
  simp only [CommonInvariantDomain.applyWord, List.foldr_append]

omit [CompleteSpace H] in
/-- Each head letter is the native partial operator on the actual domain. -/
theorem CommonInvariantDomain.applyWord_cons_coe {k : ℕ}
    (D : CommonInvariantDomain k H) (i : Fin k) (w : List (Fin k)) (x : D.carrier) :
    (D.applyWord (i :: w) x : H) =
      D.operators i ⟨(D.applyWord w x : H), D.domain_le i (D.applyWord w x).property⟩ := rfl

/-- The quantitative hypothesis uses actual ordered words, operators, and vector.
UO-E03 requires this for every vector in the common dense invariant domain. -/
structure MixedWordAnalyticBound {k : ℕ} (D : CommonInvariantDomain k H)
    (x : D.carrier) (C R : ℝ) where
  C_pos : 0 < C
  R_pos : 0 < R
  bound : ∀ w : List (Fin k),
    ‖(D.applyWord w x : H)‖ ≤ C * R ^ w.length * (Nat.factorial w.length : ℝ)

/-- The unbounded spectral integral uses the existing SAST PVM and diagonal measure.

Roadmap: UO-A01. -/
noncomputable def spectralIntegral (P : ProjValMeasure ℝ H) (f : ℝ → ℂ)
    (_hf : Measurable f) : H →ₗ.[ℂ] H := by
  sorry

/-- The integral has precisely the square-integrability domain from the spectral measure.

Roadmap: UO-A01. -/
theorem spectralIntegral_domain (P : ProjValMeasure ℝ H) (f : ℝ → ℂ)
    (hf : Measurable f) :
    (spectralIntegral P f hf).domain =
      {x : H | ∫⁻ t, ‖f t‖ₑ ^ 2 ∂P.diagMeasure x < ⊤} := by
  sorry

/-- Square-integrability gives a dense domain for a scalar spectral integral.

Roadmap: UO-A01. -/
theorem spectralIntegral_dense_domain (P : ProjValMeasure ℝ H) (f : ℝ → ℂ)
    (hf : Measurable f) : Dense ((spectralIntegral P f hf).domain : Set H) := by
  sorry

/-- The graph limit defining the unbounded spectral integral is closed.

Roadmap: UO-A01. -/
theorem spectralIntegral_isClosed (P : ProjValMeasure ℝ H) (f : ℝ → ℂ)
    (hf : Measurable f) : (spectralIntegral P f hf).IsClosed := by
  sorry

/-- The spectral integral norm is the second moment of its diagonal measure.

Roadmap: UO-A01. -/
theorem spectralIntegral_norm_sq (P : ProjValMeasure ℝ H) (f : ℝ → ℂ)
    (hf : Measurable f) (x : (spectralIntegral P f hf).domain) :
    ‖spectralIntegral P f hf x‖ ^ 2 =
      ∫ t, ‖f t‖ ^ 2 ∂P.diagMeasure (x : H) := by
  sorry

/-- Conjugating the symbol gives the adjoint, with equality of partial operators.

Roadmap: UO-A02. -/
theorem spectralIntegral_adjoint (P : ProjValMeasure ℝ H) (f : ℝ → ℂ)
    (hf : Measurable f) (hfc : Measurable fun t => star (f t)) :
    (spectralIntegral P f hf).adjoint =
      spectralIntegral P (fun t => star (f t)) hfc := by
  sorry

/-- Composition satisfies the spectral-moment identity on the stated domain, as targeted in UO-A03.

Roadmap: UO-A03. -/
theorem spectralIntegral_mul_apply (P : ProjValMeasure ℝ H)
    (f g : ℝ → ℂ) (hf : Measurable f) (hg : Measurable g) :
    ∀ (x : H) (hxg : x ∈ (spectralIntegral P g hg).domain)
      (hxf : x ∈ (spectralIntegral P (fun t => f t * g t) (hf.mul hg)).domain),
      ∃ hcomp : spectralIntegral P g hg ⟨x, hxg⟩ ∈ (spectralIntegral P f hf).domain,
        spectralIntegral P f hf ⟨spectralIntegral P g hg ⟨x, hxg⟩, hcomp⟩ =
          spectralIntegral P (fun t => f t * g t) (hf.mul hg) ⟨x, hxf⟩ := by
  sorry

/-- Pointwise multiplication on L² has the square-integrability domain.

This uses Mathlib's Lp carrier rather than introducing another Hilbert-space model.
Roadmap: UO-A07. -/
noncomputable def multiplicationOperator {X : Type*} [MeasurableSpace X]
    (μ : Measure X) (f : X → ℂ) (_hf : Measurable f) :
    MeasureTheory.Lp ℂ 2 μ →ₗ.[ℂ] MeasureTheory.Lp ℂ 2 μ := by
  sorry

/-- The domain of multiplication by f consists exactly of vectors for which fx is square
integrable. Equality is interpreted using Lp representatives, hence is independent of the
chosen almost-everywhere representative.

Roadmap: UO-A07. -/
theorem multiplicationOperator_domain {X : Type*} [MeasurableSpace X]
    (μ : Measure X) (f : X → ℂ) (hf : Measurable f) :
    (multiplicationOperator μ f hf).domain =
      {x : MeasureTheory.Lp ℂ 2 μ |
        ∫⁻ t, ‖f t * x t‖ₑ ^ 2 ∂μ < ⊤} := by
  sorry

/-- The real coordinate integral recovers the operator encoded by its PVM.

Roadmap: UO-A02. -/
theorem selfAdjoint_eq_spectralIntegral (A : H →ₗ.[ℂ] H)
    (hA : IsSelfAdjoint A) :
    A = spectralIntegral (spectralPVM A hA) (fun t => (t : ℂ))
      Complex.continuous_ofReal.measurable := by
  sorry

end TauCetiRoadmap.UnboundedOperators
