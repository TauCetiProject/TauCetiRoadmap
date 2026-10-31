import Mathlib

/-!
# Positive algebraic tangles: suggested finite interfaces

This file is not the roadmap and is not exhaustive; the README is definitive.
The actual tangle code, embedding and crossing-word comparison are future
geometric targets. Port/phase certificates alone do not prove those comparisons.
-/
namespace AlgebraicTangleTargets
open Equiv

abbrev Port := Fin 4

/-- Cyclic order NW,NE,SE,SW. True means first encounter is over. -/
def boundaryPhase : Port → Bool := ![true,false,true,false]

/-- Planar principal-diagonal reflection fixes NW/SE and exchanges NE/SW. -/
def reciprocalPort : Perm Port := swap 1 3

def east : Fin 2 → Port := ![1,2]
def west : Fin 2 → Port := ![0,3]
def numerator : Fin 2 → Port × Port := ![(0,1),(3,2)]
def denominator : Fin 2 → Port × Port := ![(0,3),(1,2)]
def mirrorPhase (p : Port) : Bool := !(boundaryPhase p)

inductive PositiveExpr where
  | one
  | add (A B : PositiveExpr)
  | recip (A : PositiveExpr)
  deriving DecidableEq

def crossings : PositiveExpr → ℕ
  | .one => 1
  | .add A B => crossings A + crossings B
  | .recip A => crossings A

/-- The grammar product is this parenthesized operation, without associativity assumptions. -/
def product (A B : PositiveExpr) : PositiveExpr := .add (.recip A) B

/-- Input n denotes the positive integer n+1, so the grammar has no zero leaf. -/
def positiveInteger : ℕ → PositiveExpr
  | 0 => .one
  | n+1 => .add (positiveInteger n) .one

theorem crossings_pos (A : PositiveExpr) : 0 < crossings A := by
  induction A with
  | one => decide
  | add A B hA hB => simp only [crossings]; omega
  | recip A hA => exact hA

theorem positiveInteger_crossings (n : ℕ) : crossings (positiveInteger n) = n+1 := by
  induction n with
  | zero => rfl
  | succ n ih => simp [positiveInteger, crossings, ih]

theorem port_phase_packet :
    (∀ p, reciprocalPort (reciprocalPort p) = p) ∧
    (∀ p, boundaryPhase (reciprocalPort p) = boundaryPhase p) ∧
    (∀ i, boundaryPhase (east i) ≠ boundaryPhase (west i)) ∧
    (∀ i, boundaryPhase (numerator i).1 ≠ boundaryPhase (numerator i).2) ∧
    (∀ i, boundaryPhase (denominator i).1 ≠ boundaryPhase (denominator i).2) := by
  decide +kernel

theorem mirror_phase_packet :
    (∀ p, mirrorPhase p ≠ boundaryPhase p) ∧
    (∀ p, mirrorPhase (reciprocalPort p) = mirrorPhase p) ∧
    (∀ i, mirrorPhase (east i) ≠ mirrorPhase (west i)) ∧
    (∀ i, mirrorPhase (numerator i).1 ≠ mirrorPhase (numerator i).2) ∧
    (∀ i, mirrorPhase (denominator i).1 ≠ mirrorPhase (denominator i).2) := by
  decide +kernel

theorem alternating_glue (u v : List Bool)
    (hu : u.IsChain (· ≠ ·)) (hv : v.IsChain (· ≠ ·))
    (hseam : ∀ a ∈ u.getLast?, ∀ b ∈ v.head?, a ≠ b) :
    (u ++ v).IsChain (· ≠ ·) := hu.append hv hseam

theorem reverse_mirror_alternation (u : List Bool) (hu : u.IsChain (· ≠ ·)) :
    u.reverse.IsChain (· ≠ ·) ∧ (u.map Bool.not).IsChain (· ≠ ·) := by
  constructor
  · exact List.isChain_reverse.mpr (hu.imp (fun _ _ h ↦ h.symm))
  · apply List.isChain_map_of_isChain Bool.not _ hu
    intro a b h
    cases a <;> cases b <;> simp_all

/-- Cut-independent cyclic alternation, including the empty word of a crossing-free circle. -/
theorem cyclic_alternation (u : List Bool) (hu : u.IsChain (· ≠ ·))
    (hclose : ∀ a ∈ u.getLast?, ∀ b ∈ u.head?, a ≠ b) (n : ℕ) :
    (u.rotate n).IsChain (· ≠ ·) ∧
    (∀ a ∈ (u.rotate n).getLast?, ∀ b ∈ (u.rotate n).head?, a ≠ b) ∧
    Even u.length := by
  sorry

end AlgebraicTangleTargets
