import TauCeti.Algebra.TemperleyLieb.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.

The native algebra and finite coordinates below support the course p88 identity.
They do not define a substitute tangle carrier or assert the geometric skein comparison.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.TwoTangleSkein

open Matrix

variable {R : Type*} [CommRing R]

def coordinates (μ : R) (v : Fin 2 → R) : TauCeti.TemperleyLieb R μ 2 :=
  v 0 • 1 + v 1 • TauCeti.TemperleyLieb.e μ 0

/-- The normal form uses the actual native two-strand presentation. -/
theorem exists_coordinates_equiv (μ : R) :
    ∃ e : (Fin 2 → R) ≃ₗ[R] TauCeti.TemperleyLieb R μ 2,
      ∀ v, e v = coordinates μ v := by
  sorry

def product (μ : R) (s t : Fin 2 → R) : Fin 2 → R :=
  ![s 0 * t 0, s 0 * t 1 + s 1 * t 0 + μ * s 1 * t 1]

theorem coordinates_product (μ : R) (s t : Fin 2 → R) :
    coordinates μ (product μ s t) = coordinates μ s * coordinates μ t := by
  sorry

def closureMatrix (μ : R) : Matrix (Fin 2) (Fin 2) R := !![μ, 1; 1, μ]

def closures (μ : R) (v : Fin 2 → R) : Fin 2 → R := closureMatrix μ *ᵥ v

/-- The universal identity has no nonzero-denominator hypothesis. -/
theorem cleared_numerator (μ : R) (s t : Fin 2 → R) :
    (1 - μ ^ 2) * closures μ (product μ s t) 0 =
      closures μ s 0 * closures μ t 1 + closures μ s 1 * closures μ t 0 -
        μ * (closures μ s 0 * closures μ t 0 + closures μ s 1 * closures μ t 1) := by
  sorry

/-- Specialization can lose closure injectivity even though the coordinate module stays free. -/
theorem closures_eq_zero_iff (μ : R) (v : Fin 2 → R) :
    closures μ v = 0 ↔ ∃ a : R, v = ![a, -μ * a] ∧ (1 - μ ^ 2) * a = 0 := by
  sorry

/-- The adjacent-orientation pairing differs by a unit factor from the alternating one. -/
theorem adjacent_gram_det (l : Rˣ) (m μ : R)
    (h : μ * m = -((l : R) + ((l⁻¹ : Rˣ) : R))) :
    Matrix.det (!![μ, 1; 1,
      -((l⁻¹ : Rˣ) : R) * m - (((l⁻¹ : Rˣ) : R) ^ 2) * μ] :
      Matrix (Fin 2) (Fin 2) R) =
        (((l⁻¹ : Rˣ) : R) ^ 2) * (1 - μ ^ 2) := by
  sorry

end TauCetiRoadmap.GeometricTopology.TwoTangleSkein

namespace TauCetiRoadmap.GeometricTopology.MutationBoundary

open Matrix Equiv

/-- Cyclic endpoint order NW, NE, SE, SW. -/
def port (i : Fin 4) : Fin 3 → ℤ :=
  ![![-1, 1, 0], ![1, 1, 0], ![1, -1, 0], ![-1, -1, 0]] i

/-- These are spatial rotations, including the change in crossing height. -/
def turnX : Matrix (Fin 3) (Fin 3) ℤ := !![1, 0, 0; 0, -1, 0; 0, 0, -1]
def turnY : Matrix (Fin 3) (Fin 3) ℤ := !![-1, 0, 0; 0, 1, 0; 0, 0, -1]
def turnZ : Matrix (Fin 3) (Fin 3) ℤ := !![-1, 0, 0; 0, -1, 0; 0, 0, 1]

def portX : Perm (Fin 4) := swap 0 3 * swap 1 2
def portY : Perm (Fin 4) := swap 0 1 * swap 2 3
def portZ : Perm (Fin 4) := swap 0 2 * swap 1 3
def turns : Fin 3 → Perm (Fin 4) := ![portX, portY, portZ]

theorem rotation_matrices :
    turnX.det = 1 ∧ turnY.det = 1 ∧ turnZ.det = 1 ∧
      turnX.transpose * turnX = 1 ∧ turnY.transpose * turnY = 1 ∧
      turnZ.transpose * turnZ = 1 ∧ turnX * turnY = turnZ := by
  decide +kernel

theorem port_comparison : ∀ i : Fin 4,
    turnX *ᵥ port i = port (portX i) ∧
      turnY *ᵥ port i = port (portY i) ∧
      turnZ *ᵥ port i = port (portZ i) := by
  decide +kernel

/-- Identity and the three half-turns form the four-element boundary action.
This is not a count of distinct mutant knot types. -/
theorem klein_four_packet :
    portX * portX = 1 ∧ portY * portY = 1 ∧ portZ * portZ = 1 ∧
      portX * portY = portZ ∧ portY * portX = portZ ∧
      portX ≠ 1 ∧ portY ≠ 1 ∧ portZ ≠ 1 ∧
      portX ≠ portY ∧ portX ≠ portZ ∧ portY ≠ portZ := by
  decide +kernel

/-- The same three permutations are exactly the three boundary pairings.
Their commutation expresses matching preservation by each half-turn. -/
theorem matching_packet : ∀ i j : Fin 3, turns i * turns j = turns j * turns i := by
  decide +kernel

/-- Every two-input/two-output marking is preserved or globally reversed.
The geometric mutation reverses all tangle orientations in the latter case. -/
theorem orientation_packet : ∀ (ε : Fin 4 → Bool),
    (Finset.univ.filter fun i => ε i).card = 2 → ∀ h : Fin 3,
      (∀ i, ε (turns h i) = ε i) ∨ (∀ i, ε (turns h i) = !(ε i)) := by
  decide +kernel

end TauCetiRoadmap.GeometricTopology.MutationBoundary
