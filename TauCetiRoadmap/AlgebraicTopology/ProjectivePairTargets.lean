import Mathlib.Algebra.Group.Prod
import Mathlib.Algebra.Group.Hom.Instances
import Mathlib.Tactic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.

Coefficient maps for the hemispherical bases in Kirby's projective-pair exercise.
The proofs below verify these integer maps only. The README separately requires
the actual relative homotopy groups, geometric generators, covering-pair lifting,
crossed-module action, and induced-map comparisons. None is supplied by these
arithmetic identities.
-/

namespace TauCetiRoadmap.AlgebraicTopology.ProjectivePair

/-- Coefficients of the actual quotient map after the geometric identifications
required in AT8.1, with both hemispheres oriented by the ambient sphere. -/
def quotientCoefficient (n : ℕ) : ℤ × ℤ →+ ℤ where
  toFun z := z.1 + (-1 : ℤ) ^ (n + 1) * z.2
  map_zero' := by simp
  map_add' a b := by dsimp; ring

/-- The boundary coefficient in the covering equator; downstairs at n=2
the map to the standard circle generator is twice this value. -/
def boundaryCoefficient : ℤ × ℤ →+ ℤ where
  toFun z := z.1 - z.2
  map_zero' := by simp
  map_add' a b := by dsimp; ring

/-- The positive RP¹ loop acts on the exceptional relative π₂ by negative swap. -/
def circleMonodromy : (ℤ × ℤ) ≃+ (ℤ × ℤ) where
  toFun z := (-z.2, -z.1)
  invFun z := (-z.2, -z.1)
  left_inv z := by simp
  right_inv z := by simp
  map_add' a b := by simp [add_comm]

theorem quotient_on_diagonal (n : ℕ) (k : ℤ) :
    quotientCoefficient n (k, k) = (1 + (-1 : ℤ) ^ (n + 1)) * k := by
  dsimp [quotientCoefficient]
  ring

theorem quotient_surjective (n : ℕ) : Function.Surjective (quotientCoefficient n) := by
  intro k
  exact ⟨(k, 0), by simp [quotientCoefficient]⟩

theorem quotient_not_injective (n : ℕ) : ¬ Function.Injective (quotientCoefficient n) := by
  intro h
  have hz : ((-((-1 : ℤ) ^ (n + 1)), 1) : ℤ × ℤ) = (0, 0) :=
    h (by simp [quotientCoefficient])
  have := congrArg Prod.snd hz
  norm_num at this

theorem boundary_monodromy (z : ℤ × ℤ) :
    boundaryCoefficient (circleMonodromy z) = boundaryCoefficient z := by
  dsimp [boundaryCoefficient, circleMonodromy]
  ring

theorem circleMonodromy_diagonal (k : ℤ) : circleMonodromy (k, k) = (-k, -k) := rfl

end TauCetiRoadmap.AlgebraicTopology.ProjectivePair
