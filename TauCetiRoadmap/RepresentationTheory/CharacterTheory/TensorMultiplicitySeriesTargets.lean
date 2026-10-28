import TauCeti.RepresentationTheory.FDRep
import TauCeti.RepresentationTheory.Simple.Basic
import TauCeti.RepresentationTheory.Tensor.Power
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.Analysis.Complex.Basic

/-!
Suggested forms for README.md, which is definitive. This file is neither
exhaustive nor a required implementation plan. The admissions are future targets.
-/

set_option autoImplicit false
noncomputable section
open CategoryTheory

namespace TauCetiRoadmap.RepresentationTheory.CharacterTheory

variable {G : Type*} [Group G]

/-- The actual tensor-power Hom dimensions as coefficients of a native power series. -/
def tensorMultiplicitySeries (U X : FDRep ℂ G) : PowerSeries ℂ :=
  PowerSeries.mk fun n ↦
    (Module.finrank ℂ (X ⟶ FDRep.of (Representation.tensorPower U.ρ n)) : ℂ)

@[simp] theorem coeff_tensorMultiplicitySeries (U X : FDRep ℂ G) (n : ℕ) :
    PowerSeries.coeff n (tensorMultiplicitySeries U X) =
      (Module.finrank ℂ (X ⟶ FDRep.of (Representation.tensorPower U.ρ n)) : ℂ) := by
  simp [tensorMultiplicitySeries]

variable [Fintype G]

/-- Finite character averaging gives the formal geometric-series identity. -/
theorem tensorMultiplicitySeries_eq_characterFractions (U X : FDRep ℂ G) :
    tensorMultiplicitySeries U X =
      PowerSeries.C ((Fintype.card G : ℂ)⁻¹) *
        ∑ g : G, PowerSeries.C (X.character (g⁻¹)) *
          (1 - PowerSeries.C (U.character g) * PowerSeries.X)⁻¹ := by
  sorry

/-- Positive tensor powers suffice once the faithful representation is nonzero. -/
theorem exists_positive_tensorPower_le_valueCount (U X : FDRep ℂ G)
    (hU : Function.Injective U.ρ) (hd : 0 < Module.finrank ℂ U.V)
    [Simple X] :
    ∃ n : ℕ, 0 < n ∧ n ≤ Nat.card (Set.range U.character) ∧
      0 < Module.finrank ℂ (X ⟶ FDRep.of (Representation.tensorPower U.ρ n)) := by
  sorry

/-- The noncancelling identity pole rules out eventual vanishing of multiplicities. -/
theorem arbitrarily_large_tensorPowers (U X : FDRep ℂ G)
    (hU : Function.Injective U.ρ) (hd : 0 < Module.finrank ℂ U.V)
    [Simple X] (B : ℕ) :
    ∃ n : ℕ, B ≤ n ∧
      0 < Module.finrank ℂ (X ⟶ FDRep.of (Representation.tensorPower U.ρ n)) := by
  sorry

end TauCetiRoadmap.RepresentationTheory.CharacterTheory
