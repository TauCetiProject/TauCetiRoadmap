import Mathlib.Data.Fintype.Pi
import Mathlib.Data.List.OfFn
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum

/-!
Suggested forms, not an exhaustive checklist. The README is definitive.

These are actual finite-word, integer and matrix calculations. No knot type,
realized diagram, geometric primeness, isotopy or map-reconstruction theorem is
replaced by an assumed certificate. The admitted theorems below are future proof
targets. Rational matrix entries do not assert an odd-parameter geometric basis.
-/

namespace TauCetiRoadmap.GeometricTopology.KnotGrowth

def pairStep (s : ℕ × ℕ) (letter : Bool) : ℕ × ℕ :=
  if letter then (s.1 + s.2, s.1) else (s.1 + s.2, s.2)

def slopePair (word : List Bool) : ℕ × ℕ := word.foldl pairStep (2, 1)

def incrementLast : List ℕ → List ℕ
  | [] => []
  | [a] => [a + 1]
  | a :: b :: rest => a :: incrementLast (b :: rest)

def reversedCoefficients (word : List Bool) : List ℕ :=
  word.foldl (fun coefficients letter =>
    if letter then coefficients ++ [1] else incrementLast coefficients) [2]

def oddNumeratorCount (m : ℕ) : ℕ :=
  (Finset.univ.filter fun word : Fin m → Bool =>
    (slopePair (List.ofFn word)).1 % 2 = 1).card

theorem slopePair_valid (word : List Bool) :
    0 < (slopePair word).2 ∧ (slopePair word).2 < (slopePair word).1 ∧
      Nat.Coprime (slopePair word).1 (slopePair word).2 := by
  sorry

theorem slopePair_injective : Function.Injective slopePair := by
  sorry

theorem coefficient_sum (word : List Bool) :
    (reversedCoefficients word).sum = word.length + 2 := by
  sorry

theorem oddNumeratorCount_adjacent (m : ℕ) :
    oddNumeratorCount m + oddNumeratorCount (m + 1) = 2 ^ (m + 1) := by
  sorry

theorem oddNumeratorCount_closed (m : ℕ) :
    (3 : ℤ) * (oddNumeratorCount m : ℤ) =
      (2 : ℤ) ^ (m + 1) - 2 * (-1 : ℤ) ^ m := by
  sorry

theorem orientedCodeBound (n : ℕ) :
    2 * 2 ^ n * 4 ^ (2 * (2 * n)) = 2 * 512 ^ n := by
  calc
    2 * 2 ^ n * 4 ^ (2 * (2 * n)) = 2 * 2 ^ n * (256 : ℕ) ^ n := by
      congr 1
      rw [pow_mul, pow_mul]
      norm_num
    _ = 2 * ((2 * 256 : ℕ) ^ n) := by rw [mul_pow]; ring
    _ = 2 * 512 ^ n := by norm_num

def pretzelSeifert (p q r : ℚ) : Matrix (Fin 2) (Fin 2) ℚ :=
  !![(p + q) / 2, (q + 1) / 2; (q - 1) / 2, (q + r) / 2]

def pretzelGoeritz (p q r : ℤ) : Matrix (Fin 2) (Fin 2) ℤ :=
  !![p + q, -q; -q, q + r]

theorem pretzelGoeritz_det (p q r : ℤ) :
    (pretzelGoeritz p q r).det = p * q + p * r + q * r := by
  simp [pretzelGoeritz, Matrix.det_fin_two]
  ring

theorem pretzelSeifert_alexander (p q r t : ℚ) :
    (pretzelSeifert p q r - t • (pretzelSeifert p q r).transpose).det =
      ((p * q + p * r + q * r + 1) / 4) * (1 - t) ^ 2 + t := by
  simp [pretzelSeifert, Matrix.det_fin_two, Matrix.sub_apply,
    Matrix.smul_apply, Matrix.transpose_apply]
  ring

theorem pretzel_minus3_5_7_alexander (t : ℚ) :
    (pretzelSeifert (-3) 5 7 - t • (pretzelSeifert (-3) 5 7).transpose).det = t := by
  rw [pretzelSeifert_alexander]
  norm_num

theorem pretzel_3_5_minus7_symmetric :
    pretzelSeifert 3 5 (-7) + (pretzelSeifert 3 5 (-7)).transpose =
      !![(8 : ℚ), 5; 5, -2] := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [pretzelSeifert]

end TauCetiRoadmap.GeometricTopology.KnotGrowth
