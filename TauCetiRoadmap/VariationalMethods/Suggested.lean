import Mathlib

/-!
# Variational methods and constrained spectral theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
few definitions needed to state them: the compact form pair, its energy, its constrained spheres,
the form-domain part of the operator domain, the restricted differential operator and the
min–max value of a subspace.

The coercive solution maps of Layer 2.3 are UnboundedOperators UO-D06's theorem specialized to
a compact form pair, and the weak-closure counterexample of Layer 1.3 is a negative control:
both are README targets, not headlines, and are not stated here.

Headline theorems not statable at the pins, and what each lacks:

* the identification of Layer 5.1, "the operator of a compact form pair is UnboundedOperators
  UO-D06's `closedFormOperator`": that declaration is not in the pinned libraries. The
  compact-resolvent headline is therefore stated for every self-adjoint partial operator whose
  graph is the representing relation of the pair; UO-D06 supplies the existence and uniqueness
  of such an operator.
* the spectral-projection and resolvent-formula comparisons of Layer 5.2 (SelfAdjointSpectralTheory
  SA-E03 and SA-E05) and their real restriction through UO-D06: the spectral measure of an
  unbounded self-adjoint operator is not in the pinned libraries.
* the matrix form of the Ritz–Galerkin problem of Layer 6.1 (`A_m c = λ G_m c`) is README prose;
  its limit theorem is stated here through the min–max value.
-/

open Set TopologicalSpace Filter

namespace TauCetiRoadmap.VariationalMethods

/-! ## Layer 1: weak lower semicontinuity and the direct method -/

section DirectMethod

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- The topological direct method. On a reflexive Banach space (reflexivity is surjectivity of
the continuous bidual inclusion), a real energy that is weakly lower semicontinuous on a nonempty
weakly closed set with norm-bounded sublevels attains its infimum there. No lower bound on the
energy is assumed: the sublevel at the value of one admissible point is nonempty, bounded and
weakly closed, hence weakly compact. -/
theorem exists_isMinOn_of_weak_closed [CompleteSpace V]
    (E : V → ℝ) (S : Set V) (hne : S.Nonempty)
    (hreflexive : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ V))
    (hclosed : IsClosed (toWeakSpace ℝ V '' S))
    (hbounded_sublevels : ∀ b : ℝ, Bornology.IsBounded {u ∈ S | E u ≤ b})
    (hlsc : LowerSemicontinuousOn
      (fun w : WeakSpace ℝ V => E ((toWeakSpace ℝ V).symm w))
      (toWeakSpace ℝ V '' S)) :
    ∃ u ∈ S, IsMinOn E S u := by
  sorry

/-- The sequential direct method. On a reflexive Banach space, a real energy bounded below on a
sequentially weakly closed set, sequentially weakly lower semicontinuous there, attains its
infimum as soon as one norm-bounded minimizing sequence exists. The closure and semicontinuity
hypotheses are literal statements about weakly convergent sequences. -/
theorem exists_isMinOn_of_bounded_minimizing_sequence [CompleteSpace V]
    (E : V → ℝ) (S : Set V)
    (hreflexive : Function.Surjective (NormedSpace.inclusionInDoubleDual ℝ V))
    (hbelow : BddBelow (E '' S))
    (hseqclosed : ∀ (u : ℕ → V) (v : V), (∀ n, u n ∈ S) →
      Tendsto (fun n => toWeakSpace ℝ V (u n)) atTop (nhds (toWeakSpace ℝ V v)) → v ∈ S)
    (hseqlsc : ∀ (u : ℕ → V) (v : V) (r : ℝ), (∀ n, u n ∈ S) →
      Tendsto (fun n => toWeakSpace ℝ V (u n)) atTop (nhds (toWeakSpace ℝ V v)) →
      Tendsto (fun n => E (u n)) atTop (nhds r) → E v ≤ r)
    (u : ℕ → V) (hu : ∀ n, u n ∈ S)
    (hb : Bornology.IsBounded (Set.range u))
    (hminseq : Tendsto (fun n => E (u n)) atTop (nhds (sInf (E '' S)))) :
    ∃ v ∈ S, IsMinOn E S v := by
  sorry

/-- A compact operator is continuous from the weak topology to the norm topology on every
norm-bounded subset; the restriction to a bounded set is essential. -/
theorem compactMap_continuousOn_weak_bounded
    {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    (J : V →L[ℝ] F) (hc : IsCompactOperator J)
    (B : Set V) (hb : Bornology.IsBounded B) :
    ContinuousOn (fun w : WeakSpace ℝ V => J ((toWeakSpace ℝ V).symm w))
      (toWeakSpace ℝ V '' B) := by
  sorry

end DirectMethod

/-! ## Layer 3: compactly embedded form domains and admissible spheres -/

section FormPair

variable (𝕜 E H : Type*) [RCLike 𝕜]
  [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
  [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]

/-- A compact form pair: a form domain `E`, a Hilbert space `H`, an injective, dense, compact
inclusion `E → H` (not assumed to be a topological embedding), a bounded Hermitian form on `E`
(conjugate-linear in its first slot) and a quantitative shifted lower bound
`c‖u‖² ≤ Re a(u,u) + ω‖j u‖²` with `c > 0`. -/
structure CompactFormPair where
  /-- The form-domain inclusion `j : E → H`. -/
  inclusion : E →L[𝕜] H
  injective : Function.Injective inclusion
  dense : DenseRange inclusion
  compact : IsCompactOperator inclusion
  /-- The bounded Hermitian form `a`. -/
  form : E →L⋆[𝕜] E →L[𝕜] 𝕜
  hermitian : ∀ u v, form u v = star (form v u)
  /-- The coercivity constant `c`. -/
  coercivityConstant : ℝ
  coercivityConstant_pos : 0 < coercivityConstant
  /-- The shift `ω`. -/
  shift : ℝ
  shifted_lower_bound : ∀ u,
    coercivityConstant * ‖u‖ ^ 2 ≤ RCLike.re (form u u) + shift * ‖inclusion u‖ ^ 2

variable {𝕜 E H}

/-- The quadratic energy `q(u) = Re a(u,u)` of a compact form pair. -/
def CompactFormPair.energy (P : CompactFormPair 𝕜 E H) (u : E) : ℝ :=
  RCLike.re (P.form u u)

/-- The constrained sphere `S_W = {u | j u ∈ W, ‖j u‖ = 1}` of a submodule `W` of `H`. -/
def CompactFormPair.unitConstraint (P : CompactFormPair 𝕜 E H)
    (W : Submodule 𝕜 H) : Set E :=
  {u | P.inclusion u ∈ W ∧ ‖P.inclusion u‖ = 1}

/-- The constrained Rayleigh minimum: on the sphere of a closed submodule `W` of `H` that
contains a nonzero form-domain image, the energy attains its minimum. Compactness is used on
bounded minimizing sequences and energy sublevels; the sphere itself is not weakly closed. -/
theorem CompactFormPair.exists_minimum_on_unitConstraint
    (P : CompactFormPair 𝕜 E H) (W : Submodule 𝕜 H) (hW : IsClosed (W : Set H))
    (hne : ∃ u : E, P.inclusion u ∈ W ∧ P.inclusion u ≠ 0) :
    ∃ u ∈ P.unitConstraint W, IsMinOn P.energy (P.unitConstraint W) u := by
  sorry

/-- The restricted Euler–Lagrange equation of a sphere minimizer: `a(u,v) = q(u)⟨j u, j v⟩` for
every form-domain `v` with `j v ∈ W`. Over `ℂ` the direction `I • v` is tested as well. -/
theorem CompactFormPair.equation_of_constrained_minimum
    (P : CompactFormPair 𝕜 E H) (W : Submodule 𝕜 H) (u : E)
    (hu : u ∈ P.unitConstraint W)
    (hmin : IsMinOn P.energy (P.unitConstraint W) u) :
    ∀ v : E, P.inclusion v ∈ W →
      P.form u v = (P.energy u : 𝕜) * inner 𝕜 (P.inclusion u) (P.inclusion v) := by
  sorry

/-! ## Layer 4: successive minima, completeness and min–max -/

/-- Successive Rayleigh minima of an infinite-dimensional compact form pair: a Hilbert basis of
`H` of form-domain eigenvectors with nondecreasing eigenvalues tending to `+∞`, each satisfying
its full weak eigen-equation (Ivrii §13.1, Theorem 4; Hunter, Theorem 4.25). -/
theorem CompactFormPair.exists_ordered_eigenbasis
    (P : CompactFormPair 𝕜 E H) (hinf : ¬ FiniteDimensional 𝕜 H) :
    ∃ (b : HilbertBasis ℕ 𝕜 H) (u : ℕ → E) (eigenvalue : ℕ → ℝ),
      (∀ n, P.inclusion (u n) = b n) ∧ Monotone eigenvalue ∧
      Tendsto eigenvalue atTop atTop ∧
      ∀ n v, P.form (u n) v = (eigenvalue n : 𝕜) * inner 𝕜 (b n) (P.inclusion v) := by
  sorry

/-- The `n`-th min–max value of a subspace `L` of the form domain: the infimum, over
`(n+1)`-dimensional subspaces `M ≤ L`, of the supremum of the Rayleigh quotient
`q(u)/‖j u‖²` over nonzero `u ∈ M`. When `L` has dimension at most `n` the set is empty and the
value is the junk value `0` of `sInf`. -/
noncomputable def CompactFormPair.rayleighMinMax (P : CompactFormPair 𝕜 E H)
    (L : Submodule 𝕜 E) (n : ℕ) : ℝ :=
  sInf {s : ℝ | ∃ M : Submodule 𝕜 E, M ≤ L ∧ Module.finrank 𝕜 M = n + 1 ∧
    s = sSup {r : ℝ | ∃ u ∈ M, u ≠ 0 ∧ r = P.energy u / ‖P.inclusion u‖ ^ 2}}

/-- Courant–Fischer on the form domain: for a Hilbert basis of form-domain eigenvectors with
nondecreasing eigenvalues, the `n`-th eigenvalue is the min–max value of the whole form domain
(Ivrii §13.1, Corollary 1, with `n` obstacle vectors replaced by the first `n`). -/
theorem CompactFormPair.eigenvalue_eq_rayleighMinMax
    (P : CompactFormPair 𝕜 E H)
    (b : HilbertBasis ℕ 𝕜 H) (u : ℕ → E) (eigenvalue : ℕ → ℝ)
    (hb : ∀ n, P.inclusion (u n) = b n) (hmono : Monotone eigenvalue)
    (heq : ∀ n v, P.form (u n) v = (eigenvalue n : 𝕜) * inner 𝕜 (b n) (P.inclusion v))
    (n : ℕ) :
    eigenvalue n = P.rayleighMinMax ⊤ n := by
  sorry

/-! ## Layer 5: the represented operator and the differential-energy adapter -/

/-- The form-domain vectors whose forcing has an `H` representative: `u` with
`a(u,v) = ⟨f, j v⟩` for all `v` and some `f : H`. Their images `j u` form the domain of the
represented operator, which acts by `j u ↦ f`. -/
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

/-- Compact resolvent of the represented operator. For every self-adjoint partial operator `A`
whose graph is the representing relation of the pair (UO-D06's operator; existence and
uniqueness are consumed), and every shift `α ≥ ω`, the operator `A + α` has a bounded compact
self-adjoint two-sided inverse `S_α = (A+α)⁻¹ = −R_A(−α)` on `H`
(Hunter §4.8 and Theorem 4.25). -/
theorem CompactFormPair.exists_compact_selfAdjoint_shifted_inverse
    (P : CompactFormPair 𝕜 E H) (A : H →ₗ.[𝕜] H)
    (hA : ∀ x f : H, (x, f) ∈ A.graph ↔
      ∃ u : E, P.inclusion u = x ∧ ∀ v : E, P.form u v = inner 𝕜 f (P.inclusion v))
    (α : ℝ) (hα : P.shift ≤ α) :
    ∃ S : H →L[𝕜] H, IsCompactOperator S ∧ IsSelfAdjoint S ∧
      (∀ h : H, ∃ hS : S h ∈ A.domain, A ⟨S h, hS⟩ + (α : 𝕜) • S h = h) ∧
      ∀ x : A.domain, S (A x + (α : 𝕜) • (x : H)) = x := by
  sorry

/-- Domain expansion: for a Hilbert basis of form-domain eigenvectors, a form-domain vector `w`
has an `H`-represented forcing exactly when `Σ λₙ² |⟨bₙ, j w⟩|² < ∞`, the representative being
`Σ λₙ ⟨bₙ, j w⟩ bₙ`. -/
theorem CompactFormPair.mem_operatorDomainV_iff_summable
    (P : CompactFormPair 𝕜 E H)
    (b : HilbertBasis ℕ 𝕜 H) (u : ℕ → E) (eigenvalue : ℕ → ℝ)
    (hb : ∀ n, P.inclusion (u n) = b n)
    (heq : ∀ n v, P.form (u n) v = (eigenvalue n : 𝕜) * inner 𝕜 (b n) (P.inclusion v))
    (w : E) :
    w ∈ P.operatorDomainV ↔
      Summable (fun n => eigenvalue n ^ 2 * ‖inner 𝕜 (b n) (P.inclusion w)‖ ^ 2) := by
  sorry

/-- The spectrum of the represented operator is exactly the eigenvalue sequence: for every
self-adjoint partial operator whose graph is the representing relation and every Hilbert basis
of form-domain eigenvectors with eigenvalues tending to `+∞`, the shift `z•I − A` has a bounded
two-sided inverse on `H` (membership of `z` in Tau Ceti's `resolventSet`, unfolded) iff `z` is
none of the eigenvalues. -/
theorem CompactFormPair.mem_resolventSet_iff
    (P : CompactFormPair 𝕜 E H) (A : H →ₗ.[𝕜] H)
    (hA : ∀ x f : H, (x, f) ∈ A.graph ↔
      ∃ u : E, P.inclusion u = x ∧ ∀ v : E, P.form u v = inner 𝕜 f (P.inclusion v))
    (b : HilbertBasis ℕ 𝕜 H) (u : ℕ → E) (eigenvalue : ℕ → ℝ)
    (hb : ∀ n, P.inclusion (u n) = b n)
    (htend : Tendsto eigenvalue atTop atTop)
    (heq : ∀ n v, P.form (u n) v = (eigenvalue n : 𝕜) * inner 𝕜 (b n) (P.inclusion v))
    (z : 𝕜) :
    (∃ R : H →L[𝕜] H, (∀ x : A.domain, R (z • (x : H) - A x) = x) ∧
        ∀ y : H, ∃ hy : R y ∈ A.domain, z • R y - A ⟨R y, hy⟩ = y) ↔
      ∀ n, z ≠ (eigenvalue n : 𝕜) := by
  sorry

/-- The first-order factor `D₀` of a differential energy: the bounded map `D : E → K` regarded
as a partial operator on `H` with domain `range j`, acting by `j u ↦ D u`. -/
noncomputable def CompactFormPair.differentialOperator (P : CompactFormPair 𝕜 E H)
    {K : Type*} [NormedAddCommGroup K] [InnerProductSpace 𝕜 K] (D : E →L[𝕜] K) :
    H →ₗ.[𝕜] K where
  domain := LinearMap.range P.inclusion.toLinearMap
  toFun := D.toLinearMap ∘ₗ
    (LinearEquiv.ofInjective P.inclusion.toLinearMap P.injective).symm.toLinearMap

/-- The differential-energy adapter. If `a(u,v) = ⟨D u, D v⟩`, then a form-domain vector has an
`H`-represented forcing exactly when `D u` lies in the domain of the native partial adjoint
`D₀†`, and then the representative is `D₀†(D u)`: the represented operator is the restricted
composite `D₀† D₀`. -/
theorem CompactFormPair.mem_operatorDomainV_iff_mem_adjoint_domain
    (P : CompactFormPair 𝕜 E H)
    {K : Type*} [NormedAddCommGroup K] [InnerProductSpace 𝕜 K] (D : E →L[𝕜] K)
    (hD : ∀ u v, P.form u v = inner 𝕜 (D u) (D v)) (u : E) :
    (u ∈ P.operatorDomainV ↔ D u ∈ (P.differentialOperator D).adjoint.domain) ∧
      ∀ hu : D u ∈ (P.differentialOperator D).adjoint.domain, ∀ v : E,
        P.form u v = inner 𝕜 ((P.differentialOperator D).adjoint ⟨D u, hu⟩) (P.inclusion v) := by
  sorry

/-! ## Layer 6: Ritz–Galerkin approximation -/

/-- Ritz–Galerkin convergence: along nested finite-dimensional subspaces of the form domain with
dense union, the `n`-th min–max value (the `n`-th Ritz value) converges to the `n`-th eigenvalue
of any Hilbert basis of form-domain eigenvectors with nondecreasing eigenvalues. -/
theorem CompactFormPair.tendsto_rayleighMinMax
    (P : CompactFormPair 𝕜 E H)
    (b : HilbertBasis ℕ 𝕜 H) (u : ℕ → E) (eigenvalue : ℕ → ℝ)
    (hb : ∀ n, P.inclusion (u n) = b n) (hmono : Monotone eigenvalue)
    (heq : ∀ n v, P.form (u n) v = (eigenvalue n : 𝕜) * inner 𝕜 (b n) (P.inclusion v))
    (Vm : ℕ → Submodule 𝕜 E) (hVm : Monotone Vm)
    (hfin : ∀ m, FiniteDimensional 𝕜 (Vm m))
    (hdense : Dense (⋃ m, (Vm m : Set E))) (n : ℕ) :
    Tendsto (fun m => P.rayleighMinMax (Vm m) n) atTop (nhds (eigenvalue n)) := by
  sorry

end FormPair

end TauCetiRoadmap.VariationalMethods
