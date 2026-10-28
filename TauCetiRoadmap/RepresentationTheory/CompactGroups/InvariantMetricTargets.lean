import TauCeti.RepresentationTheory.Compact.UnitaryModel
import TauCeti.RepresentationTheory.Continuous.Schur

/-!
Suggested statements for README.md, which is definitive. This file is neither
exhaustive nor a required implementation plan. The admissions are future targets.
-/

set_option autoImplicit false

open scoped InnerProductSpace

namespace TauCetiRoadmap.RepresentationTheory.CompactGroups

variable {G V : Type*} [Group G]
  [NormedAddCommGroup V] [InnerProductSpace ℂ V] [FiniteDimensional ℂ V]
  [CompleteSpace V]

/-- Invariance of a Gram form is commutation when the reference action is unitary. -/
theorem gramForm_invariant_iff_commutes (π : ContRepresentation ℂ G V)
    (hπ : TauCeti.ContRepresentation.IsUnitary π) (T : V →L[ℂ] V) :
    (∀ g v w, ⟪π g v, T (π g w)⟫_ℂ = ⟪v, T w⟫_ℂ) ↔
      ∀ g, T.comp (π g) = (π g).comp T := by
  sorry

/-- The positive cone in an irreducible self-intertwiner algebra has one real scale. -/
theorem positive_selfIntertwiner_existsUnique_scalar (π : ContRepresentation ℂ G V)
    (hirr : π.toRepresentation.IsIrreducible) (T : ContIntertwiningMap π π)
    (hself : IsSelfAdjoint T.toContinuousLinearMap)
    (hpos : ∀ v : V, v ≠ 0 → 0 < (⟪v, T v⟫_ℂ).re) :
    ∃! c : ℝ, 0 < c ∧ T.toContinuousLinearMap =
      (c : ℂ) • ContinuousLinearMap.id ℂ V := by
  sorry

end TauCetiRoadmap.RepresentationTheory.CompactGroups
