import Mathlib.LinearAlgebra.Matrix.Stochastic
import Mathlib.LinearAlgebra.Matrix.Hermitian

/-!
# Finite discrete-time quantum walks: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These declarations pin the common unitary predicate, time convention and the input
type of the Szegedy construction.
-/

open scoped Matrix

namespace TauCetiRoadmap.DiscreteQuantumWalks

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The shared finite-matrix unitarity predicate. -/
def IsUnitary (U : Matrix V V ℂ) : Prop := Uᴴ * U = 1

/-- Evolution after `n` discrete steps. -/
def evolution (U : Matrix V V ℂ) (n : ℕ) : Matrix V V ℂ := U ^ n

/-- Perfect basis-state transfer at a fixed discrete step. -/
def HasPSTAt (U : Matrix V V ℂ) (u v : V) (n : ℕ) : Prop :=
  ‖evolution U n v u‖ = 1

/-- A Szegedy walk consumes Mathlib's row-stochastic matrix object. -/
noncomputable def szegedyWalk (P : Matrix.rowStochastic ℝ V) :
    Matrix (V × V) (V × V) ℂ := sorry

/-- The Szegedy construction is unitary. -/
theorem szegedyWalk_unitary (P : Matrix.rowStochastic ℝ V) :
    IsUnitary (szegedyWalk P) := sorry

/-- The Hermitian discriminant whose spectrum controls the Szegedy walk. -/
noncomputable def szegedyDiscriminant (P : Matrix.rowStochastic ℝ V) : Matrix V V ℂ :=
  fun x y => Real.sqrt ((P : Matrix V V ℝ) x y * (P : Matrix V V ℝ) y x)

/-- The discriminant is Hermitian even when the chain itself is not symmetric. -/
theorem szegedyDiscriminant_isHermitian (P : Matrix.rowStochastic ℝ V) :
    (szegedyDiscriminant P).IsHermitian := sorry

end TauCetiRoadmap.DiscreteQuantumWalks
