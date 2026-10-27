import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.LinearAlgebra.Matrix.ConjTranspose

/-!
**This file is not the roadmap and is not exhaustive.** These are suggested
forms; the README is definitive. The diagonal model pins the complex exponent
and star-locus conventions without assuming a new modular-theory carrier.
Density normalization is unnecessary for this algebraic conjugation test.
-/

namespace TauCetiRoadmap.VonNeumannAlgebras.JonesFiniteModular

noncomputable section

/-- Positive diagonal complex powers use the native scalar power. -/
def diagonalPower {n : ℕ} (h : Fin n → ℝ) (z : ℂ) :
    Matrix (Fin n) (Fin n) ℂ :=
  Matrix.diagonal (fun i ↦ Complex.cpow (h i : ℂ) z)

/-- The exponent z here is the direct complex-power parameter;
the real modular group uses z = I*t. -/
def diagonalModularPower {n : ℕ} (h : Fin n → ℝ) (z : ℂ)
    (x : Matrix (Fin n) (Fin n) ℂ) : Matrix (Fin n) (Fin n) ℂ :=
  diagonalPower h z * x * diagonalPower h (-z)

theorem diagonalModularPower_star {n : ℕ} (h : Fin n → ℝ)
    (hh : ∀ i, 0 < h i) (z : ℂ) (x : Matrix (Fin n) (Fin n) ℂ) :
    star (diagonalModularPower h z x) =
      diagonalModularPower h (-star z) (star x) := by
  sorry

/-- Within one full matrix block, centrality is equality of the diagonal
entries. For a product of blocks this criterion is imposed blockwise. -/
theorem diagonalModularPower_preserves_star_iff {n : ℕ} (h : Fin n → ℝ)
    (hh : ∀ i, 0 < h i) (z : ℂ) :
    (∀ x : Matrix (Fin n) (Fin n) ℂ,
      star (diagonalModularPower h z x) = diagonalModularPower h z (star x)) ↔
      z.re = 0 ∨ ∀ i j, h i = h j := by
  sorry

end

end TauCetiRoadmap.VonNeumannAlgebras.JonesFiniteModular
