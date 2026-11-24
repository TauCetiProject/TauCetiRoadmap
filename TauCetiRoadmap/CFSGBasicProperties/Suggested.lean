module
import Mathlib
import TauCeti.GroupTheory.SpecificGroups.CFSG.Classification
import TauCeti.GroupTheory.SpecificGroups.CFSG.Assembly.LieType
import TauCeti.GroupTheory.SpecificGroups.CFSG.Sporadic.Presentation
import TauCeti.RepresentationTheory.CharacterTable.Table

/-!
# CFSG basic properties: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, on the exact carriers of
CFSGStatement: simplicity of the group of every valid Lie-type index (Layer 5), finiteness,
simplicity and the ATLAS order of every sporadic presentation (Layers 6 and 10), the Monster's
conjugacy structure (Layer 11), and finiteness and simplicity of every group on the classification
list (Layer 12). The only definition is the table of sporadic orders, which the uniform order
theorem needs. The finiteness of the Lie-type groups is not stated here: it is the pinned Tau Ceti
theorem `TauCeti.ValidLieTypeIndex.finite`. The simplicity criterion for split Tits systems of
Layer 1 is Tau Ceti's `TauCeti.TitsSystem.isSimpleGroup_derivedCentralQuotient`.

Not statable at the pins: the fixed-point Bruhat decomposition and the twisted root groups of
Layer 2 (no finite root groups on `d.FixedPoints`). The structural identification of the
centralizers of the two Monster involution classes, with the double cover of the Baby Monster and
with the local group `2^{1+24}_+.Co1`, is a README target of §11.1 built on the constructions of
Layers 8 and 9; the headline below states the two classes and the orders of their centralizers.
-/

namespace TauCetiRoadmap.CFSGBasicProperties

/-! ## Layer 5: Suzuki, Ree and Tits groups, and the Lie-type endpoint -/

/-- **Every Lie-type carrier is simple** (Layer 3 for the thirteen ordinary and graph-twisted
constructors, Layer 5 for Suzuki, Ree and Tits), by Tits's simplicity criterion for a split Tits
system or by Iwasawa's criterion on the designated carrier, including every valid small field. -/
theorem validLieTypeIndex_isSimpleGroup (d : TauCeti.ValidLieTypeIndex) :
    IsSimpleGroup d.Group := sorry

/-! ## Layer 6: the fourteen sporadic groups with existing permutation models -/

/-- The ATLAS orders of the twenty-six sporadic groups (ATLAS of Finite Group Representations,
version 3, sporadic groups index), the targets of the uniform order theorem. -/
def sporadicOrder : TauCeti.SporadicName → ℕ
  | .M11 => 7920
  | .M12 => 95040
  | .M22 => 443520
  | .M23 => 10200960
  | .M24 => 244823040
  | .J1 => 175560
  | .J2 => 604800
  | .J3 => 50232960
  | .J4 => 86775571046077562880
  | .HS => 44352000
  | .McL => 898128000
  | .He => 4030387200
  | .Ru => 145926144000
  | .Suz => 448345497600
  | .ONan => 460815505920
  | .Co1 => 4157776806543360000
  | .Co2 => 42305421312000
  | .Co3 => 495766656000
  | .Fi22 => 64561751654400
  | .Fi23 => 4089470473293004800
  | .Fi24Prime => 1255205709190661721292800
  | .HN => 273030912000000
  | .Ly => 51765179004000000
  | .Th => 90745943887872000
  | .B => 4154781481226426191177580544000000
  | .M => 808017424794512875886459904961710757005754368000000000

/-! ## Layer 10: recognition of the Monster and Baby Monster, and the sporadic endpoint -/

/-- **Every sporadic presented group is finite** (Layers 6–10): a presentation upper bound
certified on the exact relator set, matched with a finite model. -/
theorem sporadicName_finite (s : TauCeti.SporadicName) : Finite s.Group := sorry

/-- **Every sporadic presented group is simple** (Layers 6–10), through the recognition
`MulEquiv` with its finite model and a simplicity certificate for that model. -/
theorem sporadicName_isSimpleGroup (s : TauCeti.SporadicName) : IsSimpleGroup s.Group := sorry

/-- **Every sporadic presented group has its ATLAS order** (Layers 6–10): the order of the exact
presented group, not of a model that merely satisfies the relators. -/
theorem sporadicName_card (s : TauCeti.SporadicName) : Nat.card s.Group = sporadicOrder s :=
  sorry

/-! ## Layer 11: the conjugacy classes of the Monster -/

/-- **The Monster has exactly two classes of involutions**, with centralizers of orders
`2·|B|` (class `2A`, the double cover of the Baby Monster) and `2^25·|Co1|` (class `2B`, the
local group `2^{1+24}_+.Co1`); Höhn–Seysen, Appendix E, for the local fusion route. -/
theorem monster_two_involution_classes :
    ∃ a b : TauCeti.SporadicName.M.Group, orderOf a = 2 ∧ orderOf b = 2 ∧ ¬ IsConj a b ∧
      (∀ g : TauCeti.SporadicName.M.Group, orderOf g = 2 → IsConj a g ∨ IsConj b g) ∧
      Nat.card (Subgroup.centralizer ({a} : Set TauCeti.SporadicName.M.Group)) =
        2 * sporadicOrder .B ∧
      Nat.card (Subgroup.centralizer ({b} : Set TauCeti.SporadicName.M.Group)) =
        2 ^ 25 * sporadicOrder .Co1 := sorry

/-- **The Monster has 194 conjugacy classes**, from an explicit complete list of pairwise
nonconjugate representatives (Breuer–Magaard–Wilson, arXiv:2412.12182, §2 and §4.9). -/
theorem monster_card_conjClasses :
    Nat.card (ConjClasses TauCeti.SporadicName.M.Group) = 194 := sorry

/-- **The Monster has an irreducible complex representation of degree 196883**, the complement
of the fixed line in the 196884-dimensional Griess module. -/
theorem monster_exists_irreducible_196883 :
    ∃ ρ : Representation ℂ TauCeti.SporadicName.M.Group (Fin 196883 → ℂ), ρ.IsIrreducible :=
  sorry

/-- **The Monster has 194 irreducible complex characters**: the class count transported through
the class-number theorem `TauCeti.card_irreducibleCharacters` over `ℂ`. -/
theorem monster_card_irreducibleCharacters :
    Nat.card (TauCeti.irreducibleCharacters ℂ TauCeti.SporadicName.M.Group) = 194 := sorry

/-! ## Layer 12: assembly of the list -/

/-- **Every group on the classification list is finite.** Proved by cases on the index from the
cyclic and alternating branches, Tau Ceti's Lie-type finiteness `TauCeti.ValidLieTypeIndex.finite`
(cited in Layer 5) and the sporadic theorem of Layer 10. -/
theorem CFSGIndex_finite (i : TauCeti.CFSGIndex) : Finite i.Group := sorry

/-- **Every group on the classification list is simple.** Proved by cases on the index from the
cyclic and alternating branches, Layer 5 (Lie type) and Layer 10 (sporadic); every case also
establishes nontriviality. -/
theorem CFSGIndex_isSimpleGroup (i : TauCeti.CFSGIndex) : IsSimpleGroup i.Group := sorry

end TauCetiRoadmap.CFSGBasicProperties
