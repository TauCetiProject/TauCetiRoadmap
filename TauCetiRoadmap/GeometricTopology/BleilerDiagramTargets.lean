import Mathlib

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms; the README is the definitive specification.

Integer continuants for rational unknotting and Nakanishi–Bleiler diagrams. Primitive pairs retain
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
  induction w with
  | nil => simp [continuant]
  | cons a w ih =>
    simp [continuant, ih, List.map_cons, List.prod_cons,
      step, Matrix.mul_apply, Fin.sum_univ_two]

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

/-- Zeroing the middle two-twist box cancels the reverse-negated word.
This matrix identity does not supply the geometric crossing-change comparison. -/
theorem palindromic_zero_product (w : List ℤ) :
    ((w ++ [0] ++ w.reverse.map (fun a => -a)).map step).prod = step 0 := by
  induction w with
  | nil => simp
  | cons a w ih =>
    calc
      _ = step a * ((w ++ [0] ++ w.reverse.map (fun b => -b)).map step).prod *
          step (-a) := by
        simp [List.reverse_cons, List.map_append, List.prod_append, mul_assoc]
      _ = step a * step 0 * step (-a) := by rw [ih]
      _ = step 0 := by
        ext i j
        fin_cases i <;> fin_cases j <;>
          simp [step, Matrix.mul_apply, Fin.sum_univ_two]

/-- The switched rational normal form has primitive numerator one. -/
theorem palindromic_zero_pair (a : ℤ) (w : List ℤ) :
    continuant (a :: (w ++ [0] ++ w.reverse.map (fun b => -b))) = (1, 0) := by
  rw [continuant_eq_matrix_product]
  simp only [List.map_cons, List.prod_cons, palindromic_zero_product]
  simp [step, Matrix.mul_apply, Fin.sum_univ_two]

/-- The literal [4,4] model and the two-same-box / one-each-box switches. -/
theorem eight_three_pairs :
    continuant [4, 4] = (17, 4) ∧
    continuant [0, 4] = (1, 4) ∧
    continuant [2, 2] = (5, 2) := by
  norm_num [continuant]

/-- The lens-space parameter orbit of 2 excludes 4, including global reflection. -/
theorem lens_seventeen_residues :
    (2 * 9 : ZMod 17) = 1 ∧
    (4 : ZMod 17) ∉ ({2, -2, 9, -9} : Finset (ZMod 17)) := by
  decide

end TauCetiRoadmap.GeometricTopology.BleilerDiagram
