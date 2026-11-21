/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.Analysis.CStarAlgebra.Representation.Nondegenerate
public import TauCeti.Analysis.VonNeumannAlgebra.Adjoin

/-!
# Traces on C*-algebras and their trace ideals: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, each with `sorry`, the
headline theorems of Layers Tr1–Tr3 that are statable against the pinned Mathlib and Tau Ceti,
together with the definitions they need: traces on a C*-algebra in Dixmier's sense (maps into
`ℝ≥0∞` of which only the values on the positive cone matter), their domains `𝔪_τ⁺`, `𝔫_τ` and
`𝔪_τ`, the regularity predicates (lower semicontinuity is Mathlib's `LowerSemicontinuousOn` on the
positive cone; semifiniteness is Dixmier's; density is density of `𝔪_τ⁺` in the positive cone),
the amplified traces on `CStarMatrix`, and the trace ideals `J_p` with their gauges
`τ (|b| ^ p) ^ (1 / p)`, where `|b| ^ p` is `CFC.abs b ^ p` for `p : ℝ≥0`. The normal-extension
theorem is stated in existential form; the predicate `IsNormalSemifiniteTrace` of
VonNeumannAlgebras V6 is restated here on Mathlib's `VonNeumannAlgebra`, so that this file imports
no other roadmap.

Headline theorems of the README that are not statable at the pins, and the carrier each lacks:

* Tr2.1: the GNS Hilbert algebra of a trace and its commutation theorem `J M_τ J = M_τ'`. There is
  no left Hilbert algebra and no GNS completion of `𝔫_τ` for a trace with infinite values
  (Mathlib's `PositiveLinearMap.GNS` is the construction for bounded positive functionals).
* Tr2.3: Dixmier's correspondence with the quasi-equivalence classes of normal representations,
  whose map is defined through the GNS representation of Tr2.1.
* Tr3.1: the identification of `J_p` with the preimage of `Lᵖ(M_τ, τ̄)`. There is no τ-measurable
  operator and no noncommutative `Lᵖ` at the pins; the inequalities below state the consequences
  on `B` itself.
* Tr4: the `K₀` and `K₁` isomorphisms of Tr4.1, the trace homomorphism `τ_*` of Tr4.2 and the AF
  classification of Tr4.3. Neither Mathlib nor Tau Ceti has `K₀` or `K₁` of a C*-algebra or of a
  Banach algebra.

The examples of Tr1 and Tr3.4 are not stated here; of the multilinear trace forms of Tr3.3 the
bilinear cyclicity of Tr3.2 is stated, from which the others follow by Hölder's inequality.
-/

@[expose] public section

noncomputable section

open scoped ComplexOrder ENNReal NNReal

open Filter Topology

universe u

namespace TauCetiRoadmap.TracesOnCStarAlgebras

variable {B : Type u} [NonUnitalCStarAlgebra B] [PartialOrder B] [StarOrderedRing B]

/-! ## Layer Tr1: traces, domains and lower semicontinuity -/

/-- A trace on `B` (README, Tr1.1; Dixmier 1963, Définition 2, p. 224): a map `τ` into `[0, ∞]`,
of which only the values on `B₊` matter, that is additive and positively homogeneous on `B₊`
(with `0 · ∞ = 0`) and satisfies `τ (x* x) = τ (x x*)` for every `x`. -/
def IsTrace (τ : B → ℝ≥0∞) : Prop :=
  (∀ x y : B, 0 ≤ x → 0 ≤ y → τ (x + y) = τ x + τ y) ∧
  (∀ x : B, 0 ≤ x → ∀ c : ℝ≥0, τ (((c : ℝ) : ℂ) • x) = c * τ x) ∧
  ∀ x : B, τ (star x * x) = τ (x * star x)

/-- The positive elements of finite trace, `𝔪_τ⁺`. -/
def finitePart (τ : B → ℝ≥0∞) : Set B := {x | 0 ≤ x ∧ τ x < ⊤}

/-- The square-integrable elements, `𝔫_τ = {x | τ (x* x) < ∞}`. -/
def sqIntegrable (τ : B → ℝ≥0∞) : Set B := {x | τ (star x * x) < ⊤}

/-- The domain `𝔪_τ`, the complex span of `𝔪_τ⁺`. -/
def domain (τ : B → ℝ≥0∞) : Submodule ℂ B := Submodule.span ℂ (finitePart τ)

/-- `τ` is faithful: it vanishes at no nonzero positive element. -/
def IsFaithful (τ : B → ℝ≥0∞) : Prop := ∀ x : B, 0 ≤ x → τ x = 0 → x = 0

/-- `τ` is semifinite in Dixmier's sense (README, Conventions): on `B₊` it is the supremum of its
finite values below. -/
def IsSemifinite (τ : B → ℝ≥0∞) : Prop :=
  ∀ x : B, 0 ≤ x → τ x = ⨆ (y : B) (_ : 0 ≤ y ∧ y ≤ x ∧ τ y < ⊤), τ y

/-- `τ` is densely defined: `𝔪_τ⁺` is dense in `B₊`. -/
def IsDenselyDefined (τ : B → ℝ≥0∞) : Prop := {x : B | 0 ≤ x} ⊆ closure (finitePart τ)

/-- **The square-integrable ideal.** `𝔫_τ` is a two-sided self-adjoint ideal (README, Tr1.1;
Dixmier 1963, Lemme 3, p. 226). -/
theorem IsTrace.sqIntegrable_ideal {τ : B → ℝ≥0∞} (hτ : IsTrace τ) {x y : B}
    (hx : x ∈ sqIntegrable τ) (hy : y ∈ sqIntegrable τ) (c : ℂ) (a : B) :
    x + y ∈ sqIntegrable τ ∧ c • x ∈ sqIntegrable τ ∧ a * x ∈ sqIntegrable τ ∧
      x * a ∈ sqIntegrable τ ∧ star x ∈ sqIntegrable τ := by
  sorry

/-- **The domain ideal and the linear extension.** `𝔪_τ` is a two-sided ideal meeting `B₊` in
`𝔪_τ⁺`, and `τ` extends uniquely to a complex-linear functional on `𝔪_τ` (README, Tr1.1;
Dixmier 1963, Lemme 3, p. 226). -/
theorem IsTrace.existsUnique_linearMap {τ : B → ℝ≥0∞} (hτ : IsTrace τ) :
    (∀ x ∈ domain τ, ∀ a : B, a * x ∈ domain τ ∧ x * a ∈ domain τ) ∧
      (∀ x : B, 0 ≤ x → (x ∈ domain τ ↔ τ x < ⊤)) ∧
      ∃! f : domain τ →ₗ[ℂ] ℂ, ∀ x (hx : x ∈ finitePart τ),
        f ⟨x, Submodule.subset_span hx⟩ = ((τ x).toReal : ℂ) := by
  sorry

/-- **Trace property of the linear extension**: `τ (x z) = τ (z x)` for `x ∈ 𝔪_τ` and `z ∈ B`
(README, Tr1.1; Dixmier 1963, Lemme 3, p. 226). -/
theorem IsTrace.linearMap_mul_comm {τ : B → ℝ≥0∞} (hτ : IsTrace τ) (f : domain τ →ₗ[ℂ] ℂ)
    (hf : ∀ x (hx : x ∈ finitePart τ), f ⟨x, Submodule.subset_span hx⟩ = ((τ x).toReal : ℂ))
    {x : B} (hx : x ∈ domain τ) (z : B) (hxz : x * z ∈ domain τ) (hzx : z * x ∈ domain τ) :
    f ⟨x * z, hxz⟩ = f ⟨z * x, hzx⟩ := by
  sorry

/-- **Bounded traces.** A trace that is finite on `B₊` is the restriction of a positive tracial
functional, which is then bounded (README, Tr1.1). -/
theorem IsTrace.exists_positiveFunctional {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hfin : ∀ x : B, 0 ≤ x → τ x < ⊤) :
    ∃ ω : B →P[ℂ] ℂ, (∀ a b : B, ω (a * b) = ω (b * a)) ∧
      ∀ x : B, 0 ≤ x → τ x = ENNReal.ofReal (ω x).re := by
  sorry

/-- **Combes's theorem for traces.** A trace is lower semicontinuous on `B₊` iff it is the
supremum of the positive functionals below it (README, Tr1.2; Thomsen [KMS], Theorem 1.1.1;
Kustermans–Vaes, Theorem 1.6). -/
theorem IsTrace.lowerSemicontinuousOn_iff {τ : B → ℝ≥0∞} (hτ : IsTrace τ) :
    LowerSemicontinuousOn τ {x : B | 0 ≤ x} ↔
      ∀ x : B, 0 ≤ x → τ x = ⨆ (ω : B →P[ℂ] ℂ)
        (_ : ∀ y : B, 0 ≤ y → ENNReal.ofReal (ω y).re ≤ τ y), ENNReal.ofReal (ω x).re := by
  sorry

/-- **Density of the domain** (README, Tr1.2): `𝔪_τ⁺` is dense in `B₊` iff `𝔪_τ` is dense in `B`
iff `𝔫_τ` is dense in `B`. -/
theorem IsTrace.isDenselyDefined_iff {τ : B → ℝ≥0∞} (hτ : IsTrace τ) :
    (IsDenselyDefined τ ↔ Dense (domain τ : Set B)) ∧
      (IsDenselyDefined τ ↔ Dense (sqIntegrable τ)) := by
  sorry

/-- **Density gives semifiniteness** for lower semicontinuous traces (README, Tr1.2;
Dixmier 1963, Remarque 3, pp. 227–228). Without lower semicontinuity this fails: the trace on
`c₀` that sums finitely supported sequences and is `∞` elsewhere is densely defined and not
semifinite. -/
theorem IsTrace.isSemifinite_of_isDenselyDefined {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hd : IsDenselyDefined τ) :
    IsSemifinite τ := by
  sorry

/-- **Lower semicontinuous regularization.** A densely defined trace has a largest lower
semicontinuous trace below it, which is densely defined (README, Tr1.2; Thomsen [WTK],
Proposition 4.12). -/
theorem IsTrace.exists_lowerSemicontinuous_regularization {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hd : IsDenselyDefined τ) :
    ∃ τ' : B → ℝ≥0∞, IsTrace τ' ∧ IsDenselyDefined τ' ∧
      LowerSemicontinuousOn τ' {x : B | 0 ≤ x} ∧ (∀ x : B, 0 ≤ x → τ' x ≤ τ x) ∧
      ∀ σ : B → ℝ≥0∞, IsTrace σ → LowerSemicontinuousOn σ {x : B | 0 ≤ x} →
        (∀ x : B, 0 ≤ x → σ x ≤ τ x) → ∀ x : B, 0 ≤ x → σ x ≤ τ' x := by
  sorry

/-- The amplified trace `τ_n x = ∑ i, τ (x i i)` on `M_n(B)` (README, Tr1.3). -/
def matrixTrace (τ : B → ℝ≥0∞) (n : ℕ) (x : CStarMatrix (Fin n) (Fin n) B) : ℝ≥0∞ :=
  ∑ i, τ (x i i)

/-- The amplified trace is a trace (README, Tr1.3). -/
theorem IsTrace.isTrace_matrixTrace {τ : B → ℝ≥0∞} (hτ : IsTrace τ) (n : ℕ) :
    IsTrace (matrixTrace τ n) := by
  sorry

/-- `𝔫_{τ_n} = M_n(𝔫_τ)` (README, Tr1.3; Thomsen [WTK], Lemma 3.1 (e)). -/
theorem IsTrace.mem_sqIntegrable_matrixTrace_iff {τ : B → ℝ≥0∞} (hτ : IsTrace τ) {n : ℕ}
    (x : CStarMatrix (Fin n) (Fin n) B) :
    x ∈ sqIntegrable (matrixTrace τ n) ↔ ∀ i j, x i j ∈ sqIntegrable τ := by
  sorry

/-- **Projections have finite trace** for a densely defined trace, at every matrix size
(README, Tr1.3; Thomsen [WTK], Lemma 4.11). -/
theorem IsTrace.matrixTrace_lt_top_of_isStarProjection {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hd : IsDenselyDefined τ) {n : ℕ} {e : CStarMatrix (Fin n) (Fin n) B}
    (he : IsStarProjection e) : matrixTrace τ n e < ⊤ := by
  sorry

/-! ## Layer Tr2: the normal extension -/

/-- A normal semifinite trace on `M`, restating VonNeumannAlgebras V6's predicate (README,
Conventions; the definition and its source are VonNeumannAlgebras V6's): a map `τ` into
`[0, ∞]`, of which only the values on `M₊` matter, that is additive and positively homogeneous on
`M₊` (with `0 · ∞ = 0`), satisfies `τ (x* x) = τ (x x*)` for `x ∈ M`, is semifinite (every
nonzero `x ∈ M₊` dominates a nonzero `y ∈ M₊` with `τ y < ∞`) and is normal: along every
increasing net of `M₊` converging strongly to `y`, the values converge to `τ y`. -/
def IsNormalSemifiniteTrace {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] (M : VonNeumannAlgebra H) (τ : (H →L[ℂ] H) → ℝ≥0∞) : Prop :=
  (∀ x ∈ M, ∀ y ∈ M, 0 ≤ x → 0 ≤ y → τ (x + y) = τ x + τ y) ∧
  (∀ x ∈ M, 0 ≤ x → ∀ c : ℝ≥0, τ (((c : ℝ) : ℂ) • x) = c * τ x) ∧
  (∀ x ∈ M, τ (star x * x) = τ (x * star x)) ∧
  (∀ x ∈ M, 0 ≤ x → x ≠ 0 → ∃ y ∈ M, 0 ≤ y ∧ y ≤ x ∧ y ≠ 0 ∧ τ y < ⊤) ∧
  ∀ (ι : Type u) [Preorder ι] [IsDirected ι (· ≤ ·)] [Nonempty ι]
    (x : ι → H →L[ℂ] H) (y : H →L[ℂ] H), (∀ i, x i ∈ M ∧ 0 ≤ x i) → Monotone x →
    Tendsto (fun i ↦ ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H (x i))
      atTop (𝓝 (ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H y)) →
    Tendsto (fun i ↦ τ (x i)) atTop (𝓝 (τ y))

/-- **Normal extension.** A semifinite lower semicontinuous trace is `τ̄ ∘ π` for a nondegenerate
representation `π` and a faithful normal semifinite trace `τ̄` on `π(B)''`, with `π` injective
exactly when `τ` is faithful; the GNS representation of `τ` with its natural trace is such a pair
(README, Tr2.2; Dixmier 1963,
Lemme 7, pp. 231–232, and Proposition 2 (i), p. 233). The trace on `c₀` that sums finitely
supported sequences and is `∞` elsewhere shows that lower semicontinuity is needed, and the trace
on `C₀(X)` that is `0` or `∞` according to the value at a point shows that semifiniteness is. -/
theorem IsTrace.exists_normal_extension {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hsf : IsSemifinite τ) :
    ∃ (H : Type u) (_ : NormedAddCommGroup H) (_ : InnerProductSpace ℂ H) (_ : CompleteSpace H)
      (π : B →⋆ₙₐ[ℂ] (H →L[ℂ] H)) (τbar : (H →L[ℂ] H) → ℝ≥0∞),
      π.IsNondegenerate ∧
      IsNormalSemifiniteTrace (VonNeumannAlgebra.adjoin (Set.range π)) τbar ∧
      (∀ T ∈ VonNeumannAlgebra.adjoin (Set.range π), 0 ≤ T → τbar T = 0 → T = 0) ∧
      (∀ x : B, 0 ≤ x → τbar (π x) = τ x) ∧
      (IsFaithful τ ↔ Function.Injective π) := by
  sorry

/-- **Uniqueness of the normal extension** for a densely defined trace: two normal semifinite
traces on `π(B)''` that agree with `τ` along a nondegenerate `π` agree on the positive cone
(README, Tr2.2). Lower semicontinuity of `τ` is not assumed: it follows, since `θ₁ ∘ π = τ`. -/
theorem IsTrace.eq_of_normal_extension {τ : B → ℝ≥0∞} (hτ : IsTrace τ) (hd : IsDenselyDefined τ)
    {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (π : B →⋆ₙₐ[ℂ] (H →L[ℂ] H)) (hπ : π.IsNondegenerate) {θ₁ θ₂ : (H →L[ℂ] H) → ℝ≥0∞}
    (h₁ : IsNormalSemifiniteTrace (VonNeumannAlgebra.adjoin (Set.range π)) θ₁)
    (h₂ : IsNormalSemifiniteTrace (VonNeumannAlgebra.adjoin (Set.range π)) θ₂)
    (h₁π : ∀ x : B, 0 ≤ x → θ₁ (π x) = τ x) (h₂π : ∀ x : B, 0 ≤ x → θ₂ (π x) = τ x) :
    ∀ T ∈ VonNeumannAlgebra.adjoin (Set.range π), 0 ≤ T → θ₁ T = θ₂ T := by
  sorry

/-! ## Layer Tr3: trace ideals -/

/-- The trace ideal `J_p = {b | τ (|b| ^ p) < ∞}` (README, Tr3.1). -/
def traceIdeal (τ : B → ℝ≥0∞) (p : ℝ≥0) : Set B := {b | τ (CFC.abs b ^ p) < ⊤}

/-- The trace gauge `‖b‖_{τ,p} = τ (|b| ^ p) ^ (1 / p)`, with values in `[0, ∞]` (README,
Conventions). -/
def traceGauge (τ : B → ℝ≥0∞) (p : ℝ≥0) (b : B) : ℝ≥0∞ := τ (CFC.abs b ^ p) ^ (p : ℝ)⁻¹

/-- **Monotonicity in the exponent**, for every trace: `τ (|b| ^ q) ≤ ‖b‖ ^ (q - p) τ (|b| ^ p)`
for `1 ≤ p ≤ q`, so `J_p ⊆ J_q` (README, Tr3.2). -/
theorem IsTrace.apply_abs_pow_le {τ : B → ℝ≥0∞} (hτ : IsTrace τ) {p q : ℝ≥0} (hp : 1 ≤ p)
    (hpq : p ≤ q) (b : B) :
    τ (CFC.abs b ^ q) ≤ (‖b‖₊ : ℝ≥0∞) ^ ((q : ℝ) - p) * τ (CFC.abs b ^ p) := by
  sorry

/-- `J₁ = 𝔪_τ` for a semifinite lower semicontinuous trace (README, Tr3.2). -/
theorem IsTrace.traceIdeal_one {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hsf : IsSemifinite τ) :
    traceIdeal τ 1 = (domain τ : Set B) := by
  sorry

/-- **Minkowski's inequality** for the trace gauge (README, Tr3.1). -/
theorem IsTrace.traceGauge_add_le {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hsf : IsSemifinite τ) {p : ℝ≥0}
    (hp : 1 ≤ p) (a b : B) :
    traceGauge τ p (a + b) ≤ traceGauge τ p a + traceGauge τ p b := by
  sorry

/-- **Adjoint invariance** of the trace gauge, `τ (|b*| ^ p) = τ (|b| ^ p)`, for every trace
(README, Tr1.1 and Tr3.1). -/
theorem IsTrace.traceGauge_star {τ : B → ℝ≥0∞} (hτ : IsTrace τ) {p : ℝ≥0} (hp : 1 ≤ p) (b : B) :
    traceGauge τ p (star b) = traceGauge τ p b := by
  sorry

/-- **Left bimodule bound** `‖a b‖_{τ,p} ≤ ‖a‖ ‖b‖_{τ,p}` (README, Tr3.1). -/
theorem IsTrace.traceGauge_mul_le_left {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hsf : IsSemifinite τ) {p : ℝ≥0}
    (hp : 1 ≤ p) (a b : B) :
    traceGauge τ p (a * b) ≤ ‖a‖₊ * traceGauge τ p b := by
  sorry

/-- **Right bimodule bound** `‖a b‖_{τ,p} ≤ ‖a‖_{τ,p} ‖b‖` (README, Tr3.1). -/
theorem IsTrace.traceGauge_mul_le_right {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hsf : IsSemifinite τ) {p : ℝ≥0}
    (hp : 1 ≤ p) (a b : B) :
    traceGauge τ p (a * b) ≤ traceGauge τ p a * ‖b‖₊ := by
  sorry

/-- **Hölder's inequality** for the trace gauges, `1 / r = 1 / p + 1 / q` with `1 ≤ r`
(README, Tr3.2). -/
theorem IsTrace.traceGauge_mul_le {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hsf : IsSemifinite τ) {p q r : ℝ≥0}
    (hr : 1 ≤ r) (hp : 0 < p) (hq : 0 < q) (hpqr : (r : ℝ)⁻¹ = (p : ℝ)⁻¹ + (q : ℝ)⁻¹) (a b : B) :
    traceGauge τ r (a * b) ≤ traceGauge τ p a * traceGauge τ q b := by
  sorry

/-- **Cyclicity** of the trace pairing: `τ (a b) = τ (b a)` for `a ∈ J_p`, `b ∈ J_q`,
`1 / p + 1 / q = 1`, where `τ` is the linear extension `f` to `𝔪_τ` and `a b, b a ∈ 𝔪_τ` by
Hölder's inequality and `J₁ = 𝔪_τ` (README, Tr3.2). -/
theorem IsTrace.linearMap_mul_comm_of_mem_traceIdeal {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hsf : IsSemifinite τ) {p q : ℝ≥0}
    (hp : 1 < p) (hpq : (p : ℝ)⁻¹ + (q : ℝ)⁻¹ = 1) (f : domain τ →ₗ[ℂ] ℂ)
    (hf : ∀ x (hx : x ∈ finitePart τ), f ⟨x, Submodule.subset_span hx⟩ = ((τ x).toReal : ℂ))
    {a b : B} (ha : a ∈ traceIdeal τ p) (hb : b ∈ traceIdeal τ q) :
    ∃ (hab : a * b ∈ domain τ) (hba : b * a ∈ domain τ), f ⟨a * b, hab⟩ = f ⟨b * a, hba⟩ := by
  sorry

/-- **Completeness** of `J_p` for `‖b‖ + ‖b‖_{τ,p}`: a sequence of `J_p` that is Cauchy for both
the C*-norm and the trace gauge converges in both to an element of `J_p` (README, Tr3.1). -/
theorem IsTrace.exists_tendsto_traceGauge {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hsf : IsSemifinite τ) {p : ℝ≥0}
    (hp : 1 ≤ p) {u : ℕ → B} (hu : ∀ n, u n ∈ traceIdeal τ p) (hcauchy : CauchySeq u)
    (hgauge : ∀ ε : ℝ≥0∞, 0 < ε → ∃ N, ∀ m ≥ N, ∀ n ≥ N, traceGauge τ p (u m - u n) < ε) :
    ∃ b ∈ traceIdeal τ p, Tendsto u atTop (𝓝 b) ∧
      Tendsto (fun n ↦ traceGauge τ p (u n - b)) atTop (𝓝 0) := by
  sorry

/-- **Density** of the trace ideals: `J_p` is dense in `B` iff `τ` is densely defined
(README, Tr3.1). -/
theorem IsTrace.dense_traceIdeal_iff {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hsf : IsSemifinite τ) {p : ℝ≥0}
    (hp : 1 ≤ p) :
    Dense (traceIdeal τ p) ↔ IsDenselyDefined τ := by
  sorry

/-- **Matrix amplification, lower bound**: each entry gauge is at most the gauge for the
amplified trace (README, Tr3.3). -/
theorem IsTrace.traceGauge_apply_le_matrix {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hsf : IsSemifinite τ) {p : ℝ≥0}
    (hp : 1 ≤ p) {n : ℕ} (x : CStarMatrix (Fin n) (Fin n) B) (i j : Fin n) :
    traceGauge τ p (x i j) ≤ traceGauge (matrixTrace τ n) p x := by
  sorry

/-- **Matrix amplification, upper bound**: the gauge for the amplified trace is at most the sum
of the entry gauges; in particular `J_p(M_n(B), τ_n) = M_n(J_p(B, τ))` (README, Tr3.3). -/
theorem IsTrace.traceGauge_matrix_le_sum {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hsf : IsSemifinite τ) {p : ℝ≥0}
    (hp : 1 ≤ p) {n : ℕ} (x : CStarMatrix (Fin n) (Fin n) B) :
    traceGauge (matrixTrace τ n) p x ≤ ∑ i, ∑ j, traceGauge τ p (x i j) := by
  sorry

end TauCetiRoadmap.TracesOnCStarAlgebras
