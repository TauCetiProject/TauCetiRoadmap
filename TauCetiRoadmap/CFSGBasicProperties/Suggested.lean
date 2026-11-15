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
CFSGStatement: finiteness and simplicity of every group on the classification list (A0), of
every valid Lie-type index (F1, T2, T3) and of every sporadic presentation (P1, P2), the
twenty-six sporadic orders (P1, P2), and the Monster's conjugacy structure (P2M). The only
definition is the table of sporadic orders, which the uniform order theorem needs.

Not statable at the pins: the Tits normal-subgroup criterion of T0 (the pinned `TauCeti.TitsSystem`
carries no split structure `B = (B ∩ N) ⋉ U`, so the hypotheses `U` solvable and `Z ∩ U = 1`
have no carrier); the fixed-point Bruhat decomposition and twisted root groups of T1 (no finite
root groups on `d.FixedPoints`); and the centralizer structures `2·B` and `2^{1+24}_+.Co1` of the
two Monster involution classes (no double cover of the Baby Monster and no extraspecial local
group at the pins), whose orders are stated instead.
-/

namespace TauCetiRoadmap.CFSGBasicProperties

/-! ## A0: the two uniform theorems -/

/-- **Every group on the classification list is finite.** Proved by cases on the index from E0
(cyclic and alternating), F1 (Lie type) and P1–P2 (sporadic). -/
theorem CFSGIndex_finite (i : TauCeti.CFSGIndex) : Finite i.Group := sorry

/-- **Every group on the classification list is simple.** Proved by cases on the index from E0,
T2–T3 (Lie type) and P1–P2 (sporadic); every case also establishes nontriviality. -/
theorem CFSGIndex_isSimpleGroup (i : TauCeti.CFSGIndex) : IsSimpleGroup i.Group := sorry

/-! ## F1, T2, T3: the groups of Lie type -/

/-- **Every Lie-type carrier is finite** (F1): the derived central quotient of the Steinberg fixed
points of a valid Lie-type index, through the finite-coordinate criterion F0 applied to the
branch iterate formulas. -/
theorem validLieTypeIndex_finite (d : TauCeti.ValidLieTypeIndex) : Finite d.Group := sorry

/-- **Every Lie-type carrier is simple** (T2 for the thirteen ordinary and graph-twisted
constructors, T3 for Suzuki, Ree and Tits), by the Tits normal-subgroup criterion of T0 or
Mathlib's Iwasawa criterion on the designated carrier, including every valid small field. -/
theorem validLieTypeIndex_isSimpleGroup (d : TauCeti.ValidLieTypeIndex) :
    IsSimpleGroup d.Group := sorry

/-! ## P1, P2: the sporadic presentations -/

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

/-- **Every sporadic presented group is finite** (P1–P2): a presentation upper bound certified
on the exact relator set, matched with a finite model. -/
theorem sporadicName_finite (s : TauCeti.SporadicName) : Finite s.Group := sorry

/-- **Every sporadic presented group is simple** (P1–P2), through the recognition `MulEquiv`
with its finite model and a simplicity certificate for that model. -/
theorem sporadicName_isSimpleGroup (s : TauCeti.SporadicName) : IsSimpleGroup s.Group := sorry

/-- **Every sporadic presented group has its ATLAS order** (P1–P2): the order of the exact
presented group, not of a model that merely satisfies the relators. -/
theorem sporadicName_card (s : TauCeti.SporadicName) : Nat.card s.Group = sporadicOrder s :=
  sorry

/-! ## P2M: the Monster's conjugacy structure -/

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
the native class-number theorem `TauCeti.card_irreducibleCharacters` over `ℂ`. -/
theorem monster_card_irreducibleCharacters :
    Nat.card (TauCeti.irreducibleCharacters ℂ TauCeti.SporadicName.M.Group) = 194 := sorry

end TauCetiRoadmap.CFSGBasicProperties
