/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCetiRoadmap.OperatorTheory.PolarDecomposition.Suggested
import TauCetiRoadmap.OperatorTheory.Majorization.Suggested

/-!
# Operator ideals: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.
-/

namespace TauCetiRoadmap.OperatorIdeals

open Module (finrank)
open scoped InnerProductSpace ENNReal NNReal
open Filter Topology

universe u v w x y

/-! ## Part A -- approximation numbers in the Mathlib-facing `singularValue` API

The mathematical objects are approximation numbers. The public Lean shape follows Mathlib
PR #32126: zero-based `ContinuousLinearMap.singularValue : ℕ → ℝ≥0`. -/

end TauCetiRoadmap.OperatorIdeals

namespace ContinuousLinearMap

universe u v w x y

open scoped NNReal

section ApproximationNumbers

variable {𝕜 : Type u} [NontriviallyNormedField 𝕜]
variable {E : Type v} [SeminormedAddCommGroup E] [NormedSpace 𝕜 E]
variable {F : Type w} [SeminormedAddCommGroup F] [NormedSpace 𝕜 F]
variable {G : Type x} [SeminormedAddCommGroup G] [NormedSpace 𝕜 G]

/-- The zero-based approximation-number sequence, in the shape proposed upstream. -/
noncomputable def singularValue (T : E →L[𝕜] F) (n : ℕ) : ℝ≥0 :=
  ⨅ R : {R : E →L[𝕜] F // R.rank ≤ (n : Cardinal)}, ‖T - R.1‖₊

@[simp] theorem singularValue_zero (T : E →L[𝕜] F) :
    T.singularValue 0 = ‖T‖₊ := sorry

theorem antitone_singularValue (T : E →L[𝕜] F) : Antitone T.singularValue := sorry

/-- The fixed-index perturbative triangle bound in the upstream API. -/
theorem singularValue_add_le (S T : E →L[𝕜] F) (n : ℕ) :
    ((S + T).singularValue n : ℝ) ≤ (S.singularValue n : ℝ) + ‖T‖ := sorry

/-- The two-sided ideal inequality at a fixed index. -/
theorem singularValue_comp_comp_le {G' H' : Type*}
    [SeminormedAddCommGroup G'] [NormedSpace 𝕜 G']
    [SeminormedAddCommGroup H'] [NormedSpace 𝕜 H']
    (L : F →L[𝕜] G') (T : E →L[𝕜] F) (R : H' →L[𝕜] E) (n : ℕ) :
    ((L ∘L T ∘L R).singularValue n : ℝ)
      ≤ ‖L‖ * (T.singularValue n : ℝ) * ‖R‖ := sorry

end ApproximationNumbers

end ContinuousLinearMap

namespace TauCetiRoadmap.OperatorIdeals

open Module (finrank)
open scoped InnerProductSpace ENNReal NNReal
open Filter Topology

section ApproximationNumberExtensions

variable {𝕜 : Type u} [NontriviallyNormedField 𝕜]
variable {E : Type v} [SeminormedAddCommGroup E] [NormedSpace 𝕜 E]
variable {F : Type w} [SeminormedAddCommGroup F] [NormedSpace 𝕜 F]
variable {G : Type x} [SeminormedAddCommGroup G] [NormedSpace 𝕜 G]

/-- Exact zero-based mixed-index subadditivity, extending the upstream-facing s-number API. -/
theorem singularValue_add_index_le (S T : E →L[𝕜] F) (m n : ℕ) :
    (S + T).singularValue (m + n) ≤ S.singularValue m + T.singularValue n := sorry

/-- Composition multiplicativity across indices. -/
theorem singularValue_comp_add_le_mul (S : F →L[𝕜] G) (T : E →L[𝕜] F) (m n : ℕ) :
    (S ∘L T).singularValue (m + n) ≤ S.singularValue m * T.singularValue n := sorry

end ApproximationNumberExtensions

section HilbertIdentifications

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]

/-- Adjoint invariance, the Hilbert-space symmetry the Banach theory lacks. -/
@[simp] theorem singularValue_adjoint (T : E →L[𝕜] F) (n : ℕ) :
    (ContinuousLinearMap.adjoint T).singularValue n
      = T.singularValue n := sorry

/-- On finite-dimensional inner-product spaces, the approximation numbers are the
singular values: Eckart--Young. -/
theorem singularValue_eq_linearMap_singularValues
    [FiniteDimensional 𝕜 E] [FiniteDimensional 𝕜 F] (T : E →L[𝕜] F) (n : ℕ) :
    (T.singularValue n : ℝ) = (T : E →ₗ[𝕜] F).singularValues n := sorry

/-- The min--max principle in the form the perturbation theory consumes: a subspace of
rank greater than `n` on which `T` is `c`-coercive forces `aₙ(T) ≥ c`.

Deliberately not called `singularValue_minmax`: this is one direction, and a name
claiming the equality would overstate what the declaration says. -/
theorem le_singularValue_of_lt_rank (T : E →L[𝕜] F) (n : ℕ) (V : Submodule 𝕜 E)
    {c : ℝ} (hVrank : (n : Cardinal) < Module.rank 𝕜 V)
    (hV : ∀ x : V, c * ‖(x : E)‖ ≤ ‖T (x : E)‖) :
    c ≤ (T.singularValue n : ℝ) := sorry

end HilbertIdentifications

section MinMaxLocalization

variable {𝕜 : Type u} [RCLike 𝕜]

/-- The converse min--max localization for one Hilbert-space pair: every strict
lower bound for `aₙ(T)` is improved by a uniform lower bound on an `(n+1)`-generated
subspace. This is the analytic input from which the Ky Fan triangle inequality is derived. -/
def HasMinMaxLowerBound (E : Type v) (F : Type w)
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
    [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] : Prop :=
  ∀ (T : E →L[𝕜] F) (n : ℕ) {r : ℝ}, 0 ≤ r → r < (T.singularValue n : ℝ) →
    ∃ s : ℝ, r < s ∧ ∃ v : Fin (n + 1) → E, LinearIndependent 𝕜 v ∧
      ∀ x ∈ Submodule.span 𝕜 (Set.range v), s * ‖x‖ ≤ ‖T x‖

/- The pair-level min--max localization is proof infrastructure.  Public ideal theorems
quantify only over `RCLike`; real and complex proofs may discharge this lemma differently. -/

end MinMaxLocalization

/-! ## Part B -- symmetric operator ideals and Schatten norms

One interface, gauge-valued in `ℝ≥0∞`, quantified over all Hilbert pairs; the
concrete norms are instances rather than parallel developments. -/

section IdealFamilies

/-- An operator ideal family over `𝕜`: a single gauge on every Hilbert pair, with the four
laws — subadditivity, absolute homogeneity, domination of the operator norm, and the
two-sided ideal law.  All four are unconditional, so nothing has to be said about
non-members; the ideal itself is recovered as the finiteness domain of the gauge.

The composition law is stated inside the family's two universes, which is what a
rectangular family in two universes can express; the diagonal case, where the adjoint keeps
source and target in one universe, is `SymmetricOperatorIdealFamily` below. -/
structure OperatorIdealFamily (𝕜 : Type u) [RCLike 𝕜] where
  gauge : ∀ {E : Type v} {F : Type w}
      [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
      [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F],
      (E →L[𝕜] F) → ℝ≥0∞
  gauge_add_le : ∀ {E : Type v} {F : Type w}
      [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
      [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]
      (A B : E →L[𝕜] F), gauge (A + B) ≤ gauge A + gauge B
  gauge_smul : ∀ {E : Type v} {F : Type w}
      [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
      [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]
      (c : 𝕜) (A : E →L[𝕜] F), gauge (c • A) = ‖c‖ₑ * gauge A
  enorm_le_gauge : ∀ {E : Type v} {F : Type w}
      [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
      [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]
      (A : E →L[𝕜] F), ‖A‖ₑ ≤ gauge A
  gauge_comp_le : ∀ {E H : Type v} {F G : Type w}
      [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
      [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]
      [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]
      [NormedAddCommGroup G] [InnerProductSpace 𝕜 G] [CompleteSpace G]
      (L : F →L[𝕜] G) (A : E →L[𝕜] F) (R : H →L[𝕜] E),
      gauge (L ∘L A ∘L R) ≤ ‖L‖ₑ * gauge A * ‖R‖ₑ

/-- The **symmetric** family: the diagonal instantiation, extended by adjoint invariance.

It is a second structure rather than an extra field because the adjoint exchanges source
and target: `gauge_adjoint` compares the gauge at `(E, F)` with the gauge at `(F, E)`, which
is only a statement inside one universe. -/
structure SymmetricOperatorIdealFamily (𝕜 : Type u) [RCLike 𝕜]
    extends OperatorIdealFamily.{u, v, v} 𝕜 where
  gauge_adjoint : ∀ {E F : Type v}
      [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
      [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]
      (A : E →L[𝕜] F), gauge (ContinuousLinearMap.adjoint A) = gauge A

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]
variable {ι : Type x}

/-- The Hilbert--Schmidt energy in `ℝ≥0∞`: no summability side conditions
anywhere, and basis independence is a theorem rather than a hypothesis. -/
noncomputable def hilbertSchmidtEnergy (T : F →L[𝕜] E) (b : HilbertBasis ι 𝕜 F) : ℝ≥0∞ :=
  ∑' i, ‖T (b i)‖ₑ ^ 2

/-- Basis independence of the energy, by Parseval and unconditional Fubini. -/
theorem hilbertSchmidtEnergy_indep {ι' : Type y} (T : F →L[𝕜] E)
    (b : HilbertBasis ι 𝕜 F) (c : HilbertBasis ι' 𝕜 F) :
    hilbertSchmidtEnergy T b = hilbertSchmidtEnergy T c := sorry

/-- The Ky Fan gauge: the sum of the first `k` approximation numbers.  It is the gauge every
dominance statement is phrased against. -/
noncomputable def kyFanGauge (T : E →L[𝕜] F) (k : ℕ) : ℝ≥0 :=
  ∑ n ∈ Finset.range k, T.singularValue n

/-- The Ky Fan triangle inequality from the converse min--max localization for this pair. -/
theorem kyFanGauge_add_le_of_hasMinMaxLowerBound
    (hmm : HasMinMaxLowerBound (𝕜 := 𝕜) E F) (S T : E →L[𝕜] F) (k : ℕ) :
    kyFanGauge (S + T) k ≤ kyFanGauge S k + kyFanGauge T k := by
  sorry

/-- **Milestone A2.** Ky Fan subadditivity at the natural public generality.  A proof may
use `HasMinMaxLowerBound` internally, with separate real and complex routes, but callers only
need the scalar field to be `RCLike`. -/
theorem kyFanGauge_add_le (S T : E →L[𝕜] F) (k : ℕ) :
    kyFanGauge (S + T) k ≤ kyFanGauge S k + kyFanGauge T k := by
  sorry

/-- The nuclear gauge: the series of approximation numbers.  Its triangle inequality is the
Ky Fan inequality in the limit. -/
noncomputable def nuclearENorm (T : E →L[𝕜] F) : ℝ≥0∞ :=
  ∑' n, (T.singularValue n : ℝ≥0∞)

/-- **Ky Fan dominance as a property of an ideal family.** The ideal-family laws do not
force it; a family carries dominance as a separate property. -/
class IsKyFanDominant {𝕜 : Type u} [RCLike 𝕜]
    (Φ : OperatorIdealFamily.{u, v, w} 𝕜) : Prop where
  gauge_le_of_forall_kyFanGauge_le : ∀ {E : Type v} {F : Type w}
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
    [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]
    (A B : E →L[𝕜] F), (∀ k, kyFanGauge A k ≤ kyFanGauge B k) → Φ.gauge A ≤ Φ.gauge B

end IdealFamilies

/-! ## Part B, the symmetric-gauge construction (Milestones B1-B4)

The sequence layer is scalar-free.  The induced ideal families are stated at their
mathematical public generality over `RCLike 𝕜`; min--max localization is proof infrastructure. -/

section SymmetricGauges

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} {F : Type w}
  [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
  [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]
variable {ι : Type x}

/-! ### Milestone B1 -- symmetric norming functions

The object the interface exists to receive.  Four instances are examples; a map
from symbols to families is a theory. -/

/-- A **symmetric norming function** (Gohberg--Kreĭn): a monotone, permutation-invariant,
normalized gauge on finitely supported nonnegative sequences.

`symm` is stated against `Equiv.Perm ℕ` acting by precomposition on the finitely
supported sequence, which is what makes "symmetric" a property of `Φ` rather than a
property of the sequences it is applied to. -/
structure SymmetricGauge where
  /-- The underlying gauge on finitely supported nonnegative sequences. -/
  toFun : (ℕ →₀ ℝ≥0) → ℝ≥0
  /-- Subadditivity. -/
  add_le : ∀ a b : ℕ →₀ ℝ≥0, toFun (a + b) ≤ toFun a + toFun b
  /-- Positive homogeneity. -/
  smul : ∀ (c : ℝ≥0) (a : ℕ →₀ ℝ≥0), toFun (c • a) = c * toFun a
  /-- Permutation invariance -- the "symmetric" in symmetric norming function. -/
  symm : ∀ (σ : Equiv.Perm ℕ) (a : ℕ →₀ ℝ≥0),
    toFun (Finsupp.equivMapDomain σ a) = toFun a
  /-- Monotonicity in the termwise order. -/
  mono : ∀ ⦃a b : ℕ →₀ ℝ≥0⦄, a ≤ b → toFun a ≤ toFun b
  /-- Normalization: the first basis vector has gauge one.  This fixes the scale, and
  with it the two-sided bound `‖a‖_∞ ≤ Φ a ≤ ∑ aₙ`. -/
  normalized : toFun (Finsupp.single 0 1) = 1

/-- The extension of a symmetric gauge to arbitrary `ℝ≥0∞`-valued sequences: the
supremum of `Φ` over the finitely supported sequences dominated by `a`.

**A supremum, not a `tsum`.**  The gauge must be total and genuinely `∞` off its
ideal, and a supremum of an increasing net is total by construction; any route
through summability reintroduces the side conditions the interface avoids.

Spec: D1. -/
noncomputable def SymmetricGauge.extend (Φ : SymmetricGauge) (a : ℕ → ℝ≥0∞) : ℝ≥0∞ :=
  ⨆ b : {b : ℕ →₀ ℝ≥0 // ∀ i, (b i : ℝ≥0∞) ≤ a i}, (Φ.toFun b.1 : ℝ≥0∞)

/-- Both ends of the scale, and the reason the normalization is not a restriction. -/
theorem SymmetricGauge.iSup_le_extend_le_tsum (Φ : SymmetricGauge) (a : ℕ → ℝ≥0∞) :
    (⨆ n, a n) ≤ Φ.extend a ∧ Φ.extend a ≤ ∑' n, a n := sorry

/-- **Milestone B1.**  The rectangular family induced by a symmetric gauge, with gauge
`Φ∞ ∘ a`, across independent source and target universes. Its four base-family fields are
theorems, one input each: `gauge_add_le` is Milestone B2, while `gauge_smul`,
`enorm_le_gauge` and `gauge_comp_le` are the corresponding approximation-number facts of
Part A. Adjoint invariance is stated separately across swapped universes and packaged by the
diagonal companion below.

Spec: D2. -/
noncomputable def symmetricGaugeFamily (𝕜 : Type u) [RCLike 𝕜] (Φ : SymmetricGauge) :
    OperatorIdealFamily.{u, v, w} 𝕜 where
  gauge A := Φ.extend fun n => (A.singularValue n : ℝ≥0∞)
  gauge_add_le := sorry
  gauge_smul := sorry
  enorm_le_gauge := sorry
  gauge_comp_le := sorry

/-- Adjoint invariance of an induced symmetric-gauge family across swapped source and target
universes. This is the rectangular symmetry theorem; no same-universe restriction belongs in
the base family. -/
theorem gauge_adjoint_symmetricGaugeFamily (Φ : SymmetricGauge)
    {E' : Type v} {F' : Type w}
    [NormedAddCommGroup E'] [InnerProductSpace 𝕜 E'] [CompleteSpace E']
    [NormedAddCommGroup F'] [InnerProductSpace 𝕜 F'] [CompleteSpace F']
    (A : E' →L[𝕜] F') :
    (symmetricGaugeFamily.{u, w, v} 𝕜 Φ).gauge (ContinuousLinearMap.adjoint A) =
      (symmetricGaugeFamily.{u, v, w} 𝕜 Φ).gauge A := by
  sorry

/-- The adjoint-invariant diagonal view of an induced symmetric-gauge family. -/
noncomputable def symmetricGaugeFamilySymmetric (𝕜 : Type u) [RCLike 𝕜]
    (Φ : SymmetricGauge) : SymmetricOperatorIdealFamily.{u, v} 𝕜 where
  toOperatorIdealFamily := symmetricGaugeFamily.{u, v, v} 𝕜 Φ
  gauge_adjoint := sorry

/-- **Milestone B2.**  Every family induced by a symmetric gauge respects Ky Fan
domination. This is the Hardy--Littlewood--Pólya transfer of the Majorization roadmap. The
extension is the supremum over finitely supported dominated sequences; on antitone
approximation-number sequences it is computed by monotone convergence along initial
truncations. -/
instance isKyFanDominant_symmetricGaugeFamily (Φ : SymmetricGauge) :
    IsKyFanDominant (symmetricGaugeFamily.{u, v, w} 𝕜 Φ) := sorry

/-- The sequence form of Milestone B2, and the form the proof actually establishes:
weak majorization of antitone sequences implies domination under every symmetric
gauge. -/
theorem SymmetricGauge.extend_le_extend_of_forall_sum_le (Φ : SymmetricGauge)
    {a b : ℕ → ℝ≥0∞} (ha : Antitone a) (hb : Antitone b)
    (h : ∀ k, ∑ n ∈ Finset.range k, a n ≤ ∑ n ∈ Finset.range k, b n) :
    Φ.extend a ≤ Φ.extend b := sorry

/-- **Milestone B1.** Equality of the operator-ideal families induced by two
symmetric gauges forces their extensions to agree on antitone sequences. -/
theorem symmetricGaugeFamily_injective {Φ Ψ : SymmetricGauge}
    (h : symmetricGaugeFamily.{u, v, w} 𝕜 Φ = symmetricGaugeFamily.{u, v, w} 𝕜 Ψ)
    {a : ℕ → ℝ≥0∞} (ha : Antitone a) :
    Φ.extend a = Ψ.extend a := sorry

/-! ### Milestone B3 -- Schatten `p`

The Schatten classes are *obtained* from Milestone B1 rather than constructed, so
their four laws are B1's and not new work. -/

/-- The `ℓᵖ` symmetric gauge, `Φ_p a = (∑ aₙ ^ p) ^ (1 / p)`, for `1 ≤ p`.

Spec: D3. -/
noncomputable def schattenGauge (p : ℝ) (hp : 1 ≤ p) : SymmetricGauge where
  toFun a := (∑ n ∈ a.support, a n ^ p) ^ (1 / p)
  add_le := sorry
  smul := sorry
  symm := sorry
  mono := sorry
  normalized := sorry

/-- The rectangular Schatten-`p` family for a finite real exponent `1 ≤ p`, across
independent source and target universes. -/
noncomputable def schattenFamily (𝕜 : Type u) [RCLike 𝕜]
    (p : ℝ) (hp : 1 ≤ p) :
    OperatorIdealFamily.{u, v, w} 𝕜 :=
  symmetricGaugeFamily.{u, v, w} 𝕜 (schattenGauge p hp)

/-- The adjoint-invariant diagonal view of a finite-`p` Schatten family. -/
noncomputable def schattenFamilySymmetric (𝕜 : Type u) [RCLike 𝕜]
    (p : ℝ) (hp : 1 ≤ p) : SymmetricOperatorIdealFamily.{u, v} 𝕜 :=
  symmetricGaugeFamilySymmetric 𝕜 (schattenGauge p hp)

/-- The `p = ∞` endpoint, specified separately because a real exponent cannot represent
infinity. Its gauge is the operator norm, equivalently the supremum of the approximation
numbers.

Spec: D4. -/
noncomputable def schattenFamilyInf (𝕜 : Type u) [RCLike 𝕜] :
    OperatorIdealFamily.{u, v, w} 𝕜 where
  gauge A := ‖A‖ₑ
  gauge_add_le := sorry
  gauge_smul := sorry
  enorm_le_gauge := sorry
  gauge_comp_le := sorry

/-- The adjoint-invariant diagonal view of the infinity endpoint.  The rectangular family
above keeps independent source and target universes; this companion records the symmetry law
without making `p = ∞` look mathematically less symmetric than finite `p`. -/
noncomputable def schattenFamilyInfSymmetric (𝕜 : Type u) [RCLike 𝕜] :
    SymmetricOperatorIdealFamily.{u, v} 𝕜 where
  toOperatorIdealFamily := schattenFamilyInf.{u, v, v} 𝕜
  gauge_adjoint := sorry

/-- The infinity endpoint is equivalently the supremum of the approximation-number
sequence.  For an antitone sequence this supremum is its zeroth term, `a₀(T) = ‖T‖`. -/
theorem gauge_schattenFamilyInf
    {E' : Type v} {F' : Type w}
    [NormedAddCommGroup E'] [InnerProductSpace 𝕜 E'] [CompleteSpace E']
    [NormedAddCommGroup F'] [InnerProductSpace 𝕜 F'] [CompleteSpace F']
    (T : E' →L[𝕜] F') :
    (schattenFamilyInf.{u, v, w} 𝕜).gauge T =
      ⨆ n, (T.singularValue n : ℝ≥0∞) := by
  sorry

/-- The scale is monotone, hence the ideals nest: `S_p ⊆ S_q` for `p ≤ q`.  Strictness
is witnessed by a diagonal operator with coefficients `n ↦ (n + 1) ^ (-1/r)`, `p < r < q` --
the same diagonal machinery as Part A's acceptance example (6). -/
theorem gauge_schattenFamily_antitone {p q : ℝ} (hp : 1 ≤ p) (hq : 1 ≤ q) (hpq : p ≤ q)
    (T : E →L[𝕜] F) :
    (schattenFamily 𝕜 q hq).gauge T ≤ (schattenFamily 𝕜 p hp).gauge T := sorry

/-- **Milestone B3, the reconciliation obligation.**  `p = 2` is defined twice on
purpose -- through the singular-value sequence, and through an orthonormal expansion
that needs no spectral theory, which is what lets Part C stand on its own.  The two
must therefore be proved equal.  Both sides are basis-independent, so the statement is
well-posed; this is the one place in Part B where Milestone A3 is genuinely needed. -/
theorem tsum_singularValue_sq_eq_hilbertSchmidtEnergy
    {E' : Type v} {F' : Type w}
    [NormedAddCommGroup E'] [InnerProductSpace 𝕜 E'] [CompleteSpace E']
    [NormedAddCommGroup F'] [InnerProductSpace 𝕜 F'] [CompleteSpace F']
    (T : F' →L[𝕜] E') (b : HilbertBasis ι 𝕜 F') :
    ∑' n, (T.singularValue n : ℝ≥0∞) ^ 2 = hilbertSchmidtEnergy T b := sorry

/-- **Milestone B3**: finite-dimensional Schatten `p`-norms for real `p ≥ 1` on
the singular-value vector, with the finite endpoint identifications `S₁` nuclear and
`S₂` Frobenius; `S∞` is the separately named operator-norm endpoint.

This finite-dimensional layer is an independent rectangular unitarily invariant
seminorm on operators, computed from their singular-value vectors.  Its agreement with the
ideal-family gauge in finite dimensions is a separate target, making the two constructions
of `S₂` coincide explicitly.

Spec: D5. -/
noncomputable def schattenNorm (p : ℝ) (hp : 1 ≤ p)
    {E : Type v} {F : Type w}
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
    [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F] :
    Majorization.RectangularUnitarilyInvariantSeminorm 𝕜 E F where
  toFun T :=
    (∑ i : Fin (finrank 𝕜 E), T.singularValues (i : ℕ) ^ p) ^ (1 / p)
  add_le' := sorry
  smul' := sorry
  unitary_invariant' := sorry

/-- `S₂` is the rectangular Frobenius seminorm owned by
[`Majorization`](../Majorization/README.md). -/
theorem schattenNorm_two_apply
    {E : Type v} {F : Type w}
    [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
    [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]
    (T : E →ₗ[𝕜] F) :
    schattenNorm 2 (by norm_num) T = Majorization.frobenius T := sorry

/-- The Hilbert--Schmidt energy is the squared Frobenius seminorm in finite dimensions,
which is what makes the two `p = 2` developments one object. -/
theorem hilbertSchmidtEnergy_eq_ofReal_frobenius_sq
    {E' : Type v} {F' : Type w}
    [NormedAddCommGroup E'] [InnerProductSpace 𝕜 E'] [FiniteDimensional 𝕜 E']
    [CompleteSpace E']
    [NormedAddCommGroup F'] [InnerProductSpace 𝕜 F'] [FiniteDimensional 𝕜 F'] [CompleteSpace F']
    (T : E' →L[𝕜] F') (b : HilbertBasis ι 𝕜 E') :
    hilbertSchmidtEnergy T b
      = ENNReal.ofReal (Majorization.frobenius T.toLinearMap ^ 2) := sorry

/-- **Milestone B4, block sums.**  The two-block comparison consumers actually use, for an
operator that is block-diagonal for orthogonal decompositions of source and target: its
gauge is squeezed between the maximum and the sum of the two block gauges.

Both bounds are formal consequences of the family laws: the upper bound is
subadditivity applied to the splitting, and the lower bound is the two-sided ideal law
applied to each contractive compression.  The more general statement identifying the
approximation-number sequence with the decreasing rearrangement of the union of the block
sequences is a separate approximation-number target. -/
theorem gauge_blockSum_le (Φ : OperatorIdealFamily.{u, v, w} 𝕜)
    {E' : Type v} {F' : Type w}
    [NormedAddCommGroup E'] [InnerProductSpace 𝕜 E'] [CompleteSpace E']
    [NormedAddCommGroup F'] [InnerProductSpace 𝕜 F'] [CompleteSpace F']
    {T : E' →L[𝕜] F'} {P₁ P₂ : E' →L[𝕜] E'} {Q₁ Q₂ : F' →L[𝕜] F'}
    (hP₁ : ‖P₁‖ ≤ 1) (hP₂ : ‖P₂‖ ≤ 1) (hQ₁ : ‖Q₁‖ ≤ 1) (hQ₂ : ‖Q₂‖ ≤ 1)
    (hsplit : Q₁ ∘L T ∘L P₁ + Q₂ ∘L T ∘L P₂ = T) :
    max (Φ.gauge (Q₁ ∘L T ∘L P₁)) (Φ.gauge (Q₂ ∘L T ∘L P₂)) ≤ Φ.gauge T ∧
      Φ.gauge T ≤ Φ.gauge (Q₁ ∘L T ∘L P₁) + Φ.gauge (Q₂ ∘L T ∘L P₂) := sorry

end SymmetricGauges

/-! ## Part C -- Hilbert-Schmidt operators as `ℓ²` of columns

`lp (fun _ : ι => E) 2` is the Hilbert--Schmidt space; it arrives with Mathlib's
inner product and completeness already proved, which the tensor-product model
would have to re-derive. -/

section HilbertSchmidt

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]
variable {ι : Type x}

/-- The columns of an operator in a Hilbert basis. -/
noncomputable def columns (b : HilbertBasis ι 𝕜 F) (T : F →L[𝕜] E) : ι → E :=
  fun i => T (b i)

/-- Membership in `ℓ²` of the columns is exactly finiteness of the energy —
the bridge from the model to the ideal theory of Part B. -/
theorem memLp_columns_iff (b : HilbertBasis ι 𝕜 F) (T : F →L[𝕜] E) :
    Memℓp (columns b T) 2 ↔ hilbertSchmidtEnergy T b ≠ ⊤ := sorry

/-- **Hilbert–Schmidt operators are compact.**

Finite energy forces
`∑ aₙ(T)² < ∞` through `tsum_singularValue_sq_eq_hilbertSchmidtEnergy`, hence
`aₙ(T) → 0`, hence approximability, hence compactness by Part A's boundary.

The Peter–Weyl roadmap
(`TauCetiRoadmap/RepresentationTheory/CompactGroups`) records "Hilbert–Schmidt ⇒ compact"
as one of three supporting results for `convolutionOperator_isCompact`, alongside an
HS-operator API — which is this Part — and "continuous kernel on a compact space ⇒ HS
integral operator", which is kernel theory and stays there. -/
theorem isCompactOperator_of_hilbertSchmidtEnergy_ne_top
    (b : HilbertBasis ι 𝕜 F) (T : F →L[𝕜] E) (h : hilbertSchmidtEnergy T b ≠ ⊤) :
    IsCompactOperator T := sorry

/-- The representation map: an `ℓ²` family of columns determines a bounded
operator through the absolutely convergent expansion against the basis.

Spec: D6. -/
noncomputable def ofLp (b : HilbertBasis ι 𝕜 F) (f : lp (fun _ : ι => E) 2) :
    F →L[𝕜] E :=
  LinearMap.mkContinuous
    { toFun := fun x => ∑' i, (b.repr x i) • f i
      map_add' := sorry
      map_smul' := sorry }
    ‖f‖ sorry

/-- Round trip: the columns of the represented operator are the family. -/
theorem columns_ofLp (b : HilbertBasis ι 𝕜 F) (f : lp (fun _ : ι => E) 2) :
    columns b (ofLp b f) = f := sorry

/-- The `ℓ²` norm is the Hilbert--Schmidt norm. -/
theorem norm_sq_eq_tsum_norm_column_sq (b : HilbertBasis ι 𝕜 F)
    (f : lp (fun _ : ι => E) 2) :
    ‖f‖ ^ 2 = ∑' i, ‖ofLp b f (b i)‖ ^ 2 := sorry

/-- **Milestone C1, isometric conjugation**: composition with a norm-preserving
map on the left and a map with norm-preserving adjoint on the right preserves
the energy. -/
theorem hilbertSchmidtEnergy_isometry_comp (b : HilbertBasis ι 𝕜 F)
    (U : E →L[𝕜] E) (hU : ∀ x, ‖U x‖ = ‖x‖) (T : F →L[𝕜] E) :
    hilbertSchmidtEnergy (U ∘L T) b = hilbertSchmidtEnergy T b := sorry

/-- **Milestone C2, Pythagoras along an orthogonal family**: a family splitting
every vector's norm splits the energy, with no countability or summability
side conditions. -/
theorem tsum_energy_isometryFamily_comp {κ : Type y} (b : HilbertBasis ι 𝕜 F)
    (P : κ → (E →L[𝕜] E)) (hP : ∀ v : E, ∑' k, ‖P k v‖ₑ ^ 2 = ‖v‖ₑ ^ 2)
    (T : F →L[𝕜] E) :
    ∑' k, hilbertSchmidtEnergy ((P k) ∘L T) b = hilbertSchmidtEnergy T b := sorry

end HilbertSchmidt

end TauCetiRoadmap.OperatorIdeals
