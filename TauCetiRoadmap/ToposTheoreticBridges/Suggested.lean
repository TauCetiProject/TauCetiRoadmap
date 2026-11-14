import Mathlib

/-!
# Topos-theoretic bridges: target signatures

The roadmap is `README.md`. This file states the roadmap's headline theorems against the pinned
Mathlib and Tau Ceti, each with `sorry`, with only the definitions they need.

Headlines stated:
* README 1.1, `MoritaEquivalentCat`, the definition;
* README 1.2, `moritaEquivalentCat_iff_karoubi`;
* README 2.1, `isGroupoid_iff_of_moritaEquivalentCat`;
* README 2.2, `IsRightOre` and `isRightOre_iff_of_moritaEquivalentCat`;
* README 3.1, `nonempty_orderIso_ici_of_sheafEquiv`.

Not stated: README 4.1, `MoritaEquivalent.quotientLattice`, lacking ClassifyingTopoi's geometric
theories, `IsClassifyingSite` and `MoritaEquivalent` (ClassifyingTopoi 2.1, 2.5, 2.6).
-/

namespace TauCetiRoadmap.ToposTheoreticBridges

open CategoryTheory CategoryTheory.Idempotents

universe u

/-! ## Layer 1: Morita equivalence of small categories -/

/-- Two small categories are Morita equivalent when their presheaf topoi are equivalent. -/
def MoritaEquivalentCat (C D : Type u) [SmallCategory C] [SmallCategory D] : Prop :=
  Nonempty ((Cᵒᵖ ⥤ Type u) ≌ (Dᵒᵖ ⥤ Type u))

/-- Two small categories are Morita equivalent exactly when their Karoubi envelopes are
equivalent (README 1.2). -/
theorem moritaEquivalentCat_iff_karoubi (C D : Type u) [SmallCategory C] [SmallCategory D] :
    MoritaEquivalentCat C D ↔ Nonempty (Karoubi C ≌ Karoubi D) := by
  sorry

/-! ## Layer 2: invariants of presheaf topoi -/

/-- Being a groupoid is invariant under Morita equivalence (README 2.1). -/
theorem isGroupoid_iff_of_moritaEquivalentCat {C D : Type u} [SmallCategory C] [SmallCategory D]
    (h : MoritaEquivalentCat C D) : IsGroupoid C ↔ IsGroupoid D := by
  sorry

/-- The right Ore condition: every cospan `f : a ⟶ c`, `g : b ⟶ c` is completed to a commuting
square `h ≫ f = k ≫ g` (README, Convention 2). -/
def IsRightOre (C : Type*) [Category C] : Prop :=
  ∀ ⦃a b c : C⦄ (f : a ⟶ c) (g : b ⟶ c), ∃ (d : C) (h : d ⟶ a) (k : d ⟶ b), h ≫ f = k ≫ g

/-- The right Ore condition is invariant under Morita equivalence (README 2.2). -/
theorem isRightOre_iff_of_moritaEquivalentCat {C D : Type u} [SmallCategory C]
    [SmallCategory D] (h : MoritaEquivalentCat C D) : IsRightOre C ↔ IsRightOre D := by
  sorry

/-! ## Layer 3: bridges between sites -/

/-- An equivalence of sheaf topoi of two small sites gives an order isomorphism between the
topologies finer than the two given ones (README 3.1). -/
theorem nonempty_orderIso_ici_of_sheafEquiv {C D : Type u} [SmallCategory C] [SmallCategory D]
    (J : GrothendieckTopology C) (K : GrothendieckTopology D)
    (e : Sheaf J (Type u) ≌ Sheaf K (Type u)) : Nonempty (Set.Ici J ≃o Set.Ici K) := by
  sorry

end TauCetiRoadmap.ToposTheoreticBridges
