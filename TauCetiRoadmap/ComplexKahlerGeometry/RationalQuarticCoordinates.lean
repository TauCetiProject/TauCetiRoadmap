import Mathlib.LinearAlgebra.Pi
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring

/-!
These are suggested forms, not an exhaustive checklist. The README is the
definitive specification. This companion proves the coefficient calculation for
the rational quartic. Its projective embedding, bundle and section comparisons
are separate geometric targets in K7.2.
-/

namespace TauCetiRoadmap.ComplexKahlerGeometry.RationalQuarticCoordinates

variable {R : Type*} [CommRing R]

/-- Coordinates for the degree-four map; they have no common projective zero. -/
def parametrization (s t : R) : Fin 4 → R := ![s ^ 4, s ^ 3 * t, s * t ^ 3, t ^ 4]

theorem parametrization_homogeneous (a s t : R) :
    parametrization (a * s) (a * t) = a ^ 4 • parametrization s t := by
  ext i
  fin_cases i <;> simp [parametrization, smul_eq_mul] <;> ring

/-- The chart at s≠0, normalized by s⁴. -/
theorem parametrization_first_chart (z : R) :
    parametrization 1 z = ![1, z, z ^ 3, z ^ 4] := by
  simp [parametrization]

/-- The chart at t≠0, normalized by t⁴. -/
theorem parametrization_last_chart (u : R) :
    parametrization u 1 = ![u ^ 4, u ^ 3, u, 1] := by
  simp [parametrization]

/-- In monomial order s⁴,s³t,s²t²,st³,t⁴, restriction inserts a zero. -/
def restrictionCoordinates : (Fin 4 → R) →ₗ[R] (Fin 5 → R) where
  toFun a := ![a 0, a 1, 0, a 2, a 3]
  map_add' a b := by ext i; fin_cases i <;> simp
  map_smul' c a := by ext i; fin_cases i <;> simp

/-- Coefficient extraction on the four monomials used by the embedding. -/
def recover : (Fin 5 → R) →ₗ[R] (Fin 4 → R) where
  toFun b := ![b 0, b 1, b 3, b 4]
  map_add' a b := by ext i; fin_cases i <;> simp
  map_smul' c a := by ext i; fin_cases i <;> simp

@[simp] theorem recover_restriction (a : Fin 4 → R) :
    recover (restrictionCoordinates a) = a := by
  ext i
  fin_cases i <;> simp [recover, restrictionCoordinates]

theorem restriction_injective : Function.Injective (restrictionCoordinates (R := R)) := by
  intro a b h
  simpa using congrArg recover h

theorem mem_range_iff (b : Fin 5 → R) :
    b ∈ LinearMap.range restrictionCoordinates ↔ b 2 = 0 := by
  constructor
  · rintro ⟨a, rfl⟩
    rfl
  · intro h
    refine ⟨recover b, ?_⟩
    ext i
    fin_cases i <;> simp [recover, restrictionCoordinates, h]

/-- The coefficient vector of the omitted section s²t². -/
def missingSection : Fin 5 → R := ![0, 0, 1, 0, 0]

theorem missingSection_not_mem_range [Nontrivial R] :
    missingSection (R := R) ∉ LinearMap.range restrictionCoordinates := by
  rw [mem_range_iff]
  simp [missingSection]

end TauCetiRoadmap.ComplexKahlerGeometry.RationalQuarticCoordinates
