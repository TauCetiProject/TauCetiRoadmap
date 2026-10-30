import Mathlib

/-!
Selected target signatures for README.md, the definitive specification.
This file is not exhaustive. The three theorem admissions are future proofs.
All spaces, product topologies, compactness classes and the Cantor carrier are
native Mathlib objects; no private product-space or group carrier is introduced.
-/

noncomputable section

namespace TauCetiRoadmap.BanachAlgebras.ProductDomains

universe u v

/-- Nonempty factors are essential: otherwise the product can be empty. -/
theorem locallyCompact_pi_iff {I : Type u} (X : I → Type v)
    [∀ i, TopologicalSpace (X i)] [∀ i, Nonempty (X i)]
    [∀ i, T2Space (X i)] [∀ i, LocallyCompactSpace (X i)] :
    LocallyCompactSpace (∀ i, X i) ↔ Set.Finite {i | ¬ CompactSpace (X i)} := by
  sorry

/-- This is the usual product topology, with no norm topology substituted. -/
theorem locallyCompact_realPower_iff (I : Type u) :
    LocallyCompactSpace (I → ℝ) ↔ Finite I := by
  sorry

/-- The finite-discrete coordinate map is explicitly false↦0, true↦1. -/
theorem exists_cantor_binary_group_homeomorph :
    ∃ e : cantorSet ≃ₜ (ℕ → ZMod 2), ∀ (x : cantorSet) (n : ℕ),
      e x n = if cantorSetHomeomorphNatToBool x n then 1 else 0 := by
  sorry

end TauCetiRoadmap.BanachAlgebras.ProductDomains
