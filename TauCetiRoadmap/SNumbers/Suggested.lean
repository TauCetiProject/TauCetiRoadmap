/-
Copyright (c) 2026 Mario Ullrich. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCetiRoadmap.OperatorTheory.OperatorIdeals.Suggested

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
`sorry` records target signatures in this human-owned roadmap library.

The approximation numbers are `ContinuousLinearMap.approximationNumber`, an abbreviation of
`ContinuousLinearMap.singularValue` from the `OperatorIdeals` roadmap: the same object, under
the name it has on Banach spaces, so that the whole `OperatorIdeals` API applies to it. The
other sequences are defined here in the same shape (zero-based, `ℝ≥0`-valued).
-/

noncomputable section

open scoped NNReal ENNReal
open Filter Topology

universe u

/-! ## The sequences -/

namespace ContinuousLinearMap

section General

variable {𝕜 : Type u} [NontriviallyNormedField 𝕜]
variable {X Y : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
  [NormedAddCommGroup Y] [NormedSpace 𝕜 Y]

/-- The approximation numbers `aₙ(T) = inf {‖T - R‖ : rank R ≤ n}` on normed spaces. On
Hilbert spaces they are the singular values; `OperatorIdeals` implements them under that
name.

Roadmap: conventions; `OI-A01`. -/
abbrev approximationNumber (T : X →L[𝕜] Y) (n : ℕ) : ℝ≥0 :=
  T.singularValue n

/-- The Gelfand numbers: the infimum of `‖T|_M‖` over the closed subspaces `M` of
codimension at most `n`.

Roadmap: `SN-A08`. -/
def gelfandNumber (T : X →L[𝕜] Y) (n : ℕ) : ℝ≥0 :=
  ⨅ M : {M : Submodule 𝕜 X // IsClosed (M : Set X) ∧ Module.rank 𝕜 (X ⧸ M) ≤ (n : Cardinal)},
    ‖T ∘L M.1.subtypeL‖₊

/-- The Kolmogorov numbers: the infimum over subspaces `V` of dimension at most `n` of the
deviation of `T(B_X)` from `V`.

Roadmap: `SN-A10`. -/
def kolmogorovNumber (T : X →L[𝕜] Y) (n : ℕ) : ℝ≥0 :=
  ⨅ V : {V : Submodule 𝕜 Y // Module.rank 𝕜 V ≤ (n : Cardinal)},
    ⨆ x : Metric.closedBall (0 : X) 1, Metric.infNndist (T x) (V.1 : Set Y)

/-- The Bernstein numbers: the largest gain of `T` on an `(n+1)`-dimensional subspace.

Roadmap: `SN-A16`. -/
def bernsteinNumber (T : X →L[𝕜] Y) (n : ℕ) : ℝ≥0 :=
  ⨆ M : {M : Submodule 𝕜 X // Module.rank 𝕜 M = (n + 1 : ℕ)},
    ⨅ x : {x : X // x ∈ M.1 ∧ x ≠ 0}, ‖T x‖₊ / ‖(x : X)‖₊

/-- The entropy numbers: the infimum of the radii `ε` such that `T(B_X)` is covered by at
most `2 ^ n` closed `ε`-balls of `Y`. They are pseudo-s-numbers, not s-numbers.

Roadmap: `SN-D01`. -/
def entropyNumber (T : X →L[𝕜] Y) (n : ℕ) : ℝ≥0 :=
  ⨅ ε : {ε : ℝ≥0 // ∃ N : Finset Y, N.card ≤ 2 ^ n ∧
      (T : X → Y) '' Metric.closedBall 0 1 ⊆ ⋃ y ∈ (N : Set Y), Metric.closedBall y ε},
    ε.1

end General

section RCLike

variable {𝕜 : Type u} [RCLike 𝕜]
variable {X Y : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
  [NormedAddCommGroup Y] [NormedSpace 𝕜 Y]

/-- The test space of the Hilbert numbers, `ℓ₂ = ℓ₂(ℕ; 𝕜)`, in the universe of `X`. -/
abbrev L2 (𝕜 : Type u) [RCLike 𝕜] : Type u := lp (fun _ : ℕ => 𝕜) 2

/-- The Hilbert numbers: the supremum of `aₙ(B T A)` over contractions `A : ℓ₂ → X` and
`B : Y → ℓ₂`.

Roadmap: `SN-A18`. -/
def hilbertNumber (T : X →L[𝕜] Y) (n : ℕ) : ℝ≥0 :=
  ⨆ A : {A : L2 𝕜 →L[𝕜] X // ‖A‖ ≤ 1}, ⨆ B : {B : Y →L[𝕜] L2 𝕜 // ‖B‖ ≤ 1},
    (B.1 ∘L T ∘L A.1).approximationNumber n

/-- The determinant quantities `Δₖ(T) = sup |det (B T A)|` over contractions
`A : ℓ₂ᵏ → X` and `B : Y → ℓ₂ᵏ`.

Roadmap: `SN-C04`. -/
def detNumber (T : X →L[𝕜] Y) (k : ℕ) : ℝ≥0 :=
  ⨆ A : {A : EuclideanSpace 𝕜 (Fin k) →L[𝕜] X // ‖A‖ ≤ 1},
    ⨆ B : {B : Y →L[𝕜] EuclideanSpace 𝕜 (Fin k) // ‖B‖ ≤ 1},
      ‖LinearMap.det ((B.1 ∘L T ∘L A.1 : EuclideanSpace 𝕜 (Fin k) →L[𝕜] _) :
        EuclideanSpace 𝕜 (Fin k) →ₗ[𝕜] EuclideanSpace 𝕜 (Fin k))‖₊

end RCLike

end ContinuousLinearMap

/-! ## Part A: the axioms and the five sequences as families -/

namespace TauCetiRoadmap.SNumbers

/-- An s-number family: one `ℝ≥0`-valued sequence for every bounded operator between normed
`𝕜`-spaces in one universe.

Roadmap: `SN-A01`. -/
abbrev SNumberFamily (𝕜 : Type u) [NontriviallyNormedField 𝕜] :=
  ∀ {X Y : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
      [NormedAddCommGroup Y] [NormedSpace 𝕜 Y],
      (X →L[𝕜] Y) → ℕ → ℝ≥0

section General

variable {𝕜 : Type u} [NontriviallyNormedField 𝕜]

/-- Pietsch's axioms (S1)–(S5) of an s-number sequence.

Roadmap: `SN-A02`. -/
structure IsSNumberSequence (s : SNumberFamily 𝕜) : Prop where
  apply_zero : ∀ {X Y : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
      [NormedAddCommGroup Y] [NormedSpace 𝕜 Y] (T : X →L[𝕜] Y), s T 0 = ‖T‖₊
  antitone : ∀ {X Y : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
      [NormedAddCommGroup Y] [NormedSpace 𝕜 Y] (T : X →L[𝕜] Y), Antitone (s T)
  add_le : ∀ {X Y : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
      [NormedAddCommGroup Y] [NormedSpace 𝕜 Y] (S T : X →L[𝕜] Y) (n : ℕ),
      s (S + T) n ≤ s S n + ‖T‖₊
  comp_le : ∀ {W X Y Z : Type u} [NormedAddCommGroup W] [NormedSpace 𝕜 W]
      [NormedAddCommGroup X] [NormedSpace 𝕜 X] [NormedAddCommGroup Y] [NormedSpace 𝕜 Y]
      [NormedAddCommGroup Z] [NormedSpace 𝕜 Z]
      (A : W →L[𝕜] X) (T : X →L[𝕜] Y) (B : Y →L[𝕜] Z) (n : ℕ),
      s (B ∘L T ∘L A) n ≤ ‖B‖₊ * s T n * ‖A‖₊
  eq_zero_of_rank_le : ∀ {X Y : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
      [NormedAddCommGroup Y] [NormedSpace 𝕜 Y] (T : X →L[𝕜] Y) (n : ℕ),
      T.rank ≤ (n : Cardinal) → s T n = 0
  id_euclidean : ∀ n : ℕ,
      s (ContinuousLinearMap.id 𝕜 (EuclideanSpace 𝕜 (Fin (n + 1)))) n = 1

/-- A strict s-number sequence: (S1)–(S4) and `s (id_X) n = 1` whenever `n < rank X`.

Roadmap: `SN-A03`. -/
structure IsStrictSNumberSequence (s : SNumberFamily 𝕜) : Prop where
  toIsSNumberSequence : IsSNumberSequence s
  id_of_lt_rank : ∀ {X : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X] (n : ℕ),
      (n : Cardinal) < Module.rank 𝕜 X → s (ContinuousLinearMap.id 𝕜 X) n = 1

/-- An additive family: `s (S + T) (m + n) ≤ s S m + s T n`.

Roadmap: `SN-C16`. -/
def Additive (s : SNumberFamily 𝕜) : Prop :=
  ∀ {X Y : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
      [NormedAddCommGroup Y] [NormedSpace 𝕜 Y] (S T : X →L[𝕜] Y) (m n : ℕ),
    s (S + T) (m + n) ≤ s S m + s T n

/-- A multiplicative family: `s (S ∘ T) (m + n) ≤ s S m * s T n`.

Roadmap: `SN-C16`. -/
def Multiplicative (s : SNumberFamily 𝕜) : Prop :=
  ∀ {X Y Z : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
      [NormedAddCommGroup Y] [NormedSpace 𝕜 Y] [NormedAddCommGroup Z] [NormedSpace 𝕜 Z]
      (S : Y →L[𝕜] Z) (T : X →L[𝕜] Y) (m n : ℕ),
    s (S ∘L T) (m + n) ≤ s S m * s T n

/-- An injective family is unchanged by post-composition with a metric injection.

Roadmap: `SN-A22`. -/
def Injective (s : SNumberFamily 𝕜) : Prop :=
  ∀ {X Y Z : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
      [NormedAddCommGroup Y] [NormedSpace 𝕜 Y] [NormedAddCommGroup Z] [NormedSpace 𝕜 Z]
      (T : X →L[𝕜] Y) (J : Y →L[𝕜] Z), (∀ y, ‖J y‖ = ‖y‖) → ∀ n, s (J ∘L T) n = s T n

/-- A surjective family is unchanged by pre-composition with a metric surjection: a
contraction under which every point has preimages of norm arbitrarily close to its own.

Roadmap: `SN-A22`. -/
def Surjective (s : SNumberFamily 𝕜) : Prop :=
  ∀ {W X Y : Type u} [NormedAddCommGroup W] [NormedSpace 𝕜 W]
      [NormedAddCommGroup X] [NormedSpace 𝕜 X] [NormedAddCommGroup Y] [NormedSpace 𝕜 Y]
      (T : X →L[𝕜] Y) (Q : W →L[𝕜] X), ‖Q‖ ≤ 1 →
      (∀ x ε, 0 < ε → ∃ w, Q w = x ∧ ‖w‖ < ‖x‖ + ε) → ∀ n, s (T ∘L Q) n = s T n

/-- The approximation numbers as a family. -/
def approximation : SNumberFamily 𝕜 := fun T => T.approximationNumber

/-- The Gelfand numbers as a family. -/
def gelfand : SNumberFamily 𝕜 := fun T => T.gelfandNumber

/-- The Kolmogorov numbers as a family. -/
def kolmogorov : SNumberFamily 𝕜 := fun T => T.kolmogorovNumber

/-- The Bernstein numbers as a family. -/
def bernstein : SNumberFamily 𝕜 := fun T => T.bernsteinNumber

/-- The entropy numbers as a family; they are not an s-number sequence. -/
def entropy : SNumberFamily 𝕜 := fun T => T.entropyNumber

variable {s : SNumberFamily 𝕜}
variable {X Y : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
  [NormedAddCommGroup Y] [NormedSpace 𝕜 Y]

/-- Every s-number sequence is bounded by the operator norm.

Roadmap: `SN-A04`. -/
theorem IsSNumberSequence.le_nnnorm (hs : IsSNumberSequence s) (T : X →L[𝕜] Y) (n : ℕ) :
    s T n ≤ ‖T‖₊ := sorry

/-- Every s-number sequence is `1`-Lipschitz in the operator at a fixed index.

Roadmap: `SN-A04`. -/
theorem IsSNumberSequence.abs_sub_le (hs : IsSNumberSequence s) (S T : X →L[𝕜] Y) (n : ℕ) :
    |(s S n : ℝ) - s T n| ≤ ‖S - T‖ := sorry

/-- Homogeneity of every s-number sequence.

Roadmap: `SN-A05`. -/
theorem IsSNumberSequence.smul (hs : IsSNumberSequence s) (c : 𝕜) (T : X →L[𝕜] Y) (n : ℕ) :
    s (c • T) n = ‖c‖₊ * s T n := sorry

/-- The approximation numbers of an identity are `1` below its rank.

Roadmap: `SN-A06`. -/
theorem approximationNumber_id [CompleteSpace 𝕜] (n : ℕ)
    (hn : (n : Cardinal) < Module.rank 𝕜 X) :
    (ContinuousLinearMap.id 𝕜 X).approximationNumber n = 1 := sorry

/-- Roadmap: `SN-A07`. -/
theorem isStrictSNumberSequence_approximation [CompleteSpace 𝕜] :
    IsStrictSNumberSequence (approximation (𝕜 := 𝕜)) := sorry

/-- Roadmap: `SN-A09`. -/
theorem isStrictSNumberSequence_gelfand : IsStrictSNumberSequence (gelfand (𝕜 := 𝕜)) :=
  sorry

/-- Roadmap: `SN-A12`, `SN-A13`. -/
theorem isStrictSNumberSequence_kolmogorov [CompleteSpace 𝕜] :
    IsStrictSNumberSequence (kolmogorov (𝕜 := 𝕜)) := sorry

/-- Roadmap: `SN-A17`. -/
theorem isStrictSNumberSequence_bernstein : IsStrictSNumberSequence (bernstein (𝕜 := 𝕜)) :=
  sorry

/-- The Gelfand numbers are injective.

Roadmap: `SN-A23`. -/
theorem injective_gelfand : Injective (gelfand (𝕜 := 𝕜)) := sorry

/-- The Kolmogorov numbers are surjective.

Roadmap: `SN-A24`. -/
theorem surjective_kolmogorov : Surjective (kolmogorov (𝕜 := 𝕜)) := sorry

/-! ## Part B: the extremal sequences -/

/-- **The approximation numbers are the largest s-numbers**: `sₙ(T) ≤ aₙ(T)` for every
s-number sequence.

Roadmap: `SN-B01`. -/
theorem IsSNumberSequence.le_approximationNumber (hs : IsSNumberSequence s)
    (T : X →L[𝕜] Y) (n : ℕ) : s T n ≤ T.approximationNumber n := sorry

/-- Compactness through the Kolmogorov numbers.

Roadmap: `SN-B07`, `SN-B09`. -/
theorem isCompactOperator_iff_tendsto_kolmogorovNumber [CompleteSpace Y] (T : X →L[𝕜] Y) :
    IsCompactOperator T ↔ Tendsto T.kolmogorovNumber atTop (𝓝 0) := sorry

/-- The Bernstein numbers are at most the Gelfand numbers.

Roadmap: `SN-B11`. -/
theorem bernsteinNumber_le_gelfandNumber (T : X →L[𝕜] Y) (n : ℕ) :
    T.bernsteinNumber n ≤ T.gelfandNumber n := sorry

/-- The Bernstein numbers are the smallest injective strict s-numbers.

Roadmap: `SN-B12`. -/
theorem IsStrictSNumberSequence.bernsteinNumber_le (hs : IsStrictSNumberSequence s)
    (hinj : Injective s) (T : X →L[𝕜] Y) (n : ℕ) : T.bernsteinNumber n ≤ s T n := sorry

/-! ## Part C: index laws -/

/-- Roadmap: `SN-C17`. -/
theorem additive_gelfand : Additive (gelfand (𝕜 := 𝕜)) := sorry

/-- Roadmap: `SN-C17`. -/
theorem multiplicative_gelfand : Multiplicative (gelfand (𝕜 := 𝕜)) := sorry

/-- Roadmap: `SN-C18`. -/
theorem additive_kolmogorov : Additive (kolmogorov (𝕜 := 𝕜)) := sorry

/-- Roadmap: `SN-C18`. -/
theorem multiplicative_kolmogorov : Multiplicative (kolmogorov (𝕜 := 𝕜)) := sorry

/-- Roadmap: `SN-C19`. -/
theorem additive_approximation : Additive (approximation (𝕜 := 𝕜)) := sorry

/-- Roadmap: `SN-C19`. -/
theorem multiplicative_approximation : Multiplicative (approximation (𝕜 := 𝕜)) := sorry

/-! ## Part D: entropy numbers, the pseudo-s-numbers -/

/-- Roadmap: `SN-D03`. -/
theorem additive_entropy : Additive (entropy (𝕜 := 𝕜)) := sorry

/-- Entropy numbers fail the rank axiom: they vanish only on the zero operator.

Roadmap: `SN-D05`. -/
theorem entropyNumber_pos {T : X →L[𝕜] Y} (hT : T ≠ 0) (n : ℕ) : 0 < T.entropyNumber n :=
  sorry

/-- Roadmap: `SN-D06`. -/
theorem isCompactOperator_iff_tendsto_entropyNumber [CompleteSpace Y] (T : X →L[𝕜] Y) :
    IsCompactOperator T ↔ Tendsto T.entropyNumber atTop (𝓝 0) := sorry

/-- Roadmap: `SN-D07`. -/
theorem kolmogorovNumber_two_pow_le_entropyNumber (T : X →L[𝕜] Y) (n : ℕ) :
    T.kolmogorovNumber (2 ^ n) ≤ T.entropyNumber n := sorry

end General

section Densely

variable {𝕜 : Type u} [DenselyNormedField 𝕜]

/-- Roadmap: `SN-D04`. -/
theorem multiplicative_entropy : Multiplicative (entropy (𝕜 := 𝕜)) := sorry

end Densely

section RCLike

variable {𝕜 : Type u} [RCLike 𝕜]

/-- The Hilbert numbers as a family. -/
def hilbert : SNumberFamily 𝕜 := fun T => T.hilbertNumber

/-- Roadmap: `SN-A20`. -/
theorem isSNumberSequence_hilbert : IsSNumberSequence (hilbert (𝕜 := 𝕜)) := sorry

variable {s t : SNumberFamily 𝕜}
variable {X Y : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
  [NormedAddCommGroup Y] [NormedSpace 𝕜 Y]

/-! ### Part B -/

/-- **The Hilbert numbers are the smallest s-numbers**: `hₙ(T) ≤ sₙ(T)`.

Roadmap: `SN-B04`. -/
theorem IsSNumberSequence.hilbertNumber_le (hs : IsSNumberSequence s) (T : X →L[𝕜] Y)
    (n : ℕ) : T.hilbertNumber n ≤ s T n := sorry

/-- The scalar factorization through `ℓ₂ⁿ⁺¹` below `aₙ(T)` on Hilbert spaces.

Roadmap: `SN-B02`. -/
theorem exists_comp_comp_eq_smul_id {H₁ H₂ : Type u}
    [NormedAddCommGroup H₁] [InnerProductSpace 𝕜 H₁] [CompleteSpace H₁]
    [NormedAddCommGroup H₂] [InnerProductSpace 𝕜 H₂] [CompleteSpace H₂]
    (T : H₁ →L[𝕜] H₂) (n : ℕ) {c : ℝ} (hc0 : 0 ≤ c) (hc : c < T.approximationNumber n) :
    ∃ (A : EuclideanSpace 𝕜 (Fin (n + 1)) →L[𝕜] H₁) (B : H₂ →L[𝕜] EuclideanSpace 𝕜 (Fin (n + 1))),
      ‖A‖ ≤ 1 ∧ ‖B‖ ≤ 1 ∧ B ∘L T ∘L A = (c : 𝕜) • ContinuousLinearMap.id 𝕜 _ := sorry

/-- On Hilbert spaces every s-number sequence is the sequence of approximation numbers.

Roadmap: `SN-B03`. -/
theorem IsSNumberSequence.eq_approximationNumber {H₁ H₂ : Type u}
    [NormedAddCommGroup H₁] [InnerProductSpace 𝕜 H₁] [CompleteSpace H₁]
    [NormedAddCommGroup H₂] [InnerProductSpace 𝕜 H₂] [CompleteSpace H₂]
    (hs : IsSNumberSequence s) (T : H₁ →L[𝕜] H₂) (n : ℕ) :
    s T n = T.approximationNumber n := sorry

/-- In finite dimension every s-number sequence gives Mathlib's singular values.

Roadmap: `SN-B05`. -/
theorem IsSNumberSequence.eq_singularValues {H₁ H₂ : Type u}
    [NormedAddCommGroup H₁] [InnerProductSpace 𝕜 H₁] [FiniteDimensional 𝕜 H₁]
    [NormedAddCommGroup H₂] [InnerProductSpace 𝕜 H₂] [FiniteDimensional 𝕜 H₂]
    (hs : IsSNumberSequence s) (T : H₁ →L[𝕜] H₂) (n : ℕ) :
    (s T n : ℝ) = (T : H₁ →ₗ[𝕜] H₂).singularValues n := sorry

/-- Compactness through the Gelfand numbers.

Roadmap: `SN-B08`, `SN-B09`. -/
theorem isCompactOperator_iff_tendsto_gelfandNumber [CompleteSpace Y] (T : X →L[𝕜] Y) :
    IsCompactOperator T ↔ Tendsto T.gelfandNumber atTop (𝓝 0) := sorry

/-- On Hilbert spaces every s-number sequence detects compactness.

Roadmap: `SN-B10`. -/
theorem IsSNumberSequence.isCompactOperator_iff {H₁ H₂ : Type u}
    [NormedAddCommGroup H₁] [InnerProductSpace 𝕜 H₁] [CompleteSpace H₁]
    [NormedAddCommGroup H₂] [InnerProductSpace 𝕜 H₂] [CompleteSpace H₂]
    (hs : IsSNumberSequence s) (T : H₁ →L[𝕜] H₂) :
    IsCompactOperator T ↔ Tendsto (s T) atTop (𝓝 0) := sorry

/-! ### Part C -/

/-- `aₙ(T) ≤ (1 + √n) cₙ(T)`, through the Garling–Gordon projection theorem.

Roadmap: `SN-C01`. -/
theorem approximationNumber_le_sqrt_mul_gelfandNumber [CompleteSpace X] [CompleteSpace Y]
    (T : X →L[𝕜] Y) (n : ℕ) :
    (T.approximationNumber n : ℝ) ≤ (1 + Real.sqrt n) * T.gelfandNumber n := sorry

/-- `aₙ(T) ≤ (1 + √n) dₙ(T)`, through the Kadec–Snobar projection theorem.

Roadmap: `SN-C02`. -/
theorem approximationNumber_le_sqrt_mul_kolmogorovNumber [CompleteSpace X] [CompleteSpace Y]
    (T : X →L[𝕜] Y) (n : ℕ) :
    (T.approximationNumber n : ℝ) ≤ (1 + Real.sqrt n) * T.kolmogorovNumber n := sorry

/-- The lower recursion of the determinant quantities.

Roadmap: `SN-C07`. -/
theorem pow_div_mul_approximationNumber_mul_detNumber_le (T : X →L[𝕜] Y) (k : ℕ) :
    ((k : ℝ) ^ k / ((k : ℝ) + 1) ^ (k + 1)) * T.approximationNumber k * T.detNumber k ≤
      T.detNumber (k + 1) := sorry

/-- The upper recursion of the determinant quantities.

Roadmap: `SN-C08`. -/
theorem detNumber_succ_le (T : X →L[𝕜] Y) (n : ℕ) :
    T.detNumber (n + 1) ≤ T.hilbertNumber n * T.detNumber n := sorry

/-- The maximal difference theorem `aₙ(T) ≤ e (n + 1) hₙ(T)`.

Roadmap: `SN-C10`. -/
theorem approximationNumber_le_exp_mul_hilbertNumber (T : X →L[𝕜] Y) (n : ℕ) :
    (T.approximationNumber n : ℝ) ≤ Real.exp 1 * ((n : ℝ) + 1) * T.hilbertNumber n := sorry

/-- Any two s-number sequences differ by at most the factor `e (n + 1)`.

Roadmap: `SN-C11`. -/
theorem IsSNumberSequence.le_exp_mul (hs : IsSNumberSequence s) (ht : IsSNumberSequence t)
    (T : X →L[𝕜] Y) (n : ℕ) : (s T n : ℝ) ≤ Real.exp 1 * ((n : ℝ) + 1) * t T n := sorry

/-- Gelfand and Kolmogorov numbers against Bernstein numbers.

Roadmap: `SN-C12`. -/
theorem max_gelfandNumber_kolmogorovNumber_le (T : X →L[𝕜] Y) (n : ℕ) :
    max (T.gelfandNumber n : ℝ) (T.kolmogorovNumber n) ≤
      Real.exp 1 * ((n : ℝ) + 1) * T.bernsteinNumber n := sorry

/-- The Hilbert numbers are additive.

Roadmap: `SN-C20`. -/
theorem additive_hilbert : Additive (hilbert (𝕜 := 𝕜)) := sorry

/-- The Bernstein numbers are not multiplicative.

Roadmap: `SN-C22`. -/
theorem not_multiplicative_bernstein : ¬ Multiplicative (bernstein (𝕜 := 𝕜)) := sorry

/-- The Bernstein numbers are not additive.

Roadmap: `SN-C23`. -/
theorem not_additive_bernstein : ¬ Additive (bernstein (𝕜 := 𝕜)) := sorry

/-! ### Part D -/

/-- Gelfand and Kolmogorov numbers against entropy numbers (Pietsch).

Roadmap: `SN-D11`. -/
theorem max_gelfandNumber_kolmogorovNumber_le_entropyNumber (T : X →L[𝕜] Y) (n : ℕ) :
    max (T.gelfandNumber n : ℝ) (T.kolmogorovNumber n) ≤ ((n : ℝ) + 1) * T.entropyNumber n :=
  sorry

/-- Roadmap: `SN-D13`. -/
theorem hilbertNumber_le_two_mul_entropyNumber (T : X →L[𝕜] Y) (n : ℕ) :
    T.hilbertNumber n ≤ 2 * T.entropyNumber n := sorry

/-- Entropy numbers bound every s-number sequence.

Roadmap: `SN-D14`. -/
theorem IsSNumberSequence.le_two_exp_mul_entropyNumber (hs : IsSNumberSequence s)
    (T : X →L[𝕜] Y) (n : ℕ) :
    (s T n : ℝ) ≤ 2 * Real.exp 1 * ((n : ℝ) + 1) * T.entropyNumber n := sorry

/-! ### Part E -/

/-- The Hilbert numbers of the inclusion `ℓ₁ → ℓ_∞` are `1 / (n + 1)`.

Roadmap: `SN-E11`. -/
theorem hilbertNumber_inclusion_l1_linfty
    (I : lp (fun _ : ℕ => 𝕜) 1 →L[𝕜] lp (fun _ : ℕ => 𝕜) ∞)
    (hI : ∀ x, ((I x : lp (fun _ : ℕ => 𝕜) ∞) : ℕ → 𝕜) = x) (n : ℕ) :
    (I.hilbertNumber n : ℝ) = 1 / ((n : ℝ) + 1) := sorry

/-- The Hilbert numbers of the identity of `ℓ₁ᵐ` are at least `(n + 1)^{-1/2}` for `n < m`.

Roadmap: `SN-E13`, lower bound. -/
theorem le_hilbertNumber_id_piLp_one {m n : ℕ} (hnm : n < m) :
    ((n : ℝ) + 1)⁻¹ ^ ((1 : ℝ) / 2) ≤
      ((ContinuousLinearMap.id 𝕜 (PiLp 1 (fun _ : Fin m => 𝕜))).hilbertNumber n : ℝ) :=
  sorry

end RCLike

/-! ## Part C: duality -/

section Duality

variable {𝕜 : Type u} [RCLike 𝕜]
variable {X Y : Type u} [NormedAddCommGroup X] [NormedSpace 𝕜 X]
  [NormedAddCommGroup Y] [NormedSpace 𝕜 Y]

/-- The dual operator `T' : Y* → X*`, `φ ↦ φ ∘ T`. -/
def dualOp (T : X →L[𝕜] Y) : StrongDual 𝕜 Y →L[𝕜] StrongDual 𝕜 X :=
  ContinuousLinearMap.precomp 𝕜 T

/-- The Kolmogorov numbers of the dual operator are the Gelfand numbers.

Roadmap: `SN-C13`. -/
theorem kolmogorovNumber_dualOp (T : X →L[𝕜] Y) (n : ℕ) :
    (dualOp T).kolmogorovNumber n = T.gelfandNumber n := sorry

/-- The Gelfand numbers of the dual operator are at most the Kolmogorov numbers.

Roadmap: `SN-C14`. -/
theorem gelfandNumber_dualOp_le (T : X →L[𝕜] Y) (n : ℕ) :
    (dualOp T).gelfandNumber n ≤ T.kolmogorovNumber n := sorry

/-- For compact operators between Banach spaces the two coincide.

Roadmap: `SN-C15`. -/
theorem gelfandNumber_dualOp_of_isCompactOperator [CompleteSpace X] [CompleteSpace Y]
    {T : X →L[𝕜] Y} (hT : IsCompactOperator T) (n : ℕ) :
    (dualOp T).gelfandNumber n = T.kolmogorovNumber n := sorry

end Duality

end TauCetiRoadmap.SNumbers
