import TauCeti.KnotTheory.PDCode.Basic
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
These are native finite diagram codes and the simultaneous sphere/height reversal.
The geometric flypes, relative isotopies and complete flyping proof remain targets
in the README; finite code enumeration does not prove them.
-/
namespace TauCetiRoadmap.GeometricTopology.Flyping
open TauCeti

abbrev CrossingCode (n : ℕ) := {D : PDCode n // D.crossinglessComponentCount = 0}
abbrev FiniteData (n : ℕ) := Equiv.Perm (Fin (4*n)) ×
  PerfectMatching (Fin (4*n)) × (Fin n → Bool)

def crossingCodeEquiv (n : ℕ) : CrossingCode n ≃ FiniteData n where
  toFun D := (D.1.halfEdge,D.1.edgePair,D.1.overPair)
  invFun d := ⟨⟨d.1,d.2.1,0,d.2.2⟩,rfl⟩
  left_inv D := by
    apply Subtype.ext
    apply PDCode.ext <;> simp [D.2]
  right_inv d := rfl

instance crossingCodeFintype (n : ℕ) : Fintype (CrossingCode n) :=
  Fintype.ofEquiv (FiniteData n) (crossingCodeEquiv n).symm

instance crossingCodeDecidableEq (n : ℕ) : DecidableEq (CrossingCode n) :=
  (crossingCodeEquiv n).injective.decidableEq

/-- Reverse the cyclic slots, fixing slots 0 and 2 and exchanging slots 1 and 3. -/
def slotReflection (n : ℕ) : Equiv.Perm (Fin (4*n)) :=
  (PDCode.crossingSlotEquiv n).symm.trans
    ((Equiv.prodCongr (Equiv.refl (Fin n)) (Equiv.swap 1 3)).trans
      (PDCode.crossingSlotEquiv n))

@[simp] theorem slotReflection_crossing (n : ℕ) (i : Fin n) (s : Fin 4) :
    slotReflection n (PDCode.crossingSlotEquiv n (i,s)) =
      PDCode.crossingSlotEquiv n (i,Equiv.swap 1 3 s) := by
  simp [slotReflection]

@[simp] theorem slotReflection_involutive (n : ℕ) (h : Fin (4*n)) :
    slotReflection n (slotReflection n h) = h := by
  obtain ⟨⟨i,s⟩,rfl⟩ := (PDCode.crossingSlotEquiv n).surjective h
  simp

/-- View from the other side: reverse the sphere chart AND the over/under choices. -/
def turnover {n : ℕ} (D : PDCode n) : PDCode n where
  halfEdge := (slotReflection n).trans D.halfEdge
  edgePair := D.edgePair
  crossinglessComponentCount := D.crossinglessComponentCount
  overPair := fun i => !D.overPair i

@[simp] theorem turnover_crossing {n : ℕ} (D : PDCode n) (i : Fin n) (s : Fin 4) :
    (turnover D).crossing i s = D.crossing i (Equiv.swap 1 3 s) := by
  simp [turnover,PDCode.crossing_apply]

@[simp] theorem turnover_involutive {n : ℕ} (D : PDCode n) :
    turnover (turnover D) = D := by
  apply PDCode.ext
  · ext h; simp [turnover]
  · rfl
  · rfl
  · funext i; simp [turnover]

/-- Half-edge directions move with the strands. For crossingless circles we choose the
planar-direction dictionary, so reversing the sphere chart reverses their Boolean labels. -/
def orientedTurnover {n : ℕ} (D : OrientedPDCode n) : OrientedPDCode n :=
  OrientedPDCode.mk (turnover D.toPDCode) D.orientation D.orientation_edgePair
    (by
      intro i s
      change D.orientation ((turnover D.toPDCode).crossing i (PDCode.oppositeCrossingSlot s)) =
        !D.orientation ((turnover D.toPDCode).crossing i s)
      simp only [turnover_crossing]
      have h := D.orientation_oppositeCrossingSlot i (Equiv.swap 1 3 s)
      have hc : Equiv.swap (1 : Fin 4) 3 (PDCode.oppositeCrossingSlot s) =
          PDCode.oppositeCrossingSlot (Equiv.swap 1 3 s) := by
        fin_cases s <;> decide
      simpa only [hc,PDCode.crossing_apply] using h)
    (D.crossinglessComponents.map (!·))
    (by
      change (D.crossinglessComponents.map (!·)).card = D.crossinglessComponentCount
      cases D with
      | mk base dirs hedge hop circles hcount =>
        simpa only [Multiset.card_map] using hcount)

@[simp] theorem orientedTurnover_crossingSign {n : ℕ} (D : OrientedPDCode n) (i : Fin n) :
    (orientedTurnover D).crossingSign i = D.crossingSign i := by
  have h := D.orientation_crossing_of_add_two_eq i (s:=1) (t:=3) (by decide)
  simp only [OrientedPDCode.crossingSign,orientedTurnover,turnover_crossing]
  simp only [show Equiv.swap (1 : Fin 4) 3 0 = 0 by decide,
    show Equiv.swap (1 : Fin 4) 3 1 = 3 by decide]
  rw [h]
  simp only [turnover]
  have hb (a b c : Bool) :
      (if Bool.xor a (!b) = !c then (1 : ℤ) else -1) =
        (if Bool.xor a b = c then (1 : ℤ) else -1) := by
    cases a <;> cases b <;> cases c <;> decide
  exact hb _ _ _

@[simp] theorem orientedTurnover_writhe {n : ℕ} (D : OrientedPDCode n) :
    (orientedTurnover D).writhe = D.writhe := by
  simp [OrientedPDCode.writhe]

end TauCetiRoadmap.GeometricTopology.Flyping
