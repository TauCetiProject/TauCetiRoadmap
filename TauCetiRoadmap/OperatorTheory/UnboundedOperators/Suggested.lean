/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Topology.Algebra.Module.LinearPMap.Resolvent.Basic
import TauCeti.Analysis.InnerProductSpace.ProjValMeasure.MatrixElement

/-!
# Unbounded operators: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs. Projection-valued measures are Tau Ceti's
`TauCeti.ProjValMeasure`, with diagonal measures `diag` and polarized complex measures
`polarizedComplexMeasure`; resolvents are Tau Ceti's `LinearPMap.resolventSet` and
`LinearPMap.resolvent`; completed Hilbert tensor products are completions of Mathlib's
inner-product tensor product. Stated here: the unbounded spectral integral of a measurable
symbol against a normalized projection-valued measure on any measurable space, with its
adjoint; the maximal multiplication operator; the spectral theorem for a normal partial
operator; the joint projection-valued measure of finitely many strongly commuting
self-adjoint operators; the multiparameter Stone theorem; the spectral-type decomposition of
a real projection-valued measure; the spectrum alternatives of a closed symmetric operator;
the closed-form representation; the Friedrichs extension with its extremal property in
resolvent order; the nonclosable integration counterexample on `L²(ℝ)`; Nelson's essential
self-adjointness and commutation theorem; and the self-adjoint closures of tensor sums and
tensor products with their spectra. The Hilbert-basis cardinal classification used by the
deficiency theory is BanachSpaceTheory B5's `nonempty_linearIsometryEquiv_iff_lift_mk_eq` and
is not restated here.

Not statable at the pins: every headline about the spectral measure `P_A` of a given
self-adjoint partial operator, which is SelfAdjointSpectralTheory SA-E01 and not at the pins.
This covers the Borel calculus `f(A)` and its representation of `A` (README §§1.2–1.8), the
equivalent forms of strong commutation (§2.3), the spectral-projection form of the essential
spectrum (§3.2), the staircase approximation (§3.4), the diagonal spectrum realization (§3.5),
the square-root form-domain identity (§4.7), the identification of the tensor closures with
joint spectral integrals and their unitary groups (§§6.2–6.3); the real spectral restriction
(§4.7) needs in addition GeneralizedCohomology's Hilbert complexification
`RealHilbertComplexification`. The singular-endpoint headlines need the minimal and maximal
Sturm–Liouville operators (§4.8). The analytic-perturbation spectral-branch headlines need the
spectral subspaces of a holomorphic family of type (A) (§5.5), and the geometric
Nelson-counterexample headlines (the completed translation surface, its genus and the
noncommuting Stone groups, §§2.3–2.4) need the translation-surface construction described in
the README; none of these is at the pins.
-/

open MeasureTheory
open scoped InnerProductSpace ENNReal Pointwise TensorProduct

namespace TauCetiRoadmap.UnboundedOperators

/-! ## Layer 1: unbounded Borel calculus and spectral correspondences -/

/-- The unbounded spectral integral (README §1.1–§1.2, UO-A01–UO-A02). For a normalized
projection-valued measure `P` on a measurable space and a measurable symbol `f`, there is
exactly one partial operator whose domain is the second-moment subspace
`{x | ∫ |f|² d(P.diag x) < ∞}` and whose matrix elements are the integrals of `f` against the
polarized measures. It is densely defined and closed, its norm square is the second moment,
and its Hilbert adjoint has the same domain and the matrix elements of `conj f` (Teschl,
Theorem 3.2 and (3.25)–(3.29)). -/
theorem existsUnique_spectralIntegral {X H : Type*} [MeasurableSpace X]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (P : TauCeti.ProjValMeasure X H) (f : X → ℂ) (hf : Measurable f) :
    ∃! T : H →ₗ.[ℂ] H,
      (∀ x : H, x ∈ T.domain ↔ ∫⁻ t, ‖f t‖ₑ ^ 2 ∂(P.diag x) < ∞) ∧
      (∀ (x : T.domain) (y : H),
        ⟪y, T x⟫_ℂ = ∫ᵛ t, f t ∂[ContinuousLinearMap.mul ℝ ℂ; P.polarizedComplexMeasure y x]) ∧
      Dense (T.domain : Set H) ∧ T.IsClosed ∧
      (∀ x : T.domain, ‖T x‖ ^ 2 = ∫ t, ‖f t‖ ^ 2 ∂(P.diag x)) ∧
      T.adjoint.domain = T.domain ∧
      (∀ (x : T.adjoint.domain) (y : H),
        ⟪y, T.adjoint x⟫_ℂ =
          ∫ᵛ t, star (f t) ∂[ContinuousLinearMap.mul ℝ ℂ; P.polarizedComplexMeasure y x]) := by
  sorry


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

/-! ## Layer 2: normal operators and joint spectral theory -/

/-- Spectral theorem for a normal partial operator (README §2.2, UO-B02): a closed densely
defined `N` with `dom N* = dom N` and `‖N x‖ = ‖N* x‖` there is the spectral integral of the
coordinate `z` against exactly one normalized projection-valued measure on `ℂ`, with domain the
second-moment subspace. -/
theorem existsUnique_projValMeasure_of_normal {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (N : H →ₗ.[ℂ] H) (hdense : Dense (N.domain : Set H)) (hclosed : N.IsClosed)
    (hdom : N.adjoint.domain = N.domain)
    (hnorm : ∀ x : N.domain, ‖N x‖ = ‖N.adjoint ⟨(x : H), by rw [hdom]; exact x.2⟩‖) :
    ∃! P : TauCeti.ProjValMeasure ℂ H,
      (∀ x : H, x ∈ N.domain ↔ ∫⁻ z, ‖z‖ₑ ^ 2 ∂(P.diag x) < ∞) ∧
      ∀ (x : N.domain) (y : H),
        ⟪y, N x⟫_ℂ = ∫ᵛ z, z ∂[ContinuousLinearMap.mul ℝ ℂ; P.polarizedComplexMeasure y x] := by
  sorry

/-- Joint projection-valued measure (README §2.5, UO-B04): finitely many self-adjoint
partial operators whose resolvents at `i` commute pairwise are the coordinate spectral
integrals of exactly one normalized projection-valued measure on `ℝⁿ`. Commuting resolvents
at `i` is strong commutation (Teschl, (4.24)), using Fuglede's theorem for the conjugate
parameter. -/
theorem existsUnique_jointProjValMeasure {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H] {n : ℕ}
    (A : Fin n → H →ₗ.[ℂ] H) (hA : ∀ j, IsSelfAdjoint (A j))
    (hcomm : ∀ j k, Commute ((A j).resolvent Complex.I) ((A k).resolvent Complex.I)) :
    ∃! P : TauCeti.ProjValMeasure (Fin n → ℝ) H, ∀ j,
      (∀ x : H, x ∈ (A j).domain ↔ ∫⁻ t, ‖((t j : ℝ) : ℂ)‖ₑ ^ 2 ∂(P.diag x) < ∞) ∧
      ∀ (x : (A j).domain) (y : H),
        ⟪y, A j x⟫_ℂ =
          ∫ᵛ t, ((t j : ℝ) : ℂ) ∂[ContinuousLinearMap.mul ℝ ℂ; P.polarizedComplexMeasure y x] := by
  sorry

/-- Multiparameter Stone theorem (README §2.6, UO-B05): a strongly continuous unitary
representation `U` of `ℝⁿ` is `U(t) = ∫ exp(i Σ tⱼ sⱼ) dP(s)` for exactly one normalized
projection-valued measure `P` on `ℝⁿ`, in the convention `U(t) = exp(i Σ tⱼ Aⱼ)`. -/
theorem existsUnique_projValMeasure_of_unitary_representation {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H] {n : ℕ}
    (U : (Fin n → ℝ) → H →L[ℂ] H) (hunit : ∀ t, U t ∈ unitary (H →L[ℂ] H))
    (hadd : ∀ s t, U (s + t) = U s * U t) (hcont : ∀ x : H, Continuous fun t => U t x) :
    ∃! P : TauCeti.ProjValMeasure (Fin n → ℝ) H, ∀ (t : Fin n → ℝ) (x y : H),
      ⟪y, U t x⟫_ℂ = ∫ᵛ s, Complex.exp (Complex.I * ∑ j, ((t j * s j : ℝ) : ℂ))
        ∂[ContinuousLinearMap.mul ℝ ℂ; P.polarizedComplexMeasure y x] := by
  sorry

/-! ## Layer 3: spectrum, spectral types, and pure-point approximation -/

/-- Spectral-type decomposition (README §3.3, UO-C03): for a normalized projection-valued
measure on `ℝ`, the vectors whose diagonal measure is pure point, absolutely continuous, or
singular continuous form three closed, mutually orthogonal subspaces, invariant under every
spectral projection, whose sum is the whole space (Teschl, (3.83) and Lemma 3.19). No
separability and no finite control measure is assumed. -/
theorem exists_spectralType_decomposition {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (P : TauCeti.ProjValMeasure ℝ H) :
    ∃ Hpp Hac Hsc : Submodule ℂ H,
      (∀ x, x ∈ Hpp ↔ ∃ S : Set ℝ, S.Countable ∧ P.diag x Sᶜ = 0) ∧
      (∀ x, x ∈ Hac ↔ P.diag x ≪ volume) ∧
      (∀ x, x ∈ Hsc ↔ P.diag x ⟂ₘ volume ∧ ∀ t : ℝ, P.diag x {t} = 0) ∧
      IsClosed (Hpp : Set H) ∧ IsClosed (Hac : Set H) ∧ IsClosed (Hsc : Set H) ∧
      Hpp ⟂ Hac ∧ Hpp ⟂ Hsc ∧ Hac ⟂ Hsc ∧ Hpp ⊔ Hac ⊔ Hsc = ⊤ ∧
      ∀ (B : Set ℝ) (hB : MeasurableSet B) (x : H),
        (x ∈ Hpp → P.proj B hB x ∈ Hpp) ∧ (x ∈ Hac → P.proj B hB x ∈ Hac) ∧
          (x ∈ Hsc → P.proj B hB x ∈ Hsc) := by
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

/-- Friedrichs extension with its extremal property (README §4.7, UO-D06): a densely defined
symmetric partial operator bounded below by `γ` has a self-adjoint extension `SF` with the same
lower bound (Teschl, Theorem 2.12) that is largest among all such extensions in form order,
stated in resolvent order: for every self-adjoint extension `T` bounded below by `γ` and every
real `t < γ`, `R_T(t) ≤ R_SF(t)` for the resolvents `R(t) = (t I − ·)⁻¹`. The order on
partial operators is graph inclusion. -/
theorem friedrichs_extension_extremal
    {𝕜 H : Type*} [RCLike 𝕜] [NormedAddCommGroup H] [InnerProductSpace 𝕜 H]
    [CompleteSpace H] (S : H →ₗ.[𝕜] H) (hdense : Dense (S.domain : Set H))
    (hsym : S.IsFormalAdjoint S) (γ : ℝ)
    (hγ : ∀ x : S.domain, γ * ‖(x : H)‖ ^ 2 ≤ RCLike.re (inner 𝕜 (S x) (x : H))) :
    ∃ SF : H →ₗ.[𝕜] H, IsSelfAdjoint SF ∧ S ≤ SF ∧
      (∀ x : SF.domain, γ * ‖(x : H)‖ ^ 2 ≤ RCLike.re (inner 𝕜 (SF x) (x : H))) ∧
      ∀ T : H →ₗ.[𝕜] H, IsSelfAdjoint T → S ≤ T →
        (∀ x : T.domain, γ * ‖(x : H)‖ ^ 2 ≤ RCLike.re (inner 𝕜 (T x) (x : H))) →
        ∀ t : ℝ, t < γ → T.resolvent (t : 𝕜) ≤ SF.resolvent (t : 𝕜) := by
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

section Nelson

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

end Nelson

/-! ## Layer 6: closed tensor operators and self-adjoint sums -/

/-- Closed tensor sum (README §6.2–§6.3, UO-F02–UO-F03): for self-adjoint `A` and `B`, the
algebraic tensor sum `A ⊙ I + I ⊙ B` on the span of `dom A ⊗ dom B` has exactly one
self-adjoint closure in the completed Hilbert tensor product, and its spectrum is the closure
of `σ(A) + σ(B)` (Teschl, Theorem 4.14 and (4.44)). -/
theorem existsUnique_tensorSum {H K : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    (A : H →ₗ.[ℂ] H) (B : K →ₗ.[ℂ] K) (hA : IsSelfAdjoint A) (hB : IsSelfAdjoint B) :
    ∃! S : UniformSpace.Completion (H ⊗[ℂ] K) →ₗ.[ℂ] UniformSpace.Completion (H ⊗[ℂ] K),
      (∀ (a : A.domain) (b : B.domain),
        ∃ h : (((a : H) ⊗ₜ[ℂ] (b : K) : H ⊗[ℂ] K) : UniformSpace.Completion (H ⊗[ℂ] K)) ∈
            S.domain,
          S ⟨_, h⟩ = ((A a ⊗ₜ[ℂ] (b : K) + (a : H) ⊗ₜ[ℂ] B b : H ⊗[ℂ] K) :
            UniformSpace.Completion (H ⊗[ℂ] K))) ∧
      S = (S.domRestrict (Submodule.span ℂ {x | ∃ (a : A.domain) (b : B.domain),
        x = (((a : H) ⊗ₜ[ℂ] (b : K) : H ⊗[ℂ] K) : UniformSpace.Completion (H ⊗[ℂ] K))})).closure ∧
      IsSelfAdjoint S ∧
      S.resolventSetᶜ = closure (A.resolventSetᶜ + B.resolventSetᶜ) := by
  sorry

/-- Closed tensor product (README §6.2–§6.3, UO-F02–UO-F03): for self-adjoint `A` and `B`, the
algebraic tensor product `A ⊙ B` on the span of `dom A ⊗ dom B` has exactly one self-adjoint
closure in the completed Hilbert tensor product, and its spectrum is the closure of
`σ(A) σ(B)` (Teschl, Theorem 4.14 and (4.43)). -/
theorem existsUnique_tensorProd {H K : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    (A : H →ₗ.[ℂ] H) (B : K →ₗ.[ℂ] K) (hA : IsSelfAdjoint A) (hB : IsSelfAdjoint B) :
    ∃! P : UniformSpace.Completion (H ⊗[ℂ] K) →ₗ.[ℂ] UniformSpace.Completion (H ⊗[ℂ] K),
      (∀ (a : A.domain) (b : B.domain),
        ∃ h : (((a : H) ⊗ₜ[ℂ] (b : K) : H ⊗[ℂ] K) : UniformSpace.Completion (H ⊗[ℂ] K)) ∈
            P.domain,
          P ⟨_, h⟩ = ((A a ⊗ₜ[ℂ] B b : H ⊗[ℂ] K) : UniformSpace.Completion (H ⊗[ℂ] K))) ∧
      P = (P.domRestrict (Submodule.span ℂ {x | ∃ (a : A.domain) (b : B.domain),
        x = (((a : H) ⊗ₜ[ℂ] (b : K) : H ⊗[ℂ] K) : UniformSpace.Completion (H ⊗[ℂ] K))})).closure ∧
      IsSelfAdjoint P ∧
      P.resolventSetᶜ = closure (A.resolventSetᶜ * B.resolventSetᶜ) := by
  sorry

end TauCetiRoadmap.UnboundedOperators
