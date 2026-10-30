import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Algebra.Star.StarProjection
import Mathlib.LinearAlgebra.Matrix.Hermitian
import Mathlib.LinearAlgebra.Matrix.Notation

/-!
**This file is not the roadmap and is not exhaustive.**
The README is definitive. These native matrix targets calibrate the spin-half
projection fields of QF6b.SpinHamiltonians. They do not replace its full-domain
commutation, measurable descent or unbounded multiplier constructions.
-/

noncomputable section

namespace QuantumFoundations.SpinHamiltonian

open Matrix

abbrev Direction := EuclideanSpace ℝ (Fin 3)
abbrev SpinMatrix := Matrix (Fin 2) (Fin 2) ℂ

/-- n·σ for the usual ordered Pauli matrices σ_x, σ_y, σ_z. -/
def axis (n : Direction) : SpinMatrix :=
  !![(n 2 : ℂ), (n 0 : ℂ) - Complex.I * (n 1 : ℂ);
    (n 0 : ℂ) + Complex.I * (n 1 : ℂ), -(n 2 : ℂ)]

def plus (n : Direction) : SpinMatrix := (1 / 2 : ℂ) • (1 + axis n)
def minus (n : Direction) : SpinMatrix := (1 / 2 : ℂ) • (1 - axis n)

def symbol (n : Direction) (a b : ℝ) : SpinMatrix :=
  (a : ℂ) • (1 : SpinMatrix) + (b : ℂ) • axis n

theorem axis_isHermitian (n : Direction) : (axis n).IsHermitian := by
  sorry

theorem projection_laws (n : Direction) (hn : ‖n‖ = 1) :
    IsStarProjection (plus n) ∧ IsStarProjection (minus n) ∧
      plus n * minus n = 0 ∧ plus n + minus n = 1 := by
  sorry

/-- The eigenvalues of n·σ are ±1, corresponding to spin weights ±1/2. -/
theorem symbol_on_channels (n : Direction) (hn : ‖n‖ = 1) (a b : ℝ) :
    symbol n a b * plus n = ((a + b : ℝ) : ℂ) • plus n ∧
      symbol n a b * minus n = ((a - b : ℝ) : ℂ) • minus n := by
  sorry

theorem symbol_decomposition (n : Direction) (a b : ℝ) :
    symbol n a b = ((a + b : ℝ) : ℂ) • plus n +
      ((a - b : ℝ) : ℂ) • minus n := by
  sorry

end QuantumFoundations.SpinHamiltonian
