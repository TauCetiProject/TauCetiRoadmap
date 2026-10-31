import Mathlib

/-!
# Matrix-label profiles: suggested targets

This file is not the roadmap and is not exhaustive; the README is definitive.
The native finite matrix group is used directly. Its class and inversion targets
support finite-label profiles; they do not certify any geometric knot-table row.
-/

namespace MatrixLabelProfileTargets

abbrev G := Matrix.GeneralLinearGroup (Fin 3) (ZMod 2)

/-- The companion matrix of X³+X+1, with its explicit inverse. -/
def seven : G where
  val := !![0,0,1; 1,0,1; 0,1,0]
  inv := !![1,1,0; 0,0,1; 1,0,0]
  val_inv := by decide +kernel
  inv_val := by decide +kernel

theorem seven_pow : seven ^ 7 = 1 := by decide +kernel

theorem trace_seven : Matrix.trace (seven : Matrix (Fin 3) (Fin 3) (ZMod 2)) = 0 := by
  decide +kernel

theorem trace_seven_inverse :
    Matrix.trace ((seven⁻¹ : G) : Matrix (Fin 3) (Fin 3) (ZMod 2)) = 1 := by
  decide +kernel

/-- Element counts and the number of conjugacy classes of the actual group. -/
theorem class_distribution :
    Nat.card G = 168 ∧ Nat.card (ConjClasses G) = 6 ∧
    Nat.card {g : G // orderOf g = 1} = 1 ∧
    Nat.card {g : G // orderOf g = 2} = 21 ∧
    Nat.card {g : G // orderOf g = 3} = 56 ∧
    Nat.card {g : G // orderOf g = 4} = 42 ∧
    Nat.card {g : G // orderOf g = 7} = 48 := by
  sorry

/-- Inversion exchanges the two order-seven classes, and fixes all others. -/
theorem inversion_classes :
    orderOf seven = 7 ∧ ¬IsConj seven seven⁻¹ ∧
    Nat.card (ConjClasses.mk seven).carrier = 24 ∧
    Nat.card (ConjClasses.mk seven⁻¹).carrier = 24 ∧
    (∀ g : G, orderOf g = 7 → IsConj g seven ∨ IsConj g seven⁻¹) ∧
    (∀ g : G, orderOf g ≠ 7 → IsConj g g⁻¹) := by
  sorry

end MatrixLabelProfileTargets
