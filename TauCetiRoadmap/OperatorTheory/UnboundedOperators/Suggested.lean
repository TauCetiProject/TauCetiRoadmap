/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Topology.Algebra.Module.LinearPMap.Resolvent.Basic
import TauCeti.Analysis.Normed.Operator.LinearPMap.RelativeBound
import TauCeti.Analysis.InnerProductSpace.ProjValMeasure.MatrixElement
import TauCeti.LinearAlgebra.LinearPMap.SmulSub
import TauCeti.Analysis.Semigroups.Group.Unitary

/-!
# Unbounded operators: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs. Projection-valued measures are Tau Ceti's
`TauCeti.ProjValMeasure`, with diagonal measures `diag` and polarized complex measures
`polarizedComplexMeasure`; resolvents, resolvent sets and spectra are Tau Ceti's
`LinearPMap.resolvent`, `LinearPMap.resolventSet` and `LinearPMap.spectrum`, in the convention
`R(z) = (zI − A)⁻¹`, and the shift `x ↦ z x − A x` on `dom A` is Tau Ceti's
`LinearPMap.smulSub z A`; relative bounds are Tau Ceti's `LinearPMap.IsRelativelyBounded`, with
`‖V x‖ ≤ a ‖x‖ + b ‖A x‖`; the Stone group of a self-adjoint `A` is the unitary
`TauCeti.Semigroups.StronglyContinuousGroup` with complex generator `i • A`, that is
`U(t) = exp(itA)`; completed Hilbert tensor products are completions of Mathlib's
inner-product tensor product. Stated here: the unbounded spectral integral of a measurable
symbol against a normalized projection-valued measure on any measurable space, with its
adjoint; the maximal multiplication operator; the spectral theorem for a normal partial
operator; the equivalence of the resolvent and Stone-group forms of strong commutation; the
joint projection-valued measure of finitely many strongly commuting
self-adjoint operators; the multiparameter Stone theorem; the spectral-type decomposition of
a real projection-valued measure; the essential spectrum of a partial operator and its Fredholm
characterization for self-adjoint operators; the spectrum alternatives of a closed symmetric
operator; the closed-form representation; the Friedrichs extension with its extremal property in
resolvent order; the nonclosable integration counterexample on `L²(ℝ)`; Nelson's essential
self-adjointness and commutation theorem; Weyl's theorem on the essential spectrum and the
relatively compact symmetric perturbation theorem; the holomorphic eigenvalue branch through a
simple isolated eigenvalue of a type (A) family and Rellich's real-analytic branches at finite
multiplicity; Kato's essential self-adjointness of `−Δ + V` on `C_c^∞(ℝ³)` for real
`V ∈ L² + L^∞`; and the self-adjoint closures of tensor sums and tensor products with their
spectra, and the factorization of the Stone group of a tensor sum. The Hilbert-basis cardinal
classification used by the deficiency theory is BanachSpaceTheory B5's
`nonempty_linearIsometryEquiv_iff_lift_mk_eq` and is not restated here.

Not statable at the pins: every headline about the spectral measure `P_A` of a given
self-adjoint partial operator, which is SelfAdjointSpectralTheory SA-E01 and not at the pins.
This covers the Borel calculus `f(A)` and its representation of `A` (README §§1.2–1.8), the
spectral-projection form of strong commutation (§2.3, form (i)), the spectral-projection form of
the essential spectrum (§3.2), the staircase approximation `Aₙ = fₙ(A)` (§3.4), the diagonal
spectrum realization `g(A)` (§3.5), the square-root form-domain identity and the real spectral
restriction (§4.7), the latter on the pinned Hilbert complexification
`WithLp 2 (TauCeti.Complexification H)`, and the identification of the tensor closures with
spectral integrals against the product measure of `P_A` and `P_B` (§§6.2–6.3). The
singular-endpoint headlines need the minimal and maximal Sturm–Liouville operators (§4.8), and
the geometric Nelson-counterexample headlines (the completed translation surface, its genus and
the noncommuting Stone groups, §§2.3–2.4) need the translation-surface construction described in
the README; none of these is at the pins.
-/

open MeasureTheory
open scoped InnerProductSpace ENNReal Pointwise TensorProduct Laplacian

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

/-- Strong commutation, resolvent form against Stone-group form (README §2.3, UO-B03): let `U`
and `V` be the unitary groups with complex generators `i • A` and `i • B`, so that `A` and `B`
are self-adjoint and `U(s) = exp(isA)`, `V(t) = exp(itB)` (Stone's theorem,
`IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`). For any resolvent points
`z` of `A` and `w` of `B`, the resolvents `(zI − A)⁻¹` and `(wI − B)⁻¹` commute exactly when
`U(s)` and `V(t)` commute for all real `s` and `t` (Teschl, (4.24)–(4.25), p.117; the
condition at `conj z` in (4.24) follows by Fuglede's theorem, `(zI − A)⁻¹` being normal). -/
theorem commute_resolvent_iff_commute_stoneGroup {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (A B : H →ₗ.[ℂ] H) (U V : TauCeti.Semigroups.StronglyContinuousGroup H)
    (hU : U.IsUnitary) (hV : V.IsUnitary)
    (hUA : U.complexGenerator hU = Complex.I • A) (hVB : V.complexGenerator hV = Complex.I • B)
    (z w : ℂ) (hz : z ∈ A.resolventSet) (hw : w ∈ B.resolventSet) :
    Commute (A.resolvent z) (B.resolvent w) ↔ ∀ s t : ℝ, Commute (U s) (V t) := by
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

/-- The discrete spectrum of a partial operator (README §3.2, UO-C02): the isolated points of its
spectrum that are eigenvalues with a finite-dimensional eigenspace `ker(zI − A)`, the kernel of
Tau Ceti's shift `LinearPMap.smulSub z A` (Teschl, §6.4, p.145). -/
def discreteSpectrum {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (A : H →ₗ.[ℂ] H) : Set ℂ :=
  {z | z ∈ A.spectrum ∧ (∃ ε > 0, Metric.ball z ε ∩ A.spectrum = {z}) ∧
    LinearMap.ker (A.smulSub z) ≠ ⊥ ∧
    FiniteDimensional ℂ (LinearMap.ker (A.smulSub z))}

/-- The essential spectrum of a partial operator (README §3.2, UO-C02): the complement of the
discrete spectrum in the spectrum (Teschl, §6.4, p.145). -/
def essentialSpectrum {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (A : H →ₗ.[ℂ] H) : Set ℂ :=
  A.spectrum \ discreteSpectrum A

/-- Fredholm characterization of the essential spectrum (README §3.2, UO-C02): for a
self-adjoint partial operator `A` on a complex Hilbert space, `z` lies outside the essential
spectrum exactly when `zI − A : dom A → H` is Fredholm, that is, has a finite-dimensional kernel
and a closed range of finite codimension. It is proved from Teschl's spectral-projection form
(6.28), p.145, and the Weyl criterion, Lemma 6.17, p.145. -/
theorem notMem_essentialSpectrum_iff {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] (A : H →ₗ.[ℂ] H) (hA : IsSelfAdjoint A) (z : ℂ) :
    z ∉ essentialSpectrum A ↔
      FiniteDimensional ℂ (LinearMap.ker (A.smulSub z)) ∧
        IsClosed (LinearMap.range (A.smulSub z) : Set H) ∧
        FiniteDimensional ℂ (H ⧸ LinearMap.range (A.smulSub z)) := by
  sorry

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

/-- Integration on `L²(ℝ)` (README §5.1, UO-E01): a partial operator `I : L²(ℝ) → ℂ` whose
domain is exactly the integrable classes and whose action is the Bochner integral there has dense
domain, graph closure all of `L²(ℝ) × ℂ` and adjoint domain `{0}`, and is not closable (Jones,
Exercises 12.1.11(ii) and 12.1.15, pp.86–87). Such an `I` exists, and `hdom` and `hact` determine
it. -/
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

/-- Weyl's theorem (README §5.4, UO-E04): self-adjoint partial operators whose resolvents differ
by a compact operator at one common resolvent point have the same essential spectrum (Teschl,
Theorem 6.19, p.146). Tau Ceti's resolvent `(zI − A)⁻¹` is the negative of Teschl's `(A − z)⁻¹`,
which does not affect compactness of the difference. -/
theorem essentialSpectrum_eq_of_isCompactOperator_resolvent_sub {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (A B : H →ₗ.[ℂ] H) (hA : IsSelfAdjoint A) (hB : IsSelfAdjoint B) (z : ℂ)
    (hzA : z ∈ A.resolventSet) (hzB : z ∈ B.resolventSet)
    (hK : IsCompactOperator (A.resolvent z - B.resolvent z)) :
    essentialSpectrum A = essentialSpectrum B := by
  sorry

/-- Relatively compact symmetric perturbations (README §5.4, UO-E04): if `A` is self-adjoint and
`V` is symmetric with `dom A ⊆ dom V` and `V (iI − A)⁻¹` compact, then `A + V`, with domain
`dom A`, is self-adjoint and has the essential spectrum of `A` (Teschl, Lemmas 6.22–6.23, p.148,
and Theorem 6.19, p.146). -/
theorem isSelfAdjoint_add_and_essentialSpectrum_eq {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (A V : H →ₗ.[ℂ] H) (hA : IsSelfAdjoint A) (hV : V.IsFormalAdjoint V)
    (hdom : A.domain ≤ V.domain)
    (hcpt : ∃ K : H →L[ℂ] H, IsCompactOperator K ∧
      ∀ y : H, ∃ h : A.resolvent Complex.I y ∈ V.domain, V ⟨_, h⟩ = K y) :
    IsSelfAdjoint (A + V) ∧ essentialSpectrum (A + V) = essentialSpectrum A := by
  sorry

/-- Holomorphic eigenvalue branch (README §5.5, UO-E04a, multiplicity one): let `A` be
self-adjoint and `B` symmetric and `A`-bounded, and let `λ₀` be an isolated point of the spectrum
of `A` whose eigenspace is spanned by the unit vector `u₀`. For small complex `z` the family
`A + zB` on `dom A` has an eigenvalue `λ(z)` with eigenvector `v(z)`, both holomorphic, with
`λ(0) = λ₀`, `v(0) = u₀` and `λ′(0) = ⟪u₀, B u₀⟫` (Kato, Chapter VII, §§1–3). -/
theorem exists_analytic_eigenvalue_branch {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (A B : H →ₗ.[ℂ] H) (hA : IsSelfAdjoint A) (hB : B.IsFormalAdjoint B) (a b : ℝ)
    (hAB : B.IsRelativelyBounded A a b)
    (lam₀ : ℝ) (u₀ : A.domain) (hu₀ : ‖(u₀ : H)‖ = 1) (heig : A u₀ = (lam₀ : ℂ) • (u₀ : H))
    (hsimple : ∀ x : A.domain, A x = (lam₀ : ℂ) • (x : H) → ∃ c : ℂ, (x : H) = c • (u₀ : H))
    (hiso : ∃ ε > 0, Metric.ball (lam₀ : ℂ) ε ∩ A.spectrum = {(lam₀ : ℂ)}) :
    ∃ r > 0, ∃ (lam : ℂ → ℂ) (v : ℂ → H),
      AnalyticOnNhd ℂ lam (Metric.ball 0 r) ∧ AnalyticOnNhd ℂ v (Metric.ball 0 r) ∧
      lam 0 = lam₀ ∧ v 0 = u₀ ∧
      deriv lam 0 = ⟪(u₀ : H), B ⟨u₀, hAB.domain_le u₀.2⟩⟫_ℂ ∧
      ∀ z ∈ Metric.ball (0 : ℂ) r, ∃ h : v z ∈ A.domain,
        v z ≠ 0 ∧ A ⟨v z, h⟩ + z • B ⟨v z, hAB.domain_le h⟩ = lam z • v z := by
  sorry

/-- Rellich's theorem for a type (A) family (README §5.5, UO-E04a): let `A` be self-adjoint and
`B` symmetric and `A`-bounded, and let `λ₀` be an isolated point of the spectrum of `A` whose
eigenspace has finite dimension `m`. For small real `t`, the spectrum of `A + tB` near `λ₀`
consists of `m` real-analytic eigenvalue branches, counted with multiplicity and not ordered,
with real-analytic orthonormal eigenvectors that span every eigenvector of `A + tB` for an
eigenvalue near `λ₀` (Kato, Chapter VII, §3, and Chapter II, §6). -/
theorem exists_realAnalytic_eigenvalue_branches {H : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (A B : H →ₗ.[ℂ] H) (hA : IsSelfAdjoint A) (hB : B.IsFormalAdjoint B) (a b : ℝ)
    (hAB : B.IsRelativelyBounded A a b) (lam₀ : ℝ) (m : ℕ)
    (hfin : FiniteDimensional ℂ (LinearMap.ker (A.smulSub (lam₀ : ℂ))))
    (hm : Module.finrank ℂ (LinearMap.ker (A.smulSub (lam₀ : ℂ))) = m)
    (hiso : ∃ ε > 0, Metric.ball (lam₀ : ℂ) ε ∩ A.spectrum = {(lam₀ : ℂ)}) :
    ∃ r > 0, ∃ δ > 0, ∃ (lam : Fin m → ℝ → ℝ) (v : Fin m → ℝ → H),
      (∀ k, AnalyticOnNhd ℝ (lam k) (Set.Ioo (-r) r)) ∧
      (∀ k, AnalyticOnNhd ℝ (v k) (Set.Ioo (-r) r)) ∧ (∀ k, lam k 0 = lam₀) ∧
      ∀ t ∈ Set.Ioo (-r) r, Orthonormal ℂ (fun k => v k t) ∧
        (∀ k, ∃ h : v k t ∈ A.domain,
          A ⟨v k t, h⟩ + (t : ℂ) • B ⟨v k t, hAB.domain_le h⟩ = (lam k t : ℂ) • v k t) ∧
        (A + (t : ℂ) • B).spectrum ∩ Metric.ball (lam₀ : ℂ) δ =
          Set.range (fun k => ((lam k t : ℝ) : ℂ)) ∧
        ∀ (μ : ℂ) (x : A.domain), μ ∈ Metric.ball (lam₀ : ℂ) δ →
          A x + (t : ℂ) • B ⟨x, hAB.domain_le x.2⟩ = μ • (x : H) →
          (x : H) ∈ Submodule.span ℂ (Set.range fun k => v k t) := by
  sorry

open scoped ContDiff in
/-- Kato's theorem (README §5.7, UO-E06): for a real potential `V = V₂ + Vb` on `ℝ³` with
`V₂ ∈ L²` and `Vb ∈ L^∞`, the operator `−Δ + V` on the classes of smooth compactly supported
functions is essentially self-adjoint in `L²(ℝ³)` (Teschl, Lemma 10.1, p.221, and Theorem 10.2,
p.222). Here `∞` is the smoothness index `(⊤ : ℕ∞)`; `ContDiff ℝ ⊤` would require analyticity. -/
theorem isSelfAdjoint_closure_neg_laplacian_add_potential
    (V₂ Vb : EuclideanSpace ℝ (Fin 3) → ℝ) (h₂ : MemLp V₂ 2 volume) (hb : MemLp Vb ⊤ volume)
    (T : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin 3))) →ₗ.[ℂ]
      Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin 3))))
    (hdom : ∀ u, u ∈ T.domain ↔ ∃ f : EuclideanSpace ℝ (Fin 3) → ℂ,
      ContDiff ℝ ∞ f ∧ HasCompactSupport f ∧ (u : EuclideanSpace ℝ (Fin 3) → ℂ) =ᵐ[volume] f)
    (hact : ∀ (u : T.domain) (f : EuclideanSpace ℝ (Fin 3) → ℂ), ContDiff ℝ ∞ f →
      HasCompactSupport f → ((u : Lp ℂ 2 volume) : EuclideanSpace ℝ (Fin 3) → ℂ) =ᵐ[volume] f →
      (T u : EuclideanSpace ℝ (Fin 3) → ℂ) =ᵐ[volume]
        fun x => -(Δ f) x + ((V₂ x + Vb x : ℝ) : ℂ) * f x) :
    IsSelfAdjoint T.closure := by
  sorry

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

/-- Stone group of a tensor sum (README §6.3, UO-F03): let `S` be the closed tensor sum of
`existsUnique_tensorSum`, given by its action on elementary tensors of `dom A ⊗ dom B` and as the
closure of its restriction to their span, and let `U`, `V` and `W` be the unitary groups with
complex generators `i • A`, `i • B` and `i • S`. Then `W(t)(a ⊗ b) = U(t) a ⊗ V(t) b` for every
real `t`, `a ∈ H` and `b ∈ K`, that is `exp(itS) = exp(itA) ⊗ exp(itB)` on the dense span of the
elementary tensors (Teschl, Theorem 4.14, p.121, and Corollary 5.3, p.125). -/
theorem stoneGroup_tensorSum_apply_tmul {H K : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    (A : H →ₗ.[ℂ] H) (B : K →ₗ.[ℂ] K)
    (S : UniformSpace.Completion (H ⊗[ℂ] K) →ₗ.[ℂ] UniformSpace.Completion (H ⊗[ℂ] K))
    (hact : ∀ (a : A.domain) (b : B.domain),
      ∃ h : (((a : H) ⊗ₜ[ℂ] (b : K) : H ⊗[ℂ] K) : UniformSpace.Completion (H ⊗[ℂ] K)) ∈
          S.domain,
        S ⟨_, h⟩ = ((A a ⊗ₜ[ℂ] (b : K) + (a : H) ⊗ₜ[ℂ] B b : H ⊗[ℂ] K) :
          UniformSpace.Completion (H ⊗[ℂ] K)))
    (hclosure : S = (S.domRestrict (Submodule.span ℂ {x | ∃ (a : A.domain) (b : B.domain),
      x = (((a : H) ⊗ₜ[ℂ] (b : K) : H ⊗[ℂ] K) : UniformSpace.Completion (H ⊗[ℂ] K))})).closure)
    (U : TauCeti.Semigroups.StronglyContinuousGroup H)
    (V : TauCeti.Semigroups.StronglyContinuousGroup K)
    (W : TauCeti.Semigroups.StronglyContinuousGroup (UniformSpace.Completion (H ⊗[ℂ] K)))
    (hU : U.IsUnitary) (hV : V.IsUnitary) (hW : W.IsUnitary)
    (hUA : U.complexGenerator hU = Complex.I • A) (hVB : V.complexGenerator hV = Complex.I • B)
    (hWS : W.complexGenerator hW = Complex.I • S) (t : ℝ) (a : H) (b : K) :
    W t ((a ⊗ₜ[ℂ] b : H ⊗[ℂ] K) : UniformSpace.Completion (H ⊗[ℂ] K)) =
      ((U t a ⊗ₜ[ℂ] V t b : H ⊗[ℂ] K) : UniformSpace.Completion (H ⊗[ℂ] K)) := by
  sorry

end TauCetiRoadmap.UnboundedOperators
