import Mathlib

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms; the README is the definitive specification.

Integer continuants for the Nakanishi–Bleiler diagrams. Primitive pairs retain
zero and infinity; division in `ℚ` is not used to represent projective slopes.
The geometric twist-box, crossing-switch and minimal-diagram classification
comparisons are additional README targets. The `sorry` proofs are future targets.
-/

namespace TauCetiRoadmap.GeometricTopology.BleilerDiagram

/-- Right-nested signed word, with the empty word representing infinity. -/
def continuant : List ℤ → ℤ × ℤ
  | [] => (1, 0)
  | a :: w => let p := continuant w; (a * p.1 + p.2, p.1)

/-- Native integral matrices give the signed continuant without division. -/
def step (a : ℤ) : Matrix (Fin 2) (Fin 2) ℤ := !![a, 1; 1, 0]

theorem continuant_eq_matrix_product (w : List ℤ) :
    continuant w = ((w.map step).prod 0 0, (w.map step).prod 1 0) := by
  sorry

theorem continuant_primitive (w : List ℤ) :
    Int.gcd (continuant w).1 (continuant w).2 = 1 := by
  sorry

/-- Counts of switched positive crossings in the three minimal twist boxes. -/
def switchedMinimal (k : Fin 3 → ℕ) : List ℤ :=
  [5 - 2 * (k 0 : ℤ), 1 - 2 * (k 1 : ℤ), 4 - 2 * (k 2 : ℤ)]

/-- The closed numerator formula applies even when an intermediate slope is zero. -/
theorem three_box_formula (a b c : ℤ) :
    continuant [a, b, c] = (a * b * c + a + c, b * c + 1) := by
  simp [continuant]
  ring

/-- Every subset of at most two switches reduces to one of these count triples.
The geometry reducing a subset to its box counts is specified in the README. -/
theorem two_switch_numerators (k : Fin 3 → ℕ)
    (h₀ : k 0 ≤ 5) (h₁ : k 1 ≤ 1) (h₂ : k 2 ≤ 4)
    (hcard : k 0 + k 1 + k 2 ≤ 2) :
    (continuant (switchedMinimal k)).1.natAbs ∈
      ({3, 5, 9, 11, 17, 19, 29} : Finset ℕ) := by
  sorry

theorem two_switch_nontrivial_numerator (k : Fin 3 → ℕ)
    (h₀ : k 0 ≤ 5) (h₁ : k 1 ≤ 1) (h₂ : k 2 ≤ 4)
    (hcard : k 0 + k 1 + k 2 ≤ 2) :
    (continuant (switchedMinimal k)).1.natAbs ≠ 1 := by
  sorry

/-- These arithmetic identities require the separate geometric closure comparisons. -/
theorem example_pairs :
    continuant [5, 1, 4] = (29, 5) ∧
    continuant [3, -1, 2] = (-1, -1) ∧
    continuant [4, 2, -2, 2, -2, 2] = (29, 6) ∧
    continuant [4, 0, -2, 0, -2, 2] = (1, 2) := by
  norm_num [continuant]

/-- The inverse-denominator test is for unoriented rational knots. -/
theorem inverse_denominator : (5 * 6 : ZMod 29) = 1 := by
  decide

end TauCetiRoadmap.GeometricTopology.BleilerDiagram
