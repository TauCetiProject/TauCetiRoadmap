/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

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

/-! ## Part A -- approximation numbers

Field-generic on normed spaces; the Hilbert identifications come later in the
Part.  Zero-based indexing: `a₀(T) = ‖T‖`. -/

section ApproximationNumbers

variable {𝕜 : Type u} [NontriviallyNormedField 𝕜]
variable {E : Type v} [SeminormedAddCommGroup E] [NormedSpace 𝕜 E]
variable {F : Type w} [SeminormedAddCommGroup F] [NormedSpace 𝕜 F]
variable {G : Type x} [SeminormedAddCommGroup G] [NormedSpace 𝕜 G]
variable {H : Type y} [SeminormedAddCommGroup H] [NormedSpace 𝕜 H]

/-- The `n`-th approximation number: the distance from `T` to the operators of
rank at most `n`. -/
noncomputable def approximationNumber (T : E →L[𝕜] F) (n : ℕ) : ℝ :=
  ⨅ R : {R : E →L[𝕜] F // R.rank ≤ (n : Cardinal)}, ‖T - R.1‖

@[simp] theorem approximationNumber_index_zero (T : E →L[𝕜] F) :
    approximationNumber T 0 = ‖T‖ := sorry

theorem approximationNumber_antitone (T : E →L[𝕜] F) :
    Antitone (approximationNumber T) := sorry

/-- Additivity across indices: the mixed subadditivity law of `s`-number theory. -/
theorem approximationNumber_add_le (S T : E →L[𝕜] F) (m n : ℕ) :
    approximationNumber (S + T) (m + n)
      ≤ approximationNumber S m + approximationNumber T n := sorry

/-- Composition multiplicativity across indices.

**The name carries `add` deliberately.**  `approximationNumber_comp_comp_le` is
already taken, by the *two-sided ideal* bound
`aₙ(L ∘ T ∘ R) ≤ ‖L‖ · aₙ(T) · ‖R‖`, which is a different theorem at a fixed
index; this one splits the index.  Naming the index addition also keeps it
legible beside `approximationNumber_add_le` and distinguishes it from the
fixed-index bounds `approximationNumber_comp_le_mul_norm` and
`approximationNumber_comp_le_norm_mul`. -/
theorem approximationNumber_comp_add_le_mul (S : F →L[𝕜] G) (T : E →L[𝕜] F) (m n : ℕ) :
    approximationNumber (S ∘L T) (m + n)
      ≤ approximationNumber S m * approximationNumber T n := sorry

/-- The two-sided ideal inequality, at a fixed index.  Recorded here because it
owns the name `approximationNumber_comp_comp_le`; the theorem above is the
index-splitting statement and must not reuse it. -/
theorem approximationNumber_comp_comp_le {G' H' : Type*}
    [SeminormedAddCommGroup G'] [NormedSpace 𝕜 G']
    [SeminormedAddCommGroup H'] [NormedSpace 𝕜 H']
    (L : F →L[𝕜] G') (T : E →L[𝕜] F) (R : H' →L[𝕜] E) (n : ℕ) :
    approximationNumber (L ∘L T ∘L R) n ≤ ‖L‖ * approximationNumber T n * ‖R‖ := sorry

end ApproximationNumbers

section HilbertIdentifications

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]

/-- Adjoint invariance, the Hilbert-space symmetry the Banach theory lacks. -/
@[simp] theorem approximationNumber_adjoint (T : E →L[ℂ] F) (n : ℕ) :
    approximationNumber (ContinuousLinearMap.adjoint T) n
      = approximationNumber T n := sorry

/-- On finite-dimensional inner-product spaces, the approximation numbers are the
singular values: Eckart--Young. -/
theorem approximationNumber_eq_singularValues
    [FiniteDimensional ℂ E] [FiniteDimensional ℂ F] (T : E →L[ℂ] F) (n : ℕ) :
    approximationNumber T n = (T : E →ₗ[ℂ] F).singularValues n := sorry

/-- The min--max principle in the form the perturbation theory consumes: a subspace of
rank greater than `n` on which `T` is `c`-coercive forces `aₙ(T) ≥ c`.

Deliberately not called `approximationNumber_minmax`: this is one direction, and a name
claiming the equality would overstate what the declaration says. -/
theorem le_approximationNumber_of_lt_rank (T : E →L[ℂ] F) (n : ℕ) (V : Submodule ℂ E)
    {c : ℝ} (hVrank : (n : Cardinal) < Module.rank ℂ V)
    (hV : ∀ x : V, c * ‖(x : E)‖ ≤ ‖T (x : E)‖) :
    c ≤ approximationNumber T n := sorry

end HilbertIdentifications

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
noncomputable def kyFanGauge (T : E →L[𝕜] F) (k : ℕ) : ℝ :=
  ∑ n ∈ Finset.range k, approximationNumber T n

/-- The nuclear gauge: the series of approximation numbers.  Its triangle inequality is the
Ky Fan inequality in the limit. -/
noncomputable def nuclearENorm (T : E →L[𝕜] F) : ℝ≥0∞ :=
  ∑' n, ENNReal.ofReal (approximationNumber T n)

/-- **Ky Fan dominance as a property of a family.**  It is *false* for an arbitrary
`OperatorIdealFamily` — the four laws do not force it — so it is a class over families
rather than a theorem about them, and Milestone B2 is the statement that the
symmetric-gauge construction always lands in this subclass. -/
class IsKyFanDominant (Φ : OperatorIdealFamily.{0, v, w} ℂ) : Prop where
  gauge_le_of_forall_kyFanGauge_le : ∀ {E : Type v} {F : Type w}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]
    (A B : E →L[ℂ] F), (∀ k, kyFanGauge A k ≤ kyFanGauge B k) → Φ.gauge A ≤ Φ.gauge B

end IdealFamilies

/-! ## Part B, the symmetric-gauge construction (Milestones B1-B4)

Everything below is over `ℂ`, where the Hilbert-space continuous functional calculus
is registered; Milestone B4 is what removes that restriction. -/

section SymmetricGauges

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]
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
supremum of `Φ` over the finitely supported truncations of the decreasing
rearrangement.

**A supremum, not a `tsum`.**  The gauge must be total and genuinely `∞` off its
ideal, and a supremum of an increasing net is total by construction; any route
through summability reintroduces the side conditions the interface avoids. -/
noncomputable def SymmetricGauge.extend (Φ : SymmetricGauge) (a : ℕ → ℝ≥0∞) : ℝ≥0∞ :=
  sorry

/-- Both ends of the scale, and the reason the normalization is not a restriction. -/
theorem SymmetricGauge.iSup_le_extend_le_tsum (Φ : SymmetricGauge) (a : ℕ → ℝ≥0∞) :
    (⨆ n, a n) ≤ Φ.extend a ∧ Φ.extend a ≤ ∑' n, a n := sorry

/-- **Milestone B1.**  The family induced by a symmetric gauge, with gauge
`Φ∞ ∘ a`.  Its five structure fields are theorems, one input each: `gauge_add_le` is
Milestone B2, `gauge_smul` and `gauge_adjoint` and `enorm_le_gauge` and `gauge_comp_le`
are the corresponding approximation-number facts of Part A. -/
noncomputable def symmetricGaugeFamily (Φ : SymmetricGauge) : OperatorIdealFamily ℂ :=
  sorry

/-- **Milestone B2.**  Every family induced by a symmetric gauge respects Ky Fan
domination.  This is the Hardy--Littlewood--Pólya transfer of the
MajorizationAndAngles roadmap, lifted to sequences by monotone convergence along the
truncations -- which is why `extend` is a supremum of truncations and nothing cleverer. -/
instance isKyFanDominant_symmetricGaugeFamily (Φ : SymmetricGauge) :
    IsKyFanDominant (symmetricGaugeFamily Φ) := sorry

/-- The sequence form of Milestone B2, and the form the proof actually establishes:
weak majorization of antitone sequences implies domination under every symmetric
gauge. -/
theorem SymmetricGauge.extend_le_extend_of_forall_sum_le (Φ : SymmetricGauge)
    {a b : ℕ → ℝ≥0∞} (ha : Antitone a) (hb : Antitone b)
    (h : ∀ k, ∑ n ∈ Finset.range k, a n ≤ ∑ n ∈ Finset.range k, b n) :
    Φ.extend a ≤ Φ.extend b := sorry

/-- **Milestone B1, the direction of the Calkin correspondence we claim.**  The
construction is injective up to equality of gauges on antitone sequences, so the
ideal really is a function of the singular-value sequence alone.

Surjectivity -- that every symmetric ideal arises this way -- is *not* claimed here;
it is the substantial half of Calkin's theorem, needs a separability hypothesis
nothing else in this roadmap needs, and no downstream result consumes it. -/
theorem symmetricGaugeFamily_injective {Φ Ψ : SymmetricGauge}
    (h : symmetricGaugeFamily Φ = symmetricGaugeFamily Ψ)
    {a : ℕ → ℝ≥0∞} (ha : Antitone a) :
    Φ.extend a = Ψ.extend a := sorry

/-! ### Milestone B3 -- Schatten `p`

The Schatten classes are *obtained* from Milestone B1 rather than constructed, so
their four laws are B1's and not new work. -/

/-- The `ℓᵖ` symmetric gauge, `Φ_p a = (∑ aₙ ^ p) ^ (1 / p)`, for `1 ≤ p`. -/
noncomputable def schattenGauge (p : ℝ) (hp : 1 ≤ p) : SymmetricGauge := sorry

/-- The Schatten-`p` family for a finite real exponent `1 ≤ p`. -/
noncomputable def schattenFamily (p : ℝ) (hp : 1 ≤ p) : OperatorIdealFamily.{0, v, w} ℂ :=
  symmetricGaugeFamily (schattenGauge p hp)

/-- The `p = ∞` endpoint, specified separately because a real exponent cannot represent
infinity. Its gauge is the operator norm, equivalently the supremum of the approximation
numbers. -/
noncomputable def schattenFamilyInf : OperatorIdealFamily.{0, v, w} ℂ := sorry

/-- The scale is monotone, hence the ideals nest: `S_p ⊆ S_q` for `p ≤ q`.  Strictness
is witnessed by a diagonal operator with coefficients `n ↦ n ^ (-1/r)`, `p < r < q` --
the same diagonal machinery as Part A's acceptance example (6). -/
theorem gauge_schattenFamily_antitone {p q : ℝ} (hp : 1 ≤ p) (hq : 1 ≤ q) (hpq : p ≤ q)
    (T : E →L[ℂ] F) :
    (schattenFamily q hq).gauge T ≤ (schattenFamily p hp).gauge T := sorry

/-- **Milestone B3, the reconciliation obligation.**  `p = 2` is defined twice on
purpose -- through the singular-value sequence, and through an orthonormal expansion
that needs no spectral theory, which is what lets Part C stand on its own.  The two
must therefore be proved equal.  Both sides are basis-independent, so the statement is
well-posed; this is the one place in Part B where Milestone A3 is genuinely needed. -/
theorem tsum_approximationNumber_sq_eq_hilbertSchmidtEnergy
    (T : F →L[ℂ] E) (b : HilbertBasis ι ℂ F) :
    ∑' n, ENNReal.ofReal (approximationNumber T n) ^ 2 = hilbertSchmidtEnergy T b := sorry

/-- **Milestone B3**: finite-dimensional Schatten `p`-norms for real `p ≥ 1` on
the singular-value vector, with the finite endpoint identifications `S₁` nuclear and
`S₂` Frobenius; `S∞` is the separately named operator-norm endpoint.

This layer is **not** a special case of `schattenFamily` and does not wait on it: it is
a rectangular unitarily invariant norm on a vector, consumed by the
MajorizationAndAngles arm.  That the two agree in finite dimensions is a separate
target, and without it a reader cannot tell whether `S₂` means one thing or two. -/
noncomputable def schattenNorm (p : ℝ)
    {E F : Type v} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [FiniteDimensional ℂ E]
    [NormedAddCommGroup F] [InnerProductSpace ℂ F] [FiniteDimensional ℂ F]
    (T : E →ₗ[ℂ] F) : ℝ := sorry

/-- **Milestone B4, block sums.**  The two-block comparison consumers actually use, for an
operator that is block-diagonal for orthogonal decompositions of source and target: its
gauge is squeezed between the maximum and the sum of the two block gauges.

The upper bound is subadditivity applied to the splitting; the lower bound is the two-sided
ideal law applied to each compression, and is the half that is not formal.  The general
statement — that the approximation-number sequence of a block-diagonal sum is the decreasing
rearrangement of the union of the summands' sequences — is the milestone this specializes. -/
theorem gauge_blockSum_le (Φ : OperatorIdealFamily.{0, v, w} ℂ)
    {T : E →L[ℂ] F} {P₁ P₂ : E →L[ℂ] E} {Q₁ Q₂ : F →L[ℂ] F}
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

/-- The representation map: an `ℓ²` family of columns determines a bounded
operator through the absolutely convergent expansion against the basis. -/
noncomputable def ofLp (b : HilbertBasis ι 𝕜 F) (f : lp (fun _ : ι => E) 2) :
    F →L[𝕜] E := sorry

/-- Round trip: the columns of the represented operator are the family. -/
theorem columns_ofLp (b : HilbertBasis ι 𝕜 F) (f : lp (fun _ : ι => E) 2) :
    columns b (ofLp b f) = f := sorry

/-- The `ℓ²` norm is the Hilbert--Schmidt norm. -/
theorem norm_sq_eq_tsum_norm_column_sq (b : HilbertBasis ι 𝕜 F)
    (f : lp (fun _ : ι => E) 2) :
    ‖f‖ ^ 2 = ∑' i, ‖ofLp b f (b i)‖ ^ 2 := sorry

/-- **Milestone C1, isometric conjugation**: composition with a norm-preserving
map on the left and a map with norm-preserving adjoint on the right preserves
the energy — what makes the Sylvester flow a unitary group on this space. -/
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

/-! ## Part D -- approximation numbers of spectral bands

The one Part that depends on `SelfAdjointSpectralTheory`.  Its statements are about
approximation numbers, so this roadmap owns them; only the proofs are spectral theory. -/

section SpectralBands

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]

/-- **Milestone D1 -- a spectral cutoff bounds the approximation numbers.**

Stated here in the bounded form, where the band is presented by its orthogonal projection
and by the bound `T` satisfies off it: the compression `T ∘ P` is an admissible approximant
of rank at most `r`, so the residual bound transfers to `a_r(T)` directly.

The unbounded form replaces `P` by a spectral projection of the `SelfAdjointSpectralTheory`
roadmap's spectral measure, and is the statement the perturbation roadmap consumes: it lets
an argument bound an ideal gauge from a *spectral* hypothesis rather than from a rank
hypothesis. -/
theorem approximationNumber_le_of_spectral_band
    {T : E →L[ℂ] F} {P : E →L[ℂ] E} {r : ℕ} {δ : ℝ}
    (hidem : IsIdempotentElem P) (hsa : IsSelfAdjoint P)
    (hrank : P.rank ≤ (r : Cardinal))
    (hband : ∀ x : E, ‖T (x - P x)‖ ≤ δ * ‖x - P x‖) :
    approximationNumber T r ≤ δ := sorry

end SpectralBands

end TauCetiRoadmap.OperatorIdeals
