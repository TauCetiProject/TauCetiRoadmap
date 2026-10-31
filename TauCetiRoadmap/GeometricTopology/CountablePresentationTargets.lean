import Mathlib

/-!
# Countable and finite group presentations: suggested targets

This file is not the roadmap and is not exhaustive; the README is definitive.
Use native Group.Presentation and Group.Generators. Finite presentation is
already characterized by Group.Presentation.isFinitelyPresented_iff_exists_finite_presentation.
-/
noncomputable section
namespace CountablePresentationTargets

variable (G : Type*) [Group G]

def allElementsMap : FreeGroup G →* G := FreeGroup.lift id

theorem allElementsMap_surjective : Function.Surjective (allElementsMap G) := by
  intro g
  exact ⟨FreeGroup.of g, by simp [allElementsMap]⟩

/-- Every group has an all-elements presentation; no countability assumption is used. -/
def allElementsPresentation : Group.Presentation G G :=
  Group.Presentation.ofFreeGroupHom (allElementsMap G) (allElementsMap_surjective G)
    (allElementsMap G).ker (Subgroup.normalClosure_eq_self (allElementsMap G).ker).symm

def allElementsEquiv : PresentedGroup (allElementsPresentation G).rel ≃* G :=
  (allElementsPresentation G).presentedGroupEquiv

theorem allElementsEquiv_generator (g : G) :
    allElementsEquiv G (PresentedGroup.of g) = g := by
  sorry

/-- Repetitions allow finite and trivial groups to use the same Nat-indexed convention. -/
theorem countable_iff_nat_presentation :
    Countable G ↔ Nonempty (Group.Presentation G ℕ) := by
  sorry

theorem freeGroup_nat_countable : Countable (FreeGroup ℕ) := by infer_instance

theorem nat_relators_countable (P : Group.Presentation G ℕ) : Countable P.rel := by
  infer_instance

/-- Countability, and even having a countable presentation, does not imply finite generation. -/
theorem freeGroup_nat_not_fg : ¬ Group.FG (FreeGroup ℕ) := by
  sorry

end CountablePresentationTargets
