import Mathlib

/-!
# The Cantor set and compact metric spaces: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, every theorem with `sorry`. All of them are statable at the
pins, and no definition is needed.

Cantor space is `ℕ → Bool` and Baire space is `ℕ → ℕ`, with the product topologies.
Zero-dimensional is Mathlib's `ZeroDimensionalSpace` (a clopen basis), perfect is
`PerfectSpace` for a space and `Perfect` for a subset, Polish is `PolishSpace`.
-/

open Topology TopologicalSpace Filter

namespace TauCetiRoadmap.CantorSetAndCompactMetricSpaces

/-! ## Layer 1: zero-dimensional spaces inside Cantor and Baire space -/

/-- 1.1. A space embeds in Cantor space if and only if it is T0, second countable and
zero-dimensional (Francis, Proposition 3). -/
theorem exists_isEmbedding_cantor_iff (X : Type*) [TopologicalSpace X] :
    (∃ f : X → ℕ → Bool, IsEmbedding f) ↔
      T0Space X ∧ SecondCountableTopology X ∧ ZeroDimensionalSpace X := by
  sorry

/-- 1.2. A space admits a closed embedding into Baire space if and only if it is a
zero-dimensional Polish space (Tserunyan, Theorem 5.6, for the implication from right to
left). -/
theorem exists_isClosedEmbedding_baire_iff (X : Type*) [TopologicalSpace X] :
    (∃ f : X → ℕ → ℕ, IsClosedEmbedding f) ↔ PolishSpace X ∧ ZeroDimensionalSpace X := by
  sorry

/-- 1.3. Every Polish space is the image of a closed subset of Baire space under a continuous
bijection (Tserunyan, Theorem 5.7). -/
theorem exists_continuous_bijective_of_isClosed_baire (X : Type*) [TopologicalSpace X]
    [PolishSpace X] :
    ∃ C : Set (ℕ → ℕ), IsClosed C ∧ ∃ f : C → X, Continuous f ∧ Function.Bijective f := by
  sorry

/-! ## Layer 2: Brouwer's characterisation of Cantor space -/

/-- 2.1. Brouwer's theorem: a space is homeomorphic to Cantor space if and only if it is
nonempty, compact, metrizable, totally disconnected and perfect (Tserunyan, Theorem 5.3;
Francis, Theorem 1). -/
theorem nonempty_homeomorph_cantor_iff (X : Type*) [TopologicalSpace X] :
    Nonempty (X ≃ₜ (ℕ → Bool)) ↔
      Nonempty X ∧ CompactSpace X ∧ MetrizableSpace X ∧ TotallyDisconnectedSpace X ∧
        PerfectSpace X := by
  sorry

/-- 2.2. A subset of the real line is homeomorphic to Cantor space if and only if it is
nonempty, compact, perfect and has empty interior (Francis, Example 1(b)). -/
theorem nonempty_homeomorph_cantor_iff_of_real (K : Set ℝ) :
    Nonempty (K ≃ₜ (ℕ → Bool)) ↔ K.Nonempty ∧ IsCompact K ∧ Perfect K ∧ interior K = ∅ := by
  sorry

/-! ## Layer 3: Baire space and the irrationals -/

/-- 3.1. The Alexandrov–Urysohn theorem: a space is homeomorphic to Baire space if and only
if it is a nonempty zero-dimensional Polish space in which every compact set has empty
interior (Tserunyan, Theorem 5.4). -/
theorem nonempty_homeomorph_baire_iff (X : Type*) [TopologicalSpace X] :
    Nonempty (X ≃ₜ (ℕ → ℕ)) ↔
      Nonempty X ∧ PolishSpace X ∧ ZeroDimensionalSpace X ∧
        ∀ K : Set X, IsCompact K → interior K = ∅ := by
  sorry

/-- 3.2. The irrational numbers are homeomorphic to Baire space (Tserunyan, Corollary 5.5). -/
theorem nonempty_homeomorph_irrational_baire :
    Nonempty ({x : ℝ // Irrational x} ≃ₜ (ℕ → ℕ)) := by
  sorry

/-- 3.3. The sequences in Cantor space with infinitely many `true` values form a subspace
homeomorphic to Baire space. -/
theorem nonempty_homeomorph_frequently_true_baire :
    Nonempty ({x : ℕ → Bool // ∃ᶠ n in atTop, x n = true} ≃ₜ (ℕ → ℕ)) := by
  sorry

/-! ## Layer 4: Sierpiński's characterisation of the rationals -/

/-- 4.1. Sierpiński's theorem: a space is homeomorphic to `ℚ` if and only if it is nonempty,
countable, metrizable and perfect (Francis, Theorem 2). -/
theorem nonempty_homeomorph_rat_iff (X : Type*) [TopologicalSpace X] :
    Nonempty (X ≃ₜ ℚ) ↔
      Nonempty X ∧ Countable X ∧ MetrizableSpace X ∧ PerfectSpace X := by
  sorry

end TauCetiRoadmap.CantorSetAndCompactMetricSpaces
