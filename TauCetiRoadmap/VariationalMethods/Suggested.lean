import Mathlib.Analysis.LocallyConvex.WeakSpace
import Mathlib.Analysis.Normed.Module.DoubleDual
import Mathlib.Analysis.InnerProductSpace.Adjoint
import Mathlib.Analysis.Normed.Operator.Compact.Basic
import Mathlib.Topology.Semicontinuity.Basic
import Mathlib.Analysis.InnerProductSpace.LinearPMap
import Mathlib.Analysis.InnerProductSpace.l2Space
import TauCetiRoadmap.OperatorTheory.UnboundedOperators.Suggested

/-!
**This file is not the roadmap and is not exhaustive.**

The README is the authoritative specification; these declarations are representative
interfaces, and proving them does not by itself complete the roadmap. These use actual
continuous biduals, native weak spaces, CLMs and bounded sesquilinear forms.
Existing real coercive-form solutions and Rayleigh results are consumed directly
as explained there, rather than being declared again as new targets.
-/

open Set TopologicalSpace

namespace VariationalMethodsSuggested

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V] [CompleteSpace V]

/-- The globally weakly closed version. V1 also specifies the weaker sequential
version, which is required for the full compactly embedded unit sphere. -/
theorem exists_isMinOn_of_weak_closed
    (E : V → ℝ) (S : Set V) (hne : S.Nonempty)
    (hreflexive : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ V))
    (hclosed : IsClosed (toWeakSpace ℝ V '' S))
    (hbelow : BddBelow (E '' S))
    (hbounded_sublevels : ∀ b : ℝ, Bornology.IsBounded {u ∈ S | E u ≤ b})
    (hlsc : LowerSemicontinuousOn
      (fun w : WeakSpace ℝ V => E ((toWeakSpace ℝ V).symm w))
      (toWeakSpace ℝ V '' S)) :
    ∃ u ∈ S, IsMinOn E S u := by
  sorry

/-- Sequential direct method on a bounded minimizing sequence. The sequence
closure and lsc hypotheses are literal weak convergence statements. -/
theorem exists_isMinOn_of_bounded_minimizing_sequence
    (E : V → ℝ) (S : Set V)
    (hreflexive : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ V))
    (hbelow : BddBelow (E '' S))
    (hseqclosed : ∀ (u : ℕ → V) (v : V), (∀ n, u n ∈ S) →
      Filter.Tendsto (fun n => toWeakSpace ℝ V (u n)) Filter.atTop
        (nhds (toWeakSpace ℝ V v)) → v ∈ S)
    (hseqlsc : ∀ (u : ℕ → V) (v : V) (r : ℝ), (∀ n, u n ∈ S) →
      Filter.Tendsto (fun n => toWeakSpace ℝ V (u n)) Filter.atTop
        (nhds (toWeakSpace ℝ V v)) →
      Filter.Tendsto (fun n => E (u n)) Filter.atTop (nhds r) → E v ≤ r)
    (u : ℕ → V) (hu : ∀ n, u n ∈ S)
    (hb : Bornology.IsBounded (Set.range u))
    (hminseq : Filter.Tendsto (fun n => E (u n)) Filter.atTop (nhds (sInf (E '' S)))) :
    ∃ v ∈ S, IsMinOn E S v := by
  sorry

/-- Weak-to-norm continuity is restricted to a bounded subset. -/
theorem compactMap_continuousOn_weak_bounded
    {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    (J : V →L[ℝ] F) (hc : IsCompactOperator J)
    (B : Set V) (hb : Bornology.IsBounded B) :
    ContinuousOn (fun w : WeakSpace ℝ V => J ((toWeakSpace ℝ V).symm w))
      (toWeakSpace ℝ V '' B) := by
  sorry

/-- The finite-functional-kernel counterexample is global, even when the
embedding is compact; zero is in the weak closure of its unit sphere. -/
theorem zero_mem_weak_closure_embedded_unitSphere
    {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    (J : V →L[ℝ] F) (hinj : Function.Injective J)
    (hinf : ¬ FiniteDimensional ℝ V) :
    toWeakSpace ℝ V 0 ∈ closure (toWeakSpace ℝ V '' {u | ‖J u‖ = 1}) := by
  sorry

section FormPair

variable (𝕜 E H : Type*) [RCLike 𝕜]
  [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
  [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]

/-- A compactly embedded form domain. The inclusion is injective and dense,
but is deliberately not asserted to be a topological embedding. -/
structure CompactFormPair where
  inclusion : E →L[𝕜] H
  injective : Function.Injective inclusion
  dense : DenseRange inclusion
  compact : IsCompactOperator inclusion
  form : E →L⋆[𝕜] E →L[𝕜] 𝕜
  hermitian : ∀ u v, form u v = star (form v u)
  coercivityConstant : ℝ
  coercivityConstant_pos : 0 < coercivityConstant
  shift : ℝ
  shifted_lower_bound : ∀ u,
    coercivityConstant * ‖u‖ ^ 2 ≤ RCLike.re (form u u) + shift * ‖inclusion u‖ ^ 2

variable {𝕜 E H}

def CompactFormPair.energy (P : CompactFormPair 𝕜 E H) (u : E) : ℝ :=
  RCLike.re (P.form u u)

def CompactFormPair.unitConstraint (P : CompactFormPair 𝕜 E H)
    (W : Submodule 𝕜 H) : Set E :=
  {u | P.inclusion u ∈ W ∧ ‖P.inclusion u‖ = 1}

/-- Compactness is used on bounded minimizing sequences/sublevels, without a
false claim that the complete sphere is globally weakly closed. -/
theorem CompactFormPair.exists_minimum_on_unitConstraint
    (P : CompactFormPair 𝕜 E H) (W : Submodule 𝕜 H) (hW : IsClosed (W : Set H))
    (hne : ∃ u : E, P.inclusion u ∈ W ∧ P.inclusion u ≠ 0) :
    ∃ u ∈ P.unitConstraint W, IsMinOn P.energy (P.unitConstraint W) u := by
  sorry

/-- The equation belongs initially to the restricted form. The full equation
for successive minima is extended using preceding eigenvectors. -/
theorem CompactFormPair.equation_of_constrained_minimum
    (P : CompactFormPair 𝕜 E H) (W : Submodule 𝕜 H) (u : E)
    (hu : u ∈ P.unitConstraint W)
    (hmin : IsMinOn P.energy (P.unitConstraint W) u) :
    ∀ v : E, P.inclusion v ∈ W →
      P.form u v = (P.energy u : 𝕜) * inner 𝕜 (P.inclusion u) (P.inclusion v) := by
  sorry

/-- H forcing is linear; dual forcing is conjugate linear for the first-slot
conjugate-linear form convention. -/
theorem CompactFormPair.exists_shifted_solution_maps
    (P : CompactFormPair 𝕜 E H) (α : ℝ) (hα : P.shift ≤ α) :
    ∃ (S : H →L[𝕜] E) (F : StrongDual 𝕜 E →L⋆[𝕜] E),
      (∀ h v, P.form (S h) v + (α : 𝕜) * inner 𝕜 (P.inclusion (S h)) (P.inclusion v) =
        inner 𝕜 h (P.inclusion v)) ∧
      (∀ ℓ v, P.form (F ℓ) v + (α : 𝕜) * inner 𝕜 (P.inclusion (F ℓ)) (P.inclusion v) = ℓ v) := by
  sorry

/-- The compact-pair operator is exactly UO-D06's named general form operator,
instantiated with this pair's form and shift. The D06 graph theorem supplies its
actual domain, action, symmetry and self-adjointness. -/
noncomputable def CompactFormPair.operator (P : CompactFormPair 𝕜 E H) : H →ₗ.[𝕜] H :=
  TauCetiRoadmap.UnboundedOperators.closedFormOperator
    P.inclusion P.injective P.dense P.form P.hermitian P.shift
    P.coercivityConstant P.coercivityConstant_pos P.shifted_lower_bound

theorem CompactFormPair.operator_spec (P : CompactFormPair 𝕜 E H) :
    IsSelfAdjoint P.operator ∧
      ∀ x h : H, (x, h) ∈ P.operator.graph ↔
        ∃ u : E, P.inclusion u = x ∧
          ∀ v : E, P.form u v = inner 𝕜 h (P.inclusion v) := by
  exact TauCetiRoadmap.UnboundedOperators.closedFormOperator_spec
    P.inclusion P.injective P.dense P.form P.hermitian P.shift
    P.coercivityConstant P.coercivityConstant_pos P.shifted_lower_bound

/-- The form-domain submodule has an actual H representative of its forcing. -/
def CompactFormPair.operatorDomainV (P : CompactFormPair 𝕜 E H) : Submodule 𝕜 E where
  carrier := {u | ∃ f : H, ∀ v : E, P.form u v = inner 𝕜 f (P.inclusion v)}
  zero_mem' := by
    refine ⟨0, ?_⟩
    simp
  add_mem' := by
    rintro u w ⟨f, hf⟩ ⟨g, hg⟩
    refine ⟨f + g, ?_⟩
    intro v
    simp [map_add, hf, hg, inner_add_left]
  smul_mem' := by
    rintro c u ⟨f, hf⟩
    refine ⟨c • f, ?_⟩
    intro v
    simp [hf, inner_smul_left]

def CompactFormPair.operatorDomain (P : CompactFormPair 𝕜 E H) : Submodule 𝕜 H :=
  P.operatorDomainV.map P.inclusion.toLinearMap

theorem CompactFormPair.operator_domain (P : CompactFormPair 𝕜 E H) :
    P.operator.domain = P.operatorDomain := by
  ext x
  constructor
  · intro hx
    obtain ⟨u, hux, hu⟩ := (P.operator_spec.2 x (P.operator ⟨x, hx⟩)).1
      (P.operator.mem_graph ⟨x, hx⟩)
    exact ⟨u, ⟨P.operator ⟨x, hx⟩, hu⟩, hux⟩
  · rintro ⟨u, ⟨h, hu⟩, hux⟩
    have hg : (x, h) ∈ P.operator.graph := (P.operator_spec.2 x h).2 ⟨u, hux, hu⟩
    obtain ⟨y, hy, _⟩ := P.operator.mem_graph_iff.mp hg
    have hyx : (y : H) = x := hy
    rw [← hyx]
    exact y.property

/-- Actual domain of the restricted adjoint product, not total-range composition. -/
noncomputable def adjointProductDomain {K : Type*} [NormedAddCommGroup K] [InnerProductSpace 𝕜 K]
    [CompleteSpace K] (D : H →ₗ.[𝕜] K) : Submodule 𝕜 H :=
  (D.adjoint.domain.comap D.toFun).map D.domain.subtype

theorem exists_restricted_adjointProduct {K : Type*} [NormedAddCommGroup K]
    [InnerProductSpace 𝕜 K] [CompleteSpace K] (D : H →ₗ.[𝕜] K) :
    ∃ A : H →ₗ.[𝕜] H, A.domain = adjointProductDomain D ∧
      ∀ (x : A.domain) (y : D.domain), (y : H) = (x : H) →
        ∃ hy : D y ∈ D.adjoint.domain, A x = D.adjoint ⟨D y, hy⟩ := by
  sorry

/-- Infinite-dimensional ordered construction. Finite dimension, including
zero, has the separate finite-family specification in V4.1. -/
theorem CompactFormPair.exists_ordered_eigenbasis
    (P : CompactFormPair 𝕜 E H) (hinf : ¬ FiniteDimensional 𝕜 H) :
    ∃ (b : HilbertBasis ℕ 𝕜 H) (u : ℕ → E) (eigenvalue : ℕ → ℝ),
      (∀ n, P.inclusion (u n) = b n) ∧ Monotone eigenvalue ∧
      Filter.Tendsto eigenvalue Filter.atTop Filter.atTop ∧
      ∀ n v, P.form (u n) v = (eigenvalue n : 𝕜) * inner 𝕜 (b n) (P.inclusion v) := by
  sorry

end FormPair

end VariationalMethodsSuggested
