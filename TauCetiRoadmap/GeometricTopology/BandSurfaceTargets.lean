import Mathlib
import TauCeti.Combinatorics.Enumerative.PerfectMatching

/-!
# Finite signed disc-band data: suggested targets

This file is not the roadmap and is not exhaustive. The README is definitive.
The finite data describe abstract thickenings. Embedded attaching strips, crossing
heights and ambient isotopies require the separate geometric realization targets.
-/
noncomputable section
namespace BandSurfaceTargets
open Equiv TauCeti

abbrev Ports (b : ℕ) := Fin b × Bool
abbrev Corners (b : ℕ) := Ports b × Bool

structure SignedBands (d b : ℕ) where
  discOf : Ports b → Fin d
  rotation : Perm (Ports b)
  rotation_fibers : ∀ p q, rotation.SameCycle p q ↔ discOf p = discOf q
  twisted : Fin b → Bool

variable {d b : ℕ}

def incidenceGraph (B : SignedBands d b) : Graph (Fin d) (Fin b) where
  vertexSet := Set.univ
  edgeSet := Set.univ
  IsLink e v w :=
    (B.discOf (e, false) = v ∧ B.discOf (e, true) = w) ∨
    (B.discOf (e, false) = w ∧ B.discOf (e, true) = v)
  isLink_symm := by
    intro e _
    constructor
    intro v w h
    exact h.symm
  eq_or_eq_of_isLink_of_isLink := by
    intro e v w x y h₁ h₂
    rcases h₁ with h₁ | h₁ <;> rcases h₂ with h₂ | h₂ <;> aesop
  edge_mem_iff_exists_isLink := by
    intro e
    constructor
    · intro _
      exact ⟨B.discOf (e, false), B.discOf (e, true), Or.inl ⟨rfl, rfl⟩⟩
    · intro _
      trivial
  left_mem_of_isLink := by intro e v w _; trivial

def IsolatedDiscs (B : SignedBands d b) := {v : Fin d // ∀ p, B.discOf p ≠ v}

/-- Corner false precedes the port and true follows it in the chosen disc orientation. -/
def discStep (B : SignedBands d b) (c : Corners b) : Corners b :=
  if c.2 then (B.rotation c.1, false) else (B.rotation.symm c.1, true)

theorem discStep_involutive (B : SignedBands d b) : Function.Involutive (discStep B) := by
  rintro ⟨p, s⟩
  cases s <;> simp [discStep]

theorem discStep_ne (B : SignedBands d b) (c : Corners b) : discStep B c ≠ c := by
  rcases c with ⟨p, s⟩
  cases s <;> simp [discStep]

def discPerm (B : SignedBands d b) : Perm (Corners b) where
  toFun := discStep B
  invFun := discStep B
  left_inv := discStep_involutive B
  right_inv := discStep_involutive B

def discMatching (B : SignedBands d b) : PerfectMatching (Corners b) :=
  PerfectMatching.mk (discPerm B) (discStep_involutive B) (discStep_ne B)

/-- Untwisted bands reverse corner side; twisted bands preserve it. Both flip the endpoint. -/
def bandStep (B : SignedBands d b) (c : Corners b) : Corners b :=
  ((c.1.1, !c.1.2), if B.twisted c.1.1 then c.2 else !c.2)

theorem bandStep_involutive (B : SignedBands d b) : Function.Involutive (bandStep B) := by
  rintro ⟨⟨e, t⟩, s⟩
  cases h : B.twisted e <;> simp [bandStep, h]

theorem bandStep_ne (B : SignedBands d b) (c : Corners b) : bandStep B c ≠ c := by
  rcases c with ⟨⟨e, t⟩, s⟩
  cases t <;> simp [bandStep]

def bandPerm (B : SignedBands d b) : Perm (Corners b) where
  toFun := bandStep B
  invFun := bandStep B
  left_inv := bandStep_involutive B
  right_inv := bandStep_involutive B

def bandMatching (B : SignedBands d b) : PerfectMatching (Corners b) :=
  PerfectMatching.mk (bandPerm B) (bandStep_involutive B) (bandStep_ne B)

def boundaryPerm (B : SignedBands d b) : Perm (Corners b) :=
  (bandMatching B).val * (discMatching B).val

theorem boundaryPerm_even (B : SignedBands d b) : Even (orbitCount (boundaryPerm B)) :=
  (bandMatching B).prop.even_orbitCount_mul (discMatching B).prop

/-- Generic native matching-join bridge, shared with the PD state-circle interface. -/
theorem matching_join_card {α : Type*} [Finite α] (M D : PerfectMatching α) :
    Nat.card (Quotient (Perm.SameCycle.setoid M.val ⊔ Perm.SameCycle.setoid D.val)) =
      orbitCount (M.val * D.val) / 2 := by sorry

abbrev Boundary (B : SignedBands d b) :=
  Quotient (Perm.SameCycle.setoid (bandMatching B).val ⊔
    Perm.SameCycle.setoid (discMatching B).val) ⊕ IsolatedDiscs B

def boundaryCount (B : SignedBands d b) : ℕ :=
  orbitCount (boundaryPerm B) / 2 + Nat.card (IsolatedDiscs B)

theorem boundary_card (B : SignedBands d b) : Nat.card (Boundary B) = boundaryCount B := by sorry

def eulerCharacteristic (_B : SignedBands d b) : ℤ := (d : ℤ) - b

def CoherentOrientation (B : SignedBands d b) (o : Fin d → ZMod 2) : Prop :=
  ∀ e, (if B.twisted e then 1 else 0 : ZMod 2) =
    o (B.discOf (e, false)) + o (B.discOf (e, true))

def IsOrientable (B : SignedBands d b) : Prop := ∃ o, CoherentOrientation B o

/-- Native equivalence closure of this graph's incidence, not a replacement graph theory. -/
def incidenceSetoid (B : SignedBands d b) : Setoid (Fin d) :=
  Relation.EqvGen.setoid (fun v w ↦ ∃ e, (incidenceGraph B).IsLink e v w)

theorem orientable_euler (B : SignedBands d b) (hd : 0 < d)
    (hconn : ∀ v w, incidenceSetoid B v w) (ho : IsOrientable B) :
    ∃ g : ℕ, 2 * g + d + boundaryCount B = b + 2 := by sorry

theorem nonorientable_euler (B : SignedBands d b) (hd : 0 < d)
    (hconn : ∀ v w, incidenceSetoid B v w) (ho : ¬ IsOrientable B) :
    ∃ k : ℕ, 0 < k ∧ k + d + boundaryCount B = b + 2 := by sorry

theorem one_disc_band_count (B : SignedBands d b) (hd : 0 < d)
    (hconn : ∀ v w, incidenceSetoid B v w) :
    ∃ b' : ℕ, b' + d = b + 1 := by sorry

/-- One disc and one loop band; false is the annulus and true the Möbius band. -/
def oneBand (twist : Bool) : SignedBands 1 1 where
  discOf := fun _ ↦ 0
  rotation := Equiv.prodCongr (Equiv.refl _) (Equiv.swap false true)
  rotation_fibers := by decide +kernel
  twisted := fun _ ↦ twist

theorem oneBand_counts : boundaryCount (oneBand false) = 2 ∧ boundaryCount (oneBand true) = 1 := by
  have hann : boundaryPerm (oneBand false) = 1 := by decide +kernel
  have hmob : IsPerfectMatching (boundaryPerm (oneBand true)) := by decide +kernel
  have hc := hmob.two_mul_orbitCount
  have hfour : Nat.card (Corners 1) = 4 := by simp [Corners, Ports]
  rw [hfour] at hc
  have htwo : orbitCount (boundaryPerm (oneBand true)) = 2 := by omega
  have hiso (t : Bool) : IsEmpty (IsolatedDiscs (oneBand t)) := by
    constructor
    rintro ⟨v, h⟩
    have hv := h (0, false)
    fin_cases v
    simpa [oneBand] using hv
  letI := hiso false
  letI := hiso true
  simp [boundaryCount, hann, htwo, orbitCount_one, Corners, Ports]

theorem oneBand_orientability : IsOrientable (oneBand false) ∧ ¬ IsOrientable (oneBand true) := by
  unfold IsOrientable CoherentOrientation
  decide +kernel

end BandSurfaceTargets
