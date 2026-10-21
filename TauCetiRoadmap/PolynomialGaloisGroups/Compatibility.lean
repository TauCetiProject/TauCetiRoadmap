import TauCeti.GroupTheory.Perm.Partition
import TauCeti.GroupTheory.Perm.TransitiveGroupLabel.Basic

/-!
# Conservative reciprocal names for Belyi's supplier contract

These are definitional abbreviations of native objects, with no additional data or
hypothesis. Degree-six through degree-eleven reference construction is not supplied by
these degree-at-most-five indices. No theorem about a new label carrier is postulated.
-/

namespace TauCetiRoadmap.PolynomialGaloisGroups

abbrev fullCycleType {α : Type*} [Fintype α] [DecidableEq α]
    (σ : Equiv.Perm α) : Multiset ℕ := Equiv.Perm.fullCycleType σ

abbrev numTransitiveGroups : ℕ → ℕ := TauCeti.numTransitiveGroups

abbrev TransitiveGroupIndex (n : ℕ) := TauCeti.TransitiveGroupIndex n

abbrev referenceSubgroup (n : ℕ) (j : TransitiveGroupIndex n) :
    Subgroup (Equiv.Perm (Fin n)) := TauCeti.referenceSubgroup n j

abbrev TransitiveGroupLabel {n : ℕ} (j : TransitiveGroupIndex n)
    (G : Subgroup (Equiv.Perm (Fin n))) : Prop := TauCeti.TransitiveGroupLabel j G

theorem fullCycleType_eq_native {α : Type*} [Fintype α] [DecidableEq α]
    (σ : Equiv.Perm α) : fullCycleType σ = Equiv.Perm.fullCycleType σ := rfl

theorem numTransitiveGroups_eq_native (n : ℕ) :
    numTransitiveGroups n = TauCeti.numTransitiveGroups n := rfl

theorem transitiveGroupIndex_eq_native (n : ℕ) :
    TransitiveGroupIndex n = TauCeti.TransitiveGroupIndex n := rfl

theorem referenceSubgroup_eq_native (n : ℕ) (j : TransitiveGroupIndex n) :
    referenceSubgroup n j = TauCeti.referenceSubgroup n j := rfl

theorem transitiveGroupLabel_iff_native {n : ℕ} (j : TransitiveGroupIndex n)
    (G : Subgroup (Equiv.Perm (Fin n))) :
    TransitiveGroupLabel j G ↔ TauCeti.TransitiveGroupLabel j G := Iff.rfl

theorem numTransitiveGroups_eq_zero_above_five {n : ℕ} (h : 5 < n) :
    numTransitiveGroups n = 0 := TauCeti.numTransitiveGroups_eq_zero_of_five_lt h

end TauCetiRoadmap.PolynomialGaloisGroups
