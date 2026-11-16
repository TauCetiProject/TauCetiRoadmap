module

public import Mathlib
public import TauCeti.Analysis.Sobolev.WeakDeriv.Basic

/-!
# Compressible Euler equations and maximal developments: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need, each with a real body on a carrier that exists at the pins.

Carriers. Space is `EuclideanSpace ℝ (Fin n)` (written `𝔼 n` below) and spacetime `ℝ × 𝔼 n`.
An equation of state is a pressure law on an open set of density–entropy pairs
(`EquationOfState`); a fluid field is a map `U = (ρ, v, s) : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ`, and a
classical solution of the full compressible Euler system is `EquationOfState.IsSolution`. A
barotropic law `p(ρ)` on an open interval `I` is the equation of state with states `I × ℝ` and
pressure `(ρ, s) ↦ p ρ`; its solutions are the full solutions of constant entropy, and entropy
stays constant on slabs (README §1.3) and on developments (README §8.1), so every statement below
about the full system contains the barotropic one. A quasilinear
symmetric hyperbolic system is `QuasilinearSystem`. Causal curves, past-inextendibility, causal
pasts and future domains of dependence of a cone field are the time-parametrised notions of
README §§3.2–3.3, to which LorentzianGeometry §12.6 reduces its notions for the acoustical field;
they are restated here only because the pins have none. The Sobolev space `Hᵏ_Λ` is measured by
`sobolevNormSq` over a fundamental domain of the period group, with Tau Ceti's
`TauCeti.HasWeakLineDerivOn` for the weak derivatives.

Headline theorems stated here:
* local uniqueness on lens-shaped domains (`QuasilinearSystem.eqOn_lens`, §6.1) and uniqueness on
  domains of dependence (`QuasilinearSystem.eqOn_causalPast`, §6.2) for quasilinear symmetric
  hyperbolic systems;
* local well-posedness of the quasilinear Cauchy problem in `Hᵏ_Λ`, `2k > n + 2`: existence on a
  time depending only on a bound for the `Hᵏ_Λ` norm of the data and a compact set of states
  containing their values, uniqueness among classical solutions, continuity in time and
  continuous dependence (`QuasilinearSystem.localWellPosedness`, §7.1), and the
  continuation criterion (`QuasilinearSystem.exists_extension_of_lintegral_lt_top`, §7.1);
* local well-posedness of compressible Euler for non-vacuum `Hᵏ_Λ` data
  (`EquationOfState.localWellPosedness`, §7.2) and its continuation criterion
  (`EquationOfState.exists_extension_of_lintegral_lt_top`, §7.2);
* the theory of developments (§8.2): the maximal common development of two developments
  (`EquationOfState.maximalCommonDevelopment`), compatibility exactly when a common upper bound
  exists (`EquationOfState.compatible_iff`), existence of maximal developments
  (`EquationOfState.exists_maximal_development`), and the uniqueness criterion for data extending
  to the whole future half-space (`EquationOfState.isGreatest_development_of_solution`);
* existence of developments inside a slab of existence, and the slab inside every maximal
  development of full Cauchy data (`EquationOfState.isDevelopment_slab`,
  `EquationOfState.slab_subset_of_maximal`, §8.3);
* the causal character of the boundary of a development and the nullity of its regular part when
  no larger development reaches it, in particular for maximal developments
  (`EquationOfState.boundary_futureCausal`, `EquationOfState.boundary_null`, §8.4).

Every headline of the README is statable at the pins; none is omitted.
-/

@[expose] public section

namespace TauCetiRoadmap.CompressibleEulerEquations

open MeasureTheory Set Filter Topology
open scoped ContDiff ENNReal Matrix

/-- Euclidean space `ℝⁿ`, the spatial carrier `E`. -/
local notation "𝔼" n:max => EuclideanSpace ℝ (Fin n)

/-! ## Layer 1: equations of state and the Euler systems -/

/-- An equation of state (§1.1): an open set `states` of density–entropy pairs `(ρ, s)` with
`ρ > 0`, and a pressure law `P(ρ, s)` that is smooth on it with `∂_ρ P > 0` there. A barotropic
law `p(ρ)` on an open interval `I ⊆ (0, ∞)` is the case `states = I × ℝ`,
`pressure (ρ, s) = p ρ`. -/
structure EquationOfState where
  /-- The open set `𝒪` of admissible density–entropy pairs. -/
  states : Set (ℝ × ℝ)
  isOpen_states : IsOpen states
  states_subset : states ⊆ Ioi 0 ×ˢ univ
  /-- The pressure `P(ρ, s)`. -/
  pressure : ℝ × ℝ → ℝ
  contDiffOn_pressure : ContDiffOn ℝ ∞ pressure states
  deriv_pressure_pos : ∀ q ∈ states, 0 < deriv (fun ρ => pressure (ρ, q.2)) q.1

namespace EquationOfState

/-- The sound speed `c(ρ, s) = √(∂_ρ P(ρ, s))` (§1.1). -/
noncomputable def soundSpeed (P : EquationOfState) (q : ℝ × ℝ) : ℝ :=
  √(deriv (fun ρ => P.pressure (ρ, q.2)) q.1)

/-- Classical solution of the full compressible Euler system on `D ⊆ ℝ × E` (§1.3). The field is
`U = (ρ, v, s)`, of class `C¹` on `D` with `(ρ, s)` in `states`. With `B = ∂_t + v·∇` the material
derivative, `fderivWithin ℝ U D q (1, v q)` is `(Bρ, Bv, Bs)` at `q`, and the equations are
`Bρ = −ρ div v`, `⟪Bv, w⟫ = −ρ⁻¹ ∂_w (P(ρ, s))` for every `w ∈ E`, and `Bs = 0`. -/
def IsSolution (P : EquationOfState) {n : ℕ} (D : Set (ℝ × 𝔼 n))
    (U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ) : Prop :=
  ContDiffOn ℝ 1 U D ∧ (∀ q ∈ D, ((U q).1, (U q).2.2) ∈ P.states) ∧
    ∀ q ∈ D,
      (fderivWithin ℝ U D q (1, (U q).2.1)).1 =
          -(U q).1 * ∑ i, (fderivWithin ℝ U D q (0, EuclideanSpace.single i 1)).2.1 i ∧
        (∀ w : 𝔼 n, inner ℝ (fderivWithin ℝ U D q (1, (U q).2.1)).2.1 w =
          -((U q).1)⁻¹ * fderivWithin ℝ (fun r => P.pressure ((U r).1, (U r).2.2)) D q (0, w)) ∧
        (fderivWithin ℝ U D q (1, (U q).2.1)).2.2 = 0

/-- The acoustical cone field of a fluid field `U = (ρ, v, s)` (§§3.1–3.2): at each point, the
sound speed `c(ρ, s)` and the velocity `v`. -/
noncomputable def acousticalCone (P : EquationOfState) {n : ℕ} (U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ)
    (q : ℝ × 𝔼 n) : ℝ × 𝔼 n :=
  (P.soundSpeed ((U q).1, (U q).2.2), (U q).2.1)

end EquationOfState

/-! ## Layer 2: quasilinear symmetric hyperbolic systems -/

/-- A quasilinear symmetric hyperbolic system of size `N` in `n` space dimensions (§2.1):
`A⁰(U) ∂_t U + Σᵢ Aⁱ(U) ∂ᵢ U = F(U)` with smooth coefficients on an open set of states, every
`Aⁱ(U)` symmetric and `A⁰(U)` positive definite. -/
structure QuasilinearSystem (n N : ℕ) where
  /-- The open set `G ⊆ ℝ^N` of states. -/
  states : Set (Fin N → ℝ)
  isOpen_states : IsOpen states
  /-- The time coefficient `A⁰`. -/
  A0 : (Fin N → ℝ) → Matrix (Fin N) (Fin N) ℝ
  /-- The spatial coefficients `Aⁱ`. -/
  A : Fin n → (Fin N → ℝ) → Matrix (Fin N) (Fin N) ℝ
  /-- The source `F`. -/
  source : (Fin N → ℝ) → Fin N → ℝ
  contDiffOn_A0 : ContDiffOn ℝ ∞ (fun U => Matrix.of.symm (A0 U)) states
  contDiffOn_A : ∀ i, ContDiffOn ℝ ∞ (fun U => Matrix.of.symm (A i U)) states
  contDiffOn_source : ContDiffOn ℝ ∞ source states
  isSymm_A : ∀ i, ∀ U ∈ states, (A i U).IsSymm
  posDef_A0 : ∀ U ∈ states, (A0 U).PosDef

namespace QuasilinearSystem

variable {n N : ℕ}

/-- The symbol `σ(U; ζ) = ζ₀ A⁰(U) + Σᵢ ζᵢ Aⁱ(U)` at a covector `ζ` on `ℝ × E` (§2.1), with
`ζ₀ = ζ(1, 0)` and `ζᵢ = ζ(0, eᵢ)`. -/
noncomputable def symbol (Q : QuasilinearSystem n N) (U : Fin N → ℝ) (ζ : (ℝ × 𝔼 n) →L[ℝ] ℝ) :
    Matrix (Fin N) (Fin N) ℝ :=
  ζ (1, 0) • Q.A0 U + ∑ i, ζ (0, EuclideanSpace.single i 1) • Q.A i U

/-- The round cone `(c, w)` dominates the system at `U` (Conventions): `σ(U; ζ)` is positive
semidefinite for every covector `ζ` with `ζ₀ + w·ζ' ≥ c |ζ'|`. Here `ζ(1, w) = ζ₀ + w·ζ'`, and
`|ζ'|` is the norm of the restriction of `ζ` to `E`. -/
def Dominates (Q : QuasilinearSystem n N) (U : Fin N → ℝ) (c : ℝ) (w : 𝔼 n) : Prop :=
  ∀ ζ : (ℝ × 𝔼 n) →L[ℝ] ℝ,
    c * ‖ζ.comp (ContinuousLinearMap.inr ℝ ℝ (𝔼 n))‖ ≤ ζ (1, w) → (Q.symbol U ζ).PosSemidef

/-- Classical solution on `D ⊆ ℝ × E` (§2.1): `U` is `C¹` on `D` with values in the states, and
`A⁰(U) ∂_t U + Σᵢ Aⁱ(U) ∂ᵢ U = F(U)` at every point of `D`, derivatives taken within `D`. -/
def IsClassicalSolution (Q : QuasilinearSystem n N) (D : Set (ℝ × 𝔼 n))
    (U : ℝ × 𝔼 n → Fin N → ℝ) : Prop :=
  ContDiffOn ℝ 1 U D ∧ (∀ q ∈ D, U q ∈ Q.states) ∧
    ∀ q ∈ D, Q.A0 (U q) *ᵥ fderivWithin ℝ U D q (1, 0) +
        ∑ i, Q.A i (U q) *ᵥ fderivWithin ℝ U D q (0, EuclideanSpace.single i 1) = Q.source (U q)

end QuasilinearSystem

/-! ## Layer 3: sound cones, causal curves and domains of dependence -/

variable {n : ℕ}

/-- A domain (Conventions): a subset of the closed future half-space `H_{t₀} = [t₀, ∞) × E` that
is relatively open in it. -/
def IsHalfSpaceDomain (t₀ : ℝ) (D : Set (ℝ × 𝔼 n)) : Prop :=
  ∃ W : Set (ℝ × 𝔼 n), IsOpen W ∧ D = W ∩ (Ici t₀ ×ˢ univ)

/-- A time-parametrised causal curve of the cone field `κ = (c, w)` in `D` (§3.2): an interval
`J` (a single point allowed) and a map `x`, locally Lipschitz on `J`, with `(t, x t) ∈ D` for
`t ∈ J`, such that at almost every `t ∈ J` the map `x` is differentiable within `J` and
`|ẋ(t) − w(t, x(t))| ≤ c(t, x(t))`. For the acoustical field this is the form to which
LorentzianGeometry §12.6 reduces its future causal curves in a subset. -/
def IsCausalCurve (κ : ℝ × 𝔼 n → ℝ × 𝔼 n) (D : Set (ℝ × 𝔼 n)) (J : Set ℝ) (x : ℝ → 𝔼 n) :
    Prop :=
  J.OrdConnected ∧ (∀ t ∈ J, (t, x t) ∈ D) ∧ LocallyLipschitzOn J x ∧
    ∀ᵐ t, t ∈ J → DifferentiableWithinAt ℝ x J t ∧
      ‖derivWithin x J t - (κ (t, x t)).2‖ ≤ (κ (t, x t)).1

/-- A past causal curve in `D` ending at `p` (§3.3): a causal curve whose interval has greatest
element `t_p`, with `x(t_p) = x_p`. -/
def IsPastCausalCurve (κ : ℝ × 𝔼 n → ℝ × 𝔼 n) (D : Set (ℝ × 𝔼 n)) (p : ℝ × 𝔼 n) (J : Set ℝ)
    (x : ℝ → 𝔼 n) : Prop :=
  IsCausalCurve κ D J x ∧ IsGreatest J p.1 ∧ x p.1 = p.2

/-- Past-inextendibility in `D`, in the extension form of §3.3 and LorentzianGeometry §12.6: no
past causal curve in `D` ending at `p`, on an interval containing `J`, agrees with `x` on `J`
unless its interval is `J`. -/
def IsPastInextendible (κ : ℝ × 𝔼 n → ℝ × 𝔼 n) (D : Set (ℝ × 𝔼 n)) (p : ℝ × 𝔼 n) (J : Set ℝ)
    (x : ℝ → 𝔼 n) : Prop :=
  ∀ (J' : Set ℝ) (y : ℝ → 𝔼 n), IsPastCausalCurve κ D p J' y → J ⊆ J' → EqOn y x J → J' = J

/-- The future domain of dependence `D⁺_D(S)` (§3.3): the points `p ∈ D` such that every
past-inextendible past causal curve in `D` ending at `p` meets `S`. -/
def futureDomainOfDependence (κ : ℝ × 𝔼 n → ℝ × 𝔼 n) (D S : Set (ℝ × 𝔼 n)) :
    Set (ℝ × 𝔼 n) :=
  {p ∈ D | ∀ (J : Set ℝ) (x : ℝ → 𝔼 n), IsPastCausalCurve κ D p J x →
    IsPastInextendible κ D p J x → ∃ t ∈ J, (t, x t) ∈ S}

/-- The causal past `J⁻_D(p)` (§3.3): the points of the past causal curves in `D` ending at
`p`. -/
def causalPast (κ : ℝ × 𝔼 n → ℝ × 𝔼 n) (D : Set (ℝ × 𝔼 n)) (p : ℝ × 𝔼 n) :
    Set (ℝ × 𝔼 n) :=
  {q | ∃ (J : Set ℝ) (x : ℝ → 𝔼 n), IsPastCausalCurve κ D p J x ∧ q.1 ∈ J ∧ x q.1 = q.2}

/-! ## Layer 4: Sobolev spaces on partially periodic carriers -/

/-- Iterated weak derivatives indexed by multi-indices (§4.1): `g 0 = u`, and for `|α| < k` and
every direction `i`, `g (α + eᵢ)` is a weak derivative of `g α` in the direction `eᵢ` on all of
`E`, in the sense of Tau Ceti's `TauCeti.HasWeakLineDerivOn` for Lebesgue measure (which includes
local integrability). -/
def IsWeakDerivFamily (k : ℕ) (u : 𝔼 n → ℝ) (g : (Fin n → ℕ) → 𝔼 n → ℝ) : Prop :=
  g 0 = u ∧ ∀ (α : Fin n → ℕ) (i : Fin n), ∑ j, α j < k →
    TauCeti.HasWeakLineDerivOn volume ⊤ (g α) (g (α + Pi.single i 1))
      (EuclideanSpace.single i 1)

/-- The squared `Hᵏ` norm over a set `F` (§4.1): `Σ_{|α| ≤ k} ∫_F |∂^α u|²` in `[0, ∞]`, and `∞`
when the weak derivatives of order at most `k` do not exist on `E`. For a period group `Λ`, a
measurable fundamental domain `F` of `Λ` and a `Λ`-periodic `u` this is `‖u‖²_{Hᵏ_Λ}`. -/
noncomputable def sobolevNormSq (F : Set (𝔼 n)) (k : ℕ) (u : 𝔼 n → ℝ) : ℝ≥0∞ :=
  ⨅ (g : (Fin n → ℕ) → 𝔼 n → ℝ) (_ : IsWeakDerivFamily k u g),
    ∑ m ∈ Finset.range (k + 1), ∑ α ∈ Finset.Nat.antidiagonalTuple n m,
      ∫⁻ x in F, ‖g α x‖ₑ ^ 2

/-- The squared `Hᵏ_Λ` norm of a map into `ℝ^N` (§4.1): the sum over its coordinates. -/
noncomputable def sobolevNormSqVec {N : ℕ} (F : Set (𝔼 n)) (k : ℕ) (u : 𝔼 n → Fin N → ℝ) :
    ℝ≥0∞ :=
  ∑ j, sobolevNormSq F k (fun x => u x j)

/-- The squared `Hᵏ_Λ` norm of a fluid field `(ρ, v, s) : E → ℝ × E × ℝ` (§4.1): the sum over
the density, the `n` coordinates of the velocity and the entropy. -/
noncomputable def stateSobolevNormSq (F : Set (𝔼 n)) (k : ℕ) (u : 𝔼 n → ℝ × 𝔼 n × ℝ) :
    ℝ≥0∞ :=
  sobolevNormSq F k (fun x => (u x).1) + ∑ i, sobolevNormSq F k (fun x => (u x).2.1 i) +
    sobolevNormSq F k (fun x => (u x).2.2)

/-- `U − Ū ∈ C(I; Hᵏ_Λ)` for a set of times `I`, measured by a squared norm `ν` (§4.1): each
`U(t) − Ū`, `t ∈ I`, has finite norm, and `t ↦ U(t)` is continuous on `I` for `ν`. -/
def IsContinuousIn {V : Type*} [AddCommGroup V] (ν : (𝔼 n → V) → ℝ≥0∞) (I : Set ℝ) (Ū : V)
    (U : ℝ × 𝔼 n → V) : Prop :=
  (∀ t ∈ I, ν (fun x => U (t, x) - Ū) < ⊤) ∧
    ∀ t ∈ I, Tendsto (fun t' => ν (fun x => U (t', x) - U (t, x))) (𝓝[I] t) (𝓝 0)

/-! ## Layer 6: local uniqueness and domains of dependence -/

/-- A lens function on the slab `[t₁, t₂] × E` for the period group `Λ` (§6.1): Lipschitz on the
slab, `Λ`-periodic there, and with `{φ > 0}` relatively compact modulo `Λ` (covered by the
`Λ`-translates of one compact set). Its lens is `{q ∈ [t₁, t₂] × E : φ q > 0}`. -/
def IsLensFunction (Λ : AddSubgroup (𝔼 n)) (t₁ t₂ : ℝ) (φ : ℝ × 𝔼 n → ℝ) : Prop :=
  (∃ C, LipschitzOnWith C φ (Icc t₁ t₂ ×ˢ univ)) ∧
    (∀ ℓ ∈ Λ, ∀ q ∈ Icc t₁ t₂ ×ˢ univ, φ (q.1, q.2 + ℓ) = φ q) ∧
    ∃ K : Set (ℝ × 𝔼 n), IsCompact K ∧
      ∀ q ∈ Icc t₁ t₂ ×ˢ univ, 0 < φ q → ∃ ℓ ∈ Λ, (q.1, q.2 - ℓ) ∈ K

/-- **Local uniqueness on lens-shaped domains** (§6.1). Two `Λ`-periodic classical solutions of
a quasilinear symmetric hyperbolic system on a `Λ`-invariant relatively open subset `O` of the slab
`[t₁, t₂] × E` containing the closure of the lens of `φ`, where `φ` is spacelike for the first
solution (`σ(U₁; dφ)` negative semidefinite almost everywhere on the lens), agree on the lens if
they agree on its base `{(t₁, x) : φ(t₁, x) > 0}`. -/
theorem QuasilinearSystem.eqOn_lens [NeZero n] {N : ℕ} (Q : QuasilinearSystem n N)
    (Λ : AddSubgroup (𝔼 n)) [DiscreteTopology Λ] {t₁ t₂ : ℝ} {φ : ℝ × 𝔼 n → ℝ}
    (hφ : IsLensFunction Λ t₁ t₂ φ) {O : Set (ℝ × 𝔼 n)}
    (hO : ∃ W : Set (ℝ × 𝔼 n), IsOpen W ∧ O = W ∩ (Icc t₁ t₂ ×ˢ univ))
    (hOΛ : ∀ ℓ ∈ Λ, ∀ q ∈ O, (q.1, q.2 + ℓ) ∈ O)
    (hLO : closure {q ∈ Icc t₁ t₂ ×ˢ univ | 0 < φ q} ⊆ O) {U₁ U₂ : ℝ × 𝔼 n → Fin N → ℝ}
    (h₁ : Q.IsClassicalSolution O U₁) (h₂ : Q.IsClassicalSolution O U₂)
    (hper₁ : ∀ ℓ ∈ Λ, ∀ q ∈ O, U₁ (q.1, q.2 + ℓ) = U₁ q)
    (hper₂ : ∀ ℓ ∈ Λ, ∀ q ∈ O, U₂ (q.1, q.2 + ℓ) = U₂ q)
    (hsp : ∀ᵐ q, q ∈ {q ∈ Icc t₁ t₂ ×ˢ univ | 0 < φ q} →
      (-Q.symbol (U₁ q) (fderiv ℝ φ q)).PosSemidef)
    (hbase : ∀ x, 0 < φ (t₁, x) → U₁ (t₁, x) = U₂ (t₁, x)) :
    EqOn U₁ U₂ {q ∈ Icc t₁ t₂ ×ˢ univ | 0 < φ q} := by
  sorry

/-- **Uniqueness on domains of dependence** (§6.2). Let `κ` be a continuous map assigning to
every state a round cone `(c, w)`, `c > 0`, that dominates the system there, `D` a domain, `U₁` a
classical solution on `D`, `O` a domain carrying a classical solution `U₂`, and `S` an open subset
of `E` with `{t₀} × S ⊆ D` on which the two agree where both are defined. Then they agree on the
causal past `J⁻_D(p)`, for the cone field `κ ∘ U₁`, of every `p ∈ D⁺_D({t₀} × S)` whose causal
past lies in `O`. -/
theorem QuasilinearSystem.eqOn_causalPast [NeZero n] {N : ℕ} (Q : QuasilinearSystem n N)
    {κ : (Fin N → ℝ) → ℝ × 𝔼 n} (hκ : ContinuousOn κ Q.states)
    (hκpos : ∀ U ∈ Q.states, 0 < (κ U).1)
    (hκdom : ∀ U ∈ Q.states, Q.Dominates U (κ U).1 (κ U).2) {t₀ : ℝ} {D O : Set (ℝ × 𝔼 n)}
    (hD : IsHalfSpaceDomain t₀ D) (hO : IsHalfSpaceDomain t₀ O) {U₁ U₂ : ℝ × 𝔼 n → Fin N → ℝ}
    (h₁ : Q.IsClassicalSolution D U₁) (h₂ : Q.IsClassicalSolution O U₂) {S : Set (𝔼 n)}
    (hS : IsOpen S) (hSD : {t₀} ×ˢ S ⊆ D) (hdata : ∀ x ∈ S, (t₀, x) ∈ O → U₁ (t₀, x) = U₂ (t₀, x))
    {p : ℝ × 𝔼 n} (hp : p ∈ futureDomainOfDependence (κ ∘ U₁) D ({t₀} ×ˢ S))
    (hpO : causalPast (κ ∘ U₁) D p ⊆ O) :
    EqOn U₁ U₂ (causalPast (κ ∘ U₁) D p) := by
  sorry

/-! ## Layer 7: local well-posedness -/

/-- **Local well-posedness in `Hᵏ_Λ`** for quasilinear symmetric hyperbolic systems (§7.1; Kato).
Let `Ū` be a state with `F(Ū) = 0`, `Λ` a period group with measurable fundamental domain `F`,
`2k > n + 2`, `K` a compact set of states containing `Ū`, and `M` a bound. There are `T > 0` and
`R` such that every continuous `Λ`-periodic datum `U₀` with values in `K` and
`‖U₀ − Ū‖_{Hᵏ_Λ} ≤ M` has a `Λ`-periodic classical solution on `[0, T] × E` with
`U − Ū ∈ C([0, T]; Hᵏ_Λ)` and `‖U(t) − Ū‖_{Hᵏ_Λ} ≤ R`, which is the only classical solution on
`[0, T) × E` with these data; and the solutions depend continuously on the data in
`C([0, T]; Hᵏ_Λ)`. -/
theorem QuasilinearSystem.localWellPosedness [NeZero n] {N : ℕ} (Q : QuasilinearSystem n N)
    (Λ : AddSubgroup (𝔼 n)) [DiscreteTopology Λ] {F : Set (𝔼 n)}
    (hF : IsAddFundamentalDomain Λ F volume) {k : ℕ} (hk : n + 2 < 2 * k) {Ū : Fin N → ℝ}
    (hŪ : Ū ∈ Q.states) (hsrc : Q.source Ū = 0) {K : Set (Fin N → ℝ)} (hK : IsCompact K)
    (hKQ : K ⊆ Q.states) (hŪK : Ū ∈ K) (M : ℝ) :
    ∃ T > 0, ∃ R : ℝ,
      (∀ U₀ : 𝔼 n → Fin N → ℝ, Continuous U₀ → (∀ ℓ ∈ Λ, ∀ x, U₀ (x + ℓ) = U₀ x) →
        (∀ x, U₀ x ∈ K) → sobolevNormSqVec F k (fun x => U₀ x - Ū) ≤ ENNReal.ofReal M ^ 2 →
        ∃ U : ℝ × 𝔼 n → Fin N → ℝ, Q.IsClassicalSolution (Icc 0 T ×ˢ univ) U ∧
          (∀ x, U (0, x) = U₀ x) ∧
          (∀ ℓ ∈ Λ, ∀ q ∈ Icc 0 T ×ˢ univ, U (q.1, q.2 + ℓ) = U q) ∧
          IsContinuousIn (sobolevNormSqVec F k) (Icc 0 T) Ū U ∧
          (∀ t ∈ Icc 0 T,
            sobolevNormSqVec F k (fun x => U (t, x) - Ū) ≤ ENNReal.ofReal R ^ 2) ∧
          ∀ U' : ℝ × 𝔼 n → Fin N → ℝ, Q.IsClassicalSolution (Ico 0 T ×ˢ univ) U' →
            (∀ x, U' (0, x) = U₀ x) → EqOn U' U (Ico 0 T ×ˢ univ)) ∧
      ∀ (U₀ : ℕ → 𝔼 n → Fin N → ℝ) (V₀ : 𝔼 n → Fin N → ℝ) (U : ℕ → ℝ × 𝔼 n → Fin N → ℝ)
        (V : ℝ × 𝔼 n → Fin N → ℝ),
        (∀ m, Continuous (U₀ m) ∧ (∀ ℓ ∈ Λ, ∀ x, U₀ m (x + ℓ) = U₀ m x) ∧
          (∀ x, U₀ m x ∈ K) ∧
          sobolevNormSqVec F k (fun x => U₀ m x - Ū) ≤ ENNReal.ofReal M ^ 2) →
        Continuous V₀ → (∀ ℓ ∈ Λ, ∀ x, V₀ (x + ℓ) = V₀ x) → (∀ x, V₀ x ∈ K) →
        sobolevNormSqVec F k (fun x => V₀ x - Ū) ≤ ENNReal.ofReal M ^ 2 →
        (∀ m, Q.IsClassicalSolution (Icc 0 T ×ˢ univ) (U m) ∧ ∀ x, U m (0, x) = U₀ m x) →
        Q.IsClassicalSolution (Icc 0 T ×ˢ univ) V → (∀ x, V (0, x) = V₀ x) →
        Tendsto (fun m => sobolevNormSqVec F k (fun x => U₀ m x - V₀ x)) atTop (𝓝 0) →
        Tendsto (fun m => ⨆ t ∈ Icc 0 T, sobolevNormSqVec F k (fun x => U m (t, x) - V (t, x)))
          atTop (𝓝 0) := by
  sorry

/-- **Continuation criterion** (§7.1). A `Λ`-periodic classical solution on `[0, T) × E` with
`U − Ū ∈ C([0, T); Hᵏ_Λ)`, values in a compact set of states and `∫₀ᵀ ‖∇U(t)‖_∞ dt < ∞`
extends to a classical solution on `[0, T'] × E` for some `T' > T`, with
`U − Ū ∈ C([0, T']; Hᵏ_Λ)`. Equivalently, at a finite maximal time `T*` either
`∫₀^{T*} ‖∇U‖_∞ = ∞` or the closure of the range of `U` is not a compact set of states. -/
theorem QuasilinearSystem.exists_extension_of_lintegral_lt_top [NeZero n] {N : ℕ}
    (Q : QuasilinearSystem n N) (Λ : AddSubgroup (𝔼 n)) [DiscreteTopology Λ] {F : Set (𝔼 n)}
    (hF : IsAddFundamentalDomain Λ F volume) {k : ℕ} (hk : n + 2 < 2 * k) {Ū : Fin N → ℝ}
    (hŪ : Ū ∈ Q.states) (hsrc : Q.source Ū = 0) {T : ℝ} (hT : 0 < T)
    {U : ℝ × 𝔼 n → Fin N → ℝ} (hU : Q.IsClassicalSolution (Ico 0 T ×ˢ univ) U)
    (hper : ∀ ℓ ∈ Λ, ∀ q ∈ Ico 0 T ×ˢ univ, U (q.1, q.2 + ℓ) = U q)
    (hHk : IsContinuousIn (sobolevNormSqVec F k) (Ico 0 T) Ū U)
    (hgrad : ∫⁻ t in Ico 0 T, ⨆ x, ‖fderiv ℝ (fun y => U (t, y)) x‖ₑ < ⊤)
    (hcpt : ∃ K : Set (Fin N → ℝ), IsCompact K ∧ K ⊆ Q.states ∧
      ∀ q ∈ Ico 0 T ×ˢ univ, U q ∈ K) :
    ∃ T' > T, ∃ U' : ℝ × 𝔼 n → Fin N → ℝ, Q.IsClassicalSolution (Icc 0 T' ×ˢ univ) U' ∧
      EqOn U' U (Ico 0 T ×ˢ univ) ∧ IsContinuousIn (sobolevNormSqVec F k) (Icc 0 T') Ū U' := by
  sorry

/-- **Local well-posedness of compressible Euler** (§7.2). Let `P` be an equation of state, `Λ`
a period group with measurable fundamental domain `F`, `2k > n + 2`, `Ū = (ρ₀, v₀, s₀)` a
background with `(ρ₀, s₀)` a state, `L` a compact set of states and `M` a bound. There is
`T > 0` such that for every initial time `t₀`, every continuous `Λ`-periodic datum `U₀` with
`(ρ, s)`-values in `L` and `‖U₀ − Ū‖_{Hᵏ_Λ} ≤ M` has a `Λ`-periodic classical solution on
`[t₀, t₀ + T] × E` with `U − Ū ∈ C([t₀, t₀ + T]; Hᵏ_Λ)` and density at least half the least
density on `L`, which is the only classical solution there with these data; and the solutions
depend continuously on the data in `C([t₀, t₀ + T]; Hᵏ_Λ)`. -/
theorem EquationOfState.localWellPosedness [NeZero n] (P : EquationOfState) (Λ : AddSubgroup (𝔼 n))
    [DiscreteTopology Λ] {F : Set (𝔼 n)} (hF : IsAddFundamentalDomain Λ F volume) {k : ℕ}
    (hk : n + 2 < 2 * k) {Ū : ℝ × 𝔼 n × ℝ} (hŪ : (Ū.1, Ū.2.2) ∈ P.states) {L : Set (ℝ × ℝ)}
    (hL : IsCompact L) (hLP : L ⊆ P.states) (M : ℝ) :
    ∃ T > 0, ∀ t₀ : ℝ,
      (∀ U₀ : 𝔼 n → ℝ × 𝔼 n × ℝ, Continuous U₀ → (∀ ℓ ∈ Λ, ∀ x, U₀ (x + ℓ) = U₀ x) →
        (∀ x, ((U₀ x).1, (U₀ x).2.2) ∈ L) →
        stateSobolevNormSq F k (fun x => U₀ x - Ū) ≤ ENNReal.ofReal M ^ 2 →
        ∃ U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ, P.IsSolution (Icc t₀ (t₀ + T) ×ˢ univ) U ∧
          (∀ x, U (t₀, x) = U₀ x) ∧
          (∀ ℓ ∈ Λ, ∀ q ∈ Icc t₀ (t₀ + T) ×ˢ univ, U (q.1, q.2 + ℓ) = U q) ∧
          IsContinuousIn (stateSobolevNormSq F k) (Icc t₀ (t₀ + T)) Ū U ∧
          (∀ r : ℝ, (∀ l ∈ L, r ≤ l.1) → ∀ q ∈ Icc t₀ (t₀ + T) ×ˢ univ, r / 2 ≤ (U q).1) ∧
          ∀ U' : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ, P.IsSolution (Icc t₀ (t₀ + T) ×ˢ univ) U' →
            (∀ x, U' (t₀, x) = U₀ x) → EqOn U' U (Icc t₀ (t₀ + T) ×ˢ univ)) ∧
      ∀ (U₀ : ℕ → 𝔼 n → ℝ × 𝔼 n × ℝ) (V₀ : 𝔼 n → ℝ × 𝔼 n × ℝ)
        (U : ℕ → ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ) (V : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ),
        (∀ m, Continuous (U₀ m) ∧ (∀ ℓ ∈ Λ, ∀ x, U₀ m (x + ℓ) = U₀ m x) ∧
          (∀ x, ((U₀ m x).1, (U₀ m x).2.2) ∈ L) ∧
          stateSobolevNormSq F k (fun x => U₀ m x - Ū) ≤ ENNReal.ofReal M ^ 2) →
        Continuous V₀ → (∀ ℓ ∈ Λ, ∀ x, V₀ (x + ℓ) = V₀ x) →
        (∀ x, ((V₀ x).1, (V₀ x).2.2) ∈ L) →
        stateSobolevNormSq F k (fun x => V₀ x - Ū) ≤ ENNReal.ofReal M ^ 2 →
        (∀ m, P.IsSolution (Icc t₀ (t₀ + T) ×ˢ univ) (U m) ∧ ∀ x, U m (t₀, x) = U₀ m x) →
        P.IsSolution (Icc t₀ (t₀ + T) ×ˢ univ) V → (∀ x, V (t₀, x) = V₀ x) →
        Tendsto (fun m => stateSobolevNormSq F k (fun x => U₀ m x - V₀ x)) atTop (𝓝 0) →
        Tendsto (fun m => ⨆ t ∈ Icc t₀ (t₀ + T),
          stateSobolevNormSq F k (fun x => U m (t, x) - V (t, x))) atTop (𝓝 0) := by
  sorry

/-- **Continuation criterion for compressible Euler** (§7.2). A `Λ`-periodic classical solution
on `[t₀, t₀ + T) × E` with `U − Ū ∈ C([t₀, t₀ + T); Hᵏ_Λ)`, `∫ ‖∇(ρ, v, s)‖_∞ dt < ∞` and the
values of `(ρ, s)` in a compact set of states extends to a classical solution on
`[t₀, t₀ + T'] × E` for some `T' > T`, with `U − Ū ∈ C([t₀, t₀ + T']; Hᵏ_Λ)`. -/
theorem EquationOfState.exists_extension_of_lintegral_lt_top [NeZero n] (P : EquationOfState)
    (Λ : AddSubgroup (𝔼 n)) [DiscreteTopology Λ] {F : Set (𝔼 n)}
    (hF : IsAddFundamentalDomain Λ F volume) {k : ℕ} (hk : n + 2 < 2 * k) {Ū : ℝ × 𝔼 n × ℝ}
    (hŪ : (Ū.1, Ū.2.2) ∈ P.states) {t₀ T : ℝ} (hT : 0 < T) {U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ}
    (hU : P.IsSolution (Ico t₀ (t₀ + T) ×ˢ univ) U)
    (hper : ∀ ℓ ∈ Λ, ∀ q ∈ Ico t₀ (t₀ + T) ×ˢ univ, U (q.1, q.2 + ℓ) = U q)
    (hHk : IsContinuousIn (stateSobolevNormSq F k) (Ico t₀ (t₀ + T)) Ū U)
    (hgrad : ∫⁻ t in Ico t₀ (t₀ + T), ⨆ x, ‖fderiv ℝ (fun y => U (t, y)) x‖ₑ < ⊤)
    (hcpt : ∃ L : Set (ℝ × ℝ), IsCompact L ∧ L ⊆ P.states ∧
      ∀ q ∈ Ico t₀ (t₀ + T) ×ˢ univ, ((U q).1, (U q).2.2) ∈ L) :
    ∃ T' > T, ∃ U' : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ, P.IsSolution (Icc t₀ (t₀ + T') ×ˢ univ) U' ∧
      EqOn U' U (Ico t₀ (t₀ + T) ×ˢ univ) ∧
      IsContinuousIn (stateSobolevNormSq F k) (Icc t₀ (t₀ + T')) Ū U' := by
  sorry

/-! ## Layer 8: developments and maximal developments -/

/-- A development of the Cauchy data `Ū` on the open set `S ⊆ E` at time `t₀`, for the period
group `Λ` (§8.1): a `Λ`-invariant domain `D ⊆ H_{t₀}` with `D ∩ Σ_{t₀} = {t₀} × S`, a
`Λ`-periodic classical solution `U` on `D` with `U(t₀, x) = Ū x` on `S`, and
`D = D⁺_D({t₀} × S)` for the acoustical cone field of `U`. Developments are ordered by
`(D₁, U₁) ≤ (D₂, U₂)` iff `D₁ ⊆ D₂` and `U₂ = U₁` on `D₁`, and are compatible when the solutions
agree on `D₁ ∩ D₂`. -/
def EquationOfState.IsDevelopment (P : EquationOfState) (t₀ : ℝ) (Λ : AddSubgroup (𝔼 n))
    (S : Set (𝔼 n)) (Ū : 𝔼 n → ℝ × 𝔼 n × ℝ) (D : Set (ℝ × 𝔼 n))
    (U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ) : Prop :=
  IsHalfSpaceDomain t₀ D ∧ (∀ ℓ ∈ Λ, ∀ q ∈ D, (q.1, q.2 + ℓ) ∈ D) ∧
    D ∩ ({t₀} ×ˢ univ) = {t₀} ×ˢ S ∧ P.IsSolution D U ∧
    (∀ ℓ ∈ Λ, ∀ q ∈ D, U (q.1, q.2 + ℓ) = U q) ∧ (∀ x ∈ S, U (t₀, x) = Ū x) ∧
    futureDomainOfDependence (P.acousticalCone U) D ({t₀} ×ˢ S) = D

/-- **The maximal common development** (§8.2). For two developments `(D₁, U₁)`, `(D₂, U₂)` of the
same data, the set `W₁₂` of points of `D₁` whose causal past in `D₁` (for the field of `U₁`) lies
in `D₂` carries `U₁ = U₂`, equals the symmetric set `W₂₁`, is with `U₁` a development, and contains
every development lying below both. -/
theorem EquationOfState.maximalCommonDevelopment [NeZero n] (P : EquationOfState) {t₀ : ℝ}
    {Λ : AddSubgroup (𝔼 n)} [DiscreteTopology Λ] {S : Set (𝔼 n)} {Ū : 𝔼 n → ℝ × 𝔼 n × ℝ}
    {D₁ D₂ : Set (ℝ × 𝔼 n)} {U₁ U₂ : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ}
    (h₁ : P.IsDevelopment t₀ Λ S Ū D₁ U₁) (h₂ : P.IsDevelopment t₀ Λ S Ū D₂ U₂) :
    EqOn U₁ U₂ {p ∈ D₁ | causalPast (P.acousticalCone U₁) D₁ p ⊆ D₂} ∧
      {p ∈ D₁ | causalPast (P.acousticalCone U₁) D₁ p ⊆ D₂} =
        {p ∈ D₂ | causalPast (P.acousticalCone U₂) D₂ p ⊆ D₁} ∧
      P.IsDevelopment t₀ Λ S Ū {p ∈ D₁ | causalPast (P.acousticalCone U₁) D₁ p ⊆ D₂} U₁ ∧
      ∀ (D : Set (ℝ × 𝔼 n)) (U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ), P.IsDevelopment t₀ Λ S Ū D U →
        D ⊆ D₁ → EqOn U₁ U D → D ⊆ D₂ → EqOn U₂ U D →
        D ⊆ {p ∈ D₁ | causalPast (P.acousticalCone U₁) D₁ p ⊆ D₂} := by
  sorry

/-- **Compatibility** (§8.2). Two developments of the same data are compatible iff their maximal
common development is their whole intersection, iff they have a common upper bound. -/
theorem EquationOfState.compatible_iff [NeZero n] (P : EquationOfState) {t₀ : ℝ}
    {Λ : AddSubgroup (𝔼 n)} [DiscreteTopology Λ] {S : Set (𝔼 n)} {Ū : 𝔼 n → ℝ × 𝔼 n × ℝ}
    {D₁ D₂ : Set (ℝ × 𝔼 n)} {U₁ U₂ : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ}
    (h₁ : P.IsDevelopment t₀ Λ S Ū D₁ U₁) (h₂ : P.IsDevelopment t₀ Λ S Ū D₂ U₂) :
    (EqOn U₁ U₂ (D₁ ∩ D₂) ↔ {p ∈ D₁ | causalPast (P.acousticalCone U₁) D₁ p ⊆ D₂} = D₁ ∩ D₂) ∧
      (EqOn U₁ U₂ (D₁ ∩ D₂) ↔
        ∃ (D : Set (ℝ × 𝔼 n)) (U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ), P.IsDevelopment t₀ Λ S Ū D U ∧
          D₁ ⊆ D ∧ EqOn U U₁ D₁ ∧ D₂ ⊆ D ∧ EqOn U U₂ D₂) := by
  sorry

/-- **Existence of maximal developments** (§8.2). Every development lies below a maximal one. -/
theorem EquationOfState.exists_maximal_development [NeZero n] (P : EquationOfState) {t₀ : ℝ}
    {Λ : AddSubgroup (𝔼 n)} [DiscreteTopology Λ] {S : Set (𝔼 n)} {Ū : 𝔼 n → ℝ × 𝔼 n × ℝ}
    {D : Set (ℝ × 𝔼 n)} {U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ} (h : P.IsDevelopment t₀ Λ S Ū D U) :
    ∃ (D' : Set (ℝ × 𝔼 n)) (U' : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ), P.IsDevelopment t₀ Λ S Ū D' U' ∧
      D ⊆ D' ∧ EqOn U' U D ∧
      ∀ (D'' : Set (ℝ × 𝔼 n)) (U'' : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ), P.IsDevelopment t₀ Λ S Ū D'' U'' →
        D' ⊆ D'' → EqOn U'' U' D' → D'' ⊆ D' := by
  sorry

/-- **Uniqueness criterion** (§8.2). If `Λ`-periodic data on a `Λ`-invariant open `S` extend to a
`Λ`-periodic classical solution `U` on the whole half-space `H_{t₀}`, then
`(D⁺_{H_{t₀}}({t₀} × S), U)` is a development lying above every development of the data: it is the
unique maximal development. -/
theorem EquationOfState.isGreatest_development_of_solution [NeZero n] (P : EquationOfState) {t₀ : ℝ}
    {Λ : AddSubgroup (𝔼 n)} [DiscreteTopology Λ] {S : Set (𝔼 n)} (hS : IsOpen S)
    (hSΛ : ∀ ℓ ∈ Λ, ∀ x ∈ S, x + ℓ ∈ S) {Ū : 𝔼 n → ℝ × 𝔼 n × ℝ}
    {U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ} (hU : P.IsSolution (Ici t₀ ×ˢ univ) U)
    (hper : ∀ ℓ ∈ Λ, ∀ q ∈ Ici t₀ ×ˢ univ, U (q.1, q.2 + ℓ) = U q)
    (hdata : ∀ x ∈ S, U (t₀, x) = Ū x) :
    P.IsDevelopment t₀ Λ S Ū
        (futureDomainOfDependence (P.acousticalCone U) (Ici t₀ ×ˢ univ) ({t₀} ×ˢ S)) U ∧
      ∀ (D : Set (ℝ × 𝔼 n)) (U' : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ), P.IsDevelopment t₀ Λ S Ū D U' →
        D ⊆ futureDomainOfDependence (P.acousticalCone U) (Ici t₀ ×ˢ univ) ({t₀} ×ˢ S) ∧
          EqOn U U' D := by
  sorry

/-- **Existence of developments** (§8.3). Let `U` be a classical solution on the slab
`O = [t₀, t₀ + T) × E` whose initial values extend `Λ`-periodic data `Ū` on a `Λ`-invariant open
`S` (for instance the solution of §7.2 for an extension of the data). Then
`(D⁺_O({t₀} × S), U)` is a development, and it is the largest development contained in `O`. -/
theorem EquationOfState.isDevelopment_slab [NeZero n] (P : EquationOfState) {t₀ T : ℝ} (hT : 0 < T)
    {Λ : AddSubgroup (𝔼 n)} [DiscreteTopology Λ] {S : Set (𝔼 n)} (hS : IsOpen S)
    (hSΛ : ∀ ℓ ∈ Λ, ∀ x ∈ S, x + ℓ ∈ S) {Ū : 𝔼 n → ℝ × 𝔼 n × ℝ}
    (hŪ : ∀ ℓ ∈ Λ, ∀ x ∈ S, Ū (x + ℓ) = Ū x) {U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ}
    (hU : P.IsSolution (Ico t₀ (t₀ + T) ×ˢ univ) U) (hdata : ∀ x ∈ S, U (t₀, x) = Ū x) :
    P.IsDevelopment t₀ Λ S Ū
        (futureDomainOfDependence (P.acousticalCone U) (Ico t₀ (t₀ + T) ×ˢ univ) ({t₀} ×ˢ S)) U ∧
      ∀ (D : Set (ℝ × 𝔼 n)) (U' : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ), P.IsDevelopment t₀ Λ S Ū D U' →
        D ⊆ Ico t₀ (t₀ + T) ×ˢ univ →
        D ⊆ futureDomainOfDependence (P.acousticalCone U) (Ico t₀ (t₀ + T) ×ˢ univ)
            ({t₀} ×ˢ S) ∧ EqOn U U' D := by
  sorry

/-- **The slab lies in every maximal development of full Cauchy data** (§8.3). If `U` is a
classical solution on `O = [t₀, t₀ + T) × E` with `U(t₀, ·) = Ū` and with sound speed and
velocity bounded on `[t₀, t₂] × E` for every `t₂ < t₀ + T`, then every development of the data
`Ū` on `S = E` is compatible with `U`, and every maximal development contains `O`. -/
theorem EquationOfState.slab_subset_of_maximal [NeZero n] (P : EquationOfState) {t₀ T : ℝ}
    (hT : 0 < T) {Λ : AddSubgroup (𝔼 n)} [DiscreteTopology Λ] {Ū : 𝔼 n → ℝ × 𝔼 n × ℝ}
    (hŪ : ∀ ℓ ∈ Λ, ∀ x, Ū (x + ℓ) = Ū x) {U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ}
    (hU : P.IsSolution (Ico t₀ (t₀ + T) ×ˢ univ) U) (hdata : ∀ x, U (t₀, x) = Ū x)
    (hbdd : ∀ t₂ < t₀ + T, ∃ C : ℝ, ∀ q ∈ Icc t₀ t₂ ×ˢ univ,
      P.soundSpeed ((U q).1, (U q).2.2) + ‖(U q).2.1‖ ≤ C) :
    ∀ (D : Set (ℝ × 𝔼 n)) (U' : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ), P.IsDevelopment t₀ Λ univ Ū D U' →
      EqOn U U' (D ∩ Ico t₀ (t₀ + T) ×ˢ univ) ∧
        ((∀ (D'' : Set (ℝ × 𝔼 n)) (U'' : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ),
            P.IsDevelopment t₀ Λ univ Ū D'' U'' → D ⊆ D'' → EqOn U'' U' D → D'' ⊆ D) →
          Ico t₀ (t₀ + T) ×ˢ univ ⊆ D) := by
  sorry

/-- **The boundary of a development is future causal** (§8.4 (a)). Let `(D, U)` be a development,
`q` a boundary point of `D` after the initial time, `N` an open neighbourhood of `q` and `φ` a
`C¹` function on `N` with `dφ(q) ≠ 0` and `D ∩ N = {φ < 0}`. If the acoustical field `(c, v)` of
`U` extends continuously from `D` to `q` with `c > 0` there, then
`∂_t φ(q) + v·∇φ(q) ≥ c |∇φ(q)|`: the boundary is spacelike or null at `q`, with `D` on its past
side. -/
theorem EquationOfState.boundary_futureCausal [NeZero n] (P : EquationOfState) {t₀ : ℝ}
    {Λ : AddSubgroup (𝔼 n)} [DiscreteTopology Λ] {S : Set (𝔼 n)} {Ū : 𝔼 n → ℝ × 𝔼 n × ℝ}
    {D : Set (ℝ × 𝔼 n)} {U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ} (h : P.IsDevelopment t₀ Λ S Ū D U)
    {q : ℝ × 𝔼 n} (hq : q ∈ frontier D) (hqt : t₀ < q.1) {N : Set (ℝ × 𝔼 n)} (hN : IsOpen N)
    (hqN : q ∈ N) {φ : ℝ × 𝔼 n → ℝ} (hφ : ContDiffOn ℝ 1 φ N) (hdφ : fderiv ℝ φ q ≠ 0)
    (hDN : D ∩ N = {p ∈ N | φ p < 0}) {c : ℝ} {v : 𝔼 n} (hc : 0 < c)
    (hcU : Tendsto (fun p => (P.acousticalCone U p).1) (𝓝[D] q) (𝓝 c))
    (hvU : Tendsto (fun p => (P.acousticalCone U p).2) (𝓝[D] q) (𝓝 v)) :
    c * ‖(fderiv ℝ φ q).comp (ContinuousLinearMap.inr ℝ ℝ (𝔼 n))‖ ≤ fderiv ℝ φ q (1, v) := by
  sorry

/-- **Nullity of the regular boundary** (§8.4 (b)). In the setting of
`EquationOfState.boundary_futureCausal`, suppose `U` extends to a classical solution `Ũ` on the
union `N'` of the `Λ`-translates of `N`, `Λ`-periodically, and that no development above
`(D, U)` contained in `D ∪ N'` contains `q` (as when `(D, U)` is maximal). Then
`∂_t φ(q) + ṽ(q)·∇φ(q) = c̃(q) |∇φ(q)|` and `∇φ(q) ≠ 0` for the acoustical field `(c̃, ṽ)` of
`Ũ`: the boundary is a null hypersurface of the acoustical form at `q`. -/
theorem EquationOfState.boundary_null [NeZero n] (P : EquationOfState) {t₀ : ℝ}
    {Λ : AddSubgroup (𝔼 n)} [DiscreteTopology Λ] {S : Set (𝔼 n)} {Ū : 𝔼 n → ℝ × 𝔼 n × ℝ}
    {D : Set (ℝ × 𝔼 n)} {U : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ} (h : P.IsDevelopment t₀ Λ S Ū D U)
    {q : ℝ × 𝔼 n} (hq : q ∈ frontier D) (hqt : t₀ < q.1) {N : Set (ℝ × 𝔼 n)} (hN : IsOpen N)
    (hqN : q ∈ N) {φ : ℝ × 𝔼 n → ℝ} (hφ : ContDiffOn ℝ 1 φ N) (hdφ : fderiv ℝ φ q ≠ 0)
    (hDN : D ∩ N = {p ∈ N | φ p < 0}) {Ũ : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ}
    (hŨ : P.IsSolution {p | ∃ ℓ ∈ Λ, (p.1, p.2 - ℓ) ∈ N} Ũ)
    (hŨper : ∀ ℓ ∈ Λ, ∀ p ∈ N, Ũ (p.1, p.2 + ℓ) = Ũ p)
    (hŨU : ∀ p ∈ D, (∃ ℓ ∈ Λ, (p.1, p.2 - ℓ) ∈ N) → Ũ p = U p)
    (hmax : ∀ (D' : Set (ℝ × 𝔼 n)) (U' : ℝ × 𝔼 n → ℝ × 𝔼 n × ℝ),
      P.IsDevelopment t₀ Λ S Ū D' U' → D ⊆ D' → EqOn U' U D →
      D' ⊆ D ∪ {p | ∃ ℓ ∈ Λ, (p.1, p.2 - ℓ) ∈ N} → q ∉ D') :
    fderiv ℝ φ q (1, (P.acousticalCone Ũ q).2) =
        (P.acousticalCone Ũ q).1 * ‖(fderiv ℝ φ q).comp (ContinuousLinearMap.inr ℝ ℝ (𝔼 n))‖ ∧
      (fderiv ℝ φ q).comp (ContinuousLinearMap.inr ℝ ℝ (𝔼 n)) ≠ 0 := by
  sorry

end TauCetiRoadmap.CompressibleEulerEquations

end
