module

import Mathlib
import TauCeti.Analysis.InnerProductSpace.ProjValMeasure.Basic
import TauCeti.Topology.Algebra.Module.LinearPMap.Resolvent.Basic
import TauCeti.LinearAlgebra.LinearPMap.SmulSub
import TauCeti.Analysis.Normed.Operator.LinearPMap.RelativeBound
import TauCeti.Analysis.Semigroups.Group.Unitary
import TauCeti.Analysis.OperatorIdeal.Nuclear.Basic
import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume
import TauCeti.Geometry.Manifold.Riemannian.Laplacian
import TauCeti.Geometry.Manifold.Riemannian.Restriction
import TauCeti.Geometry.Manifold.Riemannian.Isometry.Local
import TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.UpperHalfSpace.Basic

/-!
# Schrödinger operators and spectral types: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need.

Partial operators are Mathlib's `LinearPMap`s; resolvents, resolvent sets and spectra are Tau
Ceti's `LinearPMap.resolvent`, `LinearPMap.resolventSet` and `LinearPMap.spectrum`, with
`R(z) = (z − A)⁻¹`, and `LinearPMap.smulSub z A` is the shift `x ↦ z x − A x` on `dom A`.
Projection-valued measures are Tau Ceti's `TauCeti.ProjValMeasure`, with diagonal measures
`μ_f = P.diag f`. The spectral measure `P_A` of a given self-adjoint operator is not a
declaration at the pins (SelfAdjointSpectralTheory SA-E01): a statement about `P_A` takes a
projection-valued measure `P` together with the resolvent formula `IsSpectralMeasureOf A P`, which
determines `P` (SA-E44). The unitary group `t ↦ e^{itA}` is the Tau Ceti
`StronglyContinuousGroup` whose complex generator is `i • A` (Stone's theorem,
`IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`). The essential spectrum is
UnboundedOperators UO-C02's: the spectrum minus the isolated eigenvalues of finite multiplicity.
The Laplacian of a Riemannian manifold is the nonnegative `−div grad`, the negative of Tau Ceti's
`TauCeti.Manifold.laplaceBeltrami`; the Euclidean Schrödinger operators use Mathlib's `Δ = Σ ∂ⱼ²`,
so that `−Δ ≥ 0`. An operator given on test functions is stated, as in UnboundedOperators UO-E06,
through a partial operator whose domain is the set of classes of compactly supported smooth
functions and whose action is prescribed almost everywhere.

Every headline theorem of the roadmap that is statable at the pins is stated below: the Lebesgue
decomposition realised by the spectral types (README §1.2), the structure of the absolutely
continuous spectrum and the interval criterion (§1.4, §1.5), the min–max principle below the
essential spectrum (§1.6), Pearson's theorem and the Kato–Rosenblum theorem (§1.9), the lower bound
and cores of the Kato–Rellich theorem (§2.3), the essential self-adjointness of the Laplacian of a
complete Riemannian manifold and its `L²` kernel (§3.6, §3.7), the Schrödinger operators `Δ + V`
with bounded real potentials on a complete Riemannian manifold (§3.9), the threshold
`[1/4, ∞) ⊆ σ_ess` forced by a cusp end (§3.10), and the Schrödinger operators `−Δ + V` with bounded
real potentials on `ℝ^d` (§4.4).

Three clauses of the README Summary are not statable at the pins, and nothing is stated in their
place. The form-domain clause of §3.6 (`H¹₀(X) = H¹(X)`, with `Δ_X` the operator of the energy
form `‖du‖²` on `H¹(X)`) needs the Sobolev space `H¹` of a Riemannian manifold, built on the
distributional differential of ComplexKahlerGeometry K5a, and the form domain of a nonnegative
self-adjoint operator (UnboundedOperators UO-D06); the pins have neither. The form-domain
clause of §4.2 (the form domain of `H₀` is `H¹(ℝ^d)`) needs the same form domain. The
identification of §3.8 of `Δ_X` on a compact manifold with RiemannianGeometry R5c's closed
realisation of `Δ⁺` and with K5a's `H²` realisation needs those operators, neither of which is a
declaration at the pins.
-/

open Bundle MeasureTheory Filter Topology
open scoped InnerProductSpace ENNReal ContDiff Manifold ComplexConjugate Laplacian SchwartzMap TauCeti

namespace TauCetiRoadmap.SchrodingerOperatorsAndSpectralTypes

/-! ## Layer 1: Spectral measures and spectral types -/

/-- `P` is the spectral measure of `A` (README §1.1, Conventions): for every nonreal `z` and every
vector `f`, the resolvent matrix element `⟪f, (z − A)⁻¹ f⟫` is the Stieltjes transform
`∫ (z − s)⁻¹ dμ_f(s)` of the diagonal measure `μ_f = P.diag f`. For self-adjoint `A` exactly one
normalized projection-valued measure on `ℝ` satisfies it: SelfAdjointSpectralTheory SA-E01 gives
one and SA-E44 its uniqueness (Teschl, Theorem 3.7). -/
def IsSpectralMeasureOf {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (A : H →ₗ.[ℂ] H) (P : TauCeti.ProjValMeasure ℝ H) : Prop :=
  ∀ z : ℂ, z.im ≠ 0 → ∀ f : H,
    ⟪f, A.resolvent z f⟫_ℂ = ∫ s : ℝ, (z - (s : ℂ))⁻¹ ∂(P.diag f)

/-- The type components realise the Lebesgue decomposition (README §1.2). Let `P` be a
normalized projection-valued measure on `ℝ`, for instance the spectral measure of a self-adjoint
operator, and write `f = f_ac + f_sc + f_pp` with `μ_{f_ac}` absolutely continuous, `μ_{f_sc}`
continuous and singular, and `μ_{f_pp}` carried by a countable set (such a decomposition exists
and is unique, UnboundedOperators UO-C03, so the components are the orthogonal projections of `f`
onto the three type subspaces). Then `μ_f` is the sum of the three component measures, `μ_{f_ac}`
is the absolutely continuous part `Leb.withDensity (μ_f.rnDeriv Leb)` of `μ_f`, `μ_{f_sc} + μ_{f_pp}`
is its singular part, and `μ_{f_pp}` is its restriction to its atoms (Teschl, (3.83)–(3.85) and
Lemma 3.19, for a separable space). -/
theorem diag_spectralType_components {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] (P : TauCeti.ProjValMeasure ℝ H)
    (f fac fsc fpp : H) (hf : f = fac + fsc + fpp)
    (hac : P.diag fac ≪ volume)
    (hsc : P.diag fsc ⟂ₘ volume ∧ ∀ t : ℝ, P.diag fsc {t} = 0)
    (hpp : ∃ S : Set ℝ, S.Countable ∧ P.diag fpp Sᶜ = 0) :
    P.diag f = P.diag fac + P.diag fsc + P.diag fpp ∧
      P.diag fac = volume.withDensity ((P.diag f).rnDeriv volume) ∧
      P.diag fsc + P.diag fpp = (P.diag f).singularPart volume ∧
      P.diag fpp = (P.diag f).restrict {t | 0 < P.diag f {t}} := by
  sorry

/-- The absolutely continuous spectrum `σ_ac(P)` of a normalized projection-valued measure `P` on
`ℝ` (README §1.4): the support of `P` on its absolutely continuous subspace, that is, the points
`t` such that every interval `(t − ε, t + ε)` is charged by the spectral measure of some vector
whose spectral measure is absolutely continuous. For the spectral measure of a self-adjoint `A` it
is the spectrum of the reduced restriction `A_ac` (README §1.3–§1.4). -/
def acSpectrum {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (P : TauCeti.ProjValMeasure ℝ H) : Set ℝ :=
  {t | ∀ ε > 0, ∃ f : H, P.diag f ≪ volume ∧ P.diag f (Set.Ioo (t - ε) (t + ε)) ≠ 0}

/-- Structure of the absolutely continuous spectrum (README §1.4): `σ_ac(P)` is closed with no
isolated points, and `t ∈ σ_ac(P)` exactly when a single vector `f` has absolutely continuous
mass `Leb.withDensity (μ_f.rnDeriv Leb)` on every interval around `t` (Teschl, Lemma 3.15 and
(3.85), there through a maximal spectral measure on a separable space; no maximal spectral vector
and no separability is assumed here). -/
theorem perfect_acSpectrum_and_mem_iff {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] (P : TauCeti.ProjValMeasure ℝ H) :
    Perfect (acSpectrum P) ∧
      ∀ t : ℝ, t ∈ acSpectrum P ↔ ∃ f : H, ∀ ε > 0,
        volume.withDensity ((P.diag f).rnDeriv volume) (Set.Ioo (t - ε) (t + ε)) ≠ 0 := by
  sorry

/-- The interval criterion (README §1.5): for real `a < b`, `[a, b] ⊆ σ_ac(P)` exactly when every
nonempty open subset of `(a, b)` carries absolutely continuous spectral mass of some vector
(Teschl, Lemma 3.15, for one measure). -/
theorem Icc_subset_acSpectrum_iff {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] (P : TauCeti.ProjValMeasure ℝ H) {a b : ℝ}
    (hab : a < b) :
    Set.Icc a b ⊆ acSpectrum P ↔
      ∀ J : Set ℝ, IsOpen J → J.Nonempty → J ⊆ Set.Ioo a b →
        ∃ f : H, volume.withDensity ((P.diag f).rnDeriv volume) J ≠ 0 := by
  sorry

/-- The essential spectrum of a partial operator, UnboundedOperators UO-C02's: the spectrum
without its isolated points that are eigenvalues with a nonzero finite-dimensional eigenspace
`ker(z − A)` (Teschl, §6.4). -/
def essentialSpectrum {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (A : H →ₗ.[ℂ] H) : Set ℂ :=
  A.spectrum \
    {z | (∃ ε > 0, Metric.ball z ε ∩ A.spectrum = {z}) ∧ LinearMap.ker (A.smulSub z) ≠ ⊥ ∧
      FiniteDimensional ℂ (LinearMap.ker (A.smulSub z))}

/-- The min–max value `μ_{n+1}(A)` with `n` obstacles (README §1.6): the supremum over
`φ₁, …, φₙ` of the infimum of `⟪ψ, Aψ⟫` over unit vectors `ψ ∈ dom A` orthogonal to them, in
`EReal`, so that an empty admissible family gives `⊤`. -/
noncomputable def minMaxValue {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (A : H →ₗ.[ℂ] H) (n : ℕ) : EReal :=
  ⨆ φ : Fin n → H, ⨅ (ψ : A.domain) (_ : ‖(ψ : H)‖ = 1) (_ : ∀ i, ⟪φ i, (ψ : H)⟫_ℂ = 0),
    ((⟪(ψ : H), A ψ⟫_ℂ).re : EReal)

/-- The min–max principle below the essential spectrum (README §1.6). For a self-adjoint `A`
bounded below, the min–max values are nondecreasing and at most the bottom `Σ` of the essential
spectrum (`⊤` when it is empty), and for every real `c < Σ` the number of min–max values below `c`
is the dimension of the sum of the eigenspaces of `A` for eigenvalues below `c`. Equivalently,
`μ_n(A)` is the `n`-th eigenvalue below `Σ` counted with multiplicity when there are at least `n`
of them, and `Σ` otherwise (Teschl, Theorem 4.10). -/
theorem minMax_principle {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (A : H →ₗ.[ℂ] H) (hA : IsSelfAdjoint A) (γ : ℝ)
    (hγ : ∀ x : A.domain, γ * ‖(x : H)‖ ^ 2 ≤ (⟪(x : H), A x⟫_ℂ).re) :
    Monotone (minMaxValue A) ∧
      (∀ n, minMaxValue A n ≤ ⨅ (t : ℝ) (_ : (t : ℂ) ∈ essentialSpectrum A), (t : EReal)) ∧
      ∀ c : ℝ, (c : EReal) < ⨅ (t : ℝ) (_ : (t : ℂ) ∈ essentialSpectrum A), (t : EReal) →
        {n : ℕ | minMaxValue A n < c}.encard =
          (Module.finrank ℂ
            ↥(⨆ (t : ℝ) (_ : t < c), LinearMap.ker (A.smulSub (t : ℂ)) : Submodule ℂ A.domain) :
            ℕ∞) := by
  sorry

/-- Pearson's theorem (README §1.9). Let `H₁` be self-adjoint on a Hilbert space `K₁`, `H₂`
self-adjoint on a Hilbert space `K₂`, `J : K₁ → K₂` bounded, and suppose that `H₂ J − J H₁ = C`
in the form sense on `dom H₂ × dom H₁` for a trace-class `C : K₁ → K₂` (finite nuclear gauge).
Then for every `x` in the absolutely continuous subspace of `H₁` the vectors
`e^{itH₂} J e^{−itH₁} x` converge in `K₂` as `t → +∞` and as `t → −∞` (Yafaev, Theorem 1.8, for
`K₁ = K₂`; Pearson 1978; Reed–Simon III, Theorem XI.7). Here `P₁` is the spectral measure of `H₁`
and `U₁`, `U₂` are the unitary groups `e^{itH₁}` on `K₁` and `e^{itH₂}` on `K₂`. -/
theorem pearson_tendsto {K₁ K₂ : Type*} [NormedAddCommGroup K₁] [InnerProductSpace ℂ K₁]
    [CompleteSpace K₁] [NormedAddCommGroup K₂] [InnerProductSpace ℂ K₂] [CompleteSpace K₂]
    (H₁ : K₁ →ₗ.[ℂ] K₁) (H₂ : K₂ →ₗ.[ℂ] K₂) (h₁ : IsSelfAdjoint H₁) (h₂ : IsSelfAdjoint H₂)
    (J C : K₁ →L[ℂ] K₂) (hC : C.nuclearENorm ≠ ⊤)
    (hJC : ∀ (ψ : H₂.domain) (φ : H₁.domain),
      ⟪H₂ ψ, J φ⟫_ℂ - ⟪(ψ : K₂), J (H₁ φ)⟫_ℂ = ⟪(ψ : K₂), C φ⟫_ℂ)
    (P₁ : TauCeti.ProjValMeasure ℝ K₁) (hP₁ : IsSpectralMeasureOf H₁ P₁)
    (U₁ : TauCeti.Semigroups.StronglyContinuousGroup K₁)
    (U₂ : TauCeti.Semigroups.StronglyContinuousGroup K₂) (hU₁ : U₁.IsUnitary)
    (hU₂ : U₂.IsUnitary) (hgen₁ : U₁.complexGenerator hU₁ = Complex.I • H₁)
    (hgen₂ : U₂.complexGenerator hU₂ = Complex.I • H₂) (x : K₁) (hx : P₁.diag x ≪ volume) :
    (∃ y : K₂, Tendsto (fun t : ℝ => U₂ t (J (U₁ (-t) x))) atTop (𝓝 y)) ∧
      ∃ y : K₂, Tendsto (fun t : ℝ => U₂ t (J (U₁ (-t) x))) atBot (𝓝 y) := by
  sorry

/-- The Kato–Rosenblum theorem (README §1.9). Let `A` be self-adjoint and `V` bounded,
self-adjoint and trace class, with spectral measures `P₁` of `A` and `P₂` of `A + V` and unitary
groups `U₁ = e^{itA}`, `U₂ = e^{it(A+V)}`. As `t → +∞` and as `t → −∞`, `e^{it(A+V)} e^{−itA} x`
converges for every absolutely continuous `x` of `A` to an absolutely continuous vector of `A + V`,
every absolutely continuous vector of `A + V` is such a limit, and the absolutely continuous spectra
agree (Kato 1957, Theorem 1; Rosenblum 1957, Theorem 1.6; Yafaev, Theorem 1.4; Kato, Ch. X §4.4). -/
theorem katoRosenblum {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (A : H →ₗ.[ℂ] H) (hA : IsSelfAdjoint A) (V : H →L[ℂ] H)
    (hV : IsSelfAdjoint V) (hVtr : V.nuclearENorm ≠ ⊤) (P₁ P₂ : TauCeti.ProjValMeasure ℝ H)
    (hP₁ : IsSpectralMeasureOf A P₁)
    (hP₂ : IsSpectralMeasureOf (A + (V : H →ₗ[ℂ] H).toPMap ⊤) P₂)
    (U₁ U₂ : TauCeti.Semigroups.StronglyContinuousGroup H) (hU₁ : U₁.IsUnitary)
    (hU₂ : U₂.IsUnitary) (hgen₁ : U₁.complexGenerator hU₁ = Complex.I • A)
    (hgen₂ : U₂.complexGenerator hU₂ = Complex.I • (A + (V : H →ₗ[ℂ] H).toPMap ⊤))
    (l : Filter ℝ) (hl : l = atTop ∨ l = atBot) :
    (∀ x : H, P₁.diag x ≪ volume → ∃ y : H, P₂.diag y ≪ volume ∧
        Tendsto (fun t : ℝ => U₂ t (U₁ (-t) x)) l (𝓝 y)) ∧
      (∀ y : H, P₂.diag y ≪ volume → ∃ x : H, P₁.diag x ≪ volume ∧
        Tendsto (fun t : ℝ => U₂ t (U₁ (-t) x)) l (𝓝 y)) ∧
      acSpectrum P₁ = acSpectrum P₂ := by
  sorry

/-! ## Layer 2: Semibounded operators and perturbations -/

/-- The Kato–Rellich theorem, lower bound and cores (README §2.3). Let `A` be self-adjoint with
`γ‖x‖² ≤ ⟪x, Ax⟫` on `dom A`, and `V` symmetric with `dom A ⊆ dom V` and
`‖Vx‖ ≤ a‖x‖ + b‖Ax‖` there, `0 ≤ a`, `0 ≤ b < 1`. Then `A + V`, self-adjoint on `dom A` by Tau
Ceti's `IsSelfAdjoint.add_of_isRelativelyBounded`, is bounded below by
`γ − max(a/(1 − b), a + b|γ|)`, and every core of `A` is a core of `A + V` (Kato, Ch. V, §4.1;
Teschl, Theorem 6.4, whose printed denominator is corrected in the README). -/
theorem katoRellich_lowerBound_hasCore {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] (A V : H →ₗ.[ℂ] H) (hA : IsSelfAdjoint A)
    (hV : V.IsFormalAdjoint V) (a b γ : ℝ) (ha : 0 ≤ a) (hb₀ : 0 ≤ b) (hb : b < 1)
    (hAV : V.IsRelativelyBounded A a b)
    (hγ : ∀ x : A.domain, γ * ‖(x : H)‖ ^ 2 ≤ (⟪(x : H), A x⟫_ℂ).re) :
    (∀ x : (A + V).domain,
        (γ - max (a / (1 - b)) (a + b * |γ|)) * ‖(x : H)‖ ^ 2 ≤ (⟪(x : H), (A + V) x⟫_ℂ).re) ∧
      ∀ D : Submodule ℂ H, A.HasCore D → (A + V).HasCore D := by
  sorry

/-! ## Layer 3: The Laplace–Beltrami operator on a Riemannian manifold -/

/-- The nonnegative Laplacian `Δu = −div grad u` of a complex function on a Riemannian manifold
(README §3.1): minus Tau Ceti's `laplaceBeltrami` applied to the real and imaginary parts. -/
noncomputable def complexLaplacian {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {HM : Type*} [TopologicalSpace HM] (I : ModelWithCorners ℝ E HM)
    {M : Type*} [TopologicalSpace M] [ChartedSpace HM M] [IsManifold I 2 M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)] (u : M → ℂ) (x : M) : ℂ :=
  -((TauCeti.Manifold.laplaceBeltrami I (fun y => (u y).re) x : ℂ) +
    Complex.I * (TauCeti.Manifold.laplaceBeltrami I (fun y => (u y).im) x : ℂ))

/-- The theorem of Gaffney, Chernoff and Strichartz (README §3.6). On a complete Riemannian
manifold without boundary, possibly disconnected, the Laplacian `Δ = −div grad` on compactly
supported smooth complex functions is essentially self-adjoint in `L²(M, vol_g)`, and the domain
of its closure is the maximal domain: the `u ∈ L²` whose distributional Laplacian is in `L²`
(Braverman–Milatovic–Shubin, Corollary 2.10; Strichartz 1983, Theorem 2.4). Here `T` is the
initial operator: its domain is the set of classes of compactly supported smooth functions and it
acts by `Δ`. Completeness is metric completeness for the Riemannian extended distance, equivalently
completeness of every connected component. -/
theorem gaffney_isSelfAdjoint_closure {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {HM : Type*} [TopologicalSpace HM] {I : ModelWithCorners ℝ E HM}
    [I.Boundaryless] {M : Type*} [EMetricSpace M] [ChartedSpace HM M] [IsManifold I ∞ M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)] [IsRiemannianManifold I M] [CompleteSpace M] [SecondCountableTopology M] [MeasurableSpace M]
    [BorelSpace M]
    (T : Lp ℂ 2 (TauCeti.riemannianVolume I M) →ₗ.[ℂ] Lp ℂ 2 (TauCeti.riemannianVolume I M))
    (hdom : ∀ u, u ∈ T.domain ↔ ∃ f : M → ℂ, ContMDiff I 𝓘(ℝ, ℂ) ∞ f ∧ HasCompactSupport f ∧
      (u : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] f)
    (hact : ∀ (u : T.domain) (f : M → ℂ), ContMDiff I 𝓘(ℝ, ℂ) ∞ f → HasCompactSupport f →
      ((u : Lp ℂ 2 (TauCeti.riemannianVolume I M)) : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] f →
      (T u : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] complexLaplacian I f) :
    IsSelfAdjoint T.closure ∧
      ∀ u : Lp ℂ 2 (TauCeti.riemannianVolume I M), u ∈ T.closure.domain ↔
        ∃ w : Lp ℂ 2 (TauCeti.riemannianVolume I M), ∀ φ : M → ℂ,
          ContMDiff I 𝓘(ℝ, ℂ) ∞ φ → HasCompactSupport φ →
            ∫ x, conj (complexLaplacian I φ x) * u x ∂TauCeti.riemannianVolume I M =
              ∫ x, conj (φ x) * w x ∂TauCeti.riemannianVolume I M := by
  sorry

/-- The `L²` kernel of the Laplacian of a complete Riemannian manifold (README §3.7): an element
of `L²(M, vol_g)` lies in the domain of the self-adjoint Laplacian `Δ_M` with `Δ_M u = 0` exactly
when it is almost everywhere equal to a locally constant function. Hence on a connected `M` the
eigenvalue `0` occurs exactly when the volume is finite, with the constants as eigenspace
(Hide–Magee state the finite-area hyperbolic case; the general case is the kernel route of README
§3.7). -/
theorem exists_mem_domain_closure_eq_zero_iff {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] {HM : Type*} [TopologicalSpace HM]
    {I : ModelWithCorners ℝ E HM} [I.Boundaryless] {M : Type*} [EMetricSpace M]
    [ChartedSpace HM M] [IsManifold I ∞ M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)] [IsRiemannianManifold I M] [CompleteSpace M] [SecondCountableTopology M] [MeasurableSpace M]
    [BorelSpace M]
    (T : Lp ℂ 2 (TauCeti.riemannianVolume I M) →ₗ.[ℂ] Lp ℂ 2 (TauCeti.riemannianVolume I M))
    (hdom : ∀ u, u ∈ T.domain ↔ ∃ f : M → ℂ, ContMDiff I 𝓘(ℝ, ℂ) ∞ f ∧ HasCompactSupport f ∧
      (u : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] f)
    (hact : ∀ (u : T.domain) (f : M → ℂ), ContMDiff I 𝓘(ℝ, ℂ) ∞ f → HasCompactSupport f →
      ((u : Lp ℂ 2 (TauCeti.riemannianVolume I M)) : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] f →
      (T u : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] complexLaplacian I f)
    (u : Lp ℂ 2 (TauCeti.riemannianVolume I M)) :
    (∃ h : u ∈ T.closure.domain, T.closure ⟨u, h⟩ = 0) ↔
      ∃ f : M → ℂ, IsLocallyConstant f ∧ (u : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] f := by
  sorry

/-- Bounded potentials on a complete Riemannian manifold (README §3.9). For a real essentially
bounded `V`, the operator `Δ + V` on compactly supported smooth complex functions, `Δ = −div grad`,
is essentially self-adjoint in `L²(M, vol_g)`; the domain of its closure is the domain of the
self-adjoint Laplacian `Δ_M` (the `u ∈ L²` whose distributional Laplacian is in `L²`), so that the
closure is `Δ_M + V`; and the closure is bounded below by `ess inf V` (Teschl, Theorem 6.4 with
relative bound `0`, applied to the Laplacian of README §3.6). Here `T` is `Δ + V` on test
functions: its domain is the set of classes of compactly supported smooth functions and it acts by
`f ↦ Δf + V f`. -/
theorem laplacian_add_potential_isSelfAdjoint_closure {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] {HM : Type*} [TopologicalSpace HM]
    {I : ModelWithCorners ℝ E HM} [I.Boundaryless] {M : Type*} [EMetricSpace M]
    [ChartedSpace HM M] [IsManifold I ∞ M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)] [IsRiemannianManifold I M]
    [CompleteSpace M] [SecondCountableTopology M] [MeasurableSpace M] [BorelSpace M]
    (V : M → ℝ) (hV : MemLp V ⊤ (TauCeti.riemannianVolume I M))
    (T : Lp ℂ 2 (TauCeti.riemannianVolume I M) →ₗ.[ℂ] Lp ℂ 2 (TauCeti.riemannianVolume I M))
    (hdom : ∀ u, u ∈ T.domain ↔ ∃ f : M → ℂ, ContMDiff I 𝓘(ℝ, ℂ) ∞ f ∧ HasCompactSupport f ∧
      (u : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] f)
    (hact : ∀ (u : T.domain) (f : M → ℂ), ContMDiff I 𝓘(ℝ, ℂ) ∞ f → HasCompactSupport f →
      ((u : Lp ℂ 2 (TauCeti.riemannianVolume I M)) : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] f →
      (T u : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M]
        fun x => complexLaplacian I f x + (V x : ℂ) * f x) :
    IsSelfAdjoint T.closure ∧
      (∀ u : Lp ℂ 2 (TauCeti.riemannianVolume I M), u ∈ T.closure.domain ↔
        ∃ w : Lp ℂ 2 (TauCeti.riemannianVolume I M), ∀ φ : M → ℂ,
          ContMDiff I 𝓘(ℝ, ℂ) ∞ φ → HasCompactSupport φ →
            ∫ x, conj (complexLaplacian I φ x) * u x ∂TauCeti.riemannianVolume I M =
              ∫ x, conj (φ x) * w x ∂TauCeti.riemannianVolume I M) ∧
      ∀ x : T.closure.domain,
        essInf V (TauCeti.riemannianVolume I M) *
            ‖(x : Lp ℂ 2 (TauCeti.riemannianVolume I M))‖ ^ 2 ≤
          (⟪(x : Lp ℂ 2 (TauCeti.riemannianVolume I M)), T.closure x⟫_ℂ).re := by
  sorry

/-- The part `{y > a}` of the upper half-plane `ℍ = TauCeti.UpperHalfSpace ℝ`, an open
submanifold carrying the restriction of the hyperbolic metric `(dx² + dy²)/y²` (README §3.10). -/
def cuspRegion (a : ℝ) : TopologicalSpace.Opens (TauCeti.UpperHalfSpace ℝ) :=
  ⟨{z | a < ((z : TauCeti.UpperHalfSpace ℝ) : WithLp 2 (ℝ × ℝ)).snd},
    isOpen_lt continuous_const
      ((WithLp.continuous_snd 2 ℝ ℝ).comp TauCeti.UpperHalfSpace.contMDiff_coe.continuous)⟩

/-- A standard cusp end of width `w > 0` and height `a > 0` in a Riemannian manifold `M` (README
§3.10), presented by its universal cover: a local Riemannian isometry `φ` from `{y > a} ⊆ ℍ` into
`M` whose fibres are exactly the orbits of the translation `(x, y) ↦ (x + w, y)`. Its image is an
open set isometric to `(ℝ/wℤ) × (a, ∞)` with the metric `(dx² + dy²)/y²`. -/
def IsStandardCuspEnd {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] {HM : Type*}
    [TopologicalSpace HM] (I : ModelWithCorners ℝ E HM) {M : Type*} [TopologicalSpace M]
    [ChartedSpace HM M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)] (w a : ℝ)
    (φ : cuspRegion a → M) : Prop :=
  0 < w ∧ 0 < a ∧ TauCeti.IsLocalRiemannianIsometry 𝓘(ℝ, WithLp 2 (ℝ × ℝ)) I φ ∧
    ∀ z z' : cuspRegion a, φ z = φ z' ↔
      ((z : TauCeti.UpperHalfSpace ℝ) : WithLp 2 (ℝ × ℝ)).snd =
          ((z' : TauCeti.UpperHalfSpace ℝ) : WithLp 2 (ℝ × ℝ)).snd ∧
        ∃ n : ℤ, ((z' : TauCeti.UpperHalfSpace ℝ) : WithLp 2 (ℝ × ℝ)).fst =
          ((z : TauCeti.UpperHalfSpace ℝ) : WithLp 2 (ℝ × ℝ)).fst + n * w

/-- The threshold one quarter (README §3.10): if a complete Riemannian manifold `M` contains a
standard cusp end, then every `λ ≥ 1/4` lies in the essential spectrum of its self-adjoint
Laplacian `Δ_M`, the closure of the initial operator `T` (Lax–Phillips 1980, (2.8)–(2.10) and the
zero Fourier mode in a cusp; Iwaniec, Ch. 7). The cusp end forces `M` to be a surface. -/
theorem Ici_quarter_subset_essentialSpectrum {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] {HM : Type*} [TopologicalSpace HM]
    {I : ModelWithCorners ℝ E HM} [I.Boundaryless] {M : Type*} [EMetricSpace M]
    [ChartedSpace HM M] [IsManifold I ∞ M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)] [IsRiemannianManifold I M] [CompleteSpace M] [SecondCountableTopology M] [MeasurableSpace M]
    [BorelSpace M]
    (T : Lp ℂ 2 (TauCeti.riemannianVolume I M) →ₗ.[ℂ] Lp ℂ 2 (TauCeti.riemannianVolume I M))
    (hdom : ∀ u, u ∈ T.domain ↔ ∃ f : M → ℂ, ContMDiff I 𝓘(ℝ, ℂ) ∞ f ∧ HasCompactSupport f ∧
      (u : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] f)
    (hact : ∀ (u : T.domain) (f : M → ℂ), ContMDiff I 𝓘(ℝ, ℂ) ∞ f → HasCompactSupport f →
      ((u : Lp ℂ 2 (TauCeti.riemannianVolume I M)) : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] f →
      (T u : M → ℂ) =ᵐ[TauCeti.riemannianVolume I M] complexLaplacian I f)
    (w a : ℝ) (φ : cuspRegion a → M) (hφ : IsStandardCuspEnd I w a φ) :
    (fun t : ℝ => (t : ℂ)) '' Set.Ici (1 / 4) ⊆ essentialSpectrum T.closure := by
  sorry

/-! ## Layer 4: Schrödinger operators on `L²(ℝ^d)` -/

/-- Schrödinger operators with bounded potentials (README §4.4). Let `d ≥ 1` and `V` a bounded
measurable real potential on `ℝ^d`, and let `T` be `−Δ + V` on compactly supported smooth
functions, with Mathlib's `Δ = Σ ∂ⱼ²`. Then `T` is essentially self-adjoint, the domain of its
closure `H_V` is the Sobolev space `H²(ℝ^d)`, `H_V ≥ ess inf V`, and if `V` vanishes at infinity
then `σ_ess(H_V) = [0, ∞)` (Teschl, Theorem 6.4 with relative bound `0`, Theorem 7.8, Lemma 7.9 and
Theorem 10.2; Reed–Simon II, §X.2). In dimension three the first two clauses are the case
`V₂ = 0` of UnboundedOperators UO-E06. -/
theorem schrodinger_isSelfAdjoint_closure (d : ℕ) (hd : 0 < d)
    (V : EuclideanSpace ℝ (Fin d) → ℝ) (hV : MemLp V ⊤ volume)
    (T : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))) →ₗ.[ℂ]
      Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))))
    (hdom : ∀ u, u ∈ T.domain ↔ ∃ f : EuclideanSpace ℝ (Fin d) → ℂ,
      ContDiff ℝ ∞ f ∧ HasCompactSupport f ∧ (u : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume] f)
    (hact : ∀ (u : T.domain) (f : EuclideanSpace ℝ (Fin d) → ℂ), ContDiff ℝ ∞ f →
      HasCompactSupport f →
      ((u : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d)))) :
        EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume] f →
      (T u : EuclideanSpace ℝ (Fin d) → ℂ) =ᵐ[volume] fun x => -(Δ f) x + (V x : ℂ) * f x) :
    IsSelfAdjoint T.closure ∧
      (∀ u : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))),
        u ∈ T.closure.domain ↔ TemperedDistribution.MemSobolev 2 2 (u : 𝓢'(EuclideanSpace ℝ (Fin d), ℂ))) ∧
      (∀ x : T.closure.domain,
        essInf V volume * ‖(x : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d))))‖ ^ 2 ≤
          (⟪(x : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin d)))), T.closure x⟫_ℂ).re) ∧
      ((∀ ε > 0, ∃ R : ℝ, ∀ᵐ x ∂(volume : Measure (EuclideanSpace ℝ (Fin d))),
          R < ‖x‖ → |V x| ≤ ε) →
        essentialSpectrum T.closure = (fun t : ℝ => (t : ℂ)) '' Set.Ici 0) := by
  sorry

end TauCetiRoadmap.SchrodingerOperatorsAndSpectralTypes
