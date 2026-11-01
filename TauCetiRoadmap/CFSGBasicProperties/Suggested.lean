import TauCeti.GroupTheory.SpecificGroups.CFSG.Sporadic.Presentation
import TauCeti.Algebra.Group.Conj
import TauCeti.RepresentationTheory.CharacterTable.Dixon.ClassData.Basic
import TauCeti.RepresentationTheory.CharacterTable.Table

/-!
# CFSG basic properties: conjugacy-certificate and Monster target interfaces

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive.
This prospective companion displays P0/P2M interfaces, not the complete original programme.
The new group-specific words, local constructions and proof obligations are honest `sorry`
targets. They are not a supplied Monster certificate or a proof of its class count.
-/

namespace TauCetiRoadmap.CFSGBasicProperties

universe u v

section ConjugacyTools

variable {G : Type u} [Group G] [Finite G]

/-- Pairwise distinct actual classes exhaust a finite group when their centralizer indices sum
to the independently established group order. The implementation proves disjointness and uses
the actual orbit-stabilizer cardinalities; the equality is not an unverified database checksum. -/
theorem conjugacyCoverage_of_mass (reps : List G)
    (hp : reps.Pairwise fun x y => ¬ IsConj x y)
    (hm : (reps.map fun x => (Subgroup.centralizer ({x} : Set G)).index).sum = Nat.card G) :
    ∀ g : G, ∃ x ∈ reps, IsConj x g := sorry

/-- Construct the existing native carrier, keeping the actual representative list. -/
def classDataOfMass (reps : List G)
    (hp : reps.Pairwise fun x y => ¬ IsConj x y)
    (hm : (reps.map fun x => (Subgroup.centralizer ({x} : Set G)).index).sum = Nat.card G) :
    TauCeti.ClassData G where
  reps := reps
  pairwise_not_isConj := hp
  exists_isConj := conjugacyCoverage_of_mass reps hp hm

@[simp] theorem classDataOfMass_reps (reps : List G)
    (hp : reps.Pairwise fun x y => ¬ IsConj x y)
    (hm : (reps.map fun x => (Subgroup.centralizer ({x} : Set G)).index).sum = Nat.card G) :
    (classDataOfMass reps hp hm).reps = reps := rfl

end ConjugacyTools

/-- Actual representative-list transport for a recognized model. Native conjugacy-class
transport remains `MulEquiv.conjClassesEquiv`; this only supplies the numbered list adapter. -/
def classDataTransport {G : Type u} {H : Type v} [Group G] [Group H]
    (e : G ≃* H) (d : TauCeti.ClassData G) : TauCeti.ClassData H where
  reps := d.reps.map e
  pairwise_not_isConj := sorry
  exists_isConj := sorry

@[simp] theorem classDataTransport_reps {G : Type u} {H : Type v} [Group G] [Group H]
    (e : G ≃* H) (d : TauCeti.ClassData G) :
    (classDataTransport e d).reps = d.reps.map e := rfl

theorem card_conjClasses_of_mulEquiv {G : Type u} {H : Type v} [Group G] [Group H]
    (e : G ≃* H) : Nat.card (ConjClasses G) = Nat.card (ConjClasses H) :=
  Nat.card_congr e.conjClassesEquiv

/-! ### Actual Monster data: existing P2 construction precedes P2M -/

abbrev Monster := TauCeti.SporadicName.M.Group
abbrev MonsterWord :=
  TauCeti.PresentationWord (Fin TauCeti.SporadicName.M.presentation.generatorCount)

/-- Evaluate words in exactly the presentation selected by the native CFSG sporadic table. -/
def monsterWordEval (w : MonsterWord) : Monster :=
  PresentedGroup.mk TauCeti.SporadicName.M.presentation.relatorSet (FreeGroup.mk w)

/-- The existing P2 finiteness obligation; no classification axiom is assumed. -/
theorem monster_finite : Finite Monster := sorry

attribute [local instance] monster_finite

/-- Actual words for the two involution representatives, to be constructed from P2's model and
transported through the proved recognition map. -/
noncomputable def monster2AWord : MonsterWord := sorry
noncomputable def monster2BWord : MonsterWord := sorry

noncomputable def monster2A : Monster := monsterWordEval monster2AWord
noncomputable def monster2B : Monster := monsterWordEval monster2BWord

theorem orderOf_monster2A : orderOf monster2A = 2 := sorry
theorem orderOf_monster2B : orderOf monster2B = 2 := sorry
theorem monster_involutions_not_isConj : ¬ IsConj monster2A monster2B := sorry

theorem monster_involution_classes (g : Monster) (hg : orderOf g = 2) :
    IsConj monster2A g ∨ IsConj monster2B g := sorry

/-- These are the actual centralizers, not separately postulated groups of the expected shape. -/
abbrev Monster2ACentralizer := Subgroup.centralizer ({monster2A} : Set Monster)
abbrev Monster2BCentralizer := Subgroup.centralizer ({monster2B} : Set Monster)

/-- P2M must construct the Griess action, identify its fixed line, and prove this splitting
and the small constituent's irreducibility without the full 194-column character table. -/
noncomputable def monsterGriessAction :
    Representation ℂ Monster (Fin 196884 → ℂ) := sorry

noncomputable def monster196883Representation :
    Representation ℂ Monster (Fin 196883 → ℂ) := sorry

noncomputable def monsterGriessSplitting :
    Representation.Equiv ((Representation.trivial ℂ Monster ℂ).prod
      monster196883Representation) monsterGriessAction := sorry

theorem monster196883_isIrreducible :
    monster196883Representation.IsIrreducible := sorry

/-! ### Complete representative data and its proved consequences -/

/-- Construct the actual named word list, with bibliographic row correspondence and native
label convention. An arbitrary admitted list is not an implementation of this target. -/
noncomputable def monsterClassWords : List MonsterWord := sorry

noncomputable def monsterClassRepresentatives : List Monster := monsterClassWords.map monsterWordEval

theorem monsterClassWords_length : monsterClassWords.length = 194 := sorry

theorem monsterClassRepresentatives_pairwise :
    monsterClassRepresentatives.Pairwise fun x y => ¬ IsConj x y := sorry

/-- The actual centralizer-order table; each entry requires its local group proof. -/
noncomputable def monsterCentralizerOrder :
    Fin monsterClassRepresentatives.length → ℕ := sorry

theorem monsterCentralizerOrder_eq (i : Fin monsterClassRepresentatives.length) :
    Nat.card (Subgroup.centralizer ({monsterClassRepresentatives.get i} : Set Monster)) =
      monsterCentralizerOrder i := sorry

/-- Independently certify the full class-size sum after proving the actual centralizer orders
and the exact Monster order. This includes the odd-order analysis as well as the involution
centralizers and cannot be inferred from the count 194 alone. -/
theorem monsterClassRepresentatives_mass :
    (monsterClassRepresentatives.map fun x =>
      (Subgroup.centralizer ({x} : Set Monster)).index).sum = Nat.card Monster := sorry

/-- Defined from the actual words and explicit soundness targets, never an opaque
`ClassData Monster := sorry` with a separately postulated number of classes. -/
noncomputable def monsterClassData : TauCeti.ClassData Monster :=
  classDataOfMass monsterClassRepresentatives monsterClassRepresentatives_pairwise
    monsterClassRepresentatives_mass

theorem monsterClassData_numClasses : monsterClassData.numClasses = 194 := by
  change monsterClassRepresentatives.length = 194
  simpa [monsterClassRepresentatives] using monsterClassWords_length

theorem monster_card_conjClasses : Nat.card (ConjClasses Monster) = 194 :=
  monsterClassData.numClasses_eq_card_conjClasses.symm.trans monsterClassData_numClasses

/-- Native mathematical label lookup. Its classical decidability adapter is not claimed to be
an executable large-group conjugacy algorithm; any such algorithm needs its own P0 soundness. -/
noncomputable def monsterClassLabel (g : Monster) : Fin monsterClassData.numClasses := by
  classical
  exact monsterClassData.index g

theorem monsterClassLabel_eq_iff (g h : Monster) :
    monsterClassLabel g = monsterClassLabel h ↔ IsConj g h := by
  classical
  exact monsterClassData.index_eq_index_iff

/-- The generic native irreducible/class-count theorem supplies the final character corollary.
Invertibility of the finite positive order in ℂ is automatic mathematically and is explicit here
as the native theorem's interface; it is not a Monster-specific assumption. -/
theorem monster_card_irreducibleCharacters [Invertible (Nat.card Monster : ℂ)] :
    Nat.card (TauCeti.irreducibleCharacters ℂ Monster) = 194 :=
  (TauCeti.card_irreducibleCharacters ℂ Monster).trans monster_card_conjClasses

end TauCetiRoadmap.CFSGBasicProperties
