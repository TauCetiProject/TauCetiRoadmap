/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.CStarAlgebra.CStarMatrix
import Mathlib.Analysis.CStarAlgebra.ContinuousFunctionalCalculus.Isometric
import Mathlib.Analysis.SpecialFunctions.ContinuousFunctionalCalculus.PosPart.Basic
import Mathlib.Analysis.SpecialFunctions.ContinuousFunctionalCalculus.Rpow.Order

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
-/

noncomputable section

open scoped CStarAlgebra ComplexOrder

-- Match the scalar restriction used by the native real continuous functional calculus.
attribute [local instance 1100] Module.complexToReal Algebra.complexToReal

namespace CStarAlgebras.MatrixOrderExamples

local notation "M₂" => CStarMatrix (Fin 2) (Fin 2) ℂ

def swap : M₂ := CStarMatrix.ofMatrix !![0, 1; 1, 0]

def swapPositive : M₂ := CStarMatrix.ofMatrix !![1/2, 1/2; 1/2, 1/2]

def diagonal (s t : ℝ) : M₂ := CStarMatrix.ofMatrix !![(s : ℂ), 0; 0, (t : ℂ)]

def firstProjection : M₂ := CStarMatrix.ofMatrix !![1, 0; 0, 0]

/-- The positive part is a rank-one projection. -/
theorem swap_posPart : swap⁺ = swapPositive ∧ swapPositive ^ 2 = swapPositive := by
  sorry

/-- The full positive-quadrant region, including zero boundary parameters. -/
theorem swap_le_diagonal (s t : ℝ) (hs : 0 ≤ s) (ht : 0 ≤ t) :
    swap ≤ diagonal s t ↔ 1 ≤ s * t := by
  sorry

/-- All principal-minor conditions are retained for the shifted matrix. -/
theorem positivePart_le_diagonal (s t : ℝ) :
    swapPositive ≤ diagonal s t ↔
      1/2 ≤ s ∧ 1/2 ≤ t ∧ 1/4 ≤ (s - 1/2) * (t - 1/2) := by
  sorry

/-- Positive-part order and squaring both have concrete noncommuting obstructions. -/
theorem order_counterexamples :
    (swap ≤ diagonal (1/2) 3 ∧ ¬ swapPositive ≤ diagonal (1/2) 3) ∧
    (swapPositive ≤ diagonal (5/8) 5 ∧
      ¬ swapPositive ^ 2 ≤ (diagonal (5/8) 5) ^ 2) := by
  sorry

/-- Compressing a positive projection need not give an operator below it. -/
theorem compression_counterexample :
    ¬ firstProjection * swapPositive * firstProjection ≤ swapPositive := by
  sorry

end CStarAlgebras.MatrixOrderExamples

namespace CStarAlgebras

/-- The valid replacement for the unrestricted compression inequality. -/
theorem compression_le_iff_commute {A : Type*} [CStarAlgebra A]
    [PartialOrder A] [StarOrderedRing A] (p T : A)
    (hp : IsStarProjection p) (hT : 0 ≤ T) :
    p * T * p ≤ T ↔ Commute p T := by
  sorry

end CStarAlgebras
