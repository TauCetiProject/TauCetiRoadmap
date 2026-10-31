module

public import Mathlib

/-!
# Grothendieck universes: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib, each with `sorry`,
together with the one definition their statements need. The API of the definition and the Checks
stay in the README.

Every carrier is Mathlib's: the type `ZFSet.{u}` of ZFC sets with `ZFSet.IsTransitive`,
`ZFSet.powerset`, `ZFSet.iUnion`, `ZFSet.omega` and `ZFSet.card`, the von Neumann hierarchy
`ZFSet.vonNeumann` (notation `V_`), and `Cardinal.IsInaccessible`, Mathlib's uncountable regular
strong limit cardinals.

Headline theorems stated here:

* README 2.1, `isGrothendieckUniverse_vonNeumann` and `isGrothendieckUniverse_vonNeumann_omega0`:
  `V_κ` is a universe for every inaccessible `κ`, and so is `V_ω`.
* README 2.2, `isGrothendieckUniverse_iff`: the universes are `V_ω` and the `V_κ`, `κ`
  inaccessible.
* README 2.3, `IsGrothendieckUniverse.isInaccessible_card` and
  `IsGrothendieckUniverse.eq_vonNeumann_card`: a universe containing `ω` has inaccessible
  cardinality `κ` and is `V_κ`.
* README 3.1, `IsGrothendieckUniverse.mem_or_eq_or_mem`: universes are totally ordered by
  membership.
* README 3.2, `exists_least_isGrothendieckUniverse`: a set lying in some universe lies in a least
  one.
* README 3.3, `forall_exists_isGrothendieckUniverse_iff`: every set lies in a universe iff every
  cardinal lies below an inaccessible one.

Not stated here: the closure properties of README 1.2 are not headlines and are kept in the
README.
-/

public section

namespace TauCetiRoadmap.GrothendieckUniverses

open ZFSet

universe u

/-! ## Layer 1: universes -/

/-- A Grothendieck universe, with the axioms of Gabriel 1962, Ch. 0, §1, p. 328, in the form of
Williams 1969, p. 1: transitive, closed under power sets, singletons and unions of families
indexed by an element, and nonempty. -/
structure IsGrothendieckUniverse (U : ZFSet.{u}) : Prop where
  /-- Every element of an element of `U` is in `U`. -/
  isTransitive : U.IsTransitive
  /-- `U` is closed under power sets. -/
  powerset_mem : ∀ x ∈ U, x.powerset ∈ U
  /-- `U` is closed under singletons. -/
  singleton_mem : ∀ x ∈ U, ({x} : ZFSet.{u}) ∈ U
  /-- The union of a family of elements of `U` indexed by an element of `U` is in `U`. -/
  iUnion_mem : ∀ I ∈ U, ∀ f : I → ZFSet.{u}, (∀ i, f i ∈ U) → iUnion f ∈ U
  /-- `U` is nonempty. -/
  nonempty : U ≠ ∅

/-! ## Layer 2: universes are the inaccessible stages -/

/-- **`V_κ` is a universe** for every inaccessible `κ` (README 2.1; Williams 1969, (b) and (c),
p. 2, after Shepherdson 1951). -/
theorem isGrothendieckUniverse_vonNeumann {κ : Cardinal.{u}} (hκ : κ.IsInaccessible) :
    IsGrothendieckUniverse (V_ κ.ord) := by
  sorry

/-- **`V_ω` is a universe** (README 2.1): the hereditarily finite sets. -/
theorem isGrothendieckUniverse_vonNeumann_omega0 :
    IsGrothendieckUniverse (V_ Ordinal.omega0.{u}) := by
  sorry

/-- **Williams's theorem** (README 2.2; Williams 1969, Theorem 1, p. 2, with Kruse 1965): the
universes are `V_ω` and the stages `V_κ` at the inaccessible cardinals `κ`. -/
theorem isGrothendieckUniverse_iff {U : ZFSet.{u}} :
    IsGrothendieckUniverse U ↔
      U = V_ Ordinal.omega0 ∨ ∃ κ : Cardinal.{u}, κ.IsInaccessible ∧ U = V_ κ.ord := by
  sorry

/-- **The cardinal of a universe** (README 2.3; Williams 1969, Theorem 2, p. 3): a universe
containing `ω` has inaccessible cardinality. -/
theorem IsGrothendieckUniverse.isInaccessible_card {U : ZFSet.{u}} (hU : IsGrothendieckUniverse U)
    (hω : omega ∈ U) : (card U).IsInaccessible := by
  sorry

/-- **A universe is the stage of its cardinal** (README 2.3; Williams 1969, Theorems 1 and 2,
pp. 2–3). -/
theorem IsGrothendieckUniverse.eq_vonNeumann_card {U : ZFSet.{u}} (hU : IsGrothendieckUniverse U)
    (hω : omega ∈ U) : U = V_ (card U).ord := by
  sorry

/-! ## Layer 3: the order of universes and the universe axiom -/

/-- **Universes are totally ordered** (README 3.1): of two universes, one is an element of the
other or they are equal. -/
theorem IsGrothendieckUniverse.mem_or_eq_or_mem {U V : ZFSet.{u}} (hU : IsGrothendieckUniverse U)
    (hV : IsGrothendieckUniverse V) : U ∈ V ∨ U = V ∨ V ∈ U := by
  sorry

/-- **The least universe containing a set** (README 3.2; Gabriel 1962, Ch. 0, §1, p. 328). -/
theorem exists_least_isGrothendieckUniverse {x : ZFSet.{u}}
    (h : ∃ U, IsGrothendieckUniverse U ∧ x ∈ U) :
    ∃ U, IsGrothendieckUniverse U ∧ x ∈ U ∧
      ∀ V, IsGrothendieckUniverse V → x ∈ V → U ⊆ V := by
  sorry

/-- **The universe axiom** (README 3.3; Williams 1969, p. 3): every set lies in a universe iff
every cardinal lies below an inaccessible cardinal. -/
theorem forall_exists_isGrothendieckUniverse_iff :
    (∀ x : ZFSet.{u}, ∃ U, IsGrothendieckUniverse U ∧ x ∈ U) ↔
      ∀ c : Cardinal.{u}, ∃ κ : Cardinal.{u}, κ.IsInaccessible ∧ c < κ := by
  sorry

end TauCetiRoadmap.GrothendieckUniverses
