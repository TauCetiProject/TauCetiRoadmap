import TauCeti.GroupTheory.SpecificGroups.Braid.Word

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.
The words are concrete certificate inputs for problems27–28. Their geometric
identifications, HOMFLY support and minimum proofs remain README targets.
The one `sorry` states the representative native normal-form interface.
-/

namespace TauCetiRoadmap.GeometricTopology.BraidIndex

open TauCeti

/-- The existing B2 generator/exponent comparison in a representative native form. -/
theorem two_strand_normal_form (b : BraidGroup 2) :
    ∃! m : ℤ, BraidGroup.sigma 0 ^ m = b := by
  sorry

/-- Prime rows in the order 3_1,4_1,5_1,5_2,6_1,6_2,6_3,7_1,...,7_7.
The sigma type retains each actual strand count; there is no private knot carrier. -/
def primeBraids : List (Σ n : ℕ, BraidWord n) :=
  [
    ⟨2, [(0, -1), (0, -1), (0, -1)]⟩,
    ⟨3, [(0, -1), (1, 1), (0, -1), (1, 1)]⟩,
    ⟨2, [(0, -1), (0, -1), (0, -1), (0, -1), (0, -1)]⟩,
    ⟨3, [(0, -1), (0, -1), (0, -1), (1, -1), (0, 1), (1, -1)]⟩,
    ⟨4, [(0, -1), (0, -1), (1, -1), (0, 1), (2, 1), (1, -1), (2, 1)]⟩,
    ⟨3, [(0, -1), (0, -1), (0, -1), (1, 1), (0, -1), (1, 1)]⟩,
    ⟨3, [(0, -1), (0, -1), (1, 1), (0, -1), (1, 1), (1, 1)]⟩,
    ⟨2, [(0, -1), (0, -1), (0, -1), (0, -1), (0, -1), (0, -1), (0, -1)]⟩,
    ⟨4, [(0, -1), (0, -1), (0, -1), (1, -1), (0, 1), (1, -1), (2, -1), (1, 1), (2, -1)]⟩,
    ⟨3, [(0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (1, 1), (0, -1), (1, 1)]⟩,
    ⟨4, [(0, 1), (0, 1), (1, 1), (0, -1), (1, 1), (1, 1), (2, 1), (1, -1), (2, 1)]⟩,
    ⟨3, [(0, -1), (0, -1), (0, -1), (0, -1), (1, -1), (0, 1), (1, -1), (1, -1)]⟩,
    ⟨4, [(0, -1), (0, -1), (1, 1), (0, -1), (2, -1), (1, 1), (2, -1)]⟩,
    ⟨4, [(0, 1), (1, -1), (0, 1), (1, -1), (2, 1), (1, -1), (2, 1)]⟩
  ]

/-- Granny, square and trefoil/figure-eight connected-braid sums. -/
def compositeBraids : List (Σ n : ℕ, BraidWord n) :=
  [⟨3, [(0, 1), (0, 1), (0, 1), (1, 1), (1, 1), (1, 1)]⟩,
   ⟨3, [(0, 1), (0, 1), (0, 1), (1, -1), (1, -1), (1, -1)]⟩,
   ⟨4, [(0, 1), (0, 1), (0, 1), (1, -1), (2, 1), (1, -1), (2, 1)]⟩]

end TauCetiRoadmap.GeometricTopology.BraidIndex
