import Mathlib

/-!
# The two-generator presentation and Fox row for the cinquefoil

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The raw-word calculation below is explicit; its comparison with generic Fox
derivatives and the geometric complement group is part of the README target.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.FiveOne

open LaurentPolynomial

/-- `true` is a positive letter, as in the native `FreeGroup.mk` convention. -/
def relatorWord : List (Fin 2 × Bool) :=
  [(0, true), (1, true), (0, true), (1, true), (0, true),
   (1, false), (0, false), (1, false), (0, false), (1, false)]

def relator : FreeGroup (Fin 2) := FreeGroup.mk relatorWord

abbrev WirtingerPresentation := PresentedGroup ({relator} : Set (FreeGroup (Fin 2)))

def torusRelator : FreeGroup (Fin 2) :=
  FreeGroup.of 0 ^ 2 * (FreeGroup.of 1 ^ 5)⁻¹

abbrev TorusPresentation := PresentedGroup ({torusRelator} : Set (FreeGroup (Fin 2)))

/-- Both directions and the images of all generators are part of the comparison. -/
theorem exists_presentation_mulEquiv :
    ∃ e : WirtingerPresentation ≃* TorusPresentation,
      e (PresentedGroup.of 0) = (PresentedGroup.of 1) ^ (-2 : ℤ) * PresentedGroup.of 0 ∧
      e (PresentedGroup.of 1) = (PresentedGroup.of 0)⁻¹ * (PresentedGroup.of 1) ^ 3 ∧
      e.symm (PresentedGroup.of 0) =
        PresentedGroup.of 0 * PresentedGroup.of 1 * PresentedGroup.of 0 *
          PresentedGroup.of 1 * PresentedGroup.of 0 ∧
      e.symm (PresentedGroup.of 1) = PresentedGroup.of 0 * PresentedGroup.of 1 := by
  sorry

/-- Meridionally specialized Fox sum on a signed word, starting at prefix exponent `s`. -/
def wordFox (i : Fin 2) : ℤ → List (Fin 2 × Bool) → ℤ[T;T⁻¹]
  | _, [] => 0
  | s, (j, positive) :: rest =>
      (if j = i then (if positive then T s else -T (s - 1)) else 0) +
        wordFox i (if positive then s + 1 else s - 1) rest

def alexander : ℤ[T;T⁻¹] := T 4 - T 3 + T 2 - T 1 + 1

theorem wordFox_x : wordFox 0 0 relatorWord = alexander := by
  norm_num [wordFox, relatorWord, alexander]
  abel

theorem wordFox_y : wordFox 1 0 relatorWord = -alexander := by
  norm_num [wordFox, relatorWord, alexander]
  abel

/-- Cancellation of either neighboring inverse pair preserves the word calculation. -/
theorem wordFox_cancel (i j : Fin 2) (positive : Bool) (s : ℤ)
    (headWord tailWord : List (Fin 2 × Bool)) :
    wordFox i s (headWord ++ (j, positive) :: (j, !positive) :: tailWord) =
      wordFox i s (headWord ++ tailWord) := by
  sorry

theorem symmetric_normalization :
    T (-2) * alexander = T 2 - T 1 + 1 - T (-1) + T (-2) := by
  simp only [alexander, mul_add, mul_sub, mul_one, ← T_add]
  norm_num

end TauCetiRoadmap.GeometricTopology.FiveOne
