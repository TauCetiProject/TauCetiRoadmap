import TauCeti.RepresentationTheory.Compact.PeterWeyl
import Mathlib.Analysis.Complex.Circle

/-!
Suggested statements for README.md, which is definitive. This file is neither
exhaustive nor a required implementation plan. The admissions are future targets.
-/

set_option autoImplicit false

noncomputable section

open MeasureTheory

namespace TauCetiRoadmap.RepresentationTheory.CompactGroups

universe u

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G]

/-- The general compact-group dual is countable exactly in the second-countable case. -/
theorem secondCountable_iff_countable_irrepClass :
    SecondCountableTopology G ↔ Countable (TauCeti.IrrepClass ℂ G) := by
  sorry

variable [MeasurableSpace G] [BorelSpace G]

/-- The Peter–Weyl block index detects separability of normalized Haar L². -/
theorem separable_L2_iff_countable_irrepClass :
    TopologicalSpace.SeparableSpace (Lp ℂ 2 (TauCeti.haarProb G)) ↔
      Countable (TauCeti.IrrepClass ℂ G) := by
  sorry

-- Use the Borel sigma algebra of the product topology for every index type.
local instance (J : Type u) : MeasurableSpace (J → Circle) := borel _
local instance (J : Type u) : BorelSpace (J → Circle) := ⟨rfl⟩

/-- Coordinate characters give the uncountable orthonormal-family obstruction. -/
theorem not_separable_L2_circleProduct (J : Type u) (hJ : ¬ Countable J) :
    ¬ TopologicalSpace.SeparableSpace (Lp ℂ 2 (TauCeti.haarProb (J → Circle))) := by
  sorry

end TauCetiRoadmap.RepresentationTheory.CompactGroups
