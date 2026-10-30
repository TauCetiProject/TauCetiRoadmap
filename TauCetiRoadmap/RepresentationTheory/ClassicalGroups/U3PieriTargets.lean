import TauCeti.RepresentationTheory.ClassicalGroups.WeylModule.Rational
import TauCeti.RepresentationTheory.ClassicalGroups.SymmetricPower
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Tactic

/-!
Suggested forms for README.md, which is definitive. This file is neither
exhaustive nor a required implementation plan. The admission is a future target.
-/

set_option autoImplicit false
noncomputable section
open CategoryTheory
open scoped MonoidalCategory
attribute [local instance] Classical.propDecidable

namespace TauCetiRoadmap.RepresentationTheory.ClassicalGroups

/-- The fixed rank-three harmonic highest weight, retaining its central coordinate. -/
def u3HarmonicHighestWeight (a b : ℕ) : TauCeti.DominantWeight 3 :=
  ⟨![(a : ℤ), 0, -(b : ℤ)], by
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp_all⟩

/-- Pieri's horizontal two-strip condition on the actual rational Weyl models.
The finite list of increments supplies all six terms, including their boundaries. -/
theorem u3_symmetricSquare_pieri_multiplicity (a b : ℕ)
    (μ : TauCeti.DominantWeight 3) :
    Module.finrank ℂ
      (TauCeti.rationalWeylFDRep ℂ 3 μ ⟶
        (TauCeti.rationalWeylFDRep ℂ 3 (u3HarmonicHighestWeight a b) ⊗
          TauCeti.symPowerFDRep ℂ 3 2)) =
      if ∃ x₁ x₂ x₃ : ℕ, x₁ + x₂ + x₃ = 2 ∧ x₂ ≤ a ∧ x₃ ≤ b ∧
        μ.val = ![(a : ℤ) + (x₁ : ℤ), (x₂ : ℤ), -(b : ℤ) + (x₃ : ℤ)]
      then 1 else 0 := by
  sorry

end TauCetiRoadmap.RepresentationTheory.ClassicalGroups
