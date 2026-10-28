import Mathlib.LinearAlgebra.RootSystem.Irreducible
import Mathlib.LinearAlgebra.RootSystem.Reduced
import Mathlib.LinearAlgebra.RootSystem.IsValuedIn
import Mathlib.Basic.Real.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import TauCeti.LinearAlgebra.RootSystem.InvariantForm.Basic

/-!
Suggested forms for README.md, which is definitive. This file is neither
exhaustive nor a required implementation plan. The admissions are future targets.
-/

set_option autoImplicit false

namespace TauCetiRoadmap.RepresentationTheory.RootSystems

variable {ι M N : Type*} [Fintype ι]
  [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]
  (P : RootPairing ι ℝ M N) [P.IsRootSystem] [P.IsIrreducible]

/-- On the full irreducible root span an invariant positive metric has one scale. -/
theorem invariantForm_existsUnique_positiveScale
    (B C : P.InvariantForm) (hB : B.form.toQuadraticMap.PosDef) (hC : C.form.toQuadraticMap.PosDef) :
    ∃! c : ℝ, 0 < c ∧ C.form = c • B.form := by
  sorry

/-- Lengths here are squared lengths. The assertion requires irreducibility. -/
theorem squaredRootLengths_twoValued [P.IsReduced] [P.IsCrystallographic]
    (B : P.InvariantForm) (hB : B.form.toQuadraticMap.PosDef) :
    ∃ s : ℝ, 0 < s ∧ ∃ r ∈ ({1, 2, 3} : Set ℝ),
      ∀ i, B.form (P.root i) (P.root i) = s ∨
        B.form (P.root i) (P.root i) = r * s := by
  sorry

end TauCetiRoadmap.RepresentationTheory.RootSystems
