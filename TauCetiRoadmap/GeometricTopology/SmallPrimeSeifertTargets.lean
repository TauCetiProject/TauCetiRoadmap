import TauCeti.KnotTheory.PDCode.Kauffman
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
These fourteen native oriented PD inputs use the literal standard Atlas diagrams,
not their minimum braid representatives. Native smoothing-circle computations do
not substitute for the embedded surface, basis and genus-minimality comparisons.
-/
namespace TauCetiRoadmap.GeometricTopology.SmallSeifert
open TauCeti
set_option maxRecDepth 20000
set_option maxHeartbeats 1600000

inductive Row where
  | k31 | k41 | k51 | k52 | k61 | k62 | k63 | k71 | k72 | k73 | k74 | k75 | k76 | k77
  deriving DecidableEq

@[reducible] def crossings : Row → ℕ
  | .k31 => 3
  | .k41 => 4
  | .k51 => 5
  | .k52 => 5
  | .k61 => 6
  | .k62 => 6
  | .k63 => 6
  | .k71 => 7
  | .k72 => 7
  | .k73 => 7
  | .k74 => 7
  | .k75 => 7
  | .k76 => 7
  | .k77 => 7

def circleCount : Row → ℕ
  | .k31 => 2
  | .k41 => 3
  | .k51 => 2
  | .k52 => 4
  | .k61 => 5
  | .k62 => 3
  | .k63 => 3
  | .k71 => 2
  | .k72 => 6
  | .k73 => 4
  | .k74 => 6
  | .k75 => 4
  | .k76 => 4
  | .k77 => 4

def expectedGenus : Row → ℕ
  | .k31 => 1
  | .k41 => 1
  | .k51 => 2
  | .k52 => 1
  | .k61 => 1
  | .k62 => 2
  | .k63 => 2
  | .k71 => 3
  | .k72 => 1
  | .k73 => 2
  | .k74 => 1
  | .k75 => 2
  | .k76 => 2
  | .k77 => 2

def arcPair : (r : Row) → Equiv.Perm (Fin (4 * crossings r))
  | .k31 =>
    { toFun := ![7,6,9,8,11,10,1,0,3,2,5,4]
      invFun := ![7,6,9,8,11,10,1,0,3,2,5,4]
      left_inv := by decide
      right_inv := by decide }
  | .k41 =>
    { toFun := ![11,12,7,6,15,8,3,2,5,14,13,0,1,10,9,4]
      invFun := ![11,12,7,6,15,8,3,2,5,14,13,0,1,10,9,4]
      left_inv := by decide
      right_inv := by decide }
  | .k51 =>
    { toFun := ![11,10,13,12,15,14,17,16,19,18,1,0,3,2,5,4,7,6,9,8]
      invFun := ![11,10,13,12,15,14,17,16,19,18,1,0,3,2,5,4,7,6,9,8]
      left_inv := by decide
      right_inv := by decide }
  | .k52 =>
    { toFun := ![11,6,17,8,19,18,1,12,3,14,13,0,7,10,9,16,15,2,5,4]
      invFun := ![11,6,17,8,19,18,1,12,3,14,13,0,7,10,9,16,15,2,5,4]
      left_inv := by decide
      right_inv := by decide }
  | .k61 =>
    { toFun := ![19,10,15,16,23,14,11,20,13,12,1,6,9,8,5,2,3,22,21,0,7,18,17,4]
      invFun := ![19,10,15,16,23,14,11,20,13,12,1,6,9,8,5,2,3,22,21,0,7,18,17,4]
      left_inv := by decide
      right_inv := by decide }
  | .k62 =>
    { toFun := ![19,10,15,4,3,14,21,20,13,12,1,18,9,8,5,2,23,22,11,0,7,6,17,16]
      invFun := ![19,10,15,4,3,14,21,20,13,12,1,18,9,8,5,2,23,22,11,0,7,6,17,16]
      left_inv := by decide
      right_inv := by decide }
  | .k63 =>
    { toFun := ![5,20,13,10,21,0,9,22,19,6,3,12,11,2,17,16,15,14,23,8,1,4,7,18]
      invFun := ![5,20,13,10,21,0,9,22,19,6,3,12,11,2,17,16,15,14,23,8,1,4,7,18]
      left_inv := by decide
      right_inv := by decide }
  | .k71 =>
    { toFun := ![15,14,17,16,19,18,21,20,23,22,25,24,27,26,1,0,3,2,5,4,7,6,9,8,11,10,13,12]
      invFun := ![15,14,17,16,19,18,21,20,23,22,25,24,27,26,1,0,3,2,5,4,7,6,9,8,11,10,13,12]
      left_inv := by decide
      right_inv := by decide }
  | .k72 =>
    { toFun := ![11,6,25,8,27,26,1,16,3,22,21,0,23,18,17,20,7,14,13,24,15,10,9,12,19,2,5,4]
      invFun := ![11,6,25,8,27,26,1,16,3,22,21,0,23,18,17,20,7,14,13,24,15,10,9,12,19,2,5,4]
      left_inv := by decide
      right_inv := by decide }
  | .k73 =>
    { toFun := ![17,20,11,10,21,24,27,22,13,12,3,2,9,8,23,18,25,0,15,26,1,4,7,14,5,16,19,6]
      invFun := ![17,20,11,10,21,24,27,22,13,12,3,2,9,8,23,18,25,0,15,26,1,4,7,14,5,16,19,6]
      left_inv := by decide
      right_inv := by decide }
  | .k74 =>
    { toFun := ![5,16,11,10,17,0,15,26,13,12,3,2,9,8,27,6,1,4,23,22,25,24,19,18,21,20,7,14]
      invFun := ![5,16,11,10,17,0,15,26,13,12,3,2,9,8,27,6,1,4,23,22,25,24,19,18,21,20,7,14]
      left_inv := by decide
      right_inv := by decide }
  | .k75 =>
    { toFun := ![15,6,25,8,27,26,1,20,3,22,17,16,19,18,21,0,11,10,13,12,7,14,9,24,23,2,5,4]
      invFun := ![15,6,25,8,27,26,1,20,3,22,17,16,19,18,21,0,11,10,13,12,7,14,9,24,23,2,5,4]
      left_inv := by decide
      right_inv := by decide }
  | .k76 =>
    { toFun := ![13,6,25,8,27,26,1,12,3,22,21,16,7,0,19,18,11,20,15,14,17,10,9,24,23,2,5,4]
      invFun := ![13,6,25,8,27,26,1,12,3,22,21,16,7,0,19,18,11,20,15,14,17,10,9,24,23,2,5,4]
      left_inv := by decide
      right_inv := by decide }
  | .k77 =>
    { toFun := ![19,10,15,4,3,14,27,16,13,12,1,22,9,8,5,2,7,26,23,0,25,24,11,18,21,20,17,6]
      invFun := ![19,10,15,4,3,14,27,16,13,12,1,22,9,8,5,2,7,26,23,0,25,24,11,18,21,20,17,6]
      left_inv := by decide
      right_inv := by decide }

theorem arcPair_perfect (r : Row) : IsPerfectMatching (arcPair r) := by
  cases r <;> decide

def diagram (r : Row) : PDCode (crossings r) :=
  ⟨Equiv.refl _, ⟨arcPair r, arcPair_perfect r⟩, 0, fun _ => true⟩

def direction : (r : Row) → Fin (4 * crossings r) → Bool
  | .k31 => ![false,false,true,true,false,false,true,true,false,false,true,true]
  | .k41 => ![false,true,true,false,false,true,true,false,false,false,true,true,false,false,true,true]
  | .k51 => ![false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true]
  | .k52 => ![false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true]
  | .k61 => ![false,false,true,true,false,false,true,true,false,true,true,false,false,true,true,false,false,false,true,true,false,false,true,true]
  | .k62 => ![false,false,true,true,false,false,true,true,false,true,true,false,false,true,true,false,false,false,true,true,false,false,true,true]
  | .k63 => ![false,true,true,false,false,true,true,false,false,false,true,true,false,false,true,true,false,false,true,true,false,true,true,false]
  | .k71 => ![false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true]
  | .k72 => ![false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true]
  | .k73 => ![false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false]
  | .k74 => ![false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false]
  | .k75 => ![false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true]
  | .k76 => ![false,false,true,true,false,false,true,true,false,false,true,true,false,true,true,false,false,true,true,false,false,false,true,true,false,false,true,true]
  | .k77 => ![false,false,true,true,false,false,true,true,false,true,true,false,false,true,true,false,false,false,true,true,false,true,true,false,false,true,true,false]

def oriented (r : Row) : OrientedPDCode (crossings r) :=
  OrientedPDCode.mk (diagram r) (direction r)
    (by cases r <;> decide)
    (by cases r <;> decide)
    ∅ (by rfl)

/-- The unique local smoothing compatible with the transported strand directions. -/
def seifertState (r : Row) (i : Fin (crossings r)) : Bool :=
  Bool.xor ((oriented r).orientation ((diagram r).crossing i 0))
    ((oriented r).orientation ((diagram r).crossing i 1))

/-- Native orbit counts retain every circle, rather than counting only smoothing sites. -/
theorem circles (r : Row) : (diagram r).stateLoopCount (seifertState r) = circleCount r := by
  rw [PDCode.stateLoopCount_def,Equiv.Perm.orbitCount_eq_card_parts_partition]
  cases r <;> decide

theorem one_component (r : Row) : (diagram r).crossingComponentCount = 1 := by
  rw [PDCode.crossingComponentCount_def,Equiv.Perm.orbitCount_eq_card_parts_partition]
  cases r <;> decide

/-- Euler arithmetic is separate from the geometric genus theorem. -/
theorem euler_arithmetic (r : Row) :
    2 * expectedGenus r + circleCount r = crossings r + 1 := by
  cases r <;> decide

end TauCetiRoadmap.GeometricTopology.SmallSeifert
